Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE016CAE5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 21:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjC0TPt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 15:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjC0TPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 15:15:47 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B0A132
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:15:46 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id k17so4359919iob.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679944545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYePwSpMOlW9JU918gQssPhNKde1XD+sdXMbzV8LEpc=;
        b=hK2HDdGjuk8VvHQEGy3DAfN6UrL8tyyhPNMkIqVGZDg2NjhZfI2L4OFwLuDoCrf/HI
         67Qe/0VEYYCpSEgStxKgmU6HX30FYFC4WqYxq/C6F56gLsK1SWiS/rpCon7tBXcowKxU
         O9i3KdU3jAzRyeyKGbA7gRqKo9W63L3Fp7DEZpOuBQqGp/fblKAr8fRW7KSi6InU6fu5
         bnMj+MdO9Rz80/bQQ64oQy43pY04kkIX/AA8SF25mZbPNsQ8V6MmpshllyP2mvcOPixu
         Ov4blG/kcpICl5D6Cd3j043pVXhAsfYjyI98D5/xOHcMF0X3b2PTsJI+f+7cnBzuyrh6
         Y2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679944545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYePwSpMOlW9JU918gQssPhNKde1XD+sdXMbzV8LEpc=;
        b=Bp/jz5AO8S0oqdUd8Tdr32MphNlLrcdBK7l3uhAHsCylcIAmXThcAg9QO3TyLbLDIh
         3nCPNzCWbl0fK8SQOGvBCGxcAHUl0eMMXE3lhqco7CiNuZoFcSEVmBTdkYKcCFs6v049
         kygqgYXdGybRE2nVbY+FUZzrvHWPmxYqR8ae8ucWbYBP2r8+554qWhyusncCAlh6IabY
         2AgvLgQWKfSGtn5G/MX2E4o9DLCC4mhGlTi0ewZmGgkRsNne3AO0rlxqG3iHdxlV3ztD
         P/EA6HtHhy9qr2q1KCBe3xiq+r9SBfD3Blgq4kdmx1j1FaPlOs4fbAweHUEMyRbTOm6N
         xsYQ==
X-Gm-Message-State: AO0yUKVTRwV23NK67i969fdCr5H5WjFVvX1sXTNfVCeG4PgXfK19i1he
        BsRPKrhBElJIKbH7gwuNM9j1mA==
X-Google-Smtp-Source: AK7set9IQxnK3fjpDOFGQWO8VzObSo5WdbE1/skSHSh7NQgQMmd0rJg4+Wg3P0olNFYS4NB0eWfjog==
X-Received: by 2002:a5d:984b:0:b0:753:7ab7:7d44 with SMTP id p11-20020a5d984b000000b007537ab77d44mr9531724ios.0.1679944545559;
        Mon, 27 Mar 2023 12:15:45 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id n13-20020a5e8c0d000000b0074555814e73sm3460548ioj.32.2023.03.27.12.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 12:15:45 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org
Cc:     quic_rohiagar@quicinc.com, caleb.connolly@linaro.org,
        mka@chromium.org, evgreen@chromium.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ARM: dts: qcom: sdx65: support IPA
Date:   Mon, 27 Mar 2023 14:15:40 -0500
Message-Id: <20230327191542.2765834-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The upstream IPA driver now supports IPA v5.0 for SDX65.  Add
IPA-related nodes and definitions to "sdx65.dtsi", and enable IPA
in "sdx65-mtp.dts".

Having touched these files, Konrad advised I should update them to
move the "status" property to the end of nodes where it is used.

Version 2 of this series addresses comments made by Krzysztof and
Konrad, and adds their reviewed-by tags.

					-Alex

Alex Elder (2):
  ARM: dts: qcom: sdx65: add IPA information
  ARM: dts: qcom-sdx65: move status properties to end of nodes

 arch/arm/boot/dts/qcom-sdx65-mtp.dts | 11 +++++--
 arch/arm/boot/dts/qcom-sdx65.dtsi    | 47 ++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 6 deletions(-)

-- 
2.34.1

