Return-Path: <linux-arm-msm+bounces-24027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70D091587B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C83EB23229
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E361A08C9;
	Mon, 24 Jun 2024 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojaK+v0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9919F48D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263630; cv=none; b=LjGY1MsB0cp1uDSlHKrkyQfHvCfe9DkQ2Fsac4oM41koXweOFp2XmGjdJn4Va41crcOmk/p2CBHjZJDpE25PWZWQQRJx6BkgC4EGx0mY3IF977xJOufFRNigYZQMhqVQ5jyjwKBbJ/4pMdEqrRX6R5H78gf7EvxlYjTEcodwJDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263630; c=relaxed/simple;
	bh=CRnQPNrk6tMn0RWlkSywOwQLtsZdvuYbpLeYPQfOvOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxI6o2qP+468MKDEUWqLzM3WZtbpdNroSvvYA9t2geXuQLNeR/B8V2CXlES+sH0uoG8bnV+priPOS8GBA7SivF6NryJfqdZT9F3owm7oT7zv7CitmFux5gBu0VfEB44xX3rTd7S0ESj7E1KAO88jvC6RlRriwSjuLfOT75gYGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ojaK+v0H; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so2189045e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263627; x=1719868427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnAQMhTqxkoTHi2sUlyi5iGRZ0J/13FG1QGdqL66JnI=;
        b=ojaK+v0HmTAKIh1gFul2pRyyPzon07n3/b5HeWRl6l2A42n4MU1eQoHQ2c9sxCewIz
         kxOC28g6L9QP6mFYuZKfDLrQAq63m3V3XDWAK3D3kVnfmkaXIsf7WWbH9sp/gMeVi6Zd
         LK4rRnplTtIrTmfRWI700gyCxMWCChRhcEjBwr9LuqS2PVuiH4U1DOcI3J10ae9XZy7X
         guuENLfY3edE8h88SzQQ2ygEvGsjDNaPGcOxtUZ1Rs60SgHzgQL13puz/WfyZX8DpCHe
         fW2yxOtvfefRL7KCzS4rh6A91JG3nNGa+CdlpouZFw0/YIUY+jzLrH/1lQgEeqk6Hvab
         xMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263627; x=1719868427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnAQMhTqxkoTHi2sUlyi5iGRZ0J/13FG1QGdqL66JnI=;
        b=a3Qg4DrXktI7LKpHjhSg2YNhJA+2+Hz+fVONcJZ493AY4keSDuSxsNBulzkriqVTmF
         ehscsC/6MehfpLaHbfzWFkZzvfcu0ckY2HcZnM8RUnzE5Qq4bcVPvXkXAiUUWceslmPy
         bWwZNViIh/OXBZcKnW81TIub3P2B1OBIbSq1IlLpnnHzpEsPEjwMYWqF409INxbq/Zos
         uwcirWXa/UdnMLeogUuNDS2OwmftcgYU3ZXdqy4KYt03Ai+ZlxlB1GMWh4gLpRyLe3q1
         65hx873Lw+uGb2F9rJiGq7bBmVkcXMfcyHkeLKf1P70Tma5XHSrx5/huBkiAc/RjTN1v
         h37w==
X-Forwarded-Encrypted: i=1; AJvYcCVvc9B8zdYVSC8WZIemgA9a2mMIYwtpUvCvhhqXM15sV9eZUZh30KpaefGqi5gYDbVajUR0JDf6MZqdlB7tcr29wzj0Jc6PmXeJk3VtMA==
X-Gm-Message-State: AOJu0Yy86wBffGNdiMdWdSSaSjaBmf6pfX71ZMO+BBZyEU+ryYsPFYUW
	zPotPSIsDrSiHi1cPP3vgflBbhPWLpM9iTbcxYidGWxrd8F5BwqdTqxRjPNfFP/xAkZPeH5DM/+
	0fjI=
X-Google-Smtp-Source: AGHT+IEdpZ5JYDr7V8Znxppu0fFUyD+kco0q7CJPmsFD4ZDNHTS3te8ASnZiqa38kdut6xCS5YBoLA==
X-Received: by 2002:ac2:54b3:0:b0:52c:c6a0:575c with SMTP id 2adb3069b0e04-52ce064e939mr3488507e87.33.1719263627046;
        Mon, 24 Jun 2024 14:13:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:41 +0300
Subject: [PATCH v5 01/16] drm/msm/dpu: cleanup FB if
 dpu_format_populate_layout fails
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-1-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CRnQPNrk6tMn0RWlkSywOwQLtsZdvuYbpLeYPQfOvOQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGHkTKUSFhd/esJT4kU4yqcOeXPY/1aZhwhY
 ouCUfW6jveJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1dHEB/4lCSfYAUpyuj9p97n0YydfifdA+CLqgrCwyumcCOIrtmqy/DjWUSMdZpNrUqoUVziJ5cF
 97Cy3Mkr6RVsi3TUv4Z1ZlHOFuLar3WeXhdnncJ0L56qv4HlBfafsZ9wjYbsF2itRhQoEgT7LzV
 6e8jnQRkDXI6YXZiQBazKSE1GOK9nvy/0swaShEgrWrXsVm8vY29MXK5zCCYSyNlRHNhHV/v++p
 b4PxUXta9So50jIrejN+9NxvhwCQLD3gpfhcbHXkGhWkmQI8ieVdo84VfJDas8gFeqZ3C8dcRaT
 ZuYbZ7L04qdfRC5QXnM+EG7unCb24AQpNEc/IrW6ZjSEztDO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the dpu_format_populate_layout() fails, then FB is prepared, but not
cleaned up. This ends up leaking the pin_count on the GEM object and
causes a splat during DRM file closure:

msm_obj->pin_count
WARNING: CPU: 2 PID: 569 at drivers/gpu/drm/msm/msm_gem.c:121 update_lru_locked+0xc4/0xcc
[...]
Call trace:
 update_lru_locked+0xc4/0xcc
 put_pages+0xac/0x100
 msm_gem_free_object+0x138/0x180
 drm_gem_object_free+0x1c/0x30
 drm_gem_object_handle_put_unlocked+0x108/0x10c
 drm_gem_object_release_handle+0x58/0x70
 idr_for_each+0x68/0xec
 drm_gem_release+0x28/0x40
 drm_file_free+0x174/0x234
 drm_release+0xb0/0x160
 __fput+0xc0/0x2c8
 __fput_sync+0x50/0x5c
 __arm64_sys_close+0x38/0x7c
 invoke_syscall+0x48/0x118
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x4c/0x120
 el0t_64_sync_handler+0x100/0x12c
 el0t_64_sync+0x190/0x194
irq event stamp: 129818
hardirqs last  enabled at (129817): [<ffffa5f6d953fcc0>] console_unlock+0x118/0x124
hardirqs last disabled at (129818): [<ffffa5f6da7dcf04>] el1_dbg+0x24/0x8c
softirqs last  enabled at (129808): [<ffffa5f6d94afc18>] handle_softirqs+0x4c8/0x4e8
softirqs last disabled at (129785): [<ffffa5f6d94105e4>] __do_softirq+0x14/0x20

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..eabc4813c649 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -680,6 +680,9 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 			new_state->fb, &layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+		if (pstate->aspace)
+			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
+						pstate->needs_dirtyfb);
 		return ret;
 	}
 

-- 
2.39.2


