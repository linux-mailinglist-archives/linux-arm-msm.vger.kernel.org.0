Return-Path: <linux-arm-msm+bounces-79545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D1C1DE04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 01:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8F493ADB84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 00:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF9B13BC0C;
	Thu, 30 Oct 2025 00:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jy3Ktocq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHEwRCbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613EE524D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761783148; cv=none; b=rHGetbOk3d7uA8Gx/j9LvQZe+W5iHi59j88aBdRLEdLyFVjtncq+OU09dPGvysL93OHGDa7c7D4C/wLx8GGN0Mzxw6jDfmLQRxdVneR2UG8Y7ipzvJApV9bZtAOUOsyFDd1Qt+nRRbxOKeE7JG57rjOgLSeNMKgGXXwf5bkpJ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761783148; c=relaxed/simple;
	bh=ySCGj90kzKpsiSBmn6qYH7RHZ1kfaJXO5MIqBIGQRlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATnTZxjPfpLC86MjIZTgmtzAMfTdaRJHOtxBsABbN+4lIPKuEPc0SBwb3sLs/TqlAnqxZEhQbki2R9DGQ9L2FRsxjUFswBnmsIOUcHSafd8/KXAjbm6tfnHRNSxGxKv3522RQ/ZArL0zVzhS9rYeTxum9Y7N8oQhx/ljLQcZLSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jy3Ktocq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHEwRCbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLH1931656060
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=; b=Jy3KtocqdD5BKvb/
	uSvsMseZSvEDh6Mk3hdbKAkARftkNcBLbPtjXIxJGTPJ4ScOS0SgMWZGvLSKJkqZ
	VYbIOslbYkCSiL+gyHRiDhs1H4sCIHL0XlWKVvVEYSDaQYksJcKubOxHPCBp0ppS
	ELciUmERhtM7AdvvRUhph6GJopohAPQwSpBRlFAPB8pahUiNOtGbnoorLCCPBmR1
	3fik4T98EukcUS6RSomBkUTYrjZC2/G4pcwZy8yCVPmNkssSW5HtaBxfhXGNrSIh
	dxIU5CuMKqhYo/MIH8Z+iVbgUeDrC6IVnlnFM2poLoMGbcR8pm1D1l2lkNGED7dj
	2IpqJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptrejb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:12:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8bb155690so5354101cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 17:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761783145; x=1762387945; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=;
        b=XHEwRCbhpKYpPdpXCKXNF0rTrzYmKh7nv3eO8sNtpBl7jHtA2mHNlcijdTHtx5Apjf
         NzJCBZb0KlHA/0MCGRcFUV3C4Y6IK2wXs+1yuocr3kOOtAAsO3yTSgzFmmzmjplbD1he
         QBAAX4/qqU/bDduguA8TiDZFdPn+cvv+oDjUsB3NBPAeg3uBErw2ofk/cPcMQ/6GsmAV
         W4s1vd6rXDRu1VlpMwqV849LlZc/Dx08MXUvTLkJ2ZOeyK/dR4WOO50uYU5ctkbbteFy
         hTot671xBNTG+jLSTcIC3s/s2BhVOpy54hgy0ts9NqgTDmiC9iicP/5CZbPraKLIoBYT
         HApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761783145; x=1762387945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=;
        b=JAVnQ10IKBSB+wNRAaF6Hh7ksMJdXORyaJnmeLYeF9pZttyAU9/jax4PX0OEGKHAHI
         dLNfLxnRp6wOfXNOFnR9WgBP3OJ4ZXowpe30nEoqf2HvmYJm7utRgiigPpxqcTiL8R18
         iHV029+DuLyMC1I3JlOLfF1uDl85J31YrOQBqZ3rDx6h4ukuEFnRcrztHbVGriAmACkT
         6dCQpyKaxvwem/0/tNiqFWVroo0xm6OBjAvJrYiU1vMh0NwGAgbZoqfwn6sxnacZJPC0
         3mTF7uN4SGueRx9KNGHKoDVhJ9KlQ2bsjbgSxn/Zb+O+l1wcu3oskk5Xl7se4WHg+MbR
         jLbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIg/B4agha8VwEJOZFL2nFcTbjZ4oz3wQn62lxvZCZbsHd87NZeQhURuuLxaSwWgV2aR29CMbKetHqsjvD@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8XS1yqO+q7pLQ1/fj+kwSwe8qVQJ8XAecjxsFISR1lkvKdnt
	yrOdrioF+qdi3WIgSXu3U5kor6hbncMykkzUwlnZb9j0OL06psObZbqAopkNqVNDDa2unb/tYBI
	+SFFIMfz/JAmE0D0w1f60ckWc4TJ0aLKZmjcGwhzsvE8tXBCnNvjTqlAZq1ZaVhkYK93yGs9f9M
	qh
