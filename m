Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B70CB78439C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 16:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234799AbjHVOM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 10:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236641AbjHVOMi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 10:12:38 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D7FE58
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 07:12:16 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31c63cd4ec2so463455f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692713491; x=1693318291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtuVpXwzMWaEGB5Cog4rldjWRfctqtTvAKEr2qA47a0=;
        b=jrsLu4OK5YNUPhALPL0I23aolOPR0gxWLbx3ArwjKaqJFKr7lrHWqM20Cw/SCIQEAt
         EK3RpfCgATOkdJZeCsUaPyXXPOI81zRnRt86ZQ9+vHZUNc0N1GKQ+wwOZO8XD1fE39NM
         r7IiKKjFomA51ccrBcdxBPsKW/q4tAywISe6wTx9f5P9iA/25oN9i40H/gv5lmB2tpG4
         A5DO9v2/70CIeNC0VkpHZOXd6h6X2cVK2gMOiJnpRBMTCpSM2AN9HY2/BdIMNoYkOTLr
         NgxVq2D0hT0JvAbJdvTvfOvCAMsNs3VQYRH9wC9kaoQT05RLp1gdb67xqmIX5b3rO2X/
         g/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692713491; x=1693318291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtuVpXwzMWaEGB5Cog4rldjWRfctqtTvAKEr2qA47a0=;
        b=DU1vZRRqSsI6uMoCY+KjzP8k0NGZD7FLLZ2OQt2gZgb5w7wuc0XYO8nSQ3Wg+h5jhX
         EixNcdwjhiOJHI0migUdWKZyrOMv/e17fKloC3W/ljWY9ky1jn6fnLvkvFWIbFxYUUOy
         hWBQD6H9WuUDymqWe6vuUzNDsyZ7geIs1ISYa6Fqp4Ca2D2HXb/EEgIT5s1DcL519XHf
         iYVljxBZs+jP2QFJntChzkPEW2RRjH4moWYt82xup3vNowoBM+i70tjyjw90CSK5bd57
         V375CIv29cFcwb2mPey7YHVxvzTls5N9Ut9IFQcaeiI6M0mSxoOOUffeGSxK0tu3IDf4
         Ibbg==
X-Gm-Message-State: AOJu0YxuPIdAuGlJUdH0h08b6J5uDO0ytfZdxswpY8xlAGQYES0mDY3g
        i6yH+fiDVlblsSVgHvcusRcvWQ==
X-Google-Smtp-Source: AGHT+IG3axjvpue4qJhnlyhDa9rG2BdtfVF5SwL11Xk400+vtf82q0540IzXmG0em8nbpnu1dvRaOA==
X-Received: by 2002:adf:e6c9:0:b0:313:dee2:e052 with SMTP id y9-20020adfe6c9000000b00313dee2e052mr7424653wrm.26.1692713491002;
        Tue, 22 Aug 2023 07:11:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c280900b003fe539b83f2sm19587753wmb.42.2023.08.22.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 07:11:30 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 22 Aug 2023 16:11:25 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm8550: Add PRNG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-topic-sm8550-rng-v1-2-8e10055165d1@linaro.org>
References: <20230822-topic-sm8550-rng-v1-0-8e10055165d1@linaro.org>
In-Reply-To: <20230822-topic-sm8550-rng-v1-0-8e10055165d1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OJpdRyF5Au18OAODNZEy6fBEK+Vc+azzodyRiMN3bls=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk5MIP76cER9EmyxruqX9NYGR6Jn0RJnTMzyheD4Ut
 zX0fxUeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZOTCDwAKCRB33NvayMhJ0RK5D/
 4tNEi6O+SlSFOeJZvyWu1fzMBWkKIizUTOm7fYnRQ6HuLks1bVXeo7B89Mh9kQU5IZEhy0NWVe27mM
 UINmm2mFfnO55TvEWuDzMrYZK+vbMebZgpP5vif56SjEBefeasFElXR2WFEc7Vz8M73tYVRIBdn6gN
 8cXCbu1BzW0NW11RXY9r2ohM3V80Z/EsqXRJac83wboswvVIJnvbhHtHiLKaQ+AKS2TqrAe8qpF2nZ
 G/J4lu/dDFtAn4gVScbCkFlQiFDwLZgwpWhqe8ILkzEmQjLy+VFzeUlCRp7nBGsLED2gWA0BttHItC
 vQUzPJEkE3gu9mCCu50LMaJPqEqT7FFEZskGvV3XTgUB/kEdHQgu5c+RVEtUG09wK4ObAcECxMnWeS
 H/3qkHqK/h2Hunc6BIWSpDa401wht9+Yr2Dj08Ibuz6f0YkOPhdKSOh7Q7MKzwun8QL1MNr+xt25GV
 uuZoL48R90MJbqr0FClxYajfI9DvQJWLclpyKJQjccQzWR3/uAMW2TvaPmzUpHkCioVJBgLI2IWFx/
 +bAqBsN9w9qqlpK5tQ7OG2T+H85Rx0ciL/lGH2IAr3kkZLw/8VVbjyBNp2dIbYoqL26/ondxjOfy0w
 wZRT6wMn0+79AwOyS6G/aUwJTuSLGzjhp4RUPzDPqKQYIam684Azn59PKRNA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the Qualcomm Pseudo-Random Number Generator.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d115960bdeec..643ec80feacc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1661,6 +1661,11 @@ mmss_noc: interconnect@1780000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,sm8550-prng-ee", "qcom,prng-ee";
+			reg = <0 0x010c3000 0 0x1000>;
+		};
+
 		pcie0: pci@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-sm8550";

-- 
2.34.1

