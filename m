Return-Path: <linux-arm-msm+bounces-79986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F5AC27AB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 10:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BCDD3B4E92
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 09:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765E42BEC3F;
	Sat,  1 Nov 2025 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvOjFWuN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlfO9Sdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0342874F8
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 09:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761988741; cv=none; b=Xbu4zsnZ6UrcGZNy1+dRjoObtcxyqU1EmuZFYV9buINqA6nP/eTHxMl2lTV33BtW4njGWxuoI5yYG6XXXpG5xYz3Z+4BRRfpAd1zjiQuba07jD7Z9FjDJnOBdKpw3PxOJFaTFdfSGHhHo9Ur9bv3VapnlbS3MA6Llyrn5lPfRKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761988741; c=relaxed/simple;
	bh=VpWYb0GBHZvP7olFcbzqJupOGkhU07xedBtpg5E3AlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cq7HoyXEUPv2g7e5rSe3Oh/HEa79+d7Q2XoWfNHUif7VshDJHAjbxDs9ZHmdjGBEn6A3RbDlPd4nUoJgeSYxZkLjsngS6l/p5Fise2o+qMKEmxRRUg9EDPNixq5+AK4WxJ8Mjoif7Lng0IqB0rsO/QjYp2EAHxWIREUKvImSgh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fvOjFWuN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlfO9Sdc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A14dnKn539504
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 09:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B+bpAKUc3ZHIXmPuXhpnOMle
	Il6MBiJm7MdnfHBg2IM=; b=fvOjFWuNpYCpyelIV1lFlH95qSGA9Yd5tv/N2sqI
	EptG1NtmlPGxSJ+Nj23SvjaHML3YycsafMJ52vAa4E6fhSHPUCgpU7kM9R5JaurC
	ScYlJL6Kda3j2hEhPHHLwm3TyvviBgoVYwxjTXMxo9ARrmZ6ibuqQMTFFtcAJGyP
	q5nShEhJWy5/KQzd3geHhA5HruSpgIinPTQ1/ouI4D7jllNJCrQemgwyzIjY6nZb
	LtqEvpWE5UIaTCvcdP7jRNNu+4HCODeN+CD91RauASylVHPdbHOg3jlO8HyDqLex
	yMD86Ru4jNtlKmL/IlU3rr/2rF9AS/w0k+6ECwHdEO/Ygg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm0am8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 09:18:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8984d8833so32989611cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 02:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761988738; x=1762593538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+bpAKUc3ZHIXmPuXhpnOMleIl6MBiJm7MdnfHBg2IM=;
        b=GlfO9Sdc2TB5bZgLt0vdIxQcY85VOM7exB6S6UN4eRKyN23qutEu178QuWQqOrBCXi
         6BQF61ihZ9M+2YUbhYNcctAF3qzvpCD/vVJo4sRsJcYXL8358ZYXoAO5XEb7td+cvdUh
         avYtAhpihdiDHPdqxmx++eTcw8qIbsOLkEIXxG+dI69OUoCrosPHKitA2s6HM6bTVXS4
         QQQT/YC2g49ypPrMRtCw2prgkb6HvWtdz5cPchYvgwjHUz7dYN/OG0m2Kc0MMzhrcN9v
         IzS5v8mDKl6Jq/1JngVdOVGsARmsUOlLUIxfBofaDcNuoXEQgBV+cSKAZSzJNntm1Cqs
         cNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761988738; x=1762593538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+bpAKUc3ZHIXmPuXhpnOMleIl6MBiJm7MdnfHBg2IM=;
        b=ws9MOC3XnpuYvCkyk0+LNg0e3JVhQbzQtJEJ8oQdxOzjVayCqrYslN0d4lSFJ96DrU
         OU2E5v+2hMhj2qtphwpCPFMc5fhIY2E7tCVIx5sl0bh35+8Az4w4VfqRTl0HBXAxq+WI
         +vyXA32kGmb48bMAZ+z3g4Wmh6OcjWL0lx3BVTgQm4O5EcFbDqYa8Jnl79+sJVXoIVou
         R4ZpYur/ZIVRmu4VZGKA9kWSYpLVCycX03B31xxukKcwsRIgcJk1KW0EpxsSXxq6cCw4
         ydg47iV9HHMzEzVvFxJHXKhTvoIOvDcruN85AG6pAqNm2t/k/QMW+ICr8QegN/qqK7j5
         F7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxj0SXU6hqSFy3ERjwLah2NpKLCX0glsMIQ2EQtF1foPWtTCXNmIBPHOzoyhSmjfomG/aceECGNEpvEtU2@vger.kernel.org
X-Gm-Message-State: AOJu0YzDCD6QZmPjU35x1TuqWAshC8IcmAJ737svV+uNNXcMt5eO9xWC
	UoX7ase/3DDtNAy8ti02+AWaVI/UanX3NGxFRV5KGqCp/9JBGi4BVrE4b/XZ8wAaoyMXDkU68c7
	7qZRSAz5g+Inj3+UH6Ti4T0yX+vXZPTRW4QDhxgl4SpR/aZEN4tifgyYtkfmNoopV2M+Y
