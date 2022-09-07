Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860105B0E7C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 22:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiIGUtn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 16:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiIGUtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 16:49:42 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E66715721
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 13:49:38 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id n65-20020a17090a5ac700b001fbb4fad865so163254pji.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VILwDL/sIUZC34sszkWtJPfoLU5yiUkOiwtDL7IE2b0=;
        b=ClFo6oZego6igRhj/tOJY4x+HLqCA3i9nMX4KM0+Ag+rW9iC/gWlE9ZAyqzTQ4iqE3
         B2sP2BYHvX4v3bo4jjmvnSWB9pRtI0U0DfznyhuIDVSYZBukRj9fEVBD2ySXsnKW5m2q
         vIn6wNvPqNg4Ks1scp3jRgPLQMl9Hn13YAQmYf5vR1SZsjb/1hG59nidUzJkCBf5vBYA
         ri3feTAswyIQRKCZ619KqiSAMkKHUiaMMjAxyxJb05vZJmh0xQ+4JB6Q3H8nkpq7ZwaN
         Par5PHOTxOOac20WE6/B9l0FKuUeML6jF34zkqdwkJ/XSPH3MDgudonPiEfKBp6iw7m4
         yhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VILwDL/sIUZC34sszkWtJPfoLU5yiUkOiwtDL7IE2b0=;
        b=o4/uiWX/At4/+Fd03zWIUxBHX4CCwcsWQ71gXVc101Nh1DrCuXWKcQYwuyrlLB12e4
         t2P6meKzOt1WMpVqki7at5xP4aqmg5zbJnaE37Kjt/s8quduos7VNHukqfOimL0bj/0p
         W/iQcsFVv3nX+6mze+GeVFS9Amo72iz+zkxAjfD/dVGgsGphckCMG2v65mWGOPEMFXEH
         ykZbnNxtXaXSuDt2K0qxjYx62MhFY4Vb6Nhqp6o67fwMx+ptw7bx/4y/IDFuox3wAVjZ
         L+fUthIXTs1seQpaHPaT4wYZBcSlTHAkE4I0teXk7VGTqPC1kUHMM7QfK30MkaroJDzK
         mjyg==
X-Gm-Message-State: ACgBeo22LR6vVnliKY3+ZUi5rVOdIl8aRtB/0RR8LU9eI7q+gM9/c59h
        48v2R9FBJWtfv+yn75JJq2Br5g==
X-Google-Smtp-Source: AA6agR7mirZmtO2FC7GgkTq0WIz+FVoIZ5otVGbaluywI72PpIdKKFO3WQhD7jyObY6RKdBYtMAFJg==
X-Received: by 2002:a17:90b:3c8a:b0:200:b874:804 with SMTP id pv10-20020a17090b3c8a00b00200b8740804mr342150pjb.151.1662583777293;
        Wed, 07 Sep 2022 13:49:37 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:5362:9d7f:2354:1d0a:78e3])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090301c600b001712c008f99sm12795140plh.11.2022.09.07.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:49:37 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
Subject: [PATCH 0/4] dt-bindings: net: Convert qcom,ethqos bindings to YAML (and related fixes)
Date:   Thu,  8 Sep 2022 02:19:20 +0530
Message-Id: <20220907204924.2040384-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
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

This patchset converts the qcom,ethqos bindings to YAML. It also
contains a few related fixes in the snps,dwmac bindings to support
Qualcomm ethqos ethernet controller for qcs404 (based) and sa8155p-adp
boards.

Note that this patchset depends on the following dts fix to avoid
any 'make dtbs_check' errors:
https://lore.kernel.org/linux-arm-msm/20220907204153.2039776-1-bhupesh.sharma@linaro.org/T/#u

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: David Miller <davem@davemloft.net>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Bhupesh Sharma (4):
  dt-bindings: net: qcom,ethqos: Convert bindings to yaml
  dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet ETHQOS compatibles
  dt-bindings: net: snps,dwmac: Update reg maxitems
  dt-bindings: net: snps,dwmac: Update interrupt-names

 .../devicetree/bindings/net/qcom,ethqos.txt   |  66 ---------
 .../devicetree/bindings/net/qcom,ethqos.yaml  | 139 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  16 +-
 3 files changed, 150 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml

-- 
2.37.1

