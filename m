Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6466AAA07
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjCDN25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjCDN2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:28:33 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9F613D5A
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:28:02 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g17so7031710lfv.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOriah8CGt+wDocjqhLOrYXq452xc5Pi+fEeXp9fgS8=;
        b=tiYbTRQZGVqm467Aj4oeega4VpkInq7di1idcSuPONWc20j9glNSC+zFMeMmrlQ2XS
         BcLH0v4VpcVq6jh9r9v3ryWItNx/IxiR9ZsGhDi8XgWaY0eLR6Db9lDKFo3u2SMuiWXI
         /bk4bEdC93sFqLxU0rupitkiShUgNpT1gJA1N3IEAAphdmYS1qVYy+a7dOhQYcU8c/nH
         tjAqELfRYFr6lVuZD3wgVwJhto6GpHF+Di2AK4qvrYbtd7R4mqd/GtNKdaJxD0Zimv8z
         CWHBVfiH+BHa/Q5WHsqgdMWAfUnHNqiH7kEuXY16ovV7n2YpX9kzlej2w2VFMIZtyalu
         z2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOriah8CGt+wDocjqhLOrYXq452xc5Pi+fEeXp9fgS8=;
        b=pn5XZzhWjKacZfHy4Yd4ZBEjTJLkdqPfFQfGs1VoUq+vXu+tx3uD7lfNKIYqDhKK5Z
         rPGANnWwICDC7u8FW/zlNNCf3069ezN9TEMXRkj7ogHiuBL0bGIJec80DAbxF33aVdnZ
         ip8XykOq7Mrt0rMLomZXwg9OOcBNlsjo3VLfYIFDaBqcLPgqD2HZb1MZCKFwQ8142g19
         2uin7lTN6JXv/Jfx7EGpWFymlCd8v7rBsbNjlLeApfdCvN/6sKGqtcMKPkoVmY9vFnuG
         8uMFOrCKpmuRbq+D8aE7jt/depbiiSu9Qz4okhbPdGw9M6oN0geTbRgBtT8IjwyLTVfQ
         YlsQ==
X-Gm-Message-State: AO0yUKUz5LAxsxqTxDsT7wlZIvieS/7G7H0GkiFD8sPoOtPMeUf/PbGj
        A/uYFq1LsD4+EEdgauXtS2V2rA==
X-Google-Smtp-Source: AK7set+uhvc/id/nBQp33+BPz/ixczFmnZrXi4qXutVxg2FabCyWbt1RqcFCziJutJ7FbDDXl3TEXg==
X-Received: by 2002:ac2:4947:0:b0:4d5:96f3:61a with SMTP id o7-20020ac24947000000b004d596f3061amr1229303lfi.6.1677936481680;
        Sat, 04 Mar 2023 05:28:01 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:28:01 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:52 +0100
Subject: [PATCH RFT 17/20] clk: qcom: smd-rpm: Add keepalive_clks for
 SM6125
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-17-d9cfaf9b27a7@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=760;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VK4g3BsSe83Idt8jQ7iBMSR7RQiEu45t1paO0zX0Ibg=;
 b=fxaQkNzN1IN1hgxn/a6rWWWUjNjheLcEtdZnZdf5H2rj/V1dCTUzkXTVoCh5Lnxo+6s9B46zJoj2
 vOj7reSSDDHPVHY0MCwkOmvV02kn+QUnfIKWPul51NcggBpedXnf
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM6125 requires that the CNoC&SNoC clocks always get an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index dfcb2020b7b1..a5171b818d15 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1148,6 +1148,8 @@ static struct clk_smd_rpm *sm6125_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
 	.clks = sm6125_clks,
 	.num_clks = ARRAY_SIZE(sm6125_clks),
+	.keepalive_clks = cnoc_snoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(cnoc_snoc_keepalive_clks),
 };
 
 /* SM6115 */

-- 
2.39.2

