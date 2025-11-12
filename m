Return-Path: <linux-arm-msm+bounces-81464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E135FC53109
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78C91358424
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0313C33B6F3;
	Wed, 12 Nov 2025 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyOIr48c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPg9RSi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3933B6D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762961052; cv=none; b=mN3gtSHDjjzSxpamwHPQPpiNnNdPMI3Zakn5tFRLLCgjzb5AR57d5dYEfTF3wgQMQmSauJUAub+6P9lJ1wxsAWVzy7Hhk28DgHTLlRMLLTM4zosYPlAO/3Y29rlVfjMRdboojc5QXI8w+gWnnbvifPqJUBLiiV5kfTAGTvdHoC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762961052; c=relaxed/simple;
	bh=usTnuHJtz1Fz0mFW9SJRLD/bL8QQaZ1NZaYRGimhwQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8RmHx6H/9/Hyge2QXqvYluRRv6CcrJ/IPfXyCXh+751o8iySFtmFTIiqLmfO15lJeSD/VXrX3chpUEtaZOhl0UfXq/ZEavxRjjxg285K7tz12Pc73i5TO/r9nqXJX5seLPqCpTVJukWyu0j0dFyySwHrhXzPZXZVPpjRxet6ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyOIr48c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPg9RSi1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9Chq9510697
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdkh9q01QZj84qM0SwA04CDi0gVaDSq5D6Z188vfTpI=; b=nyOIr48co+h+o1Cz
	HygO/wJc8ZHCMfgKx0gjfjMvZHul+p0ZowGi/MoH24Y2jHUDNPCI67gh2tBExAuF
	zCt45lyCHifL6newdSlmVb5C6hHIZx9XRuDwdYpXzAwKclPyQ6SQK6SuMQaz5AOj
	9RWl78903N2EQZgofPPAQ+BHMQAG812EqO0GAtxRZ2NhNmmwSJHmBkxEWHRiJQhA
	dK5/ThsHRIoL5lpUDve1VSYPl8ErEP5SHa44dvI1DFVAnU1GEMg78u5veAneg3ij
	1/XsmUe/Lo/OHwk/SiHRuT3gv2JrcfCAWYDLzkoVLEpICMIXxQxArJ4LloMBjFl7
	4KdzLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdgh70x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:24:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c261fb38so1942559a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762961050; x=1763565850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdkh9q01QZj84qM0SwA04CDi0gVaDSq5D6Z188vfTpI=;
        b=aPg9RSi1P+6JJMt4Bha4hOnqc2YhxrhkDdada9z/AIaIu/0ZS10DxY8OocJfqTw/im
         F0D12pqNdyAHcrtuKxytcfvUs5sXI/Pd2XlxQElC5i48Vlb7KHHHyiCMjYqM+k8CCBMs
         KmktJ9lEbDUkZTR3Guywiz3sOaUaCPFRI3LuL8J2P1FzmxvHqkDOAM3MoxyP82TRn+T/
         /NpHLvOt34rS9/qxL+DZkO/IVpw2U9CLx5YJJOX231XZbtKzz/gHWyfj35OKP8W3etrJ
         hmfg/OjX6PLhP0j/ikEuDZzVeTwmWFadkbhc7XklRqNTlfE+AIuDUgD2q2lVinnb/P/s
         QMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762961050; x=1763565850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdkh9q01QZj84qM0SwA04CDi0gVaDSq5D6Z188vfTpI=;
        b=UrOG6XA0EyelQiNarVd1sOeEjBBQR7DcKES5MAray+OVo9ol+sYNcUMQ85m5vhPvwv
         00SDeQSTcBa3GU8tOVqhW4dSmTXPwmKRX/yu/AQukVHRP489m6ml48cfyBB2mB+HYjdP
         as450jY5RGbzLhuumic6DfX4NoYrLr0WLfBDFdXtprEKStX4upCEZOjoQSgD62OQ1Dil
         Lt81Ej4S7d0hBd4Q0wIwwqknvmGT9xVbPmuak2ojPMCNau+JTIdUcOABEGix/ZvpB3KA
         IpFhKdKfBlLwGo35Ci/B+z2iatxIWrYsgbltCwPkutBIrn/yqsVn1VfCmcPVBSVThcin
         amlQ==
X-Gm-Message-State: AOJu0Yxmb3fxACefQDwX0aZlwRdKAxzV5/mXf+dg9fAXCjZvqYMccLif
	sryoLyb/kKYDue1MKciiuMM4u/japSZyDIbxYtXhqpyyrasW+8WrSAQ1I2sVZOf/l+uXRe8u6Tf
	j9MI0pTbRdHnPUJDq78wbZywLv/Nc0Isa8MIBpI5l1E+4PK562QyVx5gUXbb0obYVbCe+L0Jkvs
	ET
X-Gm-Gg: ASbGncvqoOgDme71K0PMRE+AgVwDJ76UbwPThkwHbvgarycmJvP4qMEqAPrLXXN1IqY
	TLtDTBVL18gwSNObQy5uoGBqUOVoNlHKNwaeLy/+NVT1R5Nk5EzCXXE2N2qgF1YJ3cOtCmfNs+6
	5szPGB40W4Hy/bIbBV/bmpFkmtqnkX28lC65edG67HvQJxfB8XTfqarvrLblTLpbli+IjqvOeyz
	pj7muCNS0RNAtOUi0NGfHJt165TPi+67LbjvpmuPiz6YZRwweyAfz9MEKB38+lalJ2d9hxlYWx1
	h8JVqxCcDXfye1HXlZuReJYILOsz1blo2GFL9TCCWEj5GMmpDJfrFNywJeQFul07cBHw8t0PDDq
	5KspUJGxfgkM/ip5s6qPAnStzpgAtYQqT
