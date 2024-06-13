Return-Path: <linux-arm-msm+bounces-22650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937F907F06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98C1285BC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80931155C92;
	Thu, 13 Jun 2024 22:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G4K8+sF4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A492F155A55
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318191; cv=none; b=ZSEFYOk/tPd1YJJXaxaYrJiWqh8hHLV+9OSwgAXwZ9NsrxksIVPpxNbn8eKqk3G0ukD5uqNuWNZ3w8t9QvRsw8ywvj5XX1TWCe/4HZeuBTxKQOdduKiwvPuMzYK2iS52J5262Map8U9echeZcAXt3/BvS3gZ2v3X0nlw8/ZRHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318191; c=relaxed/simple;
	bh=snF0WgX3Uzkz2+5I0055uCAP2cYsbGgSQ2GyOQRAHdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idmZHv3xbwKwSpBDtNGp13SHZy0tj3bRziTn6Xy5HELux/8Q4QttA22Tc6V045z1OSosZLD/wSJJnrtirYqyVK0JCCh8CnDX5Ig1afSJ0ASikE9LleiD2AU4xCEG4dVekoVDGprmh4/glNESH6u04zstjCnQAeQ+G8xCTIOccuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G4K8+sF4; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so16296961fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318188; x=1718922988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uEsmC6Fs93CtWuR8khej7lWUC750pqp8djwlJQOosQ=;
        b=G4K8+sF4v7MXyluuTcJl2gcfX7JitItOGwq/YvyAEcIK5Sfjl1wjDIUJD2Vk6MVzEI
         GqACiAAzFJJGnnUzdsClIZN0GKGVf4HBAoyqHKLna2qUJ9epP21HCAFfA6Hd3wnnJwg8
         3ftBAeYdtIxy9XTLnpqGTA3lrJvAo2+a4qKQAEMP6evJX2IRiH6C1e/g7zZOlC30Hbvt
         Adwnqk0EJnyDXjnK0NuodLgK2jZum9QdGz0OxOihzRfn7EC5TP1hIZumBgABlNN/MLlE
         XE6+klga5sZhYUKCw4PreRfSlBk1oApHNtQ7kJWcZhdYaVhjkzUFLTu9S5I3d29/Tg9e
         vAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318188; x=1718922988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uEsmC6Fs93CtWuR8khej7lWUC750pqp8djwlJQOosQ=;
        b=IzCyQ1JDFnQpGxjgMCD2tuLIGDcBlDbZxzi18otmFYjpMo5Da8MsPtmPIgzS/C9sOQ
         4sJ01T0PH9wv5u8Iuqbde7Kf3FgmtYbyqpajzGgPxy9Vp13BDxdlQf/bUvTaqKDRO7dz
         iDy1XSC18BOZRnOZbQ7xNP+TKMJw2yypeTnc73LA0X6+wSE1tknia8KAEhXvMNYvCZzm
         7Vlsl23XLrTklms4Lk1BsfY6GOPL2ZwHv1ilWlYhAG+lLFUeUzcV69eQHJu8Ykj5YlQW
         /UpobmIUIoJwnLL3iod0fNbE/QEGXAG2cuBAX5t6mmPm2EqO1VSUXFSVEYWbJUukyamu
         lfSg==
X-Forwarded-Encrypted: i=1; AJvYcCVcX+qxQkn7c/TQiNQBA9YjaH+5wd3OY2cQXoXFCLzEmPbRcOE1fkkJePuWzcu668fe/7qOG7lRp6VJyn3UQFIpGAKaiI1hS2hYA76TdA==
X-Gm-Message-State: AOJu0YzHb7D3LwnIdkONZWTqMxL57V/+poKm7vZ5Da6TgPqgm4FovlgP
	qp2OFsxi1gPIDk1LU+SfgXhBWFovQi/hQcbFzeJX1hl8r0Szo5jZMHYvnR300rw=
X-Google-Smtp-Source: AGHT+IGFssZf/ZlI4LKs67bZV6Ozo6EnylG8kZfq6joUVujfu+aQgfOnZQIxwNBEHAM1HFjYfKskIA==
X-Received: by 2002:a2e:98c3:0:b0:2eb:fe40:c345 with SMTP id 38308e7fff4ca-2ec0e463248mr6941271fa.11.1718318187869;
        Thu, 13 Jun 2024 15:36:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:06 +0300
Subject: [PATCH v3 5/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-5-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=snF0WgX3Uzkz2+5I0055uCAP2cYsbGgSQ2GyOQRAHdc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RmW0TTeUi2rB56wD/1RdcHJO05cYTxQGOdb
 jtQ0YSU1S+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZgAKCRCLPIo+Aiko
 1ZliCACUWB1VPjIZWfsRkXyRAPxoJImYLrFW5Ln+oV36Or+JycieIOKeDTgM1w5ylsfSNmErxHB
 KYLiFSUdVsq7L5LBsNOt7SgenxS3zQytkXrhi69yYkhGRzWL2I1Pp4Ii9wnjjvR/GFFP6ufbOXU
 20WtayHo5Q4VnxAoPKTGIZqYcL7X70Y+lgSxosmztebNjwKOqkLo1GWP5maqSwgFikhi+p3rDPd
 e+3tu1yzunAmE6L/Bg93ir/I2mjdHK7q6n4fKbupMt+9zgecBsp/DpL1UTdK814PoLsMd1aB+n2
 NlNadDk0viM5HH4/So1r2mHNNJeZ3WrgyvIFFtkJNsebZrzX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move a call to dpu_format_populate_plane_sizes() to the atomic_check
step, so that any issues with the FB layout can be reported as early as
possible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a57853ac70b1..927fde2f1391 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,12 +674,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
-		return ret;
-	}
-
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_addrs(pstate->aspace,
 					new_state->fb,
@@ -865,6 +859,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2


