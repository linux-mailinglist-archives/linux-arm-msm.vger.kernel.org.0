Return-Path: <linux-arm-msm+bounces-92441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLxALG32imkePAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:12:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7F7118A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9CC53015B8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1395B33F8D6;
	Tue, 10 Feb 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QrTI9gMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E505D33F8D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714721; cv=none; b=Hxqx6ByNJKvfn7cSco4iyi9Oqdd0vMs1c+tW1bax7evlDU0dWycFTkffhRTXNGmp21e0MPiTmrcV1ykmWOqsRRjl+x9+Lza0mXWI3umlD86sHpiXmW7LChSqx6Fdq7rdGaCnfgkWbK6175LnUOD0r/lQ287aKI9YluDOBzTwePk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714721; c=relaxed/simple;
	bh=VGvOSd5PWRmZsvyKMBdriUuWlEztjMSBUqGgvPN4GMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BagQsGIgBe3SkEKZA/q4ENQU7ZjxP+Htd5T5pfE0un8QFSMCZrTVbjC26lwv9sZyEfUky+eRF7iDPfk3M5Wpn51NKN9GWykPel+Xxa18SrfmT92fHuhe7c4edhpOwUQVbYL2lRIPPqeVFJTwYea6q4YC5dJ2gzeTruPCrY2gM0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QrTI9gMW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2532C19423;
	Tue, 10 Feb 2026 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770714720;
	bh=VGvOSd5PWRmZsvyKMBdriUuWlEztjMSBUqGgvPN4GMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QrTI9gMWumlsbqg5fa3Tf878gLNtqLoqB1qjwYczqFNtvDBcRfWY4VYHiB0KAs5dx
	 babVLdZV/FKg214Fo93U+GWhz7bbN8RNyL/vm9yPjEeb52ERNFXtz2dQMBndO26wSZ
	 R0XKMgydUZ3APqPyA3gvZlhK2uV585Fd1rtrkwVnlK03MUML7JVVBvwigpYRjDY+Hj
	 rIAexG18ttD+/VbX21uhArkgKnJMCv9yvwsiwt6a/SWIs0IQe3M+BcGOG6ypLNaxs4
	 82G4TMhIftItsgLb0xUJNRmkbL946WeHSOSaC4Q6nXUIyN7AhsLkfIrn3XHzNR7rS9
	 ysGVksgYCcBTw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: (subset) [PATCH v4 11/15] drm/msm: dpu1: Switch private_obj initialization to atomic_create_state
Date: Tue, 10 Feb 2026 10:11:25 +0100
Message-ID: <177071465918.1461206.18051227468252288970.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128-drm-private-obj-reset-v4-11-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com> <20260128-drm-private-obj-reset-v4-11-90891fa3d3b0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92441-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B7F7118A6E
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 13:43:55 +0100, Maxime Ripard wrote:
> The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

