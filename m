Return-Path: <linux-arm-msm+bounces-99820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KSVIJuyw2kktgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:02:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFDB322962
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79C3E301CC66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A653939D6D2;
	Wed, 25 Mar 2026 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTz5gDCt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POPfHCcK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458C383C64
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432859; cv=none; b=bnguJcornU5x6tunKrLGiMOej+afzV5WJWHZwRIDI+VcF/500Tp2AOcAB3F5V/E/J15CyCdyxEweyoNvJWTY22RzysVKVmgWZJ80moG4tstFlmUFH2iAVJhK+6kUAlkS+b3EHJdbmuqNCMyC/13kygxT7XQyc34wa1sLwkBuBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432859; c=relaxed/simple;
	bh=oDl7hVNCNw1wViKVC93Xs6nypWvwx2yPpYHa0agOIKw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JEdAgTwcnrQ5B2AOtlHWZ1NegP4HgxZDy5iBvtKD3R+4JreUVnuoiJIbG7KRNzPKEudUEuEM0Eu9uSopG6sUfd8RwGykz7d8PF8nz/mgNCo+mpuLnlwdpGbIk+vrd/Qlb57SgUcsdjIS6Nisdjn7ucmjoDNoxsjoTjTGstXuCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTz5gDCt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POPfHCcK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3o2YW1208640
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUAfXeafFBwWr30Ieze/5KFQiGM9ADTdz912cIXW+7w=; b=iTz5gDCtgzwvyrhO
	fCItJzkDkhdWjdZ5FcpNCD5mQoQQHMFKnmoiQNLH4XnsJL40miAZWKm/iP+cxORl
	HQj7eajfp2+6jAQ77jFPSJyf8UfEFPWjU1GwZBw/tVtveKAot0d93vz95RL09LjJ
	G0XbiCN2MeQkbfq4fB/L+xuuqTUrtwRfU+LoNk5HCw5J3BfXqG1lw76Xoxmlj/wD
	ct9CQUZK0jghoBbVmONSUQr9jelCErkLW4tpiTLhKOYC0OyFh4O7NjfF1+mIwA9/
	ruCmG0zBpBiNTnXTjkoRX+bpsai6D0C8N37sD9vbXh6Nxbtb7WXp3R3RdBAUZ4Ti
	YaT6+g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4859983s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:00:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6000a7ab3e5so337868137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774432854; x=1775037654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wUAfXeafFBwWr30Ieze/5KFQiGM9ADTdz912cIXW+7w=;
        b=POPfHCcK4D9BqkBc9wmq3YevoX5QMsXeCeTbAlGASS/xzH1KG2stbtztvs3Cl8Mf+C
         jwYHAEsuv1p+0o0+H+KlgVpS4YLBvmD+F9Jf86ME4WLrT3hFpNoM1H9UTCdlPxp25kfE
         4Y6BjDGdGwENlvORnl20IN9bwgkbbe5g5A8ZsE+53Ui7d3M4UTCUkXxg2QXO1oCSKG7N
         SeCAlL0BZOVSQzycM+lcTbsR4bq/A99VQOkuar87GJS/XdGCY1vOl9poSlITXxVEQtFs
         KEFDSI6QePw7K/l3/uUzGm5o90l3lxJ9V8sa3jJ7TR0bf9CY+wa79ZGf/EWRAlBZOXCk
         A2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432854; x=1775037654;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUAfXeafFBwWr30Ieze/5KFQiGM9ADTdz912cIXW+7w=;
        b=QGy3+0pe1i8/zNxpT2Pw4bxBLPaUjdoDROjIVDpchxm0a1YZT7Sg6udHWMqHG8HYi4
         JObB42ooaSwwv+d8jlFgHogNR8qYFmdzko3Z0+fB6oUN3sMuD6YJ/JftSI3IJaR6MGRI
         DKsMjv5rEU3LokfYy3vki/RMVfAbkyL6MhP7NOv2gfbZVGHedlDe1EbmcRpAL1/hEv+S
         yPgtdRMr5J/3poHF0rTOVvmjBo/l5nu8k5M5RCty1rkWJOHMwOseP8N3UcFjIOg7Atc5
         Kdleu8k4c9P5gjXoq7SaYojpD1Gcy/UYWKjNTaxRtTXw27OnVL8nj3TkNueWTKeVX/jI
         ZPag==
X-Gm-Message-State: AOJu0YyR7VKDmtI8J1o0lJWHVLUIf57uJnvzjlMC3s7oRtsYzT4o35mF
	HHXlnTYpoaQycmZ2xM6n2kEqfgH8lczMfIfNiVyzsOIcw9UqJUQCkV2PmYgCB1CPo4ZTkxRt+KQ
	VMZR7G8+T3f+7XGQqHfY80m4PVG5sTm9ykMH9iuLum/y5eHT6O8M4Wvu1nVBEDCVEUPTt
