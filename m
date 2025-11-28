Return-Path: <linux-arm-msm+bounces-83752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F47C91C83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 545404E36BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DB430C354;
	Fri, 28 Nov 2025 11:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3FepLsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZDtjxFn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36DD3093B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328963; cv=none; b=Ein6iTZ2GvhZIP4+g09uyiQPya+HCNLOAukEPfyHFkYPmdMGDx0RbRtncyYkNRKR/W3qE44M7Zz0VRIeGtspALbtIJFiwkFPJjG2uOi7s3256USVDuSHS9MR7dCTAx5QiZleQirmOJ7aGKthry08efhdNSD6gjyruUUoZePVWJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328963; c=relaxed/simple;
	bh=QCOTdXE0lArlNpLd3aypqY6iWJag1nBxJAj5Q+Sqo5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oa21p0MXpSxpuXqPxeFagYLpPMFxIyYFpz4BTgYHSTFjyXI43WlvxKEsHhX3FYUJ/vDwJghmOIyPn49uWQ74ECUwlPl/6W3WITPI7p43sMkVsiCxb/FFxuXnziDWKY63QguVmMCUXB6P1O59ZCpCA5kUK5kbQey8ow80OcOQdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3FepLsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZDtjxFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OMiZ3967413
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+PUl/m9D97UXikkb2Q6BQdXzgXaQFRhIIryVPZpqCs=; b=S3FepLswzwuwqqzG
	pByVNsmybIsOiXhBpwA5S/HTKAbiJ5/PxokBAfNnIb9dOQ0PtmasAoBZyG26+5eg
	QpLvKh9QFLPDJZEgbG2cAxG2Hpb0U6D3jTliwQ2jlL7sg7OSq5gdSakcLkc8d+Jx
	xZw+dkz4ex/OMAH4T2J8VL3DiRiYVcBDa2D3C1MRjOY7+TO6qvnvDbiojWGZhsFr
	/07fA3qTuysycZnTOE4HrIYJvWz8gF2emTPa8WLA6YAFkrj25dQKIzPXMcOUErcM
	Oh+No7l/1/pf40j+lfUFNeCT6gBiVx13TAGZECYQGkWxSfpbgPlX2UxHCm3y0VwA
	DpknBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5kbke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:22:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed5ff5e770so2416321cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328960; x=1764933760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+PUl/m9D97UXikkb2Q6BQdXzgXaQFRhIIryVPZpqCs=;
        b=eZDtjxFnNajVYvxYsK7lyWsd1gGMLvE2VK1+ElSlFuQMLubwVpVgICfAbvaVxz3TZk
         p+RJMr7lRvsjcGZAxxVM0PMXebLWxZW1voRSyWFcooDOYpw0caRNmt6UK+A5fUPmaKLr
         ClHqSQiM53GEctYX/FjYp+y5T7I6J1HGFMqU8XvxsUCfGntsO1nk2phsvYaV8o/i4tdm
         85UJoiW8m4vER8hdCslAhLLM6ZCsHxAH2U7U04JC0w0C3jbIV9vrEdMKC0FPV2fgUcP/
         lbGRnqbrtixgxsGi8fX+4c+aa2mBvpfmoA4eOuO1tG2Jseo2DLfFCbg/zXcoyDP/7r9S
         UhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328960; x=1764933760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+PUl/m9D97UXikkb2Q6BQdXzgXaQFRhIIryVPZpqCs=;
        b=W8V1c+i/ZpsDyJVtNB1W756R0h8fMsqX4ZHdCjjQ6/LvIRVEqFQeiLiiXAqlfaFDH+
         U/6vsQ63ls+D5vgzs5uc2+8FuCoPCIiwOzogfkdzUf+lXPx+Zdry4XAAlBbQ9djAjKUi
         /Mk/ovm3usWJ2rx8HFr6wxX+AoKzqLdz4SmJtUa7Y6gx5/Va06R3glvDIH6+cgcRTdXg
         BGbj2NtJ1EaojJjLmMNRsCOjSRjeJdDJ3nGq+GSWpftp6vxQnUVDZmdScLqkOTjclb2g
         hg5qz9fAt1s58hHcWM8vhCj9UlRoUiSfRCUNFdtw11g2DsBYNaHI9ZcacaZxliEdmehr
         ftEg==
