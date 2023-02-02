Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4466368841B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 17:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbjBBQUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 11:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232948AbjBBQTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 11:19:48 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6708A6B375
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 08:19:45 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id bg26so1853946wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 08:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdvxk4K8UkI7vr33u4ZlD0OvMvVuptkdT6rfsFjNwhQ=;
        b=qWhiUsQDmOzc3KM7VK7rsM5y1TjYRlXOJseMoEzNdRBkQb6eFm1S9JmGRgrMmf4/Kn
         K0TPAgAVcMHzLZj+95bCN37KqH6gHO+oRezv7sNNqw8OJX2a/hgi0OyAAJMgy7enxIxc
         nqyAQfWvAha4lBQs9lNM78rcy58oMYvn9d+GyGmUOWk5Kr2nwAZQNtYL7czB3q/Icxrb
         Fi1FzGFR5kp3L3/bTU23aKAVx384IMAUhXRwIrRBfUjLc+lyYduyl/dHqq3scGUKhzMr
         tXP38aB3r+pSievKBfUhAkINVjLl61xwlxSAOWqzLH8Er4Vhxyhq74a/s9bNZKDEJbTm
         G1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdvxk4K8UkI7vr33u4ZlD0OvMvVuptkdT6rfsFjNwhQ=;
        b=qI+BYmHtD/LOqixEWlJDpPIjVX4H/sHr6/BO0fh2M6UXMFmrbjue7hJz/BXV7crVme
         CXdJavDtecmucTpi8ibISPN899eYsRtjOlymn1gUcNsjNqg5+I83F0/BNBL6z3v/PkXL
         i0KnrRRsTuNG9mrf0alztWRKg5SCW2+VT2+FbJPTthAG8WxU1PqJkSr7Tf+LUF6RN1pP
         1fA/89BFUrKTjxRdwXkwVqR8R4so2GInOCda1LdMe4+c66DHwsSbdk2rvggJ4FPNNSj4
         V9UBhcNM9i4L2qEQxuEOcn93id2+inio7chDTteQFd+lnbcx0LZwir96JrZzyrXpWesD
         /S9Q==
X-Gm-Message-State: AO0yUKXd8DH4BgylVtSnXNQDgXDk6DtF5TccE3VH2R33YgEw6aHYCoZd
        VXnRonXVZ/vR/eZw/lCaakc8Mw==
X-Google-Smtp-Source: AK7set8SmzO+W6/8siPFiSDH0ZrVBMTrTjzHTdqjx7Xv4qiJze3y+6NClLcOPVE3yZvI0NrupltgIQ==
X-Received: by 2002:a05:600c:cca:b0:3db:bc5:b2ae with SMTP id fk10-20020a05600c0cca00b003db0bc5b2aemr6020523wmb.41.1675354784998;
        Thu, 02 Feb 2023 08:19:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003dc521f336esm212416wmq.14.2023.02.02.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:19:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/13] arm64: dts: qcom: msm8998: add compatible fallback to mailbox
Date:   Thu,  2 Feb 2023 17:18:50 +0100
Message-Id: <20230202161856.385825-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
References: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
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

MSM8998 mailbox is compatible with MSM8953.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 8bc1c59127e5..f4df41f7d957 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2490,7 +2490,8 @@ glink-edge {
 		};
 
 		apcs_glb: mailbox@17911000 {
-			compatible = "qcom,msm8998-apcs-hmss-global";
+			compatible = "qcom,msm8998-apcs-hmss-global",
+				     "qcom,msm8953-apcs-kpss-global";
 			reg = <0x17911000 0x1000>;
 
 			#mbox-cells = <1>;
-- 
2.34.1

