Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F319C6C86BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 21:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjCXUXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 16:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbjCXUW6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 16:22:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D03149B1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 13:22:56 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id ew6so12371984edb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 13:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679689375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOoArkO1KkoPkHMPkoG8FWmUMT2qc5sxWLfwAZE6uoQ=;
        b=SzACiC2j5oGKE/L0KR1NSCb79Ikstbv1HbGa6UGcKptfM2jy/bITQ9uHv+OlH3NAql
         rC0fKeX27y5Xc4XeDchxdrLKIoAilzB/r+7R4MItVqmrnvY3+lbJitfArOPJjZN+JLzs
         mtMRynUIBN6o5ydCqOAhbwDyBcIyiBcQp99Kcjl/aY7sjkO50OKhD5U82inTPFMptuXU
         bjM9t8JWPyTp//RPrKqNg7kltLK4wOPra0gbyT9yGj+qY36++jWRgIYE9rbb0q/lTGxn
         7H7Yw01T1Jg7OCSoHm56fbHdyN7dYB3AR021hycuBYOeIHp5ITTNt9AeNKij7LkxQNWC
         i97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679689375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOoArkO1KkoPkHMPkoG8FWmUMT2qc5sxWLfwAZE6uoQ=;
        b=qlDgOI/x0QHBA/RliGyg5Ed8xy2PvUopG1cbLiT1GkvxULcyxw2ulfG0TV0PWBw5Wi
         gCj3wK2JWcAMgp+8EPhxILs92gk2qiS7xDxnD3WdihZZ8r6fgyQutw01dJhJc6WLgH9o
         BzIZCgeWGOtKIKRIS6VE4OLcwBDXOxV1F4Xic+F4kNGJxpHeBp96ZbYutc7Ly4gsPzws
         CLGwdCT5P8G6QOA9+ZbHLSj0Nr2nq3tSfXwPZgHTfhVlRVuJDjGMp+2RHGnPAPtVECc5
         L0ctKxfo12Y3hTOYnrH+1gkMMervQdmCsEeLrQexT5s1DgXQXTENd8guoiRBvOpXWW4W
         kMeA==
X-Gm-Message-State: AAQBX9d570q0O878Zzx6UOv8xljE3wpx2sqZMy6wZ+iwwizD+XRW5ySf
        fBq87g/EJPEBzdmUgK1XbNx40g==
X-Google-Smtp-Source: AKy350acvuiCSR0cKt3yGKDoqNnD9bS41wlK9VY+wrTot22zWznSYEyjI5oTPdSxv/6QuWfUYGP8BA==
X-Received: by 2002:a17:906:2009:b0:933:4184:f0d7 with SMTP id 9-20020a170906200900b009334184f0d7mr4281501ejo.69.1679689375452;
        Fri, 24 Mar 2023 13:22:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
        by smtp.gmail.com with ESMTPSA id rh26-20020a17090720fa00b00930ba362216sm10900041ejb.176.2023.03.24.13.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 13:22:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/5] arm64: dts: qcom: msm8994-msft-lumia: drop simple-bus from clocks
Date:   Fri, 24 Mar 2023 21:22:42 +0100
Message-Id: <20230324202244.744271-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
References: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
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

'clocks' node is not a bus, but just a placeholder for clocks:

  msm8992-msft-lumia-octagon-talkman.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
    From schema: dtschema/schemas/simple-bus.yaml
  msm8992-msft-lumia-octagon-talkman.dtb: clocks: xo-board: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], ...
    From schema: dtschema/schemas/simple-bus.yaml

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 0c112b7b57ea..2861bcdf87b7 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -46,8 +46,6 @@ chosen {
 	};
 
 	clocks {
-		compatible = "simple-bus";
-
 		divclk4: divclk4 {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-- 
2.34.1

