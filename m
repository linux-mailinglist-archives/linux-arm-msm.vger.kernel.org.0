Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C156C779B48
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 01:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237042AbjHKXVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 19:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbjHKXVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 19:21:10 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BF81AE
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:21:02 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9b9f0387dso37372561fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691796060; x=1692400860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fful+AxqmYE+dU51mD7qo91bPYNQGIlD4NDWqh9Wado=;
        b=zEN/dmxjk6WqxCZfEyPuk+E+1AHENtigLNQKFOK8pw76nqbV/3bd2zqroiYyT/JcoL
         Q4J2XfveHk4SAfT4YzVKVZ9YajlGk6wEGztrI73bTks6aBSC2LKoEi0m8oK17ZUPicOo
         +wPgjk3nu+wQiwIUhhWNJJj2nZQOXTig5vKX/BUrVtszPi8SuswEePx/lz2fSiUuTk7C
         yDWil8UB4m5Lq7sVAT9einuEicBOlLFs0J8/v6w502Gs++xihHrT5eXmQi8dakuyPvhQ
         xLJr7JPVjmh6BBzhIuSJr2NvdHTr1Z1+Yq0Dk/b1VakXlDpxzI18CsBdmEDiAYnFAO/x
         O0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796060; x=1692400860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fful+AxqmYE+dU51mD7qo91bPYNQGIlD4NDWqh9Wado=;
        b=EIBNiWXCcBXE98B3uKa9Z45eXrv0NzBQh+mO8crpGPUmtJzw44Y4XoB1FzGdn0/A+f
         8NcJHG+kss7YjlfRyCV++eG4/oHdXM9Fy5eVsBkxwLbNrdFkNk0r1WbduHnhWumvXmr0
         ZHUr0flbl1m0EiLkyVz3vWMdnMkHGJ1uBy4c0zr5E89QnmF4U1cFH4xAsfX1F2u9n8rO
         PnMAPpymyG9qDU6EZkg9o1GT3Uhe2IYQRvc2ibqAHgJQb/0Nq75ZoE7x3s0gTtZp/dDx
         cWrRt6WO6ra/g9ZiGTiLBdoCGO2sC0aKRVJzr8ZZcbtfAjMshqlrqyQsYYp40GL8kHN3
         aDaA==
X-Gm-Message-State: AOJu0Yx/Mjaeul5jTjqY1vegUfrbCzjSeZRowie8dBl8iSy+0UVkmHEd
        V9Z37RzQR3YBSHmD2s8Gnnl8Ng==
X-Google-Smtp-Source: AGHT+IF/MUIzcPuIpnek1arfxqbX3Znj3Lx+fIc1W3XyR0SdLjtUCMk07FdUjQlLRrngYOji6hwHeg==
X-Received: by 2002:a2e:a0c7:0:b0:2b6:ddab:506a with SMTP id f7-20020a2ea0c7000000b002b6ddab506amr2632989ljm.34.1691796060763;
        Fri, 11 Aug 2023 16:21:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id z26-20020a2e965a000000b002b9ea00a7bbsm1038210ljh.60.2023.08.11.16.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:21:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 12 Aug 2023 01:20:51 +0200
Subject: [PATCH v2 08/11] interconnect: qcom: sm6350: Set ACV enable_mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-acv-v2-8-765ad70e539a@linaro.org>
References: <20230811-topic-acv-v2-0-765ad70e539a@linaro.org>
In-Reply-To: <20230811-topic-acv-v2-0-765ad70e539a@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Richard Acayan <mailingradian@gmail.com>,
        David Dai <daidavid1@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691796047; l=732;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=vlX1nbp+aVK3sQxSDZm3JHUvgDXlVwAH8CqmMnwo5g0=;
 b=HUCeIdx+9xx9PdHE9y4UjVk06D8q+CADG8I2BuT8V2Dx4ZRE45FoUwk/iZS9WijxKbXGGbirX
 4yvXc/9J7eoBheq3uIRkjUcIXSQzZrG3lFrA+C+nUwyDy3iyz7cQuyB
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ACV expects an enable_mask corresponding to the APPS RSC, fill it in.

Fixes: 6a6eff73a954 ("interconnect: qcom: Add SM6350 driver support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sm6350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sm6350.c b/drivers/interconnect/qcom/sm6350.c
index 49aed492e9b8..f41d7e19ba26 100644
--- a/drivers/interconnect/qcom/sm6350.c
+++ b/drivers/interconnect/qcom/sm6350.c
@@ -1164,6 +1164,7 @@ static struct qcom_icc_node xs_sys_tcu_cfg = {
 
 static struct qcom_icc_bcm bcm_acv = {
 	.name = "ACV",
+	.enable_mask = BIT(3),
 	.keepalive = false,
 	.num_nodes = 1,
 	.nodes = { &ebi },

-- 
2.41.0

