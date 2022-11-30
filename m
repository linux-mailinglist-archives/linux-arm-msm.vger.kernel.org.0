Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6107763D65A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 14:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiK3NKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 08:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbiK3NKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 08:10:13 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A726C709
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:11 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id x6so6636925lji.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yMF4tXA4BGGddk6s4itzrTJFApaXVgAQciV4RpoM9c=;
        b=VKBp2IRbMGLiDX+aD/PCr+qlP4id1ivvJgHyx7J3vv36r6Y8qIhZZd+dUOrhkcSUsQ
         lPZuK0z3DTTKS+tdcApCyVLcEFc39QT7OmOu9YciWX3tpCV+HVDlle7gMiy27Aesjwdg
         xPKwRSoxlja8WDBy1wXLaiMtjJNItQ6AqbtYPgmtedPInywQg9tGnxsOg/ZS2xRGiIdR
         3XzAiorAP64gCN++bwWFuG6Q2UtsNRRWn0icLSeNOu75ZA5/MuaZu38IDfHqaxaR0bKR
         xe3MRtcSpmo6fJOCeedXIX1j1SOSKTwktDMG1o1j9UqBHiBlt54pHY+3wjVnl26v6oRZ
         XTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yMF4tXA4BGGddk6s4itzrTJFApaXVgAQciV4RpoM9c=;
        b=Td0XApP/52Ui84psMMaa9UP9ToSHWsm+Bvlj51Ukn9YRGOLoXfuKsQRDD8kDMwdtjn
         1xXgS9DoiZI3KjdOVyE9q3+DxRjAjpE21GOaTpaB6WfavNX8N7Oc5aT2xMlGd5YKbb7I
         Wz1+RqGP8X8HB1ieeTxYHByhc9we+qPh5bTtf0KmyqyJW1gupDSCj8Wkp4Ttg48Lhn3a
         0Vrlie9QtDUtJcMlXfvFoXMLY9sJQI7jaBLqsw6sPl9JH1kU29MSUV79NkAJW0USsX/8
         bDZyn/3qFoacAYA/IppA4mDnrUYnktT++UXqa6Vun11r10UASyBBrCcrblGV9CvKG/4j
         pCpA==
X-Gm-Message-State: ANoB5pnefsjuWO64UztLvLmKKCtvLIxHMNiKY4oc3miuJAiVnmEx57au
        lNq2egYcquMa0uwedT+V7xq2ug==
X-Google-Smtp-Source: AA0mqf63tTdvK++p3YoxsEgvMxGYi8J0irg0ybb6De3RaIJ+YbwMZDnHb/KQPn0hj1x8SupZHPWKvA==
X-Received: by 2002:a2e:9806:0:b0:279:97ef:c1ee with SMTP id a6-20020a2e9806000000b0027997efc1eemr7289861ljj.165.1669813810372;
        Wed, 30 Nov 2022 05:10:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p9-20020ac246c9000000b004b01305732bsm250083lfo.216.2022.11.30.05.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:10:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 7/8] clk: qcom: rpmh: remove the last traces of the platform usage
Date:   Wed, 30 Nov 2022 15:10:00 +0200
Message-Id: <20221130131001.20912-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
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

Simplify __DEFINE_CLK_RPMH macros to use clk_rpmh directly instead of
passing it through the `_platform' argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index dcac84614b06..2bcf725dd919 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -70,15 +70,15 @@ struct clk_rpmh_desc {
 
 static DEFINE_MUTEX(rpmh_clk_lock);
 
-#define __DEFINE_CLK_RPMH(_platform, _name, _cname, _res_name,		\
+#define __DEFINE_CLK_RPMH(_name, _cname, _res_name,			\
 			  _res_en_offset, _res_on, _div)		\
-	static struct clk_rpmh _platform##_##_cname##_ao;		\
-	static struct clk_rpmh _platform##_##_cname = {			\
+	static struct clk_rpmh clk_rpmh_##_cname##_ao;			\
+	static struct clk_rpmh clk_rpmh_##_cname = {			\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_cname##_ao,			\
+		.peer = &clk_rpmh_##_cname##_ao,				\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
 				      BIT(RPMH_SLEEP_STATE)),		\
@@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 			.num_parents = 1,				\
 		},							\
 	};								\
-	static struct clk_rpmh _platform##_##_cname##_ao= {		\
+	static struct clk_rpmh clk_rpmh_##_cname##_ao= {			\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_cname,				\
+		.peer = &clk_rpmh_##_cname,				\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
 		.hw.init = &(struct clk_init_data){			\
@@ -112,11 +112,11 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 	}
 
 #define DEFINE_CLK_RPMH_ARC(_name, _res_name, _res_on, _div)		\
-	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_##div##_div, _res_name, \
+	__DEFINE_CLK_RPMH(_name, _name##_##div##_div, _res_name,	\
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
 #define DEFINE_CLK_RPMH_VRM(_name, _suffix, _res_name, _div)		\
-	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_suffix, _res_name,	\
+	__DEFINE_CLK_RPMH(_name, _name##_suffix, _res_name,		\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
 #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
-- 
2.35.1

