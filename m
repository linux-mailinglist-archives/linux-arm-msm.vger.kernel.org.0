Return-Path: <linux-arm-msm+bounces-70729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE86B347C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 18:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01F4C6801A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A392301461;
	Mon, 25 Aug 2025 16:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akle5lkg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2A919CD1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756140075; cv=none; b=PhBsmno3w2GPHTdEVV8Ma0FnwDkRxmgMCgU7fIy42IBTaBg4UqRXLoswlCrR2TGjju2julxH4KL/5Vh3+3NauDucOsr2s2XPL9sDgAN99jkqFRXUFgtX4JgFFLxQgjb/U/mq4U6VJpc4OGOb7F9MA1R46h4Co5cgeWOYA/GirwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756140075; c=relaxed/simple;
	bh=A+G8jnfgD2STlnRv2PWK1wsGbR5P93Q/wI0sDAxrh+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcZwqTfehKd/fcPFKNBwOMqWm5Jci1+Il81xUsnAMTuSIfjp2B/uA1QBhxNVFMWy9shtVOoOSS3hAogKKDhry+A1t7bTkj/fQj7qZT7tv1zjth6b/Yhr+VGAUimiiV3yyq2v0jVUaf5+XcK0Y5aUzQcL3OsdsmVFKlyPCCFBXqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akle5lkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFu6Pk000801
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 16:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SUGCf9gEHaW+/RTV5UaZ+1IU
	xig0tsOVObr1R4RU2Ng=; b=akle5lkgTZUlRBiVnK9XxhwYCRubrlWxOlrEJ/mX
	OQ7/6CcPvMNaMI8YTkJ1CqXLfPgt3IPndshefkiw9uwn0ziYaYT+SldvtDd1cOUA
	9pacxNvbwstkKzSOynEBlLVXVCUH3U+XPhWYY3IKpWd7Isib7f/ns20AXDMlGjt4
	hyS2+6Eb5Xjm+9NwLXWTPxEObQO6nmyoyRiCQKjJhFhiNvkpwLAlYlCe/vDDi8Wx
	xzB3EJuUMRo1TvUah+6iIetAHIn5CqcwTlli/mdFlJaRrOG5hFhc+ddZZ4jxdfcA
	srQsgiZ35HgnYat8bQL6GUuR+yR2QOS4JNdbgbLRKnDY7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpnwnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 16:41:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109bccebaso134291901cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756140072; x=1756744872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUGCf9gEHaW+/RTV5UaZ+1IUxig0tsOVObr1R4RU2Ng=;
        b=FB0x4AB4DOzTJB54gmoO8k6Fyg5bGEy3vlOXrk8TtQS0Q3gCZ5ivMIgCKuP/lzHsc8
         pXRT7PzwPuZC/9e79FiZcWg7VHTVuwjeRgyOT3q9ME2UYBiCfml0G1NBjp1grh35PUPo
         uhH6XYTfbYCHefRLIdnnYo1nZAzROCiakygTteAnbB9G4Snbwg/XI8HqVcMDDpOAzxkN
         qIn/WdNKE9doG+zG5qSYDIr44P0qkAfrdjaWo+KcOWubWm7oj6jFDXuyCeGtj5wip55p
         qzSMOtFJmn5rLQcZN8yfa6YEN9GnnuJ0eKT5b/RpVEMcstVlhvwtHQTClEHSPNHQJyBa
         vebg==
X-Forwarded-Encrypted: i=1; AJvYcCX1iysrtkMPzz7BUPFgB2+/rQLmBT5uMTAvwX1G4sJ5vKy7OLeySCxQ6CA32vEpWt20Z7+hsdWK8r9Nps3b@vger.kernel.org
X-Gm-Message-State: AOJu0YyQx/Yn0/HONqvyUHtuROIRdDI+5RnoCftB9JBbAg0Hh3Xjqxs5
	E//FZgonNezpGuncSwTXudKsQ4jZ4H3XOP14iykgnjHNYI2ltMKj6Zs2S+X+ghUqsnZT26zBiOU
	BNP25+O/r+XbUQF9rcc3YIUY9GEBNntST0S+fXZP/HeRxPOu1V6AN+fu57G8nvVceD/mv
