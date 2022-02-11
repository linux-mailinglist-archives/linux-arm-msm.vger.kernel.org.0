Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663644B2F38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 22:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353560AbiBKVUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 16:20:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353582AbiBKVU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 16:20:29 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F633C5D
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:26 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v12so17320396wrv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60je+LDflCDSpm+PbhIAk73PJa9MombVHWRyiPaaQWE=;
        b=h4WkdtLhlBFobnAEkWmySA8Nwmeb85SKr+lb6GsK6epAGVSFu2EIbIhkirXz2GADJu
         lH9AZPve5vGvhS4FsiP7BFHDLrAReADlmzMZNYNsVskOU5pNbNaaqmpq13AnOKfQ8xKT
         uPepIay2aY0NR/sK+eXdqegDfs7bUKIdXoAL+l6LdLmSaQeFL58Od6TS4NQO+Kj0UY3e
         QnrBLrYmGaxnONnYkFAFHXBCGfs/v/CcN+N5VKvKK/7aklrABjR7bsmd+TCdyR8wX/Vt
         kekGeMqysyIYTBEVZ0kNd5RJsjjYMZhv/g9mCUTarPp9vBBf6KGmAn+w2gjnPCWBSpUb
         pACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60je+LDflCDSpm+PbhIAk73PJa9MombVHWRyiPaaQWE=;
        b=a8P4OODjrIkxNVUox5m2fygQJ+GO+MDO/SoOsoz1+KMCw2jKZgS3G9dztzGOI1YxiB
         dXkd40K9P8FvbdKV2poo5nW5d6azr96+HcyWNxq0lvv0JfBtXPp9W3ehvT6O9xxHYmjM
         Z1ADlIDoHLFaz8xJHP1F+Vfsq+t5MHFhBPBtud9T9xGE7XKYR+lc+K2RH3+7ATI/VAaL
         2gM+KGIveRWjt4Rl01e4O2QyhAUByhSStTISC1zmpxnYBtq1WJUgF3urTVYbdu2JfG3I
         9Mds3ALchIUd1sqkPRMalN7lnsijkeOrO49xjfKfH4JwHNwKSZoUjHj47TvLoHBt8Cyf
         Q+7Q==
X-Gm-Message-State: AOAM532aBDeL4INh5fD1gwSLepUyPBcCpSTIjPFXjpo5E5TDn4hYpV6I
        5kcMo49mQ0T01U3sacEnlhOZRg==
X-Google-Smtp-Source: ABdhPJzl3510qY7LU+n/pjQhbwF8vGNgMmFzEqER8E1ik5IHSTONjlcek0QUwEgXL1JJ47kcjHuOqg==
X-Received: by 2002:a05:6000:170e:: with SMTP id n14mr2757727wrc.595.1644614425290;
        Fri, 11 Feb 2022 13:20:25 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id x5sm14276017wrv.63.2022.02.11.13.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 13:20:24 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v4 8/8] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable rradc
Date:   Fri, 11 Feb 2022 21:19:59 +0000
Message-Id: <20220211211959.502514-9-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211211959.502514-1-caleb.connolly@linaro.org>
References: <20220211211959.502514-1-caleb.connolly@linaro.org>
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

