Return-Path: <linux-arm-msm+bounces-108933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPkaDy+2DmrBBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:37:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B49935A0363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB6043040FBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCCB357D1A;
	Thu, 21 May 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6UQuBd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140BD1D5AD4;
	Thu, 21 May 2026 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348805; cv=none; b=qf3pGjLfkrHS/osU+1rtiheXR0dU9MYVrE/BxXUbwc83SBttO8YZxkKJXjn8T8WsztqCN1A0Xdr00gZHUijX2TNl74QeYltnIQITeWgFu340RJMQCjh5ehkTfPvUNwKktk6aELPv5KA3CH60T5sVOcbESAYrl3PY+VOjm9hHdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348805; c=relaxed/simple;
	bh=X1HXhO4MKj+KA58/sWBWrmVliwgGPmPbC6E/l69bQs0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=c7KqkdOuc2+TZnyKF98AEoy5LdrTBatbEcHaRj9lKVpFrdc+7wupXMDKuWHrWV19NSUdSPUvJ8anr7ZjUV8nnP5qcnIJx8hFP8td3W2pYCZHL4TBKuwykUWsZOQeedlACr3AtHd/1yPCh5SwEr82fw1/zskPqs5S9Y/Y7fRXJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6UQuBd4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F75E1F000E9;
	Thu, 21 May 2026 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779348803;
	bh=X1HXhO4MKj+KA58/sWBWrmVliwgGPmPbC6E/l69bQs0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Z6UQuBd4mCurIijfG+Mm9uAJj27UL8fCw7HyE30fF/OpSPvR8r/41XSMj3+wiLTa0
	 j2oKR9i24+JqeHqvsVN3IxQkk9zKSbYHBgbAWbqM7ZejPU9xv1YLs3LNx5COKk1BVZ
	 eJRjQihNRBaKpyUrcZMUiP8HWjVhn1KFqDowOTKLtHGC5f6ztixI8ox0Y9ZYWoxtb2
	 BCtamcSmiNevy+ZpolJpi4+49Z4Dqq7LHefTC0F3og36MybFyBDLZBPB+xr5XkUrBT
	 c6FY5A66iIvDsCefd89sZQXdoCYzdMsfkpb9p25pb86s+9T+9kQpBGQHMpBI9chUtm
	 X4V9XxziA7rRA==
Message-ID: <6fef8c198bf06bc5ce0705f24775674e@kernel.org>
Date: Thu, 21 May 2026 07:33:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Alexander Koskovich" <akoskovich@pm.me>
Subject: Re: [PATCH 0/2] drm/msm/dsi: support multiple DSC slices per packet
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me>
References: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Sean
 Paul" <sean@poorly.run>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108933-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linux.dev,gmail.com,kernel.org,linux.intel.com,somainline.org,oss.qualcomm.com,poorly.run,ffwll.ch,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B49935A0363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 07:32:53 +0000, Alexander Koskovich wrote:
> This series adds support for sending multiple DSC slices in a single
> DSI packet, which is required by some panels such as the JDI LPM026M648C.
>=20
> The MSM DRM change was originally authored by Jonathan Marek [1], changed=
 to
> use an 'all slices in packet' flag which derives slice_per_pkt from slice=
_count
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

