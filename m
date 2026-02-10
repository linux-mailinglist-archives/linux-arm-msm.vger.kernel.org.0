Return-Path: <linux-arm-msm+bounces-92440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB0lDGP2imkePAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:12:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B7B118A3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C333F301DEE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EAB33F390;
	Tue, 10 Feb 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1GGVEKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB00233F389
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714718; cv=none; b=tB2CzrXrSZFzEzPWmOKVzQYEuENOxzXf2W7O0bTleA0z9TgEzhVkmYIcDU/J9V1fNlxxhrw2CsvX3mI878lYS+jYq93SCDgLqsDYFzyFDrXhGZXJQ7505puZkQ7pr84r7ywBweNvimLV/akhZmx0iHYZ9hALkOju4jS+hnHQ9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714718; c=relaxed/simple;
	bh=EupGUQxR5JuECden0J0lKF1mKu53jepjharblcWjrn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BW1B341iso67XrC/E2gWHgzaLi0+Iq04rDfU/aFGJGysP8+UlaPy9uMuGuGp1eNuxBgnGvrPESYNkRd2J+s6Rq1qNDZASYtzgXm1YB10nblfAX86wCTJj9Kg6yU8rSgkXBWd8Wiz5ExklUYbtUjmDnXPY4BNq1NIBcCcGBss29E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1GGVEKo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5D6C116C6;
	Tue, 10 Feb 2026 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770714717;
	bh=EupGUQxR5JuECden0J0lKF1mKu53jepjharblcWjrn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k1GGVEKosusxV6d698D5iBGtUMZO5qDeRXsXaRdQirnQ7DXMFfGYnL7tLFgrN6PO/
	 Ch1vnxpvQIS01FhMlp+LJfz/VVUHHoNCw7eVG+z2kqGQ9oNGEA2vjfjndx2OY9cq/n
	 FG5Vt+7Lj0kvjtq6Q734k7jXWEg0x9oVOAfEN6Y/pMqPzeOXvdfQCpIqDI+BXZFFEW
	 P700G9Wbf1ahiXL/5MGUfPWVXx9l9KnrmYqltmGzJMikdQGUy6vaCMx23C+LN07A0a
	 QXHnT+8c6ExEt/ClkrwWwNzknIVbZYseRw5GBM2jCxcU//YW06pmyFu0y/r5yI2Ava
	 CDYq8mqweTo6Q==
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
Subject: Re: (subset) [PATCH v4 10/15] drm/msm: mdp5: Switch private_obj initialization to atomic_create_state
Date: Tue, 10 Feb 2026 10:11:24 +0100
Message-ID: <177071465918.1461206.16095695324634572573.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128-drm-private-obj-reset-v4-10-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com> <20260128-drm-private-obj-reset-v4-10-90891fa3d3b0@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92440-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 93B7B118A3C
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 13:43:54 +0100, Maxime Ripard wrote:
> The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
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

