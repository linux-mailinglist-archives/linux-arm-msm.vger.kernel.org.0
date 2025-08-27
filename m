Return-Path: <linux-arm-msm+bounces-70970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E3B3775F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 03:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7061B664DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47E21A08B8;
	Wed, 27 Aug 2025 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhLXBVe2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AFC1D63E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259211; cv=none; b=o7p4O1mK2G1IA+MloBtwJ0yczyZbrmZG+yTPjabhU2iqF0PeHKLC+NKP4B9NCsoriKcTVF1DG9VB28AaltEsr8bTMOVunvKqy6rkNpxLinNEgVCV43lbNk2sEElOoMGUsG7LM6LU+6Ua1IKpVQBeewW7ea3ee/O3uZ7bJUqVDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259211; c=relaxed/simple;
	bh=DysN5hU3oh6u0Gix/Fw/6sES2iyVhu+TI7M9kG25Jhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OT8AIZVtzbzZdMYt4fyqchJ9W/2ediqgmjLEaItOO92O55ngZkulQPmScdLvUF3LYf2cYGFK9z9Mn7L5T1iaY0AFuxbNz2Qb2MkB4px/tvJHAs74SN9qVcyIaUKyq6XFWvsrSgA42WujbBF8pUwjktsjzF92jFJdG/lfZGBnk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhLXBVe2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFqKwD027946
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JsiI2R6ibkXEQVsd2AueMHAg
	SFh7s+WwOR/4XjgqCBY=; b=YhLXBVe21/hN247bvkvVEfLqcK+vDTHSZ3+l7oHg
	8JGWd1wBDFdGdfSnMg+1K5dO77K7KM5/jCNQ2HKXYtBUfMe0kJfS2Q40bC7ziAJq
	BIPixjMuuNJeHCo6lWz2M6QS3eEd9jMZporoVpFD6Q/EJdm3U9dpsruRlwifmUp8
	qI9qpuLjfR9B3hrjJmeRj45bK9amnphtBZWVb5vMq/OmR+WN95F5ddhKYDBKE47w
	mVkZx6MCLHIe4AKxVUW7Hosss0P6q5kZYunS8vlKsDuR7TJCcAyKGmDDc9bA4TFz
	IDSeYpUzYnaB55SqKrdwv+9s8DecfFR6f2ULXQVhOamtTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpewa32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:46:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0fa8190d4so14379361cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259206; x=1756864006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsiI2R6ibkXEQVsd2AueMHAgSFh7s+WwOR/4XjgqCBY=;
        b=Wh9QMntOJ/GvDZpstNSkkE3MFSHNktD7Sxx95q4fZHSQV0zsY704aCKfUgOnD/VJhy
         o5bOJ/MLHsClj2YpUKt2P6g+utZ9lHI7BfxeT/Jd7xvM4M7u0tgPCYDCC1v1Ro4EN5BV
         sD3Wyikd0pV7iX+cPcsIgMRxwx3egppNjyM7BjVhc0kbNA/5yY5BVEce4m5vjfrtyyBU
         aaQXhxdhhPEdR0klag3MoyCi5m+4VFGWKmz1u8GjyMa8U0iFDPL3wn2IVMOM7Z7LBttF
         yRQaClGhrX5joiF91CUZwK6OeGE/l+FFaW6V/vuoe334aLA3JXjUgZNwiKoMvWXZBUsP
         PIiw==
X-Forwarded-Encrypted: i=1; AJvYcCWE060uT5eJf2OTpRIBqwAYv1R68pGAU6FWoT2Nk8Tk4inR0xw+HcCoNoIux/XedPxScitnAZQW6QEbVdt6@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDQ8YfJ9hr15ZPjz/3xkDKaJgreFHjCBr1lJ78lxh2UE3dqUL
	jC7HSUxQyGGvi8m4gOsy88ncQ8J/ZgMQFTvNWUCUe3//Lakyp7fQFsBB+WgjBb52U+PbSTzGpDg
	HsBYG3+iEsWedPZKtoaYlprNSlDJdNtMaiEwYL/Z0pOikvgekWANHuNOduHeO4EuxY6pDCCpfnT
	bm