X-Gm-Gg: ATEYQzz0YW2W1hwd0drihuVvsxQkVfUpt/EB6bpX3vtQAAqFQDrGi18kCxPtuhXBE25
	fF8JpAbQVGf0nXsXpHFiX3NlRvAG7TqgVNzaFyw82G4+nlI1+XXH6WO1G86YVHhSoHpI0AZSWbF
	JyJg3WKTGiWyDsp8cYrDbGcdAzOrHqwTGGN/GOkM2Ck2w5H155AMg957DeNnixx1QzhWu0T4EPu
	0DETq/DBZBxGxjIdY+LN29oZ1GHFpC5m6oBO2J6NSyKD9CZ8h9A/dk1ogxWb/z7x+gP1H4dKUO5
	fgSX+04XU9UvNgtJOXwOW8yXm6mTCG2RRGdJATbp7/xJcY0AyEyiFh5UI/xfEAD8UUmEVQ7uiZ5
	1+CwRH0t7/IgGHRI9FKoBvkMVeGdiVuVpVsrYH//Fsr4HGw5negvZn/UWbCat52lVPXgmXFNG42
	55NtU=
X-Received: by 2002:a67:e885:0:b0:602:8a0e:f872 with SMTP id ada2fe7eead31-6038732bfc7mr487711137.8.1774432854112;
        Wed, 25 Mar 2026 03:00:54 -0700 (PDT)
X-Received: by 2002:a67:e885:0:b0:602:8a0e:f872 with SMTP id ada2fe7eead31-6038732bfc7mr487685137.8.1774432853359;
        Wed, 25 Mar 2026 03:00:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de1e3sm772362166b.39.2026.03.25.03.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:00:51 -0700 (PDT)
Message-ID: <101aae08-efde-4d9d-8af2-613d4cc9698a@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:00:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct DP MST interface configuration
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
References: <20260325-fix-dp-mst-interfaces-v1-1-186d1de3fa1b@oss.qualcomm.com>
 <3f33e61e-d244-4600-9ffe-218371c04541@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3f33e61e-d244-4600-9ffe-218371c04541@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MSBTYWx0ZWRfX/E31B2W+JnXU
 Iy5LNnfSPgtlodOZratzsXGi0CVbUc4nw5fIZdsItQ5/1BuERtgqYQBrqR6mg7LXQnW+HPVuXvz
 lRvKlT1Ys3sV11clXlVvtfGr94gMNpaD35tinPzphrg4FDBk/34C9ub1gbN1fg+jtp+fEM/poc/
 kLXTnXTkNGjj9fn3/TZ9EYzOl7AbFx1JfprPq6vEjBw+HuyXubZgvqSxMemCyylpHQsEfxKzWxv
 PVIdTGKNq9zr9BC+rI22kYQrjsvGAhl3lf9wlSaqK48xzpew6EnbcCUqESwffo6zBwhdYtOcBfZ
 UUXpRlPqlbVLJZe0cUXSTZTmh1V3Xsy3JoUu40O1Xh1OboqzlbWfW+q4eBglFnqXT83Ct4daKAq
 jwP6PzF3kqIAfPJgFJjNNSN9NALJhuXRasnZIHjYoY4tKciFIjeQyuU+qasRgjySJrGCZl2Y7yH
 EJrowRpkhMELwo1uQgw==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3b256 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gZczchgc3zH-k75L218A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MqeGbXMYFKj4PKd4u8h6MnFONlWnte4k
X-Proofpoint-ORIG-GUID: MqeGbXMYFKj4PKd4u8h6MnFONlWnte4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[quicinc.com:server fail,qualcomm.com:server fail,sin.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-99820-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,fairphone.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AFDB322962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 10:57 AM, Konrad Dybcio wrote:
> On 3/25/26 6:32 AM, Dmitry Baryshkov wrote:
>> Due to historical reasons we ended up with dummy values being specified
>> for MST-related interfaces some of them had INTF_NONE, others had
>> non-existing DP controller indices. Those workarounds are no longer
>> necessary. Fix types and indices for all DP-MST related INTF instances.
>>
>> The only exception is INTF_3 on SC8180X, which has unique design. It can
>> be used either with INTF_0 / DP0 or with INTF_4 / DP1. This interface is
>> left with the dummy value until somebody implements necessary bits for
>> that platform.
>>
>> Co-developed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
>>  		.name = "intf_8", .id = INTF_8,
>>  		.base = 0x3c000, .len = 0x280,
>> -		.type = INTF_NONE,
>> -		.controller_id = MSM_DP_CONTROLLER_1,
>> +		.type = INTF_DP,
>> +		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_8 for DP MST */
> 
> with intf_4

Otherwise this is all correct

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Luca/Alexander, Milos will also have INTF0+INTF_3 paired

Konrad

