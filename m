Return-Path: <linux-arm-msm+bounces-72045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18841B43B65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E77CA7A6679
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F9A2E1C6F;
	Thu,  4 Sep 2025 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF7F4rPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF542E8B69
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988427; cv=none; b=Nu/qOGAiff2HfH5w1uPtp9ezR80Fpufeaej+Bd9cr4T4t9KURoAKmfguZfbuTe4Yemro+4fimLy8qUlhg2CfQqzBTJ2zNVKEI6RZEmm+aINE77gGwrld2cQx/PidfBSrH46+ohobDyNhH3Ol1BaveJDX55TjDm9T3PxixSvjoy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988427; c=relaxed/simple;
	bh=WSevKUXT8Sd3MNuHsHxr6/qElbPatDgVFUDgAsLQo28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsB/vQEGQSB3K7w831ZtQ1gWcgj2Z4u6wyxKngrPFAsBDPgaaMMkW6VbE97xj+hFAyPgxHsuKoLdfW3gieKlyQe6Mx/pwE388gUGBsDoeQkPlh95AtIvmto2gDSQUJtfYCebHnayI3L2NMqU25nesBN1BWhrVsRLfJRFI+80Z/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lF7F4rPW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X6EX013960
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 12:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5K9lLVQuDJ+jtHy71mkQmBdSNzf+tzhKMiiJck53fBU=; b=lF7F4rPWrOffjepL
	rsGbLMBcrr/o0u1vA79M2CB/+mfH5wIj83TWwnJh+F+QRnx3WlwOJGXmt9JB1Zkd
	2P0xkeVRT2bFXFmBFSZKTH/UYUJUyn4x+bOy/okVY6d17h5B0U06b2zJC8zA37uA
	UBNmqU84QUn7dS6Bxqo0Gf8grPibg8Qt6jBVhF+gx7y1LLByeFw6AMM2BECys6zA
	TeJAqx3wbGlenM4lv4pmV8mWVWjT0CArCYPUy73HXYM1jiM9QjdbLWZnQW2bccaT
	bOFOk/lOnxPTxp6ipcWk1m3AWB10fildxvoYY14Q+N2zlJbD8v4AoACNSLqIR64Y
	EPePRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv7jk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 12:20:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3037bd983so4337941cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 05:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988423; x=1757593223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5K9lLVQuDJ+jtHy71mkQmBdSNzf+tzhKMiiJck53fBU=;
        b=M8BWe6peCXaDSqSUpY0PG54v+pMDUGQCT/OCZGuFipOcFjqFIDT2zZZiUK0ePhKE/v
         2yvAq23xiFc5gUANRyZs3IottDrkgi5I9PiEqW5vX3iXE5zq8mlYV0hrG6zmVYVgLWCi
         f3+RmBKlpFqtRoeVpvw7X2xQYUmAUxLHCFRQ7LwqHS8QY2vyfrPFSw/VKiRGhW6t3Zej
         KDx2XO4vT+cYQZiMHJpUKK86wNby02tpIrI/ET8rv0YsHPrq89GuQfoGNuxZ1yk91sDX
         iuwNepQ/m0uvwVfhKuBNEkstx/JhWC3InUHFcG8Wd2jmepxTX8Yz9eIHGFUo0k6d01VP
         yFDA==
X-Gm-Message-State: AOJu0YyuuuFrKpFr5JDFeW7+MZcjoHmE7NdmnKLDJavDXk6vlJpcKCvy
	GME4oH0j1y1Qk3jw3ExsSiSsxGMKd3zIlwV2ApNn8WQ/zxodGRa+8u634sHJZvl3Yg8xk5vqU+3
	0Otn9e5YCSE71tAVyRBkRiDjIJ48QC4s5PgzEFHIH1eeCcI1KY4lT4ewD3ftKu3DeXTby
X-Gm-Gg: ASbGncsoSkSBgSQCv8WzhdrUmdxPJUXt2xODzdFHtlyhbXk6DxLzXKY864d25ND6bfO
	RPgmW9ffSkH26vweEt4F9sINS+kjfkmXkrHWF24BUj+X3Nljw7amz5Coo3IV6XaGoQCkRoPG5+z
	g2W65cmYYDqxHWapImbekwsiljKBFpyamg56QhiLMEIhrHR2h46oX1C5hK62T/R3hwCen5ceVNH
	61ACHpr/Ltkr4SQXBYzw+oahVqot8Dc3TFIugJ+oM28iKo+wj8CwkaislcVsKuFVOY+29QMtX7O
	aSfplLEGirqpV1mmRcJfsxR5+HPLuoeSILhG739geI8GHz9nhkBAELIChi2fDXKbp0YJHAT/nSI
	baYB3pgx4wHmKahbF4GWkUQ==
X-Received: by 2002:a05:622a:148:b0:4b5:dfdc:1f0c with SMTP id d75a77b69052e-4b5dfdc2c5amr6767161cf.12.1756988423045;
        Thu, 04 Sep 2025 05:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq92zIM2PJ5tnKQijo/OGWPykJlP80988PfhS9zLD8jSYpTvRaC1PomVJTiMQsaS8+adW20A==
X-Received: by 2002:a05:622a:148:b0:4b5:dfdc:1f0c with SMTP id d75a77b69052e-4b5dfdc2c5amr6766811cf.12.1756988422416;
        Thu, 04 Sep 2025 05:20:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413ee67a3sm1164960266b.24.2025.09.04.05.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:20:21 -0700 (PDT)
Message-ID: <95b40735-367d-4702-b2e6-01c9c5604e5e@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:20:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/7] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Robert Marko <robimarko@gmail.com>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
 <20250903-msm8937-v9-5-a097c91c5801@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-msm8937-v9-5-a097c91c5801@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX2SW65PlT6uqM
 c+0K+w5wnEvgIVcTgUQz0CTe53HjAWPrXuEExl5YMZG38YM0ZCCeoMa8mJMBo3fKZ9Ovz/bhBNt
 HUpPFkSVKcqk141UBPC10dh6WrJH1GOJKyMTamKtxWErinASYl4PUhdhlVQ99uvLCPQPoNIIspO
 R04AOrgei/cGIIcllJXSiLH7cKRqO9mr3OpMjrM8j3Z4+xi9UAuLgfISUIL7EPFkE9309dwpkQY
 Za4CWTAV39EZq65W2MG9jh3IN0dZ7mKB8f/OBItV5F/sIvKaP8Vpc2GHlvF6R1xe46SprUonkMb
 gxQk6l2uhuUPYuuBMff2XtDlV0Xq2DAqok4RccYkcoSbOyiiEzSBCvnKV8kp1i012fkOo2S3SiK
 Ye/xutSj
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b98408 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=EUspDBNiAAAA:8
 a=OuZLqq7tAAAA:8 a=9HHfay7fNgEZ8udxRwkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 1OOCaMSNH6aZ50WX7WN9BVxMdcRmSUgA
X-Proofpoint-GUID: 1OOCaMSNH6aZ50WX7WN9BVxMdcRmSUgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 9/3/25 11:08 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

If the bindings checker is happy, I'm generally happy as well

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

