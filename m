Return-Path: <linux-arm-msm+bounces-3905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4766F809F83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F7D1F2158F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 09:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9E6125DD;
	Fri,  8 Dec 2023 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKu9juMo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5D2643
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 09:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36410C433C8;
	Fri,  8 Dec 2023 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702028178;
	bh=qVk3EK9ezayq67rrdxqh4L6o43FNM8c/o+5+uydbZRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HKu9juMonwj7b7GSuf8G9ZYE9dk8etP77XppZIZD2ouJ1FUpYPItkFCj6g0xgH0Eu
	 ncic9XhtKib++MYvS7EMJrJ3ldGx7Rzr2gw6F+p3ppFhB1mP3th1fOqgPvXylAVyRf
	 mxSQNydy9+yivsYR8M2t0lm5AyzCAmwj5q92sA8qbOBPOYaLi24Ss9KFm9ihu6siB9
	 Ue+Un+M9SIfpIEvwTIMyMLYvdyiTtc5AV6Nt8gAlWvImU141j/dQvork7wSEzS7onh
	 rSGyiM+vvSZj5hW6UlMgFQa+RRCxTOZ05gclzeM9esZhlwmEYnOq15by7YkWnhE5ah
	 aQpguOzNzG6/Q==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20231208010314.3395904-3-dmitry.baryshkov@linaro.org>
References: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
 <20231208010314.3395904-3-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 2/2] drm/vkms: move wb's atomic_check from
 encoder to connector
Message-Id: <170202817600.16687.2759695284451407147.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:36:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Fri, 08 Dec 2023 04:03:14 +0300, Dmitry Baryshkov wrote:
> As the renamed drm_atomic_helper_check_wb_connector_state() now accepts
> drm_writeback_connector as the first argument (instead of drm_encoder),
> move the VKMS writeback atomic_check from drm_encoder_helper_funcs to
> drm_connector_helper_funcs. Also drop the vkms_wb_encoder_helper_funcs,
> which have become empty now.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


