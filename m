Return-Path: <linux-arm-msm+bounces-76295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4454BC33CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 05:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B0CB18880EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 03:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24342BD5B4;
	Wed,  8 Oct 2025 03:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUMcassV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619CF1E47B7
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759894274; cv=none; b=gPqUb2hmG7fxR82EpqkYyLIPuKEAidsqGpm9pXF4fqPXxkfxNWpxbfuaNcI2Qn9+GumWTp7xNQLyrtlwbDwD/f4Zq9dRrFXAALEOVj69ulCPRh6nphwooNM38nlE/cu1TJlBaoiPu+lcejHC4qxUfPe38AwOt30vCbWsdD7zN2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759894274; c=relaxed/simple;
	bh=2a3OrLH67QU4fsm474jcgPYn16EzoMNKGPvctGw+AQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSc0We8/Dn5JRBVLOtzywuJtti4tWMfpdcrppWUyOlfdA4fL1YUzES6hdO0pEzLFXskwyuud4VuWBWZHKFN3Tk5PFVEK67O3m9FddiUgOWKnV8CHWc2zCV9Adx8ogjtymXYscIhR3I+7ea9+q3p4/kQ+fOcIxepANxriBaU/e8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUMcassV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803hVX012466
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 03:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WWL+oxTaknWPjEJ9W43cr4xK
	NIzu1kCbsEoFeNIlit0=; b=dUMcassVp3gMljPZyMDp1hQaii9A5T70+AeLfRZp
	oHAi5RF9lsSo+5SRAGRXA38s0UjlaJHa6uVD0bYcRV1rPMOqq31eCi0MW8VUMVJr
	5+L81wNwxLn4+ub7dk4O6tEwCAR+W7V270Y6G46xuT/9Sv56LvwwVqVSS5DsgLJr
	Ay+yCN+ZaSh52FUIpvJzmAqQmIqGUVmDNYWAmBi7Dd/OagOepNA7QytESBy2w6mf
	feLaGvZ5sv63G83b7UMlPqUOuT6uPJm0NtP//duPyap3E3eY43habQBBm9a8m/qR
	hR9pjcMcgEKNvixJwt2gYHUpJRR6X19zRQpJv4pe7p6yyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu97j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:31:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4deb67c61caso197284831cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 20:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759894271; x=1760499071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWL+oxTaknWPjEJ9W43cr4xKNIzu1kCbsEoFeNIlit0=;
        b=t54HGn9TM1VHgUa9Lu04LktWUiLKbEnIedOfUJepbiQ9+Viizn+g7lgAiM38raPnls
         a2cKjrOzSqdFwU9yMDvbWsaXmJ4zlfZ44elZ8BOMSAwIrzkXMgStcX8tTE6VjpDH6n4h
         BUYIzBGgWEUz7htYswem9+u0h+MIHqcoCj8RsegZAyedVj/RJBguWm0+UqZ3uuo+VPXf
         W6JplepCK4w8nlPNxIyHduIbzYXp0AGRtVRS189Su3TrpTwY3SbzYCqm+jPzrUYsyoYi
         61XPJLD3wMhxPsWihRh7o9ToxmvchuonQf271SYskroJkjWGP2/5MNfnQG+pQnCn0LMA
         FGlA==
X-Forwarded-Encrypted: i=1; AJvYcCUBSgTxQqUoyTiatuHmwHd3SYuICUwvh5FkMvKwHxEecyXWJsCkvtH8KhYdD/o/3/Edel48zXnwPsoGvEO7@vger.kernel.org
X-Gm-Message-State: AOJu0YymPCJvHutAUKOcK7q6ouSYwclyGDwZ/X20+iAYSlBk2rfTviwS
	mKCfr+EP5caaQBMw1Ca5HQh9tKyCH4EpbPdCYDx8vHHVfjV9x9X+3XfkD5pp1goFiHV9Ck6YQ5s
	JANPrg4YILHHRPtISD2LKiC/91xkJOO8qkacpB8iHdGJd4QXvF8yM70TqowrC22u2ZsQW
