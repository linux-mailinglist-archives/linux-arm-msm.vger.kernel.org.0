Return-Path: <linux-arm-msm+bounces-66528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 409EBB10A35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A8AB3A970E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353EC238149;
	Thu, 24 Jul 2025 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAO0QJrN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E70191F92
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753360243; cv=none; b=TgEYvZ42u4EBGjYOCC2TUDSl2keGmJWYrF7PgpWaSLHJTCGKP2dtTUgj66twqt0vbGmKyNjCUspCTn72rPeSHHwf7PmvvtjV2wBeSChrM+5Vc+i63WIcV4AjjsC9o8ItdrQPrW1i6QF1FVOulAuD3AWK3nQ8dAe/g3Ref5d2c8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753360243; c=relaxed/simple;
	bh=VjN6lbJbyHpAweB3RWq9GB2CLDrf935zwW4/aLCMId8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdqZWuaDQgrg+HJQqR2NCIH9GEFs5ceIXREhTocApJQBbHgL/GwbTBvcZaMH+7/n5oMpgtEMt2yhNTlq6HY09DhwBPDJJHCFZbFZA7/WgFhnqnk859Gl8U8T0zaXruyxhDBVpJwYDfUC8flFxeTMmB4oWKlq+mCh0nVpUMOPFJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAO0QJrN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9sfCD001509
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPo/Ix4t9i2gm3mSTVtuTKh3mZMxwYpbauxF/Ix+DHk=; b=AAO0QJrNJO5XKt75
	BE4FV6zHQtVErkXSh3ORhRsbtCdaX2aDKQ0MvhG/4AkdB6WtHaUeSo+kdXjgQkoD
	/fWEiRgKCPhSwu5AfUBzMGgbxiAU7NJFrvwSS5V+30+LVLq6EIrrpnTRRmb2XBJ+
	f46n6UCk+jJvqeOQyeonV+yTvpFOYD/b+4S9rL+kWC7MEUJ6yWo6iRyB+Z4K/OH7
	fJ4ukcKtv0fgBqz/3G/DjeL64UnGWF3bqsJ7GKFxe4I00ADMNYUaVXEWj1GtSSii
	/Bvr+i6RA2iVPQ4JyVfaIVJoUMV3TiC5rus+Vzpg0cs0ldQK1i9Q1q9jeQSBI87U
	/1UHNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1uf9kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:30:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e33e133f42so28324985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753360239; x=1753965039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPo/Ix4t9i2gm3mSTVtuTKh3mZMxwYpbauxF/Ix+DHk=;
        b=hlvqC1iKUEbq4t92JzB95Iha3aHjK4SU97su6jZ3gtlJ6KQXbWYjYvNZgffGFO093/
         YMLksusA7W92bmAhp7cqd08gHh/4wl11UGpJss5+Pv+zKsdt3ycLN3YLDR6WcfW1QwK5
         w+FZY6Ym54aT+oSrIMoJDqKpKZp4icumxdnZRd7enFdy3eVXf+xlocC9hi3X5Gdk4OW5
         tRt/A3IeUjm1FlcKoW33ILSv78wWsiBV2ZsPjIFBCOfhW2UkxczTkwGkaf26Z73baxKr
         vSj8B2uzHzSXnmNvASfsF+aftw9VYLKTJjetmbRnXz1U0GRd+gmvtPOrvqqjGFN9KMR8
         dbow==
X-Gm-Message-State: AOJu0Yz/iOVjWjt0L9hoRuoWNaSrVZ/R8Svt80g72KlqFK1fPlFiCRwC
	HLhueX0fibI4pCfPKsgMsUtte3yrFi1vVMGJgG13wb507vmPjv9XNxJRF1Ebr9nJ+PRVKU5/mig
	96YOPTAFL+15l16on3D4Pat247xsEomEbgGgziKuYW4TvkUkIgOnCuJ2Fu0Nn1lex76Xb
X-Gm-Gg: ASbGnctefADxaPUhVgpTq83nB368dHQCP9TlRqpSGvNY90hCf04d8j8p7l5ggLxBMaJ
	fPggOwi84aGiZegPUl7bs9Unupne+CTix3rJJ4dc+H6CNn+xPR1GgvdSTLrKjHCIDjqWZf9YThe
	ZDmon6Yarn6klWkMur2UdlOxWrPR0w1k09e108fohN/AfKXvffpEFCq+Ob5lvR+DpPe7Z0+28LF
	khT1sOmcxkD6BOuLSKOjaudL6f7qrAAiSKOdhL+yuYZHUw0+5g2qPQl0Kco+xLbUpLdZdSQFBBu
	rCqFn69AyXKctQvLJOUY4xeiJp42sjOcg9y6zZvEkNfvA+5gMgoHnccOKVGlcpQTcy1wWWlgZKx
	E+g7F42W+HGFXMvU9Bw==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id af79cd13be357-7e62a112c00mr308565985a.7.1753360239353;
        Thu, 24 Jul 2025 05:30:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4hC5mZlym8Ol+EKXuySdjS2BLHVDFr6pVPZuR+2k3WOI8gV0/mpW3MuNGzlmCf3tCkTQPQg==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id af79cd13be357-7e62a112c00mr308563385a.7.1753360238812;
        Thu, 24 Jul 2025 05:30:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47fa4bc8fsm104236366b.114.2025.07.24.05.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 05:30:38 -0700 (PDT)
Message-ID: <860eb914-201f-4ccf-93e3-95596bb73730@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc7180-acer-aspire1: drop
 deprecated DP supplies
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
 <20250724-move-edp-endpoints-v1-5-6ca569812838@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-move-edp-endpoints-v1-5-6ca569812838@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=68822770 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=As10ZbdmuqajYgUSL9YA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5NCBTYWx0ZWRfXyi6Gm66ribhw
 VVNmsY4p74DIju8faMw8lIsKyaAfMUF47iqEyJmbmBp99wczYKUMtvEFN1LLyrTcx2dpCDXktRF
 z7WCqeKTnW8kguzAJy548H9ZQVKs9uXVpn3Shz2p8qbzSnatBfxH98+xzkQpE15pPWjSr29/TUO
 YyGLTFTM5cluyUiAU5e/VEJ8vZUpsrhlijietTFi0ouys90Izjb/uhUM46mROrv/uSom+zBsFtM
 kSaGtYmgXG/re4n3EvDgZ7N2CPFEEZZamXrsVHFBT9pwoLyEox5Cic9W+YUFPuBD3hpEKk2Vvsl
 UngfFYTwEgsCISKON1Nvo63n1Ynkir151+yhFcIBLFOo8yuhiEGhuokPEVDIWsHMuiPM3kiVJvq
 ojKY/UEB+6D7MamOinJ6lnzo5RnCK+yAmtONih0ilrAoN+WxEl1dOJ2FZoR95PlI++7/Umzv
X-Proofpoint-ORIG-GUID: GhIV_qfl2EDC_9RGvd-0wVZkEg9uWUsG
X-Proofpoint-GUID: GhIV_qfl2EDC_9RGvd-0wVZkEg9uWUsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=633 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240094

On 7/24/25 2:23 PM, Dmitry Baryshkov wrote:
> DP supplies were migrated to the corresponding DP PHY. Drop them from
> the DP controller node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

