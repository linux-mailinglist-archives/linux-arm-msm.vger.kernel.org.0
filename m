Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B273369670C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 15:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbjBNOiT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 09:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbjBNOiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 09:38:11 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF3727D58
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 06:38:09 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id w3so10689002edc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 06:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbwaLLKNhRw2CH/nrw0ovwFrmWWG6dVokGMb/AGTKDo=;
        b=o6FxOUADkM6+jev7OF8XLBb8ulB0yBHYWW7KS/Jvjl7APKAUrY3ndxmNtf76PDwtLK
         myMWxT2iBgkpe1WQea46+Cn3Bvrsnijx9cCMFOKxcwUFkPwwwTCKXxH8725KdaHePQB5
         8R5wP7sRng7o7FuW/VqxisACZ0tDaJIBB3aLuYgZjWCqe1P5fo95Je692oyBctZJuXG4
         HqSkkdsRsOzXfuONRqHGTnzV4wk5sSfgy2p/SoyjD5MEf1FJTvMLORDv3NIeWL5no1Ph
         WoiEyB/88QEBnOaXCBNiJaYgsvHRoBMuv0/FBfYqD9/MMS0vp0lkbcYAOqI3DqOf3b+A
         uWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbwaLLKNhRw2CH/nrw0ovwFrmWWG6dVokGMb/AGTKDo=;
        b=pDykfYYWH2Kj2o2a9MCQojR7lVatQDWhjGvFrX+c2J9lReZdVBkn6FXP6KugvFXIBG
         2x/ilUiA0b6E/Y+OInqcO/56T0SdAn4VJmCAFkoB1uhvXQkmGDotwFH4bzKuxBowKhtW
         NrC9l2dZikIxAOHfso855KjLqI3ifKe9G+Ey0jPDCUkyZ/JGFrcO6j0IDNrMrDbEmikp
         l/o+yU/50zvkdqjnSy1sKoLQri632skvVlr2wIKJnLSjej5hLQHAGSmZdANXuRIB21mJ
         lWop+IxX0/1HpwRxnpUU5szUR2UCJfWMUmAEgpyZOUse4870y74zkkLG4lgF/qHuvUnc
         f1bw==
X-Gm-Message-State: AO0yUKVPrPOZi+QFQerPU27u3OD4X4FvFpQVXt2KO3G+5tvlK5yzPVwP
        q2JsUOV7IN2mvUVGxE777gBW6ml1KZ7cRkSC
X-Google-Smtp-Source: AK7set8BWlfIHE7m2lSw4Vbz7HsYPnnwjeAtbenoGOQieDWAUlwfeCkfEH4wWb8IniNt0EO/r+V+bQ==
X-Received: by 2002:a50:9f07:0:b0:4a2:1274:d0db with SMTP id b7-20020a509f07000000b004a21274d0dbmr2263716edf.19.1676385489285;
        Tue, 14 Feb 2023 06:38:09 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id eg21-20020a056402289500b004acb6189693sm5378052edb.83.2023.02.14.06.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:38:09 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/12] interconnect: qcom: msm8996: Specify no bus clock scaling on A0NoC
Date:   Tue, 14 Feb 2023 15:37:16 +0100
Message-Id: <20230214143720.2416762-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214143720.2416762-1-konrad.dybcio@linaro.org>
References: <20230214143720.2416762-1-konrad.dybcio@linaro.org>
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

A0NoC only does bus scaling through RPM votes and does not have any
ICC clocks. Describe this.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8996.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index 1a5e0ad36cc4..45eb8675fb11 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -1817,6 +1817,7 @@ static const struct qcom_icc_desc msm8996_a0noc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = a0noc_nodes,
 	.num_nodes = ARRAY_SIZE(a0noc_nodes),
+	.num_bus_clocks = -1, /* No bus clock scaling */
 	.intf_clocks = a0noc_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(a0noc_intf_clocks),
 	.has_bus_pd = true,
-- 
2.39.1

