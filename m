Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0A06AAA0D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjCDN3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjCDN2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:28:40 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901E01258A
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:28:04 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n2so6984992lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCdcLmpO8Goo5antdKGZz8iakSfWM1kJytihOCcOfRQ=;
        b=DOmDM9/fyLhGzRVp1KKPof75BpVZrrV9KAjfRqZPHf8qDcPhz0Esu1aTYdI3cDjtFD
         zq9nK7XbZ32EyWSlRQ5sUnXn/qJaiQtHwstmAcSKcDjCH13gf+ov1Kdz+PE6Zjjuq/bz
         wMGQ8JO2Goq/t34EwkpTg4UBNz7rMM5GaSXG7zvb9h5LUBSv0luC8yP+NIHFilwtCASP
         ykXlOF4ZLg309/jpnDATp8OYMMoK0uquz2R8+GaI3zs2iQSluaWcCmZgukh6TVR44BD9
         LleEEqs8oPpPOVZjNLD9eKeIFmrYNMC13tRYfWVYEKnlkAaEZqZo5A9P1CAdpknhDKYe
         CkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCdcLmpO8Goo5antdKGZz8iakSfWM1kJytihOCcOfRQ=;
        b=11guKcxqs2nARuWSki7AJq5vo+A7BaY6DqH4x/7S2ONC+vTZ734kPf1zOMmS/wEXoi
         fDs9cBTPgOt1TqNMHVF6XjvO7XY7p9cyfUq2pv5TF51e5HGh7sleXSgxSUX3UNeGz1JI
         Ygtan9RkDxtgxiYp4gGWWaxR9ouLRCEPlAKYQ4UU61kJiTVvhqPRYiKbdpjaADw31FFE
         Oc/6YLcCqsTM9UC2BqqY/7bSi0rhX1cWnNXY1foakCyuAV8iavcmZ/4+ninc4BY/OAzL
         GpBRylytL5DEWjZLVhtJ59PWveROZPVRqHwzNF5B+DZGgJZTrI/C74FXw2Jck99NRQUM
         QhJg==
X-Gm-Message-State: AO0yUKWXEojOl2J/zEmfSwFvP2NMi4CUBBE6GFzVGAIvdQ+D2SiqwWp9
        2++QuwBpcnHLZauJp6D6O17YcQ==
X-Google-Smtp-Source: AK7set8P2yoFlcX2pQPUAq9KNmjkTyWs7R0Wzc99Rfc1wK2fqznv6fqfSoUqeo5p00D2ZcCwuZ36Iw==
X-Received: by 2002:a19:7406:0:b0:4d8:5e8e:b138 with SMTP id v6-20020a197406000000b004d85e8eb138mr1424745lfe.14.1677936483796;
        Sat, 04 Mar 2023 05:28:03 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:28:03 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:54 +0100
Subject: [PATCH RFT 19/20] clk: qcom: smd-rpm: Add keepalive_clks for
 QCM2290
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-19-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=815;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=8naJyecqQklf10++bIijL/ZoCGk8UDKNEUfnObmFBi4=;
 b=4Jh2Uh7XT953o0LPAYr592Sss349Om2Ubjzd+BJSR0KFRot2Om2JqQftiChbwDlsUej8sRYyrajE
 8jw1K7fZCNu0uv26MLk3lN4DKcVBhMq5H7l06wsoxjI3Yp4dtZr7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCM2290 requires that the CNoC&SNoC clocks always get an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index c3ab882de7ff..2d0efe2cb1f5 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1278,6 +1278,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
 	.clks = qcm2290_clks,
 	.num_clks = ARRAY_SIZE(qcm2290_clks),
+	.keepalive_clks = cnoc_snoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(cnoc_snoc_keepalive_clks),
 };
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {

-- 
2.39.2