X-Received: by 2002:a17:90b:2dca:b0:340:b152:65c0 with SMTP id 98e67ed59e1d1-343dde8b78amr4377267a91.26.1762961049666;
        Wed, 12 Nov 2025 07:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8mVyyxybDIpgRW0JbU3tFRvdQFBdXI1yZP7qme4Gqt+0BL84cd+jtP2J4tTiW28FMBPTCrQ==
X-Received: by 2002:a17:90b:2dca:b0:340:b152:65c0 with SMTP id 98e67ed59e1d1-343dde8b78amr4377207a91.26.1762961049087;
        Wed, 12 Nov 2025 07:24:09 -0800 (PST)
Received: from [10.219.49.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07d2e4asm2944260a91.18.2025.11.12.07.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 07:24:08 -0800 (PST)
Message-ID: <49fbb3f6-706d-40dc-a242-c3d6a57898eb@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 20:54:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0
 compatible
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251105-knp-audio-v2-v4-1-ae0953f02b44@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20251105-knp-audio-v2-v4-1-ae0953f02b44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=6914a69a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=x8bQnJUcN0kwi81saDsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7NqV_xJCVEaNhY5mEN3C-drZ-I4MuqSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyNCBTYWx0ZWRfX0AglY1VNYRY2
 chWohy8E8ldXamPxVh1d+SGBxKoWHVekz4R2UyJFUXw4PbAY6K+OzFIokTxJiJTlTSWraOXqAr9
 tPEVwIK8xOa640QVZK4hWF5zo/6hUSpV/UwOaGejQBv4ITLGqiG3p494d+HqvzMhlKH6Ks6pwzq
 XtIG6EIHcI6h2ZmLI0GRpJ/E5QpvhIfaeuIVL16oEZH26awV6kg4S+fm0sEfBvq32Fo8SC+RyW6
 CDlHEIdGFqw4xK8Eh4JqcIOEyrOx0WSbxm/Mo8GO3eQxLF9EL57ZK87AORh6kD/QZsk0JVqym1z
 8YlUArmm3oeynCCVz781OVEaiaojSLWZwCcmT6wqBaaU5zxbggzDBWQDPkrZSu3/Ctz0Yx/uWO3
 UKHSqN4g114mBiu4stNz1NgE8p2jXQ==
X-Proofpoint-ORIG-GUID: 7NqV_xJCVEaNhY5mEN3C-drZ-I4MuqSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120124

++ @Vinod,

Hi Vinod,

I missed including you in this change because,  some how your name 
didn't auto add to the list when i tried with "b4 prep --auto-to-cc".

As this is single change left over in this series and having reviewed 
tag, Could you please help to pick it in the next merge cycle?

Thanks,
Prasad

On 11/5/2025 5:49 PM, Prasad Kumpatla via B4 Relay wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> Add qcom,soundwire-v2.2.0 to the list of supported Qualcomm
> SoundWire controller versions. This version falls back to
> qcom,soundwire-v2.0.0 if not explicitly handled by the driver.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
> Add audio support for Kaanapali MTP boards. Introduces supporting
> dependencies required to enable audio functionality on MTP platforms.
> These changes have been validated on Kaanapali MTP hardware.
>
> Changes in [v4]:
> 	- Dropped merged patches.
> 	- Link to v3: https://lore.kernel.org/linux-arm-msm/20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com/
>
> Changes in [v3]:
> 	- Correct SoB chain, comments from Krzysztof.
> 	- Link to v2: https://lore.kernel.org/linux-arm-msm/20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com/
>
> Changes in [v2]:
> 	- Addressed compilation issue for lpass version check patch.
> 	- Sorted compatible string in machine driver.
> 	- Link to v1: https://lore.kernel.org/linux-arm-msm/20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com/
>
> Konrad Dybcio (1):
>    ASoC: codecs: va-macro: Rework version checking
>
> Prasad Kumpatla (4):
>    ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
>    ASoC: qcom: sc8280xp: Add support for Kaanapali
>    dt-bindings: soundwire: qcom: Add SoundWire v2.2.0 compatible
>    ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs
>
>   .../bindings/sound/qcom,lpass-rx-macro.yaml   |  1 +
>   .../bindings/sound/qcom,lpass-tx-macro.yaml   |  1 +
>   .../bindings/sound/qcom,lpass-va-macro.yaml   |  1 +
>   .../bindings/sound/qcom,lpass-wsa-macro.yaml  |  1 +
>   .../bindings/sound/qcom,sm8250.yaml           |  1 +
>   .../bindings/soundwire/qcom,soundwire.yaml    |  1 +
>   sound/soc/codecs/lpass-va-macro.c             | 90 +++++++++++++------
>   sound/soc/qcom/sc8280xp.c                     |  1 +
>   8 files changed, 70 insertions(+), 27 deletions(-)
>
> --
> 2.34.1
> ---
>   Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index 95d947fda6a7..1c4b0bdbb044 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> @@ -26,6 +26,7 @@ properties:
>         - items:
>             - enum:
>                 - qcom,soundwire-v2.1.0
> +              - qcom,soundwire-v2.2.0
>             - const: qcom,soundwire-v2.0.0
>   
>     reg:
>
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251014-knp-audio-v2-9a37752cdc15
>
> Best regards,

