Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDA3515835
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 00:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381407AbiD2WO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 18:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381391AbiD2WO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 18:14:27 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27024DCA95
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:11:07 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q23so12435374wra.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A9tCTKF5+kXpD3KU1TizjXB5qBDuu3jOgxCWOB2yXXk=;
        b=KkrSwDChfgM04Mnzz7vJkkecpJiTPHpf1QqkE0Mj9miWts4vhiRQugah7tFTYsgl6w
         d6p1uI7W3+KAuxhvEmPgw5C5zEapmdklUm43WOP5uZt/JT64DKCV3V/ME/T7/1kVu0xq
         tfkd+gj5NYYGCQYZHfzf3iaOLxLWjzQWJLkpIoJB+9b0+HFNtVzBpg6e2cTPfZU4Id6n
         4ko4wzdOGkrn09RjiNsareu8JF0rqpGgIyH2lSkMSYs006IAHlxfM+wdbNvM7bfDL2cu
         0aV7Eb6jF39sOEMc0bU/tW9J53y3gREVx5mo/i54pTIyjm3dQ5QfsK6/vzIGW5BLXStT
         0Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A9tCTKF5+kXpD3KU1TizjXB5qBDuu3jOgxCWOB2yXXk=;
        b=cuMJu+Xa5FVf2VuRAXa1/C4ZY5bRAb1nsiXeCNdDL7U7cBRbGu0gjW3BUroRPJhCg4
         PC+LdnL01MD9YHiOwUZhgXK4/YN/WOixyHVBdW7rJy1qGYm1Qz+1XHzPM/12WWsxQR8n
         rybVyNPlt/mXTV/r4PCEB9qP/05J2OEBvNj/ZN2xr1QAj1ivqG8INGQJYcrTeblYFWY1
         On2/x/jt7lxlSZc/ru/kU7KpUSQTvQV6fNadxnNouxgaYikubJmiHsNHppTbaYS8xGjR
         q5U65cAkb6nd/aaT7kq7YDZIJ6VzRRZt09TPFoji9LNk61NoqX9m6H2mPHC8c2Jpcy+x
         WMcw==
X-Gm-Message-State: AOAM532rRY+kSvzLCPejE9CCBIOhWooCDKXi8mVGbjxBGEoMc8HOPFL6
        7q6j1OPb1pJxj/pKeukqHo5Pug==
X-Google-Smtp-Source: ABdhPJwbYCYtWuSJRc4/Cm77+eXxkqueU+3CnDeUF3GwcvXsoEBv6m3gOIDW0GgmHp45US6/tzzk+g==
X-Received: by 2002:a5d:448e:0:b0:20a:de9a:a7f3 with SMTP id j14-20020a5d448e000000b0020ade9aa7f3mr837603wrq.129.1651270265715;
        Fri, 29 Apr 2022 15:11:05 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id q7-20020a1cf307000000b003942a244ebfsm291985wmq.4.2022.04.29.15.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:11:05 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Jami Kettunen <jami.kettunen@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v14 09/10] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable rradc
Date:   Fri, 29 Apr 2022 23:09:04 +0100
Message-Id: <20220429220904.137297-10-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429220904.137297-1-caleb.connolly@linaro.org>
References: <20220429220904.137297-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
2.36.0

