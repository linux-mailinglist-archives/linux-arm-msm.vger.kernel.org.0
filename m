Return-Path: <linux-arm-msm+bounces-47274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE7A2DAE2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACA2A3A6EB7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881244315E;
	Sun,  9 Feb 2025 05:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UlNN1hK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC8E22318
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077610; cv=none; b=NG3nqQNZoS8ZehrBZ2wc8A4pfyWoh6LouqTvIgG28hhsb518ZVE+eIAmln1QUL8hK9sxpevCSHdLIMu4GEeTgparTm2CTRYPkJ8FVdOeQc8DMYJ4OGnd1O5n7fcOQr4CNwr6NASnA7lGcQ45DwcNMT+auFltdCy2L/C94xGBWYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077610; c=relaxed/simple;
	bh=0M7wHxw7m62S0roh+2L9puv7sZHqrnnVrbBFJ3TVoX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aHaF86AFTmf0rYhubKliwqE88tY8MsT1p9nxHt8r/NzwByraEtLqXyJZFNVsKZP0C0IN6SyTxwfuwJ4R8sVA39w0PU/wfyMIsQ4cVE90MOF+aG77vXEMHTZms9BjBahZfsRBxJbTW7K4PeQQLpuIkNIdvVvlBB0wlb+qn2EK7WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UlNN1hK8; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5450b91da41so31555e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077606; x=1739682406; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kVlSJmm9NvMImPEH3NGDwLgQcH3oQGXNxfeyjGWMh5c=;
        b=UlNN1hK8uHA6CGru0tMVEizfAskzwaFH4lvvjuBll1Bf9yZ3kpjSrjsiAuArBun0BQ
         9wSL43+RsrHcO8BdktpcHX6h5yYQdmF9YbwDE+AYHS45B6AKQNBJ2k9aa7sUhtstidZC
         JgjrKf+uI7Qu2LtXybVfhs22GFOJRwslKpLomoo7QstfVOBtxKbNh67bI2UOKH7QMEg6
         efej5KbYN1W5UFaF/CWXB8RYoWNU/3Os3+fFQ/RfxOiDRhYaOGH1lMpRg3jJf8zoxI4z
         4Bv/YBJXwnEXKfRSx+pILYDvGiepYac1ve6PimUHRffvR/Rr8//l/gMpaAFn8/JyjIg7
         FALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077606; x=1739682406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVlSJmm9NvMImPEH3NGDwLgQcH3oQGXNxfeyjGWMh5c=;
        b=fS/oDAy7EDuQJ4SJhcetBkCOL9g4BRltfqYt629rLJ7M8gk3bDnzX10bd81ceB9hWx
         aOfhEZYOYiiaeHBug7DFjbljat1iGbEHJoKaIw3D9EP2PRjoI2Y7kG/aZul0x3yFieiu
         04nQ7d1wLOtWyqQdkOzG0KXKrybBSfMMruK/GsWwVPVFoHMv+aXG5SG+xzx5eZGfa3lY
         U/StddtcuoVN5DzAoPWeuMaGWGamh8oGJfa1xfkkhYMRbrCTLzWVADbBqgyFmTD/iJJR
         jT1Y8nsA/5flgMwuwrh/Q/5NpuJblEHiyvL4t5f2YTJ/GcwLH9LVYc3Tpfc+lw/tuuGW
         EnpQ==
X-Gm-Message-State: AOJu0YyYpXe3xv8dCArxkRLA7jbEWd6hHLmwSQOfH8xuj9W3PQnN5q2v
	ENSNfvJFh2eLwo2AHw2xiokSpmOBhjWhWwE4dNdccGIrdVIxlIW7+0LsG/ns3orLy8kVDwcYOCX
	ad8o=
X-Gm-Gg: ASbGncveHGhyT47V4wsxfEixVgLTuYv2JvCoBaNRa8104TyQF34XIcbGxtc8sTOIFTJ
	7e4EqPBfdFcK1vN+F4gxWAeFSQsQwUmcWO8ses6cfyNGv0SWBRGwXgdjdil17/kfOi7K/H4f2FL
	veUSGKO2Behc2ud4fqKSRYl+oNEDaECog8jL+yzSx2oQU6bOW7TtN+DI/wqpL7o/YRBWRfpE1s2
	KVh97yP3gV84p5VMpKCSeSYJgV3hR0aIEruQu9O5TO0cXPyHctneRSn6zlb2Km+++ORF7DT3fnG
	qDI4qyI/k7Pv03LFCU0JGCs=
