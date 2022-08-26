Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFB45A1E15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 03:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244238AbiHZBWJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 21:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244233AbiHZBWH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 21:22:07 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D445BC8772
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 18:22:05 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id f4so59631pgc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 18:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gY3tlF3vENa5itYuSBx/pa6KL0Udf7AS/e/RUrrnffM=;
        b=H3igN1/yHvXXMjmVn4kWJ8Doatb6ptuxzFkFWpXbIRJUBy2um69V57WqimgHiLgkqm
         +Iysp9DuFgCDu1pfdZnUJYGJg0/XCZV+ubCs7nBX4fG8hRcbdzVaqRSl17ULmpE366aC
         UIjGOygGlVeIc0gNPqyQ2zAYPRXg4/npFzmAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gY3tlF3vENa5itYuSBx/pa6KL0Udf7AS/e/RUrrnffM=;
        b=b9jQSVd0ZgFOgKLj6jkRI5ljeRFKKbV1yb1zMPfN8Mp+6EMIawM/8XutIUGsRCGfum
         q0y6TtFLtWabqhM7qbBrFJpddobKLRQtpDQLz4ylAbmlutjAYsH6FewmfM7APKEKQeWo
         NMscSLJbaJdKgBpZhMRUn6hROLoyop0Kx3SWOSloOAjgPcloK7QTH1B3eKfRZTcipgFo
         F4yvnK/iR27Y56J8d0KZvbCpyDkBwEfwL4KI/8jH7M98IUlCcIdYBE3EHtC7UEyDmrCI
         Dx3XHqabhGp9v7eSqi1eQVDNL1nslRR3thTy2p/wUmS0OAYCrqu3jbVGe87g79BfjZ4T
         TbpA==
X-Gm-Message-State: ACgBeo2jnW+BNVoB2HbHZql9XjU2v9Ot2WK43uQdmS2YgD7dGYdwJT5L
        MVklr9lCvc5SrFchU4MzUQfWGQ==
X-Google-Smtp-Source: AA6agR5Tq03n2LBQdmBzk9YoR2dPliY0RNs3VGu0MMT6FJlzVsdMYfhy5YqbQISsMs4sqNR7md9nEg==
X-Received: by 2002:a65:6d13:0:b0:41d:7380:e9cc with SMTP id bf19-20020a656d13000000b0041d7380e9ccmr1375243pgb.153.1661476925137;
        Thu, 25 Aug 2022 18:22:05 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:d529:f79d:2a1a:4e61])
        by smtp.gmail.com with UTF8SMTPSA id q17-20020a170902dad100b0017315b11bb8sm192415plx.213.2022.08.25.18.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 18:22:04 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>, linux-clk@vger.kernel.org,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/2] clk: qcom: gcc-sc7280: Keep the USB GDSCs always on
Date:   Thu, 25 Aug 2022 18:21:59 -0700
Message-Id: <20220825182152.v2.2.If09027f73daa6e1ed95f5eab02326b543c67132e@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220825182152.v2.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
References: <20220825182152.v2.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the GDSC is disabled during system suspend USB is broken on
sc7280 when the system resumes. Mark the GDSC as always on to
make sure USB still works after system suspend.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- set the flags of the GDSC not of the GDSC power domain
- updated commit message

 drivers/clk/qcom/gcc-sc7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 7ff64d4d5920..adef68d2cb0b 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3127,7 +3127,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | ALWAYS_ON,
 };
 
 static struct gdsc gcc_usb30_sec_gdsc = {
-- 
2.37.2.672.g94769d06f0-goog

