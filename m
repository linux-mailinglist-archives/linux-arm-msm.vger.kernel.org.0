Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C8F44F0B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 03:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbhKMCFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 21:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbhKMCFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 21:05:39 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED3DC0613F5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 18:02:47 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id e9so21920215ljl.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 18:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2iGO71on63/LBV4+V6rXPmECeBXzrpOVOk0VbOEmQkM=;
        b=Z+XMlXS8tibXv5AQJYE37X01NbN8LVqtLnu8NxqopAXH7wUSGRnHAUjMk/Xl66gLt0
         /4jxMigxQtDyCVEOHH+HqwzaxyapiU+VGgc7NXp4YQmtqaXh00Vyvr8WBPmSoSoS8Xn+
         DDmavL9kUdukD2R7d2MQhi3wTaCU9KSaely3QUIJilekR75TbdC2DjbM8XeF5NAS3GpZ
         rJ1nUW0CWsMX+ht+J3K9KuPqWAzaiqAjSfv+rn1n3uMeDtl4ovCIuSnHQVjNwL1WC6EA
         Hxbu5oPds02nsoq0/gAqZWyUPzzDtcOrbatyHRh48RZ1AbDd9WWpehOip0flDNsLzcoD
         6dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2iGO71on63/LBV4+V6rXPmECeBXzrpOVOk0VbOEmQkM=;
        b=2pvWtWCYgKNzmwKJGfTru6imHv0Yi6IstKkfSchLCum7XOlMjP9QynOocHZnF1QK6P
         eWsfx4ZWDeiEm0RTUaHc1mLVk1bnX5tgimM2bu0y4UNpFIG8eBtsHnpStXh2BsGYv4sS
         4n/NA/D5sUzfXSWxWWK0Z8PvZSe/SvbQ5VPdi+h/jEWMVq6WRQRIcXGYViukmbd8UAYc
         +8JWI/4G+5zo7tVv9p8fvDSyeYR4IHbueJwnmO2lV7dXg1pbU/LGWp7g+xQu/SM0tXLH
         x45uTD7LIhEL3JGYnvxGlwVa+2+mFV9YsWf6sxAa3pdPrcLRQiR2j/wMpNqtlMf35L7h
         y8ZA==
X-Gm-Message-State: AOAM530NpTD/0S3l7JozdbOieyPCyyc5AijpxUsY1mnNH2n1ORxOhErM
        G6ygf8jfS49SHJw+zvws87hKIQ==
X-Google-Smtp-Source: ABdhPJztdtW06NfPhsVRQ0uv0GsFyBFCTeBNWfpaGQudrt/u1Ud/EW1oLbH0ge7kHcdlsOlmMgsiag==
X-Received: by 2002:a05:651c:1543:: with SMTP id y3mr20179876ljp.436.1636768965984;
        Fri, 12 Nov 2021 18:02:45 -0800 (PST)
Received: from PackardBell ([82.160.139.10])
        by smtp.googlemail.com with ESMTPSA id j20sm686185ljg.104.2021.11.12.18.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 18:02:45 -0800 (PST)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 66928ea7;
        Sat, 13 Nov 2021 02:02:43 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 1/2] dt-bindings: clock: Add support for the MSM8226 mmcc
Date:   Sat, 13 Nov 2021 02:58:43 +0100
Message-Id: <20211113015844.92762-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the multimedia clock controller found on MSM8226.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 68fdc3d49..4b79e89fd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,mmcc-apq8064
       - qcom,mmcc-apq8084
+      - qcom,mmcc-msm8226
       - qcom,mmcc-msm8660
       - qcom,mmcc-msm8960
       - qcom,mmcc-msm8974
-- 
2.25.1

