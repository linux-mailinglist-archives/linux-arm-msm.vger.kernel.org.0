Return-Path: <linux-arm-msm+bounces-50596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394CA55FB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3953B4C14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E13819D081;
	Fri,  7 Mar 2025 04:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCqzSpnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657119CD16;
	Fri,  7 Mar 2025 04:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741323373; cv=none; b=XBn4InhFwXQj99RP64MbaAlDoYvHCa6Vcy2Js4ssO7zCmKNzxg80cTb2i676W3KT5cOpolzggBuJPmTAICxJmTDfwW66Ypj/7AoQKZAtS32eP1SpfTKZaIPIJLmp2KN9C2e10JtBwou0tlnWBuOd3t288FYve/LzMMkmhCPhe8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741323373; c=relaxed/simple;
	bh=4xLy65/spHre+03tx2cdZR4rwWKdBdEO/nb63/hdqH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A8fvxt4on1xJxQEOqUiPGFVyH1hr7MXDiHjh6heYUw9ynhvCVss8BQVzcPuxIcPJbZ4fAMrl72ql0giX6NNWX4pVuB9Csa5HUQJuVDBlL8w/CvMRrSh+iWsjdoEX34m+CC308DKUwHcz2uj19wtCrAAydArRV8byfQofBNTOLBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCqzSpnV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A67C4CEED;
	Fri,  7 Mar 2025 04:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741323373;
	bh=4xLy65/spHre+03tx2cdZR4rwWKdBdEO/nb63/hdqH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCqzSpnV5l3TxpFJ8JWy1SFW2c7RaV/SQ26BWp2Uw5Lm8O50WuADCRku9vNICtt9L
	 pV0jV/nFK29dhWVXD0FnHLx3jA1nTQs8s/Ix98hw7/Wp/iY+mIjbBu6ibFrTSxDiMI
	 JZ44WduDtFYznFjWSZuakd2e/zlI6ypIWu0CoE3hdrVIbCCgAqi7sbH46CQqSI8Hw/
	 0KnMivzo+PHxTjYi2xW6nhiux3wZlfrX6Fsyy9BsBN4TTiLnM+ahYvYN/kR7PU5qnq
	 Gvo6RcvGECspyVkeNxsxgiW+LU74kP3//TsVuPC4nqKL+28daELOF1SfeePNfLnMu4
	 B537fUGk8K2EA==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Simona Vetter <simona@ffwll.ch>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/7] drm/msm: make use of the HDMI connector infrastructure
Date: Fri,  7 Mar 2025 06:55:49 +0200
Message-Id: <174132327776.1133698.4430380274517103098.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Wed, 26 Feb 2025 10:59:23 +0200, Dmitry Baryshkov wrote:
> This patchset sits on top Maxime's HDMI connector patchset ([1]).
> 
> Currently this is an RFC exploring the interface between HDMI bridges
> and HDMI connector code. This has been lightly verified on the Qualcomm
> DB820c, which has native HDMI output. If this approach is considered to
> be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
> Audio Infoframe code). Other bridges can follow the same approach (we
> have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).
> 
> [...]

Applied, thanks!

[1/7] drm/msm/hdmi: switch to atomic bridge callbacks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8ae7192e7a00
[2/7] drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d309bda67172
[3/7] drm/msm/hdmi: make use of the drm_connector_hdmi framework
      https://gitlab.freedesktop.org/lumag/msm/-/commit/384d2b03d0a1
[4/7] drm/msm/hdmi: get rid of hdmi_mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d840a2162112
[5/7] drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e92573638792
[6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d7d57ecfcf52
[7/7] drm/msm/hdmi: use DRM HDMI Audio framework
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ea54cfac0f8c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

