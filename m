Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8EBB6B5206
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 21:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjCJUf5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 15:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjCJUfh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 15:35:37 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37470618A8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 12:35:08 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id s20so8228785lfb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 12:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678480480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9CdoeODFGYrGacLdBit55huP4ZdNYk9faLvFA/Y6wRM=;
        b=vi6zW2x06N0yFPu9rnttoVTzA3y3MT6NP1CygUMQ2mIZbD0T5pTBQi+oj9SxNQr1mh
         h7LD/8ZP7uueKm4kFzLgtQqsK+W0O8WfNC/tSdyIqZdp0Eg/sgpzDu1nVxMKrKq3w7Aj
         +WZOMyLCJhhjFrK600WpurQLBvjS1Y544Y8oZrYqPz+55f14GTGzIq/xZ10QqsCrLuYp
         kX/Ud863bjETRamw3C3+jWa2utZWTr6A10u+GpQzmUcQy88/j4FVPm4+Uyed6qsTpuQ1
         fBbzQ8zYjAxkTnz+5btpx4gdw7PcCPrq5/Za6ymevhgCda/4lani94CIdCisD4nZprYX
         a2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678480480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CdoeODFGYrGacLdBit55huP4ZdNYk9faLvFA/Y6wRM=;
        b=5m/023NkXJvR+OkYt4Z+4t+4l4sGNjczifVF4jPW5SSmkbYqz2m8WEfyS/gY0oYZsb
         vAiy45W1vWIyQ4qbsOuPbUPbgoQ9eP8SS43rs5yDO9lIhZs9cdfXTme5D0I6z4uJopBO
         Lp3RNIWv3jtmfjkhFNv7mZrt2ONcyWPBI3HW5KCcKnjHZru4zLBLs2aLD3AfbwiQ75E/
         zCA3vLbhjNRZhDClKGrWPK3uOzG5YJL3CmimtocZjI9m5ZpXxcISt+uW9JliujjkcDAM
         cxVL5qL/27qTA7rQLAnyGOcTMm8NR5hYg6Y+K4XzmjrFeP5W+L1TYwq5QMdKg3j2tPip
         mgnA==
X-Gm-Message-State: AO0yUKWQbrL9DssAl2dMe5ZP58nCBAhS0TQDsWbQbra22KpZto2BUvPl
        Poi31mtDczUI/XXszpQ2fhL42w==
X-Google-Smtp-Source: AK7set9sVj16jFlMKVCmFBJ3zRDE/DDatq8woMrZ0SFAt2YYr6XwfYIYlh7IkjZuKs6GVztu3P01MA==
X-Received: by 2002:a19:f00e:0:b0:4db:4b7a:d6de with SMTP id p14-20020a19f00e000000b004db4b7ad6demr8057136lfc.63.1678480479900;
        Fri, 10 Mar 2023 12:34:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b27-20020ac25e9b000000b004b5adb59ed5sm84820lfq.297.2023.03.10.12.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 12:34:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [RFC PATCH] arm64: dts: qcom: sm8350-hdk: enable IPA
Date:   Fri, 10 Mar 2023 22:34:38 +0200
Message-Id: <20230310203438.1585701-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Although the HDK has no radio, the IPA part is still perfectly usable
(altough it doesn't register any real networking devices). Enable it to
make it possible to test IPA on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 09baf6959c71..60fbb2f49720 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -746,3 +746,10 @@ irq-pins {
 		};
 	};
 };
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&pil_ipa_fw_mem>;
+	status = "okay";
+	firmware-name = "qcom/sm8350/ipa_fws.mbn";
+};
-- 
2.39.2

