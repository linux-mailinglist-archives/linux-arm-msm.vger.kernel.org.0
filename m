Return-Path: <linux-arm-msm+bounces-106141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHV8I5dm+2kzawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:04:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D514DDCF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 890EC300E731
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E1047B426;
	Wed,  6 May 2026 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMjbqf09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzXCLKvv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C893448BD5A
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083346; cv=none; b=HTeCLIdBRsWtKGxa8UKX3fwaXNHCe35+IM4s6+uqZ4yqg7Hh9aOUYnSI8jnnv7MtuW8JXEEi1v8F7cpvrr7tex3w0r4U3/wElnQTtkV9CsjVsfI11SQzuv4dvfwRolrjk6Dh/YEnIBY6PqTH0XZJUuZEH7w8KYyP6hUMMce4u+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083346; c=relaxed/simple;
	bh=IOTEW2qQ5N89NXwb1CeAN1Uhwjjf6nKKdaqAgo1Twjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCwy2cCEzkCAF37+f2eR1t6eEnBRi12GpL/DP9DOFUdt29zpwfAeoYfVlhI91VPcjv7ti/pXmmxhtGeyg60TwYG6y6NVk/EJf338yZ1DCnhEAqOyI7cmhxg/TAtfzLjVY9vK+R1vKvPHtkGDdkO0o2eSph0SlJ3YGWULCgv7Zds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMjbqf09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzXCLKvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EGAUf3309055
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 16:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TGZ1h1/OF53J3gFzAIo0xWBAkfLlfizlmwek520L4Rk=; b=NMjbqf09KRZ3cMc5
	/KHw2mkkI9Ijj7nU+6NObGB8gY8snyi0I3TFsEk36Zv7Y07/4oUJ3y3OJpeX1lE2
	ygAKbC6Zwh2UjQ6K3s8lsKc2cFPyUH0xYmQkAZpx3/Syc7Bv5uOvjTks/wlcZ+iH
	/Fgl5pgY1fMor5jsGIzCAbu9CtrJrdM21LGgafmvJRQf1UbmpSZZup8Qcc1TxLzM
	K4sv9ZV5lrpwuzaEOAV/Qa1r9R8YNacZ0PUs1qiELmDHitpQ3ekOdFcjo2TF/ARr
	J0U9z0DC8eS4oRrtwDaOucDXFgYyu8QTVwvHeTT4AjYFnEeNUEoI41ntb7WzPk7y
	A5g0Gg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sge52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 16:02:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9f5ac4e36so37998085ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778083338; x=1778688138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGZ1h1/OF53J3gFzAIo0xWBAkfLlfizlmwek520L4Rk=;
        b=TzXCLKvvwt6v4AiV6Vpyt52x+n1YYUsPWPJM5k+H2yni8hPKFgyKL1B//eQhXHOeYI
         zUzGA4ik4F08Xv/pHAW1kCMzRrFrSwLiw1LosC1HtJS3Dv4nakrmq9UJt+A5UL/eYtS0
         54ceUAGsfYwh9CVGmqBILitRSZeLrOMv5GT3496GGQeXH6Sez1CJ7u4AZ7IqAB3TQcFS
         2bnAWZl7VM9IozU7Q+6MPOdhu2+oVFXqrSm+DUcqeVLd0Kwpmd3dFvUfz94Wdy6HZn/1
         TnB75vMJm9eWuyaPZSqU7qPKLmlGQXQhyXYhWV1wwo/OTqRGL8gi30k2rCIIJ998WPhQ
         TeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083338; x=1778688138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGZ1h1/OF53J3gFzAIo0xWBAkfLlfizlmwek520L4Rk=;
        b=RtOgbpFbgMeP7WgH8S12883VRCr6t+u7rzprR/tknFxt2QUQyzKwqUYboGKOqHeN0b
         nDN/RTezx7qWA4cLRpGi6cu5T3hj5zDKkYQ4TWRkYisae3Tmnpcsl6Q79OoGL8WdKWJy
         7CVzTM4OrTgfXZMsJykyPkfdIBZcsagdDAOXB/mL4c4JhxM8y/USvAMPAu4ZFM5O4x1N
         D6QXDO7zPUh9dtBOpSNxHl9yEs9fks28sdo1FP/t9IDoVE66AJkoGAJILUM2buf22nIq
         x6uiDGFpVUN3HEKivcfzBEKkAyRqpJ+5I+a0yVXU8uiupE5NA1WK+N4xwG1khKAxRyhs
         ZNIg==
X-Forwarded-Encrypted: i=1; AFNElJ93PmkZ1ZH4fqMlFPJi32G3BsG90SBca8stBdrr+Upx+IRFEGBrdeB8/ij07724jJRXn3CUaXMBxlteUaa/@vger.kernel.org
X-Gm-Message-State: AOJu0YyNsl8IFuVx1X8xwRX3g4AX9Pxi4mtGj/ncrpjUYdLb5z0iFAHz
	xm5V0kCjsFKNbZ2r5NKnBziuWl/d8lIXd5nv94GUG09Uw2aUPKX+Bu3lyhaetJL2wle299778bB
	qK+HZDPOYTH4D9yqGeVpWj0LmHmu23LVYLqvTh25Lj1naon2IPyfZyDvXJRdFdcO5NhjS
