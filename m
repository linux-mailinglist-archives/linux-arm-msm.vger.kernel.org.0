Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479AC4CE228
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Mar 2022 03:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiCECOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 21:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiCECN6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 21:13:58 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2061C6673
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Mar 2022 18:13:09 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m42-20020a05600c3b2a00b00382ab337e14so6971576wms.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Mar 2022 18:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o/d166yo9TtkM4+c7x0I89HNNMPO2K1Na/pBqagV1Y0=;
        b=oTlV0iNlHqaGC2VFPFqInEY5gDuzfrfhklHFGgpfQ88/ZgDTBesbLDynLkeJN3sgjz
         ERBQQAgP3qFPrXAmWswuUPZMtW7iZZdAUWaVTiXH/5w5qe+Fx6m+25Zia0TmHR3HbbQL
         DIxyMzWvuWd3Oxjzob6+tQMkDoSq+1sYBXGXl4jlOpMZm7H4qpyGQYWDxVt1VnJXCQe4
         0guiLkqHaEOxV1rhq7R8L9j28+EnPMeXmhV/5v33jIIFwwbPe6PN6I7nfhr3ccKiXqay
         FhShJkYggyVnVrJ64exIL14Tvj+eXrJp1Fp1bE82xKDIBzoCF8YThUjBSl3Iu8wvstTh
         exVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/d166yo9TtkM4+c7x0I89HNNMPO2K1Na/pBqagV1Y0=;
        b=7qE2Z2zHODFQP30v+mPgDV6xVECtwEo8xYqRAfspaDofLmnQke4K8BI9r6k3/3gLjR
         iydMhLXCPEl0PEsPZ+8syz3WqW0dGM2CYVVQnui31LNuWUvOZKznNDcsNjfUHQvK0/hG
         SA13d9DpICB8x0MbkvIH0CGkzkBtdeEiFJ0nWDaMewHgsCGAV7Xhxl7Nmb0DjL+/5web
         3cIybVc02QHm8ttYNLBYcvgnTEwnzW0H74v7r+pmGyvRp/vK9fggvH83ABu57SsUEsqb
         Hcqj49LkfURsE1RfsIcLnobDx+YEmFWAk4otHBcOId0ELiFkKfjkEL5NkTQ+IvlStGJa
         oRAg==
X-Gm-Message-State: AOAM530prlbmQFHN615dCMZatJd5PZWiVgNtNC/emFnVi2ahIK5ywNxa
        7r4wSfVsFJd0S/GbSgrlE/65VQ==
X-Google-Smtp-Source: ABdhPJwe8kJNmHKlUsT0cxlKhTdi2UvNRBLK686PoLR+14ZU7F4vYDY//SuZp+xnYzjlQuIY5G+zQQ==
X-Received: by 2002:a05:600c:2101:b0:381:2275:1d71 with SMTP id u1-20020a05600c210100b0038122751d71mr9580186wml.90.1646446388014;
        Fri, 04 Mar 2022 18:13:08 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id k10-20020adfe3ca000000b001f0329ba94csm7932589wrm.18.2022.03.04.18.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 18:13:07 -0800 (PST)
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
Subject: [PATCH v10 8/9] arm64: dts: qcom: sdm845-db845c: enable rradc
Date:   Sat,  5 Mar 2022 02:12:46 +0000
Message-Id: <20220305021247.1020122-9-caleb.connolly@linaro.org>
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

Enable the Round Robin ADC for the db845c.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faa..1c452b458121 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -595,6 +595,10 @@ resin {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
 	qi2s@22 {
-- 
2.35.1

