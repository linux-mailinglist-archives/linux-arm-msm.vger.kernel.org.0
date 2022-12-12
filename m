Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C7D649EDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 13:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbiLLMfq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 07:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbiLLMfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 07:35:12 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC6413CD0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:34:35 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id g10so11909081plo.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1T81HxDJP60aMe8zkxEbatF3LDjVT92Yb8ZgaRaQ8U=;
        b=RbZaWt4JjHpC7wHc8DiR0ugxsqYVlSs/Ui0Tp+KU9MJDZo0efJx78afFLwZSmZGoBC
         UzhPhAktJRTlz2NIBzcfKmDVZKKu11egZcWrdK4bf/M6hbtuhL44fbEzU54WhkgUFUT1
         d4Z5SJwxmhrTa+17dD/7/Nt1BQkIilRDI6pY21zaQf4atZ2ybOLN9oHQr67QYa88ViaV
         zr7Lvt4qFgJoUjIv6bJsym10KzgGmjmFZ8vdzgF7Zv80bGeD8FUjdi+3p9e0CwmBbBW6
         PoFdCBcuDZzfnlOnFzpBJzXLo2ACL8ehLJz5KvdA1k6fqk3oN7Y10U9moixr943CGIWl
         SOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1T81HxDJP60aMe8zkxEbatF3LDjVT92Yb8ZgaRaQ8U=;
        b=1yPei1YwEXIP9G/E7W/WId1MnYmFXtecZoX6BivKcrHQXvNI/lrufa6uU4r5ddAXaF
         nKk4zvClnKQLU2XLkBnKO9nDW0hlSNFjbpk3c5gT166dRnugmM4Kda23VhTnFnJ3x86+
         rcW0l71ttYkrQd5OAlg4Yx71r4ZDx4F1athegAKK6+ahp4OtI40L7X+4EYMJ8DywmeWk
         Wz6OKpyG+6bqZtP/+A/XB9sCu71c1gq6QUR1ioMijX/TRHkbxrXZnppN1Q83BWzU2Tgi
         wh1CaV1f5Bvpz2DXdZ3rU873cnnYcvxeKMN3S3pbxCHGMN0ysjv4ACJOBebGio8nqLgw
         pXgg==
X-Gm-Message-State: ANoB5pklrn5KbI85okZqyJ9yANe/K3oas9zAUAYnl5XtXiRWdO7RpazY
        pZ6xyq+jzX5rD76AkTKtlt9S
X-Google-Smtp-Source: AA0mqf5QoseNbK6SZLeykYOD214kolF+tAQknwNU6NkDpajx8Lphd/ctc5F9DtRkmA0s7Ib+bsztsQ==
X-Received: by 2002:a17:902:b20c:b0:189:3308:9a2b with SMTP id t12-20020a170902b20c00b0018933089a2bmr15457836plr.7.1670848450047;
        Mon, 12 Dec 2022 04:34:10 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.33])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b00189c93ce5easm6252557plx.166.2022.12.12.04.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 04:34:09 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2 08/13] arm64: dts: qcom: sm8250: Fix the base addresses of LLCC banks
Date:   Mon, 12 Dec 2022 18:03:06 +0530
Message-Id: <20221212123311.146261-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Also, let's get rid of reg-names property as it is not needed anymore.
The driver is expected to parse the reg field based on index to get the
addresses of each LLCC banks.

Cc: <stable@vger.kernel.org> # 5.12
Fixes: 0085a33a25cc ("arm64: dts: qcom: sm8250: Add support for LLCC block")
Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dab5579946f3..439ca5f6000e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3545,8 +3545,9 @@ usb_1_dwc3: usb@a600000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8250-llcc";
-			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x50000>, <0 0x09280000 0 0x50000>,
+			      <0 0x09300000 0 0x50000>, <0 0x09380000 0 0x50000>,
+			      <0 0x09600000 0 0x50000>;
 		};
 
 		usb_2: usb@a8f8800 {
-- 
2.25.1

