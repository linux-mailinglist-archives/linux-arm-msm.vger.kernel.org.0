Return-Path: <linux-arm-msm+bounces-86696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 564E8CE001F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 18:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24B1E300DB94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 17:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E44253340;
	Sat, 27 Dec 2025 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5XilzY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AXvqUwNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74321AB6F1
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766855735; cv=none; b=Kfkl/C9iWP68d/3gR7GiQpSCbLVtpWlJ0DxD49tTSs0qisr4wqd48vS/TEDVUlgJkd5wu2u4Tv4iVhebk9Pze/G7aR/f5nh4erio/BYp8SjAsDPQjNRQa7/TkA1ZVQGdjgMNwmzd+4ecezjzBA/1xNeXxvRdgvuDS6xNScAxHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766855735; c=relaxed/simple;
	bh=fwSYoWUhlvOk93mAFeFzdqaippMyY4rx0voE/me39Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg9b+7MIeMkaCuTuQEMOYXrnwEzmQzfxGaSW282fm+Y9UckjekM+3B1ihsOdvWHYM24+rpUgfPBICGhqImK9fAGve9LbOqPwwvkpKgTzktmSjRLM932YDs30W37C8HWd8tV8si/fyib52giOuuzF9mbRLnlMUj4g16M91n93jjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5XilzY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXvqUwNb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BR7rPQd3443643
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hDrucTMu/d6l0Lwjs5E9wquH
	PdvJCaNtTxxCTiFaX0U=; b=f5XilzY/UKLaixnCNcAADCTE7WCdr5FrS8gJbvgP
	Lmh+R4YCTzdcwt74969KA7zaPL7gab/Tbew7s6S+LpcbnDMsj1Kckqr0T4e8c5lb
	xmtNtcoGI/aFY6QbeVT1dyhffGV+pLSJtBFpBJ+oxoToJQvIIcBoA44I91QjLl3u
	ze0ec7mkudIWks6HRwOAE2keQXxZDAImgYUHd0TuOMmNuc4TeXm/O3DAZAyh9sZl
	OsjNpF7bMUdd3xusAN97whjRJJiKQlWu+AG2S1nrtvWFxESHvqZvu3OvS4yATGiH
	NERtw+anAmPRztJ9W7uDMr0oG3N+L72jDzPShb89vaLvTQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba55e128r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:15:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a47331c39so212072996d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 09:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766855732; x=1767460532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hDrucTMu/d6l0Lwjs5E9wquHPdvJCaNtTxxCTiFaX0U=;
        b=AXvqUwNbETvVFJMwWiXvcff3uDd+bZQsZl/O0eprdimDAcqKZ4jnL5KmwvD4UFQX8q
         OxKEZzJfeK3dCteVhTUiymZ5b3HCqc9LalCg/OVtNDHWpi2LCAoe/HWHZa5KzDsfwhQh
         1XAtDyied1DfOxwB3fwxiReSZtCiRw50LCR13PybotTzYD1Tu6GuNr/GUyk31NJAv8Z8
         vIzM3LWQm841sj2yIl8u5BscPT/+1hmzyYbiuDUCgbVDkGiSIawwwYvKBtKFJwlkqzaF
         YEmAFWNAYjzbFx0GPpfynTy9YyNQtqm7oeZnyg9SLDQV1E7mojjJ78ROEVErTonnJndG
         A5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766855732; x=1767460532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDrucTMu/d6l0Lwjs5E9wquHPdvJCaNtTxxCTiFaX0U=;
        b=RGMG56i4qUJiITTF5rTmAR/GF87S/mh83bTQXfOF8PWaIkgPtkenrDx1Uv0twQlJdO
         i5zE2O16rtQR4s7hOEcpg1xKj9Us5ooHND4CQLootrHrzzXFrc0sksuY/CbqoiDGK3m3
         JnqMQmZn6DI8nBfBmIQa1K3J4QMU1fBWebgj338IvaBgz3GlMUCQ0YpsW0g/DngU2FNK
         5baNr/jM6SkdaRzY39ap304DLlPiZyn+sWgUkckLkqhZ0KS3i77Gojo0H5yADNKT3yx5
         ZH3Oj6Qb/E4BpxIHn11kFyRXMj1mphbAoyX4sw9n1KY1CXb+j0VNNWaiVTyxCWQ1IM9L
         NxgA==
