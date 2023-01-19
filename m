Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48414673CAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 15:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjASOqr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 09:46:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbjASOqS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 09:46:18 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510968C91A
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:43:34 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so6261520ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SjsBNMpD4lZAQm70QlBxW7ORK3Yy/nXIpNP1UrfVfI=;
        b=RPWI3CM2kjPcSfl13sUQ7vn8lWKboXorxsiuNW+wn6crJkRE/ul1u0E/TTvKK/YTyz
         ErEE7x6dH0839U1IPasUeVBM54g+r0m7YdAmDMlq3obYdJ3vkxaoqWF2xXVaUT0IIRye
         NndvlOLutR2hSUSFdIAKwA9Qe4D1SZfJAlTA5C8ARAdPpVhniKdTmklzJb6+RiZ51UV1
         Qk9eQ9wMVQxrB0d/14AJOou2woLdZPzytgeets4hDlyZ84bkbC6cNxRArcxzC0K8FSDE
         gN4AxoPuZ1fJ2LvDqOOoP1c1tvsn/ulz1u5w9R+MsP/CZMToaQ0ls0IohvxYlNxBSvG2
         4GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SjsBNMpD4lZAQm70QlBxW7ORK3Yy/nXIpNP1UrfVfI=;
        b=boTaEE1/K2NX4X56LW96BRb6Pu2G38F1MtzFtiJubssM0PxwC2JcG7fs7Ty6UmJpQv
         iS6bGkfCG6p8+iGPmx9HACShjE18nOAQDVItJC9AcrDYySyOx1CvU56cprQ6B5ited0a
         76e1pl6AaJaINq1PkFof457jPBjxXFNrwqIA0/qO3/WbOvmRZCM8Q8SvtEfnPphAw5pq
         mcz7ptqnhorSqhE3WU9Zdq6AFeT0nrhw7uXp30gCK4GBpNzQUAx2Jx/O5xSzMZmznFnl
         1XCivsB6kq0/cnew8hGZ2h4jfUfadC+R8B+Tqb38b8zoJKW6l7hYU2r2cWbjI3mycfYG
         8d/A==
X-Gm-Message-State: AFqh2kpUS68hanqbIOgVS4EYrig2591NhM46Bc4wJR/BDSJk7jJhXxmC
        oyyKWLmJzsvSFy6gq16UD5D6bw==
X-Google-Smtp-Source: AMrXdXvFKWEUSD94XSs6bCoHqhRdPLttSrOIIiZQ0FY8j9hZ4PpgLaSGE8/M1Z9Y3wVkY1THHheeOA==
X-Received: by 2002:a17:907:9620:b0:871:2051:6377 with SMTP id gb32-20020a170907962000b0087120516377mr15201852ejc.60.1674139409664;
        Thu, 19 Jan 2023 06:43:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id fn4-20020a1709069d0400b0084d4b907ff8sm13434169ejc.120.2023.01.19.06.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:43:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: msm8996: enable UFS interconnects
Date:   Thu, 19 Jan 2023 16:43:26 +0200
Message-Id: <20230119144326.2492847-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119144326.2492847-1-dmitry.baryshkov@linaro.org>
References: <20230119144326.2492847-1-dmitry.baryshkov@linaro.org>
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

Specify interconnects to be used by the UFS host controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 55180586f7b6..0c2f7be9f205 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2037,6 +2037,10 @@ ufshc: ufshc@624000 {
 				<0 0>,
 				<0 0>;
 
+			interconnects = <&a2noc MASTER_UFS &bimc SLAVE_EBI_CH0>,
+					<&bimc MASTER_AMPSS_M0 &cnoc SLAVE_UFS_CFG>;
+			interconnect-names = "ufs-ddr", "cpu-ufs";
+
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
 			status = "disabled";
-- 
2.39.0

