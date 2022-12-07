Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE0A645BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 15:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiLGOBX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 09:01:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiLGOAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 09:00:37 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73725CD2E
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 06:00:26 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id g1so9469733pfk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 06:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9wB8HfZl3VNPDfTiqbYvNGJ+C+gB7rjqwIL9QWVnZY=;
        b=bGJ7XILZ3JHnO065vPE2FpcT5z5uAqEEOiqARKZHZKX1ckjPjdgSBW7/EndyCXEewr
         Q49oC/fEuNxkoKmzhr4ydHYcnY/AnyBBqMg6hHvdJx6UNHEnOK6ztT3ZsF10V95wIT2g
         kHVfZoBPYd6qYAEOulgTgIkd/uCLB8iNs3zR05aOc8sx1Agb+jxQGS1HhfcyNb27QmQ2
         NEQ7/ND6zf+R1aE1JkeEx0SBmyDRR2nGxpla/+RU8aJwD2J98sCU0a/gdL/W222S04ZL
         p4won3uXWRqZ7DrpQdS5Ftrql3RkrA06ZQGB8yP0Tsf5iX2zC7wyjo667mA/AlZydMjc
         Ui6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9wB8HfZl3VNPDfTiqbYvNGJ+C+gB7rjqwIL9QWVnZY=;
        b=BsZ/93nF2/o4M+sDl5Lhjv/3uKWvsEPC+KmQAZGJdtKBCpfG0m7wU2GiVegIR4rVoV
         dpQPLW5rZjKqmvxNpjI2xct8BbMiqf7MSie1CplakGk2WqTLbaCIBn5n9O5JZ5arSf2l
         Tio+SipCAz9NzQFTczH4edAtglvffnqKK9b6IlgrCSAMgu4970kPKdzd8xLDxt/WW5h3
         78bIFfAHHBqdfYHJioQqLAXQnncI+RjSNtur0qiLjdiSHFlO9zvcusGC9CqWjngoeScR
         qZpVDdfHz7l51mwCN1QgytIfzMu7GelUo8r4AtEdX9pX6o3SG2xGMO6qebCTohfJBfit
         LBfQ==
X-Gm-Message-State: ANoB5pkBN1xHWB13fwAiVObLLuGQXnUYV+qFK76RP3fIW0HAY6Naw4uv
        HPcEhCW7i6DcI83z+ZoeDa3l
X-Google-Smtp-Source: AA0mqf4JhLpEzJBzUDoRUDShe0fazOM5Kybl/zUECelo4UCHl7ghB2yXwXg+IkCFhIl8itdGB0URaQ==
X-Received: by 2002:a05:6a00:1ad2:b0:576:f761:d381 with SMTP id f18-20020a056a001ad200b00576f761d381mr14371016pfv.59.1670421626221;
        Wed, 07 Dec 2022 06:00:26 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.5])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902d49200b00186b69157ecsm14720160plg.202.2022.12.07.06.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:00:25 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 08/12] arm64: dts: qcom: sm8250: Fix the base addresses of LLCC banks
Date:   Wed,  7 Dec 2022 19:29:17 +0530
Message-Id: <20221207135922.314827-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221207135922.314827-1-manivannan.sadhasivam@linaro.org>
References: <20221207135922.314827-1-manivannan.sadhasivam@linaro.org>
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

Cc: <stable@vger.kernel.org> # 5.12
Fixes: 0085a33a25cc ("arm64: dts: qcom: sm8250: Add support for LLCC block")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dab5579946f3..d1b65fb3f3f3 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3545,8 +3545,11 @@ usb_1_dwc3: usb@a600000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8250-llcc";
-			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x50000>, <0 0x09280000 0 0x50000>,
+			      <0 0x09300000 0 0x50000>, <0 0x09380000 0 0x50000>,
+			      <0 0x09600000 0 0x50000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 		};
 
 		usb_2: usb@a8f8800 {
-- 
2.25.1