X-Gm-Gg: ASbGncsa60hfQzF8PSCJRCdsQOw9yRVKVhGORTMZJc0gO2AD79otRLNZPhPzuZYAWJA
	V413ITQjLQrAC+YQDwWjoV/xd2hCeNT8lSpjMQYQjmPrK5YLseBubLu2UzpMn0LHdNtvEQj0EWa
	AtTYHKmH0NTOGwaBjALCTYHcwp8j/AxK7enkfmYE4C96fyUgsugR6kLJZVEcrlAVtR3bim2zNV/
	FXli9Lsvvzd74MNZdZiZd9cGzFXb3xIlxf58TDEmUII335VrHMOG21Pp84cMeMuUjBRlASNdBDw
	wWmXeo/A2doSogbkvG6tHbT190YyXxnSt1BxSFRzKD5f9A+ZM7klXHuJZUpjnlIhPuJjI5C1tpH
	Ugsxqk+EJP8yE/Cmwqt7d8w7pn5zb8Ha3xBRRugvMoriBPT6UIOC7uR2iag==
X-Received: by 2002:ac8:5d05:0:b0:4de:9f9a:b8e1 with SMTP id d75a77b69052e-4e6eacd1632mr28143161cf.18.1759894270938;
        Tue, 07 Oct 2025 20:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpJi9YDeXIx8aKnVS2WDaUwvZAKAbXdQcjcWyTLCETRGIS0rZ8bznBq56g1sVuq6qO6sT9iw==
X-Received: by 2002:ac8:5d05:0:b0:4de:9f9a:b8e1 with SMTP id d75a77b69052e-4e6eacd1632mr28142891cf.18.1759894270521;
        Tue, 07 Oct 2025 20:31:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5906775d5desm979249e87.72.2025.10.07.20.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:31:09 -0700 (PDT)
Date: Wed, 8 Oct 2025 06:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] Introduce Glymur USB support
Message-ID: <llyanh7h7xbojo5n5npglokotkuqagbkqdgcquj6aagu6u7zal@wazru6ihqamp>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <a6690fbc-0b86-4725-99ca-6b4cc477b4ec@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6690fbc-0b86-4725-99ca-6b4cc477b4ec@kernel.org>
X-Proofpoint-ORIG-GUID: 8vaw4PwoTwhcouXuLij-eWEyzpeTf2Ns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX5iv12yvvuYMe
 KSup89QUFKQopZTzjLpUmg1aKEZO1D6l2xYLitutac/pkPgNlNaJHB086z+I0PFKT8RGLa1X5fm
 J93PFg519bm6/Uu4bOmllQIsO4EflMd5aMxHei7P9kzXXE9dVyLAENe8qBJ/X9Nqqb/98WEdf/s
 wZLfIDgh4quN6O5J5LleuxLZGuvCtTyT0bdDUyFYht7c7a1pjaOAt2PYirC2hX6A0XwhOapInS2
 HzX/caSomNyOuxVDpB1zktFA3X5rPmlglQ8XDjeAZtlT9XHUTUzckvdSAXROzBAz0ffllFicQSm
 czpGibZd7kmC9J3A7pirreZJXwNb1se1HTC6kTbGL7eYLbZrvvwANc8ABjRDSK+uUm3viRLQq2x
 tATp+Eq9CGi+wUiYeBFQ17/uOgw5ZQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e5daff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=ukQvhT9bAo9IVCr4j54A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8vaw4PwoTwhcouXuLij-eWEyzpeTf2Ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On Tue, Oct 07, 2025 at 10:02:11AM +0900, Krzysztof Kozlowski wrote:
> On 07/10/2025 07:19, Wesley Cheng wrote:
> > This series enables the PHY level changes that are required to support
> > the type C based controllers and the multiport controller.  The typeC
> > ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
> > the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
> > it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
> > PHYs for the HSUSB path.
> > 
> > -----
> > Changes in v5:
> > - Moved phy-qcom-qmp-usb43-pcs-v8.h into USB specific QMP driver
> > - Fixed DT bindings for clock properties for QMP combo PHY
> > 
> 
> Where are lore links? Why aren't you using b4?

Using b4 is the best current practice and it is strongly recommended,
but I don't think that it is a requirement for contributing to Linux
kernel.

-- 
With best wishes
Dmitry

