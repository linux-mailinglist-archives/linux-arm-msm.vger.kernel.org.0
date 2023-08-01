Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F1676B317
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 13:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbjHALXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 07:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbjHALX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 07:23:29 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BFC273A;
        Tue,  1 Aug 2023 04:22:39 -0700 (PDT)
Date:   Tue, 01 Aug 2023 11:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1690888956; x=1691148156;
        bh=1f6zJycLuFoL5WQQ7MMLphiDimdCfGXgDIFs81dzGK8=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=Sb8gYHfkY0NpGkrMYc4Rx7l9Pg9zSFBUQbTJeS728HPlx7FAUQQTvqGBQx7ulQCas
         NKIWkhTb3IMHqUzII3nDIzRWn5vWNwf4wk9c/eujJTI+FzNNF+9v4/z1+M7gdhiDNi
         NIHVjzF4vQn0/Y3IrgsJuSdg/CVqdEvrceELfAYQGANyoapWjDDijHo7OjApx2wbUF
         C9RqWa8mcXjGXu3jEp6ZLHPCuuOBVN6+Myuluh3o5SWxhzw0wESyXjR5ECjFT3GMtB
         R2UsJL/O3pqVw3KrrYkuTa3JRXQnxs0lPbjfq6HEG8LAwlGl/++ILITgySe4Ea9NPB
         sAUt2xk4JxdYQ==
To:     linux-kernel@vger.kernel.org
From:   "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 1/3] dt-bindings: qcom: Document new msm8916-samsung devices
Message-ID: <20230801112113.4659-1-linmengbo0689@protonmail.com>
In-Reply-To: <20230801111745.4629-1-linmengbo0689@protonmail.com>
References: <20230801111745.4629-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the new following device tree bindings used in their
device trees:

- samsung,fortuna3g
- samsung,fortunaltezt
- samsung,gprimeltecan
- samsung,grandprimelte
- samsung,heatqlte
- samsung,rossa

Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index 450f616774e0..7172f657bfa4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -235,11 +235,17 @@ properties:
               - samsung,a5u-eur
               - samsung,e5
               - samsung,e7
+              - samsung,fortuna3g
+              - samsung,fortunaltezt
+              - samsung,gprimeltecan
               - samsung,grandmax
+              - samsung,grandprimelte
               - samsung,gt510
               - samsung,gt58
+              - samsung,heatqlte
               - samsung,j5
               - samsung,j5x
+              - samsung,rossa
               - samsung,serranove
               - thwc,uf896
               - thwc,ufi001c
--=20
2.39.2


