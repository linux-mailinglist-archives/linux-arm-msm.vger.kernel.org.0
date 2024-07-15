Return-Path: <linux-arm-msm+bounces-26163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0B7931425
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 539BE28160E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C372718A958;
	Mon, 15 Jul 2024 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBM/TuzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009C118787F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046304; cv=none; b=J5Zd984729WChOqUS6JyL+sZAi9GeQBLTgicm9SZSKT843lBq1wThCEV0mFOkv4OrAwsO2AJveXT3Dy3VWOVID/gHZtU2I4hY7IWc3Rpf2sf3V8cTvcAttiMu8u21LtRUYli5iW8OGBWU5c9A/GnBPa2JWiV7hhyMGDt33B21UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046304; c=relaxed/simple;
	bh=0DePQic4KVJIvL9GJlnPshTiXW3fYxdpcyhcmFGMheU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bgK2RKR0XdHe016m3bQG7BhQgozvoXqGSwbyqrEDpWnkaBcc/YPEG1sJ2+L57YMFCvbsRfmVyDHNpRx4Lp8RVg1KupblbWKct+BgQJfNimC3DJLv0b3zklVbQAe+/HMpdORHTRMJnHhLmZ2APc38wRgiJc6ItI42OxSiGUuAGi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBM/TuzS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eeec60a324so7968861fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721046301; x=1721651101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FCPqymuE1696F1HXcUi+tB+c7mFe5Hm0KK5Kdb2Bj6o=;
        b=RBM/TuzSFheYzuHutH+ujOBleoY/3ZpC3h0xpGbZEb2VlW8bbdNStu9yKTCuBP9m0z
         LmJ/Deby2x3dwrAGOX2KNvnBab6rHldrTIBXJfpw/Mmhpo9uJlFbztw8Qe/Gaq94h7fy
         ScEMLaMXX7cG6rQfyW+EETqcs8xiE5+HkCyDVA2gD06NXrriGIZSzDpSzwHMRIgRWBJU
         jVvKhAm2uHuzi5GjIG1yHdzSz7VuDZBHXua9TGezEacu9vArgbDQKxNH+NBDFxaXvmdX
         Dzy57stb+bRBFE3kUk+ki+pgu00EyhRjblt4p4NcqLP5/wOvn1TP+ihMySA+GMliLHcI
         Az/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721046301; x=1721651101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCPqymuE1696F1HXcUi+tB+c7mFe5Hm0KK5Kdb2Bj6o=;
        b=N9BkNtTrck9/JztYW3tYeh5ShXyCMHm8CMYWqWwl/uFrBiNfanCKvUn9xOoeCSTu3S
         b4BCq+BXfuQk9rgXFwDr3qG1Lq0aez3EoS6BH+jj7gHkbTb+fnhivQABJ10nP4DEsBm/
         m2sK9xIIiaZ1Fu/T5lUKGuNpehJaef8JK3Rn56ViJ5a83jtsPSzUSvuG14x7gTpG6QST
         kIcu5kohwD/msmyHJpd2F61FPbiFMyTbiUzbFjmLZUA/wK1njl6svch8xv3ctp4MQc5P
         hmC0LmQE4TL3orKNq+HNpsAqEByQkf6NwKl+zBbuKn3qsq8/7+Jt5uU7FJmr3sgpOK9C
         mNog==
X-Forwarded-Encrypted: i=1; AJvYcCWNL5YMrlcXRsdQZLD0UeeHjw485yoLDy2GVd32P+FJC7bT5If/YV7o49nBE5zBzenzaUtqCG8fZrSL+euq/qFkx01QxnW3ywPzapyxzQ==
X-Gm-Message-State: AOJu0Yy+wiserEiMyHpxu8f3MJ7z3Vwbm2rynMhbN8FqyLGMyoZVpRKN
	txazgvxCVoaMU3DRI6v4WXJUVWhpeSCHMrEqFTNVWmalOdFf38+SniIzD4GKK1I=
X-Google-Smtp-Source: AGHT+IFuaB5hWdlEUlx+L2Fk0YWQZUNUsQXsLuGZDH7wxw0vxm8nrCvNGmOzNWXYTI7eL6PnKlFkyg==
X-Received: by 2002:a2e:8ed3:0:b0:2ee:4d37:91df with SMTP id 38308e7fff4ca-2eeb30fef50mr147387991fa.27.1721046301088;
        Mon, 15 Jul 2024 05:25:01 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee1939b56sm8287711fa.115.2024.07.15.05.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:25:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-firmware@kernel.org
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] qcom: move signed x1e80100 signed firmware to the SoC subdir
Date: Mon, 15 Jul 2024 15:25:00 +0300
Message-ID: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ZAP shader is signed and is specific for the particular SoC. As such
it should be put the corresponding subdir rather than the topdir.

Move it to the subdir (like all other zap.mbn files).

Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE                               |   2 +-
 qcom/{ => x1e80100}/gen70500_zap.mbn | Bin
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename qcom/{ => x1e80100}/gen70500_zap.mbn (100%)

diff --git a/WHENCE b/WHENCE
index e4e06b966e89..b6451372a6ef 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5992,7 +5992,7 @@ File: qcom/leia_pm4_470.fw
 File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
 File: qcom/gen70500_gmu.bin
 File: qcom/gen70500_sqe.fw
-File: qcom/gen70500_zap.mbn
+File: qcom/x1e80100/gen70500_zap.mbn
 
 Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
diff --git a/qcom/gen70500_zap.mbn b/qcom/x1e80100/gen70500_zap.mbn
similarity index 100%
rename from qcom/gen70500_zap.mbn
rename to qcom/x1e80100/gen70500_zap.mbn
-- 
2.43.0


