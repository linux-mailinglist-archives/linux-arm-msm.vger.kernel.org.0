Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1D065741E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 09:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbiL1Imj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 03:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbiL1Il7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 03:41:59 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13D210053
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:41:36 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id v3so10187889pgh.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GFA6I79C1YmmOYQX1BIX7MOGuUjMMgmSjlJ7uhFCjc=;
        b=kW/WrjOWRlX5MKh1BPZ4cXc5hc/bKSSEGcp2PXOUo2es5F10/wYS4gPlhOP6Ag+TWH
         eZFdWMexS1F5KQc4XKr8auMDT2nf/td0WUOrpKUJW8UK7LGkLoGyVW53MLV/rGQTwyzd
         0PGEV2e/SDy4luCRc24OkAkwv4o5kKLi5pwOvMqZpfqlriOlicJrFCZQUsazH2cjc8Qn
         DPYjUlY/9hnhqjWpjyPT4R3ZpwtjDchZKTauIFAH0bro94vUSUVTGf8/vJ0bIxostFx7
         nIxYTpry7XX2mhOomqnXBfoFeXuuthoGzHr9+s8GMZLhI43iUWDfYAzotk12Kq1g3vbx
         oCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GFA6I79C1YmmOYQX1BIX7MOGuUjMMgmSjlJ7uhFCjc=;
        b=ZloelHWCHqrF9zCDntnaSdFBrWxdtIaTwGF/3SnS07w30DBsj8pnj2tX+xqIJMwVGW
         AXxyfriNvoEJR4Ec1rhDpD8Ifq/Fis2fCbwA/gdlglEvPswJwxii2dl8Qitv5C3EvIb8
         ZwhONTp8CT8g3ecZumUMyn7QjYUZcggIjbtK1orRyHHzI8vLOtos8rk84iXM3MqYXPKQ
         5wK3bTbJ0AhIBW4D4Mv/wQgD0vJ+tLT8lBUoaQltuqTt6SSZAIuBH0F3HdgY3oXyZa4z
         v1EsgO5JuqR6BJ1E+m04lZWfCfXdCm/1KkxnhHKlzH7KE2oktpMbGnrvr9sWdWGU0hRX
         Dw/g==
X-Gm-Message-State: AFqh2ko4rGiC796WC3UlO8i82kldSy/7ZTGDufS4+rhJp5pBsKJpbvs4
        DX2JmCQ8h7I511129b0HfTmd
X-Google-Smtp-Source: AMrXdXsHMZKjsZPtwSaCA4yciZsfAMRUTiPiFIMBgtJ2CyJ6XFGBh135+6ARBuEBVQC24ILKicoVRQ==
X-Received: by 2002:aa7:8c56:0:b0:576:f89d:2c4b with SMTP id e22-20020aa78c56000000b00576f89d2c4bmr38550576pfd.32.1672216896063;
        Wed, 28 Dec 2022 00:41:36 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.73])
        by smtp.gmail.com with ESMTPSA id d188-20020a6236c5000000b0057a9b146592sm9786286pfa.186.2022.12.28.00.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 00:41:34 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 07/17] arm64: dts: qcom: sc7180: Fix the base addresses of LLCC banks
Date:   Wed, 28 Dec 2022 14:10:18 +0530
Message-Id: <20221228084028.46528-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
References: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
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

On SC7180, there is only one LLCC bank available. So let's just pass that
as "llcc0_base".

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f71cf21a8dd8..f861f692c9b1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2759,7 +2759,7 @@ dc_noc: interconnect@9160000 {
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7180-llcc";
 			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg-names = "llcc0_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