X-Gm-Gg: ASbGnct1nC6CuXEOQ7RUrD9Pgk8Z3ccoUxLGNumVaNWo0QHyQswVbBnr9zWbeUMkSg/
	2KP7OU0Oe7LugnCBB3SgfX6mjyVRMgOcgSOgd6gJcrrmqB5t+XagwnUYt33xRK8JzKqHEW7U1CN
	Ub/WDqOl5KvLLO5LCc3Mtm4+g8gDnHa40LMVzCh1y0I4UCpJUQI/BYnQgzaVayoJVLV22ShbQXL
	T9vau5DFbcRLjSZyHi5V5eF74ruFmfZ6xzKWP6v8q+llsn3fplO85FHOSJNoJum6bKGh1q0eQU2
	nOSJ8z+ZlcgRO2BsEMjNpot3Kv5Ojf3nO/ixF+l85M6WBnVeRiEut0AR4TH9PDuh0AZZ0qbu/M6
	6wjT3OTojKW81wMStqer+4I6F2UKWLyvT0lwJhazwWCH5jcdpt4R1jWXkZJ+L7tozVIKwSI6E7U
	mcIt6m+3zlYods
X-Received: by 2002:a05:622a:134b:b0:4ed:1dc7:e3de with SMTP id d75a77b69052e-4ed31025a3cmr93383571cf.67.1761988738026;
        Sat, 01 Nov 2025 02:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/ZC9hJig1xqZrbF6M8bbhMPgx0iojM3JAN3ePV98F8Rm9zEys8LTFYeIZIvoosK3Z9UrajA==
X-Received: by 2002:a05:622a:134b:b0:4ed:1dc7:e3de with SMTP id d75a77b69052e-4ed31025a3cmr93383341cf.67.1761988737536;
        Sat, 01 Nov 2025 02:18:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5b5a5dsm1076632e87.56.2025.11.01.02.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 02:18:55 -0700 (PDT)
Date: Sat, 1 Nov 2025 11:18:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Amit Singh <quic_amitsi@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_riteshk@quicinc.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot'
 function for hpd gpio
Message-ID: <a6fbpfulyhbnfoy2d6wf7hl6de3z34gxcu6f4lby7ncsyu3f2g@q6qcvdid7bko>
References: <20251031085739.440153-1-quic_amitsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031085739.440153-1-quic_amitsi@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDA3OCBTYWx0ZWRfX+UDOl2x3AOau
 xZv9FH8C3ON+173Nv53CubQ/ulpnOQMw3ndZZdYpgb5bTJO8wS8tq1Oql0bGYThElq5JEV5sTZx
 K4p4mwsYwlu3GaWfTEKAMMrewH4yazvSijKAvZdosE9QTnX9Pl8/AE/Kudq1keXCH5kWaKSsUr+
 G8FqM+OXYpXZwUdgvOxjWzkyRxDu18hxoShUETy9Xw51qp0gCfc6JBrddH4k4gVTZWITl8Cv6o2
 9YklfCLdxq3vdwQEDfy6eCr7jID1Tw1Y8RaX4f+ajr93XtKxNWHcvuB9jdyelf/7u4Lg7nx7BIN
 p9a2psNg+uRxSK5D/hMb559GG6fkRfqY9EZ9WJhefBJh42JMCx4xI4mYsK+KzJc/zkCmu78EMqY
 miyqwYeT++qFOYI8crHeQA4PsOPV9A==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=6905d083 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=JMR9WPqkSgFmUmKnNZwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eyNwQxUJOHyfjtXVtfGFQOCdZwSy3ZAg
X-Proofpoint-ORIG-GUID: eyNwQxUJOHyfjtXVtfGFQOCdZwSy3ZAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511010078

On Fri, Oct 31, 2025 at 02:27:39PM +0530, Amit Singh wrote:
> Currently, hpd gpio is configured as a general-purpose gpio, which does

HPD, GPIO

> not support interrupt generation.

This is not true. GPIOs support interrupt generation.

> This change removes the generic

Documentation/process/submitting-patches.rst, see the paragraph around
"This patch" words.

> hpd-gpios property and assigns the edp_hot function to the pin,
> enabling proper irq support.

What for?

> 
> Fixes: 756efb7cb7293 ("arm64: dts: qcom: qcs6490-rb3gen2: Add DP output")
> Signed-off-by: Amit Singh <quic_amitsi@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index c146161e4bb4..caa0b6784df3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -49,8 +49,6 @@ dp-connector {
>  		label = "DP";
>  		type = "mini";
>  
> -		hpd-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
> -
>  		port {
>  			dp_connector_in: endpoint {
>  				remote-endpoint = <&mdss_edp_out>;
> @@ -1420,7 +1418,6 @@ &wifi {
>  /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
>  
>  &edp_hot_plug_det {
> -	function = "gpio";
>  	bias-disable;
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

