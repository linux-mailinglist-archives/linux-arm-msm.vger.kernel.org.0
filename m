Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3FE681589
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 16:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237461AbjA3PuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 10:50:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237166AbjA3Ptn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 10:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2006941B62
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 07:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675093730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=iK+zUbg3IfyivImjOtAAZPRNA3nl2U9KaOpRKvRLj9U=;
        b=IfJVxzlNfdFyKgRp1cEq3wAwRnuLo8qbEUqBNJ4Uw+hxEI3MFlWPoO7YrCC0RrVCrV1Vnp
        n6WxwtgjIRnQMhxYSyCFnXMZ1V9jRLsYEHRzyYnsOeeerA1YcaxJU29NGe8wVQTYC23XCP
        QoB0iV8glLDmWSgP8lM91reY/A8gKG0=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-BTa62y4gMsyYURBA_kV1JQ-1; Mon, 30 Jan 2023 10:48:49 -0500
X-MC-Unique: BTa62y4gMsyYURBA_kV1JQ-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1500bc69a97so4187497fac.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 07:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iK+zUbg3IfyivImjOtAAZPRNA3nl2U9KaOpRKvRLj9U=;
        b=RMXROPfVWyyCOG8PoZKLXvEZ5LWYFxoQ0+bKODbK1EBQUrCfgGbX0wAKJeag3FTtAn
         2gac3mtLQVhXVAxp9ELemAuZfcxmbcntIU8VyVEZKOPPgtw3EPmatyEHRE6G1CKMBkf2
         KrMap6QMk/opzjeKc6qMGh8AzMQSjDr+P6lYGXB3fFZ9S7p85cKlCcYeC+NlYv+qFbli
         QMopRg9kkOJnEYxdYvSXwfdCa43diDAoUoZRGFP7ZoV7uNUemAtzuFFkuMyV/I/u4qx6
         kJB5rz7P4LwQlx2UsATyxLh+ZRdIGrnOkbCmUHmX3+id7mNiONWx5OvWHnjcf0I/s9/J
         DoAg==
X-Gm-Message-State: AFqh2koTLgI9ZuAMWGlPExP88xZYVvy82GwpCHr/8zBTxYrvX/OQwPJf
        Fv33i16KWvA9mtU7hDZ/7XMsWylq9dw7oGKtLHkkJSIEJJRvbhJL4KrSmiEqGRWnJtovDSOu5fN
        7cw7CpLWWYsZ9YygXcB0FQJQBRw==
X-Received: by 2002:a4a:8c68:0:b0:4a3:aa96:23c7 with SMTP id v37-20020a4a8c68000000b004a3aa9623c7mr21645477ooj.6.1675093728223;
        Mon, 30 Jan 2023 07:48:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsZlKsW4UmOUh6zsAp22dbVWH2s79oinxhwudtqXjMDouXPUguT+G2PrV8znXbFRgCyFddmFQ==
X-Received: by 2002:a4a:8c68:0:b0:4a3:aa96:23c7 with SMTP id v37-20020a4a8c68000000b004a3aa9623c7mr21645469ooj.6.1675093727973;
        Mon, 30 Jan 2023 07:48:47 -0800 (PST)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id h3-20020a4ad743000000b0051763fef75fsm2137688oot.37.2023.01.30.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:48:47 -0800 (PST)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bmasney@redhat.com, quic_shazhuss@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sa8540p-ride: Fix some i2c pinctrl settings
Date:   Mon, 30 Jan 2023 09:48:22 -0600
Message-Id: <20230130154823.117542-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some of the pinctrl groups were invalid for the selected pins. Select
the proper qup group to fix these warnings:

[    6.523566] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio135" for function "qup15"
[    6.535042] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio136" for function "qup15"
[    6.597536] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio158" for function "qup15"
[    6.597544] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio159" for function "qup15"
[    6.597991] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio0" for function "qup15"
[    6.597996] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio1" for function "qup15"

Fixes: e073899ec3e1 ("arm64: dts: qcom: sa8540p-ride: add i2c nodes")
Reviewed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
	* collected Reviewed-by tags

 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index a43f831f9018..6ab4b435c49e 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -318,21 +318,21 @@ &xo_board_clk {
 &tlmm {
 	i2c0_default: i2c0-default-state {
 		pins = "gpio135", "gpio136";
-		function = "qup15";
+		function = "qup0";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
 
 	i2c1_default: i2c1-default-state {
 		pins = "gpio158", "gpio159";
-		function = "qup15";
+		function = "qup1";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
 
 	i2c12_default: i2c12-default-state {
 		pins = "gpio0", "gpio1";
-		function = "qup15";
+		function = "qup12";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
-- 
2.39.1

