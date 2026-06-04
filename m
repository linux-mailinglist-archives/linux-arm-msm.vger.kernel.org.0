Return-Path: <linux-arm-msm+bounces-111132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P7ggKa4UIWrl+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:01:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6163D1DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:01:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fr82q52W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ezDGFx2g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111132-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111132-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BC0A3016FAF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DDD37F74C;
	Thu,  4 Jun 2026 06:01:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0026ED3D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:01:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552868; cv=none; b=VsDuPXBG1s+EgJ6ZBlrI/HU95wZ0zYst6hGzfkHmBy41X/lRR4owQoDeNGs1glQxnDquf9NrPuUvS8dRTukSDtOdRGvbVdKxZUFNBkml2bBmHB+jk01wlvZ13DJs70n3aM/4jYtk0GQOnzPV7c0FslB61BbWEFHLhBDQu6XmUmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552868; c=relaxed/simple;
	bh=MvMbsSGoBafGYAqgnlT2r4yR/KgHACSna2mBXP8Ehb4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qnDvN0nh8/6yT5CIY7WE90CiGXJnlsOHve7HbAcIeUdryylQk8fiJEVM4aW7rrMmeOgSsX9ZNlj/P/MxLJil+AwV/pL1flqnTAGY36L7MdELgJifC+SS1Nzo22SmkptAX3BSrcFOlrLh5s2U41/o1o0GDIG98gpl5b/xRRk8lZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr82q52W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezDGFx2g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65418sXl140659
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Rxy84CQtSfLdf5SWlBRH0Dm+BYAxOch+/SAQBO+pwA=; b=fr82q52WQjC9rp8l
	y1YLPntQJ6LDvPOhZFNfgKMWw8M3pI6lLs3N04QggFm8IWzIrFG2h3HnB9xVOIqE
	XniqPWq6uuCW9kUm41E+4F8W6JtHuNZbfkBBZTU6q/aVrjBlRNfGk8P7LOBSLaV7
	RDX/CL4u4OFvzHfGVCVzbSqbvlAAF8A/tQHfIt9VMkB5JQNXz17Z1vX4uvWCURqJ
	69inmbiUJ2mIhcQDS6z0igVBFj7WZEFL03qybSwlsmR4EKfE0Lxd0nLuAe4DVQ58
	JUiOSYrzWy88teNRTDThSA4UrNIQaQg39Fdeyq30M0OsPihyaMDWdRhkZUWZyAQj
	6nIqvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen8udh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:01:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf1dece2ecso4200845ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780552865; x=1781157665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Rxy84CQtSfLdf5SWlBRH0Dm+BYAxOch+/SAQBO+pwA=;
        b=ezDGFx2gurJgPZlnOz6bi5hn081b/S2BBYY9/xKVB6MI9O3dgQhGkYSxWZG9lTrLE2
         clGKhaqfoM2fcK0rCJEK0DeLJQQp5bMepHPZDFAFwemAkHjYAJ0A6LmhodrSB5tsuz4p
         pfZ6Nt2mDcIsejhxETA2HJqcptozoBDEiTThrDXCltmfkh7GNWHoCPk1RFb/yzBFceG6
         FS3zOYLqYsMX4Mbv5tbsXMsBUjhTyr68m8joQbLJiWMG5aNAZ4XXnwhq/kM68zXllLUn
         G3eHGsWmPumcnpaouALJkF3XcPo1FdQiVFiT0H+6Lmrk/iN7yc62O1D1kF3kRxkkA/vM
         w/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552865; x=1781157665;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Rxy84CQtSfLdf5SWlBRH0Dm+BYAxOch+/SAQBO+pwA=;
        b=dCtjjpGF489Ozlb1F2KKSdUHzWrTVw66S2WFh8uWhgM3g9NAAm6O2gye6VdviPCzNC
         7JzVpjwW9MWsn/nSYOrIyGzmJ8dFsYIoTo8BMiXlUYjZvQMHBfymw7LGYZ3fWxk4pG1/
         y2l2LXbcfZd+UdXd/nlFStaD4CtIsSIV4K+opQvBy+1v+xF+yhG3l5tYDstTXHGdcC3b
         ZBf4XSUYn3N6PhZS0P60ZA7Dw0wSOh7pq9cXJnn1NrE39UfQHn6RuJKlm8GjK7BMgbQE
         WkCm7ocL48ZWpHSqANM2UueAleroblcJUgxO5Izv2fWs1e2y0vZFEMLIBI7y/knVf5Jz
         mupg==
X-Forwarded-Encrypted: i=1; AFNElJ/ono8nzwC84R2g/59ZAI57xTyNx20Zy0+gF2Gb2iBKKZttxd7OxnK2aa3jdpk1bLUOGSi58CS32HsNRMdb@vger.kernel.org
X-Gm-Message-State: AOJu0YxKesZieomM+Gu3pDCS2Im/waz8JpqIBcQ9XEbOyIiU9zNNBjxm
	RLBVkAAZwlYempk5rrA/Beveyfq4+u7RLatGC1fE6XpfBwvrBLy/l/9MtrgnPO0KYhT2n3mC+d/
	LjHPJjqTlvgvXCV5ElyLmmFeQQ5EkTYYK6bDyrvDICP+myDwYCfwKctou3ExV8Tk0HkSt
