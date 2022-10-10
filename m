Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C68FE5F9DE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 13:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbiJJLrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 07:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbiJJLqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 07:46:35 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3A457E16
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 04:46:32 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id h10so6942934qvq.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5hMN0AShy2iBlveQhyBkxGJolgv+xG6vrXT/lkbIvU=;
        b=RA7bz48A0fK05FT4rAM8zEboV7OsQuNPAErJ0KbaZzZvxO2TWTA3vwUq4ajIKbBzhS
         7EWRXZYdEZzLln3008G+lPIjRwSyRT572MNrpPtatva+II89vbvlp3QTxsJhpUfd1fHy
         /wgUjciIB4vY5nWqorE7w1/CAvTsDK9wP92muHGjmxe6FRGhoEH/Ky1MHRTElOy9R9Bu
         EuMsSmVYcwI6RGFA+kipg/fqJIx6zh00UXjhyOo3oS8HMerjxBMJkQrOUPNV/O1ycttR
         Y9KNB7ipYDxscRW+Cjhe14lirUp0zXMRmFzK8W7r2jMXGCWcQhUsQKwqj4NU/BUqZsOB
         ifKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5hMN0AShy2iBlveQhyBkxGJolgv+xG6vrXT/lkbIvU=;
        b=4I5XohMy3hKUtynV/iozzjmbaiWxnY4gxjO4cUH8XsWTkhu6WhIx8ENwYd+S1snR2t
         Vibk3PxAgCswwEaXKfIs4A5XU7JSdSbk3SZpE+rJkxrGTgAVXVaDvZA8IJScEY/FqfEk
         8kzMq7t1MOfzhZ3wl2Hg5YFA3+dW+53aA5OmWKIA6vA6PED4rjik5U5UACzSHIkqPwGf
         b4qWZY8Dz0dX1GuxcL3EWzOj9ZYLgAIWGyDPBGQfGNMxtBEURXOq4+CSLFKVVVAD2l14
         merFFByUe5IlE7QOFZo/Sg3ju1QXE0jcw5RaYy1F/14uAuHK/24JgrTbfgknFcG4w53U
         GzoA==
X-Gm-Message-State: ACrzQf3NCT6HCMHo6iLUmtbZp51zRxVv5xBA0N/1MaufE2RqeXb29Qtd
        xb9Z6BBRHtoRWdijEMz4jwI5XA==
X-Google-Smtp-Source: AMsMyM7NYDPlnuFVi7kv4exVXiPLFWMbSifoAadJIpEoLZjyRpqDNKNq0gzeWcHIeV0ezEBK/PiJKA==
X-Received: by 2002:a05:6214:508e:b0:4b1:a7ae:f5a6 with SMTP id kk14-20020a056214508e00b004b1a7aef5a6mr14175621qvb.28.1665402392179;
        Mon, 10 Oct 2022 04:46:32 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s12-20020a05622a178c00b003972790deb9sm6698707qtk.84.2022.10.10.04.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 04:46:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Xilin Wu <wuxilin123@gmail.com>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/6] arm64: dts: qcom: sdm845-xiaomi-polaris: fix codec pin conf name
Date:   Mon, 10 Oct 2022 07:44:17 -0400
Message-Id: <20221010114417.29859-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010114417.29859-1-krzysztof.kozlowski@linaro.org>
References: <20221010114417.29859-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix typo in the codec's pin name to be configured.  Mismatched name
caused the pin configuration to be ignored.

Fixes: be497abe19bf ("arm64: dts: qcom: Add support for Xiaomi Mi Mix2s")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: Molly Sophia <mollysophia379@gmail.com>

---

Changes since v1:
1. Add tags.
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index afc17e4d403f..f98259489679 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -628,7 +628,7 @@ sde_dsi_suspend: sde-dsi-suspend {
 	};
 
 	wcd_intr_default: wcd-intr-default {
-		pins = "goui54";
+		pins = "gpio54";
 		function = "gpio";
 		input-enable;
 		bias-pull-down;
-- 
2.34.1

