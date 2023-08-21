Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFD4782492
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 09:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbjHUHjY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 03:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbjHUHjY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 03:39:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9109CBB
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 00:39:21 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fee06efd6bso10008795e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 00:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692603560; x=1693208360;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYI5F4k65aV6DaJmJIcIFEwbb+YEGsytJ+c7vZfxPyw=;
        b=iji+lIn08rigaL1Do8LEpwtuwDkyg9bZoQgi7gg/HbtSNlJqGIaUE9igmF3bwHbmUT
         mEiM89/nFpD6lOC6l0wVbBGnG8CSolGsLXNR1XERoGO4wMtBGUMW3u57n48qXkRoj9sA
         LqjqkbjQ925GPCPri+vDyi75UEbga4mqSvs9KM04s8+iE3Mit2jCiD6dxvA52YG1afRf
         iFer5Fz9CcAJQEfKVCUpOJUwGX0IKEKni+lom/Gp8bOsnvdXy/MeA0IQnhPM03CXT9Rn
         /k8WLShRkXx0trOmO9e43jJa66zELyx16C9kn6/v1z8uiMo7hlYu7hG6kdJWazMSkn+A
         wlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692603560; x=1693208360;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYI5F4k65aV6DaJmJIcIFEwbb+YEGsytJ+c7vZfxPyw=;
        b=dHj6HXQyOVHeYhpmZQT3Q9ZIR05ZLSsfT1i8gVS+Scd3aweIlb9mpufNcGigRfFinw
         LAES41PKJGE2h4rbc9DMw0ij2tIrWxhwzPtYnjsL3UAedRDezmyAaSL0VolEvlPXZ3og
         ExUUlbMF1quEsl8yQDyBSFtutfo9QO3jFyxlkPHShzpJcGqpqJcYDOu5ZG2q43Tk3AC5
         kT/3VI9m+NMud/NZ9RyT7XhmXZ3qSyoCu7hMgBIQHnY1MJ4Aa6JrgcTPkvfJKT7+N6Ou
         dGEK6LrRqh29TEvCBm7FWmMOtzrXyo/1z0aRvh7xypUfkebOrNnvDxG2RF63NjJNm9rF
         2woA==
X-Gm-Message-State: AOJu0YybiM0AFAfuR9snnm/5P7FpcY9CSOk2rIHBuYvpWjfOy6rVa0GN
        UAULqklIBJMA7SqyBlU9ZogSKA==
X-Google-Smtp-Source: AGHT+IGOED195d5XtvGp3F5PT5OMUVHUY18z491sFdx4K9inTypsWv89Ecn9DbU8A/acatAAkHd/Cw==
X-Received: by 2002:adf:dcc1:0:b0:314:1096:6437 with SMTP id x1-20020adfdcc1000000b0031410966437mr6460769wrm.19.1692603560077;
        Mon, 21 Aug 2023 00:39:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d674f000000b00317909f9985sm11389092wrw.113.2023.08.21.00.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 00:39:19 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] qcom-cpufreq-hw: add support for 4 freq domains
Date:   Mon, 21 Aug 2023 09:39:12 +0200
Message-Id: <20230821-topic-sm8x50-upstream-cpufreq-4-domains-v1-0-2d4d9fc828d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAU42QC/x3NTQrCQAxA4auUrA1Mo4XiVcTFkGY0i/kxaaVQe
 ncHl9/mvQNcTMXhPhxg8lXXWjrGywD8juUlqEs3UKBrmGnEtTZl9DzvU8Ct+WoSM3LbkskHb7j
 UHLU4EscppETMQtBrzSTp/j89nuf5A9f1eCh5AAAA
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=706;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RPos/wtr13b6odUusa+oeGA1/UBrYUTK1zqQK5mMJfI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk4xSlAjF9yJ2j3lm6F1hI2LZaLFxOk5iiOJrKvW8a
 q48BwceJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZOMUpQAKCRB33NvayMhJ0ftpD/
 9lWlWh4G2ckqU0NPGJpDJLJX+k18tZyn/WmajLSZEI8TstXEi1AyYUuvreGn5CMx7hVdwezBy3rDop
 Il9wkm2tcpwhWJeG07XKxkTbhTmh940A17JUOOmmeWlV6wZL+yx/ckb8SyLjiHz1WPkInY0sPui3Zh
 xGi8cxLBJZvX1m39lnpMiKaQGdYzR2Ak/dZnEUbseoKM4SJ5a5Npt1rlPfMv0qU5fI3PlqdP0EofBI
 B2WSNB6uEtTKYnxbOmiVK4L3SkR62WV1qunBsZeuVdD9118ODOFXEFBwwig8uO3KjR7fB2WvqMPioL
 xdCtrolLBLy6AWb0TfgfBL4cht1F1pcMbGZbJ7lS+gubVmNDaJgRLi7Uc/zYuEU5eajftcRiSCwcMz
 AZGw6wwemlicwJPfEITRRY1OTB+F+s+KVAzvudKXDJGDtkXgM6uav5RP+1gzlfa6ShNZuhBdOXvuhj
 xLxjbdhTIvxLKJmiLOZEM7AMQCWr6F4N0aipBhepmXXGeSPlKJe0Ch72d2azALDW4YXdtgivoKca0k
 maFc3O+2GB2C0sZeoT3DnZMSSW+njgbCMFTGXibhCXOcIkQUISkYlleqA6OdqqbdOip0H8GYP/Gc9c
 zZz5DhljopTJ2EOXTUlBThz2YNT2qWNMv2tOhTVYzyoDknUpTtOo/C3/MhtA==
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

New platforms can have up to to 4 frequency domains,
Document and add support for this.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: cpufreq: qcom-hw: add a 4th frequency domain
      cpufreq: qcom-cpufreq-hw: add support for 4 freq domains

 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 5 ++++-
 drivers/cpufreq/qcom-cpufreq-hw.c                              | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 47d9bb711707d15b19fad18c8e2b4b027a264a3a
change-id: 20230821-topic-sm8x50-upstream-cpufreq-4-domains-2ca50ff2cce2

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