X-Gm-Gg: ASbGnctLCtedb+Mab6l/50Vs6i3KZQsu76AFjs+fmoT7tWom8YhPtkncUMvNQ1Ybqbz
	yamSlB+DYeytND5Swek+rJjLF2/OVCniaklNCiYsPB6lokYepNbpexWi6r6k1gk+tBW42rhmKCI
	KJiv0w3JIe9i30kOJkH8zNxTICsHLO+w2UIRBZNrqjtvYmT8RkCijMILf0ZbxQJif5Yr/oDxkSw
	E4pc38njZrM6wGu3gFxARs13AmnBUneTuepGD/dB2aN/ewipp1/4uXmPfo+iy27TBN74T+dLDSX
	qxQL2a8cNwyucDBp8Ma8V2VfJ3ZYH/kGleSu3sVoeuDGqmziEOLcwlUBlU81+sS2bZJsqbLWzaR
	IzXK97v0ZUz/Zjzp+EwzPkYt0NbtIP+s+zfKFOC7e7Vc0n9TtI7HahC2sYap93RPUvyofAKhMek
	TdxzFrYJufh8Mb
X-Received: by 2002:a05:622a:355:b0:4e5:6c5e:430a with SMTP id d75a77b69052e-4ed22b201demr15246371cf.64.1761783144885;
        Wed, 29 Oct 2025 17:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTTPJzQ4pPAdhaocWtdADne4C/nq9/kxzm5f9yI/Y1cbenNeHY/sD8/KOO3LAKlfuZ51CL3w==
X-Received: by 2002:a05:622a:355:b0:4e5:6c5e:430a with SMTP id d75a77b69052e-4ed22b201demr15246121cf.64.1761783144399;
        Wed, 29 Oct 2025 17:12:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f8471csm4163592e87.106.2025.10.29.17.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 17:12:23 -0700 (PDT)
Date: Thu, 30 Oct 2025 02:12:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "Nikula, Jani" <jani.nikula@intel.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "lumag@kernel.org" <lumag@kernel.org>,
        "sean@poorly.run" <sean@poorly.run>,
        "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Message-ID: <75lb7tqpoxvvf72iv3ag23yw32xce6ifxaxq4sghb2jhwxbr5c@wbjnp44tgkm3>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
 <jn7piiqfyeiiinpxu5ht7qza2la3cigdqlhtlvuvkbzqeyhcad@v5aypgcrcdok>
 <d768e2abf7e27edac66f1d0068540e2b0617561e.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d768e2abf7e27edac66f1d0068540e2b0617561e.camel@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAwMCBTYWx0ZWRfX7ZPQvfioFKLn
 RUiPdlMgCPwjxxFXKtDC7CJcDSnVAsYtnLTJehJvFrqkMv9LQg0/ghu+yxF+cLnZfMuAOpId0Nf
 0XzCD54zVJora/lslT2/i9KA3LcNPnXWMZXMt8AbSWSxPqXbi2BwnfuoD3LV/IXZa1qLl2mAMV0
 qYATWGxgOVOAvJUYRwE28ZZs8qmfGZL2XP88eDrhOXNE2pXVVYiCJSSDd9l3ZR2J77kuoYTjsv0
 N8Ik8dNCjTENao368T5mr4kRH0ZPbG6Z7QtP/tVThunVWbdoVFpKxtwmDthp9PMF4SB5abB5GXy
 ahGApwF9d8TTyjnsQce60TlhCULOmgPsz5bSTktGQkaaUAndUoBLL3wRj524RtUIYB15zuDjsXs
 M/Ey3dUMRvAW86bEnnSjNX9qLEQ6Yw==
X-Proofpoint-GUID: dYYaRBX1e1vqwDxNFlkcQtDpFUuJvpBc
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=6902ad6a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=IdroE-pjToVxfVGS2yYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dYYaRBX1e1vqwDxNFlkcQtDpFUuJvpBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300000

On Wed, Oct 29, 2025 at 09:43:45PM +0000, Almahallawy, Khaled wrote:
> On Wed, 2025-10-29 at 10:57 +0200, Dmitry Baryshkov wrote:
> > On Tue, Oct 28, 2025 at 03:28:17PM -0700, Khaled Almahallawy wrote:
> > > The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3
> > > spec.
> > > Update its name to align with the DP 2.1 definition and reflect its
> > > actual use in the code. No functional changes.
> > > 
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> > > Cc: Dmitry Baryshkov <lumag@kernel.org>
> > > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
> > >  include/drm/display/drm_dp.h     | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Would you prefer to merge this through drm-misc-next or through msm-
> > next?
> 
> Thank you for your review. 
> it would be great if you can merge to drm-misc-next after I address
> Konrad input.

Yes, please send v2 once it's ready.

-- 
With best wishes
Dmitry

