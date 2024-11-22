Return-Path: <linux-arm-msm+bounces-38854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEB9D5FC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 14:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61F591F2249E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4B93C17;
	Fri, 22 Nov 2024 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLrgyS1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58523AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732282365; cv=none; b=F/GWAjKLvqr201Tqocal1bnVIHhfW433tGGnOqvbQ8gFpamJBW6AwyALgI1uoEnolUTF27+DaPzMQBVzcRZ/YISgsZHRRT6PO+kgKRk569CopRnzPJsA90ZhVrx4ipieeWwQkFP2EOScSiZJBAT73keKCW6C3kUDMnArd4blhJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732282365; c=relaxed/simple;
	bh=QunPnbf0xVtgUmtvlwYZ4OjpvqL68OeWHfONZQcmhRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAPl3CfASxyEtHRHH+pLw04dzB16EAqa75mEtoDnaDo+VUNQuGl+zP5npSGBJAE7GbyXSZF20J5HRPjAVCoGxoHR3TVz7m4xSyByWs7JTaZSCvq8NuYv8lMzL/hnOyk4LBoqq8meegfQ8hr00SyUtNuVfPAOTPtbGYY58yuiaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLrgyS1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7Px7Y023179
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SlWBCRiGH4qgb/LdCPP7xOCkPJR6Xa67WYb1u2GOSI=; b=aLrgyS1cU01fZQd9
	cQARyLvm+bzDwhN+cvVmJj7MKNi9Hqxh7xOyShQLlRASesTQMWqcX2zLISHWiH/w
	9tUtF4FCPgaVCz6OCGE0tMZRCPGxOAwmNcrzN0HJLGCv0aKdsvuZVLG+cI/D8NgL
	lwHSuuXICh3/g5MgKV0qrK/jBytAEAb0UTWhGuJcFlo1ZReolqGQERP7/qTCvIgI
	tz7u4u3hG3f5DZhJ5TmsN+hk3dXcmkXU9SQwP1gK9Uh2VHk53S1ryA+khRgP1L7X
	NpfjZtyGq+D+NftpNnZnc3HHbssesqwih85zNJXu8Qx33Zj0h+o2JE0zBcDTAM2d
	pOdHkQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk4bf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:32:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-460e81465f8so4703101cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 05:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282362; x=1732887162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SlWBCRiGH4qgb/LdCPP7xOCkPJR6Xa67WYb1u2GOSI=;
        b=b1XiMoohARF0gf/u36f0eoo3ZTPsHSIku9CorhZTd5QDTR721zEonp0axyXwMJ+Po0
         qzVtrW+GH+wIPdYhzJ+AAUVrZMLk5rZpVsSDuF0jGT1n+SCsYXtA1Rd/ZWu5ITsBkl6Y
         JP8ozURaBTBTv8LkuXALyiyU7kEAI4EIHQCLLLul9pTpj9rAurzmXvszSENA+LwArm7S
         vOuL/a0GlO8LRui5G7cY10liuQPsc+gOY8QFvmZKHf+0iyIcXZEg6j7WE48RR2k+trWE
         3UbPoajgnm7izvDn4H7KMMYwIv8KKW2Mb2lx2sBF1oR1niUu+mCjsIyOpzdp62AG2nyY
         HF5A==
X-Gm-Message-State: AOJu0YwZu1cPUSU/xdyV1BZDL19+UrsIJ8V4qUfK9uZjjz8nTkxiBhFH
	e+VrTCvBo1sFnS/igr1nsYmLUiQfV3rZ60chEpCZaCyWGTMnxfu8XnUZvZHY4gNQOWEynSr2fTb
	w0GZ1AHtJyfcGHGQEeNc3nBRwFkEVV4NoBwuuitUXTDqJfawEcVXt+TEs5drHI8Np
X-Gm-Gg: ASbGncsbK+KWpBd5xsaGQeuU/AjYhSUbd2ilrzDRtLetpjDEfttICVOXpyZiPegYO4K
	+iOkx+kZcCbQUYbV2I3Mc4kw/Qz/I5o+hh+4DwyVNd/G61xGgasQ36nHM44aLNTccNYXIA5sSg6
	6uek60lYVr313u7iw81Wc7dKfhzfNGpHBfhF+E3PDlsUiVYXdSiiURdibGvQXQVKQm2bAZ1dYav
	/xWIQtRJv8Pq5CeBkLgccLyjMktfsq//sZvKjbj1oBtR4kpCr1pE1HDhQwgUWkMZJKewf32TWHs
	RKVpDy0oU9TVaoxO3mZt0kTnLB0i/18=
X-Received: by 2002:a05:622a:3c8:b0:460:3a41:a9e5 with SMTP id d75a77b69052e-4653d62fa60mr16934651cf.13.1732282362281;
        Fri, 22 Nov 2024 05:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVf3O3jfV+1QWDBQ7DzPfL0PVS4kp8Bcv2BSTm+EqwdcoTXZJp32T0/6sMGFnYNedbZPT3iw==
X-Received: by 2002:a05:622a:3c8:b0:460:3a41:a9e5 with SMTP id d75a77b69052e-4653d62fa60mr16934391cf.13.1732282361868;
        Fri, 22 Nov 2024 05:32:41 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3c00aesm916730a12.43.2024.11.22.05.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 05:32:41 -0800 (PST)
Message-ID: <211af8cb-6cc1-478e-b981-f88f70733872@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 14:32:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: qcs8300: enable the inline
 crypto engine
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241122132044.30024-1-quic_yrangana@quicinc.com>
 <20241122132044.30024-3-quic_yrangana@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122132044.30024-3-quic_yrangana@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jxp-7_ho6VUj38IJTGu3-BkNPc8yUJEa
X-Proofpoint-GUID: jxp-7_ho6VUj38IJTGu3-BkNPc8yUJEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220114

On 22.11.2024 2:20 PM, Yuvaraj Ranganathan wrote:
> Add an ICE node to qcs8300 SoC description and enable it by adding a
> phandle to the UFS node.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Getting *a review* does *not* mean I gave you a Reviewed-by tag.

https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 2c35f96c3f28..ab91c3b7bba6 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -685,6 +685,7 @@ &mc_virt SLAVE_EBI1 0>,
>  					<0 0>,
>  					<0 0>,
>  					<0 0>;
> +			qcom,ice = <&ice>;
>  			status = "disabled";
>  		};
>  
> @@ -710,6 +711,13 @@ ufs_mem_phy: phy@1d87000 {
>  			status = "disabled";
>  		};
>  
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,qcs8300-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x01d88000 0x0 0x18000>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		};

Although this looks good now, so I'll allow you to keep it.

I won't add it a second time here to avoid confusing the maintainer
tools.

Konrad

