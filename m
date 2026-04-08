Return-Path: <linux-arm-msm+bounces-102300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJnrJDsl1mklBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:51:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E73BA24D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 140F8303E04A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D073B27F6;
	Wed,  8 Apr 2026 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwkJqtF5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fR8z5Qv6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BF73ACEFB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641702; cv=none; b=mI9vJK76yXCFeQMm5LKulGssJwvr5C5BvhruHVxy63GzOIknow8dEcEfBou9lWgu2/2bVoStHebWJqin5EpDQ8OM48O2U8iPoTbAQdOtAcnSM/pjyqoFrS44xMzpiHyrpEts6v+UaXyA54mu9jCkzV4U/Sa7N2KzKm1l4GWE8qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641702; c=relaxed/simple;
	bh=LuNedo1wz4HLsvM2wM2nByzhs7nd0s4llpcInO6ouqk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iplltPNVLcLPbRD5mRmaW6AbJqIXo6LGOE0tjUh3+cUFmcP3Mq5Q2mee4/RDrsS74tcUh5++KcXMv9MIrVlDy3EPfKWvTnTzOoitnDrbgv3EjMyERps6jLGev5nrryRLx1kv2mfROS5qPYkhocFoo4A4vjy1aBvS/Ald11bDHU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwkJqtF5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fR8z5Qv6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385MpMv071802
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Osn80gxYAXTeDx4Eh5y4LGMCpIKLAUt616H54XFdedE=; b=hwkJqtF5ONTNccGT
	QGIZ1RhIpFcDNJkW/bKXZBOsHdVzX/d06aGx+qO6FNkVhqSp0iVG0PHxLI+Szvrh
	MHgNxyQT/pcO2MgyfgNjL7nghksN/Yu8s+SatWIY+8DnbRMQ2e9lPFI9S3sdQu+6
	kxxuM37VVGN2JlDEfYIlEyk0AB6x+SrK7nhlgHb9NH+reBITRLanR+mS7pcQqfnH
	cnbdLfHBCI6S5d2+JMqsELbA5VX3vtwVq3h8LUGFLv/W8C88zoy+x7bOjTo7G/G9
	ZlJxYpwWVKszwGJYSmvqURhFt1f7MFSd8W4wTJ0cdVlLnM5UEm28EfwmKhz7qoTE
	rq0eXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sxamrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:48:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a88a2704fso380339b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775641689; x=1776246489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Osn80gxYAXTeDx4Eh5y4LGMCpIKLAUt616H54XFdedE=;
        b=fR8z5Qv6EsNsf2KIMeifVjmP4M0om/hAThAgig4AZOMBap0KRNz4A24onL5LtXlmVp
         FzyUpWUAGiPXdxP15x7Eu94CWULBDNWX00rC60OJcyO0JXfQOXpYtH6cCZNA5zgq5ArC
         2QecirvOIm3fTo9VQlEMnWJR/dQSPmlDNJa+KMHrgN6Ln74c5FmjYwn2TUhi2kbKH/ed
         tlCQ7frbjtH9bZkS/ogpf3torJ2FrfSN0iLgCbMCz64ES1HgerPfm2PUEvxuTibgh3IE
         88c/66QkErN23wigETP4JMG7d9w2wQXW3PZE62OGLivRBrTMYrV6cCejnJzpBQKRNdN8
         g5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641689; x=1776246489;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Osn80gxYAXTeDx4Eh5y4LGMCpIKLAUt616H54XFdedE=;
        b=dhMXQvRkTKc0tjUYkVCCcEPc5Kwyw913Z1tv4Atj1Y8jPyCQbYsNs8cVSHyjRLII3Z
         HQwazKg7Y8E56Tlmyf5fYPNGA0Udlbi/uK8xyfrxxKAWhs7QFfol0DBv4qp0FezVn2X2
         tl9lxRkK5KpYeodwenYDRltcjyuOOPwyIOaGky2dOrtMaM9vTTI+6P16B36Z/AtmVhrt
         rSZz9gY6w2RG70WC5QLOnlU03LuRz5DCi2zJV2es28F791MQkPpX+arTkO6pyGm29GGU
         zn1hRHdpCQH2tUwFmQHPxPxS1kIKRkcl2CEfEv8OiiL8Busrq8cYDIyg+uJxyoGQXLCZ
         JrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX42cD0WI0InfFX+jyRduocWJ1sZcZuR684biCS/dbaW9KEi2WOXNIRfrZ7CJ2gtJWcX4Wt4UVJjOneQ8C@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZj5unLY6UWS+xXrZe03e39LnnqXDFIaVyMkG6azI/rGXnoSs
	CefJITNdJ5r9QFGWDyFFAW+ge4Gal9bg9IHjj0ZOyYqOWzGr5epFajo1MKdayES2ABNT5lBWM9v
	VB8xhVGm7ySWJurvHXb9pvE6sUUUnO3f8APjvhoC09XrZvNqVeFz2obPakAUI4jRMrLcS
