Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA5D19295
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 21:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfEISog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 14:44:36 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42575 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbfEISoe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 14:44:34 -0400
Received: by mail-qt1-f193.google.com with SMTP id j53so3697054qta.9;
        Thu, 09 May 2019 11:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNzbchyS3MYXKFC8vXfjMbKEn2g9EXo8PLmv/XF6OgQ=;
        b=TTNDv5mNgHh7RhlaXKTRIDiMCPa6fNBk7ERMYokDoBWwODUQ+TgQ0DgBBc6jQ9hBiW
         kt6oupJUYmACQvepi7F4NWlVZFQQ1CU5J5E4Ool4Rkzbqv4pyHTKg4um54Bd3+Jy7JzD
         RPOYM68lZ95tHvHm5AmrnElVotyK79ItbT5OzZDrmZQIJpSIDyDGuN/cm+PGnNxe5lle
         x2lZHA9qTgZ7sXyyW4Lj+sHZKbARxs2wmeGZM6JG+xbbbQN3sVC/9bmNl3vXB5BKWpBG
         wt1m65ELO48/VHTNQejQVxNoZftYI07HehvNAE0AbR+k2ANdRn7C5CGUAEsQWcYTl0Fa
         i1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNzbchyS3MYXKFC8vXfjMbKEn2g9EXo8PLmv/XF6OgQ=;
        b=M05cDPHPHFXsYH83jBdvQDTMqcMjPsuWegyyKVnIcblEEnZSYhXhzMmmqh3p43sok9
         bJCpb1mY13/cdinUwV573hp8/stNd5Pz7gc7BYbkX4UZA8HriMPoV4PW10n2nY4uXr71
         pWkR2E3G2/E9we2LBck171AmF+m5jqPZVWm/DFgCqHXccsD1hnYCr6GTsJ6A6B1+F4EC
         tw0HrwaTbr0nrnyKUtbHpnPGwU2NyTVBFOTWRlltgsHbUd+Cd5eQrQlmmsi/8AntSD8k
         DVDyawg+8QGwHfIeNgGe8Kylw2nbTc3tm/1+Y1SGXNPlJ4Nj7E6acSsE/KrqTa5+AbVe
         MB2g==
X-Gm-Message-State: APjAAAUP8ZkMrpWlJUSQfIPu2QbwEHnUlY2A9uGSB+VHOu+iDTDl9q3O
        7Tj4r96qqoKXmonQMgoZ4My0Ntv52Ck=
X-Google-Smtp-Source: APXvYqzvkaSup/U+6jlc0XHDqTIZZGZnUdW7Fzk8uuVh2NxC01TyNPoFq3JKeoBV1falQBosMIuPVw==
X-Received: by 2002:a0c:9ac1:: with SMTP id k1mr4997641qvf.36.1557427473250;
        Thu, 09 May 2019 11:44:33 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
        by smtp.gmail.com with ESMTPSA id e3sm1116133qkn.93.2019.05.09.11.44.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 11:44:32 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 3/3] arm64: dts: qcom: sdm845-cheza: delete zap-shader
Date:   Thu,  9 May 2019 11:44:13 -0700
Message-Id: <20190509184415.11592-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509184415.11592-1-robdclark@gmail.com>
References: <20190509184415.11592-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This is unused on cheza.  Delete the node to get rid of the reserved-
memory section, and to avoid the driver from attempting to load a zap
shader that doesn't exist every time it powers up the GPU.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 8ccbe246dff4..28c28517b21a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -175,6 +175,8 @@
 /delete-node/ &venus_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &cdsp_pas;
+/delete-node/ &zap_shader;
+/delete-node/ &gpu_mem;
 
 /* Increase the size from 120 MB to 128 MB */
 &mpss_region {
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b2d9e46c3916..2ea74b58a613 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1989,7 +1989,7 @@
 
 			qcom,gmu = <&gmu>;
 
-			zap-shader {
+			zap_shader: zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
-- 
2.20.1

