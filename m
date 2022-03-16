Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C30884DB308
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 15:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243834AbiCPOZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 10:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358055AbiCPOZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 10:25:11 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D67E2A25F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:54 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id x34so1762486ede.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qImSYxU2i/y/qV71r8EFW+LTWk9ZfhM4KeM2jcTcklQ=;
        b=GXFNqIuos+txxk0QXeY8P02dg/9CyuyGfVWDdKoN7b0/0NaOdZxVlsascctqtK3aRE
         +28CY7TP4fS/ozuj9pGo3G0M5qa9m6pvyQ6NxNe+SoME/oUJtiRmXgrcofIJ3lpgEmM+
         BmJ3TTdiZYsQWJcsACChy1nhsf+W60W46Cj8tO0UmmIvLXym+2VYaG9cohVA8CIaw+tt
         cRq2KKyHRvOmrSDa2bzL2gizUf5FdudTS6ZtqeZieDvP3U8JX1P2RkZdnjcq6FibRg/Q
         W9luw3UE8xm+BVwD/fBJf/hGDBwiikrJGaK3nxfV4sZcizpmfhkx2sKqm0DwYAbgmx3T
         8R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qImSYxU2i/y/qV71r8EFW+LTWk9ZfhM4KeM2jcTcklQ=;
        b=oInzzo8vayxgt8/S6CX8WWfrOQtsYoLDWG37P3b8TYoQbk93baLAVCfJxz7EOUFWM3
         tY1M+RO5zWipmN0Fo7iyQd5u1ZFSzUMrhCxKFtIUOUMJt1B7nG9SAwdqFNiE50b9OxRf
         gmdLMsZfTN1vEdnNJlkFizevPFs9+EAa6+MjY75FHtqa8iyOLHcni1MPziP9WfA+wKjN
         xBrO3XybC5TmMEfgEVEe/n7+XA2OLeiQdIyQzH/Syo+l5q/f4XLNih3ZPsMPnWMGls35
         YlucOZ1sHdyo0ekM3+25/eiGJzgmqwMk6/KUA9ih7dgFdG4PVVdrnEJOa9TsLMnU5F87
         y8Yg==
X-Gm-Message-State: AOAM530I+N5vce8t9j3ZX2dvdX9umZ8i6hO/E1IHtI2LtDtoADj64tNz
        PzTcJhM+pZcG9Q8rIhBk8cHOjA==
X-Google-Smtp-Source: ABdhPJx5YQdD5YnGHwHeH4FbsHTZz4/fimLI5/wDSD3AcK8TrIn+h98tAegowWtwgC4YoaCZtQ8+nA==
X-Received: by 2002:aa7:cc02:0:b0:411:487e:36fe with SMTP id q2-20020aa7cc02000000b00411487e36femr29998197edt.338.1647440633082;
        Wed, 16 Mar 2022 07:23:53 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006b2511ea97dsm952263ejc.42.2022.03.16.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 07:23:52 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v12 7/9] arm64: dts: qcom: sdm845-oneplus: enable rradc
Date:   Wed, 16 Mar 2022 14:23:11 +0000
Message-Id: <20220316142313.92371-8-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316142313.92371-1-caleb.connolly@linaro.org>
References: <20220316142313.92371-1-caleb.connolly@linaro.org>
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

Enable the RRADC for the OnePlus 6.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 7f42e5315ecb..e8287cf02511 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -450,6 +450,10 @@ pinconf {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.35.1

