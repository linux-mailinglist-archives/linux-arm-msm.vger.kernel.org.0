Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31CAD69482C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 15:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjBMOfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 09:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjBMOfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 09:35:47 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BCD1BAEB
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:35:42 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qw12so32415002ejc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+TFy9ylMOJMNpXCHqHBb00FBDo0eIJdb97gjM6cvUQ=;
        b=oSl3wTsPf7jQ2ZMhh2VN5SZrFK5wPmv1UOza/dQXd2CBXloCWFKaovy06+f1I8vSPN
         0kz4yda5IDQYBL5sdmUm0KnQaWRmojrZsVquR7+1f+etD5zQgqUHQcdJSWdylzfqEFII
         +eukb+Vk2XeJ+ITIEGbc/+1T85UpKOiJUv7/GmsP3LMgknTVh0ROgYqbAKtDhPMMMR12
         PJR46P4ULG1Gp0Cg1H3aLdG7vR0wPo64C2uTwGfqAgoapzh0DNu2hxuPPlGDMyKinlqR
         EMF6YUwAShs9WNkuSdRJeHWa97ztUivhHu5pyDdjc9ERTjZy2O6oUw0e2gvlhcjqYA9o
         K3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+TFy9ylMOJMNpXCHqHBb00FBDo0eIJdb97gjM6cvUQ=;
        b=NYTrBAq7RZTFCy+w5FWqc6Q8Lv/2dlmQ70a84UenS0NENxyasGQ3s9B1GnGKQrC5na
         Ej3Bu3D89pUUaiqXQcfqzmiEEZD0aIESo5LzTLUCU7mKSeBg0QKNRV+CGiqpiUiFqOdl
         tUMIyR+yMCKAP1gdmGpPbnvBn4fGYT1TPbBEVcOTeTEmLPkQTsuzhYtHbqsaNGWONENl
         9gLXVNNmOIt8MHVu3lEkdOzTUaEjRGqJcYCEMj+oRn2SMhRNLrJNzY5mogRlS1Iu8Ltw
         9pCsT4c2D3VMkFU1rTwFTEVN94/dkIlAsaasF+HLsXAlEg0dVin9W9YVsZN9adtnqT2x
         B0qQ==
X-Gm-Message-State: AO0yUKV7Okt2RkESusp1r/LUl+mUekTzl+rQ2ZIx2LJPYuA9fhTp7DOJ
        oSgdOV/MHJFrFEzyEwNRiYa54vmN2jy5hb8J
X-Google-Smtp-Source: AK7set+D1lsnfQL8iUtKVPLdKyCR7sE+sA6s0MGcw9ZPbWMNf0Zqd0tcbNoftsAbG9pFANE3IkVdCw==
X-Received: by 2002:a17:906:310e:b0:878:702e:9dff with SMTP id 14-20020a170906310e00b00878702e9dffmr24484782ejx.41.1676298940633;
        Mon, 13 Feb 2023 06:35:40 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id uz6-20020a170907118600b0088a2397cb2csm6927186ejb.143.2023.02.13.06.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 06:35:40 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] soc: qcom: rpmpd: Add parent PD support
Date:   Mon, 13 Feb 2023 15:35:22 +0100
Message-Id: <20230213143524.1943754-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
References: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
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

In some cases (like with the GPU core clock on GMU-less SoCs) it's
required that we scale more than one voltage domain. This can be achieved
by linking them in a parent-child relationship. Add support for specifying
a parent PD, similarly to what has been done in the RPMhPD driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/rpmpd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 946630d82b3d..2027c820caa7 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -48,6 +48,7 @@ struct rpmpd_req {
 
 struct rpmpd {
 	struct generic_pm_domain pd;
+	struct generic_pm_domain *parent;
 	struct rpmpd *peer;
 	const bool active_only;
 	unsigned int corner;
@@ -969,6 +970,15 @@ static int rpmpd_probe(struct platform_device *pdev)
 		data->domains[i] = &rpmpds[i]->pd;
 	}
 
+	/* Add subdomains */
+	for (i = 0; i < num; i++) {
+		if (!rpmpds[i])
+			continue;
+
+		if (rpmpds[i]->parent)
+			pm_genpd_add_subdomain(rpmpds[i]->parent, &rpmpds[i]->pd);
+	}
+
 	return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
 }
 
-- 
2.39.1

