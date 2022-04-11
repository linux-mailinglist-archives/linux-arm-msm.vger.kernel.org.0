Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8324FBA78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 13:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345099AbiDKLGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 07:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345861AbiDKLGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 07:06:07 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C907544A26
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:03:52 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id k23so30050066ejd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=imus7EzT9HGnez1gAdtPtsmomcq86LoFHSJJI+tG7Mk=;
        b=QaCJS/Z+EMVo1NmDsVDWdCM9aawilr7BqjiFFApSOdjMKEfAbII2GdTMLz6rKfJjmH
         n6DwYwftr6FkV6fTBpHohU0DODVKMyGhJe5xnXP+BKX8CaXQb9055+VmldOhGrP5gzQU
         Q7FJucFp4LJTHWVVa4dXJgPy5Dst66sKH6sWSKJHJZk8au2spXOo30Fcet49KpL8pLeY
         yqqHroPRNIELYJcxBul6KVFRvKOeTkkesY5QixKRrNqdninh6DfJzmPOF6V/4LyCaVr6
         U1rfMIm8Eq4SzpIveAjMLYxfVCyh/WzG56e1FBxNecrkOrrasbBTDaibKWwK7vTaBgrn
         T2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=imus7EzT9HGnez1gAdtPtsmomcq86LoFHSJJI+tG7Mk=;
        b=Ynr8u9otiIrRFIpdJHtczv9yxe8AraatBHlBhaZYqg8n/X1CFac6evztqr1V3pwQGy
         oDHXTsiMutWaLjXJdCH5pv63Mjbe9G+SzvLWy8ZnaXncl96smVT1AvH3GAlriJe38cNt
         km2S4CsOdl2OS6ywv6RwYXkXTUcAJv5/mkrFUe87MDkjEwu5/eysWCPQ9LdoL5gX89Hx
         FxlJR2207TuwHZ/V08iapx6wkPTkkQsDsiDlMadbMznTrVKv/ZpVtFNb4an/pyt6BykC
         xpw00Ro7otHT8K3ms8volq5RXa2RDBhow36X3ctwlyZrEL9suZQaioyM9WvY67j7/hXk
         59Tw==
X-Gm-Message-State: AOAM531qf3nArPH1pLTIu9cwmZbYujMdMZshDJjHiUF0mSY35FdG6yYx
        TOYbpqmXNqEYhtw0oZhSHd99fg==
X-Google-Smtp-Source: ABdhPJyg1vExJqwz1s5jjjQQ4vRNJlEuplRSomxUrnaA33LcKhQ5AwbmBjRVRX8DW6+wQVxR1BbsbQ==
X-Received: by 2002:a17:907:1b1f:b0:6e4:b202:db68 with SMTP id mp31-20020a1709071b1f00b006e4b202db68mr30196747ejc.294.1649675031268;
        Mon, 11 Apr 2022 04:03:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j12-20020a50e0cc000000b0041cd813ac01sm11074074edl.28.2022.04.11.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 04:03:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 0/2] regulator: dt-bindings: qcom,rpmh: minor cleanups and extend supplies
Date:   Mon, 11 Apr 2022 13:03:42 +0200
Message-Id: <20220411110344.231903-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Extend the RPMH regulator bindings with minor fixes and adding narrow supply
matching.

The latter actually does not work yet, because dtschema does not like it.  I
need some advise with that.  This is the reason why it's an RFC.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  regulator: dt-bindings: qcom,rpmh: document supplies per variant
  regulator: dt-bindings: qcom,rpmh: document vdd-l7-bob-supply on
    PMR735A

 .../qcom,rpmh-regulator-supplies.yaml         | 262 ++++++++++++++++++
 .../regulator/qcom,rpmh-regulator.yaml        |  19 +-
 2 files changed, 267 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator-supplies.yaml

-- 
2.32.0

