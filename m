Return-Path: <linux-arm-msm+bounces-23976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845129150D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 396AE284779
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7363419FA96;
	Mon, 24 Jun 2024 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKmq6N+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933F819D094
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240438; cv=none; b=B3DjQFGhDIcjUpOfHw3sXKxEdDHBTtio1x0UP2BxvCJ+TYXvpDafiGAA5R+mxUrzqCMZTj4CX9sLSw+Bd65V0vyO1HzuhVcecEPGoh33v9Zwmdb/A0t1ZFIXWEr9A2ERx24G41iGZroztKRjDPHNuCFFLm7oqRv9CyiiqT9QKeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240438; c=relaxed/simple;
	bh=CRnQPNrk6tMn0RWlkSywOwQLtsZdvuYbpLeYPQfOvOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsJW5Wp7yubaO0V/Ow7SMFjV7sF8V/5kWZKrYTJx3lvCyQ9ouD8GAfPmZsw0ko+ow62YU5zj/oikQkrjH1jKlwvgGhPeVDjqhxJSgcJQskBQz3CAAHsP+JRpHwQPKdlPxwwx/hPzxgWlaUNvnANAGLDLFOWfV+CXCsWOy1dfuyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKmq6N+5; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so1823583e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240435; x=1719845235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnAQMhTqxkoTHi2sUlyi5iGRZ0J/13FG1QGdqL66JnI=;
        b=xKmq6N+5uEpAZEzHWjExLLy8ofqrxnSK4A/SQqt6JmLSzWVuBnawts6+C04A0NEgnW
         cY/+YoUs1mqAaxUlgKx20j45wQrDcKDoiUipkachkJdSQxPei36RpBqVhu5IZpIsKOPV
         MaLSbfClzfnxrHdaq753k8ijk8fTgGeMIIYRoslRlH9nGVqIL/LRCJZVbBCLZjI/5zCL
         8LntOa2fxw70rhBkdS4btHdXpBYvLZIXO/9MOMRYZTtNSZtxFBcBnjAPFdZQdS08PWVv
         V/OJ6jOrcuIh+qc+eH0T60SuNtodquI9H0ywEDGwpeSyYYYhpZ5g3XwKTIvdql5TJFzo
         Kd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240435; x=1719845235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnAQMhTqxkoTHi2sUlyi5iGRZ0J/13FG1QGdqL66JnI=;
        b=vCqU+m8Gr6IZn99zCRzae2llJmc9VsS2ezaoEzO6Uj/Vr2qnd0V6VH333KTyMX8Z+x
         YYXqXdhzz7f1KjRNi3o4ezvn+eMqhgwHjkGVk7T54E4BAuv9vs1TVhJ+zU3MK7iRXmaE
         44AsiNfIWfUWY2P35+6IH3ymkZVNtaUg7gFpt0kAujzBJ/5QCOpO819p221VF0hWvPyG
         Kz09F5w/YZ8HQ8n2uM81WtQNlJ9Dq4/lFWVMlh9T1lu9wVbEyBrCQtRPzZnAl7fI6Z/G
         qzoC/R0BFSop80xRs2jrz02r4WHx0JpSXCwtqMNY3zBwj31PVs/QB2BU8vwDH8WFuN2V
         YKOA==
X-Forwarded-Encrypted: i=1; AJvYcCVz49U+CYQdGkwjXufDTwaxc4icWYAOPp5hz7mbG7aDajsm4T/OLE2UV/56NMXxFJcsG6UODQRqbkplFNEG1do7Ih8iDGhI//NGbQO6bQ==
X-Gm-Message-State: AOJu0Yxk2ODNimBwOUEJW34Q9uTOGfjD+He7IrAjDtmeDr5BStx/cLnh
	avOgltN86RIHmYZOXwzK21ktsJLBCovrKaVcIyM6TVqFB/sJRW1DX7yTVlYxmZw=
X-Google-Smtp-Source: AGHT+IGR6c9ZmdfMXtWz3IjqPg4XkHqNQRscHzayqBpLuf0iLJj+JC5OfMgRfjVGlG5LupzTQ9MqUA==
X-Received: by 2002:a05:6512:118e:b0:52c:ab83:d783 with SMTP id 2adb3069b0e04-52ce063d63emr3920439e87.6.1719240434879;
        Mon, 24 Jun 2024 07:47:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:07 +0300
Subject: [PATCH v4 01/16] drm/msm/dpu: cleanup FB if
 dpu_format_populate_layout fails
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-1-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbu+jggU2r5wb55W+ZbzfufMt2fcPzor3sSw
 rUcv0Se2GiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7gAKCRCLPIo+Aiko
 1aqlB/9g7BBBZ26cS0eSgzqsLSSvrm6ZAuiCyVP1eUlsUiDQA5gCvnvZGreQjEHhTAjrEAQGkc8
 FtKaWDgY7btLUi+DYxZ3zJiPOMy/Tqt9NaRV4HF77sS2baOrKIW41AvZk1dR7rYGACfbP3hqnlR
 diczBoF49Hp8YVnNuaQUs2TEFv+3SLVK6SjarADQiA0ZaLksy+0sJVIPviT8rK9l2hs3s/Pp0yE
 SIcj8k9POpjtz5+pSJQVF5uA4z0pjBoqLuhziHsxvOWmbXHc2oVXEe1u+nvB0Vb9vuPGHIH9N93
 kRnUG9P6t6m5amGJvwOuwK2jW9XDFSKNlXZPEHbIgv4PsJ91
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


