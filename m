Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D086B5760
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 02:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbjCKBWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 20:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjCKBVz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 20:21:55 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E94132AA7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:52 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id t11so8958935lfr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678497712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMJx84Cz95X2op3j3pyAbly9vRkvO+fvFdqYsVQflE8=;
        b=m3Q1rywjUx1+AaAm5VEuEaYh/D+hmyBAECbnvNFOYp5IZl4naXEqxD+57q3QgFtwWP
         vHtNunxnV4QNoXloPm7NPnBFGTiT2TV/7NlQiBKv2ljftQr2hUZnIFlYyBrs7vOglYK7
         xqhJl8dja59tWiYQpagdH2Q9gJ9tiU/irNVNViFyHPy1foa0zo+Mn6jUzh/R/QhEKLFm
         PV7dhZUJuq2zQBsQ8xUt77Sdz1wk++CbvZ5FNLLAA4wmpEqdDMONDncotIDcjjiqpCDC
         V49LOs0dddMkOmEH06n2AwzAHr+KVyhHPSKdIOOB2pQhZRgfmzV299kDcxxY9mrm9tm9
         zisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678497712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMJx84Cz95X2op3j3pyAbly9vRkvO+fvFdqYsVQflE8=;
        b=HM8Mwhnf5HS9u5MwPk6bA5XcLjHpSOfVDL8spigz032pEd1BPhVF7pj6XR+3CzB1h3
         lFe9KKYWCyxSEtEXVWoMwebVxqBNX3/WyE73cHvYgMyQWBcNkMFqvm+o3YEy33evz9wm
         LsMjN+gYKl+VaOi0rwONGKdO1TLyjCYOJ49xR1cGS6CJafe1delw8q7ZgDZHzNRzx1GZ
         2xKYXLQ5MPg0AGtyYQBTQ+5JF6agJvDNhlxLTYrndejeLfL75gyYEPtKBGJMSm7a3WP+
         J4qB0qVKitjKzy04/1U8EhnuW2RYuNQAxSwg6VpDd50hp+56o3kph024PR361xC6g7tq
         aZAw==
X-Gm-Message-State: AO0yUKXTfGvqhlbMywYyJOp2PfLVihAaomUfqrM6/asS9B+IFpEyjQmq
        l13PxBlMAEQvH9T/kdrSD1zVcg==
X-Google-Smtp-Source: AK7set8OgrdGrRcfPTKnhf9v24OK+atHulY0JtVNNIGkAn/RpKNI5uTmx4PQg8iGeyf1WrDzGhALAQ==
X-Received: by 2002:ac2:4a65:0:b0:4de:d16f:3938 with SMTP id q5-20020ac24a65000000b004ded16f3938mr8979969lfp.53.1678497711961;
        Fri, 10 Mar 2023 17:21:51 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id y26-20020ac2447a000000b004db25f2c103sm142318lfl.86.2023.03.10.17.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 17:21:51 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 11 Mar 2023 02:21:37 +0100
Subject: [PATCH RFC 07/15] arm64: dts: qcom: msm8998: Add simple-mfd to
 rpm_msg_ram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230311-topic-msg_ram-v1-7-e9c2094daf09@linaro.org>
References: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
In-Reply-To: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678497700; l=698;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lBjM7e71S3nptNVLXpXO7/oaBdna3rhesdSFkhVdhCg=;
 b=wxltn5knKDYzriNske98QNLS9/+8AoU1Ra0cy5dSsPgShI+uOSfYtwjwlOgPKapP8qBhliUIN0+u
 W4FYv5agD33r8ZJFgbvw/j6OefvmeK1U7h/jwo+BQweqfGeDC3Gz
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing compatible to make the node compliant with the bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 8bc1c59127e5..6efa1bd138bc 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -833,7 +833,7 @@ gcc: clock-controller@100000 {
 		};
 
 		rpm_msg_ram: sram@778000 {
-			compatible = "qcom,rpm-msg-ram";
+			compatible = "qcom,rpm-msg-ram", "simple-mfd";
 			reg = <0x00778000 0x7000>;
 		};
 

-- 
2.39.2

