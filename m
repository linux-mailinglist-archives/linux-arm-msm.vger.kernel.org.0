Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA3377489D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 21:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbjHHTgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 15:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236525AbjHHTgO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 15:36:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D5A7D9A
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 12:01:57 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3177f520802so87515f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691521315; x=1692126115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d53EJjFlLE6Vxh8rngWYlz+t9p6FK75e/MN7XlFoNvQ=;
        b=0mQ0RfHRO+1lGkEC4ULzUiM+kikaqEOjK+ShXWBesckmHuUXhxzIJBz1fxXjqyLDQT
         GGrbC09X0pk84cmVVQMIxX6g3fXU4ulMug6SwMwWgKtOExqT03adQB/j4r/+XwHpC5Dy
         Pxd41d42eCl+mKXxhXnrhW4uOITiFPu00wnkkPej10l5t5e4z5rXw/o3BcgLLDJ9zQwC
         HB/+CgBAqOaHcVDmKmFgNR0tSmlDcMey8w5tb9MuR9eg+oLdaI23s6gVb/cMkvV/n/4B
         bvmtSK8ZgBmAz7x8asFB/1SXrMyViYCYLi1m/wNAKHgSPjY7tcUXUEeO3J7hnpZHzH5U
         lzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691521315; x=1692126115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d53EJjFlLE6Vxh8rngWYlz+t9p6FK75e/MN7XlFoNvQ=;
        b=TESFArlIatzl0D+X2AuqZo1CmUITugyBNPUiOeezPqVxUzIl/OU+XmrcUgdiVBkJuE
         tkDPAwajpoAc5g+4UoWJLSCveDF5m3+JCWzvsU8StUooqtUhSgKKZ3wfDmXjYh7bq72S
         bXW5gNynMrpK3PvtXH45nzX+JWMLx0tg37mU2BKgdUI+HO7ZH92Zy3ivPKy5QJqeiiPh
         sD1kVHp98fRJMKnEBIgQUnLizTL4Bcxh2C9beBYZoBn86QjbwhT5emjHevnA1lm3ISY9
         GHuyoEh5c+fexE7tBNJXteGHQGTd/p0ph61rda1ZgONDc7Guw5u58tb2HhePPflNjAbV
         WrlQ==
X-Gm-Message-State: AOJu0YwABuhx/0iqnzYkbObnUD8xJP50ItmPG3Zes0rSDifaQTTjq5K3
        47ggpmcAKRc7zS1pWR59syd1mQ==
X-Google-Smtp-Source: AGHT+IFWnNZIQE2PU/Slv7+JXexxG+sPvEaCIjrbyb56uRSRja0OiEpq4PkjM/6HDxE36i0dUfAoUQ==
X-Received: by 2002:a5d:6ac5:0:b0:317:6570:afec with SMTP id u5-20020a5d6ac5000000b003176570afecmr9124359wrw.3.1691521315696;
        Tue, 08 Aug 2023 12:01:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6a08:bcc0:ae83:e1dc])
        by smtp.gmail.com with ESMTPSA id z14-20020adfe54e000000b00317e9f8f194sm7301055wrm.34.2023.08.08.12.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 12:01:55 -0700 (PDT)
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
Subject: [PATCH v2 3/8] arm64: dts: qcom: sa8775p-ride: enable the second SerDes PHY
Date:   Tue,  8 Aug 2023 21:01:39 +0200
Message-Id: <20230808190144.19999-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808190144.19999-1-brgl@bgdev.pl>
References: <20230808190144.19999-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the second SerDes PHY on sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index ed76680410b4..09ae6e153282 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -448,6 +448,11 @@ &serdes0 {
 	status = "okay";
 };
 
+&serdes1 {
+	phy-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
-- 
2.39.2

