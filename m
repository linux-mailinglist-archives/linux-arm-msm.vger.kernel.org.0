Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B23B640E14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 19:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbiLBS7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 13:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234733AbiLBS6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 13:58:49 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369FC9D2FF
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 10:58:48 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b9so6382004ljr.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 10:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYLBkPQvKI6m8FDI9+U4bFebXHsZ0UiSVbwyNWv16s4=;
        b=jTmdRMsLyvb5UueOjz/zuOWnUkbFqfu120jSlEipvkKSv0bhDrxLmnUI9cENTVY84U
         PN+t18ptmzsDDSDwzqvF+11FlHSrjN6OyV07HFXB3emsnFaFzz28aj743dDIB0XQ3hTH
         IApRH7cx9YivHBZaUJyykQS28y/EWDqF4q8oD2Pc5km5Mq+XUYuJ9jyCyQWUXW/MgGw6
         5X8TaZJBC3yHBjPVNYTP1HJIUv0dTHTyQdNUIcxvcgTIjl6LMvaqkLmDuD3/UurTBTsn
         C9hX0FJWXlQEjFb9L8Xf2ZnqhgKYkMG2Jcmbq3S235o2jOP7w9upGtVGMdgJuDAttZny
         0OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYLBkPQvKI6m8FDI9+U4bFebXHsZ0UiSVbwyNWv16s4=;
        b=BADWnnkHufhGv80egMJoI/u40NI2JSNY/HgZXerhMXRQYKeaDRod/AnpR5Td6byxIo
         y0X+Wtzdo5E33tbYH6tuuUEm8jev0LrPEoNE5S91Zfol15Y9OAmHnhbUdnFXNXN0405Z
         i9PnYDVuykeHdB35zUIWZHL2bOnQgGxSFnrYxwaSBKgJBy67mhqh2H1DpzdEoJGPYhaB
         KRDfjtRIhquFDMWeHHVAqrYVTOb9ZpmHgOAsVLFcNdAuxYwpd47VMgYkxTnxXwMigxQB
         NBuTOEIcJJ9WvIwADTs4F+d8Q2vCPSq2195yElrdN3xNe56YmCquv165NmSv3gO0uwkU
         7auw==
X-Gm-Message-State: ANoB5pmV0Y5pYxXgKNroNlt9Vx6y8G8OYx410+fOnMwldtYy+CJgeovp
        NBiDomSf2sfe+ZPPivUVlrcSsA==
X-Google-Smtp-Source: AA0mqf5mq2XSqMGEKhVNe7AGDpAiizM4oJuMJzBrhdxsdBSMX1PPKa4pReynRWES3zbNjNwnFit6og==
X-Received: by 2002:a2e:9b91:0:b0:279:c810:58d9 with SMTP id z17-20020a2e9b91000000b00279c81058d9mr4116937lji.355.1670007527791;
        Fri, 02 Dec 2022 10:58:47 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:58:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v3 5/8] clk: qcom: rpmh: support separate symbol name for the RPMH clocks
Date:   Fri,  2 Dec 2022 20:58:40 +0200
Message-Id: <20221202185843.721673-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
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

Both ARC and VRM clocks have minor differences between platforms.
However using SoC names directly results in duplication, confusion and
ocassional errors. Next patches are going to drop the SoC names and
encode these differences into the clock names.
To keep the system clock names (visible to userspace) intact, add
separate symbol names that are used in the code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 2ab406c1dab5..34099bb6b899 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -70,15 +70,15 @@ struct clk_rpmh_desc {
 
 static DEFINE_MUTEX(rpmh_clk_lock);
 
-#define __DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
+#define __DEFINE_CLK_RPMH(_platform, _name, _clk_name, _res_name,	\
 			  _res_en_offset, _res_on, _div)		\
-	static struct clk_rpmh _platform##_##_name##_ao;		\
-	static struct clk_rpmh _platform##_##_name = {			\
+	static struct clk_rpmh _platform##_##_clk_name##_ao;		\
+	static struct clk_rpmh _platform##_##_clk_name = {		\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_name##_ao,			\
+		.peer = &_platform##_##_clk_name##_ao,			\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
 				      BIT(RPMH_SLEEP_STATE)),		\
@@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 			.num_parents = 1,				\
 		},							\
 	};								\
-	static struct clk_rpmh _platform##_##_name##_ao= {		\
+	static struct clk_rpmh _platform##_##_clk_name##_ao= {		\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_name,				\
+		.peer = &_platform##_##_clk_name,			\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
 		.hw.init = &(struct clk_init_data){			\
@@ -112,11 +112,11 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 	}
 
 #define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
-	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
+	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
 #define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
-	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
+	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
 #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
-- 
2.35.1

