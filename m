Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3666F3149
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbjEAM5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbjEAM5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:57:21 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C5B10DA
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:57:17 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso23179621fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682945836; x=1685537836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHlUeuh/pHwqLKIz8o/1xZKZmLDz+WudWNOBRqRlbus=;
        b=X7cxIG9tiNOMWLsNhQ4cTuHzOz/dWFUxC6qoG4JfJZxnsewQ41oZV5FmwYZ4O+wn+r
         y1tTflf7wUkQTO9zVPeYfyv6PgmgIWQ7MsLGbd1h5nU0x9vuHlsY8qgnEJt2lsNbb1oO
         0z9mcyk8fdA04pgS6IHoKbjnGLB01UVvsXpxOZwrlq6WX26rxpAzBRO1YmQr989nrXsf
         ZYOAR9EZPvkwI7IDmbgC6CJWxPzWo1tnc4WfCo7HGl1hZXNtjX1Ab99umUy7YS0skz3g
         cysZR6j38nuVepj28bCuJBHW34w6UJOZ53KDDRzegW1/Ixduk5U9EFlXfiArs2kFPgwt
         e7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945836; x=1685537836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHlUeuh/pHwqLKIz8o/1xZKZmLDz+WudWNOBRqRlbus=;
        b=LNIENoXeR+ow7QLDZN0yNZwROVIKadqclJqRtR9iNF7LtHA6sVZ4sO6DBqLwfgqQ2R
         ioh3l8AKA8p0JmyClSDDnvhHBX1Bwns+VV0dERvif/y0vcsx7qir2SLsHNTD9pMFwJ8o
         Io4DbDfpZqs731u49dh1LqJRTJb2Q0SzK3cm6+Lo8SNMwMQc3mmPHS7pbLCIsbJYrwHR
         KPJRlTQ+YEaqkrvLS+vRswUer2rbVrTnAdXab4Ub0xNPgyWXTij+VFij8LQWYioqa4xs
         JHLwbKiN0Iukz9DK9Asel96hA5BvKgBL4M0QngK6hnqrpTs5sg1KXpJsDqbPVQva6BsB
         xNQQ==
X-Gm-Message-State: AC+VfDyQoEqwYudk6YQgxYwzrt99ybd5ad/bhIujJUYJf1yT25oWcq+D
        AFdkddi/+rZ1GtBb1/03ZmL63YJxnD7xJUma5r8=
X-Google-Smtp-Source: ACHHUZ6Yvaz7TkENMDZRwmk7T31tuBf6DQlIn4I/2P08OK4irLc5OgrKftJEJdZLr7Wu2ovKW0ggLQ==
X-Received: by 2002:a05:651c:238:b0:2a9:f584:659a with SMTP id z24-20020a05651c023800b002a9f584659amr4013592ljn.23.1682945836262;
        Mon, 01 May 2023 05:57:16 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id y6-20020a2e95c6000000b002a77ab1d73dsm58332ljh.96.2023.05.01.05.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:57:15 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 01 May 2023 14:57:11 +0200
Subject: [PATCH 1/3] clk: qcom: smd-rpm_ Make
 __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX accept flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230501-topic-rpmcc_xo_a-v1-1-93f18e47b607@linaro.org>
References: <20230501-topic-rpmcc_xo_a-v1-0-93f18e47b607@linaro.org>
In-Reply-To: <20230501-topic-rpmcc_xo_a-v1-0-93f18e47b607@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682945834; l=2532;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Mq5bwFOL9cmaK290SYW2KDaNzLEfPikSHhS+lIezcWY=;
 b=1ViYumVyzv2y3lEP6jFG3+C5sctZEwY4wUfcjBh34sBwMp5IELQ43UNPr2V4ZTceG/jgWt635//Z
 PoSGoGJEBMX5nQFpp/8sJyYSEvpUsSmgS48+iY31qzzBDL8vGWuX
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for supporting keepalive clocks which can never be shut off
(as the platform would fall apart otherwise), make the
__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX macro accept clock flags for the
active-only clock.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 887b945a6fb7..e559755a86e0 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -67,7 +67,7 @@
 				    type, r_id, key)
 
 #define __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_prefix, _name, _active,\
-					   type, r_id, r, key)		      \
+					   type, r_id, r, key, ao_flags)      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active;	      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_name = {	      \
 		.rpm_res_type = (type),					      \
@@ -102,12 +102,13 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
+			.flags = (ao_flags),				      \
 		},							      \
 	}
 
 #define __DEFINE_CLK_SMD_RPM_BRANCH(_name, _active, type, r_id, r, key)	      \
 		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(/* empty */,		      \
-		_name, _active, type, r_id, r, key)
+		_name, _active, type, r_id, r, key, 0)
 
 #define DEFINE_CLK_SMD_RPM(_name, type, r_id)				      \
 		__DEFINE_CLK_SMD_RPM(_name##_clk, _name##_a_clk,	      \
@@ -126,12 +127,12 @@
 #define DEFINE_CLK_SMD_RPM_BRANCH(_name, type, r_id, r)			      \
 		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(branch_,		      \
 		_name##_clk, _name##_a_clk,				      \
-		type, r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
+		type, r_id, r, QCOM_RPM_SMD_KEY_ENABLE, 0)
 
 #define DEFINE_CLK_SMD_RPM_BRANCH_A(_name, type, r_id, r)		      \
 		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(branch_,		      \
 		_name, _name##_a, type,					      \
-		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
+		r_id, r, QCOM_RPM_SMD_KEY_ENABLE, 0)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_name, type, r_id)			      \
 		__DEFINE_CLK_SMD_RPM(_name##_clk, _name##_a_clk,	      \
@@ -146,7 +147,7 @@
 		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_prefix,		      \
 		_name, _name##_a,					      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
-		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+		QCOM_RPM_KEY_SOFTWARE_ENABLE, 0)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_name, r_id, r)		      \
 		DEFINE_CLK_SMD_RPM_XO_BUFFER(_name, r_id, r);		      \

-- 
2.40.1