X-Gm-Gg: AeBDiesJuXFUYzTsGtVjOGZwFabFLNGUfQOk9byHsR62DF0yrnQNKxxgX2pm3F+eJaq
	AUGq3MCvwkXzE4ZL5hzI8J7TecqCjvDE02JlpsBzFiNCLvVKQRP/eQMnUclfFgBHsL7zVBC6uoI
	7LufFIKbR6m+LZ8KfJPVAOSPv38pPxKgNIg6ubG3Lcf7DqrD3RCB2o8l5hrPF3/ufOlduasRh9s
	o9Oo/Uvb5joae5UsrkIyd/k/KEvXIF8tsQbPCSKQSNbyE3JKO5xk2k4eAn4xE1tPwxivzINtFdq
	kkSFtPkvdLx85RSF7yJ6Hcd/tpqdpx95Q5cblc6LKcEpvNqdhxZnuNKH82lzT8YdiJVyT6MTsW/
	48kPex0eJncZnIIMhoc8JHL0kyeo2a3YOBTHxQApJVt02k6ecqHe5SS4hwLBdYyQt0n6nQmTUu5
	14PST+w7I=
X-Received: by 2002:a05:6a00:1ad3:b0:82a:6e4b:5b4d with SMTP id d2e1a72fcca58-82d0035bd98mr18842240b3a.23.1775641688541;
        Wed, 08 Apr 2026 02:48:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad3:b0:82a:6e4b:5b4d with SMTP id d2e1a72fcca58-82d0035bd98mr18842217b3a.23.1775641688041;
        Wed, 08 Apr 2026 02:48:08 -0700 (PDT)
Received: from [10.133.33.34] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm20537756b3a.45.2026.04.08.02.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:48:07 -0700 (PDT)
Message-ID: <f2231896-d065-43ee-901a-7dc35299f264@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:48:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
 <20260324060405.3098891-3-le.qi@oss.qualcomm.com> <acp_9Z6Bhq9ngDAi@baldur>
 <78ebca6b-d8e2-4db2-8a34-ebdb6f401a5c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <78ebca6b-d8e2-4db2-8a34-ebdb6f401a5c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d62459 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=l-e2nHpeJZkY853er4AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 8_eA0AcbF0J8zzWpwcr82YtUd8yqxpAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4OSBTYWx0ZWRfXwjmg1/db6DKh
 SqtxyoFsusg8BIUlxru5r6iwY5hd7VBxlrc+iBqpixCWUBGuovnvuzdCmjOXMpQab/R05c/AM+y
 0TSRMJu8gIoLDV2fG1rJqVPEGbHd62oGw9aeK9OcJQ9v0UbvJtt3kNh58C6ZrCGoIpBJZo9BHiq
 v+oq4vnUJ38FdAL1TlVTFmRJA9xrfpCNQzaM3+LpO6Km5WCf93/lbPhq+gYUCvBe8mzSR/dGT8F
 13u5FC8PVQwZ2UjlDibekdnjo+OUBjyjOJE+WXOq5y2uJFRZhDtNLwwLTpzRuLt2TvWottk7dKZ
 v7b+R0gw0Sdn89iqxBVcBV2Rgg1a1GPEbzVnTnmvV9pBznCMuCkm26sd82uBD2LEbuL/NvTfzqi
 /NSo3typb/36FhQG8iCgNJasm0TzLx9Ll8ySnoJQkYZQROiBMst/8SHRzSegAXJcD5JtLKqXpZx
 SZTfUz4Gywj7tZmzhZg==
