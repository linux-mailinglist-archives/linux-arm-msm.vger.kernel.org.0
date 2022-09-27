Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFE65ED149
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 01:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbiI0Xw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 19:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbiI0Xwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 19:52:34 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FB5E11BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 16:51:12 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r7so17297177wrm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 16:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ls+mZbmrHtHhR8Dl03bxVu8VpPS/hfKJ8z7hmScVfs8=;
        b=fg5QMiBkJy5Bp/NezkGmjVL5iCvBilzu/K2yAejOoyWLblu6Rv/iuHnIcgjNvYnLEc
         itqUABxA/3wczqT6u09xZBWfMd5m9ca2k0pZ9+6fnzqNHPlmwIq7nlrs8xamGKwLRw3A
         zaeqp9R6mSvkfL2zgFH6lao4Vl4xUenRPp1ZCsjKGsYak7cwakGU8ETnvF3WwW1fnu+e
         W0IPaJJAcSjHbKN25wvfKKFFRRms6ITL7/zIhDLSOqsNKf5cyepYHPNhTL/2V6EoQZc/
         VBdhDgrfBZ6nERspwuItBTsjC3HlmzPtmJEwIbSKKMFO9bX38XHcdcgD7KXP5/53lK/2
         JilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ls+mZbmrHtHhR8Dl03bxVu8VpPS/hfKJ8z7hmScVfs8=;
        b=ZQxJPCNCxeZw/qjnisHV1v0vCh4x/V5Box6kch2RrLAjt/uV64OczThv11q7iisXQF
         eCCUfplh31dEoO9lLV+AC72gAi3Ti3CN1vacZJK9rnn0L2iTm2VucWl6mgK7mU94fUQA
         vTIF/b+1k0yNBK6F0O7gYscReNWKjsK2XhfdbsTk023NtSWULJ2Kxc5LykdYwdUeebo+
         er1MmEy2X0fU+mNAAdAD50WXUn/jF7s2XHF+IBqrxnbtOWkYi/7SHNKvFNXv+CVTzinr
         9PLcWWnH8/NicVY8VEcj5LCtEEVOCS6ojH+YuhmLXRbY5iXFxXLMo9avlvbu+YVo5mKp
         U7EQ==
X-Gm-Message-State: ACrzQf2+KwOFWDveLAh8xdUWYDpuoLtke2Y/mtTaz5kjFek1yvaIk18v
        psH7qlDMfFgsMVtVIWPW1OVl7XpTa81WUA==
X-Google-Smtp-Source: AMsMyM5nnUIp7HOIzQ7u6dhCroE1qzZOM5NXsol11Za113Cm0jWnXpchhMYo/7ACooa1Mc45dK4VUA==
X-Received: by 2002:a5d:568f:0:b0:22a:e6ca:1bbf with SMTP id f15-20020a5d568f000000b0022ae6ca1bbfmr17863389wrv.427.1664322670506;
        Tue, 27 Sep 2022 16:51:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c4f8200b003b27f644488sm145301wmq.29.2022.09.27.16.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 16:51:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v5 0/2] arm64: dts: qcom: pwm: Drop PWM reg dependency + update MAINTAINERS
Date:   Wed, 28 Sep 2022 00:51:06 +0100
Message-Id: <20220927235108.227566-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
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

V5:
- Resend the yaml fix
- Update MAINTAINERS to mark Lee as Maintainer not Supporter of the YAML
  files for MFD.
  I rely on scripts/get_mainter.pl to tell me who needs to be mailed and
  who doesn't, given the YAML change has to go through Lee, the MAINTAINERS
  file should make that show up in get_maintainers.pl

V4:
- Churn patch#1 prefix to "dt-bindings: mfd: qcom,spmi-pmic:" - Krzysztof
- Add's Krzysztof's RB as indicated

V3:
- Splits dtsi and yaml
- Uses Krzysztof's suggested commit log in the yaml

V2:
The accompanying patch removes reg = <> and pwm@reg from the yaml and dtsi.
This follows on from discussions between Bupesh, Dmitry, Bjorn, Krzysztof and myself.

https://lore.kernel.org/all/20220719205058.1004942-1-bhupesh.sharma@linaro.org/
https://lore.kernel.org/all/20220721195502.1525214-1-bhupesh.sharma@linaro.org/
https://lore.kernel.org/all/20220822120300.2633790-1-bryan.odonoghue@linaro.org/

The previous discussion tended towards either removing pwm@reg and reg = <> or
extending out the yaml to support multiple reg declarations for PWM compatible.

This patch does the former. I've left node: label in place, dropped both pwm@reg
and reg = <> I kept "label: nodename" though because it looked more like what we
already have for rpm regulators.

Per our previous discussion I've modified the yaml and dtsi in one go.

Bryan O'Donoghue (2):
  dt-bindings: mfd: qcom,spmi-pmic: Drop PWM reg dependency
  MAINTAINERS: Mark Lee as Maintainer not Supporter for MFD yaml

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
 MAINTAINERS                                               | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.37.3