X-Gm-Gg: ASbGncvSYDzX+ZOSE1kTt2VdggpFII6I7DrGiyeQG1sM5LNCxBSv9WbtdyAxsxJHyof
	LwAreKSwPKtnOszyRdDeP7Y6epN5zdYkfqRNbMsDPURPOUvOIgyOOXfhIw9Vbshcd5EAnk/YtqC
	EUVtCX+sMKZS5HSEKMLvX2bTOrdfEbLSFrCXX0OKB5a+c7Wi9XpEt9rP0Yx8T7ABzWdKGxkJjHB
	x/9Yy+BjpOZj2Wa8owASyff0peLdHwAzuWtBJewUyt3a6Tlr9Mw5tEibn7qoyP1F71mV9APACTq
	Qg7ws9l49iQ6zVcn1Xs+JzUVpbnB9xWFuY42b8R9wntINu+vAXshnu2VtdASXH/DXiVwVO/r8Xb
	HsUNmpnDuqjfSbiXdGJfJi+feGh71BXNJIoAa/UNrLrT1CFSoNQnh
X-Received: by 2002:ac8:5905:0:b0:4b2:8ac4:ef56 with SMTP id d75a77b69052e-4b2aab43ab8mr130527851cf.77.1756140071864;
        Mon, 25 Aug 2025 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoqs6K3ZpqTkzcj7pYumPFvNMUPXYlClvXN3ij8BDNr9VUaeeMGuXTmsI96ga3TCHPX3H3WA==
X-Received: by 2002:ac8:5905:0:b0:4b2:8ac4:ef56 with SMTP id d75a77b69052e-4b2aab43ab8mr130527481cf.77.1756140071290;
        Mon, 25 Aug 2025 09:41:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c0221dsm1672404e87.7.2025.08.25.09.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 09:41:10 -0700 (PDT)
Date: Mon, 25 Aug 2025 19:41:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac9229 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Xi5Nwd9LVAJm5hmD8FAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: wS964w4FIA7EYrD8qZ26HVloQxjxsOyf
X-Proofpoint-ORIG-GUID: wS964w4FIA7EYrD8qZ26HVloQxjxsOyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1nNtHFzkoAPP
 tnVYrOepI+uay82JqYup2MypSmVgHr/IBxaIN/med+9+K17m8hBAP2dowrmvRfXWRqYiZlacSBi
 yAlnDhgkvY5O4a6KKCHEE/453FOyQJLBQi28RdASg6iij/q+crcTXMngrSyD3Z3/ezQAYQnhi1q
 xRENKhElKf4BuQL7d4WimF3kwn1y1wRd253WOTjdpGvfgkY2RMk7sRklFPQgi7L7OAVoQ0u3IhZ
 /b7eUy+5Ejl4x0QWL0G+cOiPkf1PPLCR/7pYGgJaYwj2XvswYbKy+NwC1Aq6oN0bzNutoUY0MN0
 DipQ5F3WECg6NfkiqozGKiNrdb0UzuMKyJ6/pJaEvISymb1Qd9ARp+r2ElsXrwS6bzjz4YauMRG
 BhuO0Mnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> state management complexity. This change removes the drm_edid member from

Please see Documentation/process/submitting-patches.rst on how to write
commit messages. Please use imperative language instead of describing
the changes.

THe patch LGTM.

> the panel structure and refactors related functions to use locally read
> EDID data instead.
> 
> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> - Cleans up unused drm_edid_free() calls
> 
> This simplifies EDID handling and avoids stale data issues.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>  3 files changed, 26 insertions(+), 58 deletions(-)
> 

-- 
With best wishes
Dmitry

