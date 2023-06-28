Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E227E741676
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 18:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjF1QaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 12:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbjF1Q35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 12:29:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807EA2733
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 09:29:56 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb8ede27eeso1836747e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687969795; x=1690561795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
        b=DQZ8bQM6OK1Jdf9uCG5L3p0W5NUTxn2k5hoJpqJ89L7veP52vetsvHAr9/3u2T02s3
         FwN4eefSkPJdvODiqNbplGuLRIWZ9Ug+o+/AbFNmiw3XMd8YQpmooiF/N1hUHh6vhSbk
         +ZrenMM5DtHlclnuBwZWPPEv3Ol5pFBCNQrhnDE8PhJzrMoTF3hwMBgVtWxIpX2LQ8Bh
         J8uqKwhu4k/HYE5Y5Jcu11vJbOynqrOf5likeOo+7J2v3/gC2Fd1cRt5h/ihwA/b/FZz
         zFCTB1P8rWz7AkjVdLLpogD/SCEe4jP4gZDSyaMdjoEdjth37IpwKnetCTIOvTGKKC7J
         ohjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687969795; x=1690561795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
        b=ON848edZCirTibdSer1gwSQssvNY3D3ilYRdzq7AgdD2E1HgRf/Fy2u0vfHHSTZW+Y
         r3lDT+pJFdz4Y5wq9hPIS5+SbThYmDllKnC9ORfaOiBNJQflbMwksxGTo6w1lXBaRI5N
         70detRwaIs5BOHoUploP8a0cPAtjuRFC+ern+Wl5/QZamGWIL/513x9jL2kP0AoRR6y5
         Vv8uCf46v8stYniXQyG3HX6oa9hTBjtmVo3EozJqiZVn5WhRqjYi9XDHXehvZYU2musf
         O9MHB4V3bV1pp6JgVIznhPRn+yw/14RGTD+yamBeMH7QQkGWhQRMEPMuIf8N+m2TtGoH
         2tDQ==
X-Gm-Message-State: AC+VfDw1dkesWzFk1e5C3lXQyT6oKo6w6G9xGjODcO2Ftz+cBi6mrC9S
        62Os7kXc88x0pdpgJDyCyJYJXg==
X-Google-Smtp-Source: ACHHUZ4Lrm2R/nQcM5BRiDtkitE2zrl7ditARQnOGBg5dQFQzWYPnI075o/ZH3A36BQhfejWQM+KIg==
X-Received: by 2002:a05:6512:3d26:b0:4fb:89c1:c209 with SMTP id d38-20020a0565123d2600b004fb89c1c209mr4023314lfv.62.1687969794861;
        Wed, 28 Jun 2023 09:29:54 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
        by smtp.gmail.com with ESMTPSA id v28-20020a056512049c00b004faeedbb29dsm1678783lfq.64.2023.06.28.09.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 09:29:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 28 Jun 2023 18:29:48 +0200
Subject: [PATCH 4/4] drm/msm/dsi: Hook up refgen regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v1-4-126e59573eeb@linaro.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
In-Reply-To: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687969785; l=1019;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bdVFkIHME+ksW97iOZJH0yeZoPTsVUfCpblAjJVbJjI=;
 b=k+jAhj46mh/Oof9GvJUQpt/J2u2Kf9BOt4qC0dCu0ivMbU0GBjjqGdhsVkkJrQVyrqAml8JoS
 YHTy+kjdBZUDW1wpX+4zBYjHF71ydli6DvpRMxSVeEkmb7N7RPRelKx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Consume the refgen supply on configurations that may use it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 8a5fb6df7210..1f98ff74ceb0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -160,6 +160,7 @@ static const char * const dsi_v2_4_clk_names[] = {
 
 static const struct regulator_bulk_data dsi_v2_4_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
+	{ .supply = "refgen" },
 };
 
 static const struct msm_dsi_config sdm845_dsi_cfg = {
@@ -191,6 +192,7 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
+	{ .supply = "refgen" },
 };
 
 static const struct msm_dsi_config sc7280_dsi_cfg = {

-- 
2.41.0

