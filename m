Return-Path: <linux-arm-msm+bounces-16445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D2C89925D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 02:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78ECF281CD6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 00:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8312F5E;
	Fri,  5 Apr 2024 00:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jBFVySCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0FF17F8
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712275276; cv=none; b=JxuC4cH+hldeS/Vc2FBAlk69cqkzcmAwQMCPGZ/9vGQw1xDjfryIA6Y9nwQwYBq3cAbqkGKYih86K4dAnP0jmGSDamoAhiCqLb+88wCGhZS62thZOUFu2XHky4JvgY9cYjJ2wTRJwAL47CmYOJKsv6Cjs2K/4YD9AwBotKQodXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712275276; c=relaxed/simple;
	bh=2hEg4h0cVL/sUuyeZmcQ7gN4Akq8EJcgFWl7SsXVeeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cm2ajB6dypwaz+XM5lIWYj8DUIIc5mKrYzWz2zmPyWM9H8hmUeYe0PSRZ/G5YrLy6SSvHSoex0yNSwvNb8kQduA1GnY029PqydGQJ3S28eAXaNVlZp7bCRMbIncm3A63/DN2aoh4d9lb3QCCEnDnMNdJI9ijHcPcui15A9Alpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jBFVySCV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e2987e9d67so9557885ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 17:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712275275; x=1712880075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BubB/ZTZXGyOlYIo5JvJ2GYL9k/6VJ0RRIgGr3QHUG4=;
        b=jBFVySCVWeE1PBBUpcGZVKJkrlhAy76KtpQg0oCZ5xPUIJc/caiorDWWB42/CwQbWO
         9vOSKi/TmAnl/BnsTkrzURL6gHVwQxf19K2DWkg8VLJvd6nJVDT+6nPN4jydm+f/iecD
         +96dvq1iLRcABcVXVGPnRRRF8AKtgZ6sh5OYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712275275; x=1712880075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BubB/ZTZXGyOlYIo5JvJ2GYL9k/6VJ0RRIgGr3QHUG4=;
        b=T0PBk4xV93TVhbIRmiNyee6vI3Ix/tMG41MldlPbp0z8CEB33/7d4PoFxpjpGxD/Z0
         51NJtDXs7TFVRg6th7Qzm6ZLm8xUBuWHLO9uet+bxaZKihi+8eYajMaeaSSBZoDMvzFm
         o+2Vwz7pGA1E1T4xMe3q8tqrm5lNw9OECtnvAobvYr80cU7dVfxA/wh8YaG2eTqLDdRP
         QLnXKzJ4g9QWk9GQ/7M3G2zAlQAffdJJtAb/U/cwmBMU+xKTWyVIL68qMzbUAwsxg/fO
         RToxOeevx0+LaUiaJTpKnKiupMNi//M1MQmUI8foeMQy7yhRUjNSujCwXvwXLSIfbIrZ
         Atzw==
X-Forwarded-Encrypted: i=1; AJvYcCXxEFTSooOgyuq3ngU7UflGTzMnhEaQRax2+yWDueARxhe+CMOT0GVpnSaoPt8Czv5+50eUSm+cELa8aYgcX2rZF5CfHYMEHuYLEBOAlQ==
X-Gm-Message-State: AOJu0YyJMroZdt9WlSMBP8Eyz3k4qXZQWViCczKYbX/WuyJXdTc6qiRW
	KaKVeq3wCKu9SX7EsanIfMdI6/d2FqNqRrc7CVKAhg6o7W/sSX2telzMgouNuA==
X-Google-Smtp-Source: AGHT+IHHeoBPsIh9g3n+aMvqQ0ly90tm+3kUGSMVbGHLtLA2CIsxae6F593S7l6qGq8fl7xOPFRfEw==
X-Received: by 2002:a17:902:e747:b0:1e0:30ca:62c with SMTP id p7-20020a170902e74700b001e030ca062cmr1469256plf.1.1712275274803;
        Thu, 04 Apr 2024 17:01:14 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with UTF8SMTPSA id f7-20020a170902ce8700b001e26e1e62f9sm213048plg.176.2024.04.04.17.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 17:01:13 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-phy@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	Douglas Anderson <dianders@chromium.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: [PATCH] phy: qcom: qmp-combo: Fix register base for QSERDES_DP_PHY_MODE
Date: Thu,  4 Apr 2024 17:01:03 -0700
Message-ID: <20240405000111.1450598-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register base that was used to write to the QSERDES_DP_PHY_MODE
register was 'dp_dp_phy' before commit 815891eee668 ("phy:
qcom-qmp-combo: Introduce orientation variable"). There isn't any
explanation in the commit why this is changed, so I suspect it was an
oversight or happened while being extracted from some other series.
Oddly the value being 0x4c or 0x5c doesn't seem to matter for me, so I
suspect this is dead code, but that can be fixed in another patch. It's
not good to write to the wrong register space, and maybe some other
version of this phy relies on this.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Steev Klimaszewski <steev@kali.org>
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
Fixes: 815891eee668 ("phy: qcom-qmp-combo: Introduce orientation variable")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7d585a4bbbba..746d009d702b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2150,9 +2150,9 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
 	if (reverse)
-		writel(0x4c, qmp->pcs + QSERDES_DP_PHY_MODE);
+		writel(0x4c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
 	else
-		writel(0x5c, qmp->pcs + QSERDES_DP_PHY_MODE);
+		writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
 
 	return reverse;
 }

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
https://chromeos.dev


