Return-Path: <linux-arm-msm+bounces-55754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7C6A9D254
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33C787AB13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E4F21D011;
	Fri, 25 Apr 2025 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odvJDZV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008D32165E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610589; cv=none; b=ePfI3hQg95u5Kxos+N0gHirKl2q1KU/3rLFHx+jpbKyNkAfGS9B9a89NUP84IWf+U8VZLiOmLhR1bvWxs0+u0bb9JwwQlpwbeNOV8tUOptGBlWyxhcQlhX53jm14IuguX06mT3Rk62IOdccQRbxV9UjUxV/TAfc0aTyjmCSd6T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610589; c=relaxed/simple;
	bh=UQnjZknLsEleSRl95okCS8FsVusruINcboXIvBDS8r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXEkoumHRdA9GBnWeaglVN6KnaWBMB7FaEH6EZM1HZ2gHZx5+hVYaXAT7cXG5zOFVUDGLfYx8ULUvflo7uqXdU1Tjkvow74e8c/myEdS/YZ60k82tVLr4lr5xlTwSB32npyMn16lIJErY4XYR1YCCh7BZHwNUS6hCVNkakqXe7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odvJDZV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqHi031953
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbKfRiWNYoyOT1BAAZLlKmTT8AJysTJ0zZh9rdFL6K4=; b=odvJDZV2A/+kccIl
	o0iVvZ8DlIoIYpBteBUxgiZW/+6yhpLP1XEC3s6wfyBA4Nao3aLnmzvWYIFM5Z1y
	1eQNl7/2T+toFuC5qDhOg23r/i+ACxa0W/BvBc/q2zB5IxMEGARqHypI9uswXPgk
	6vmK0N/onjClj2cbw+sFY+OCn4gl6TTBjnCOMoBQo7mQQBYG8sr5U4vT1rsdX7VA
	u+PC6i6xj64z+DTgxH9MHkzmoon/Za36+kMpurDaR4ouqCycYX+ef2wmxFTgnVgp
	pIB2h5PdqZD2+VeQGyfWitpsCjpTzNoZbtR3p23pRZKm7RQM5SjR1pWfe/wh5Fnn
	NNv+OA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya4ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766654b0c3so5514311cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610586; x=1746215386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbKfRiWNYoyOT1BAAZLlKmTT8AJysTJ0zZh9rdFL6K4=;
        b=D69PZLDwwf7LHJV2nlyVAAOI2DRPO+6OqSWf2VVpVDTTRvE40cgPgK7Rzv4a6q++i0
         jJjCYynK5J+GkiibMAdhiz/3Xf7bM8ORNgHyuxIc0utk8XXJNxlOFTZGTU95cOYQnMKm
         FNs4BLlI8BU1U+6WHHE7s4rw2wWV/p95rbsDU+fRyxCWI8/OEajbXcZ5ornP+SYcW2fX
         XK62Jih4xT2NKWG2vmXjRf6WOAJZatao8fsLVTQMwzNtFPi0wemyLANovbExMaYthxYD
         yPyUf+z567rcn6/GQ26r2XdUM5UTOXSynlUk61mMVPGmG22tqsBccTzdUbq7FOc7t9y8
         M6+w==
X-Gm-Message-State: AOJu0YwP9uVtmNfLRVtyPUuuDHylFUpUNN4Dw0YMJTStfD/An/zRcPZ7
	rHWhCdtHaxNq+gv3VEaI5a7Oxmc5BjIcrGbrCr7ufg49Y4EhxWs+tv4tujTaoktN807nwhGkCW1
	lQ+xxBafOLj8UG9fS7ps7PgFR1fa66KsGoOpy2pOvc8UYOm8abu5gQVKw/2mtnZH4
X-Gm-Gg: ASbGncvWJ8LsfNkWVTwFy7/1NwvuVENQ+fN24kb4seFM3Ra+DdtDU3Tqn/PUhYewNBE
	+vCTTkmAHm/Q5mRHFRACuCJbNTw/JpJ4QoP31vdwq9QjNtxNiTsbiOwhwW1mPgMID4BC2gpkT7V
	+XT2jas22yJDw+Bbj93WpULVMY8kQX5WXxP9yEP+tE5TfKEz2FW2B7vpMARCvhQRjN/4bKXoOvx
	UzQlsaPJ4sBM2rkUVrkwhLN+fDerrLlDcsbFEvttWhDS+rydqSZyp55INcXinFj+f1jTdzxavpT
	l/Kn/kI6F0qvTnN801/uFDemKymZSa2adQbpggJjA5E4zqmurDapSwnqvTY0TGoOTt0=
X-Received: by 2002:a05:622a:1a28:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4801c796973mr17668851cf.6.1745610585986;
        Fri, 25 Apr 2025 12:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUAJ+nKB7f7Of1hLS6pnMt43pP/HZzyzxGSBCWP8dk+xKLA+rUe3bA/3ZceKj6CzKVXb3HNQ==
X-Received: by 2002:a05:622a:1a28:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4801c796973mr17668711cf.6.1745610585579;
        Fri, 25 Apr 2025 12:49:45 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e58623fsm183039066b.78.2025.04.25.12.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:49:45 -0700 (PDT)
Message-ID: <a6c9feb6-8d2e-4fd1-b59f-b91d3a2ab986@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/11] ARM: dts: qcom: apq8064: use new compatible for
 SFPB device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-9-da4e39e86d41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-9-da4e39e86d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfXwEIh0R2uuTsU 3uKwE3oA5Fg2J/Dj8hhv/8XzXaOYXV08OmrOiLi4ZXPFXoUc135IW15iCw2GDAhUriGCGhGzZnh Hel4bxhTxQV/CtrOnJGvK5oh74UxTztzcoh9qibVS0UB9E3u7xnmlJIUh9XVvnzMcPo9yRTgyyN
 0q9bJGb9fOHAvc+ceSv6E7685JAS4ErwJaWr7G6SSbRM2HcVq8CajxZiR+oFVljaXkjYLjxA82/ XzAkZEK0hbLQQ43FzXRJ0devEnhgfZXaRojZleB5660JCKX/7QMHHSh0P9aHjMtS5u8jTffKun+ wdgiJWMObssfNHJesTmPHkmn9+3t46ur4OB+8qT12xi8EPw4PaS2pIgi/MzC6w0SR9P7OSU4cW8
 43V4Hcb9rh52Feu1qIkM5JkQpM9bS8csKukIaFuCuqufrRnWUNa/RwjNUqlCwejIVm6x2ugv
X-Proofpoint-GUID: bCgDDB6vBprQOiH_ipmx2AK57tW0oTl6
X-Proofpoint-ORIG-GUID: bCgDDB6vBprQOiH_ipmx2AK57tW0oTl6
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680be75a cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vOkYuBpGykXyuoY-UswA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=646 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

On 4/25/25 7:47 PM, Dmitry Baryshkov wrote:
> Use new SoC-specific compatible for the SFPB device node in addition to
> the "syscon" compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 41f8dcde20819b3134c38dcb3e45b9e5cc24920f..a5aad4f145dd368aabed44cf520ffc037018b37e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -1086,7 +1086,7 @@ opp-27000000 {
>  		};
>  
>  		mmss_sfpb: syscon@5700000 {
> -			compatible = "syscon";
> +			compatible = "qcom,apq8064-mmss-sfpb", "syscon";
>  			reg = <0x5700000 0x70>;

Would have been nice to pad the address but let's not drag this
series on

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

