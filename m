Return-Path: <linux-arm-msm+bounces-62475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1E9AE8559
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 063965A5106
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565D925B30D;
	Wed, 25 Jun 2025 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9SVWrSA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D892A263C9F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859941; cv=none; b=EThD9jxV8QE0rMAbBea04Lm9wGBvRzjVDtexwVgDzkrvT6HUfoeAGQp3Yx05K3gh7750SaPhTP47egPAA9M5XdoB4yO2oHslnU6v9i+1mPuCEn+ZmP3+lFBvWpzbnTmGFS3VgjXr3RhQ0XRiwHYw7XD1lgLCOI9XC6AvBLKrYzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859941; c=relaxed/simple;
	bh=130S9bxiaGr18X+StU/GtbUfHDTUA08FpPwhzz2AgdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVGfpZAVsTWVd1vUFIVGXJnwflL8LqR6eikSOKHAxgNixR2otusEfDZAFa2xsac58EPP6r1+y0zMylVECQrIAaGpgsh7ENIhrzkOSysBOQ4rmk/9EZKM3oruwzi92Y7aCLPlCBFK4TocV3GM57qBhxchgc0a1O0cvSc63W9QEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9SVWrSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9GmtC031883
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0epQL52sRFpo5wPl7F8s9Uz+/mQ9UItS9grZIjzDZU8=; b=g9SVWrSAabmrhvDK
	kqGnDydOKm7qmUHNbOV5dT313ZaJ3RVg9v0u5y/id1sjYLoJYA/rly0WhEzmz/ZP
	JuqlV3pXxbEITT57AHbzF8Za+w5VfAKpvQElDGpjYWutczbVaJKKJQEHNVrCoD9L
	b5kzRcQ7nnX/Zxa8ArpCZnkpPGDKRqAgZ8J2QbJLuYzzCmM3UWyKEq23dPnuNylY
	QvxGpnGwJl+xPXBMn9p6EZbWAoqBWp48hgX+MQLX2s+ELtL6l17/HIyov1YD7jcz
	vlVFMLjeqLv2GiihAkXQISP1rbgu9hlBGDgpGio1AE2M7z9bpZCIra3XAV3PVD7b
	47XT9w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3yx0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:58:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6facbe71504so13352836d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 06:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859938; x=1751464738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0epQL52sRFpo5wPl7F8s9Uz+/mQ9UItS9grZIjzDZU8=;
        b=uso+HyT/Ty/i4yGRGo4ucEPW9hJz/UHnuD53yT3Y2KnCMn7L0y+fJ0AWSnJKfD4Yf6
         2eI0BcF/q3KeRBjD1HrPKx4C5L75nnd8HQoT06jsl3unxkbVPjsLMjDdLN0Tiv4Lyzg+
         +Cnt7emEe/HT/EkJ1mLa/+a2zxemX01eAGkMHyUEDHCwruKAhBt5Kl78v+xdO8wRKShH
         xvuio4WcI0e6NY0mAxHf+CqyNC9Tc+mkNBX/GPy8LgyT2VhvyFuEO06OgqWioJoHNV99
         pY+5Ht0ELzSkP7Xu7G/KGuXiAI6k/iiLEMMFgRhptcyNyOJz3AIuGXnI0Nssr6AM8a/O
         cM4Q==
X-Gm-Message-State: AOJu0Yw8J7QjKLBxocltEG5lNKZ6/V4UruGvKSa8KsNuNw4fVYoiZOPU
	1GdxaBegJTJhKDaYck66MK25N/EjA9RrI0viU3frW1BffQNL5ZToTSgCkvqPZFSE5Nl3H2Nbl4z
	9KaIA1ncmNW0YVucLiVRhWHqlwqQ96pJTY3JLSjWYmPlIvozbjudWsmygCuKxCrUuv3lf
