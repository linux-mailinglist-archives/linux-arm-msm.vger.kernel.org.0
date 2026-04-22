Return-Path: <linux-arm-msm+bounces-104077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKiXEmSr6GnEOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:05:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95165445192
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 590E6301C159
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4746E3CE49C;
	Wed, 22 Apr 2026 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH/oKow4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJInnORF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013A3CAE8C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855887; cv=none; b=iqohcPDbYqKLXvcRG2bhqswgmfkRs5OCJarkTgZAtu4D2v61Jec6mxa07VHS6DxdU2JxgoOe2jyJvtCAcG6lXsSqSQAz+O02wxlMQ5kIYK1ZgitD4Yw3bZ24mLA0UbiqRkGbmQPKtgyAiNkVTb6CMU8hPNkEdRw78fSZCmLX+oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855887; c=relaxed/simple;
	bh=KDHR94zHOrFw0CnnfFBoGmRBQY4qJsdkVtXomYv6FPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+xEdUQ6fWaCQkuYMF40qp7e1DQuj+McS2CmA6tRhCvgdkeeqQGhPgQPvIdUIqRR4bPn7rsxgFkw3nqtwoYkqqU15I9WapJJkCPdmgL9MXFI1pYIbSC2bD5YJ857GYPZyJh38BG1U7kRYKb3+zgvvB1b606pNmYFMl8A8PW8Af4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH/oKow4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJInnORF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M992aE1442696
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k8zN6wAPMYJyqClZKSaXPUPyTdC5aFzSsluwryyz08g=; b=RH/oKow4NNB+fCJP
	pTZn9YjeyCZWfpzZBBl6ByhXZEeWM7VnaVgstz6AKHsVOB6l74XTkq9WzKtQdcq5
	eIiX8DJ18V1xnA8ZDIQ1p/Kv6dOWNrIgU1OXbKrx4c2QeStO2IhMKerIBjUBKow6
	4PZNqqpP//X99mWd88uLrX2x7KzRbDQq47Oe10W1ksqlgUPVnatdQHNbssfJ8Q2q
	AYPqEAjxBTaT/nYmI2IUYIOqcKtYRU6jQ5ejXwGDjTuZZ+LkfCuAZmx2QufaF2rD
	AyU64p440HX87fnJtbusagAb3STC6tYJ6c6od9ZkKv219KoCl+E5tTH235lK1rv5
	pxpJgQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfu01v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:04:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9569074317dso255453241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776855882; x=1777460682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8zN6wAPMYJyqClZKSaXPUPyTdC5aFzSsluwryyz08g=;
        b=FJInnORFEROpjjl0l92sIpP6xZvahSQvcJd+qQOjgVIqHDqpVmrWK8NT3lObJipnOO
         y+s22HZ/MiWEr5qy1z2R33xaT+bm8tqrz5K58ih/blIB9YGbnQ19pk40LtpoEGbI075t
         n8v/shT4r+pyjiFDqmREFAFjJx4USuVAph+m/dfp2YtuHJ5uuCyPgiVLtQBQDsR2Jn3s
         nHynffksZfPwlz2lWElq3/1edyeClL/ac/9MGSmMICFEuzu974ibPYjxdbTBRAnVHmSn
         4TSdYB4u0PW8Xhz4IN4avaujo9+umbbgXn0YSRlgyAKS8MB5vwuHlBbaUqx+VadqXFEA
         oikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855882; x=1777460682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8zN6wAPMYJyqClZKSaXPUPyTdC5aFzSsluwryyz08g=;
        b=DwAHM9wM1X4SwNf3dKaLQ956EWeG61yEksV+Ad0ocVvR/pNB+XJHCTjG5cQGzxOivk
         1Dy0YfJSeAc5No/Yumz1uDb1h27atYWUsforCjRSO62qURwXp+WTisTvN/rDujQjzAYC
         E62ECRGrug2eSAhjdLVHivRSUdc5haumt/ZxDmW5IZt4TZHSVWxMbqHanWBRC9f19lp0
         fnycFgMJ0WSrmoeVdV8+6yIaoIqj3sbxFvS+tVA6X+LoSvhd5CsMJ/wY/Tw2rjiBOONd
         aZ45eh1nH9bZcSjNp/qCvg7AMWjqCt2havP62gbFiNh+mA2FA5AWiHPkVz6JWFQ7TOV1
         B4tg==
X-Gm-Message-State: AOJu0YzjroOy1E5Iyi+gK2mCnaBUN4WVygDs3mREg0+ybXTq5iIqCGnU
	ZcUAhc/70zvwXeLi76M2h7QupL1bSmr+IaT4YPlBcFtKxvNcXY2FzZx1nijJ7tZ8UFJ1d1gk23B
	1Itgbng2qO9am6RFkf7vTx0BEdsVYQ2afdn3RJltkq7+o4xyiSF7S3vvj9H1z8qIxIuDbAqqzNY
	s+
