Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C4730A5FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 11:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233486AbhBAK6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 05:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbhBAK5x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 05:57:53 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67AEC061574;
        Mon,  1 Feb 2021 02:57:12 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id z6so16007450wrq.10;
        Mon, 01 Feb 2021 02:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q6xOa8cwmzfCgPrpcg4Fp0Yqbe8ybvE/VGRYt9y526k=;
        b=IHpJY8wgVckqJ4cUKmh8ZOTyJLmM3Z5LIdPw26iR1k2crU+zolT0OG9RDNvtJg0Whx
         yNNDnYqz2kD0ynue9jZ+ok6dq+JLTIfNGHoTb+o1l7LeVU99J3p6dnvmOPR54CNGobi4
         ohAQlUNMpC22KBEWG2KaP/mWJP/skXlPBc8/12b+glxaSMr2lxLDNCQThUpIcbh7b+E8
         CDGbKdzzYwG1MqH3zmhtjlRGalkmmBHDotZMYMtda2zkPSfxMaBN1m0r2pztAwVvdfC+
         rkNpmWi++scMgcuxskwLn1YAywu1GMxFy0gYnLWT8vHnmdoxpT/Cb+jZs6SP319abZMw
         NRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6xOa8cwmzfCgPrpcg4Fp0Yqbe8ybvE/VGRYt9y526k=;
        b=BZxV72Zm/QyNWVZ1TQKJK3kGDh18yC1VWvkHC2HHgzvE7EKj1us77ephmbT5+tKyVm
         JOaW9hB0bMOWGx0zN+mfPNwWW4tHr7EhDn153EAyOu/ZU9FgmeEeMTgGM1va+baEDiLs
         KwCbc5TnE6fkEoWGchN8mqzVi2TOO9+PRk9Y5+5xzzrJ6GNcMKzMmL6fAq+988KrWAMq
         gmuzXE+watUsjA8xuIJgLYpK/A+t1hGCezTi2ICy8aKuK94Ls52/0xqqsvVIeQJg5tDt
         emLyYZVfiFU5aiH5lLZZW7lLwb9uM5XzfAoR7sSqpyviqUq48YpJs+jSR0NSQoXgBzaT
         GdEg==
X-Gm-Message-State: AOAM532i3ACmYdiKeFzfq8lzh6caONfGlwtoL+k05oJhjlQNY6fXmUsA
        w/WSYpwOZRmMQ6zNlJClVLU=
X-Google-Smtp-Source: ABdhPJw3KdYRq7SnzH6PFsavG5sKD6QidXTrytBH6DHpmH+6qejfqH//il9p/2haWtkwH7QmcofWlg==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr17506221wrn.88.1612177031338;
        Mon, 01 Feb 2021 02:57:11 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id b7sm29626617wrs.50.2021.02.01.02.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 02:57:10 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v5 2/4] ARM: dts: qcom: msm8974-klte: add support for GPU
Date:   Mon,  1 Feb 2021 12:56:55 +0200
Message-Id: <20210201105657.1642825-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201105657.1642825-1-iskren.chernev@gmail.com>
References: <20210201105657.1642825-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Samuel Pascua <pascua.samuel.14@gmail.com>

Enable adreno dt node.

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
[iskren.chernev@gmail.com: changes after v1]
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 3929c9435e29..86be4ae743f4 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -697,6 +697,10 @@ fuelgauge@36 {
 			pinctrl-0 = <&fuelgauge_pin>;
 		};
 	};
+
+	adreno@fdb00000 {
+		status = "ok";
+	};
 };

 &spmi_bus {
--
2.30.0

