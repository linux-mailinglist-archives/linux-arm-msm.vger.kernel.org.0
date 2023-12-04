Return-Path: <linux-arm-msm+bounces-3341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC0803C1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 18:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5751C209E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 17:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143322C84D;
	Mon,  4 Dec 2023 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="od5Zv7fk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36720101
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 09:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1701712629; x=1701971829;
	bh=LY3sP/4sTj7mqHdOLHk+rwzWiUGUqHRhO85z7iFff1c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=od5Zv7fk1lUnMdsQ9YNRFDSYIiGp12yPJns9zw/CKixtj7cTlkw7hG7Wl5rZnyHLH
	 LuzkkF3P4GUzfwySyCTkTyaJ6AjBrjgPPw2aKpkd/tdndVCjKH7BeIKBHiNbvotEGF
	 FB8/LAR2Io0b15T0sfHnEe7MX38cS/us/+ITNU4AOn4hygW24FGR0IIi8iM0rY95kM
	 k6cxQgYK5RHb6cwl4YsJQZUxZiQ1CLmEVkXf5iH0obFIujihrOYMnWp4ETxpPFxhJd
	 k7c2wk0Wy9sFKL8q8aOJgb0iTN89DqUp2bqtbdY+dz/0bmCXVNrvJKVAhG4GwY7O6n
	 uAwCDVsGcXHsg==
Date: Mon, 04 Dec 2023 17:57:02 +0000
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
From: Simon Ser <contact@emersion.fr>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com, sebastian.wick@redhat.com, ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, Pekka Paalanen <pekka.paalanen@collabora.com>, Harry Wentland <harry.wentland@amd.com>, Sebastian Wick <sebastian@sebastianwick.net>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
Message-ID: <jLtQnAu4g7zRJxEwwoX5HhVfleNLflhi9mUGTQAVKV4QaZt_D7NIOov31MKHu3zdEls3ULzYEiQNGeL4gKRpjjU1VDbl4DDhEBldXXrYzNA=@emersion.fr>
In-Reply-To: <44a3fbd4-44fb-0a39-65be-e680e03b1b6e@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com> <170155324921.2215646.4829699354481827834.b4-ty@linaro.org> <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr> <44a3fbd4-44fb-0a39-65be-e680e03b1b6e@quicinc.com>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, December 4th, 2023 at 18:51, Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:

> > Where are the IGT and userspace for this uAPI addition?
>=20
> Yes, we made IGT changes to test and validate this. We will post them on
> the IGT dev list shortly and CC you.
>=20
> We do not have a compositor change yet for this as we primarily used IGT
> to validate this.

Yes, please post the IGT.

> Can we re-try to land this once IGT changes are accepted?

There will need to be a user-space implementation as well, since this is
a hard requirement for new uAPI [1]. Maybe I'll give this a go if I have
time.

[1]: https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-use=
rspace-requirements

