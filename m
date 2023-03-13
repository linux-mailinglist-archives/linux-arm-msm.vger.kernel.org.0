Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 038D36B8207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 21:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjCMUAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 16:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjCMUAS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 16:00:18 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C0C8482F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:00:16 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j11so17173745lfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678737615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6F/bmJ1cUx6IF880SqG09FqlJZOVgB3Ovuj7ugO+Vs=;
        b=pMiWfv19F7h9HQhVoDK8cSBP1pXPQIJd4D1u0KqTfCDlUAGy0seDqz8B6hke3nh0Cb
         ujrQDptQ/k/fwlCIz95DZPDPLZCSJ3Rcj983iRt7MSFp8KynEv01XglLF1dm/5umgwS9
         6+tUfcRfM6MeqYcdiinby6Tg7xzkbYeI6Mp/uIQjgg7imKwfw3+3Z/18wEjVJBync2mi
         ZnuIHBJS81Gl85b3C5bQElHE816Ba4OPudlMCFY0XbbThcJXbueADbdtKp+ufWiMirKc
         m9XLxuYXzUYWftcTgOVSf9XyOdVbONFUd9qVtQhSS9dQaNPA+HlK4yFQaqWReM2OqRPB
         TvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678737615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6F/bmJ1cUx6IF880SqG09FqlJZOVgB3Ovuj7ugO+Vs=;
        b=OMnrxXdsoBlCSlj0ejEFvOSL5XiRLfWJ1DGRAwVGOGQeuW+koasnMw5VfWK2Ce1rtE
         EPxGe3tRfmU8jj87LJZNd9A3J5JcYAFRWEwHbyB6tjZDb8JCkvaR5hXcgr5LNqRZFiYF
         C0qR/IXA+9YBofZrZjVcLOley7GpFEK6I6NGwbKy4bpp7c8mYtWUDZj36iPqNJo2PtSb
         hrY09SVW9pPzBG11MHXWjlMXem2+RnkQ+rAMomXFLaqVk6OE2w40Lr9HcYCCBmX/nHhv
         3Vh/GFd3c9KUAf7bD91s1GN7LqP7d5t4XsCy03cWOHkdaRaiNTBGAtKwJuTe8Nhd6IY2
         yScQ==
X-Gm-Message-State: AO0yUKXqN+SBvJfxCtHVUysU2eK9x/+Ng7E1atMw/7WLzbAk4mcu3DC3
        NhpsAUNrytfdNpfh2L7YjZswKeujjImshpjePD4=
X-Google-Smtp-Source: AK7set8mw4hBobEj+xUrs4as6dQoknjEuzBO9/i3n5u21dxgBNFdwozxbo4w5YaCTU3s34WqUujJFQ==
X-Received: by 2002:ac2:5e8e:0:b0:4b5:b87a:3262 with SMTP id b14-20020ac25e8e000000b004b5b87a3262mr9872082lfq.28.1678737614983;
        Mon, 13 Mar 2023 13:00:14 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id w3-20020ac254a3000000b004cc800b1f2csm75431lfk.238.2023.03.13.13.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:00:14 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 21:00:06 +0100
Subject: [PATCH v3 08/10] soc: qcom: rpmpd: Add parent PD support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-rpmpd-v3-8-06a4f448ff90@linaro.org>
References: <20230313-topic-rpmpd-v3-0-06a4f448ff90@linaro.org>
In-Reply-To: <20230313-topic-rpmpd-v3-0-06a4f448ff90@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678737603; l=1205;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=E54ylqbifUTsLF0rt8nM3af9swKFyDMWMQVj+11edlE=;
 b=PyVBxMpR5FuUG+TCXn2aZnWjCe2oizVJBZPpcf9dXzmS6nZftjiaGYwhIphoTsZa9duL7qbXITU4
 thd6M294ARHdlwqv0GIkw6OR3wZVM+6Zcmpjp6T9r51lGyvEVY6V
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
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
2.39.2

