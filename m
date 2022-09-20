Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4A55BDA0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiITCW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiITCW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:22:57 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A5252E6A;
        Mon, 19 Sep 2022 19:22:56 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id x2so660289ill.10;
        Mon, 19 Sep 2022 19:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=deQj2Q4OQPaLFm/XC3lRtud6Gtxu9c0UMRnIAz4dhsw=;
        b=hkWBLV+uhka9QL/qyBnHZWY+xIuFTh6c0bTCE5cwKQ3fNul2Ps7pDiERUGMHhuS1E5
         Edm7Ie1E692qaw2sVpE1qMvcMmvsB8TeBhcWE6KVdD9TFa/X5lH7dUm3HhLxBLIdiMZx
         jIyJUhoXjIYuNGUraixWwvhJEiXbRqrUOTcM96r/ChIGkzPs0Ndpk0jlklDd1cQP68jC
         vHhyD/rvhrI9o4Ht8ZadYa2QppJ0/wA2ub2XHlbQJi3RSrawKkV/QoMeDfKGWlvYQptf
         3EluWvXrcW/Ok3Cu/IjSwl0ua/VMTFMp7R1FswyWPCKbviupQLPGWfNL3Ld92bXhrSdq
         A/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=deQj2Q4OQPaLFm/XC3lRtud6Gtxu9c0UMRnIAz4dhsw=;
        b=V2V4q6daOXpYjWQu2LRKc4zyG92iKcdJ3HPi0XrFKQZGh/kw9SfB12svAwJpuQrwiY
         tRl6BdSLEOvwdBJglulVhF9MBYDx8MSOhBuFaGdGMrnKg4j0seZtVC5qtLEiDs8/aUtQ
         DT2NiOmE3M36iVE7SE9dJ32Nd3O5qncmH5688H3Kcur5X8omotclr21jthD+/FLiBoTL
         V6TXq3gKrKw3p6wUINyvFKppdCtqjgzz19SedulsLuaujmchTe59imlBFn3Ncm9Gm7Y1
         iwQHw4cnciuT+a6lI0DRo1wusZFCT4Y0vxm0VrNSw6slqpaU8KNPBeZbNohMX5Ju001G
         DZ1w==
X-Gm-Message-State: ACrzQf3Fxr/bZ++c1z+Xsd0zHLDhThh6XnE5M+p07l5W7zvV9RhvV6r/
        HRv4pb5+MDlkYzhBgC37X8CJeNMLdUY=
X-Google-Smtp-Source: AMsMyM77JdunwJJYUQL3N2SM5p8oex3ViLE3z/ffwPo8Is/sZWKkADWA/AS718iOQ2cR8228CytYWw==
X-Received: by 2002:a05:6e02:1524:b0:2ec:71c6:7b85 with SMTP id i4-20020a056e02152400b002ec71c67b85mr8940169ilu.237.1663640574919;
        Mon, 19 Sep 2022 19:22:54 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id d5-20020a92ddc5000000b002eb75fb01dbsm187783ilr.28.2022.09.19.19.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:22:54 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] SDM670 RPMh Clocks
Date:   Mon, 19 Sep 2022 22:22:49 -0400
Message-Id: <20220920022251.3073-1-mailingradian@gmail.com>
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

This patch series adds clocks controlled by RPMh for Snapdragon 670.

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 36 +++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 54 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)


