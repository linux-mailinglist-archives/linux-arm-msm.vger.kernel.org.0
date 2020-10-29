Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1373729DC6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 01:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388560AbgJ2AaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 20:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbgJ2A2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 20:28:47 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D967C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:28:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id r10so467976plx.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XL0p4jUGnrhzOC6YPdWcbPrW/C0smRCADsbdxD0rIUo=;
        b=MLjsILPmIR/nu0yGnq6LaBexXCUIMYA9QFD+BmVbZ65ibV1KuYMc+lhoD8DxAY2a9q
         OH7qT2thblC9rXZSJLxYkry1FnfeBWu8C393jJrq97f4DNPhmCsakx4Tz9O9KlFhajKL
         2OZ8fZ/mibKVqtCiocLNPHiEWwX2Opov1EhVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XL0p4jUGnrhzOC6YPdWcbPrW/C0smRCADsbdxD0rIUo=;
        b=nqU0JGT1qM9fDyf49qmHI2gHgMFW8OauHi8J+ez+/geRPj+JhDDicIoUCjIcukR2av
         TG1RbmKHfKLbOt0eo7byRUbu7AUnU81xqi1OlVTH35KXRZszVyZckY7XQ+Zfj6ULlmCc
         jl5dqK7MJ/hXZrvSs5BWqpuUDMlgEJtfcH6xwWs04jXZqEHxizKqxX/VIrGMsn2TzWKn
         VuIR5cZchPMIw2Hc+HuvOeOvLVcvx6IKvoG/JMJedk/CCZI4oIzVUuOc+el5nHHyL2qO
         d8MAmden/62EjuQllFAynbZu1NM7VssBmGGTkCZ5Asup32kIctLhNbnhrxhn1NRN59jS
         UZEQ==
X-Gm-Message-State: AOAM533N/Mu7FdG3Gh07LpIWNjXHql9UWnDZ8SYGFfzdfWl+gDSZ9vTr
        xeoCPjaJpAZu8ic0UAH56sZvAw==
X-Google-Smtp-Source: ABdhPJwie3Lc6uDBwa//k2O0uXN6sPLbXwjUESLHWrECCCoJOD0gRgRwVcIQaa/h7BDUUnOCMivSDg==
X-Received: by 2002:a17:902:ba96:b029:d5:f36b:44af with SMTP id k22-20020a170902ba96b02900d5f36b44afmr1438100pls.51.1603931325468;
        Wed, 28 Oct 2020 17:28:45 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:250:b6ff:fee1:7d4c])
        by smtp.gmail.com with ESMTPSA id u13sm743625pfl.162.2020.10.28.17.28.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 28 Oct 2020 17:28:45 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] arm64: dts: qcom: sc7180: Add soc-specific qfprom compat string
Date:   Wed, 28 Oct 2020 17:28:25 -0700
Message-Id: <20201028172737.v3.2.Ia3b68ac843df93c692627a3a92b947b3a5785863@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029002827.1729915-1-evgreen@chromium.org>
References: <20201029002827.1729915-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the soc-specific compatible string so that it can be matched
more specifically now that the driver cares which SoC it's on.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6fcffd588a7d6..f5ef2cb6e68c2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -660,7 +660,7 @@ gcc: clock-controller@100000 {
 		};
 
 		qfprom: efuse@784000 {
-			compatible = "qcom,qfprom";
+			compatible = "qcom,sc7180-qfprom", "qcom,qfprom";
 			reg = <0 0x00784000 0 0x8ff>,
 			      <0 0x00780000 0 0x7a0>,
 			      <0 0x00782000 0 0x100>,
-- 
2.26.2

