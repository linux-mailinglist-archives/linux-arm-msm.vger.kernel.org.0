Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C590D72C9D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 17:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239610AbjFLPXF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 11:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239589AbjFLPXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 11:23:03 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7C3E6F
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 08:23:01 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso46525995e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686583380; x=1689175380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaTNCraedRCnPAddnekC6NMX5SCDR9ZdFC83tjFkdCc=;
        b=xMX6f2se06aAVxeM55hya64r2QX0YwbOvy3GusZWZ1oOmuhehjtTGK2ADYs6Tqnv/S
         t3DTUxemhtXn3izJ+8kQLO9XhMMTOfvuI4/jxXBobn1cwgCqY7zBIhvKxdV41RxEEfQu
         gQfSRzvp0mZOAYH//HAheBjjmSZLmw8LNdzn4hpsw1SQNTZgG/SzszLrYtHDNfOrZ+VF
         7BiTWh2FMe6Tb1Gu6BJolihrdAXyeNLbDRfQTzyxxqhYwaSGAVoR/0YKbNp7cCd0oFyq
         C5fmi1ejHTBrXYnPBuOQTr/ADUSdSRzmEZsnTc+gkoM9oLqjNcCLIhh0S2WgBXY8jMqt
         upNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686583380; x=1689175380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaTNCraedRCnPAddnekC6NMX5SCDR9ZdFC83tjFkdCc=;
        b=LAg+SO24TZ1llbDiRvdvQjutwW8E28MVYQxt+Y0ot5UH1kBhU0sJTBby2u3RTi115E
         3NT7hC6n2NWZx3msoJbwpDHoMPc6cbJa+ixlpmSZIkgkZQKnzbbGOIl//dsGwNu6Izy6
         guBGXgUlzztrBBraIgRKoIj7iIds1My85w/VonIxEcowDqR/ttG+gy6rK9CV0Net2F0v
         HcCNOJ73/to7DyyyK+V9u3cw3IglOiKxgkeCgOCiRTXE/wYcFxl0VMu/Fs4Cujxv81g9
         x8Ec8uqw+SK1h383ziWqddxhwZyGPGyrE00RgrNaIwtwNliWlsZwoxbcMSbcut2BjX+5
         i34w==
X-Gm-Message-State: AC+VfDzsc/dDleIAR8LTdYQUhcVhztyu70+aGpSiqCuDA7YYkT2aZfs+
        YCelMTvfeNuzOYQN5jIMa7KM4LEU58emqe0W/tuZXw==
X-Google-Smtp-Source: ACHHUZ4OFHlmxZeOYSjJBxerrVzuBYbHCN+1fB5MRSrVySyN/2YDar85F4nXBH2OB85iiUn6j+6g5w==
X-Received: by 2002:a05:600c:2204:b0:3f6:692:5607 with SMTP id z4-20020a05600c220400b003f606925607mr7400328wml.40.1686583379689;
        Mon, 12 Jun 2023 08:22:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l7-20020a7bc347000000b003f4248dcfcbsm11876512wmj.30.2023.06.12.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 08:22:59 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 12 Jun 2023 17:22:51 +0200
Subject: [PATCH v4 3/4] arm64: dts: qcom: pmk8550: always enable RTC PMIC
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v4-3-a288f24af81b@linaro.org>
References: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v4-0-a288f24af81b@linaro.org>
In-Reply-To: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v4-0-a288f24af81b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9trx9Tp4WXjEe0208eDY+ogw4Uj5lKhGWDzUscoQQxw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhzhOvjeF5O0UnRwC4Q52+7ERrOfGLQUeGAId95G/
 Euxu3yyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIc4TgAKCRB33NvayMhJ0aHYD/
 0dl65hz+o57gB8uvXwFiwQUOafkWtbuvVpagQjTMiKykTfmRwjhFrXZ8ZU/e4HTuvoyxHxlh0zp06x
 lylX4hPyOKQ8qdh+v4/5+KY9TjcI1xtDoHPT/+IUoNUfQDusiv9kvx/z6rY5PjBNu36/dUvizg0uft
 unjZyjVPFyPU4h7aa4kxW2khihd82/MKWSWK6Tv+HoTGbSY7H+n4JqJmGzkPNQEJM9x2xkWD8hBvdg
 Utfl+SD2UaakmXvuTclr+bzwIz1k6OcY21BTPCYSOu2ttyQPwiUY/S6NSolYoac5cV2rrgz+qdPqEC
 WIMKxmD83oiBBD+23v0fO49vSBFyC+iAfTwmFTL7XAUejHlp9X8xECBID8PRd+DfzeYPBlgxqYJbsP
 DQF99zNHufdvh7uBVw/+L1WxZwJBFa29SOxlMJ6VhlfeS1ImvA9pCo6BgR7d6K2QPMwEg89C0PNy8E
 AKDGYaOYEJSKe0CqlGztkTCLwuX48unTtliTPrmDiRZKSpQf/TQl0faPFMDfH0kxM5yCIkA2OTrTOr
 qQFfOiIscvi37HAhxPtHd06Z4jqBGR5L6sXPm3Ps0h13FItZfxxRa5u4147Yak5xoxaOuDLqpgXIAu
 AjZ6rzlPdYNGFfO8dXXofG+4k4e396bagSPTQkRtKOY8jnE6MSIoM3op7HuQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's no reason to keep the RTC disabled, it has been tested
and is functional on the SM8550 QRD and MTP boards.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 8c897d4fee29..c7ac9b2eaacf 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -49,7 +49,6 @@ pmk8550_rtc: rtc@6100 {
 			reg = <0x6100>, <0x6200>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
-			status = "disabled";
 		};
 
 		pmk8550_sdam_2: nvram@7100 {

-- 
2.34.1

