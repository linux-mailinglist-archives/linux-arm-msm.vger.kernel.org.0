Return-Path: <linux-arm-msm+bounces-108175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIdkOx70CmpZ+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:12:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166156B515
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B58F230331B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C0E3F23D8;
	Mon, 18 May 2026 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="n8mZFo3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78EA3F44E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102489; cv=none; b=fvf7p3EX0Fq0mNaIjOPjNLzRw5iTbAyWEQOQWhg808R4pXj7QtO7kGbtgJJ89g4PVzIojWnPMgwp2LqzJ7z4QECHWxSF6XgLtRqhucF+pg8Rq98KTB+DjwM4DvwNWBvqhbucvxh74n68BIUVviVx0gN7Dpv57rDbve0OTnIxVnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102489; c=relaxed/simple;
	bh=iaTITxDr07XRcxl/HhT9di90JHIdWcKVQbERY2bAvJ0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rHSWaIOTY7/3K5vt71wFXy2/kZB6hTZCyhsiqmmnymqjbQFX9s4pM7y4O0zhnQBdSZW9gnIB4LMSVbtobyO17LLSX3LqZ4V5K1oVOPpMT/hFhRheE/e/dNqGK8P6r/MtF/eu4eTXVW6coVy997es46V+1SO6TlXk9BitvMaN8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=n8mZFo3O; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HGWfEP/Ao03fUy086zoke2HPPDQ8UgWiCz5qzSZN+vI=; b=n8mZFo3OEqk9W3nskKrFueSUXU
	TBUQwCqWE58bFYXR4g+5wcTYc3DU9HSg6KrGVzQbVkU/kPFXEpsrt5rBDlY3dfG9tOGeD2rppkKay
	23v+NQDO2ddBdlORkKWqSEyi0RxwBU+58ngOel1Auf3jZJ/1Y2ZnuMgzkGhg1zpEkx/EuTemJPMnA
	Yb4sAbelJN0e5yisf7jsZtWx89HYXfz2fdPiHFPbTTyrwD29hFSCFfoMsP6xxATwFqKUKRBvjX9a7
	WKXDGAJxJSOAY4lmQFAf53OwVWjL6OBIuBSvqONs33ut2BmBwPCdO+Uqig92XAgRQGbo5apddS1GO
	WQvKxDzA==;
Received: from [79.117.146.159] (helo=[192.168.1.135])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wOvoE-002aO7-T9; Mon, 18 May 2026 13:06:54 +0200
Message-ID: <4fba5085-07b4-4ccd-b2d3-256b65bef159@igalia.com>
Date: Mon, 18 May 2026 13:06:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] drm/atomic: track individual colorop updates
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Alex Hung <alex.hung@amd.com>, Simon Ser <contact@emersion.fr>,
 Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260506192633.16066-1-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20260506192633.16066-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7166156B515
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108175-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 06/05/2026 21:23, Melissa Wen wrote:
> This series aims to track updates for each individual color operation,
> allowing the driver to react accordingly.
>
> - Patches 1 and 2 make colorop update process more consistent and
>    optimized by only keeping colorop states from active color pipelines.
>
> - Patches 3 and 4 make lut1d_interpolation and lut3d_interpolation
>    colorops correctly behave as mutable, handling their changes via
>    drm_colorop_state.
>
> - Finally, patches 5 and 6 track colorop updates of a given plane color
>    pipeline by setting plane `color_mgmt_changed` flag, similar to what
>    is done for tracking CRTC color mgmt property changes with CRTC
>    `color_mgmt_changed` flag. The flag also tracks when a different color
>    pipeline is set to a given plane. That way, the driver can react
>    accordingly and update their color blocks.
>
> It also fixes shaper/3D LUT updates when changing night mode settings on
> gamescope with a custom branch that supports `COLOR_PIPELINE`:
> - https://github.com/ValveSoftware/gamescope/pull/2113

Hey, Chaitanya, Alex H. and Harry,

Would you have some time to review this series?
I kept r-b from Harry in the last two patches that fix night mode 
persistence on AMD, but they depend on the first four patches that 
address Chaitanya's suggestions for optimizing colorop updates by active 
pipeline and also make LUT interpolation properties correctly behave as 
mutable.

Thanks in advance,

Melissa

>
> v1: https://lore.kernel.org/dri-devel/20260318162348.299807-1-mwen@igalia.com/
> Changes:
> - include linux types for function's bool return type (kernel bot on MSM
>    driver)
> - add Harry's r-b tags
>
> v2: https://lore.kernel.org/dri-devel/20260323131942.494217-1-mwen@igalia.com/
> Changes:
> - [NEW] two patches to only consider colorop updates from active color
>    pipelines (Chaitanya)
> - [NEW] make lut interpolation properties mutable + Alex H patch for
>    kernel docs
> - track lut(1/3)d_interpolation updates (Chaitanya)
> - rebase changes according to new patches
>
> v3: https://lore.kernel.org/dri-devel/20260403135909.214378-1-mwen@igalia.com/
> Changes: rebase on drm-misc-next
>
> v4: https://lore.kernel.org/dri-devel/20260501132527.522320-1-mwen@igalia.com/
> Changes: fix kernel doc (kernel bot)
>
> Melissa Wen
>
> Alex Hung (1):
>    drm/colorop: Remove read-only comments from interpolation fields
>
> Melissa Wen (5):
>    drm/atomic: only add colorop state from active color pipeline
>    drm/atomic: don't set colorop properties of inactive color pipelines
>    drm/colorop: make lut(1/3)d_interpolation mutable
>    drm/atomic: track individual colorop updates
>    drm/amd/display: use plane color_mgmt_changed to track colorop changes
>
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
>   drivers/gpu/drm/drm_atomic.c                  | 43 +++++----
>   drivers/gpu/drm/drm_atomic_helper.c           |  9 +-
>   drivers/gpu/drm/drm_atomic_uapi.c             | 93 +++++++++++++++----
>   drivers/gpu/drm/drm_colorop.c                 | 16 +++-
>   include/drm/drm_atomic.h                      |  2 +-
>   include/drm/drm_atomic_uapi.h                 |  4 +-
>   include/drm/drm_colorop.h                     | 34 ++++---
>   8 files changed, 136 insertions(+), 71 deletions(-)
>


