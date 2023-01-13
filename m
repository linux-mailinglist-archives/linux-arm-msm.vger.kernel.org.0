Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E482766942B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 11:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240793AbjAMKdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 05:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240593AbjAMKdx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 05:33:53 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D1B17423
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:33:51 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id cf18so44926518ejb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Js8KsQH+h+iAVSbQ9296MVF2mSa5dc6jfF761QN1e94=;
        b=iGIQxycAbahKKYvBZz3ihB35ujtQA02ND6oy6tq78LrCrpr0iX8dSkhwmdHimJsKFE
         /OFrFnNXHlk+mPnojvtBg2bwgAtbv1x/GWDVct8+7My/l2JEN1blSQCOFk4tRMS9V9D6
         iAL1K8xo13Eh3UW/XjbCZ0UNo5XpNP3ZggeOfv0r/PGkq8VyydjuKXoc7UZzPZI0utfx
         5pa25XWT02NAS/JaovOXKE6WsBpYsodRyAxmUWkX9DAdObyYBMz5rB3erdpdMEXe/cXw
         5VfZq+nQHs4UCCgoYI7daUq23qXEWviPUnY+dQLSslq0IhN57lWAsLGRh382VetbxylS
         hvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js8KsQH+h+iAVSbQ9296MVF2mSa5dc6jfF761QN1e94=;
        b=bG9FdyPiC+g6NielNTQLBRUZUaBRRAgK/pLrP0A+9NDJRvahpUgreeMgjQG/XkKqq3
         xLIM9LbZ1h3JNFGwjbxxgTBWuI41Ip8iXeBPpKMn3JljAIDPL+Zia3eR5LGTgQXQp87G
         cF/dk+5/kzZcTcLemfjBW9WeOb1EVo9XHtsl5qOwn3fwRVVHe4uJgrr5749lVA6PIBnN
         KI0kd8k6IOaZ9ypxQcNq3WIyNb/uYkXuvqYWla16cRMwp+QgPQPZXkq/PLVrvuYTFyEN
         7gq3BkeRP07+QBE05rr7hU7P5Y2SaTQnF8Occvn/f3w8QykX7R2Bpl7iqXZ9SY6q1r1h
         vcWQ==
X-Gm-Message-State: AFqh2krFGtHmKASiZo/hy8xluVDOXE4/CTF/NqDkyx85Rgy/8imsxMtf
        cZ9lHlXEECwrWTARYeurO4kjkA==
X-Google-Smtp-Source: AMrXdXvuBmodCCTsW8TeTuVTR5uFBVcpwZp3PyGF7Cp6QJa6E1CKqDCf5h0dsBJu9V/gKQwa4dYFzg==
X-Received: by 2002:a17:906:d047:b0:7b9:62ab:dc3f with SMTP id bo7-20020a170906d04700b007b962abdc3fmr81117949ejb.1.1673606029704;
        Fri, 13 Jan 2023 02:33:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id qw25-20020a1709066a1900b007ae1e528390sm8296926ejc.163.2023.01.13.02.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:33:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/7] watchdog: dt-bindings: rework/fix qcom-wdt
Date:   Fri, 13 Jan 2023 11:33:39 +0100
Message-Id: <20230113103346.29381-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Dependency:
1. DT bindings are rebased on top of: https://lore.kernel.org/r/20221117105845.13644-2-konrad.dybcio@linaro.org

Chanegs since v1:
1. Add tags
2. Correct clock-frequency description

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  dt-bindings: watchdog: qcom-wdt: require fallback for IPQ4019
  dt-bindings: watchdog: qcom-wdt: do not allow fallback alone
  dt-bindings: watchdog: qcom-wdt: fix list of MSM timer compatibles
  dt-bindings: watchdog: qcom-wdt: add qcom,kpss-wdt-mdm9615
  dt-bindings: watchdog: qcom-wdt: allow interrupts
  dt-bindings: watchdog: qcom-wdt: merge MSM timer
  dt-bindings: watchdog: allow "timer" as node name

 .../bindings/timer/qcom,msm-timer.txt         | 47 ----------
 .../bindings/watchdog/qcom-wdt.yaml           | 94 +++++++++++++++++--
 .../bindings/watchdog/watchdog.yaml           |  7 +-
 3 files changed, 90 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/qcom,msm-timer.txt

-- 
2.34.1

