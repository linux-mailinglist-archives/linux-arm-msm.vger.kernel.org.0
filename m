Return-Path: <linux-arm-msm+bounces-113650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dmeqDeSgMmre2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7769A192
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:28:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Apd2xe4g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QLrtjA2o;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113650-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113650-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 417E9300721E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC04A3BCD31;
	Wed, 17 Jun 2026 13:27:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B43E39A047
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:27:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702878; cv=none; b=sS0ZezuzbD6kxJeNA5vWTtoqCNlNKDclmdsbrlJwAcuQ6GLGEM6J6lG+1n5JfkuEtL2UthFpLXPovO2pvSBix/gH4WU+K0gH5uBqWrcM0rdtucptLjVg6JKNeEGgu0cpBXKU2j7J2+OmWuraOtmxTyw06PuatFZpKR/rehcmyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702878; c=relaxed/simple;
	bh=UNgDj/HhVd5CGFuFsZnB112MTAOb8FrY++RoOaK7DHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdJf9q7AdFAhv6/fhm6+/uaxEQJ7dHxGcPng/K2+R4ymE4XSBFnSzIT3jO6c/jLzCLaSDKdiPoWCmSnNhPdHF4iDyyJSaC3DaEmFcoV4O7TAtif5Scs65mJpPX/F/sm1/Q7lHeVJviMxdFPqG05QJHiVhbok6CcW1Z2UQ+rTa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Apd2xe4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLrtjA2o; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VFlO2291549
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=; b=Apd2xe4gqdncpXDL
	1t6SRb9eoh4XQC1uDRlDvHUVz6Z7QKHd2Nw7g7RCVimYpugCfH6I2+U7N1ZYin0r
	lWaljejPz+mXDApBVval0MzQaRMosfkBcbv8TnQv8dJlxd7fKIcT2f82cZhokkvL
	5qpHhiZ+kBxEezBpS5ymhzcksfY69Ml5rTKkfF9xR4DrraHAfSD3BKoKjwViF7iT
	pJZv22rXH2qAocdtJLABC1KtufS0IrIHJsE4xnRF4+v99ZNR0N6dU36hUiAj7yzy
	FTQOUhH0CGjQoif/X5xV9IuZVYNG9KY5rQF9mbv5DqtVNVA+yx+e1N2tVD6aofFj
	ppD2Xw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevkcje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:27:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842211d6e48so6820562b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781702875; x=1782307675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=;
        b=QLrtjA2od8ewv95lN3Q8ybP2NpeEsCv9As0JrwrbQhPO9bSFIao8Im0JUXvZHvAWSG
         8xm7lUq/TaN3y2xAffV1ZzdQGuGRhG2oIh+ZZh1v2YSvCPeQad6Ry2kESuzgO8kv1o4i
         UxyW4qB0/+UvGgibwHZEZz74f0GfY3QLFmVpZXyKIjRzy6FxgvRoQ/CbfX93qt1ITHgS
         3CvU6Hf3N4xAr+tLKzh1K+GfY4kyKFPphlacwbOIq9p5aJHFnNIwHGl98JU80r2mquDZ
         adT2wljaJ9qHxOosdQjH00/XfSUj6IXIOTY99p/fNDRMUOAv7U/ljaaqCOMQJXdkFxTo
         mZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702875; x=1782307675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=;
        b=PzZj+zVo8lc7r2QqTcEb4p4x9d+WoselRM7RW0WhUp7P4zRye2gZBo1rkI2k8MQ7tp
         CPtVhIPVfUgAtf5uoZDuByCVaHzzVCPzSlRdEzQvsNvQPMPyDiHIfxf4GmYWxclxp+9C
         kIp7RdK5MF1wIUWY4juka0udSNpaGFNl9w9pJ1+nwQQuZHtdTcONfw0cERIYlCJmUuPw
         3ZtcJDDRurEdB2FuL/4VGQ2hT3QdvkVskZ7H+2fV1RIYZbCLWla3YktjS4KarM9ei0bA
         /oBc2ND1TW1MCcxjiEVyrBmsw6Dl1rgWjXvvLlsSo9jDtL2AQW39Q9mQZVVKhVHe+FNL
         3QpQ==
X-Gm-Message-State: AOJu0YycecU69JKhOpKlGxtvdsUetlW3V+lySC7/RYzxewATnLjNKcBI
	A17EG1QGTTRZnIj4MRzQ+o3nuVkeFREdzTQ/f5tkMyUayHsOie1/PzYdhA7bStaFh58uBDmXIRk
	kFaoXvMEm8vyxd5VdKJL+efcwvRLCEVtoTItmiHsD5O3DlUt2cBiV6BW2k3m9ahWsqyrt
