Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A01A7669DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 12:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbjG1KJF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 06:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235349AbjG1KJD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 06:09:03 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A41430D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 03:09:02 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so3276500e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690538940; x=1691143740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CspJ1Q+2LosEzKqDlXYExoY3sG/z+p7xYAQPInOGC34=;
        b=dbVUYvlsmxwElbn4bcO2JD0LdaBLJryli+XervF+09lsRIxfFCxEJSsZpgrQssOgsX
         bw28dzjPl2jv/VklY82FidURfubXTX8HV3EWeg/ClnksNx8CdItpuia7MHry03Ts0I3e
         ouMkPOyugZmLPVCAC26FlrsybVnb18WvEtAZBIP2ysGVGDPQPXfGH7WvisT+FXC80du+
         F0F61Dekmg+eSuaHTVwLvPzMaVifrlEsXwIbLIgulRYfTD4mBXLWWuPzgkZtqI/19ZgH
         PH/5TH0XLUvZyQ9saogsTxg6/NBX6OIm/XWvG28U/HAVtyhfzHKjxKBuUBsq3eVtc1dL
         px9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690538940; x=1691143740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CspJ1Q+2LosEzKqDlXYExoY3sG/z+p7xYAQPInOGC34=;
        b=hePlxhrm62v21OWqtjrzZYQ5n9bpgqc+Y9yT3OIC1VoNA/HxH2aSd4iNpePhgBFPlE
         6amMon6NMiIwulUHXMbe1GdNvoy+Q32v9qlr8UfhS/4ti81L7GsgXcS0ZWh0wpd3qceC
         vrFaXdjvTXiMPV1McLYNMPHQ89yAtwX4I9rEbpp6kD6aOZ1Ucj/5+48SZ6gZNEzpoQkv
         GmZ54tx4UzOvdt2X8s1AKOzggY2JaDZ4NSDx1Sg0jai+0dTmDFR0gB7JGXXG2vsVHJnr
         JPU106o9wTnCWTpbm4bRNf593dkndBtedaZBXbxBNyK7axchimz8X3l2Wa/oHr5gDEad
         VNXQ==
X-Gm-Message-State: ABy/qLa8keGc3W/Tdg+DZvHCcsnujpwG0B+5k8ppf7k+KQB8NIr3N2eL
        qWLnHNDRIW2UmkQ2ZXlA2EXVZQ==
X-Google-Smtp-Source: APBJJlEfILIhP5ot4LQTaeb0Ra1phmwRasCbohQ4Dqjz1wikHTwVX3V+dIS/l8+SueD8SM/DBjJydA==
X-Received: by 2002:a05:6512:78c:b0:4f8:5e21:a3a9 with SMTP id x12-20020a056512078c00b004f85e21a3a9mr1229831lfr.45.1690538940442;
        Fri, 28 Jul 2023 03:09:00 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id h16-20020ac25970000000b004fe0de39fddsm741704lfp.290.2023.07.28.03.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 03:08:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] usb: typec: altmodes/displayport: add support for embedded DP cases
Date:   Fri, 28 Jul 2023 13:08:56 +0300
Message-Id: <20230728100857.471984-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728100857.471984-1-dmitry.baryshkov@linaro.org>
References: <20230728100857.471984-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the embedded cases, the DisplayPort connector is handled by the TCPM
itself. It was proposed to add the "displayport" OF property to the DT
bindings, but it  was rejected in favour of properly describing the
electrical signal path using of_graph.

Fallback to the controller fwnode for HPD notifications to
support such usecases without requiring additional DT properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/altmodes/displayport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index dc2d3a83dc26..76c3e2f8e117 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -578,7 +578,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	alt->ops = &dp_altmode_ops;
 
 	fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
-	dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	if (fwnode_property_present(fwnode, "displayport"))
+		dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	else
+		dp->connector_fwnode = fwnode_handle_get(fwnode); /* embedded DP */
 	if (IS_ERR(dp->connector_fwnode))
 		dp->connector_fwnode = NULL;
 
-- 
2.39.2

