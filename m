Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8553D4DB31E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 15:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356740AbiCPOZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 10:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358066AbiCPOZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 10:25:12 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C743C29CB6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:56 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r13so4543479ejd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60je+LDflCDSpm+PbhIAk73PJa9MombVHWRyiPaaQWE=;
        b=oNMzzvPvDHW2uRJHt3qIdpSZgAeuwLDFE+x5tjM7lmMQ4jHjKKNIGzWBC4+FQzJmN5
         BrlhZPMo+Xus6o1vmKpbqj61itrBjnUGP6oNoU9ojY9VpbcHx0WsjDfd060bG8FRCL/2
         DIztpPRLDmON/yew7TratkzmeI6aPwE+CauzZDxrlC3psiOE8J/ez5kQLpm1yo2Ir8Si
         ZFntmScxnH+ECOfD5FIfsvki8GWUJA6xEvrwQiDkVWWQtnSi0xD2hFVW+JKUfj58yGsz
         Hg4lsSUAjGMG7FmBo6LeD22AmhIulr+XrQN4hchBsLkTaaXu895KNYCGeRdtr81Ok4TV
         MPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60je+LDflCDSpm+PbhIAk73PJa9MombVHWRyiPaaQWE=;
        b=2LkbrGZ57xCl7pjWJfJVRdWpY1YhnZklj6tTgP062medS2r56Nop40FsKvj0qmLF2S
         sdQ0+U3nrqGa2K5Izf/YZKQsjhEsij8sAt0X//UTGs/1FZYyW2JBLatw3/RyYl58Q/d1
         ort56krWw4En8iOFgISPjhQ68Z7xyHFotSWkoqCyK4acu4YdwB24f8BlFoJ9OYsXSBUD
         W3njmVImIHIf8w0FHiDpcgMBR9i2Dps8URqtd6U2RvOqtSnl/D0HwFildQ6nk5ct9nqe
         Q9V2Zad8Y5kBZTfH/8ADT2zgGYhTDtLqIAZknaDfA3JgrAE9ZJjU2sAwapbEMgX8StsL
         faLw==
X-Gm-Message-State: AOAM531v+4Cm+07cwaOQJGdC1GDcHkjguMaYq6IA7XHg71vTEoh950Pj
        Nn4QD/wU+KQobZOYLfGLGrPxPw==
X-Google-Smtp-Source: ABdhPJwWsZsQ3dkab910lILVMYqGsWWDH0/cbWpRqjaFCC9K1Bfwl/1y/TmXOcMyKAdlTUVTENgumA==
X-Received: by 2002:a17:907:7d93:b0:6da:8f57:68fa with SMTP id oz19-20020a1709077d9300b006da8f5768famr246070ejc.42.1647440635393;
        Wed, 16 Mar 2022 07:23:55 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006b2511ea97dsm952263ejc.42.2022.03.16.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 07:23:54 -0700 (PDT)
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
Subject: [PATCH v12 9/9] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable rradc
Date:   Wed, 16 Mar 2022 14:23:13 +0000
Message-Id: <20220316142313.92371-10-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316142313.92371-1-caleb.connolly@linaro.org>
References: <20220316142313.92371-1-caleb.connolly@linaro.org>
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

