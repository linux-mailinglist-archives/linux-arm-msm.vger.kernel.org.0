Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFAC85271AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbiENOLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbiENOKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:10:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55EF1573B
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bu29so19031264lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
        b=SMxjHo9JuoniR6X2mCjvMmoE9I2k1++Yc+VeG5DsVL58baRjeh/aL2kb+tha6nCBg2
         rbWm69A+Q+Y02I47hbgcRTk5hKE2yBwcvfytVXd5VO4ALpy3408WndXURCdcJX/+qe7a
         7Xe6mKuww0ivdZkQnLtKONOexb486DP423eV2kJAqGEqABHsDg24Xsmg1536iRLDnuF+
         M3cCcYOdAlC+lDWzbELmDrlRQlWUsm0meUq+un6jt7sUE/2zW2YWerK67rmwlwalg/zV
         vvQD33ReytFR14ldacFYtvNCTfAY9eiP+lI5GbrhQ4fmD+lNQCk5Q5+WutboyR48l9EH
         LNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
        b=XCa29fq87JLSMcyto+1LoEbVzr6YU6+73mDUw5o9tbzmfFtOrTFiBxg+qetcEkUfk3
         cGgTicS7o2JGN4aZO55YK+YPYS2o149ly+uAGQe1MmFL2p2Mr20y7SF759N+27hsEwz1
         X0ZSQJJ7HIkQ7UTxY0l8O/C8tiX7MBag/aFwH656eFM1+jrRecCdJE9ZrY0ho7Bq4jw1
         ArJAvLLteB1N6QeF+US/nZFudxnRw1LO1W3nJ2CeVtwrEpR5DVzdvVVkurTi4bKejrDF
         qIJ4VeenrVhwUToIpPF/WX2hL6JSs7AiEOGNodp2S4Q+FUkIvc+uRi1O+twAD9Shsrir
         IAjA==
X-Gm-Message-State: AOAM533ofD2lA6YgS+JbKrXtqFt1UhvtCNWvHRLs72scKmPKJ5rPBK+n
        kFtzX3NRBpQm/epCXZVCiqkmdQ==
X-Google-Smtp-Source: ABdhPJxKvqtUWFWZqZl4zlapqe3fxfAc85uOrYcObXZ9NBR1oPPInSqQgghaSPvBQooVUQpN3vRuLw==
X-Received: by 2002:a19:494b:0:b0:476:5917:b67 with SMTP id l11-20020a19494b000000b0047659170b67mr5382506lfj.452.1652537452364;
        Sat, 14 May 2022 07:10:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9-20020a05651c104900b0024f3d1daedasm845912ljm.98.2022.05.14.07.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:10:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 12/12] dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
Date:   Sat, 14 May 2022 17:10:41 +0300
Message-Id: <20220514141041.3158521-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
References: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
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

Add binding documentation for the Inforce IFC6560 board which uses
Snapdragon SDA660.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 129cdd246223..ac4ee0f874ea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -41,6 +41,7 @@ description: |
         sa8155p
         sc7180
         sc7280
+        sda660
         sdm630
         sdm632
         sdm660
@@ -225,6 +226,11 @@ properties:
               - google,senor
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - inforce,ifc6560
+          - const: qcom,sda660
+
       - items:
           - enum:
               - fairphone,fp3
-- 
2.35.1

