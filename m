Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00DF57D41F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Oct 2023 23:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjJWVxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 17:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjJWVxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 17:53:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38388D7C
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 14:53:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507a62d4788so6043064e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 14:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698098012; x=1698702812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN2sLOa9xwGM67Rq52+5iCupQnqxlWnolzeyMPzN3QU=;
        b=ZZoSqPyd550fbXScvbW2Lf0ybFwCJUOvz73JJd+k1Lw5NiApZF0Oom0hx6qo+x3BEu
         tpm6EN1+FpjEM6ErziUvqdywm41dRFaYBmObHOi2Pj53ufMqPGnPX4Nd1j7TKrE+xd3k
         E9ZhE76tgMFTnuc7uhWVPDBQDJyf0iWqpcEpcNXpDBCf6vGv0H6moilmHARlgYuVLIuF
         LX20Qc2cGxlTGvh7vPeJ3SHLY2v/8IU+da3OW3u02TtvMjmoQxjZYBsgD46srfvVZGln
         G65kI6R8zjwDCoxIRW1xBWSS0R39xat4NCSODqKaczGAExV+O+YbRDvIXph75HpRjOVj
         5Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698098012; x=1698702812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SN2sLOa9xwGM67Rq52+5iCupQnqxlWnolzeyMPzN3QU=;
        b=vcs5WLq+kDimex/sqCHra30Ug9n7HEWZsGuvdqk0H/sXKqxbBvL5nR4wqkJBpC+xhl
         tsb4iNRkiOxlgYNZVfUw2sYol49aSJ05BIMv3s6n5mBuB9zczzahQuGhx0PDlgUgaQaL
         rrEgjFSjJ7380YQo1x4PI1D/HtB6/q76MJrIdgYyK6ztAtD5nudjpXdijV31RdYUGXnq
         QB6RJRWPNtYwTYBQvaZnCfGBbsbBoDMrHYs2MGg7BpJ3gpNRjP5HT56HXbYbJsEDMhLy
         RpzushwDmIn32aO3IlfCg03Uuwq2FuDv/xtlCeAiOh6uCxLsOF0Dc+mtn4zMpMJme4NA
         XzYg==
X-Gm-Message-State: AOJu0YyeAlVIrh71DXGJeRr1KpQ18nd5EUGpYGzUK1xiJBdi4ReEmQIs
        qVIeaEljKnfs7b1aHKyWFQ2hRQ==
X-Google-Smtp-Source: AGHT+IHuJfk9KdAfnGmoSEogeTq5EFh5oiYm9phVPnu+CdkR8gpXcG8+3xH88P6QZsMQ6U3VJYKPDA==
X-Received: by 2002:a05:6512:3449:b0:503:1d46:6f29 with SMTP id j9-20020a056512344900b005031d466f29mr7218271lfr.37.1698098012440;
        Mon, 23 Oct 2023 14:53:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (85-76-147-63-nat.elisa-mobile.fi. [85.76.147.63])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b005079dac9620sm1845143lfr.43.2023.10.23.14.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:53:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: pmic-glink: enable UCSI on older devices
Date:   Tue, 24 Oct 2023 00:47:27 +0300
Message-ID: <20231023215327.695720-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
References: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
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

Now that the UCSI driver got support for the 'no partner PDOs' quirk,
enable UCSI device on all older Qualcomm platforms. Newer platforms,
which handle UCSI_GET_PDOS properly, should opt-in to use full-featured
UCSI device (see sm8450 and sm8550).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 914057331afd..b524291586d8 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -16,9 +16,11 @@ enum {
 	PMIC_GLINK_CLIENT_BATT = 0,
 	PMIC_GLINK_CLIENT_ALTMODE,
 	PMIC_GLINK_CLIENT_UCSI,
+	PMIC_GLINK_CLIENT_UCSI_NO_PDOS,
 };
 
 #define PMIC_GLINK_CLIENT_DEFAULT	(BIT(PMIC_GLINK_CLIENT_BATT) |	\
+					 BIT(PMIC_GLINK_CLIENT_UCSI_NO_PDOS) | \
 					 BIT(PMIC_GLINK_CLIENT_ALTMODE))
 
 struct pmic_glink {
@@ -273,6 +275,11 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
+	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI_NO_PDOS)) {
+		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi-no-pdos");
+		if (ret)
+			return ret;
+	}
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
 		if (ret)
-- 
2.42.0

