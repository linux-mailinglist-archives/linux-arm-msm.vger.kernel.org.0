Return-Path: <linux-arm-msm+bounces-35753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31E9AF610
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 02:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE148B21D54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 00:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C35CE574;
	Fri, 25 Oct 2024 00:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rDvqVWOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ECD79F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 00:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815619; cv=none; b=YzrZPLSovodTH2MpfIPaLbR6+24way2G2hYfYNo6sH/gr1tG1zDELLgy2ualOk9AsOht51RDBfldrMBg7W0BK+QWENnRMlMCYzh2RnDOW4C8vki+Um243DanSiXqp90y1LQj1PSN/C32FkxDWtD5e+7jZWhM5TzJccUqOto8El0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815619; c=relaxed/simple;
	bh=Z1DUfkZ6/oZuA6xRT2zKvLthKeLBEYc68oLVcqrozCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wh+vaQ8dho0MBQCYcCKJJfB2MTuVyqEA599m7MZKXslosHIWg6DquhT0S8k6q7ctwo3AP3uisPrs5OHxpj3PMNtmRzURAEoJhygEPgP00dymJgco/SjlBDxfA396NTkivbY+KEIkn7TfMrVxFE941t8G+acvBpxyLX2OUlmbqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rDvqVWOc; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2750215e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 17:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729815615; x=1730420415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xqrfLhi8maJ3GiZ3G/FlADlqaLUOMJAXiAxxK/1iKc=;
        b=rDvqVWOcA7oaiONdXj8NCvtIffH+i1JnCtTpnfvg9YIuIxnzP13vvnPu8WIm0PO7kq
         eSe8c/RYTlubVU39OvvMNkHp4RX6Csf7kgtmwLHYvxaweEUAiuhVAiZovJOd/CFBc7TU
         vBuq/LN4GLgIAR4PcjfgwycNG2PzUfsW/iOJoIzY6j/CDsC3p7IT46pmvlGEu4l4M7lI
         WrNiy0Wpt6AFFBIVy+XvnfvJwLmhTAFXxCMcIOibz8ML+c4q6KNsvnf16dOxMinMJUOW
         h8yK/ePOBnsjJiz0FjwxR7bewAjWVMg8DS0D6bpHhcfXC2VQpZLnH3EMc9as400SyZ5q
         TvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729815615; x=1730420415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xqrfLhi8maJ3GiZ3G/FlADlqaLUOMJAXiAxxK/1iKc=;
        b=OqDnz9V5b1LUEWIM4IWjji7NVjiXgKBKUBnQPO9sX/csAHK8zeP5zxk4dXho06MnLf
         Gg+Y5U8jgio+7aIZ2nEX5vNf80Y7YU2noTaJcr9R52kcP1LWnGaC6nYtM1gY0+74BRok
         ONROBX3c0Lha7t6P7UN0wDo79w9rJCsHqrnytgrOiIFyUZ6hmsHbtUUWpdU+tX5qIKZe
         iS3CqQMhm+ZV0sRTr51LVNy3jRumg1pfpqWHpYgEqmLAk8xKt7FQ4E5XTf3RT9x0M7aT
         8APdLsq+P+uA1hwqzy5EtCJFWytgmTiGJOcIJJLUAu4qFCSy/B5OMNpjs7Ut59dJ1G0k
         RyfA==
X-Gm-Message-State: AOJu0Yyrp9QxYKbDHDJoectlPgxb/k98QWqJylQlYvf/bfFiCdvCGNJd
	ElwEsDuifoUFUdDERDv1EeKLO6Fl0Qd0caviTm2vXNA/08GGHGdHDhrZ3X4XyAU=
X-Google-Smtp-Source: AGHT+IHMp3Vj8D5xOK8sGcL7IZTD8X2M3Tusli278j57Rh6uC4B2tdfT0DQHDAHKsjpze0EnlHJyZg==
X-Received: by 2002:a05:6512:350e:b0:53b:1e70:6ab4 with SMTP id 2adb3069b0e04-53b1e706b9fmr4865361e87.14.1729815614849;
        Thu, 24 Oct 2024 17:20:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:20:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:08 +0300
Subject: [PATCH v6 1/9] drm/msm/dpu: use drm_rect_fp_to_int()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-1-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Z1DUfkZ6/oZuA6xRT2zKvLthKeLBEYc68oLVcqrozCs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ5QZvFmOhdu+ChSig00R7PCHyXB/io4gx82
 9QJ266jmSmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOQAKCRCLPIo+Aiko
 1RuYB/9ryN0Vx5GSVzt0aq/0oxk0TaqWvPjOsc9vwGvdO+M17JlZMARorjXfRX+LVmsgsHRMSpL
 TeR3TE9I6oOQjQbmZrRgw/1QKOowNUQVMeObdT1UshAlhiu4UPLsGSP84itcqEtTo6feXRAs8/O
 iYeyRyUmt7GbRimV8tKYZUCBkHqTE3ZNs1voX7QlW7fpnEpGsnHKLMG5Qe4d2qkvp//XDaxPsw2
 TcLV+wcvgUsB5YtkADcMyKJOtXxvP5crLjWMxyM/HMTt2LxVE4xqTSDbW9rpcfZO4x9Vnj4unbT
 qH228PzTSLSGi5tOrDp7mDMxYYOaQ8cwYMA0P+wFgcpnK8CD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the drm_rect_fp_to_int() helper instead of using the hand-written
code.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e935e9c05f04..37faf5b238b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -829,13 +829,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
 	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
 	pipe_cfg->dst_rect = new_plane_state->dst;
 

-- 
2.39.5