X-Gm-Message-State: AOJu0Yz3ZBaNywoZEZrgwjcCV30D+p2DyqY4TKJAkQj3mnd7t6uVFKKl
	vGeAoZUnSBRjUJUmJ1axTYLTWrmISC7VfKN+7xRglCd446FSiS4b0i0ixsyffGeZJWOLVwlJaJo
	MFdQ91MrYUW1Lyt2AcZPORMX+0k6HrLS/uFZOjW66iO5Cs0IVtFx9OfNrn1owTzaud4tM
X-Gm-Gg: ASbGncutbBW8/rg6H23iRxPFMn5ujCLqxPPu2IKDG+a066RGDvCBhuxJQHkHazLhxK2
	SMnhSh/QvFQBCh4RpQOAayhmn6+12ZqMXiiFhJe4gFgS2mzrI5D5A5RNL/nQT6KiwPPedbOx19s
	qsqAVHRo3W2q9JRG2aE9fQcHeKwi0o4ZnIhCChh9op30HMA2hKfLbGa1jnlTgR3entdFUzb1wg5
	qnneAU8YZty+td11dUsAyMWqWKlFY6QSm+RQvt5L9ekM53vNNKh7aDRHrruKDHSpwHvXsZps9gN
	vGkIvV1jNOX4l1mu7nC50IGIjU793KnX4K35I1shWlQ35c1fa4oBlaf2wHUh8zmMkv9yqP0H84u
	j79ESiecXFZXbS2GMIstFKKFWhXJsRElPXta0xD+ZJz7qRX7B6X6PCrMZ8Ku4raBMoiw=
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ee5883a43cmr263271311cf.1.1764328959467;
        Fri, 28 Nov 2025 03:22:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj5lcs01/6XqZsn9JnDbO1u8XQP0sdJa67KNdRh14wduierNC8EEBi5L/2K8IUrtBUuOnTWw==
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ee5883a43cmr263270061cf.1.1764328957510;
        Fri, 28 Nov 2025 03:22:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e8f4sm425666066b.22.2025.11.28.03.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:22:36 -0800 (PST)
Message-ID: <75bd37f9-8282-41c7-943b-f87fad76baea@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:22:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251125033311.254869-1-le.qi@oss.qualcomm.com>
 <20251125033311.254869-3-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125033311.254869-3-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yV6i14gV4UwE9IA1CLxzMk5YwIA-i-ef
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=69298600 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GiN-RvxsxEstmNQ0fm8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MyBTYWx0ZWRfX9e4pkJKtahpW
 MRQrnF1sd1OaH2xaGLf2C1oWhYSuBuIEwhICM42q0Viwg4Lf8JBPvTrvnYcjxO7NQkioqaHLjye
 VEHXVkIQmXc64VrJDj8kum5lQywvEKtseNDT7hrtoBkY2h+/W9XvQA71I5IRl/riRXPz9X14uVm
 v5BqpeWi5hT8sPMUGSsCGyDfIkO1P0FLnStHzkaN21HlzfPdmRqF6wAKfyGXwbSL7YbaNb3l1WP
 AUtG13uVPiej9X+Lf3R7YNprZTKcZtJWRPzMUh376z4Mnp5Fw+7yYzbfHrIUHDmYxCSBfC87QSy
 RNqoJvNalffBw8k7U1dnCWNALYJP60qINrk/NNBpF0mneFvlxDSDh4BPaYCLpib42zhuCflwYpg
 BawvBCuHoDa7eqKZskoHqNyEAX0sTw==
X-Proofpoint-GUID: yV6i14gV4UwE9IA1CLxzMk5YwIA-i-ef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280083

On 11/25/25 4:33 AM, Le Qi wrote:
> Add the sound card node for QCS615 Talos EVK with DA7212 codec
> connected over the Primary MI2S interface. The configuration enables
> headphone playback and headset microphone capture, both of which have
> been tested to work.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-evk.dts | 54 ++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> index 8ca0699e3c40..3f382fb6d1f5 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>  
>  #include "talos-evk-cb.dtsi"
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  
>  / {
>  	hdmi-out {
> @@ -18,6 +19,46 @@ hdmi_con_out: endpoint {
>  		};
>  	};
>  
> +	sound {
> +		compatible = "qcom,qcs615-sndcard";
> +		model = "qcs615-snd-card";
> +
> +		pinctrl-0 = <&mi2s1_pins>;
> +		pinctrl-names = "default";
> +
> +		pri-mi2s-playback-dai-link {
> +			link-name = "Primary MI2S Playback";
> +
> +			codec {
> +				sound-dai = <&codec_da7212>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		pri-mi2s-capture-dai-link {

nit: 'capture' < 'playback'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

