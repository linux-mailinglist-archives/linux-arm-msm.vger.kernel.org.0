Return-Path: <linux-arm-msm+bounces-118268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y4VmHQfiUGqW7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:13:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C515673A998
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:13:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cjdqP+yv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="eG+Ad/CQ";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118268-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118268-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A062303D114
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295623BC696;
	Fri, 10 Jul 2026 12:11:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD825225788
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:10:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685460; cv=none; b=QmXM3n6C6fInj3IsyMjA9WjlXmuO3bjf1NhgTgZto3SJREsyGL+sl6vcNg2Bok1fDBLhMayjD/8Sb1dHvZepXVdYzUGstLpsfhv4QOWmtQgpNs4bLq0zSV7TC1APwaKfbAtNMXVaAtTf6NJt5gv8OtQ0Ep96vucSPT/WsUsEqZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685460; c=relaxed/simple;
	bh=LQuqMBiMfznhd5njKcRFfwpGiKCYjugLtkhtU7uU7rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbLNZYBvRghG5AgZVxZc3qmVi93pm3IvA2nVEmthbGnpkQ3xEfoW/cAuHngoDASh0R5O+G5IpxXp2zx1NWaHbK/5/lNlHHoCbZztdrlXTT3gKv9a6KquPrEIV3kVCbMCI15u0l7wxdo+7b2PSfHr8jtcI/Esa9pmbUrLrrV+LDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjdqP+yv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eG+Ad/CQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmhXg393300
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMHYD3IApt7H3j1PjH1ywGPQU4YgKE9uns8OQVgsLG0=; b=cjdqP+yvsqtn6gPc
	W+muhRwpAEjb8KOgdYqYgcyr9oh7YA3nxxu/lmn6zEvw/C8I2oicRSES4ZQQBep8
	u22fp53QKB3BGmePM0prjkBOpPuHkc8W0uHr2yBIlapcZ0FphrPBtDeViTQAMs3n
	+H0UZx0wRm9P4XM2eHbln7299wzAI6WFA6s8oE9ssdEoK+a9+zhdbC0/F2EFrmJZ
	C7S6OY2rgHWvD9uPInMbCQBTm3qSv0C5KPf5YmcfNGbhPXaRM3HjirQFJBiaUG/Y
	IoNP6alu/Byf8pt25HOABSpN96pox1tbMPE4UsL1l4k4kwNMctXY0XG82VJPi+IC
	E2y5KQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8k6w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:10:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c08e9c344so2755641cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783685452; x=1784290252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMHYD3IApt7H3j1PjH1ywGPQU4YgKE9uns8OQVgsLG0=;
        b=eG+Ad/CQRqAWo2z/mxzOUoY0Iewu+f51JLlWOgPDWiFp4qmJR9e00c8J8fWh3rAYV3
         26DsbecVSFmaOg/7kQ3liyuXpfmtH2XvJjxKwpEs0gc7tV/B4fZuCMPNSYiQABsc3wRc
         ihGu1s9B9W7LaUw/phI/2Qk9C+W71MCzHGVuRarS9ngOdnhepD3FHdE338XNJjRa2mAR
         rOEleev08DTc6issSCyhFwLSL7EGfiFGvZPd6eviYZsCbDaAjMq0q4v3l269GcJ0EYLr
         cZSCADdOFQwZV0Pno2Aym/KQKgalqwi7Ff76T0o0eSil/DYOjTxVaASkC7+6OskLwmk2
         tHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783685452; x=1784290252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMHYD3IApt7H3j1PjH1ywGPQU4YgKE9uns8OQVgsLG0=;
        b=jZrTiiVmZva3ZJafE0u2szdKp01Bh+HqmvwXQ3RTUhucYn16AO6Evl3uw0yM3wf4ZI
         FRDMHNlLCwsHZThi+KWCaRn0Fi9kqnMdF3z7zK0orbERSLgp/im7lwxC2wB/8lwNpnED
         Q6A7uCaJGDo7pMiniWpJwI+7S+nYdoT+HlMPtp/137+bKDqL7lukBZBi+jhWYLs9esac
         QIqB8Mp8J2bJHkPRCbe2OYDXv6cEZ+ytPK5elU+qKLPdiccasMrnZykZA+aPBilCDi8Q
         OqP/YTbmkWJyRJiJrY8jc53wzJIH1H+b4gfHEE91XofAY1p5Gi6bIYJiLYLzN1qp54a3
         z+gA==
X-Gm-Message-State: AOJu0Yw7Chplz8pMAfWmFBSHWyGHdGlRSVctjcmkvaN8tP9Y2qTOkNia
	GtLGTzz5SpVqS0Zxrp/93VzVqCdKA6zilzGXQzClxXwuCh8sK+qW+xIhNf7X2ZBbGn4XrE1b9Tk
	0TUuCyLbc67CLYHhV+usYJK1VzoKgp3U2NVZvXHFpGr53tuiEuwuaIr0BMIlanL1XknaS
