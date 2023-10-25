Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D7E7D62D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 09:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbjJYHcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 03:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbjJYHbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 03:31:47 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3EA171B
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:31:41 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32db8924201so3519320f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698219100; x=1698823900; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgxH7EzT6kf6PVK2pOvs2BDr7TubSKxjchz4brt+Fdg=;
        b=hxM/tdZlOMuCSJkLOqLtpGPj9oN93sf+Z7ihim6Hnnp8ltyN3GhKUnEoor2xVF4His
         AI+XEn4xwyUn80JqQDz3Z/q7pRweL0GNLvNbzXQrtUofXed5JismDihjt8Oonn3V5/yy
         OMHldxDpxGoId0grT0QJdGdSQpXT02uCHGctlxqG+PbpbSXBJX2OZipGTayZwyAmaVis
         kwGzCdH1DgOI2RKzhr2GxxZs/mcCHmxVQXqqyZbxa8FqoZQXGVB3tvA9klyxFgxYvzOI
         efgxS+b3wex74q6qOnA5LPcCI2RUf3svp6hPOowUNDm2UT7FoSuAsxKk353eUI7w/lPb
         w5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698219100; x=1698823900;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgxH7EzT6kf6PVK2pOvs2BDr7TubSKxjchz4brt+Fdg=;
        b=QUl/DGR8GBEEFgVbpsHQT2Y9uK625Yow3Mm9pOYb9DQdrzTsalO0H6wK23fZzQEHbw
         5mBn9XLgtukPWjWpWXWCwJzhfHRZKbv8us+Wn5xLZ64cOjbjT/0wt9cV+hzKKQkzLZo2
         hAeTE7QLjrWOqKEMf+/gpBxI2QoLOSHmV4+BCclsaKc9hMMHI92wi07lCGWheHZ/4uNe
         xWmmeKboFflHkqRnctzHgii+iaZ8tmtIc3yYiJITcMBV4qdKUITFfpktXSf6yUMkL3lr
         nLJnY8EPzXscOtMesjzY+OstE3H6xinHQQ2Kuc5+KuFb+mn54Xl4wr6v54SqvvgEs/OQ
         EVRQ==
X-Gm-Message-State: AOJu0YyLSUSVa7EeN/p8zNNnKYKqufEok3NVpfZkTAh/E0dUc+jViAmt
        qp/V8grkJ9DCmoVKrekOEeco/g==
X-Google-Smtp-Source: AGHT+IEdncMXeho29/ICPmJF5kWqlk8270tfKPl5RISjmMrfJO1iE5D3hBrJ1iFFEpX3luc92mnosQ==
X-Received: by 2002:a05:6000:1f91:b0:32d:88f6:ec2f with SMTP id bw17-20020a0560001f9100b0032d88f6ec2fmr14193953wrb.60.1698219100201;
        Wed, 25 Oct 2023 00:31:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6451000000b0032da022855fsm11412184wrw.111.2023.10.25.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:31:39 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] soc: qcom: llcc: Introduce support for SM8650
Date:   Wed, 25 Oct 2023 09:31:35 +0200
Message-Id: <20231025-topic-sm8650-upstream-llcc-v1-0-ba4566225424@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfEOGUC/x3MSwqEMAwA0KtI1hNoK62fqwwuJEYN+CmNiiDef
 cos3+Y9oJyEFdrigcSXqOxbhv0UQHO/TYwyZIMzrrTGBjz2KIS61sEbPKMeifsVl4UIm8HVgSr
 vg/WQg5h4lPuff7v3/QEw0QegbAAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=g0gBI6C4RuzFGVsKGSYa06MulJtrehe6pfKOHXmOi2c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMRZExJbmIPQmEpQZ3IcmGw5lJcOLQJe/BQr0t1r
 6BI1R52JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjEWQAKCRB33NvayMhJ0ez8EA
 CW4EGZHVc2dhJrKgrq+pn95Lx3m1uwbsjiZWEh4p6ECtQcDH3PM4L8bqzNiMBNTVI2+7qOa/3eDkmD
 zTTyBUFb8IVTvpwjdQfJCKACLn++s61HGPaPTPwBqJ5MvZ9nC3NcOG0Khg+GlwbkalYN8xeboJVI98
 AH36xasiUhHcmONlN0Pty8Fxez/mFGLQCX3VXv5WNghmmTTtI4YCzbPyLxTA7DrO6fkIwle+5Bi5fZ
 gFKerUwSdgLdUq0daePwc/YDCAsZPnS5Uvr4Ni0f7WONEdidKXLqknap5/Gv5jOBKtOUNv70L1lZ66
 xZYods2DeVj+UsSli03sTXv4vbE4Y8um2aDeqPACjDQVcSPiwJUemi8djB+tDoqEpUbIP86jgcKzI9
 isHje4Ym8jcZzumnkn3fWxVDy8X9Qyf3WrIj+K6Ov8zVPuE6XN12BLlE1FrL6QxtKMuCz1ZHr4pzOT
 5zGxgu8zkFRgBlEKUW1h5J/aEgGTIDz8ylOyhfp8aG6n5o0Iy32YaL+aVw7PV8c7wZ/jXSLJCzq1R9
 7Fztdk3c5ds7Vcz9wsFTYRAqtFH900vWErGGlVV4O/JXG3QIGE9vde6QB8JDIY1jgLrOF3ll+ZSLpa
 OkPAC23DPvAxXMBPP/v7AWmOpp1TiWIyfg/MfsKM1xhWwZ9uyQ7cLhEY/uzw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC tables and Bindings for SM8650 platform.

Dependencies: None

For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: cache: qcom,llcc: Document the SM8650 Last Level Cache Controller
      soc: qcom: llcc: Add configuration data for SM8650

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  1 +
 drivers/soc/qcom/llcc-qcom.c                       | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-llcc-9d286c755615

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

