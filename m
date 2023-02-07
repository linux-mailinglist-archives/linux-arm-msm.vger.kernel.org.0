Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C2868DEE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 18:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbjBGR2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 12:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbjBGR2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 12:28:13 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D7B15C97
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 09:28:06 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bk16so14285490wrb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 09:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMmsSNQv5YHhYA3GqdHR4yYlNx9Rwlzp3Q3+/DOy/ww=;
        b=xm+aVAFSLQ1l4rQHL15/0tqkoTPEXRvJAF2b/wYbHzSoFvxeFKufbucIgl51ZOO8K4
         eGdfG2/Z721MCdCgLbxSt+8fpP0Qw0dQFOl3hjhH2R8GqUabh/315EtiQ1/Y4ZVivwWJ
         qj2QMS6GpecJ3yDfs2bT2qhvczwaCroCpiqr5zaUctnZKzW4S8LUoytfaJ4FCCAKINp/
         PHN7hFiDkSWFeIUakYED6gdAX5oGZ71QS2j6qN0BD8AqP/B6lpk8xUUKkUZP9CDhtFhl
         StNS5NbnTJkW+jSYvlIpxqoQpmfHewBtOXRq/eHAC3gEMThCrFHkmAFPyQhyLhQzCNvV
         LMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMmsSNQv5YHhYA3GqdHR4yYlNx9Rwlzp3Q3+/DOy/ww=;
        b=l0aK4gE8D7SQVvbzJFEaEOabnrTsN4Z+o5cith0lbT7xv3yrbXUHVjNNMfgBnA6L0C
         4ZHKYY24tz6QImucv01EjGEjhN6qFcpAFgjvItaBi9GrzM1a49d0XtP7WAuJCm3ZIufl
         R1+3Tow0bbJilXUf1S8LrSWqTNo0Sp9m1lwHtxmQia7FDyw/BqLGYqvugfW9ChwOJzXK
         pN+t9zLyZ2JVl0kLK3CPkE2BtokHdDyV5f/csDpaMuzpXmJ76Ozcebix+o3ACPVYGbT1
         apMEG68A47ou4vMosLStMsJJbICNJM6IQnPSX2ck2e44Xo+VO06HkwJ2KisCne7PHI6Y
         jLzA==
X-Gm-Message-State: AO0yUKWS9BrKalkH4Np3H50tfWuXu+DD5IjlxgYJoLClFlpfMPpy/8Zp
        CWqEY4c8pAtT1ECmxtsmFJuDrw==
X-Google-Smtp-Source: AK7set8YVPR8chqQ2wyDYFo82UJU3O4weU8TFRbWpgjdjSOtOIIe3w7TmgRYMp9zS8K7rA6I5Mzyqg==
X-Received: by 2002:adf:e9d0:0:b0:2c3:ed5b:9ca6 with SMTP id l16-20020adfe9d0000000b002c3ed5b9ca6mr3418988wrn.27.1675790885000;
        Tue, 07 Feb 2023 09:28:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q1-20020a5d61c1000000b002c3f022945fsm3518032wrv.77.2023.02.07.09.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 09:28:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: dt-bindings: qcom: second round for v6.3
Date:   Tue,  7 Feb 2023 18:27:59 +0100
Message-Id: <20230207172759.448798-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On top of previous pull request - second round of DT cleanups.

Best regards,
Krzysztof


The following changes since commit 5b8c304c94d79f44aea8ee273ce70ca380804156:

  dt-bindings: pinctrl: qcom,pmic-mpp: Rename "mpp" child node names to "-pins$" (2023-01-20 18:43:06 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/qcom-pinctrl-6.3-2

for you to fetch changes up to 315dffb843f75cec4458714f4d151d5775e797de:

  dt-bindings: pinctrl: qcom: lpass-lpi: correct GPIO name pattern (2023-02-06 12:17:55 +0100)

----------------------------------------------------------------
Qualcomm pinctrl Devicetree bindings changes for v6.3, part two

Several minor cleanups and fixes on Qualcomm pin controller Devicetree
bindings - add missing input-disable, correct GPIO pin name patterns in
bindings, correct number of GPIOs in gpio-ranges property.

----------------------------------------------------------------
Krzysztof Kozlowski (9):
      dt-bindings: pinctrl: qcom,sm8350: add input-disable
      dt-bindings: pinctrl: qcom,msm8226: correct GPIO name pattern
      dt-bindings: pinctrl: qcom,msm8909: correct GPIO name pattern and example
      dt-bindings: pinctrl: qcom,sm6375: correct GPIO name pattern and example
      dt-bindings: pinctrl: qcom,msm8953: correct GPIO name pattern
      dt-bindings: pinctrl: qcom,sdx55: correct GPIO name pattern
      dt-bindings: pinctrl: qcom,msm8994: correct number of GPIOs
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples
      dt-bindings: pinctrl: qcom: lpass-lpi: correct GPIO name pattern

 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml    | 4 ++--
 Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml | 6 +++---
 .../devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml  | 2 +-
 .../bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml           | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml   | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml     | 4 ++--
 .../devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml     | 3 ++-
 .../devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml  | 2 +-
 12 files changed, 17 insertions(+), 16 deletions(-)