X-Gm-Gg: AfdE7cmCnsRle+6BRemaARGzUc3riKzwTD9IZEZiuDkSZAPEEWe5l/rrJnFQvfHMKy+
	AErQCaKQPo6SwlAMYM0Z1TeIb+sRCfL20bgHZflPgTWhAa5/MCz9hmGVZu8qy8oijLbBmX3GgGv
	4JFEAQDGWRcBb6Ko4D5fM0hUfg3kaZby556IiNj8AkxhKposQrZQmJKStw64TVrFhNgztFdM2DW
	fISM5vnc3eDPFSqdWmjt/EgiZ6YDFGX3hKnVmcE8tZkZNQHAQ34wb0jE5Iuu/H3/e1OG8Oo0++E
	EH3hIljBB8+UdZIeGiOv3kecoSzMk+5pNK8kdxgxpU3Vs7FdJxk+S06HiRFwOjFDRLlikNL6Ukr
	OqgE7Be0LNGY5JiJ+JhQLlw2sLqX+Bxeu9ts=
X-Received: by 2002:ac8:5d91:0:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c964037f9mr69730131cf.0.1783685452029;
        Fri, 10 Jul 2026 05:10:52 -0700 (PDT)
X-Received: by 2002:ac8:5d91:0:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c964037f9mr69729851cf.0.1783685451645;
        Fri, 10 Jul 2026 05:10:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c3f5ca3fsm437597666b.51.2026.07.10.05.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:10:50 -0700 (PDT)
Message-ID: <d7322cb1-1c8f-4c81-a3c0-638d60b53230@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:10:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dmouPgQz_DKwA9rxnERTCWHwX0OT-qqj
X-Proofpoint-ORIG-GUID: dmouPgQz_DKwA9rxnERTCWHwX0OT-qqj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyMCBTYWx0ZWRfXwUKcNnq5zoV+
 e8lwveE8M90eAASfQCut9pfZJD4AY3s094cjzITzDTz0fl3IiXTCywGJTevTF5ts/hFYA5Z8VRD
 L9wVi5XHjhy0LDWFJz539Gw9h3pgsKM=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50e152 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7g_QvTktBp9WSWir8t8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyMCBTYWx0ZWRfXwX5PHhUqqSic
 Nnz1P+7kAZ8Nx2/H6sr1SGi3R8lFvQtH6BWBK2cdJgx9Zflahi2mSe0vwej2Aba4mZQ88tvdL8F
 iPl9HiYms6X7HH0XxDTGT3SabxWt13ULrLEmhbBvrQ592k+i0z05KxeQvlcit0gvwDm47AjaM8I
 1/25nXVMdo4lor2tugOInQ4mJx5LFJBYduGL8jdWrJfZa8Im5urJdvp/s6CLx7dvXOj5kTddwEw
 6jAHnys3PoRNiLLwBpQS5Z8udd2+j1+nhNm3v5R4ZNpzghlLf1JbEGTr1kCObLfnN4OH0ZEplOk
 2nT/Jv6mIp2yHYHCekggfFj3gRrDz0y5R4TM/moMC0+wzQZBXtXMi3n08nWMnFU6FLLBdvHTBTX
 KBXCNII3wruZ7miJ7XK5SohTRuI2wthbFu4RgJls/M6XofCnGzlEg54WMFqDEepob4EX35oo/AK
 ibTvrJbFTbPJm6Rtf8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118268-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C515673A998

On 7/10/26 1:58 PM, Arpit Saini wrote:
> Hi Konrad,
> 
> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>> Hi Konrad,
>>
>> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
>>> On 7/6/26 8:04 AM, Nabige Aala wrote:
>>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>

[...]

>>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
>>>> +        pins = "gpio91";
>>>> +        function = "gpio";
>>>> +        drive-strength = <2>;
>>>> +        bias-pull-down;
>>>> +        output-low;
>>>> +    };
>>> output-foo isn't necessary, the panel driver will assert it as
>>> necessary
>>>
>>> Konrad
>>
>> Ack, thanks for pointing out.
>>
>> Arpit
>>
> I just checked,
> 
> Normally the backlight EN pin is controlled by a backlight driver.
> 
> However, this panel uses MIPI DCS based backlight control with no
> 
> separate backlight driver. Since there is no driver to assert gpio91,
> 
> we control it via the panel's pinctrl default state..
> 
> So this is platform specific pin , we need this to enable/disable
> 
> the backlight.

Why would the backlight state be so tightly defined by the panel?
Disabling or adjusting the backlight level without shutting down
the panel is a perfectly valid use case.

Take a look at pwm-backlight or gpio-backlight.

Konrad

P.S. Set `mailnews.wraplength = 0` in your thunderbird config - it
currently inserts an extra \n between every single line

