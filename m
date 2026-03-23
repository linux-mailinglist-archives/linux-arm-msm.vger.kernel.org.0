Return-Path: <linux-arm-msm+bounces-99337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBY6OMRzwWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:09:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDEB2F9841
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 852A735CF3F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC0E3B2FD2;
	Mon, 23 Mar 2026 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="WHUlp5Ek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619952773E4;
	Mon, 23 Mar 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279760; cv=none; b=qRQAsogajafqLgVqK/2KyyJRRvk3C9bPGIC55IxyKmm9IQ62e59pYIPXNuBfKX//uu6C2DG1MNP7OLyWgV/XUI3wSQctosbSjvR91mviJAFgErYTrYv1zsFCBRfZ1eOMaRinFwXMiDJ5uEANuXXbhrIlMCeRncFAPbALQg3DFLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279760; c=relaxed/simple;
	bh=z0nWBCIpCHDjm0gzBXckIQj9pvAnL6w7dfNKFXupygk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6/AKAkhe9RGfbBSmM7Ub2neDLiOGnRzLbu9P/GTFt4MtCur7FzOIC++UbuAqP5iq0fDOxKTm5psxVzKGYtiELAWx2FMlHpM7VfLBItQthO/MjWD5J8mkRKZXh2e3pD7KYi5WhMHCt8bTZJ1Bg9aYE5I8laTEJ7v/QeI05D7l5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=WHUlp5Ek; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774279750; x=1774538950;
	bh=ElJJRngS4oul6QvfUaEwS3ay9qvA+cCk2pKKulBFxDs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WHUlp5EkQyNS+aIpB9qWTxKtaXqdErK1Gi+Y8Azlc4NqeNvC+ogSuKJ4QHvnb7Iun
	 zDKws6ZAOzlKDHAsOXdLgfDM0TLePG+vJhxjf7LwPOtwItDGwOANvxXOYiHwdcXFum
	 d3nMNlkvaqEuO+nhElAsGvwIN962uQgNfItHaXLB6EGmy9PcoqwG31SsnvDnoOJZHT
	 ezW5/Wcnvo9PZ4OaSzpFVL6S9Jgz/W9eTdNcsjeQilUao2eS8HuPuuHmNK+b5Sd0El
	 UbIlfCFLxlvdoKaic5CB178nZ+uebxxjQc+yutzHP+NVnWOzpPIJecRxesMkJy4D0k
	 Lsw6xAJlkDaLw==
Date: Mon, 23 Mar 2026 15:28:59 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/5] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <nmC5g-yqiyxWusbu6f0dZ0s7W-bqYdVUT0fIX9h1MsvYrAE521869Ei9NAKzwxbz30rvdYJCVjEWexnaUrAx_63G2DtM2mVUZthU1VRUbrg=@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-5-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me> <20260321-dsi-rgb101010-support-v4-5-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 327602c420a395c5a4d2f5d47513c5fff064faf7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99337-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3BDEB2F9841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Saturday, March 21st, 2026 at 3:52 AM, Alexander Koskovich <akoskovich@p=
m.me> wrote:

> =20
> +=09if (dsi->format =3D=3D MIPI_DSI_FMT_RGB101010 &&
> +=09    !msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
> +=09=09=09=09     MSM_DSI_6G_VER_MINOR_V2_1_0)) {
> +=09=09DRM_DEV_ERROR(&msm_host->pdev->dev,
> +=09=09=09      "RGB101010 not supported on this DSI controller\n");
> +=09=09return -EINVAL;
> +=09}
> +
>

Was tipped off to this bit downstream where if DSC is enabled and panel use=
s
RGB101010, it overrides back to RGB888:
https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-driver=
s/-/blob/DISPLAY.LA.4.0.r2-10000-lanai.0/msm/dsi/dsi_display.c?ref_type=3Dt=
ags#L7209

Only does this if widebus isn't also enabled though. Should we do this as w=
ell
upstream?

Thanks,
Alex

