Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467F740DDB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 17:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239051AbhIPPPG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 11:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238744AbhIPPPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 11:15:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF79C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:13:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x27so19955029lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zi846OD3RMcSceK5/ctcYWx41HwaZF2W/X9KN63E9rI=;
        b=D3zl28+TM2Pav0oRO8fI0wB423gAQ5GTZiIj5hJhseuUZqS2emaJ1qeUAHbr9zcYpK
         wJ1A5VJ9cvq3wywDNiKK++2nHvEEFDF4w5fYq7OKD+BCC7pp3IkZyM7PuqkdwBcLwl7R
         xKnJMQSt+dtpibTfZCoWweYPuI/x9Ip+X0HdX2mQ9tsLm1Eh5Di1GDqr6UVZAs+30eTY
         Li54wQLMG7oSfCa30gsLtqmp5sOUwVsFRE6jHpMLZNdiqe5VR/zYWXjGFY9gd/oV0lvR
         XPvNTW65wtJvJmwvWtLnwFSjY0XPQCkLmNwH7GuUbOIcphZLjLx9fFKpYciv0OLNJMGo
         dw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zi846OD3RMcSceK5/ctcYWx41HwaZF2W/X9KN63E9rI=;
        b=VFjqU8O+XTKsp9dJmY95dbC+In3K0FGatq/lUt/lfDnYBnpaby72UYyGD+Ev3dGebp
         m3avnQVw5GTdi1IzIr8wV0WBqFz4B3hn08S879YyNr/eezF/pQ/ItRC7uTXRQSh6EWeE
         5HZXuEKRyEoPYyYQ+ctRp8QPIZtxAQam3G9M/6El3msZztEDyLFiRc9xFW04RR8nvpFq
         xJURiCUmWnzFtw7s7IxdWCRQvhQ1FTK2vlN2WARZGzsWkHuieaPdmWsL5MdAavbuGMCS
         m6V8E/FyUsNnX0YJJxwFCZlyWGfKb6jNmDqvQLFIyUmxM3CoJ2O5OuGH/JDirn8yLsQN
         A9MA==
X-Gm-Message-State: AOAM530nop1QOrp+eKqfwAH4LwJSXnZ3oP8NaCpA9imF5UQk7q+KLY6o
        2uAWX4atTISXm1RjKST4EMX/3g==
X-Google-Smtp-Source: ABdhPJzPwCkNxt/34hcMGfgZ2jFy2TZDzi+K6vSFTdknDJFocx0KJSquEC/fJvS15LDi1WLln1gftQ==
X-Received: by 2002:a05:6512:128f:: with SMTP id u15mr4680076lfs.528.1631805222821;
        Thu, 16 Sep 2021 08:13:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t15sm283799lfe.178.2021.09.16.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 08:13:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: pm8150: specify reboot mode magics
Date:   Thu, 16 Sep 2021 18:13:40 +0300
Message-Id: <20210916151341.1797512-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916151341.1797512-1-dmitry.baryshkov@linaro.org>
References: <20210916151341.1797512-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify recovery and bootloader magic values to be programmed by the
qcom-pon driver. This allows the bootloader to handle
reboot-to-bootloader functionality.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index 00385b1fd358..0df76f7b1cc1 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -50,6 +50,8 @@ pm8150_0: pmic@0 {
 		pon: power-on@800 {
 			compatible = "qcom,pm8998-pon";
 			reg = <0x0800>;
+			mode-bootloader = <0x2>;
+			mode-recovery = <0x1>;
 
 			pon_pwrkey: pwrkey {
 				compatible = "qcom,pm8941-pwrkey";
-- 
2.33.0

