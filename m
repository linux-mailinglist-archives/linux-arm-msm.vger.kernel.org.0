Return-Path: <linux-arm-msm+bounces-49786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D70A49026
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F32B57A2AA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47A91ADC6B;
	Fri, 28 Feb 2025 04:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IYmhA+KC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18521A9B5D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716056; cv=none; b=R1317N83LP3ik9oWbhdjAZqg1T/0JxD+iP4GN9xgZx0vS0pBMucJYbDIHlQtkgs0zSAO8zePDP4IDxO3zNYUcoZ7/sEMREvlCKWBhB7j/rjgy8JP4ABa6E78X6WjvxQDSQA6zCR76HHcKJNXp6NzjgyYDAdEORc6xbj32Ko0uPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716056; c=relaxed/simple;
	bh=Db28RCeq/Z1F9VUkba+d3OjHCuLcQ1RUKoNZ2nefo0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TegR2tKb6QrMybufSo+/5wLHlKcpBcY23eB4uRMYtOKjXLpWR7zm7r/l0lkkDi9eywaDEqI4gu+LVrQocl2nP7bJOrk04ba183AlOm1+ZseLIf3j1p1SemokVMeT6H7uLHj/lsOCZ0z8HJEFho5WzX41/ZlhvObKeM6hDAd58BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IYmhA+KC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5494cb8c2e7so516478e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740716053; x=1741320853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV2g354nchRnBXWZVfbxLCtDMmHT1sLILUGtzSkps/s=;
        b=IYmhA+KCbcFlapPEdgwOd0OJI+elTi0gycDdwG6j9RjbZWSHJHUxftCvkt3yt0j3Ok
         BaDqirFAcTTTOEMaqf3GKO4O7Mbq4hddRVrnRWR+DCmFplcD23SSUnRi2xEKvcFc0Hnp
         uk6giDaXWG9RjpqQkb57TgGatL3cbtXoWrtSxAvZ1Fx/k+CRRsB4xXhO+1k1N/Y6KWzR
         41Q0VMw+zm+z6FexCBfKUoxBJKiy4wH5TVrdE3V/3kscbUaEpl183Iwmv2TY7fgLKLwh
         rl9RP3dcRR2VZ2pZgn8vWIiAG+HvQ+7FBkuzRzIKFIS0K6CJHuQ66vSxCiJ7na57fjVz
         uJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716053; x=1741320853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV2g354nchRnBXWZVfbxLCtDMmHT1sLILUGtzSkps/s=;
        b=TPfDkP6qMshGa4JkWNbONHo4Yye/QZEj0r9Ll4cS6fu7Dbpyc/nreTkp50CwjVoE6P
         d9zR71yMQgQXjrq5y8cw+qj7q0MTBC4+tcJkWm6+WejDb294GWZkEIYmCMDtoM2yB1Sr
         chI02bP1m2N48LJBebJpKlVwi4THHX1rDJugg4UqPISYIshctcxunfvP4ntZdxcTQXu+
         /Fsq1nRQJmpoggAWDNvBQOsYJqTU6aHtNMkYAT3llYAYQkqBoowbiNPmmZ6VZ4gqsrme
         uTGrTNG+ic+efAbwzQRd/PyGoR+5ueBpDk9nK4aN40wUVrmehz5qq2JIzyF2ZiDgtY7I
         YnZw==
X-Gm-Message-State: AOJu0YxRN+GynvrRhLy/onndhm12T8wsxRfv8f6S5Rqp8jvICvOhMFKf
	Pr0EqGw+lG9yCIAPPWMy2CpMMencZqrJ3TLPXywk45/73AEYeKFIXwg5XKK8sW4=
X-Gm-Gg: ASbGncuvsxIxS/ZoPy0XyAc19HDTEtZuF5K48WD8rf8dfE/bbD1jqxKylc4JwrdDoBb
	DCuv78QalD23XGk/vF+iKziFrWR1dfQSlB0r1LTxQoqQgRtir08ZadjMw9jykIup5E79Ezjpvwe
	GZ1Z0gy5MI6VMKE1z/SxF25Ddu0ql5t4dkJUZWavkmv6JyC1Z4kMPfQ9Kwgp0jo7ylQtLHUXxu1
	CLZ4+kH/2TRvmcBP+l6guT944BROOdhpT9p1z0/OOWsz+BHu0AkgpDZ1zxrmZruRcItjngirCtZ
	ew4WNLPHl8kx2F44aYCrgMBPyhlSt77xeA==
X-Google-Smtp-Source: AGHT+IE9YBTQR0iV6z+4YepiNFtTYxrWpO2RsdsEJMdQ2gFeW5S0vYwMjTGDZ3kcFTQ5S0SfoKkU5A==
X-Received: by 2002:a05:6512:281d:b0:545:2950:5361 with SMTP id 2adb3069b0e04-5494c129f93mr735078e87.5.1740716052705;
        Thu, 27 Feb 2025 20:14:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:14:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:05 +0200
Subject: [PATCH v2 1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE
 register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-1-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Db28RCeq/Z1F9VUkba+d3OjHCuLcQ1RUKoNZ2nefo0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgOusw857TkyTSoMiWxrvJMdo3LAJUISc0/L
 9jFAe2cySKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1QK1B/4gSzJoznIbF6hHlsqXJji1ggjQMu8PWaU29vFYaqaUN4wmnphk65OGL0wrF5300/u+ew8
 20fdZGfbJWN3TgnO/90hH51YuE9eOMeV6ruKTZoBRQyBYZ9zqrUt/67hXw2UU+0QGxVgmdpFLH2
 D5Q/wskOJ1NCiP8ETGMlaeR0cR1ONr5k+RVvNJjIIl2/Dvo/WWMqqoHQNkj5iISwTkSXGfk/PlP
 HlHh33TKB66Ei5fTrP/bfWJYe6HlgMUkOUrFHqzGgd1UyeYB5NmEFlE239EseEewJO6huzdljB3
 dgiizUDrhoXlICW5r0hgeLgqR6WQD7Ec2KhEPdZ0y8Z75QR6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In case of complex pipelines (e.g. the forthcoming quad-pipe) the DPU
might use more that one MERGE_3D block for a single output.  Follow the
pattern and extend the CTL_MERGE_3D_ACTIVE active register instead of
simply writing new value there. Currently at most one MERGE_3D block is
being used, so this has no impact on existing targets.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4893f10d6a5832521808c0f4d8b231c356dbdc41..32ab33b314fc44e12ccb935c1695d2eea5c7d9b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -548,6 +548,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 dsc_active = 0;
 	u32 wb_active = 0;
 	u32 mode_sel = 0;
+	u32 merge_3d_active = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
 	 * per VM. Explicitly disable it until VM support is
@@ -562,6 +563,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
 	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
+	merge_3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
 
 	if (cfg->intf)
 		intf_active |= BIT(cfg->intf - INTF_0);
@@ -572,14 +574,14 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->dsc)
 		dsc_active |= cfg->dsc;
 
+	if (cfg->merge_3d)
+		merge_3d_active |= BIT(cfg->merge_3d - MERGE_3D_0);
+
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
 	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
-
-	if (cfg->merge_3d)
-		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
-			      BIT(cfg->merge_3d - MERGE_3D_0));
+	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);

-- 
2.39.5


