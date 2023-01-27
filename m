Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4790767EB01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 17:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbjA0Qej (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 11:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbjA0Qei (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 11:34:38 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8310E40E1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 08:34:37 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so3904011wms.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 08:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw5+F/xSVETSqRzgsv0Z/URumoCkyIHknF5PwI0KMsg=;
        b=uDEiTsmBKTPJCXQJzts8sLESHG5xpVmbY6slNl/7pqc17MYhHuspFDQqErEHYB8lUN
         z6WQGILZaKgaqTWSxoE7msldFOnitovmJeRQqmHHsx7SXCSJfAKzKFbWHnPhP4KpgZVl
         oABgsvZUMjmXpK+GyImQ6ObTXYX2wtu5kEHc5UiU1xNShl3JlMB3wzD/kuY93yXt97WU
         9k273TuDDnT4mDzQ5cHEQzy5F3U95J/VzMtq8UUhNrUlS32fp3Qn48HPQUZcIrSTFNWh
         8s8sGXs5Kgu3SLQBbqNdfot8s8XpKA8qh/ZLVPB8RO015pLF7OoKjGjvBobj0fg/IGFH
         ihXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bw5+F/xSVETSqRzgsv0Z/URumoCkyIHknF5PwI0KMsg=;
        b=sXr1HXJcJ7Min2RrChoG1/o7j6RLZm6L25NN19iFn20GK2e3YVzd9X+GbBRPXFq6Iy
         8271V6h0qcMxGurrAi/bmQrHcCA3dgY5hXu4jfvm5unlraEFsBBQq9IVH2R/o8/3v0+/
         HEVDwgAiJgkdpgdkLTL+rbOG+1TF+KOj5xp9/bk72aXTtWWcSRqSBXSbueh87VvXb3Z2
         5tHmujvV9R7vYGPzjivAKhNgNOWIb6gEPsfF4kyS6ZZPmlI+KOpKZF0B9GwQH8q32ws1
         +xk+xKOGopNvIaSPdL4qUEXT9bgJvvYnTFQ+eukJP8PBq8uQZ2t3WpkfjTNzT6oUw4iM
         0lag==
X-Gm-Message-State: AFqh2kr9XVOlDDvUrCG8y1sC6eeqglTq70Xw4HRRIxYpoftr7pqpYRxS
        CcEOE9XFJGX5OZch8xToooINlw==
X-Google-Smtp-Source: AMrXdXtZTNEDnEKFRAv6cghXdC0siVZQtyG6oduDQyKkbhQuD165+THCzLaDxP8zcmvlZp+4rY156A==
X-Received: by 2002:a05:600c:16c9:b0:3db:222:3e0c with SMTP id l9-20020a05600c16c900b003db02223e0cmr40055561wmn.33.1674837276107;
        Fri, 27 Jan 2023 08:34:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v23-20020a05600c4d9700b003cfa81e2eb4sm4797028wmp.38.2023.01.27.08.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:34:35 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 27 Jan 2023 17:34:33 +0100
Subject: [PATCH] arm64: defconfig: enable SM8450 DISPCC clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230127-topic-sm8450-upstream-defconfig-v1-1-93cf603db08b@linaro.org>
X-B4-Tracking: v=1; b=H4sIABj902MC/x2NywqDMBAAf0X23IU8KpH+Sukhxo0uaBKyKgXx3
 xt6nDnMXCBUmQRe3QWVThbOqYF+dBAWn2ZCnhqDUcYqbRzuuXBA2YZnr/AoslfyG04UQ06RZ+y
 10zaSsi4M0CqjF8Kx+hSW1knHujZZKkX+/rfvz33/AC1Tlu+GAAAA
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build the Qualcomm SM8450 Display Clock Controller driver as a module

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 984553d55e17..58b7f8454dcb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1125,6 +1125,7 @@ CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SM_CAMCC_8250=m
 CONFIG_SM_DISPCC_8250=y
+CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y

---
base-commit: e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
change-id: 20230127-topic-sm8450-upstream-defconfig-51713fe037c8

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

