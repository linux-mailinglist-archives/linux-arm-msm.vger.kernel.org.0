Return-Path: <linux-arm-msm+bounces-68303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A84B2052E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C63E178D8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F0622F76E;
	Mon, 11 Aug 2025 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUMKBBWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992AD227E97
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907760; cv=none; b=JeuBbXzjUy0dX7lLpoyak83axCJgurGisTNJ03EeT6xAEQDqc1B46LAwBYGN/Qmok5zAIk6ZHC3ICq7nWw6WlBa7GJk32fXxL9zRNHT5p7IlXxlOKfOt8f7Z3yMhWyMZTHaHM1oCjYxBbn/b7ORnBga+w1LNb94lAZJU+F7q1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907760; c=relaxed/simple;
	bh=un9Iyg0ms5LHybq45L9Cp1rYThzSovHW6L+pntYST00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVJXbm6segN9Hhj3lP1pMquyC6k+RW9M8f91gd8NvZULFT15VdJXHAfrBscePOPQqOE/JAiyraOLD+t1OpTY1W7ZMNGoSF3Gqi5g4qubnoicPOxl/4V7ii8BPipcEOdN0i1H+celHOJskDp2L7c2oUNCy2+3gZmFSKAqwwWAVT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUMKBBWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dATl029206
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PPcIqJTmGqbCZt8ehrODmErw
	r7fSzpLsxZ7IoVmL2lM=; b=cUMKBBWj3EH5NRlROXLfL/zm1GMoUGSautoC7RSi
	1wFAYWVWYFr/14MQamSCXshR1yf0ddt7QdUlouf92lq6IqdPgv4cA9Us92bgpe/Q
	XAMtRfmEcewLgnxHI4mSVG8+gPnGySDiAUJOynQbjNbH9DGSd1JshvuIPrzNPJE1
	Tt3E/xNpMRfKdEnS3PHRhdYJb0Q0S+/jL9an1IMQJkAHT+fzc4i6aAy3O5pL8+Je
	Ul0IgWc8WON1I+6X9Pj7aCra3mBe6gCHvMslmeVu44jmA3qyjLdIINq8Aaz7E2DO
	udYJwqmIwSKNKk4/64boVtbG1TXvi972gfJNlnd8FlvEnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbxhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:22:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b061ad3cc0so132631911cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907754; x=1755512554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPcIqJTmGqbCZt8ehrODmErwr7fSzpLsxZ7IoVmL2lM=;
        b=P4jk3ldiYTayeXnGLK1P0+HVxBC1ZVq22qz7nXQAYN0PP1eoEjMdISaxiC8SD8g6m+
         4Hw6zDaIGXP6IUQ9SjzJeVjb4lxFhzNtlXIUJsQHbiudj4ftbLgQZUYhHCxjR80xr5Pm
         ohSZmOPCThJLwMgsUAwEwQT5Oqq3v3UgPeW5hxaMEjoDySivkvXFLYRZByK0kqi85dk4
         OWo8QyC5frjfoORRCWTI964X6fh18YLpNSyxf0cC//fOpc3bKQYTeaRtncHPWtgPe+Ui
         DXjBi9+eo6B3n7t5EdE19NajjYiFPgF8jR2QjaB+GoLoRHQbHbMD/j8WmTobRjCO8O3c
         lSDw==
X-Forwarded-Encrypted: i=1; AJvYcCVctvxTRNpDvwrwQtU9+bbapiCh6Rj62g0M4psP8nkrCNTG/TbipY4qgJFbQUv0bgvo0ihZlrsDpSasX/Q/@vger.kernel.org
X-Gm-Message-State: AOJu0YxvGF99k29UT3apJ5/5iNHS/jPkuF7+SONGXZwrZvpeRCarpXB/
	w6Vzh56cMLfDkg24L7xaC23jeShLh+t9W1Z7/784DrrpV8xHevRcXGDcDxvg61HGhYtK1Ryt4WP
	bwVFGJyFmY+VnSplIXz+Ue0Ghm+NuRg8GYonLUB27i9PcrJDxIhBZ5P14UHuXfRQdsNs4
X-Gm-Gg: ASbGnctkIldzd6k22dnSdfTUfEWQZDsqpUGlYkicYPJn95i8bHlPUfhXboXOF2mUfgL
	WuzlCTiPKBlsmfGl8L5ckh+I8Oo+KEHLUMJ8EnC/JkCNtbVZi7cwPTygT3yGJ6y+42wVJyvAEIV
	aaXIw+wwzDTytNkji2pYcnWnkU61gHfcc8mVAtBdQTnUWDjDOJvQtVJAoIbNnCDjBH1KU2OeBMv
	jkS9QMkkaBlCZ8DjYyqjgYv6zhNkpTJ0vlqVCInxlAdgTkaJPMLDUpCV8rb4ywmo8136UW56LE3
	Dn9gWiwkIMxZoEBJQyleSphDt6mdjw3OvC5ZqHMkwVO4+9ZWaf61jJudgdhq4RWHK890ZW4z3bl
	BefN4x99csGz4aAXcJAiG47Tn2aNT8X8ABKJULlfWSZzTTk8WnI9g
