Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1357256CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 10:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239056AbjFGIFQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 04:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238886AbjFGIFM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 04:05:12 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A44E10DE
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 01:05:10 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6e4554453so59173695e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686125109; x=1688717109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLNlz/8+ewTofYujo4xBdn+VfsPe1NjsAkjdE+/T2lI=;
        b=ltzXDn7Y0h3c5QJiFizvmY8s7eCJFPL7lapmgXhxaPz86txjaKlk06Ar94HqlIHAnc
         oAVpv07pvcnizsmQdgR8T/px5cGvBO0GXCVMgC/duzw9YPcDb209ouzTrEN40JNkc8tA
         x4p5T5lfvSzlat31m6XGSJuXwqpyfhzrGGCX82wv19Xl1rMe1bGsjhbezB8/SXhIsJ3t
         WNCrn2Rsk973Ny1WtZWaIf3ywSW11Pgd2YVjVpvQOUAPbdhpAECoDJO54NmuJyfB1hPJ
         lYgzNKHpAUGjCG1HYf6SPhTugYmj3pFpWS3g/XKFkAC/dXkPjPc+s33mtTOlvrNY3Bj3
         1HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686125109; x=1688717109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLNlz/8+ewTofYujo4xBdn+VfsPe1NjsAkjdE+/T2lI=;
        b=fup5yhP/n2zaeDj4EPX1GaKMxTVY1JsLNaFki16ohxLhuZRzClqxi7im3tATiAWZTn
         ftmpUW9s9pq/u5SMIH5QsQ2K/OJOlFVl9JFXZ9LuH05dicyrKEVxi+QPvBfmJG7Qq/bB
         EsMPxXXDlDj6uYifjW4/p1z/a06G+iCKwGl7Wvp5yPnEuo2v1+StPF36QRoNdXJAQZog
         ERka1Uk78HAgZEdAe7NRax3kESxX0hdNF7D2j2RU+njWV3Za53LInglFUr6f4Nrbhdo9
         rwyWEU+0Jfqg0xWHSJKe3zN+oo+fMYn3jIiIXtXASbxCsnbDV/ad3QDsqfCdQfNSxJx+
         Dk0g==
X-Gm-Message-State: AC+VfDzZ+99WX5r1suYDAUTe4jHGy5FUWFB/4CQNF+SCyNSF+GFug1Ov
        AQptsWzSo/YOB8Vxei0wHNu97g==
X-Google-Smtp-Source: ACHHUZ45/UYK6qnnIZbnI6LE7j6p8RIX7YbwyUI6sr2F3nvT0E969FUlC49PGEFOVua5HBvnfg3xXg==
X-Received: by 2002:a7b:c7d4:0:b0:3f6:3497:aaaf with SMTP id z20-20020a7bc7d4000000b003f63497aaafmr3855885wmk.9.1686125108070;
        Wed, 07 Jun 2023 01:05:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h8-20020adfe988000000b0030ae5a0516csm14706269wrm.17.2023.06.07.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 01:05:07 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 07 Jun 2023 10:05:01 +0200
Subject: [PATCH v2 2/8] soc: qcom: pmic_glink_altmode: handle safe mode
 when disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-type-c-v2-2-3bbdf37575c3@linaro.org>
References: <20230601-topic-sm8550-upstream-type-c-v2-0-3bbdf37575c3@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v2-0-3bbdf37575c3@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gcoujHHWT0tH34VUiSmqNPPpiXV+hYxjsfgjgght78I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgDotqlKqtbACOW+S1lPuWrn5q9cLM+OJluGtXozw
 ct9ZtHeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIA6LQAKCRB33NvayMhJ0eivD/
 94fU8O8NILIct6qWLn5P5817afdb7h7CWrM71JMZ2UnlCI2KPR7HYrrJKsOr1i4ly4vk5BhASJX/gG
 bbzgmujMYOBp9Pi9tG8tt5AB5Cxbcwgc6CmeidzM0hR58zxn99Wf7Uda2ir11giLkNmDVX8ErcHptT
 MU4Dim33+ZlpP1AiEgeZtVagsrFiwHPe5Nvr7W3NddVs8QG1Nvj0aTjrv2hhZcrwBu/JZd78lfRqgX
 EloPfIKBwsd/Gm7XDKOAxFEkM8scIzTBl7KYihYLYUQicK3jzI0RKl5w75SjuEoFQnNKmhhFCn9s78
 tmFRYFR1pGruo4lU8cInJRZSrWl7rSNIDOM8Qgu8ojjCBx8aMn+aJ/zQCtCA1ab33fu/VjZ51QJYMm
 IFV8jbzjlYOpqrnQS3fK7YsEKC7EPZukanWxyRo+/3ZClzp0mvPcR0pRTph72QFAm4/xk/lfjLtOrb
 hCvTp2HJS4GDXg3+g7zHwd+AUCRvhilaLpb8F3D9HkOyx1ETU+ome4LThHjtBdjFFg4TlucjJz+s1e
 M2z1NSMI2HFC6tQxGoUW71mwYBB2ubCTFCCBrItD2zKdW6AvfaCVK04787NmJIio9hnkcH/0o4CqeS
 t8rSX09YEm4IOFHHoAJ3CETt1ifKosDjM3EgChDnIbYEOl9AyEeuNJmu9Mcw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some Qcom SoCs, the Altmode event mode is set to 0xff when
the Type-C port is disconnected.

Handle this specific mode and translate it as the SAFE mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index df48fbea4b68..007d308e2f15 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -173,6 +173,20 @@ static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,
 		dev_err(altmode->dev, "failed to switch mux to USB\n");
 }
 
+static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
+				    struct pmic_glink_altmode_port *port)
+{
+	int ret;
+
+	port->state.alt = NULL;
+	port->state.data = NULL;
+	port->state.mode = TYPEC_STATE_SAFE;
+
+	ret = typec_mux_set(port->typec_mux, &port->state);
+	if (ret)
+		dev_err(altmode->dev, "failed to switch mux to safe mode\n");
+}
+
 static void pmic_glink_altmode_worker(struct work_struct *work)
 {
 	struct pmic_glink_altmode_port *alt_port = work_to_altmode_port(work);
@@ -180,7 +194,9 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 
 	typec_switch_set(alt_port->typec_switch, alt_port->orientation);
 
-	if (alt_port->svid == USB_TYPEC_DP_SID)
+	if (alt_port->svid == USB_TYPEC_DP_SID && alt_port->mode == 0xff)
+		pmic_glink_altmode_safe(altmode, alt_port);
+	else if (alt_port->svid == USB_TYPEC_DP_SID)
 		pmic_glink_altmode_enable_dp(altmode, alt_port, alt_port->mode,
 					     alt_port->hpd_state, alt_port->hpd_irq);
 	else

-- 
2.34.1

