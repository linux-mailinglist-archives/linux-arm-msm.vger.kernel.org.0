Return-Path: <linux-arm-msm+bounces-41795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 139019EF2F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B5C517E55D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF2B22C355;
	Thu, 12 Dec 2024 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DL3shQLB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4386223C79;
	Thu, 12 Dec 2024 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021550; cv=none; b=Mu9+8PSOHrHRnJ0f9RrQIQUseYV/ueqn0bGnHpI1tQq2I6UTThCAdJvhXFQ/NqpuXnqKj5eV7NRbE4HUYSDVJaYY0EsUQCWWp8S4cxmM7SNLA8r7oKA/RHCHppXSRvNhUL+hQgEAC4kUS6GZLIpAGWSkA5V1JM9Yotck14miJB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021550; c=relaxed/simple;
	bh=28GP+if8s00JfMq5taAXrfU0aH0wD2Yn6kBzI4rgY08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=purN8Aw7yuy1z545fUZBph7Na/jB3FEKdRXmK11B9kHPp+kPkq6PXIliKjRNvNrd3WxfX6+Vu/WWF9+Aer9dADIVEwaqC/CWv3sAIKyA9hH159sbXrlvrmJk1Os0pov0j2l8mvFR86kG1bAeAa9FEGjKlTuPxJ/M7Hbj5zSf4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DL3shQLB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D80C4CECE;
	Thu, 12 Dec 2024 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734021550;
	bh=28GP+if8s00JfMq5taAXrfU0aH0wD2Yn6kBzI4rgY08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DL3shQLBwTjBSdjzL9+2ith3R5CzuoT5egOIPt4F3E0Wgh43wnd6a+wciXi5Z2xKO
	 x6z9g6vKbD4dwVpxLNgn2Ti1d47qd0p5yjTQEv5WNQQcA2bSrwWK/jYUG0KUvJn8PY
	 lgw+Pd6PWkMMxCiodVe+lTccF5PiDZyyaJ86LmKU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>
Subject: [PATCH 6.1 769/772] drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer needed
Date: Thu, 12 Dec 2024 16:01:54 +0100
Message-ID: <20241212144421.709324965@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212144349.797589255@linuxfoundation.org>
References: <20241212144349.797589255@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

commit a722511b18268bd1f7084eee243af416b85f288f upstream.

DRM_MSM no longer needs DEVFREQ_GOV_SIMPLE_ONDEMAND (since commit
dbd7a2a941b8 ("PM / devfreq: Fix build issues with devfreq disabled")
in linux-next), so remove that select from the DRM_MSM Kconfig file.

Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Rob Clark <robdclark@gmail.com>
Patchwork: https://patchwork.freedesktop.org/patch/523353/
Link: https://lore.kernel.org/r/20230220010428.16910-1-rdunlap@infradead.org
[rob: tweak commit message to make checkpatch.pl happy]
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/msm/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -23,7 +23,6 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
-	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE



