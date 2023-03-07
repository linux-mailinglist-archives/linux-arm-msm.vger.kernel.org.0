Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459236ADEC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 13:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjCGMcL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 07:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjCGMcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 07:32:10 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DF377CAC
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 04:32:06 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id i20so12879065lja.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 04:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678192325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoKKJZFHs/8MSrXZ3Q3rY87HaTCz1bnlS/tCHR2CSg8=;
        b=iukR/+gr8EDtbfyWkLTmOTMQnMAsxA/0IeNzNwgq/dhuq9kO6YGSJosg68f368zs15
         YstaY/Co/MOS3Qp3JiWxIWMuC21LDZWh03BFpQKUDWfdx3935xpOSs8fPXDwYAIkHcAg
         CH/HQ3F8DMCCNRdR4VFlCJhmbLftuEpuioYs28eaX9BzZHmtDgl/8B9vuHe527AMUNrp
         rt/fT+PhZJbUQKKPYrfjuhZ8oStjiQSkHtyRuHmK/f5NiuCQL9phOn70TJwUaZE5cG4z
         HbdZHc35xbDUnRBrad5Rm5jt3Xau35GnjeMdzmSjIfJ4WjfD8OlEgUt1DqwTCfaFa6a9
         P7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoKKJZFHs/8MSrXZ3Q3rY87HaTCz1bnlS/tCHR2CSg8=;
        b=J8ILpAUhLf0wgCe/+BDgStXfqCQrffF4Kw1dmy87dqZNS9bu4dZMkyq1x+G0wPHfZ5
         nneikM6wK1gH91fhXNUGSoK6I97QpkInn2GsGgRD0daOb40NOIL/fcoUsvF0XJ9gmcre
         29HhtZGWZlppiYpI+eUYpEcZw2p0J7gC3xiLBsgNoUkjYpLY4AeVZ84gXJlaPm3S0vxR
         5v6z/2/Uo/DI4f+v2Mf9N77VGxDsRLbz0NyPIaEIQGhStR9s3XEAVGdaA6nBRjBdJyUY
         qmEWokxakG3IUOETovLAjKFr03ETbEkMtSAdCorYpxEYHSVXby7nOhFoYqaoG6FpFfXW
         Nfew==
X-Gm-Message-State: AO0yUKUIsDuhOrYL9dk7oa43VENmEyJoLCbz53qyq+26WOjoOIWz8Yg+
        q1ue/gm/SGsEVaOU7qtzAhGy7ZwJGb0t8iU6D0I=
X-Google-Smtp-Source: AK7set+Ki5rtSIjZoBN2OEjShpSzxH5VtETDwMehoUs+K6eVTYuj1qKSTqNDshEDr94AhMQdAdLsfQ==
X-Received: by 2002:a2e:808e:0:b0:295:9ba2:8a78 with SMTP id i14-20020a2e808e000000b002959ba28a78mr4869643ljg.17.1678192325107;
        Tue, 07 Mar 2023 04:32:05 -0800 (PST)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e7814000000b0029462e98c07sm2156501ljc.35.2023.03.07.04.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:32:04 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] clk: qcom: gcc-msm8998: Update the .pwrsts for usb gdsc
Date:   Tue,  7 Mar 2023 13:31:59 +0100
Message-Id: <20230307123159.3797551-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307123159.3797551-1-konrad.dybcio@linaro.org>
References: <20230307123159.3797551-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB controller on msm8998 doesn't retain its state when the system
goes into low power state and the GDSCs are turned off.

This can be observed by the USB connection not coming back alive after
putting the device into suspend, essentially breaking USB.

Work around this by updating the .pwrsts for the USB GDSCs so they only
transition to retention state in low power.

This change should be reverted when a proper suspend sequence is
implemented in the USB drivers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
New patch

 drivers/clk/qcom/gcc-msm8998.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index f1aacbfe6bb4..8790bbdcd2e2 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2901,7 +2901,8 @@ static struct gdsc usb_30_gdsc = {
 	.pd = {
 		.name = "usb_30_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	/* TODO: Change to OFF_ON when USB drivers get proper suspend support */
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE,
 };
 
-- 
2.39.2

