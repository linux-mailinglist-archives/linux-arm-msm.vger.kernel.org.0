Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D52565BBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 18:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbiGDQWI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 12:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbiGDQWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 12:22:06 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9F41A5
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 09:22:05 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a4so16650036lfm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A2qFwSnLsiW7EVkc3E813XYGZuHRrpg/pO4pm3EunUo=;
        b=euipZHQZT4sXCBOaOSFgr57M8OJVUjkVlv1C5RaFP+XFdWrY08YTz+CIFodhLjDAMi
         AsH651Jq78cPQvB2IM5Mym3AuxBaW41TatqYd7T3moaqvb0OyPLAtE1MiHA0lvQoBfLP
         ur7taZZwqsG4mqkCyphy+3L0eZHYjz9+Q5I41Hp6nfqo0NRcRKHvkNKvm+IJ4AxX8Mda
         RcqsyXwTv6K7CGiwDFap5wvZ5aPoU9SAcIONgt/zh+HZN7ll1vbUTEr88+81+RISiauH
         h6/pJXe0Klni2rJEids1r+YWLmlNWx1CBuIziCWQiE36h6kR/wjfQ9T66RlTvkbtU4SR
         S2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A2qFwSnLsiW7EVkc3E813XYGZuHRrpg/pO4pm3EunUo=;
        b=SYi/+4vhGPHIav5ZScF6Qijv4qgPoa+/E9iSS7iQsBUfdQrhaB/StcRJgYYjPyFZA0
         mjDJM8vFikMk4YokbC4mN7QL0Nyehe71SFPXHt5nb8qYl8pEK8Ro6SrVgIP/ByJw+bGB
         4Xl2fWtb+NgKDxN0MyHDS6WJChlNpxEejloR4bEt2cgtK896aFIfoOwY4/dqE0tFUkgh
         tsLKloB/K4MyFb4Qi/bE0nlQsr31AFzry0adzIG4RuFSfHtcsFxfVzqfRaxecf+M6Jrw
         pmh3i+z5DoXqhQJzP5c4oUIyW0+C4M8nLxv9BID96yZBrKHx91q4r7/qJVtfP27ftDLx
         PHiw==
X-Gm-Message-State: AJIora98LkNhNIlc+sFGuMeovT6BCn45g/XbFDN0YDcPoRJrtax1fOkm
        XXgYwfbpgJupMmuhAVX76GmBeA==
X-Google-Smtp-Source: AGRyM1sF35gLEJo0rHAqe44Jce//OPVpItj3C9panisB/tp4x+IKCfw/KQgRKXX2CiZwPRZKZ+dvNA==
X-Received: by 2002:a05:6512:3b29:b0:481:4b9b:b8fd with SMTP id f41-20020a0565123b2900b004814b9bb8fdmr16692476lfv.538.1656951723623;
        Mon, 04 Jul 2022 09:22:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c2-20020ac25f62000000b00478f3fe716asm5201121lfc.200.2022.07.04.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 09:22:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: q6v5-mss: add powerdomains to MSM8996 config
Date:   Mon,  4 Jul 2022 19:22:02 +0300
Message-Id: <20220704162202.819051-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8996 follows the rest of MSS devices and requires a vote on MX and CX
power domains. Add corresponding entry to the device data.

Fixes: 4760a896be88 ("remoteproc: q6v5-mss: Vote for rpmh power domains")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index af217de75e4d..a8aae6f8caba 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2188,6 +2188,11 @@ static const struct rproc_hexagon_res msm8996_mss = {
 			"mnoc_axi",
 			NULL
 	},
+	.proxy_pd_names = (char*[]){
+			"mx",
+			"cx",
+			NULL
+	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
-- 
2.35.1

