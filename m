Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924414CE229
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Mar 2022 03:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbiCECOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 21:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbiCECN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 21:13:59 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EA91CABC9
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Mar 2022 18:13:10 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i8so15050304wrr.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Mar 2022 18:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60je+LDflCDSpm+PbhIAk73PJa9MombVHWRyiPaaQWE=;
        b=oZP7Y8BCenpOvDiNDIejqZ2+Oiwb3gcNaTTt4yUlgFJrl4z1h80ueXByvgkH6DK5+8
         JK2vvMSdJvs5SW7OkGwvR3FciamC3QkVNMojox6malZah0PIBD5eYyLjjtPkpSWXirVu
         mY6zw64VUdmqC2M6AusCC7jg9ZAcjTa3aD1XaXN6QrLduZ468xgQH2xdAdPGHj4xHbq8
         EZ4P+LxHzKdzpLE3G8RUcivBJe1H3CJyjz5GapORZD98yiqho2+8C4xaDiRH5GozS8g9
         9QqHKkrChpU1GpBl2lBgvAERyGPeUWa4TrrWtdHKUSB/f6xov79gviI8rSNkwZforRrl
         f9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60je+LDflCDSpm+PbhIAk73PJa9MombVHWRyiPaaQWE=;
        b=SV9taHwHahpJ4s/+7TWt/Pp6t8dyyyudE5TbHexOudNSdaQ+JY9KLdBJvLhdB99UHr
         ySVqWwxXGFbl0WVgLs9oMXqsxYN0qwaO9mh5lJdZC/w054fdqFTXYsIElh5V4yq/NgxR
         gqXe5dq5OKBLAxhtNk3sQwKtW3mEDngpy8QwNh7uiVV8M1PLWzTIUXLpS3Upr7KjYg57
         ke6c0rL92Dsccz1PGVKOeIZFMOlSgbZj+Q4OkZj6+0ZpNhTHFJozveIB59yWXlQ/eTji
         KkhnFc/PbvYMfQ3uZdrRRv8ex8ikkC//8MeRk5uuUNr09ELXHHziBJB5rJfBDwl9k5kP
         WovA==
X-Gm-Message-State: AOAM533W+NCwxNe4UMRHzuLeBjRVr/6WrnBN8r436IfHQexclOoaQWq1
        991M0HHXZmSh2N/3urv7Ukzb8Q==
X-Google-Smtp-Source: ABdhPJykeiGO6n1aVMnx6rvjSem+cym+AkUbQgSyScynDN5hc9AaZMa/+MG+IcKBjUQM9NSRL2Ptlw==
X-Received: by 2002:a05:6000:1847:b0:1e6:2783:b3e6 with SMTP id c7-20020a056000184700b001e62783b3e6mr969030wri.163.1646446388961;
        Fri, 04 Mar 2022 18:13:08 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id k10-20020adfe3ca000000b001f0329ba94csm7932589wrm.18.2022.03.04.18.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 18:13:08 -0800 (PST)
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
Subject: [PATCH v10 9/9] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable rradc
Date:   Sat,  5 Mar 2022 02:12:47 +0000
Message-Id: <20220305021247.1020122-10-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220305021247.1020122-1-caleb.connolly@linaro.org>
References: <20220305021247.1020122-1-caleb.connolly@linaro.org>
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

Enable the PMI8998 RRADC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 367389526b41..b3b6aa4e0fa3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -312,6 +312,10 @@ resin {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
 &q6afedai {
 	qi2s@22 {
-- 
2.35.1