X-Google-Smtp-Source: AGHT+IGGyZEKYTi8ojVgaUz/MI5jPCUO8zO80LpqW7NV53cAhGN5vJjCPYZWQx16G6Wo65PTqKzfqw==
X-Received: by 2002:a05:6512:5cb:b0:545:a5e:b4ef with SMTP id 2adb3069b0e04-5450a5eb5abmr163353e87.16.1739077606235;
        Sat, 08 Feb 2025 21:06:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:06:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/16] drm/msm/hdmi: rework and fix the HPD even
 generation
Date: Sun, 09 Feb 2025 07:04:44 +0200
Message-Id: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG03qGcC/22QzW6DMBCEXwX53KWODTbi1PeoevDPEqwWO7EpC
 ory7l2IqiZSDz6MpflmZq+sYA5YWF9dWcYllJAiiealYm408YgQPGkmuGh4KwQMHkY/BRhPHlB
 2qvNolUHOyHHKOITLTnv/ID3kNME8ZjS/DMmV5IK3rZC1Vp2QcACizXmtrclrGT/T8vYVosmpT
 vm4QcdQ5pTXveEiNvT/ZRYBHJzk1lvtWqfxkbO1WeSfWVHyk1mSuVNNa1TjrFfyyXy7b8t4/qY
 DzfeBzJqC4NJE9ftqKtMrPYh4mdnj8fpqD5Rcg83B098e6lKM6GgYaJS6bVCpg+f9oint9gMi/
 hwVlgEAAA==
X-Change-ID: 20240522-fd-hdmi-hpd-e3868deb6ae0
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3416;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0M7wHxw7m62S0roh+2L9puv7sZHqrnnVrbBFJ3TVoX8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfgbYzSCRwoGYrYy1OinGcWsU+YQjbwTggiJ
 KwMg6tN+YqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34AAKCRCLPIo+Aiko
 1acrB/0QDrH8a1TlDIzJlgKCCsuYxBSAYqPZiGIqdrNd5p/Y1f6SIE8cjT+qz5uCpbNwSwJLmID
 FkTKRoGzI3vQe2W33vzHbTrcGPRSCLovOTHvGGr3hDkCJjTWRhooNRjvkrPXxcBNl3ciu/+PEVF
 y0xhBV7fD1F/vUUvo05716mGqXCYq9yxiCrZOiTOM/LUEg02xvRWM/l6UvpDe08hoF7eu58bIMM
 IWd0QBMmaWMasxlekZEN4ppbzTbX0C8zmyFbiMCjHpjUJ59H33Tvw/2tKMYqK6Op9TtEBaF0xPe
 sqV5jL1JZ14UXoKbzdKaUtg5zmIbcwbaUTJAMkYiFlqsIfUZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. Previously HPD
handling sometimes could trigger in the CRTC event handling, however I
can no longer reproduce it now.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/

---
Changes in v4:
- Added bindings patches. Dropped hpd-gpios from the IFC6410 board DT.
- Fixed checkpatch.pl warning about non-const string arrays.
- Rebased on top of linux-next and the MSM HDMI patchset.
- Link to v3: https://lore.kernel.org/r/20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org

Changes in v3:
- Rebase on top of linux-next
- Dropped the patches that were replaced by the HDMI Connector
  framework
- Picked up the mode_set -> atomic_pre_enable patch
- Link to v2: https://lore.kernel.org/r/20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org

---
Dmitry Baryshkov (16):
      dt-bindings: display/msm/hdmi: drop obsolete GPIOs from schema
      dt-bindings: display/msm: hdmi: drop hpd-gpios
      drm/msm/hdmi: convert clock and regulator arrays to const arrays
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: drop hpd-gpios support
      drm/msm/hdmi: ensure that HDMI is up if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops
      ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO

 .../devicetree/bindings/display/msm/hdmi.yaml      |  20 ---
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts    |   1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 147 ++++++++++-----------
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  28 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  55 +++-----
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                | 141 ++++----------------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |  14 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   6 +-
 8 files changed, 141 insertions(+), 271 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20240522-fd-hdmi-hpd-e3868deb6ae0
prerequisite-change-id: 20240307-bridge-hdmi-connector-7e3754e661d0:v7
prerequisite-patch-id: 2ab3eb29f644faba596a27259c8c4d35f824b37b
prerequisite-patch-id: 469e655ccdfd1989d58b043a6b4766d40a334ba4
prerequisite-patch-id: caf6f731bbce246ee20f92f128a1480c230aa9f3
prerequisite-patch-id: 56a9d57d44360d0913023c4d77f765c2ebf29749
prerequisite-patch-id: ac7b8e8a14af4f45170ef5df6a632adb6d8ed483
prerequisite-patch-id: 4b6ed8a13b525d2c6a3ee449ba2381041d78dacd
prerequisite-patch-id: 396e7abb756bb9c8818d44dca8fb3f819c011ee0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


