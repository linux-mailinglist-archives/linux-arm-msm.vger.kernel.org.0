Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C12C35BF030
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiITWdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiITWdk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:33:40 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C9740BED;
        Tue, 20 Sep 2022 15:33:39 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id r134so3611344iod.8;
        Tue, 20 Sep 2022 15:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9Nolct0IkO80eaHJXfGaQpj0mzqJ+HHu2wWchDSJNd8=;
        b=Y9TtwQ6OB6ekRSxKIZuVMJDEKynoAXf3XCd8DEMT0HhMVefgq/C38rSSrXJmE+s6tu
         cC31YUoccz7b1JkHO4EbmT7QlBz9Vym2E0Zxu1tPtdcsSTU6x4FYbtpBosaC9+stMoj8
         s2xigACXyJabpkqycWWEK4a0sU/Pbilq5q/w/aLCsSIAts4mKG4wPK+WPVUWZHnz5JiN
         ia+T0PrcLy2xbNZrMCtDXPG3wyYo1KKbmBIZsaYUeq6+ap/ZcwfdS/20aiOlkVrJKF2O
         ZI1PnRJBnijQu/70EEXkxzAPnngQ1QM3EVgtdIdLgI9OaRMwCERBGDtES3/HAKvrSh17
         wj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9Nolct0IkO80eaHJXfGaQpj0mzqJ+HHu2wWchDSJNd8=;
        b=FaKmS0cmQCPaVd9Q8mW/PK3L/b5H6slP4RuOpvuhMLYSmQcJtFPbFuj8LKq0LriSbD
         stYglJmse8uaAbHAuPG80swf9M1o8DShpZElJMtxeYWzIedXbU7tbYZwQid+OeYZYxfG
         p3RgRIeVD0plQG7+uorSxsjNZH51WeekfcPkIXmt6T4AwnP8qj00Gn/oYPXtdikif30R
         R+zq72ESn/8F5UmeuNgeK9ExXw75y/kV1fnJBYGapq6VVqsSDt1DZ9PUHgXDjlxtmQsx
         uT9KYrmnx+P5TZe3NdxZ+oH2vPOD9JlCHRb3npBgE1RaeR7ihnCM6kWq1YdyRJEWbzsI
         OxIw==
X-Gm-Message-State: ACrzQf3aYatsd/kgkU8EwrjIXT+kLBWW4DnwMIQ/dE9Yaf8idHh8BqQC
        n7Fxpq6hEG0VeXjDhghrr7xWT0Fbvj0=
X-Google-Smtp-Source: AA6agR7ngMncvEI0FQ5sTNP/rYHgAq/e5bhXtLP1UL3ir2fp/kSU0X0FffGGEoQh/q9+eQjJFgZpFA==
X-Received: by 2002:a02:7a4a:0:b0:35a:338e:e9ef with SMTP id z10-20020a027a4a000000b0035a338ee9efmr12356983jad.34.1663713218316;
        Tue, 20 Sep 2022 15:33:38 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id a22-20020a056638005600b0035670a71fcbsm390818jap.64.2022.09.20.15.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:33:37 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/2] RPMh Support for PM660 and PM660L
Date:   Tue, 20 Sep 2022 18:33:29 -0400
Message-Id: <20220920223331.150635-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
 - properly label

This patch series introduces support for the PM660 and PM660L on the RPMh
mailbox. My initial Pixel 3a dts is not very minimal but I think that this
series is trivial enough that it can be activated in a single commit.

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 36 +++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 54 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)