X-Forwarded-Encrypted: i=1; AJvYcCUDnO45hSPG6yX4AyyTr5jZvRFb4iOOKEM+OW+XqI3OrU/ANo07SVgGEwNNpqSaxHZRgkkh7TeIgUxpdNAq@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxhp8dJmAGdMOnxmsdo9X85bJx+m/+GHe4VkceLpzh96Ap1kX
	YkKg0zG9QoD2+gyj5l47Z/uTJDzeMr2lKm9+jm1MknpTdFq0/phVsIIfyFhVtSckDhbAiYjTywf
	EMtikis7nXtR0sbvuPFjIoj0TokclMfS8zYR8he+cUsZr5D2+Wmn8joCCM4ZOoQTpnlko
X-Gm-Gg: AY/fxX7qHjMIvXRkBugI5NzAhkcysi7BYHNkmzrfKZJk64dSfFnz+S3d61VzA8iXeNJ
	HBilYuH3y874fX6KXdsAjaWzyHg0sSFt7oP2BuKF/NoW79VVMXE7R1RvdM5eTaxCKkDn1GuN6BT
	HimdXAEipOmeh6qJV3rDLcv1qgOKlEmEFRTr2V1bNjj/Q1ic92f/Ja6cswoFVJ3vLMjrb3bEt8/
	gIOu1qwU5u8+3KChW92qtAC2YFje1oVHV7osqkpSbID16FTxs79O7zgkD61SFGoxs1k9pylfcu2
	V4ggbk4zzmGBMeeXeIy7iiW8gvSuhYfQ+DCddJ8pY5wdSIgL86Sv8zoBrYDKvdTdazPq6tOTvAF
	4lZvlIt5C5Rmv+ix9svqBEcuk6hVR9ZNf3R22YTr4dEgnSxAnF4dw2ltEV7BqpmNz45zgZj8nKV
	SYAFrecZULydnUOVBqMAmtzMY=
X-Received: by 2002:a05:6214:610c:b0:88a:30aa:6c01 with SMTP id 6a1803df08f44-88d843346a7mr320090616d6.57.1766855731857;
        Sat, 27 Dec 2025 09:15:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG8dtmHBCMixEdDr9CNrcosDg1mqfzDAkf1YwW4Tzgo2YwThCJUKKo+QNtZbWzCCm8riUZ6A==
X-Received: by 2002:a05:6214:610c:b0:88a:30aa:6c01 with SMTP id 6a1803df08f44-88d843346a7mr320090336d6.57.1766855731439;
        Sat, 27 Dec 2025 09:15:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267b184sm64491571fa.43.2025.12.27.09.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 09:15:29 -0800 (PST)
Date: Sat, 27 Dec 2025 19:15:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v7 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <hglfo45u7omm2g4e2yn6rl3kxcw7wwfdf3wl2wjibt7jedm2uu@5z4rxbtemgdc>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
 <20251226070534.602021-3-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226070534.602021-3-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDE2NCBTYWx0ZWRfX4rNVP5LxWzTD
 pIPoe5y7IifgksjJziOApaYnv5ciAhXHQFfhq7tGhXKPKO7DSKO6mt7nr2H+lBajzpJms4edzDo
 RV/eRaxDEP/hFp+Efnhz57wq3xvCxx4V6e120b/Pcnb0+MFPUcrp9iLX/kjQIV73s4V9O9j79tN
 SXskQ3G7Zh6jio+PSDkqYspX9jneoqXkoG/aj7p5sltLTwRUU9s8VRZSozlw+r9f2kDWcxhgpr4
 hI/tMMWBvoNhY/8WC6VMUXWhL1uZqcOn2iWrl3Y85NT8j8xbZtcl795Dknq0DsB3YqKXl/h7r2c
 qw9mXIGXdvOM9y+yTaydB5gESo98r8DFYU4dahuH2DcPR+Hv5rTGlwlsQPC8OC2so3tX+h+hkho
 yJUouondW5fo3VXv/78vXsoz2cNrgahiL6g4L5XnqiP+wICrxxgwXu1n5ckyIravgwN4Za9CspE
 aanuNhUZTspBl5CTAgg==
X-Authority-Analysis: v=2.4 cv=UMDQ3Sfy c=1 sm=1 tr=0 ts=69501434 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qdViAtwzWZxfokMtc90A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: wseC4OeQfW6hecxG1ZVwL9_0pOmVmpIL
X-Proofpoint-GUID: wseC4OeQfW6hecxG1ZVwL9_0pOmVmpIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_04,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512270164

On Fri, Dec 26, 2025 at 12:35:32PM +0530, Kumari Pallavi wrote:
> The fields buf->phys and map->phys currently store DMA addresses
> returned by dma_map_*() APIs, not physical addresses. This naming
> is misleading and may lead to incorrect assumptions about the
> address type and its translation.
> Rename these fields from phys to dma_addr to improve code clarity
> and align with kernel conventions for dma_addr_t usage.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 77 ++++++++++++++++++++++--------------------

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  1 file changed, 41 insertions(+), 36 deletions(-)