X-Gm-Gg: ASbGncsqmrcl65ZpbGlGIEwz7pVK7FBmGNDVEol8YWTX+nCHc9W2Qf5ETjLuiukWjj5
	PYFAmTNDncIf7toG+LSYlr6c36koBJ1bztxzSMJe3v46AG2QV+QbkLeXdHastYPWSkKa3QeANXK
	22K6YZ71HbKKf5KZAfht15M6kVre0zLUKKYSs/VVIgBmZ4DMJ/mvnPRHed6ZtUWLcts9Pjol8LI
	WK2P9jzlrNR34YhvEzyHh2nhNtw3iZAnxDPoPayody0F3M4+yw01+CCezG0NvV/Iq9YQDKeXWso
	eGTONN2WKXJ3AnPJjhlTp70kKimo99dlRt4uQz2s1aP1cgtO9qFvdYrmDwYDuU6lvXX2VIQqLI0
	nSJLSFtk+P2OO2cfJOGGX516ALHRF7+BdpsDiCkM5f2wl+IJ4gfOf
X-Received: by 2002:a05:622a:24e:b0:4b2:a9bd:5e0 with SMTP id d75a77b69052e-4b2e76f7172mr37630731cf.4.1756259206177;
        Tue, 26 Aug 2025 18:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlmTK2otsgLWy8SWBZn84jmif93f/VKR3VjTdwWA6dS24L2uPT70Q5mJ3bV7NaE5n3CnyiUw==
X-Received: by 2002:a05:622a:24e:b0:4b2:a9bd:5e0 with SMTP id d75a77b69052e-4b2e76f7172mr37630501cf.4.1756259205704;
        Tue, 26 Aug 2025 18:46:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bad5sm2541712e87.83.2025.08.26.18.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:46:44 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:46:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: setotau@yandex.ru
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Message-ID: <nr4ipnjds43cheo5af6orylrdn6an2qxmdu6cloldn4qd6vsnc@kidtkadei24y>
References: <20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru>
 <20250825-sdm660-lpass-lpi-v3-3-65d4a4db298e@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-sdm660-lpass-lpi-v3-3-65d4a4db298e@yandex.ru>
X-Proofpoint-GUID: k8GB6ZRUgREY5tkOVx7IUX4rAc6b9A2A
X-Proofpoint-ORIG-GUID: k8GB6ZRUgREY5tkOVx7IUX4rAc6b9A2A
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68ae6387 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=pGLkceISAAAA:8 a=vaJtXVxTAAAA:8
 a=EUspDBNiAAAA:8 a=waXtKuJNql4FBI_f4L0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX90ABdmLMbAd1
 Agw2TYCdziBPKlDDnmb1xORCzoXxbalPJpLZhvK/OTgOqFEVNQPgvcyrGUbTiqmwq0lbjWKPaxE
 RcWBjYUQKuM+tQ32JR1hTgPTYfYoU8+iTV2HBn/Suj3w37+0ewPzlHWVBPaDQiQcKkblYsYwbyS
 X161D2jusbucu+NLeW5ka9Dhd6GJ8X2lCYrwiqCaPOq5sVqw0HhFrK/4FRBH+9nG2e/EB5/XKty
 cispUmnX/ukepFNsMGh9pDzy77LOr6EVHbZ2XF77J+JmLpC+e3NH2h9BVKovkZ5uctcKH4D5uVE
 Z5YRYSLu/lSaWwMvj/CeNmuIPOlnZ29K7jm7RXHWoPtP6XduhrMimLVqwAmmfF4S3uprWzyZNYG
 FHFMrgrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

On Mon, Aug 25, 2025 at 03:32:30PM +0300, Nickolay Goppen via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> Also, this driver uses it's own quirky pin_offset function like downstream
> driver does [1].
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Co-developed-by: Nickolay Goppen <setotau@yandex.ru>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> ---
>  drivers/pinctrl/qcom/Kconfig                    |  10 ++
>  drivers/pinctrl/qcom/Makefile                   |   1 +
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c | 196 ++++++++++++++++++++++++
>  3 files changed, 207 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

