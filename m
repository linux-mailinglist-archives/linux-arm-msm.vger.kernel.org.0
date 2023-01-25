Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA8567A934
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 04:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjAYD1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 22:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbjAYD1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 22:27:41 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBD553E45
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 19:27:37 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id hw16so44120390ejc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 19:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Of7NFsGJ6dqGAjsUeQwxEV3rt7jMOtlUZ9VhdQEQa0=;
        b=Vv+YWq/ZLFVwSUmGldNof4VhE0eGro5/FYUfbdQp9oHRQMSTGpyRi7XyZcKkzyv+/Y
         dbbQDNCuEKlLyLWgsTtsWPCbQjm0XoOlqZyRtcAJHrItxG3lYZxsuJxgZrUXnV+ivWNg
         MQH2+IVLmToBIoxK3QJ/rJb0CJyQ2+a/lxFGRi4e7mQCin0/A+0Zc16HuATJ2Yetz3Jf
         JMOilzuS3jdBmOH56RIjVdT6Nf4X6SBL3R9tLSSoTZ78Joy18RPiqTS3bXFzyOWJOpYQ
         8+OUi6pbPGqrKFsZf912X3b71bnfBGYdbIRrXdkNz+RRCLY28Bz9MG/TjqDa7Bu6BQnQ
         nhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Of7NFsGJ6dqGAjsUeQwxEV3rt7jMOtlUZ9VhdQEQa0=;
        b=D6gDKvqRbAPXMU5aLVkHRtcIFA99FjIhTKoLhGOBFLkHI1N7aaw7DNBTSCi0CJ+aHy
         rFEDs+Zx68kSAOUEFenIWXtjZWi9qReLPoU50IUP2NFpWHKchv6F+OKOOlWkLSFLBJi8
         FbQYqxaUVNAd2mfzbmkEv07ztw/LSIGIVCNJl1Wh9KjS7sKPMoeQ8egQ0ckmOtdZKPGV
         h6mwpSm0s7hHHJSZsdKNrwrAvQmXiutLb7SVyARH4EU6nunSYxjzbxNQO4Rgo5qagc7c
         NgTw6WrSO5YkZDgCOrhv7bUIbpQ7fN1k1SDGsDyjk3M9zKJWedcgY+WFiTjO3UZOetDE
         u6xQ==
X-Gm-Message-State: AFqh2kqMVN3SUX+PUMHOZ5uY9ufnEVeX/ck7/rOgt2Hfu4/rOAQizprR
        kbgGHws3zCbPl/DY3EDhe4pB+fpo9clnNVcf
X-Google-Smtp-Source: AMrXdXuGROdd+Ub5UTmR1okAQsUMYtTrsB7ZgRT1qxH1qis1VrGjk0ERi1SfybwDwHUfweh51rkNuQ==
X-Received: by 2002:a17:906:fb0d:b0:856:6884:675f with SMTP id lz13-20020a170906fb0d00b008566884675fmr32733146ejb.52.1674617256106;
        Tue, 24 Jan 2023 19:27:36 -0800 (PST)
Received: from localhost.localdomain (abyl109.neoplus.adsl.tpnet.pl. [83.9.31.109])
        by smtp.gmail.com with ESMTPSA id if10-20020a170906df4a00b00738795e7d9bsm1742913ejc.2.2023.01.24.19.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 19:27:35 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] soc: qcom: rpmpd: Hook up VDDMX as parent of SM6375 VDDGX
Date:   Wed, 25 Jan 2023 04:27:24 +0100
Message-Id: <20230125032728.611640-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125032728.611640-1-konrad.dybcio@linaro.org>
References: <20230125032728.611640-1-konrad.dybcio@linaro.org>
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

The GPU core clock requires that both VDDGX and VDDMX domains are scaled
at the same rate at the same time (well, MX just before GX but you get
the idea). Set MX as parent of GX to take care of that.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/rpmpd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 9a7da7cead9e..a69182618b76 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -1027,6 +1027,7 @@ static struct rpmpd sm6375_vddgx_ao;
 static struct rpmpd sm6375_vddgx = {
 	.pd = {	.name = "vddgx", },
 	.peer = &sm6375_vddgx_ao,
+	.parent = &sm6125_vddmx.pd,
 	.res_type = RPMPD_RWGX,
 	.res_id = 0,
 	.key = KEY_LEVEL,
@@ -1035,6 +1036,7 @@ static struct rpmpd sm6375_vddgx = {
 static struct rpmpd sm6375_vddgx_ao = {
 	.pd = {	.name = "vddgx_ao", },
 	.peer = &sm6375_vddgx,
+	.parent = &sm6125_vddmx_ao.pd,
 	.active_only = true,
 	.res_type = RPMPD_RWGX,
 	.res_id = 0,
-- 
2.39.1

