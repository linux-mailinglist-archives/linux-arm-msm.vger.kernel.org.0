Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519D66B8C84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjCNIGQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjCNIFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:05:47 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651DB72012
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:35 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id p6so15761861plf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cI9fzySm6xkOQqRMGGXIyCN4K6R+WsFVLi5pzorIgXU=;
        b=SmrW6DYZUiRCkcs6iV1lliQ4cARMhvs11o78dH/KFKBz++3pDZF9LSJXafidza+V/X
         bi3oMZ3YKstKS9jq1P01frvzijVXejgUEysFIZOW2xyol2nISWCpeIBHwEX8bd0Y4TH9
         rGosPDpMJlOeQmr6rvkRU20ais1xjTXycslgHrC7L4sO+yuABk0mjPdDoUaLYAdUMzgL
         5OKoE2rlkBZLGm8UEm164kpl/07Yojm8pO1T/n3JvIkvCjy+EWn0hO3u0Q7Z/sZ3KQpq
         UpU5sczU8qXfxr3kg8J8F/Y4Vho5KAL+LYxTOgySXwfGfHzCYdNkSKi0lRdZlnAQ496V
         C/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cI9fzySm6xkOQqRMGGXIyCN4K6R+WsFVLi5pzorIgXU=;
        b=4lrO1ha1eJSrQZO9qmJ+jPIiUkXIEp+a1Pp67SLwI7xnj+uhA4ZFSWp8TBBO9xvsnv
         jYsKKMOwE3GYDcuhwqRZGGFbkBf+c13E5KLR3DWVaNOrP6xKX67i3Cig2FPE4wbsQv3n
         NV1hpmAgFdOs9pzyjV6Bj9rR8XSr+MDF1Sv5PP97cmWA1xeRM/HWGBS7nKl+oJOeA60S
         dlDXY5HhbWfanGl66IcEm7mzT6557JZ7wln0L9w7mWovTf8hBKLlxNRfIno+Z1ZW9qUk
         FNxqNv3eXCwgZg5Vw/XbmFNx/bJZyb2x00QntYEsrclbXcq2p8z2O+qDxYrPTpEFyrbo
         7I5A==
X-Gm-Message-State: AO0yUKWQkqdwHRgjX0TqXcrFgntEgYoqZEKkFG6+USonYfYzhbxmYBWK
        Qi3qjGKuJe1hklPfJOsw0kXY
X-Google-Smtp-Source: AK7set8D8ZyqM86gwm/xlOKVjJkQGMY8l814PI+TikC0iw+CMEQOSDA0tC0uf8VZ+PWrcaW2zms5vQ==
X-Received: by 2002:a17:902:ab82:b0:19b:da8:1ce6 with SMTP id f2-20020a170902ab8200b0019b0da81ce6mr29920545plr.55.1678781134905;
        Tue, 14 Mar 2023 01:05:34 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b001994a0f3380sm1078022plg.265.2023.03.14.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:05:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 07/14] arm64: dts: qcom: sm8150: Fix the base addresses of LLCC banks
Date:   Tue, 14 Mar 2023 13:34:36 +0530
Message-Id: <20230314080443.64635-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
References: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fd20096cfc6e..e316a4e4b5aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1772,8 +1772,11 @@ mmss_noc: interconnect@1740000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8150-llcc";
-			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x50000>, <0 0x09280000 0 0x50000>,
+			      <0 0x09300000 0 0x50000>, <0 0x09380000 0 0x50000>,
+			      <0 0x09600000 0 0x50000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