X-Gm-Gg: AeBDievYMTMB/VtS5Wihhf4kWd+fdawsx4U/3RGfVODPQkRR8e+vHx7eFBJU/fUDnZ/
	SXXPrNp6A5b8eKONJln9oVBpGZH3fgxh/OAVZpXQ+szVbj7Me9MFq9ZDi9TKi9E/dWuvoZtV/pK
	WffHslz1GNrMqEd1ycoyNox6+vHY+Pe8SfxWEUacos4zvfdvtxvrP71y9lTOGJJkMpUAyeuKT0i
	rfpu0WhrOV1Ycc4mZfJ8rgf9qlJngJYeCPa1HYE6tdvFxMPWvJH6s8K3xfFeccMIcEYGDgdC+zo
	RcMmgOiHe9f3PGQG0hZKkYGiEuclHGM/BP61XYTAuJj+4g4bBidKOat6vpKAu+uymUx0XhxImZo
	ZQGxnrmcNH3o6wJ3JP1LWpLzMJKYExJh72l/T1NcxO+C/maaMknPmyOLcg54XKkro
X-Received: by 2002:a17:902:da87:b0:2b2:ebed:7afc with SMTP id d9443c01a7336-2ba7a33354emr44077715ad.27.1778083337923;
        Wed, 06 May 2026 09:02:17 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2b2:ebed:7afc with SMTP id d9443c01a7336-2ba7a33354emr44076295ad.27.1778083337057;
        Wed, 06 May 2026 09:02:17 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba849032bfsm23120095ad.44.2026.05.06.09.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:02:16 -0700 (PDT)
Message-ID: <2b4ff288-1068-4411-bfbf-d007740710ae@oss.qualcomm.com>
Date: Wed, 6 May 2026 21:32:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-13-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-13-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fb660a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=glmcflYCJT591w8RKWQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1OCBTYWx0ZWRfX1k93S2m/ek9P
 OKTZAFU9HLfeU0bcMUJZUueBH23RMc+CFgNwpVV/frk9dSeWHwl3Jv6nJQiCCgQOXs/79xtmz0n
 rJq7MYZ5SRZjHhZ/FfldMfJlPwMi3xfHtwmalnFu413l0ScjHUJTRj6xaC5EguJr9XpiNP8yKM6
 FgObOxUGVrXJw2AelyyHVOX+gmAs3Kqgm42XJclmGvU6AaoJk7H6UYizjU3vnpK3cvfy+TVmqo+
 nltc4e2y/wXqzF07JLldwPp1UkJhzBTihEPHJZi3EPZwFFqYUdC3xrejfhnK3JygNFpw3OgdCyi
 +ZhS+9AnBY1gGCkr+9Gz1MIpYkdJmwHI0h0jbwmiVcfg26KqEuFpBjX9jtgiFSw+3Wr88jwxUEW
 Q/DyStZl9ZhDeUDKEUDZO3iJnyVWMnkZFVZqQvFGcR/3hCRjqJp+P4J48kVQm4goo3s4+mwiVNZ
 w76iqYi4hiLYxyQYnXA==
X-Proofpoint-ORIG-GUID: r6kM98rXkSWu7NykUh8bz5Fm8dvZjWTV
X-Proofpoint-GUID: r6kM98rXkSWu7NykUh8bz5Fm8dvZjWTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060158
X-Rspamd-Queue-Id: E1D514DDCF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106141-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.47:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur-crd.dts |   4 ++
>   arch/arm64/boot/dts/qcom/glymur.dtsi    | 118 ++++++++++++++++++++++++++++++++
>   2 files changed, 122 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 35aaf09e4e2b..8d6ea857634b 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
>   	};
>   };
>   
> +&iris {
> +	status = "okay";
> +};
> +

generally board enablement change goes as separate patch, not sure on 
this though.

>   &mdss {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c47443174f97 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom,rpmhpd.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>   			status = "disabled";
>   		};
>   
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",
> +				      "core_freerun",
> +				      "vcodec0_core_freerun",
> +				      "iface2",
> +				      "vcodec1_core",
> +				      "vcodec1_core_freerun";
> +
> +			dma-coherent;
> +
> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1943 0x0>,
> +				 <&apps_smmu 0x1944 0x0>,
> +				 <&apps_smmu 0x19e0 0x0>;
> +
> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
> +
> +			memory-region = <&video_mem>;
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&videocc VIDEO_CC_MVS1_GDSC>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx",
> +					     "vcodec1";
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
> +			reset-names = "bus0",
> +				      "bus1",
> +				      "core",
> +				      "vcodec0_core",
> +				      "bus2",
> +				      "vcodec1_core";
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +
> +				opp-655000000 {
> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_turbo_l1>;
> +				};
> +			};
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,glymur-mdss";
>   			reg = <0x0 0x0ae00000 0x0 0x1000>;
> 

otherwise, LGTM

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

