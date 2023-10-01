Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55CAE7B48CB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Oct 2023 19:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235184AbjJARTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Oct 2023 13:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbjJARTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Oct 2023 13:19:11 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70431D9
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Oct 2023 10:19:09 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40566f8a093so127000765e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Oct 2023 10:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696180747; x=1696785547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9kK3xz4P/eX7Le3jl9/AW07O1aDO3RSdht/nTqRVdY=;
        b=VtDVSFLm5oQrjzQFvRjQO3kqUvu04tn8pB+KcbVX1N0OjHDhhM53niIcfT78i1qyup
         HYx5BjocNNtWO9mNajxgEgdy/ay7z/oZY2jIvtZUTW476lEXLj0wq04W58Af1eXPIjvr
         JjUhW4p+QOFXkeB6pcv9pmjFfAPtudwEmldC5+/dxcL16p1vdmhvmk/TgplGM7H5vb7S
         t5rhyVUodxTW6soh5iPuXbX0+tD1f6J899Go8k2wbnPwus7oLkg9WqiF3Q4FlKZUtANA
         oWA10J4VHCfUSZ5vrvv0U6/QDh3u7rVCcAxJ6Rf4ExhrvcNUX6gPdHkXIy8GdC9ImBi1
         c0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696180747; x=1696785547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9kK3xz4P/eX7Le3jl9/AW07O1aDO3RSdht/nTqRVdY=;
        b=QPGHb0lJ8jtEEg5hPLdFoYhet1fc9IEa1W+iA32MTgdpUmpKrNZFQU53hX8KP0aHnQ
         jB1FsJah+sw/tLSe8EPqB7KTtgbUYIQy+Im6xFeTg4F9tSaQYORTIhWHsd6CnYOEcnkg
         E29HL3OCOa92VN2kXtAKxYk5R4lwob3WMy46blNn5b+h3thJWAG67bEkRBsKOuTv6Iwe
         CE95U7KjmGkY4b6pVkolNlkGStY7T2vWvpUOuwmCgdHDOauWVmJ7eD5IdYbUvy7Z4QjC
         ODxPeK7eUaHJ0zNMtpRfLwESr1QBB5/FKd/x4fGpsqSGnjs6H7c3bhGa8CMNIkHQvfxO
         0c7g==
X-Gm-Message-State: AOJu0YxJESJWcIWhu8e9K+cZGevHiAsoLDgY1y/vj1wnRheDo2LJ4UjH
        7q5JjDyAlCE4cSHlglczNzSd604OJlraKD31qJ39lQ==
X-Google-Smtp-Source: AGHT+IHIB0SpJbf0xXHuk1VkGpM+Jm6rRCg8f1bsuc4iyDLaThzDkvU0xHssP3o6ngwAk7EkNMh0Yg==
X-Received: by 2002:a7b:c84d:0:b0:405:1bbd:aa9c with SMTP id c13-20020a7bc84d000000b004051bbdaa9cmr9330111wml.34.1696180747646;
        Sun, 01 Oct 2023 10:19:07 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c294900b00401c595fcc7sm5613042wmd.11.2023.10.01.10.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 10:19:07 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 01 Oct 2023 18:19:04 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable
 flash led
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231001-b4-sdm845-flash-dts-v1-2-275a3abb0b10@linaro.org>
References: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
In-Reply-To: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=evdVYIXgQSOtBTuRnl5BDevEMjhQURNfxR9UNO8Qn8w=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlTJVRyhR/fmTj3ed+VE4qI8v+tH7h/bGC0efcEj8X/Lx
 ReB6z/YdJSyMAhyMMiKKbKIn1hm2bT2sr3G9gUXYOawMoEMYeDiFICJmJ5lZNjRkB7558qeWbPm
 zsvW2rOuK4DrZv2+S3pCEyYeYHo3I7eQ4X983pPbFeHXKko9XnBohmWI3o4p814XGhqvnyv7SFG
 uZQkA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Configure and enable the dual-tone on the PocoPhone F1

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 93b1582e807d..617b17b2d7d9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -355,6 +355,28 @@ &pmi8998_charger {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pm8998_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.42.0

