Return-Path: <linux-arm-msm+bounces-20059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E018C9CE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69F06B21ED0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D158E54669;
	Mon, 20 May 2024 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFm1ByPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9620311
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 12:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207169; cv=none; b=QTX/9nZ8eerCp3RX/y5UWxhpT1YAW+ZhldEhFBYC1UussGOzKKwdSZf6YyWGuiFu/7ISAeJSR1TNfmFXktz0WhAdpmVkcA1HnamH3ow8tgqLisAQDHrZaRxwRVqwvMWB9pRGa+/kEDoCx3gp4uVc8DeNpnagCSIAXiyYSfY2h84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207169; c=relaxed/simple;
	bh=DX93PVbvVm550XJ59hPJYzMq0R5QP/h0qcUJAnqZViU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kC1qaYfZ3QvrYIk4urajeBjJp0r3dSIbWTZSYl3tuFLNufUVUntupBtO4FQFApG7seuyDt4I1D45vH9Y4YxR1GNM98+0Qq6f6nrLTBFWqVkd8ASl5PDlpMmwGQh95tCj9c38K/F9fhp2FZYDe1Nx8cjK8nd3tKJ9wo0OhjfBXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFm1ByPZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so3393692e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 05:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716207166; x=1716811966; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bH/LloORtAdJqakmZhy23BG1cTvef7l0ekgFCknTjPw=;
        b=nFm1ByPZmbrlmEw+b05gshkP1ECE1nUEVHqv/UiMM1NVn4eNC1K/vN9fgR6ck9uILh
         8OqIvRGfHB+jCJ8SAKLAPDIwRy8SzppV85q3T3tpyUAbYUujR2o1hfnJ9qG2u3PAqvTt
         u9ubfwaTX2jO8Tiv0k6SbCj8HcjrgeTHMjKAkF9XItpCHCbNK2nyhZ86BjiolC/E9ZKH
         0kdEcz1TzxpD4Q/9hHFr1/2aOR96RRL/Y3onJKHHEN1oRG/Vkoh+S51bxqZIUOOwITFM
         PHAV/Aa4kTID5fwIHoIpu+hZiDiqblvX4/hU5VhlkuoDaZECyX604QDrRRcxJs+OuBlc
         nxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716207166; x=1716811966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bH/LloORtAdJqakmZhy23BG1cTvef7l0ekgFCknTjPw=;
        b=q29bVfCtEHOSdA7RqcouFOwQa3drClVAeBe5r8Qn0CcmuauhJCBy7XDMi8XGUaPjPO
         nRoBBSDEB/cSGnQK0IPXzvx5tDe2uJqvbzC5Y/MFf/fj0V3bw6rmTa8QQLgHICNVmsYB
         pmLuWSzjlgnRzAlIVvVXO9OFprYIzNZ8Nn3Mio8nKeSPrsc3mvoi6fP190ZWOqpcBa/3
         HJCnTxDyyOw32b2gsueBzyaViFN6ssStXG2Tu5B/1wG+JrDd5vEfu7f6gte+9YH6hn5y
         ZLl8vfc9DVo+LjDeIcLOusdblURf70wWNKDrkZv6fQ2BHgpH24DZoaKm0h+eE5EK3g0C
         1IqA==
X-Gm-Message-State: AOJu0Yw1VgefHnoSWsAnH4KeHu0n5Vx2wHBxtC5gms82Q2fixP6iN3jy
	r7c99DngDjnQ0FatUQMyVal46QIFWHvXBlXjJusDqRhLhdAG5zOUO2h81qd7HhM=
X-Google-Smtp-Source: AGHT+IFLqYhkFTSfEMengeFM9Uixm1e8E4F2WchZdLT/7cV4/a/D9WE0HWBrmfZuNn4yGUJDqaS60w==
X-Received: by 2002:a05:6512:3ca4:b0:51d:67a0:2433 with SMTP id 2adb3069b0e04-52210074979mr23298869e87.46.1716207166288;
        Mon, 20 May 2024 05:12:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 05:12:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/7] drm/msm/dpu: handle non-default TE source pins
Date: Mon, 20 May 2024 15:12:42 +0300
Message-Id: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADo+S2YC/x2MQQqAIBAAvxJ7bkHNIvpKdDDdakFMtCKI/p50H
 IaZBzIlpgxD9UCiizPvoYCsK7CbCSshu8KghNKilRpdPLEI5wkPwsxrMB571XWNFUrK2UFJY6K
 F7387Tu/7Ab5JQl9mAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DX93PVbvVm550XJ59hPJYzMq0R5QP/h0qcUJAnqZViU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5q3nc2rPoM8cbUfKw6Z8B5c9+LDB33zPGWRzaH3z+7hS
 Hm2PaS4k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATiXnL/j9yqUNBoLjfdW3N
 PXxeK15W8Va0J/3cIbd2dfrSRMHSJq+vwpu9Q5ZW9vZcu3TP9uyJH4vK8+fvirBwN1cMYvC7NYl
 900H1thDroFkmuRPWrP/lMOdMSLS2yHSPLrZTlaed9zJd5pL2toidc/3VaduWHYURah9NV6Zt+e
 V/5vGa75OjjLySrN3qOkoLa+/e/C2Vrvkurc7mzmKzNoUL+4+Kb0s83V2oeyCsq8sk6MWGJaZZP
 Mc+7Lcuj3kVypHT4KHLlf5C6AGzwGJdzTsiBWVC2x57njoR92NDi8210pBrgvkrmZUXljzgXahl
 yRsk0DxrhrvnO9PwZ+zuhxhSopQrVHr6Xfw6NymX3/wFAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Command-mode DSI panels need to signal the display controlller when
vsync happens, so that the device can start sending the next frame. Some
devices (Google Pixel 3) use a non-default pin, so additional
configuration is required. Add a way to specify this information in DT
and handle it in the DSI and DPU drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      dt-bindings: display/msm/dsi: allow specifying TE source
      drm/msm/dpu: convert vsync source defines to the enum
      drm/msm/dsi: drop unused GPIOs handling
      drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
      drm/msm/dpu: rework vsync_source handling
      drm/msm/dsi: parse vsync source from device tree
      drm/msm/dpu: support setting the TE source

 .../bindings/display/msm/dsi-controller-main.yaml  | 16 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 11 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  5 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 26 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 44 ++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 48 +++++-----------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  5 +++
 drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
 12 files changed, 106 insertions(+), 62 deletions(-)
---
base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
change-id: 20240514-dpu-handle-te-signal-82663c0211bd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


