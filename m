Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8617748A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 21:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbjHHTgf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 15:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236237AbjHHTgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 15:36:20 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EDA217AD
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 12:02:01 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so50664875e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 12:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691521320; x=1692126120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYZbQHrxpkTe36I8BIa5OFnDC71e2O9qRRyJDc3ulLc=;
        b=JEQmQTNVlr2LI7Of/NkrrpUbKCv82EZ8k0SyfbKP1swdLvkCNa+f+2bp0bGJ+uK1LA
         euyMaa5H2ZbM0g+yDuIpsR4HCTUGbFFxBUmUcGpcpQhLQa0o/OzCIc1OPoJVR9rJOcJX
         lH4CFM03JSIGa4raMA5g34DZ5HMisipJfOkNUW35P8PVXDWWIe7mdKxsxDYVVmikXW62
         m5wHQD0L3EgHh5HrIASbm9Hbt0lN8tW1W0wlS7VzYT/559NWr/s96PEidyTtarcHrttc
         FRbCXmc7O4mis1BD/Hno///0jDSX6MzC7e9qlPMZ+L7YsS3PoR375pK5DW0IdCNkokPM
         A1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691521320; x=1692126120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYZbQHrxpkTe36I8BIa5OFnDC71e2O9qRRyJDc3ulLc=;
        b=Sg1lyqPZ7NNXtHx9yXcRddK7We+S5ED6k5TKS6oTN3fukfdhpPBtT+fmjtSJgGLmOa
         /YXXqq8w38bhTZkFO+ikHiZiUqxh7Uu24axVmO31mIsURSCsln2orGWY9JJszUOedHC3
         o/5OjlL7hNro9vdb0Zsq1SRAtPyV1rO8zfm7VdmsjJ+2/Ac56LnFse/XQIL1jConwwhj
         ugSrUKOgTcTqjP1iqsZbv6FGUgv0yu39GMWptk/t+tToZ5NQ+LWBq3mh6B1kut0bS2vV
         PkucXlb8bYqwApEO5fcFTVIwIFDGgONGpW9NOH6k90H0Ryp46+c7A9UNVHRUcBDKkR02
         C7hQ==
X-Gm-Message-State: AOJu0Yw8Y4VQId9ciWO9oA9Aoot4w9QISbwNhTpfomnsWO64z8ybQOa2
        qi7D0G6c1jV2uevVG1txUAhaDQ==
X-Google-Smtp-Source: AGHT+IGJxd8G9X40eIjxwFlRGwQz785i3Io9vskmf46BbSTOXlgI1WmbSJ9NiS4l4e+xS+tgvkRDZg==
X-Received: by 2002:a05:600c:22c6:b0:3fc:e7d:ca57 with SMTP id 6-20020a05600c22c600b003fc0e7dca57mr505644wmg.2.1691521320164;
        Tue, 08 Aug 2023 12:02:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6a08:bcc0:ae83:e1dc])
        by smtp.gmail.com with ESMTPSA id z14-20020adfe54e000000b00317e9f8f194sm7301055wrm.34.2023.08.08.12.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 12:01:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 7/8] arm64: dts: qcom: sa8775p-ride: add an alias for ethernet0
Date:   Tue,  8 Aug 2023 21:01:43 +0200
Message-Id: <20230808190144.19999-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808190144.19999-1-brgl@bgdev.pl>
References: <20230808190144.19999-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we add a second ethernet node, the MDIO bus names will conflict
unless we provide aliases. Add one for the existing ethernet node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 486cb48ecb9d..330553742204 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -23,6 +23,7 @@ aliases {
 		i2c18 = &i2c18;
 		spi16 = &spi16;
 		ufshc1 = &ufs_mem_hc;
+		ethernet0 = &ethernet0;
 	};
 
 	chosen {
-- 
2.39.2