X-Gm-Gg: Acq92OHFsWlW8/hZZgO/pTkopZOoropUzeTQfHF6ZWTTXnKtbzi1otPCxlBGyoQi6wv
	S8aLNUiK7H9xKVQ7YhgTnmI54z/2HFFVq+cV3Rfu3/ZjQeaJG++TlALGfvv9z2k1WFjehzYUKdO
	7ULsUMLqOL7Ey7n2obA7YpjoaqkfT22XQ4H6Jqr872qYsuCUOLFC0hwXC36DDT+ueNYR20iEi/h
	myFY3K8c0H+UYDqQz400Zh76wCvDxlc9zfcoLiFio8ryA5rA9p4qe4l3BCdTahanBD7YvzzH8Pz
	TBpKYGO4vMWJTGeVe0ZhSH+v0KmDEnmRjaKq6Nx5w3pcJm2VQ0dKCqq3Bk4FyYjQPwbcazHJcyl
	7Wk3aFQF+d5v+fiGd/uXv+sYcFodriW+N2i+tKdWukyTYncTywMhHEcNeG8mdFsBt
X-Received: by 2002:a17:902:b58c:b0:2b9:e82f:bfef with SMTP id d9443c01a7336-2c163fa4e05mr46112245ad.21.1780552864471;
        Wed, 03 Jun 2026 23:01:04 -0700 (PDT)
X-Received: by 2002:a17:902:b58c:b0:2b9:e82f:bfef with SMTP id d9443c01a7336-2c163fa4e05mr46111905ad.21.1780552863956;
        Wed, 03 Jun 2026 23:01:03 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm61450955ad.17.2026.06.03.23.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:01:02 -0700 (PDT)
Message-ID: <2e4ff886-af8d-b9cb-75f0-ad9bc081bf9b@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:30:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
To: Alexander Koskovich <akoskovich@pm.me>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
 <20260529-milos-iris-v2-3-7a763d7195ae@pm.me>
Content-Language: en-US
In-Reply-To: <20260529-milos-iris-v2-3-7a763d7195ae@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a2114a1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cPBJnOxHEKv7ehhu7hMA:9 a=T0nNOjck6VvS5lE6:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: O7UOdY95kKzlU2hVdM1JNbz8AjOtoqHZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1NCBTYWx0ZWRfX5JUvrb+h09NS
 b4Z0F7gDBGtwzFDYKGelGY0y0n96GL32jT/zKU17FG6UXSk9vAIBu1nxxJSl7D5p4fxZYvisf3C
 zCVQSvMmpWYjCTASv1nZTWtcebsdNckzn5qsEuiCAfZfu6UhyDXM/9I2+/c35MVlc0Z4JDKpMsa
 XfQXkodwcJvTnsVIrtOMqyKl4raqQKW6RIvLfg2szWCEIpJnPo9vl+Oy3L+bFLkUdWfMA4g7CwR
 4YCJURFZRi92R5EMrLTm7F6ICUTA8DONapUwEPfdlUvLBUQXk12qybrBKzKlZ9/wPxDP3jWIFK1
 Oh1tKdD5HNVkT4QW5fg3OTGphqVekgch8Saik+K20bVI182Xg7WNlg3aLvQqqIIAGMKTByWT0qT
 Dgtdyad1B+b2O3HrQalzz3Z0dmNLfQ6R4W8uVFALDeR59N+eHB9i8FF9PjMwMT8tzS2FEiHvgML
 5wgWUiYx8ePKjLDWzdg==
X-Proofpoint-GUID: O7UOdY95kKzlU2hVdM1JNbz8AjOtoqHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111132-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,pm.me:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2F6163D1DC


On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..94a3c51d1d0f 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,milos-dispcc.h>
>  #include <dt-bindings/clock/qcom,milos-gcc.h>
>  #include <dt-bindings/clock/qcom,milos-gpucc.h>
> +#include <dt-bindings/clock/qcom,milos-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1835,6 +1836,90 @@ usb_1_dwc3_hs: endpoint {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,milos-iris";
> +			reg = <0x0 0x0aa00000 0x0 0xf0000>;
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "cx",
> +					     "mx";
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> +			reset-names = "bus",
> +				      "core";
> +
> +			iommus = <&apps_smmu 0x1960 0>,
> +				 <&apps_smmu 0x1967 0>;
> +
> +			dma-coherent;
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only enable on
> +			 * boards where the proper signed firmware is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;

This doesn't seem to fully address Dikshita comment from v1 — I believe the
suggestion was to update for the mx rail only.

> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-552000000 {
> +					opp-hz = /bits/ 64 <552000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +			};
> +		};
> +
>  		videocc: clock-controller@aaf0000 {
>  			compatible = "qcom,milos-videocc";
>  			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>

