Return-Path: <linux-arm-msm+bounces-32092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127697D719
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 16:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63FA81C230EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 14:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C383617BEB3;
	Fri, 20 Sep 2024 14:54:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A5B17B427
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844045; cv=none; b=kRbkx5+Bq0ToNVLQipKmKZDxY5Vj7vke1mJvyAFMd9NHYXolEjk2cGOa4i9P+fDwI62aGB0Q4YJrlEhQFZebuSXkrnWUxD3FAcqYMW06sXwDoIzPcvhSam3OAtS6F0r+VLjtW4a3h6rA/fcxt5RlyS7covqXZgtIztYN6qbTZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844045; c=relaxed/simple;
	bh=S4P7L6S4YVxHG7FlOc9S8smNJC+oJB3xqP6RGBINWaE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LHvdgAJGj4vS7JT/JjbeqciXUqfEMO+5Ds0TPl4eh27VpCF8eLp1lo8A66Hb98W0bfsOcf/fxmIbsOqb0iXtaDYT7I0L8jCoHcQZc5mdWbJQ7chGiVIJB4Xh1pDN4jy+MiB4WgGkYmXEmLf9zcreNysAx522jld5/Bd1QLoSA3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1srf0f-0002Ol-7i; Fri, 20 Sep 2024 16:53:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1srf0Z-000H55-Qp; Fri, 20 Sep 2024 16:53:19 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1srf0Z-000BDt-2K;
	Fri, 20 Sep 2024 16:53:19 +0200
Message-ID: <13010c194e4674f6bdef84bcf748030a1d46b814.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in
 request_irq()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>, laurentiu.palcu@oss.nxp.com, 
 l.stach@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, shawnguo@kernel.org,  s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,  robdclark@gmail.com,
 sean@poorly.run, konradybcio@kernel.org,  quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org,  marijn.suijten@somainline.org,
 thierry.reding@gmail.com, mperttunen@nvidia.com,  jonathanh@nvidia.com,
 agx@sigxcpu.org, gregkh@linuxfoundation.org,  jordan@cosmicpenguin.net,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
Date: Fri, 20 Sep 2024 16:53:19 +0200
In-Reply-To: <20240912083020.3720233-4-ruanjinjie@huawei.com>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
	 <20240912083020.3720233-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

On Do, 2024-09-12 at 16:30 +0800, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
>=20
> Fixes: 47b1be5c0f4e ("staging: imx/drm: request irq only after adding the=
 crtc")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

