Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFCF3A050D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 22:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234490AbhFHUT3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 16:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235077AbhFHUTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 16:19:23 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D32C061789
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 13:17:29 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so21587125otp.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 13:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=So38bth6mBWT6iiBoQOuRXazg1ugN3YaIyiAe68Qh/M=;
        b=VuAfbKtmWgPabI31uDdBl82sfzFiBGAm7/ciGwvTc403GGwWNAu7XSAEQE7qzl7LqM
         N03Wuy8VsfReMphaXsGXviECqa8CAs97t5wmQceiymT64kFWwbQktu76g1uXD+cNNe48
         4y7dFklcmE96wx+sROdmiU22Ci8e42dUFLbe1ab5kX/+4q2S96thIisu6o3o+sHSYnTW
         TWJdpK9zvoQfjsgmkM81C1LeYKJY5Nu4lxQIX6roMvh27WhmoLQQ2NQPgbtiCnw0qIfS
         15IdAj+kGvDGFl8eUJoTeM6BaorRfm4rU832X9gPZCQPQzk61LjM5lWD0r3uJ+4b7us0
         6hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=So38bth6mBWT6iiBoQOuRXazg1ugN3YaIyiAe68Qh/M=;
        b=coyUxAxdH13pvDDfJvV28A+Q1umlPGqygYKFlYEmzX+CJzj7PtSgR4v0Ktg/684Sqx
         9oXA1+6EnJXBmq4IKhOp/R1XiAXZhZlWdGmnNSlB7xDcKk//8M0dBnz7SyrYI/c2bwnv
         BA+xKZofnd2IYGoEeFAyDAfCN+CXUMOoGQyy9ryHC0+zLyGw+9+M59ekPJEniHTYfech
         Dosvx1Ju5iKjU8//ud1spq8uA0F/Jaop4K6D9ndMzBqjMlQxE6lXUt3sC1XEyHiuT/BW
         uPWhakdTnKVb0sQnXkwSG/6yf1YWwzsrAe1+1giK76nigxYyubHmUFU1ddKL7WPi8oFZ
         winQ==
X-Gm-Message-State: AOAM532/A81WiTvvEX7O2+KHBV809WsvaUgtunFwh95KPrY6bdHGBNE0
        hMmPcDv7xxYBzsb5NTvRTXT0Eg==
X-Google-Smtp-Source: ABdhPJyZKF1RWsMB7ZjmDMdJI+FRLFEI6UQz8/ft8bojNZcuIrpkXRyQZtuoeYQ4ehCHpYpQBAK+fw==
X-Received: by 2002:a05:6830:161a:: with SMTP id g26mr12529361otr.62.1623183446592;
        Tue, 08 Jun 2021 13:17:26 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i4sm3263231oth.38.2021.06.08.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 13:17:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: thermal: tsens: Add sc8180x compatible
Date:   Tue,  8 Jun 2021 13:16:38 -0700
Message-Id: <20210608201638.2136344-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm sc8180x platform has the usual tsens blocks, add compatible
for this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 0242fd91b622..fdd7c361104f 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -46,6 +46,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,sc7180-tsens
+              - qcom,sc8180x-tsens
               - qcom,sdm845-tsens
               - qcom,sm8150-tsens
               - qcom,sm8250-tsens
-- 
2.29.2

