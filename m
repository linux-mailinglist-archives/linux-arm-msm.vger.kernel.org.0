Return-Path: <linux-arm-msm+bounces-69850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D1B2D0C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 02:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 934C4A01D81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 00:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1A072600;
	Wed, 20 Aug 2025 00:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DS4DBU+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23BCA945
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 00:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755650911; cv=none; b=C0/m7JTpzByYHR7AFarNNudaOdXl429tIrPqlmoPNR8ZGSa8mCiinu0B1wwnenT+RF3crGeV5iojU8hspymnK2lxRh4M6mMC+0jav28lmRclmejZrX/zwrmzaabCWie8RO9HLYzrUbP+WbjtJ48DFYSGApponGlKjXodoVRH93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755650911; c=relaxed/simple;
	bh=1St56b53ZeYdOZcOgShHrWsfC2yRYz2v/yjPzB3zhS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHU56VdQC58UQD2eGtBkzj9ZRuZGt2jMo5B9dteBDvxrgDvMtPicRPpl+eUe9wBuOPmXLPyClLvAPFjbXfQVz/9vi4rgD8KMNqg2vqfEamfkXps1YRakUnYNJ0tdyDk0KFAnySXISgI+OE9dVTq4fRxDisTNl4bEsW/csBr9pWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DS4DBU+f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JNDMNO011872
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 00:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zxCsAUhNU6df1F1I++Z1eLGU
	QBDjhswursX1dh2wRaE=; b=DS4DBU+fPa9WHAiMUOpGkzofSujP9EjK7ZVT7lbu
	ONhmP2pBEeUTdtOz50SsGdGJ5CIDDsPI+US9g8QewnxebslM/ZUGgm0MHkwlhT4i
	+X+rbSfB0BHj6HKDpp34G/ScZ0wm/6HOLWmXLm9mPZD7eNUB60qDe8QqO67/Ztja
	jBiZ9C78m6VZAXN46HIW03DOnUFBA1/mjGQvog1c+t/QZ9DMCu+D+eVHJhdyPb9a
	dzgDklgjRevYt6Oop7c3TP3L3VA470/vkYWEZQPVbHbK+rAzv3wC0bLoTPL3X742
	Em5AvC26KypiWz37J8cKk82mSY7AF0kJyrID2DqQxTC8ZA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tdrd6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 00:48:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88d99c1cso130392666d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 17:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755650908; x=1756255708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxCsAUhNU6df1F1I++Z1eLGUQBDjhswursX1dh2wRaE=;
        b=tCRFhDaS2RIUEReQxgmfO0Lwq0GnejYpYp/FtNAFfkB+5ePcPVpJo48h5YwlQIEemq
         fQhpGRIt1PP4KlVN0WHHKQ9MCwo8ExFp3rMYZSYViQZoPEf1S50YvfjvPP/T6sYpA6Q8
         z+/sisijNda1F2aAMpBhulp09ZM4wMzehjijMljwL99GeG077b6fuDanLNpjxqIO+JR9
         tmBGlrxhy8JMXKgWPtNUjgc7NMl36FnF88/Fys4aKCDbgHlLt9l9tn6ErclzPnRjgcul
         pn2exr6oNGZmbImjdW9sDTC85ruXSM0TS/IXdQbwX86PvQqxONbP0DKaNLuKggswN69k
         sqzw==
X-Forwarded-Encrypted: i=1; AJvYcCWIoHxiJUT7MBzWnTgxmZf+SyEa6+u1Fu4YsBGMqBWm8hsiiKOoduAZjf/JYo6MLIPjNvX2CLHQoheJz0qo@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCeqJdJ+fEDNJW8z22/fxSHR8NHwjWmO9U7NGY9IHcRUZZHGd
	ROA9/7p0ARRmfUHj4bG6kVZakIFDJL8lsKAr7uvNgw5gQlaoI15cU6v9RZX4ysXkdNDTpQahAu6
	RYwGntOyPYBoqcuwqNOW7DBWjD3Griids9u0tX7b3iyFjscofHvv7Wg7noihZH+mQZdVo
