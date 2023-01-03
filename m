Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A32865C287
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237742AbjACOzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237965AbjACOz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:29 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E4C11153
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:24 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id x11so7710277ljh.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9n/FFhUTY9VD7tTjSdjhMRMlO1GqnH3WieAs1MCEsQ=;
        b=ufMMaaYEdTdj3/G5ygjyAvHR134uGb56il2lg3GlT6JnZ+ykpmWKePjsD3UFr36uWE
         z23BVQVun9YIVFc29Lkg9rhU545dGPkm7MlaSlUQgWxADP2NWfvke8cLbBwaA6gPpToZ
         pU7WhbsxNHNQjxznEuRh+YcTwt5DspS0KF9hz3eKionmBrEhSql0kO4l1OOV/FjhPHxo
         CgGZEM6Iyw6vnsa7jM6Y4tpcb+rOOVceo5je0svKFbFOPY5N5CLXtiQl4l0x7hq2Ul64
         Yf+jsSEkLhxlu2wRp4C5YENKuGQRjTI2H/ZiUGnNt4yY0bM5lOovhd2JimoqubMCWo0C
         OlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9n/FFhUTY9VD7tTjSdjhMRMlO1GqnH3WieAs1MCEsQ=;
        b=RgS8X/mbcDgQyhOV3L2Vs7V5XUZIRanQA0+BUdZ/QYWQ7ii/uunagIWCt7RzX179K4
         nmoXH2RIkPet/0YgBpyjtYJ8OwgDM5KvWhK0wgoYz2OEKkk/Jn9innxIOGxume8z7SaC
         a5fEywA+O//CQsitfeD5Sq2KOvi+cn1vZYW/pmggE8xJ1lT0SQhg98OqsoPG1m+rP+25
         TD8N3AWnNFSf2SKh1SRZNE2zuehJojTVXkEx9FeYrb86H2/yupK4EfmhhECISZ6WmQ5G
         P6V8AavrnUCBbYZ5olRg+SZzS8AfFd8ndv0Axa+9x4rpI8VA6MPxq9YSnEET118vqC4c
         B5Ug==
X-Gm-Message-State: AFqh2kpcS9Tzh9p+ukohgy0yO85PPCCnGbP2BX3Y9xV5Ttnj3xcU5afi
        kZZvhT9uqhDAa/usT87IbbuCOQ==
X-Google-Smtp-Source: AMrXdXvZMwb+V5saE9OZueVvbhUbEWB5uvQS0tbVsIlkytotOzcRCnYsm+LRQ8tYeuR9qJsxSvx2HQ==
X-Received: by 2002:a2e:b4b7:0:b0:27f:f1de:8f8b with SMTP id q23-20020a2eb4b7000000b0027ff1de8f8bmr1758655ljm.52.1672757724466;
        Tue, 03 Jan 2023 06:55:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 08/21] clk: qcom: gcc-sc7180: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:02 +0200
Message-Id: <20230103145515.1164020-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
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

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 2d3980251e78..6fa18d4377b9 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -1987,8 +1987,7 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
+			.parent_hws = (const struct clk_hw*[]) {
 				&gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-- 
2.39.0

