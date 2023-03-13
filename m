Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF87F6B8208
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 21:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjCMUAi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 16:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjCMUAS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 16:00:18 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6452856B6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:00:16 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i28so17254578lfv.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678737616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKRFyo+3tUDJl078WQAs1jDYE+5yKAitEL5AqqGitxE=;
        b=hSelPAHxpuoqcifLAGoo/UbDnao9OLL/7/IY6DAbGJgrpoE2wgBaOEqEaR5sCHH858
         BWK9aNOzTc4mk1MtrSOIZRHRGl6muUn3ZAqIZtgu0ercSb4eGzZ26uaLrNPUTnoT2nrY
         WuRsjiG1ezioTtwrNncNl4RilDnxM5Pd1UrPv7PP8+EVt/RqjX3xUs4iWPzb7/nzyHmP
         igmCe8wtMij2o4kOIJag6wOvDJ/hBbUcy53IcNFSRy8X+Uyk9A3u6Nfu8bVUXUPE5uMN
         Y5uftizgs4Rx2MyihNjSacn5DhyuXEPOJfOOA07hXvKV7QvZSrYTOssGT063Q4qpI+Sj
         6nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678737616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKRFyo+3tUDJl078WQAs1jDYE+5yKAitEL5AqqGitxE=;
        b=CC6Ha4qJygS4wnK5gZW8iUW2+SyOdZZFMkSTEIhQ7b+95lRa0cnju6hHqjsxqvFYik
         uB1r91Ac6A/0/yhQPlR0dAPTPsJEYpf0A9cI8PhA4myzsLXSAhCcpzothMmpZ4TLtmUZ
         IPQ7IiiLiNAG5+78X6nCp5BpZSBRvQ++u2aF2fWlNloeft5vEAe/cx/e9Pnj2W+Hydpj
         Wzks5JOvh1TT8ehSEGkp3tEv9eKnO1mcS0kzUReiLgG9RA8I1ajWK/aEoHswZjTm5Y7v
         JwY+h+xybRp7FI8wAhxkX8iUsBOjr8mny7cKNaMI21ocySleE2a0yaooJq3ewnv89ABd
         QH7w==
X-Gm-Message-State: AO0yUKXsZyYjbOZjMBVDTHzD8ZyXlkTL454uhyL97KyqGVF/vYoekN0Q
        /qZod3OREqxSDmT8u4cJBUyB3ZFTP94W20ELV+o=
X-Google-Smtp-Source: AK7set8eSIYWPnIGSAKERHAgapiGKwl0YTrot7vNBpddpbM//Rmq/pTBIqy3uXR+gPgFqOAzJ0Tm8w==
X-Received: by 2002:ac2:5ecc:0:b0:4e6:dda2:6ad2 with SMTP id d12-20020ac25ecc000000b004e6dda26ad2mr10289972lfq.10.1678737615981;
        Mon, 13 Mar 2023 13:00:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id w3-20020ac254a3000000b004cc800b1f2csm75431lfk.238.2023.03.13.13.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:00:15 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 21:00:07 +0100
Subject: [PATCH v3 09/10] soc: qcom: rpmpd: Hook up VDDMX as parent of
 SM6375 VDDGX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-rpmpd-v3-9-06a4f448ff90@linaro.org>
References: <20230313-topic-rpmpd-v3-0-06a4f448ff90@linaro.org>
In-Reply-To: <20230313-topic-rpmpd-v3-0-06a4f448ff90@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678737603; l=1248;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CcBS01tg5B460uCkFw0c4heaZXq5eBGUm2vrxphKyOs=;
 b=mPrmyxv3rmOSJKoWf04mOJAlSW9vxfOmnZ6lrHG3ULehtA8RbqVB63EAD03Z0CkNA+1/okPuFvn+
 3Jg9BeONCLIEyJjuXMKsVUosBZOoACI4pkvLjJlbEbv1qXqSPuwl
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

The GPU core clock requires that both VDDGX and VDDMX domains are scaled
at the same rate at the same time (well, MX just before GX but you get
the idea). Set MX as parent of GX to take care of that.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/rpmpd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 2027c820caa7..84283719853c 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -216,18 +216,22 @@ static struct rpmpd gfx_s2b_vfc = {
 	.key = KEY_FLOOR_CORNER,
 };
 
+static struct rpmpd mx_rwmx0_lvl;
 static struct rpmpd gx_rwgx0_lvl_ao;
 static struct rpmpd gx_rwgx0_lvl = {
 	.pd = { .name = "gx", },
 	.peer = &gx_rwgx0_lvl_ao,
 	.res_type = RPMPD_RWGX,
+	.parent = &mx_rwmx0_lvl.pd,
 	.res_id = 0,
 	.key = KEY_LEVEL,
 };
 
+static struct rpmpd mx_rwmx0_lvl_ao;
 static struct rpmpd gx_rwgx0_lvl_ao = {
 	.pd = { .name = "gx_ao", },
 	.peer = &gx_rwgx0_lvl,
+	.parent = &mx_rwmx0_lvl_ao.pd,
 	.active_only = true,
 	.res_type = RPMPD_RWGX,
 	.res_id = 0,

-- 
2.39.2

