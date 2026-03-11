Return-Path: <linux-arm-msm+bounces-96999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLFOG4xwsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:39:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 89486264B24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDA03306BB56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A20324716;
	Wed, 11 Mar 2026 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKnOlE8x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPuQjoG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFDA31E84A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235970; cv=none; b=GxwWRQEX7TwJORqLnWRrW3051B86vHRgvuKQ+jg3jdSvbOMNU6e+DUWXb4z3ieCjoqUY1MWTeJf87TbZRxO+jTzqImqljOy3ke2/scSxR4E2BGiN47YBdGV4AEcpVLdEKhnzhdLC+F9T1Iom64MNnwcQ3E8ZVIfond99FNIvi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235970; c=relaxed/simple;
	bh=06BVbhAZRGBJpMxcbTYX2ksNO6v5Cg5XShoIx0wb6bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mq6fPBzW1f75MI8uo/oHev7hIdnIcRzsppZKboZYoe8WI4ajrRVKcRuR/W/LLKwwR31B96eNUG4hkclMKUhHWgdQsiPmj2Z6i+sH258TBm5/ZklpzGm8CwXFYiIxD7r1aWTmt/2ObAYdM3TLw8EVUajTDpeZ41WGhyjLPtlWWzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKnOlE8x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPuQjoG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B883UN509379
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Ho1qFksr3mY0U8ar48qPzfMR5m6oW20Himw8+37HaQ=; b=kKnOlE8xPGQRN1kw
	Ko3INIQwX9M6Fmrb4rkly4UKEL0yGdiPSfUaisYvs1+igol1EqYKqpI3PVogLiyc
	WMaNNKhhftFN5Y2WzVODihSXw/iIL3ML8nGe66Ra/ZwxEOmWYkl2jT2gKNJgV7Js
	nHECuxP3dF00MCTU6eM7GI0V080KwDXuFz2RyVadtAuYU9d6AnQ1RmI0OvdR0NbJ
	syOIF1kSMRpdaUtvljSYYsLJnMXCGosGjSE4IOlh7OHabayf4eeVumgQEldMfLdv
	wc9v6/Lw0buH6XqfOGb6sUQhGW2i8Ysv5LlRFcy2Nk4yTLSJ/iKkma5y+FtrT2Ws
	Pl6Q6Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppam1ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:32:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so1761528137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773235965; x=1773840765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Ho1qFksr3mY0U8ar48qPzfMR5m6oW20Himw8+37HaQ=;
        b=NPuQjoG3L1prssUoAtCocoSc3C2Ei8ibFZ3zK/WwkN0qpzH1L/iuESrgiQFTbHUGDK
         3ovLpbc1wRec3ZtoWBjB9hPXJuDMptwFRSXU0wFcmnfJGQAaNvQvCdxxyVdH9FSDWHO0
         bEIgn30lFyH31KIqH7SQ+9MSK7wQ0wMInZKD2+21eGCLiEcVJCK6uB1rI080nENlaOlP
         WNnBZ4H/sHqxdrXjqGQXv6oyprVWNoxf4P7s9Zxl2JO3cGa1rzoT0hfbY4u8kSR8fZym
         r+WLxi3GS4qt+jdEyyom6otSlF4Y+QLLvQBA44ZYF/bRiRdC3jxqoFp1jkZH7hleEpJZ
         1+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235965; x=1773840765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ho1qFksr3mY0U8ar48qPzfMR5m6oW20Himw8+37HaQ=;
        b=X844SczDckzvh7RpOtfiF9wvRkupXEMdAOUcoh0gqFrvXlVm91EeWatnAb1pu8Gu/p
         erhy52gYN9zzBp1lz6pbDFdH73mmilGiMXq1qzTzke5aV2SAFMcMLJXZxuv3001CBENZ
         O0iyNs9k0fJrLYyob3f4c05556TXaVpXGTf8cHE+l+PgmsljakqqfhkImbaW8EcKd/xo
         YflbVIl3muTf0AKfE6p0k3hzt7l2QcFnG33RucHeceZrRVq84ajeH22oOQ4UZFEFu2CN
         31tP/suHFlVzvykXdin88tDRxV2SHA2I5DFTXNlmfv7LANiB+mTfFVkt5ukjg/StNO6v
         FOUw==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZA7R9Ujk3FEA48+XuoRU2gDIVznewmMe3fg5yj6HhU2X1RJAEvGTXSQQRK1PFVLFgvtuBXxH6qYbnexR@vger.kernel.org
X-Gm-Message-State: AOJu0YzekTrge31DCyZ/2+IAmhVDwHmgi+dhLmulxVSDSeCzOgo6JWmv
	GyUFcazihTSSbk6XX8Spv2k8JZLmbJZnNI3x3nTVBsIbRb09vf3AwUzDt8mAU7RNEUjUyU+KSE0
	lLBNEDnbub0GyicQWoNfVMOPXYaFy4HG3gYlXdQuMS6ufw5NfoKyO54iGqWCgtXmvw20H
