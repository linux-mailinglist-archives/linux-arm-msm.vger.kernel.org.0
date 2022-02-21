Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A6E4BECFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Feb 2022 23:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbiBUWIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 17:08:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235208AbiBUWIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 17:08:30 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0637822BEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 14:08:05 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id p9so29313964wra.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 14:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qImSYxU2i/y/qV71r8EFW+LTWk9ZfhM4KeM2jcTcklQ=;
        b=TNceFoUE9yqIcyXNY4dhjXbeQLk+Z0EnOYrfTUTB13uDRgADbBdUzHjyQuy/X9XOB1
         rBbrd5agJShMCL6Nlr6vGo0XpKsse50aleT1fK7/+XN1NWxgWYY/z9QVjq8wBWgTR8c2
         zVCiRpVXDj1LsCkRj/zMyGFASBRmHyBCBm4t9HPsNxNg3ixsvFQxp8dxPkjj45paiNlM
         uEjgvyjwgkGWuT/MJHhRcPhF6FwAXUBTYSB0q2+iPYBXgGmk/A+Qr4A1E5sY+5zL/ENZ
         TU+5+oMgZv1CXr4k6bC4ooBJBV7Wvst9NHqKbBBYH1wMoyN+StV/iqWS30zMr+9K8sdS
         hX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qImSYxU2i/y/qV71r8EFW+LTWk9ZfhM4KeM2jcTcklQ=;
        b=RRGuAaCnYIkcEFOR+OEqpfKf5shQ88LD3+Tc6eOL0ZUuXLs4uHeoUN69mnIHPzz5JU
         1aM7VvJ8mTKnfY8b9tBg5GrDELtwF9ohfPzIWiVmqJqzjq6FKkTFDEyGMre+Alfx8X0L
         WXh7DlUcZ8ONxrtkW6cdl31NOTVlhlIqON+2eiWE+GxyPd5BKDdNIVlpOee1OaeWQxiY
         2BctZ5SLDY2GC+DAy4MqsHV2RbisZh46x/AK5NB6OgJ46RoRffy5FKRRSZgOmymp0BIN
         QgSOv9xIIbUe9Cv0fTHetVFTL8RdLYbhKA2oSpjXuNaXHYqq5kOITQsk5CXYJsUcf3tG
         GRkw==
X-Gm-Message-State: AOAM531l2C7O5cTzyGp3GOhO6WYMZpFel3rh778syPAYC91zils81M8M
        vxS7BKLwY8mPOsVWMa+qI32mkA==
X-Google-Smtp-Source: ABdhPJxKBQ11CZJBFmQEGkDGzR6wDc1iODSZsvpp4RkvAu0slRndGzbZ6xsEUcE9iWEalXkrk5ACgA==
X-Received: by 2002:a05:6000:154c:b0:1ea:76b7:20c4 with SMTP id 12-20020a056000154c00b001ea76b720c4mr2432804wry.626.1645481284641;
        Mon, 21 Feb 2022 14:08:04 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id w8sm51626093wre.83.2022.02.21.14.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 14:08:04 -0800 (PST)
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
Subject: [PATCH v8 7/9] arm64: dts: qcom: sdm845-oneplus: enable rradc
Date:   Mon, 21 Feb 2022 22:07:41 +0000
Message-Id: <20220221220743.541704-8-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221220743.541704-1-caleb.connolly@linaro.org>
References: <20220221220743.541704-1-caleb.connolly@linaro.org>
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

