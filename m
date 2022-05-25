Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83BF1533F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 16:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244859AbiEYOoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 10:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243083AbiEYOog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 10:44:36 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CD8A88A2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 07:44:33 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id q21so21951040ejm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GC8ExN7zgyMEJWd9pL4zC+r85cZkPtnN1cqYEwb1TYQ=;
        b=iWzN+qaN44xR2/Ui8/XVBZAWL1dNaHgp8yovlEXubsFnybVGy66n2ADXP6AH90/Gl+
         Ed6MV5jipQDiHQylU2s/8hWxdE9rxrx8FIv/TYRZnJx4b6LCPlY3MhgFG2HGwZvnZ1M6
         oSgvSVLTAB8MsdiOgqIrn4NAWc5rBTeHuOm99rx58g/IhFhyxjOZRVHQIbn9dIBRRCUj
         2iu+zfDmyzLpQd4P+73ktua1wl67KzOj9FXV0eZWNh+jY1JBwL2udNTzMatX5zOAKLRw
         JJuiNVqWp60WD2uUMjxMxWdjwsK0w4jAriC1aJ2nkMhpbwOOrylSxkRVom0GoN25adzA
         H3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GC8ExN7zgyMEJWd9pL4zC+r85cZkPtnN1cqYEwb1TYQ=;
        b=PtNuEIX+Tp3X32If8wO2TlgJjQ/Fs9ubUChMjGPnXDCXoz7B1fudPJuo0mAT9oQmX9
         De9eqD33w5DyoTT8YwhZnNuHcN1C0LU8AT+Kahv3fs4vCiTCfp4XCkQivdYSKiRB4XvQ
         vyN7FaEEJAai63R/zOmFn9oBWGHFNa3Hy8SKtQXyC36nrTm6FBFAMhRPiqoKUamS4aae
         8f/xLjbNGO+NDZiWmyDufX+8QQcktboUoLeK7LTsEJt8QGvxeaiy20kG6Fe2ee905HsS
         Dd9aLenNKpf44jpbuv7Es7xZdKyHYkrM/wLsBUd+y4TyrjUtWOmpp7rsX2AAtq+XRSTs
         qE6Q==
X-Gm-Message-State: AOAM533+uDGk/99lzq7jw0TYyXPvl2pe3a087js22u21rrPLB2qwl+HO
        6rbnr7V+NAct7jVgRglZHpzshXB2PBsKEA==
X-Google-Smtp-Source: ABdhPJxmnf+tkmH++ly72dkYx+WDxOisAzmzCy24zFOca1/p18mEgeDDhSek1pEVsT43mA8YMvb/zA==
X-Received: by 2002:a17:906:d550:b0:6ff:1eb1:69e9 with SMTP id cr16-20020a170906d55000b006ff1eb169e9mr255ejc.663.1653489871936;
        Wed, 25 May 2022 07:44:31 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id r2-20020a170906550200b006f3ef214de1sm8159596ejp.71.2022.05.25.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:44:31 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: [PATCH v3 0/5] Add interconnect support for SM6350
Date:   Wed, 25 May 2022 16:43:56 +0200
Message-Id: <20220525144404.200390-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds interconnect support for the various NoCs found on
sm6350.

A more special modification is allowing child NoC devices, like done for
rpm-based qcm2290 which was already merged, but now for rpmh-based
interconnect.

See also downstream dts:
https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/tags/android-11.0.0_r0.81/qcom/lagoon-bus.dtsi

Luca Weiss (5):
  interconnect: qcom: icc-rpmh: Support child NoC device probe
  dt-bindings: interconnect: qcom: Split out rpmh-common bindings
  dt-bindings: interconnect: Add Qualcomm SM6350 NoC support
  interconnect: qcom: Add SM6350 driver support
  arm64: dts: qcom: sm6350: Add interconnect support

 .../interconnect/qcom,rpmh-common.yaml        |  43 ++
 .../bindings/interconnect/qcom,rpmh.yaml      |  22 +-
 .../interconnect/qcom,sm6350-rpmh.yaml        |  82 +++
 arch/arm64/boot/dts/qcom/sm6350.dtsi          | 109 ++++
 drivers/interconnect/qcom/Kconfig             |   9 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/icc-rpmh.c          |   4 +
 drivers/interconnect/qcom/sm6350.c            | 493 ++++++++++++++++++
 drivers/interconnect/qcom/sm6350.h            | 139 +++++
 .../dt-bindings/interconnect/qcom,sm6350.h    | 148 ++++++
 10 files changed, 1034 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,rpmh-common.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
 create mode 100644 drivers/interconnect/qcom/sm6350.c
 create mode 100644 drivers/interconnect/qcom/sm6350.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm6350.h

-- 
2.36.1