X-Gm-Gg: ATEYQzyC08jz4+je3X1on/3A3DG3SSsZFT+5jaeiZ72e9I5KTUQpaLW/QJIRUHokcB5
	yKNAb1FcCSEunabm3BgpNSCQOAYFK3FFBKWznsljWwINj/CEQEubQ79ic3capZFCOFNPPOK/2dK
	9h9sGcSgkf+WU6eSR8PdDUtNKawv/rp3XAJle8ORxa5XWej3JZJIeTkN3Ux5UDkM3dydIA7oRLA
	IQtDkAKoNBoAsOheZjqC/CIhts8HbYzyGOuAY5z/aPFIKMGdcKbcdwdJDSMqqECbcOTbQOLqHCm
	KQI2CPnpiM659zSRyqLEDB+bczoxM0humOOlzwwdEMmPjqp/6/kCcbIGOaaq4vnObvggqXQ6uEj
	/rlF3IS91r1GeqhMJ/OnKOzZeo7AvKKYSIUcKLhGAdWvQj5oZGGgs7q8VZ87/FQvwde9mbCzXlO
	zhp4w=
X-Received: by 2002:a05:6102:440a:b0:5f5:4188:eda8 with SMTP id ada2fe7eead31-601defefe49mr360629137.8.1773235965417;
        Wed, 11 Mar 2026 06:32:45 -0700 (PDT)
X-Received: by 2002:a05:6102:440a:b0:5f5:4188:eda8 with SMTP id ada2fe7eead31-601defefe49mr360625137.8.1773235964982;
        Wed, 11 Mar 2026 06:32:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de4847asm53985566b.21.2026.03.11.06.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:32:44 -0700 (PDT)
Message-ID: <d2e30b43-75d3-4c53-af26-4761cc093a56@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:32:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at
 registration time
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303150152.90685-1-mitltlatltl@gmail.com>
 <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
 <CAH2e8h77bpWvSdYu2guC1muz2A99+cPtWZyUGNKVOeh3J+eygQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h77bpWvSdYu2guC1muz2A99+cPtWZyUGNKVOeh3J+eygQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SDpaMnb9wywrp8h7B2Qu0X2Q-Wf0lUxp
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b16eff cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pPfQ2pD1zekkjLI5SAYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfX+zhVR7zvlQan
 OsGmbJjjfxCb69pPHO7Ze7SvjSfvsH0MPBaytHrfA47C8YJKxYyNHqr2Bti41pQ+GVzc+ygkagn
 Ixi+gbKWWDDf4IhMUGC8Ua+W59vVlL2lVmTiu2D3d5tHsR+36aA1EBo9mIh92fC/xxJJ4apjUl5
 MJYgFTtPTmGkimnrVyjb+gE46xBByx9zcsY4LY6M8c1B5lRkzeA8RiFwZ3yZeIEPjbd214xkbpc
 pl7okQ1THgDVOz3oEa3EjfG5If6O0EHRV4dOhN8btfimvZ0netS9rsw2fEpdlVwXaxPTVwElomT
 stDY7lyA24s6oJD7NBf8ZnAkJKOwY/VWoAUtLsU49r/4X5/ODiKEqx7irhoGLbqJu/0IOrtWiMY
 ddekeHM5oP4GM/rrW7sVC/Aj0ocmpGPrD5nxDrGs4CvhPYKpx0YqzDFPIZ5DebHgPs0JVVgO3Qw
 ZZxe0zZCObQFSeMh+AA==
X-Proofpoint-ORIG-GUID: SDpaMnb9wywrp8h7B2Qu0X2Q-Wf0lUxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110114
X-Rspamd-Queue-Id: 89486264B24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96999-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 12:54 PM, Pengyu Luo wrote:
> On Wed, Mar 4, 2026 at 7:20 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/3/26 4:01 PM, Pengyu Luo wrote:
>>> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
>>> Gaokun3, the image will stuck at grey for seconds until msm takes
>>> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
>>
>> Do you have clk_ignore_unused/pd_ignore_unused in your cmdline?
>>
> 
> Yes, always.
> 
>> The sc8280xp-huawei-gaokun3.dts references no clocks in the simplefb
>> node, so if you're unlucky with timing, this is ""expected behavior""
>>
> 
> On gaokun, if simplefb holds the mdp clk, there will not be the early
> framebuffer, I can't see it. After seconds, msm initialized, the
> display would show logs.

I'm going to assume you don't have efifb.

Is there a chance it's because simplefb is waiting for dispcc to probe,
and by the time that happens, msm probes right away?

i.e. it seems like something like

https://lore.kernel.org/lkml/20220806163255.10404-1-markuss.broks@gmail.com/

would be better suited if you want to get logs early *and* you have a
panel driver that works anyway

> 
> Once I owned another sc8280xp device(Ntmer TW220 aka robo & kala), dsi
> didn't work at that time, to bring up the simplefb, the clk must be
> held and no parking. gaokun3 always requires no parking only.
> 
> BTW, I can see this grey flash without simplefb too. On x13s, if
> building msm as a module and not putting the module into the initial
> ramdisk, what happens?

Do you mean that in conjunction with dispcc-sc8280xp present in
initramfs?

Konrad