X-Gm-Gg: ASbGncvObYyIY63uu+PvnroAWW54JhfvigsAdR9DDL953+PoRv3Khv+/sNQH2VMtPOH
	R4c+bhTTY5AXV75G1fuTj7NG2ztwshwJAvqN2V6EXj46oZ9GSoNJfC7ZoJQoZ+vbFmfFNYPDYFR
	+zMfb3Xx35F6i+jHo6nniQYQfOazYat+JM/xZ19by57antqPZAG/eAkm0i7Bl+lNUKDOaOd9z/v
	Itxwdb8JODMc2f3S5NQWZJGl5i2bcahbvMNBgYHgcFM+zOvv16rwgjLyt3bvqkpo+pkPIJhvPKq
	6NbQ4FZGyVQUQ24+J/LO6OUVsKMhZ3Gh1UysieGH0Ftf0Yss61Y+Gsx9PBQ4zfZKHZsbqTYT7u+
	R+EY=
X-Received: by 2002:a05:620a:2850:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d4296e98bbmr129502385a.4.1750859937532;
        Wed, 25 Jun 2025 06:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOBuskppWHr06INko5Hfc6FbHRQ7o7cAxpx1dWgr12t5+vbJwAvaZ8bDq6md5caYgmp7hBkA==
X-Received: by 2002:a05:620a:2850:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d4296e98bbmr129501085a.4.1750859937027;
        Wed, 25 Jun 2025 06:58:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm193727766b.129.2025.06.25.06.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:58:51 -0700 (PDT)
Message-ID: <dad809f1-9fed-47f5-9aea-34369a9b3608@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMSBTYWx0ZWRfXyIJeoK+fm7nk
 j8fZeVCZXTkTNqqt5A9QpkipWi1evVEB8YJS9X6s4qe3PudAd/p/Tpub1hDU0JMZx1hX1jVibDe
 JdHuaPFQsKgITnCv4RPJA6aGCSH6zVhVPxRMWrCq23mgXAusKjsjU8i9w5fetpKitsV3630y9Jp
 JpSe4stygyTUq5NWIJPXNNFNStljuKNR83xKytcJOtnfQwyOPbqkoF6YO8T9Y4ND5iHtovDsVTO
 50JCFK1mVsqH5M9vU97Tvfocfe6/i6u75CYFtkcUOr0jcQuc3Cu2BhKtbRte1bYpTpIqb0RS6uY
 DvWvt3esQYy1L+xB6d8ZYc6e0MoaLdc6iP6cy+/KyBXLCUMut/lnOWC0NGt8c4sH3fGGlWalrH5
 raUWqbnznQIWr/bJLttyMGf0ccy4Ufb9Z7pq8zxHFAUvAZanC2UgQ5b0uPM5dBp2lw7K5gso
X-Proofpoint-ORIG-GUID: _JwT8MymVCexFOC22pALu5GOjUaXxHIV
X-Proofpoint-GUID: _JwT8MymVCexFOC22pALu5GOjUaXxHIV
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c00a3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=piobYN4nb8Jc23nr414A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250101

On 6/25/25 9:00 AM, Kathiravan Thirumoorthy wrote:
> The current configuration used for the IPQ5332 M31 USB PHY fails the
> Near End High Speed Signal Quality compliance test. To resolve this,
> update the initialization sequence as specified in the Hardware Design
> Document.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Cc: stable@kernel.org
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
> index 7caeea1b109e922c0cd12e985bc8868d5bce8b4f..1a8a0f1262cd95bc00dfbf7397a1c48d88d52327 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
> @@ -58,12 +58,14 @@
>   #define USB2_0_TX_ENABLE		BIT(2)
>  
>  #define USB2PHY_USB_PHY_M31_XCFGI_4	0xc8
> - #define HSTX_SLEW_RATE_565PS		GENMASK(1, 0)
> + #define HSTX_SLEW_RATE_400PS		GENMASK(2, 0)
>   #define PLL_CHARGING_PUMP_CURRENT_35UA	GENMASK(4, 3)
>   #define ODT_VALUE_38_02_OHM		GENMASK(7, 6)
>  
> +#define USB2PHY_USB_PHY_M31_XCFGI_9	0xDC

lowercase hex, please

also, please add it below XCFGI_5, so that it's sorted
both by name and by address

FWIW I can't find anything that would back up these changes, but
I trust what you're saying is true

Konrad