X-Proofpoint-GUID: 8_eA0AcbF0J8zzWpwcr82YtUd8yqxpAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.17:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102300-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B6E73BA24D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/2026 5:42 PM, Le Qi wrote:
> On 3/30/2026 9:53 PM, Bjorn Andersson wrote:
>> On Tue, Mar 24, 2026 at 02:04:05PM +0800, Le Qi wrote:
>>> Add the sound card node for QCS615 Talos EVK with DA7212 codec
>>> connected over the Primary MI2S interface. The configuration enables
>>> headphone playback and headset microphone capture, both of which have
>>> been tested to work.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/talos-evk.dts | 65 ++++++++++++++++++++++++++
>>
>> There's no such file in the upstream tree. Please test on upstream and
>> resubmit once this is ready to be merged.
>>
> 
> Hi Bjorn, this is merged. I will post new patch, thank you.
> 
>> Regards,
>> Bjorn
>>
>>>   1 file changed, 65 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/ 
>>> boot/dts/qcom/talos-evk.dts
>>> index af100e22beee..6352d614e288 100644
>>> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
>>> @@ -5,6 +5,7 @@
>>>   /dts-v1/;
>>>   #include "talos-evk-som.dtsi"
>>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>>   / {
>>>       model = "Qualcomm QCS615 IQ 615 EVK";
>>> @@ -40,6 +41,46 @@ hdmi_con_out: endpoint {
>>>           };
>>>       };
>>> +    sound {
>>> +        compatible = "qcom,qcs615-sndcard";
>>> +        model = "TALOS-EVK";
>>> +
>>> +        pinctrl-0 = <&mi2s1_pins>, <&mi2s_mclk>;
>>> +        pinctrl-names = "default";
>>> +
>>> +        pri-mi2s-capture-dai-link {
>>> +            link-name = "Primary MI2S Capture";
>>> +
>>> +            codec {
>>> +                sound-dai = <&codec_da7212>;
>>> +            };
>>> +
>>> +            cpu {
>>> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
>>> +            };
>>> +
>>> +            platform {
>>> +                sound-dai = <&q6apm>;
>>> +            };
>>> +        };
>>> +
>>> +        pri-mi2s-playback-dai-link {
>>> +            link-name = "Primary MI2S Playback";
>>> +
>>> +            codec {
>>> +                sound-dai = <&codec_da7212>;
>>> +            };
>>> +
>>> +            cpu {
>>> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
>>> +            };
>>> +
>>> +            platform {
>>> +                sound-dai = <&q6apm>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>>       vreg_v1p8_out: regulator-v1p8-out {
>>>           compatible = "regulator-fixed";
>>>           regulator-name = "vreg-v1p8-out";
>>> @@ -109,6 +150,19 @@ adv7535_out: endpoint {
>>>       };
>>>   };
>>> +&i2c5 {
>>> +    status = "okay";
>>> +
>>> +    codec_da7212: codec@1a {
>>> +        compatible = "dlg,da7212";
>>> +        reg = <0x1a>;
>>> +        #sound-dai-cells = <0>;
>>> +        VDDA-supply = <&vreg_v1p8_out>;
>>> +        VDDIO-supply = <&vreg_v1p8_out>;
>>> +        VDDMIC-supply = <&vreg_v3p3_out>;
>>> +    };
>>> +};
>>> +
>>>   &mdss_dsi0_out {
>>>       remote-endpoint = <&adv7535_in>;
>>>       data-lanes = <0 1 2 3>;
>>> @@ -124,6 +178,17 @@ &pon_resin {
>>>       status = "okay";
>>>   };
>>> +&q6apmbedai {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +
>>> +    dai@17 {
>>> +        reg = <PRIMARY_MI2S_TX>;
>>> +        clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 
>>> LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +        clock-names = "mclk";
>>> +    };
>>> +};
>>> +
>>>   &sdhc_2 {
>>>       pinctrl-0 = <&sdc2_state_on>;
>>>       pinctrl-1 = <&sdc2_state_off>;
>>> -- 
>>> 2.34.1
>>>
> 
> 


-- 
Thx and BRs,
Le Qi

