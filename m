Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2432E7ABD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 16:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgL3PwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 10:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgL3PwZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 10:52:25 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AC6C06179C;
        Wed, 30 Dec 2020 07:51:44 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id cw27so15800503edb.5;
        Wed, 30 Dec 2020 07:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ol1q4dlbvhx/wO6o6Grs7pMEajs78gHmFv1Ju892Cas=;
        b=Vx9Vhq1ioRdYuzYn1zkjvACKYd7ECwr7xmKNrK7xG4DT65lYJrr3YfHJCmCWFkUYys
         9KBMeRCbEfeBHuIdiFjCaUDMeLMOkH9qmlnwf9sEEkSFOD84fDni5YlrpKFY6Rk/Gd3C
         arQkpteKiZj4kuD0SboPcRDm4pBiEQajYW1sVJOX2gCyWNYNtWaYZUq6Day1tD2pbZow
         nf6vur9jAyUoPHeXHhV6pgsJE2RULDSDrJkA1jMw+aECw8IeZokPXd4lLEgULtQvUStX
         W81eHOARzy6yTuIxD5cUcLLlCDDDMy3sk1AXap4epa3hRcrPynrayzWpywiAwlLvfBlF
         eDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ol1q4dlbvhx/wO6o6Grs7pMEajs78gHmFv1Ju892Cas=;
        b=Rrq72tZbLtzczbBlLq9F0Q8U+TatCFpkyiCSEGHsC3e7LYeoLS0LTfldX/kEFZU6Ll
         7Qq3MPP8npdwfeh8K9R6CaSYUOrmCiCzlbIG6gGT3MUDmBE8aR1IePch2D65IRc2teac
         JPr6BZKhFNw3hPHlilgKU+wUUSpJVIt0lfLsQEQ+6yhYyVMRvGYPAEGgzxwzMd9Ed46p
         Y1rooA7KyaxHMf1cWFOwMsRZ3waBWujmZuKl531BuSqvEAcIKVDXMmgIyumEJeEb5RTa
         ZHO2VaATmxj3mpF43xMU12dRt4TyYv3n52w+U07lFn4h+LOdMzyYeX6ymj7MLg+agUJf
         gEVg==
X-Gm-Message-State: AOAM531As8xg24vn9fHGSc0Yut4r8HBfdV6TTsKsxpmfBEZ13oNDPjgf
        sQkpABTy2mLlGeMtKG7E1bw=
X-Google-Smtp-Source: ABdhPJxsXDQElM5jtxsixe7oB9UJIlUl4wxTMdZ1MiexrFX1PjfZ+qU34iTCaFYyvlR6fqtFZlhIRg==
X-Received: by 2002:a50:cd8c:: with SMTP id p12mr50360798edi.380.1609343503761;
        Wed, 30 Dec 2020 07:51:43 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id mb22sm19201510ejb.35.2020.12.30.07.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 07:51:43 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>
Subject: [PATCH 2/4] ARM: dts: qcom: msm8974-klte: add support for GPU
Date:   Wed, 30 Dec 2020 17:51:30 +0200
Message-Id: <20201230155132.3661292-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230155132.3661292-1-iskren.chernev@gmail.com>
References: <20201230155132.3661292-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Samuel Pascua <pascua.samuel.14@gmail.com>

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 97352de913142..1d5e8abdbda79 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -697,6 +697,14 @@ fuelgauge@36 {
 			pinctrl-0 = <&fuelgauge_pin>;
 		};
 	};
+
+	opp_table {
+		status = "ok";
+	};
+
+	adreno@fdb00000 {
+		status = "ok";
+	};
 };
 
 &spmi_bus {
-- 
2.29.2