X-Gm-Gg: ASbGncvkhRKQlK79Y2q9U1zNkdeJKlBSdQDCAwuEROG5E/4Dv0Cq2c/adXBDWvgTDBh
	9tWCJ9V3EHVHi9lz8Ou0GMwALHg2kPVsLT43IdjAodsMZgtHyZcr7QhRvO2yw6rCJFWR8kZjigI
	kXfXQfF8tdfGVLbYK1C5jzJAztip9TqSSw2d1y8pK6f8AkxvFCtdyJdaYWlC5aq3b2Nh6V7p2t1
	0SNV+qSjRP/EZWdDAsyd8oBuDotwkwYIgtnjT7LXK5Rs+Yrkgwjq5M75/BVa4PBme0fm/VpP4Vq
	kH8iC5krzUtRzzawcQIu6f6ETgPMr9CZ2lKpLUozf0qZhfx54Orp5875W8yQG5i4eDFYzvXUwsK
	tKxkEJexw5soGlDTNDRk86ySuHvKENF10nN7DgvyJV72aiYXYtjeB
X-Received: by 2002:a05:6214:4119:b0:70b:8a30:ecad with SMTP id 6a1803df08f44-70d76f5d7bbmr13343026d6.7.1755650907729;
        Tue, 19 Aug 2025 17:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3X2dMCwIgfJclfhzbEeQSa5AZSTe1W3Eu1uTsUTeRfUaK1fqK3+wI212pgSqH5x66KOuXag==
X-Received: by 2002:a05:6214:4119:b0:70b:8a30:ecad with SMTP id 6a1803df08f44-70d76f5d7bbmr13342796d6.7.1755650907272;
        Tue, 19 Aug 2025 17:48:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ccaf1sm2411211e87.94.2025.08.19.17.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 17:48:26 -0700 (PDT)
Date: Wed, 20 Aug 2025 03:48:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Kory Maincent <kory.maincent@bootlin.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] ARM: defconfig: cleanup orphaned CONFIGs
Message-ID: <shrn6yrf6tmx2jog2z2qvwmic3vl2tsauhj6a2pdtodnjcciyz@wssbxvgsrjir>
References: <20250819231652.15938-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819231652.15938-1-twoerner@gmail.com>
X-Authority-Analysis: v=2.4 cv=a4RpNUSF c=1 sm=1 tr=0 ts=68a51b5c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SBwMwNJHQgdzs6wY48kA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 6HpF3X0ZmCyDTQSD6EX3ypJFuIg89OY7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX7sl6+E3qWdib
 GmUcEzxDGNH1158E863j7P7PGMX1EJ5HHv2lo+EfkjavhWznEJsjYeIeWVbCC2+cDJgiIcdFdiC
 x9KGh5x5DM7rbcySHAzW5dozRDgPqQ0ONZsyggINfIVJm6iGLtjwVF9EEawuV5KMLCQvibVy1SQ
 4cyRsl6K16NEuukpurVLC02oP/TFsJuvcrIQztul/HwlD4vZPyIR1LztxSEC2OHR0YvcvfbFmdr
 IVNqHRgi9nRu3KjkxJG0ropbwhAe4VDxcAv6LPQxafyml4obh6M4rj6H0evszg8PAqUbiAgFSp/
 2tsloTS8eoqY/7CI0K1CHxMVqa7nEfy3Wozk3e2rvL64NNlI199QoSt3SzyaEmvwofJYCTw/MPg
 y4qXan3ru+g/5pkgGYID5AQ2kwADhQ==
X-Proofpoint-GUID: 6HpF3X0ZmCyDTQSD6EX3ypJFuIg89OY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190196

On Tue, Aug 19, 2025 at 07:16:30PM -0400, Trevor Woerner wrote:
> Drop CONFIG_ARCH_MSM8X60 and CONFIG_ARCH_MSM8960 which were removed in
> commit 99497df59427 ("ARM: qcom: merge remaining subplatforms into sensible
> Kconfig entry").
> 
> Drop CONFIG_ARCH_MSM8916 and CONFIG_ARCH_MSM8974 which were removed in
> commit 85148df36835 ("ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes").
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 4 ----
>  arch/arm/configs/qcom_defconfig     | 3 ---
>  2 files changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