X-Gm-Gg: AfdE7clhA91q/s0z44foIDwXe0lca5PXuUEwxk9lNzvRURJUbmA8O6fAnMkVnXDEBrR
	s25ZtazmOTUocgTf/3fuc0vMmdjzJbrmbPYAaWYn4qZBK2+gt1/11ruAQ/fP6BtLo/mQQ2/r8Mi
	W81IZ++/3FluqxKyfd8GMFztYzXceaJW9nuqsr4+/gqBRSYuYUDhQ8guYFoE7U817jvg8afTQo5
	9HZ4rqpBoQ6uFm1f0E8/K8xXUN8Bq5+r0PGIjNqyIgsduwSFpMV6yhydUSFkSGKK4Zazs60eXcq
	ECIq5d2gXGIn1r69dVDh3gtKPWBfGB11uosgVzeWH9V5N46ENYD1XcdzmhZ3SjLVAUzhHw5oqLS
	2r8sBlS15sBrXEKtDQ8WgpbuKNxsVT1cAuRmOOGB1u8aCsxKFYUlWijmB/3SIc3CpHkAJowHw3G
	Q2a9I=
X-Received: by 2002:a05:6a00:1f10:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84524443d7dmr4092460b3a.13.1781702875562;
        Wed, 17 Jun 2026 06:27:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f10:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84524443d7dmr4092434b3a.13.1781702875119;
        Wed, 17 Jun 2026 06:27:55 -0700 (PDT)
Received: from [192.168.1.112] (ptr-48-167.coastalbroadband.in. [163.223.48.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd17f5sm14768044b3a.39.2026.06.17.06.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:27:54 -0700 (PDT)
Message-ID: <8aa63705-08e9-444d-a262-ae255d5010b4@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:57:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610154517.134570-4-prasad.kumpatla@oss.qualcomm.com>
 <6238983c-6b10-4639-b6ed-d1d25b00e748@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <6238983c-6b10-4639-b6ed-d1d25b00e748@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX9Hl5KW6fHSXR
 IrVIsruAZva5Ty2fJgn4EbkADanPQv9JGMXAjWKwGW975Rsp/tAohFS8KDIMEqAFhs68L6riZ6g
 M1xS1+Llu+piapLGfn88mrDudVx0JVLuO3t13Vb78p+yBdXalbbV9iKXJ+YZCkUOA/rFTiSh4lS
 1CCHr0k9DFXtn2Bh56Kj8RFytwNf6O2awReoawC6V74EykMEj205LWrJ+PIjxO5BzuBxcQa9MKx
 pka83dB/yV6fohnoDddisU+H2/mLMFZnf1Hc4nafGQKGILaPvwL7rDl+HIzFrlO2ME6UXel6cn8
 RzNKGUcnc3X2gs6M1+D22l6fHXfd4JxjwAUUd5zWNVoZnwzDb0Xy43abb211jPB4gxBGvBHCryv
 8SeuYeXqKzbTBZenD8mTAGUL3+DdHHWpcsdwE08mp7varV3pT3ikgz3iU4nVVSsKyBE9Jm/GWkw
 4ZO3EpkfodV3loOXLMQ==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a32a0dc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=D3hM7nRbATf/MWm6WF+yZA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=P-nLkKpV7BsKi0cTG20A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: L0kp_cY1nT2p2Awqp9iB0AyFdNtVtCkt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfXyVcOLqObf0nW
 7+skCfWOXvR2nBK7wajOTYtnDxdIKkMOaTiw4zzEaN8sAaBu3TzKRjzBH9bkzZYeugwsowvo2VA
 k6kE6AhpOsQ6qOoyRl6iCurL6uuWlHE=
X-Proofpoint-ORIG-GUID: L0kp_cY1nT2p2Awqp9iB0AyFdNtVtCkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113650-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BF7769A192


On 6/11/2026 2:29 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 17:45, Prasad Kumpatla wrote:
>> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
>>
>> Platforms using Audio IF module backends request the interface bit
>> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
>> header so these clocks can be referenced from device trees.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   .../sound/qcom,q6dsp-lpass-ports.h            | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 45850f2d4..bc860fcbf 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -233,6 +233,63 @@
>>   /* Clock ID for RX CORE MCLK2 2X  MCLK */
>>   #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>   
>> +/** Clock ID of the Audio Intf 0 internal bit clock (IBIT). */
>> +#define LPASS_CLK_ID_AUD_INTF0_IBIT 71
> Missing indent

Hi Krzysztof,

Thanks for reviewing and comments.

Ack, will update

>
>> +/** Clock ID of the Audio Intf 0 external bit clock (EBIT). */
> This is not kerneldoc. Please do not introduce your own style.
Sure will remove and add proper comments if required.
>
>> +#define LPASS_CLK_ID_AUD_INTF0_EBIT 72
> Why everything has "AUD" middle prefix? What is Audio IF and how does it
> differ from Audio on this device? IOW, Why Audio has to be specified? Is
> there non-Audio block?
Agree, As this is already audio, it may not required to use again AUD in 
the macro to represent. Will update.
>
>> +/** Clock ID of the Audio Intf 1 internal bit clock (IBIT). */
> All these comments are pointless - you repeat the define name. Explain
> once what is ibit, ebit etc, not every time.

Sure, we add comments if required.

Thanks,

Prasad

>
> Best regards,
> Krzysztof

