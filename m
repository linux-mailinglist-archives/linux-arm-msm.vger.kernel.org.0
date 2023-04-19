Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB776E8350
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjDSVTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjDSVTJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:09 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B537F6E85
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:06 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id sz19so1751302ejc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939145; x=1684531145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ot+kluXa878vBfmqUMyXkIy7tIL8gH1qDXYW4gOUqxo=;
        b=qxhJ+nvw+TmAb1tl47pR8sZBgHVlXXr/Mwfnu7wMwVBGjUQgqQOufdXrTdGTlRxNe1
         Vq8iuASBCTDdqhj3wY/qavvvRfGVKvHwBI6s5Yz0xLSF5QWZ8gdRO7E8daJxi9R3r9ZL
         KBwFpew3Z2CkIiP78jM672zVtX/xTNHtnCheLC1EVcFGyoL3IlsfkzRNuhqsItWg15/S
         6rVPgbdAwYTY7PvFDMnW1diXg413lFi3dV6yG1eKQNcHn40bMw8hOdYG/agME0zxlwDj
         lgf3fDNZXttAih3QudyuVRu8T6ULhBsVoUDlE0U1pzxRsjtxaszzkTCThx63KSz5B3UM
         Tsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939145; x=1684531145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ot+kluXa878vBfmqUMyXkIy7tIL8gH1qDXYW4gOUqxo=;
        b=ajAYNpSNr9Jq/9pVy8RjXculu7PwJZHxxjcuIBF0MSqF1JbY9PDpsb0YfKhsfre6r/
         E3jv1FEJEhY9gv/fOodfEOwcGHpdFlCQfv0JMa47p3TB2pbQ5WPK+oX5+FrAJOrJVh5R
         zgzTxgEht7GTojJ0gaL+W9WevpfJFIdoPjhzlWU25OAP16kUgEVyUFzXXT99SuKk5zBg
         N/hSymCjjh8eYpa/jkAugOMCsG5+g31/Gad7Hv2vEHaIO8xan1mDymL6CJsupNLxr1dW
         ghzGpdTiqv0wX0kNpb99M9CNCPjWgI25PkrEbm7P0e4FFr0UTN89MRXy7E780hXzifC3
         eCWw==
X-Gm-Message-State: AAQBX9cgRvMiJsFDEJgL4qOdQlHIN1cgfntAxzYx+2VF+iSvF9T75ykL
        UrGoNUd/+TiiaRTkZPMVv/gotQ==
X-Google-Smtp-Source: AKy350bZrcsrDqDIZHiQL1KMP4/cuI6uo2tYMN1WXeraKKZzG9xgeGdHv4tIwq1OKK9tfDXDTGVA5Q==
X-Received: by 2002:a17:906:1c49:b0:94e:bcb6:5f31 with SMTP id l9-20020a1709061c4900b0094ebcb65f31mr3575135ejg.20.1681939145081;
        Wed, 19 Apr 2023 14:19:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b0094f109a5b3asm7092739ejy.135.2023.04.19.14.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/18] arm64: dts: qcom: msm8916: correct WCNSS unit address
Date:   Wed, 19 Apr 2023 23:18:42 +0200
Message-Id: <20230419211856.79332-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
References: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Match unit-address to reg entry to fix dtbs W=1 warnings:

  Warning (simple_bus_reg): /soc@0/remoteproc@a21b000: simple-bus unit address format error, expected "a204000"

Fixes: 88106096cbf8 ("ARM: dts: msm8916: Add and enable wcnss node")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index f6ccce0dad4e..bf88c10ff55b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1871,7 +1871,7 @@ usb_hs_phy: phy {
 			};
 		};
 
-		wcnss: remoteproc@a21b000 {
+		wcnss: remoteproc@a204000 {
 			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
 			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
 			reg-names = "ccu", "dxe", "pmu";
-- 
2.34.1