X-Received: by 2002:a05:622a:1887:b0:4ae:f67f:58ef with SMTP id d75a77b69052e-4b0aec9df29mr168325891cf.25.1754907753775;
        Mon, 11 Aug 2025 03:22:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/1O6odL8qEXPebSXBi5VVqvakd8Iz/cxzY+rK1t+2/oJ2Ljc14sGyM/aY/rldP9dMAv6Tpw==
X-Received: by 2002:a05:622a:1887:b0:4ae:f67f:58ef with SMTP id d75a77b69052e-4b0aec9df29mr168325461cf.25.1754907753078;
        Mon, 11 Aug 2025 03:22:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332389409f8sm43713731fa.76.2025.08.11.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:22:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:22:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, kernel-list@raspberrypi.com,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
        uma.shankar@intel.com, jani.nikula@intel.com, harry.wentland@amd.com,
        siqueira@igalia.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
        liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, robin.clark@oss.qualcomm.com,
        abhinav.kumar@linux.dev, tzimmermann@suse.de,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, mcanal@igalia.com,
        dave.stevenson@raspberrypi.com,
        tomi.valkeinen+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811094429.GE21313@pendragon.ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX2cuC3gxRMgxf
 LMiV9lXLCOWFtMEJ8KT6f6T0DzF16fCZHNxeW/ZW2y3VG8trEL8SSHuP/X5BVHTmrUtbL0h7Tey
 oFytuP4SuCDIPqpDop5cgOcij/d7FtyZxf3eZrKi/i0YgCN0dc8mpkq28xkHPma2/knBjROnbb+
 15O4fKp77m2mkrSuhWuXCMiVNZ6ku9j6IswyqXwHQFFIOQTGUnjcY61L1qLfm+BJG16lD/xB/KW
 /QAsfezOgDNZMRuye6p3JTKyljwmstRiOc6rvMKO/Qh6ut1TazJMtH69IhOYMSAUy3A3e6Wio3E
 ZbL7OCOtFd+33g/o6Sxsvm7+w4ncmvlcgt4oJBe6XJ8wujSOzqgLv0kjnzALUnZc6akEvd4LFGl
 z2clbL6s
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c46b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=-rapNmeMCNZ-4dkNsN8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Yox-fdZg9pI9Syiu_G-5hnbB_RxJspHs
X-Proofpoint-ORIG-GUID: Yox-fdZg9pI9Syiu_G-5hnbB_RxJspHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Mon, Aug 11, 2025 at 12:44:29PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> > Some drivers cannot work with the current design where the connector
> > is embedded within the drm_writeback_connector such as intel and
> > some drivers that can get it working end up adding a lot of checks
> > all around the code to check if it's a writeback conenctor or not.
> > To solve this we move the drm_writeback_connector within the
> > drm_connector and remove the drm_connector base which was in
> > drm_writeback_connector. We do all other required
> > modifications that come with these changes along with addition
> > of new function which returns the drm_connector when
> > drm_writeback_connector is present.
> > All drivers will be expected to allocate the drm_connector.
> > 
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
> >  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
> >  include/drm/drm_writeback.h     | 68 ++++-----------------------------
> >  3 files changed, 89 insertions(+), 72 deletions(-)
> > 
> > @@ -2305,6 +2360,11 @@ struct drm_connector {
> >  	 * @cec: CEC-related data.
> >  	 */
> >  	struct drm_connector_cec cec;
> > +
> > +	/**
> > +	 * @writeback: Writeback related valriables.
> > +	 */
> > +	struct drm_writeback_connector writeback;
> 
> No, sorry, that's a bad idea. Most connectors have nothing to do with
> writeback, you shouldn't introduce writeback-specific fields here.
> drm_writeback_connector happens to be a drm_connector because of
> historical reasons (it was decided to reuse the connector API exposed to
> userspace instead of exposing a completely separate API in order to
> simplify the implementation), but that does not mean that every
> connector is related to writeback.
> 
> I don't know what issues the Intel driver(s) have with
> drm_writeback_connector, but you shouldn't make things worse for
> everybody due to a driver problem.

Suraj is trying to solve a problem that in Intel code every drm_connector
must be an intel_connector too. His previous attempt resulted in a loose
abstraction where drm_writeback_connector.base wasn't initialized in
some cases (which is a bad idea IMO).

I know the historical reasons for drm_writeback_connector, but I think
we can do better now.

So, I think, a proper approach would be:

struct drm_connector {
    // other fields

    union {
        struct drm_connector_hdmi hdmi; // we already have it
        struct drm_connector_wb wb;  // this is new
    };

    // rest of the fields.
};

I plan to add drm_connector_dp in a similar way, covering DP needs
(currently WIP).

-- 
With best wishes
Dmitry

