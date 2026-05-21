Return-Path: <linux-arm-msm+bounces-109141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDwsLthcD2oLJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:28:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B45AB6D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A8003019CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308A5388E63;
	Thu, 21 May 2026 19:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n72JhuMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60ED2727F3;
	Thu, 21 May 2026 19:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779391699; cv=none; b=qYLnCXb88b7auXC3zyESTfG4VBORC4fXKVcnI8aSTb9YEzAErRmrHBC2O3aJRlS5BHis/yPJZSLNJcT3exoeuVsUpSHSwDHB4bxB9T297RSupfQOR3v3iWwE/qEttW55wWphONBd8rZmVSWx5DyoSSZUKZk4g2xYGaPO2qxJJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779391699; c=relaxed/simple;
	bh=r6T7RmWzjs3II7tUKBDDokiznQjbhT5V+u1FBiPXa+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIuZ8g3k7FKfLXKonLNrk1o7u16jlerBz8DGAO+ZnQHb4aKN1wUcO2vdpXiR/i9x4vbJ2Ox8p0JqD1z34Lx50I/2BIPG2J09tTgvH2XV4OtPgv3reIYyPF3ZptVkkIV+Ms7nJfoguHP+njW18Ff6eja+TTxJH6UH6JNPrLDzSwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n72JhuMA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE0F1F000E9;
	Thu, 21 May 2026 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779391697;
	bh=CJcyzecC8tciKtEQnMIWnlmWg2fkVheR+DFJEp2gElQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n72JhuMAtFbvW9EYJcn9KNxhuke5vDl16yGwekFQRZ0HZx2eZR6KnJ1tuPQMqNaj1
	 bRPwtEFrO4hlVLRhFe0B1NOFxL7VAkufsTCfHNOdJNSzg6xHEUCFXskcFH93O8Y1mF
	 GWtGzG+SeMC/wGYHvusIDEZ6SF72fx03GaZWG1sioLOhDY3893BRE5J4+U5g96Tpik
	 Z2LpFxejuzzy3iTWWkfaj2MzRNaxC3tDpdoxscymckBS7jZAU835ed/at8dd0DndSh
	 BeZoe2dLP8C8wL6oCiPQ23F4iqions/3aH8vgctw+9EgyELl/QE5v6nM0g6wHwBt62
	 +vF1Ehgisdb/A==
Date: Thu, 21 May 2026 14:28:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/29] soc/qcom/ubwc: rework UBWC configuration
 database
Message-ID: <ag9crUWAzrAU2ue_@baldur>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109141-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 301B45AB6D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 07, 2026 at 04:02:56PM +0300, Dmitry Baryshkov wrote:
> Currently we store several settings in the configuration database. Some
> of them are incorrect or not completely matching the expected
> configuration settings. Others are directly derivable from the UBWC
> version. Rework how we handle the values in the database, trimming it
> down to the UBWC version, HBB and several flags.
> 
> The series includes patches for drm/msm as well as for the soc/qcom. My
> suggestion would be to either create an immutable tag for the first
> batch of soc/qcom patches, which we can pull into drm/msm or to ack
> merging the first patches through drm/msm tree directly.
> 

You can find the initial UBWC patches at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260507-ubwc-rework-v4-4-c19593d20c1d@oss.qualcomm.com

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v4:
> - Rebased on linux-next, dropping merged dependencies.
> - Reworked A8xx, simplifying several corner cases.
> - Link to v3: https://lore.kernel.org/r/20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com
> 
> Changes in v3:
> - Corrected UWBC_STATIC programming for MDSS 5.x platforms (Konrad)
> - Switched MDSS 6.x+ to qcom_ubwc_min_acc_length_64b() too
> - Added qcom_ubwc_enable_amsbc() helper
> - Reworked the DPU handling of UBWC config, making it simpler to handle
>   minor revisions.
> - Removed the comment regarding the best guess for min_acc_length
> - Link to v2: https://lore.kernel.org/r/20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com
> 
> Changes in v2:
> - Renamed MDSS UBWC programming function to make it more obvious that
>   they are related to the MDSS revision rather than UBWC version
>   (Konrad)
> - Brought back the patch to use qcom_ubwc_version_tag() in msm_mdss.c,
>   got lost in rebases (Konrad)
> - Link to v1: https://lore.kernel.org/r/20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (28):
>       drm/msm/mdss: correct UBWC programming sequences
>       soc: qcom: ubwc: define UBWC 3.1
>       soc: qcom: ubwc: define helper for MDSS and Adreno drivers
>       soc: qcom: ubwc: add helper controlling AMSBC enablement
>       drm/msm/adreno: use qcom_ubwc_version_tag() helper
>       drm/msm/mdss: use qcom_ubwc_version_tag() helper
>       drm/msm/adreno: use new helper to set min_acc length
>       drm/msm/mdss: use new helper to set min_acc length
>       drm/msm/adreno: use new helper to set macrotile_mode
>       drm/msm/mdss: use new helper to set macrotile_mode
>       drm/msm/mdss: use new helper to set UBWC bank spreading
>       drm/msm/adreno: use new helper to set ubwc_swizzle
>       drm/msm/dpu: use new helper to set ubwc_swizzle
>       drm/msm/mdss: use new helper to set ubwc_swizzle
>       drm/msm/adreno: write reserved UBWC-related bits
>       drm/msm/adreno: set fp16compoptdis for UBWC 3.0 formats
>       drm/msm/adreno: use new helper to set amsbc
>       drm/msm/adreno: use version ranges in A8xx UBWC code
>       drm/msm/mdss: use new helper to set amsbc
>       drm/msm/dpu: drop ubwc_dec_version
>       drm/msm/dpu: invert the order of UBWC checks
>       soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
>       soc: qcom: ubwc: drop ubwc_dec_version
>       soc: qcom: ubwc: drop ubwc_bank_spread
>       soc: qcom: ubwc: drop macrotile_mode from the database
>       soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
>       soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
>       soc: qcom: ubwc: deduplicate UBWC configuration data
> 
> Konrad Dybcio (1):
>       drm/msm/adreno: Trust the SSoT UBWC config
> 
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  11 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  93 +--------
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c       |  50 +++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   5 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  39 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 120 ++++--------
>  drivers/soc/qcom/ubwc_config.c              | 294 +++++++---------------------
>  include/linux/soc/qcom/ubwc.h               | 103 ++++++----
>  10 files changed, 235 insertions(+), 487 deletions(-)
> ---
> base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
> change-id: 20260211-ubwc-rework-e6ce1d8eb520
> prerequisite-patch-id: 5bc7dddd09fcdb4f534f8468ab3ad51781667066
> 
> Best regards,
> --  
> With best wishes
> Dmitry
> 