X-Gm-Gg: AeBDievAE2ZNDMPKk34NQYI/YgGQ9qbNLgbdsGuUiHVNTRNPB4yEIL8ay9i0D8/NKZ0
	cGZyapRIyxCEnuK9M4piZIkiJPIQv6sd4Bs4/qIfKwOx1zPIbmif52kzqwEPsMTs8H+WfaQlEi8
	ujVbVCyWT70fnBpq614m2m7znSAYozfz63eQfp1XcI5CQFqf4Ghl00n+4GiYNyrLzNgGVVe38y6
	y1pWefZ+VV2Bcq1njeQrBVMsYPWQ34uQs/+JsE4M/st86yyx+ZhRUg9l51hKR31Swu5hB2gT8/Q
	JNhvlDpHnfpuBsVRC6/06nOD7jsUPwG/9k59G5rQVRmB104MiPxqgnZZijPKLjiE3vnCiBOvgOL
	FB0DWYoyU6KLh9fi8yKHJHVMRY3n5BTKNgi2kKq9V8+iaXaUIrzBNA7Fq/grfjlTNe3PX0seqDY
	YssD7Yyo07t9vctA==
X-Received: by 2002:a05:6102:21a8:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-616f8063fe3mr2818714137.3.1776855882453;
        Wed, 22 Apr 2026 04:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:21a8:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-616f8063fe3mr2818703137.3.1776855882044;
        Wed, 22 Apr 2026 04:04:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ec776sm543624766b.16.2026.04.22.04.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:04:40 -0700 (PDT)
Message-ID: <fbac099f-ca46-458d-a628-393922cbc45b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:04:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
 <20260420-topic-sm8650-upstream-cpu-props-v2-3-689e07d8ab8c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-3-689e07d8ab8c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x9P8wR2n00_G7jv1dHZk1TUqPCWy3WjR
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8ab4b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=kjch1nhIrtbhh0vZETEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNSBTYWx0ZWRfX6PTjOSe2ACZ7
 6WHaYz+R3qHo5rH3YUlKWtyhXFBMsWu+SBaslVx180wX6sVl3AyAxy8Hrdct9cR3s5ps+fXNxhQ
 vQv5orcrgfJWB0hU3IthIq6zSt9isK5UFqxibHhy76vJ6RafWBMM7tRZIFfLdfgRGZLY5FrPbf0
 4sb/REgNU3uxCNklUbZ/XGi+C2kEtqC28+S+NdVpjKMMmc2+fdoZ+SAN92WPUkd2KyMqQ4neEm6
 CAWU+CArvy8eAgoP8KjpkVX9eRqn80lmQmXcF2vpP7cxWQIiAtjlneUFdH/LcsdkFXhxyWlI9J9
 aCwMtTkkbscjVTar50FnWf/9Qa46Alo218PW21n6ko7AcmAx2+PE/VpTj3MoabrpIwwD5IuaH/J
 35QJD8YLtGsg9lLFfwy9dDDc8sJawywVIbV32pPwfVr+p2l8Z0hFv05vNAJqFhnFL7ah6IaAXoV
 8BzQb74yrHhtkj3EymQ==
X-Proofpoint-ORIG-GUID: x9P8wR2n00_G7jv1dHZk1TUqPCWy3WjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104077-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95165445192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 9:26 PM, Neil Armstrong wrote:
> Since commit 9e53a66a2f2f ("soundwire: qcom: deprecate qcom,din/out-ports"),
> the ports are checked against the actul hardware configuration, leading to:
> qcom-soundwire 6ad0000.soundwire: din-ports (0) mismatch with controller (1)
> qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)
> 
> Fix the ports count and properties of the corresponding soundwire
> controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

+Srini please take a look

Konrad

>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 42 ++++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index c5358894fbb3..2cccfbc6d008 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4730,18 +4730,18 @@ swr1: soundwire@6ad0000 {
>  			pinctrl-0 = <&rx_swr_active>;
>  			pinctrl-names = "default";
>  
> -			qcom,din-ports = <0>;
> +			qcom,din-ports = <1>;
>  			qcom,dout-ports = <11>;
>  
> -			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
> -			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
> -			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
> -			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
> -			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
> -			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
> -			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
> -			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
> -			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
> +			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff 0xff>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
>  
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> @@ -4827,17 +4827,17 @@ swr2: soundwire@6d30000 {
>  			pinctrl-names = "default";
>  
>  			qcom,din-ports = <4>;
> -			qcom,dout-ports = <0>;
> -
> -			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
> -			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
> -			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
> -			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
> +			qcom,dout-ports = <1>;
> +
> +			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x01 0x03 0x03>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x00 0x01 0x01>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0x00>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x02 0x00 0x00>;
>  
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> 

