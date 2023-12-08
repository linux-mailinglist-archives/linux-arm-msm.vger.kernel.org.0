Return-Path: <linux-arm-msm+bounces-3904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A6809F82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EAB328163C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F6C6D1B;
	Fri,  8 Dec 2023 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZWRbo8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A38017E6
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 09:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA0FC433C7;
	Fri,  8 Dec 2023 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702028175;
	bh=DBB0cZVnrGAA1c/X5SLL7/u2difhyNNyZDqG7yjJOs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SZWRbo8g1bmhY3/GovnRwATWs0PoOCfMBuAoAylrJHzRrMP/9vguKEyBjs7JofmxE
	 zkKv9t/Dm9kmoIpGlXMNBZGwZonfPJwZtu0te9OQCLavm6GHKKk7pRgFNPAVlRohHM
	 LZGh2v5W1VfBgMpKlxdIXyKv3Aa/I6PNOFJ7lts6DQ+d5wDjxXlm2F0eGU5XoTrH43
	 pXakVFaWVFi4WIT2w/ErnkqkZHozdJx7ci8/W/N4JncepZjLItEnrZB7JvEfEIVC9j
	 2XEjAu1r19MVBMCcuk4XH08COuKHINt+6PTjN0dv+jEjn0EDSNZ6umbmkmHzkWNjXF
	 7LjlxqQIt+dPg==
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
In-Reply-To: <20231208010314.3395904-2-dmitry.baryshkov@linaro.org>
References: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
 <20231208010314.3395904-2-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 1/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Message-Id: <170202817282.16687.13033401710138514898.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:36:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Fri, 08 Dec 2023 04:03:13 +0300, Dmitry Baryshkov wrote:
> The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> encoder for anything other than getting the drm_device instance. The
> function's description talks about checking the writeback connector
> state, not the encoder state. Moreover, there is no such thing as an
> encoder state, encoders generally do not have a state on their own.
> 
> Rename the function to drm_atomic_helper_check_wb_connector_state()
> and change arguments to drm_writeback_connector and drm_atomic_state.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


