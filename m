Return-Path: <linux-arm-msm+bounces-45384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D96A14B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380421886B75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3674F1FA246;
	Fri, 17 Jan 2025 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzcXJwBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068BD1F91EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737104215; cv=none; b=q6l26dvO4oV5M4/ZjHn2zKn6pU2iyfPSvQJVDdlESLUp8EC3MdMiUK9tPlDcMSUXDI7/cDq4FQ8BwSGpmzIh8ce/O9BQE8EKMe6Vmk4ZHRuPSPHUgQthlsni2d8nkad/zw4ej9Z4QHen3TiqiGcEmxUqOh2f8WvAh+ng3EMHmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737104215; c=relaxed/simple;
	bh=u0enUT6rCyZ8RqHzkNWyQVgEzKAZFsn/cehDhTu72TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKcxy5KdM4Ds+D1RItrDtVKf9TZTFP3x5OokEoA9CKpTuoFLRgbsu0ueHcTASUhRZwjrftIWM1bJwGYR3CF9xsGfofD2m9RkCiYlXmbR2Z1ZB83q/iQlFkGWRRU2/CEdKTIcP/oytpUarlXIvUwZRQuKVMM+oPn6FAqCg6S5L4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzcXJwBr; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-304d9a1f198so16536801fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737104210; x=1737709010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLM1E94zeSWa7OSuX8gMRqzReFqeBbOp8I7gc5sLd6w=;
        b=nzcXJwBrZWsPFgBWyCoOl4yP/dYPMUdPpzakPWvLjWZGT1/5dluGIpVUeKeQLvaHc4
         xoivxhUYt09go/RMugsDtbN7hP89WP85FY1jnsdAieF4Qaw7jzG4oMCQ/64MoLCZEbe1
         1fIeSzx4zcIXyG6idLT7uYCwvIwAS7d/IBmKzPaI9nd9HvzjIccfVdp2asANjia5ioJ4
         kIYHSKXnDbLPnLmVP119AiCIp8TdNZURTUFMwpD095JrmZHdWoAc3d6Mgmf0dhckGhV3
         sXeTvxWwtZDR6LZHWwbaTnU+DxliFHQ6HXLzg+QymjgewekZXgvD30+1ogCmGo7e1l2A
         2PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737104210; x=1737709010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLM1E94zeSWa7OSuX8gMRqzReFqeBbOp8I7gc5sLd6w=;
        b=uj/iWEZSeKzZjw+WQNnW2MCqU6Lw9Dz2fZO5TtYq2V4xcFfCUUGEGIOonDSOrN2m9W
         VYHsVIJtBHino3EnOKwSd8rE1wLFPfsSePrutvhZKvqraIbjw94kdFFY8/UGdx87yOxJ
         9ryI0Kbtpx0fRx5z176200Q2ybs3Ef9AXTGJUTtOVOcAcLGLYuh3vShwMotbGaUVhJN/
         Kfd8rWSEcaWXDoUo0MeXWvENd94Ukh5vjL8ey6zYxy/Xydl4PMqFTUTICI5V60hmvVKg
         4kO3wv47OsXNbiNaWlriAFVSEBaH42TsImAM/LjLOGamUQQZfkIYAE5MY5/ml4jaKASo
         DipQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0dV3eprTTrHZAFGPth2HQFw7915O4Z5QgcQeT46M3l619bgyqEOoqRWOfOnyRFVvCI/BdteFqREa33rtD@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDLDzRSnER5FluTXOae3DPHWlFTI53Cc9epPaMuAJ7i+pnpJo
	1P/lE1Pwakahx5/NF4bSlNn1rmdc+TVy29rB6Ljnz+giH2Jyh2aSzt4K5/zCCh0=
X-Gm-Gg: ASbGncse66EG091pkEK2L8x6Q4pGUs8GgM0Xurk6Tx41Je0jQx26eJy6I/tdmWa2mZw
	4jcDOIO35w4SHjfvPxQeADwksu/olF1x72LuRPX9Ov3OhRTiFDRQb0BkpHQfyeyuJGOZrArydOr
	S6Ukpfrdfnw7Kd3VRbeoltl/cWuk3nx54THc7VWE96agNSsXSkPTF1guyuhg47+L3aKgDOj9DF4
	oq1luIGCTOEQwvKHK3ZUXtWOMvZwZhT72P9sOV9kNnE/GAGvp5D1YHPxUeMCdB/
X-Google-Smtp-Source: AGHT+IFBojLKFUsRi46jxUj/82lpPoLlFcmw7BAFGVljTWhsMBbJ3khzAeUTmD1KdTt251Lb09lVSw==
X-Received: by 2002:a2e:b81c:0:b0:302:251a:bd04 with SMTP id 38308e7fff4ca-3072ca88ffbmr4931551fa.9.1737104210175;
        Fri, 17 Jan 2025 00:56:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:56:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:39 +0200
Subject: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u0enUT6rCyZ8RqHzkNWyQVgEzKAZFsn/cehDhTu72TM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtFPa5XPtqF5ObSemv7vpAvzUlPQNy8VMpjv
 RyX+pGyC/iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRQAKCRCLPIo+Aiko
 1QRZB/0b3sThkQAPK5Beb+5Pf6cn7vHPGIu4Piqk8s/CE8IKzDU+27jDQ/KOgIcLM2BOs2vmZRO
 Zb+L/0xMQ9kLSlMyp3NFHQgEBlO+Aykl4la4dDQlxroc5GjAHq5a0kE12q/R+uEhtIuF07wQg1x
 fEAQqzuQKE3zaFrKVvExUkljI4lnB+mKBBCKKLgnuCYwGcmdP6lD6AYqD7JZY1JvBCK3NedPORt
 O1972W2CsHJgB6bG+6JHa+l8s81kV1XjdIQE+dVGwLN8SYUp8BhKDlVSml67E0+KzneY1GoD3Qz
 zZsiuc6wSv2wOm9emHzfTlD7MgX2pW/EVxdGt16cNyjCQ0y3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
@@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			break;
 		}
 
-		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		if (copy_to_iter(buf, res, to) != res) {
+		if (copy_to_iter(buf, todo, to) != todo) {
 			res = -EFAULT;
 			break;
 		}
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)
@@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			break;
 		}
 
-		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)

-- 
2.39.5


