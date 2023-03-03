Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4341F6A8F36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 03:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjCCC3Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 21:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjCCC3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 21:29:23 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CC620D19
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 18:29:19 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id i28so1903718lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 18:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677810557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTPSVEvvP89bGB3D92Tz451FufVn0eXFUs87v5JjTuw=;
        b=N8NDFXvx5McWRHFGaW786k6TdOOVLszqOVhIRYQ0CWW22ECnC6B49A+lhm+NtqMj/h
         b9UeIUU7o7ux5JnXjy5hlil4LTzdWfaN0miEPmaIawqDU7hrDdjbYZIoRoNWcErdATtX
         VgUihqiq4e/RYnhPXr9TudRmlDTfsNc6sPEGlQ7dYUsDWkow02PMIe9DLzpfif/VRG+a
         L82ze9FTIszLPLKawV64yeqme+twH2D0pRh8YVMgUQwUj4wsAzEgeskymYir7weJog9t
         tmWx1KldhpWhFQGo1IFGXyUbceXGWGxMNR3DDiPMrURW+KKnN85KDurhXGX5FOZJXag7
         J6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677810557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTPSVEvvP89bGB3D92Tz451FufVn0eXFUs87v5JjTuw=;
        b=XLFZvkdXuyMxNKQYoLM8I1IRyenUazppZ3GhhcMd2BalKgWO5HrTfRn7D9RJ+eq2wA
         M2B+Hp7bcNEzUKYcsuwuI1N3vmO/PZhmEeJyKl2bBI6MmvutdDgETt/mqzAXJLFCP98L
         ymJm9ErEYOVTeA52p7T8Y0NoFOvseXMpQygKX+5D7YTp9HFjp8EZtfE+OgqaEkPPrIh2
         oMcL2WUaLcLn3GTuewdfX26Ni00JM7cJ4ORPEifp4iGG/FsFgzkBEmYqoBxUrJOw++8s
         1Lvs6j6uODnFJA2a6GxiKML/d9qFRbIV4p99kWCSmfbUFN8tyXO2T94EcoOPpINT8IOb
         sIHw==
X-Gm-Message-State: AO0yUKU21yVwdu80BaHhl/oWAVujv9ONie/vtG1G0tZO4mvnyGAxdBgw
        SoCDFcIbml2kaE1JFk5Sa8SuIBtRWILQHs4n
X-Google-Smtp-Source: AK7set9is1XMi9TYXqkC3FsHqGmXHGcVtKQHTEfClKlhu83v26vCpQiu4njnbLdY5O49DJtIKYqTkg==
X-Received: by 2002:ac2:5a45:0:b0:4cc:8682:ec5c with SMTP id r5-20020ac25a45000000b004cc8682ec5cmr87320lfn.34.1677810557388;
        Thu, 02 Mar 2023 18:29:17 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b004cb1135953fsm175574lfo.240.2023.03.02.18.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 18:29:17 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gcc-msm8996: Update the .pwrsts for usb gdsc
Date:   Fri,  3 Mar 2023 03:29:12 +0100
Message-Id: <20230303022912.2171177-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303022912.2171177-1-konrad.dybcio@linaro.org>
References: <20230303022912.2171177-1-konrad.dybcio@linaro.org>
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

The USB controller on MSM8996 doesn't retain its state when the system
goes into low power state and the GDSCs are turned off.

This can be observed by the USB connection not coming back alive after
putting the device into suspend, essentially breaking USB.

Fix this by updating the .pwrsts for the USB GDSCs so they only
transition to retention state in low power.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index e16163706735..e068c9e51441 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3455,7 +3455,7 @@ static struct gdsc usb30_gdsc = {
 	.pd = {
 		.name = "usb30",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc pcie0_gdsc = {
-- 
2.39.2

