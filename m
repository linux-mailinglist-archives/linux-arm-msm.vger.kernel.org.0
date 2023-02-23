Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5C86A00C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 02:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbjBWBrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 20:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjBWBrn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 20:47:43 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F0D41B7C
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 17:47:42 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m6so12537367lfq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 17:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCGO18fFeWFx1/oqatAOPTvgztN8ex2StTWWkNQew7c=;
        b=UqcUrP62HrsiAt9Q6uCcF6e86j+YbcDvjBn5qnC2A5wInQidrtGebmp12w1PhJijsf
         eyyLLK+0Rm3o/ycFDsAVvXQrUhPkj2xMqrFkW7yEsYmVAlXyab1/4iezenzh/33xuY4f
         qO08D8OrbEZsTLr2Hi+HxZ++iooZdvz9tTCCMeCktzMRjEpCNl2lgAUFHcpQezwWShrh
         bFyLHOsPYMlgsJwEkMRMJKFpeZJSH9PBiPY4/O/dfUl66wOLOhAi0oLCpH6RUurVYfz0
         LBcVg7pdRIZT6JXurlxjAukXhHn9BDVoNUhMytj/JFr2dKZn5z9f7LzE4iEBt8ElWAJ4
         zC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCGO18fFeWFx1/oqatAOPTvgztN8ex2StTWWkNQew7c=;
        b=OhfZWYBmVrACfg11iGTPqaxCqwcWxQaWi/AvlSrJe/x1UOFjKbIUsfU5TKZK/sYICt
         d0pgyFHXoKVOWZxU+A1MSlJ8TMgEVDWc0Fson1sLj4tGPwqptys9KTpVMkJu0Im3aZ7B
         6zCx5T1qjTzypo8reK4u2nCCSA8kOU9fRTOJIPegtZ6WV3nUj6E/kFftCKggN1sjLLTF
         ltz4eD8k2Q+8zJCP3uXJyCVyz3wWirt6E/u6LW4h8Dp9nboEA0fB4daCPGjHbqrWCXoA
         TktK/UGHjkPnd6KAm+dv5upyL5M5mA/GsvBYmRApzmBGaPteFGTMJWlZqhpmerq/ZDhI
         wItw==
X-Gm-Message-State: AO0yUKWiETiqHx8TFENPyDoTYK5sCEXs456UKnWmtNkMO24gBdZiTfcw
        rLdn9Q9RpiwmcuhHatcMAUndbA==
X-Google-Smtp-Source: AK7set8xB6MQPyyJqTPpJqKVNCu8vdvqHdvsXstaNqRHFGhNsyhWgBlzm2zLSO/JTK2EEOF8sAaHlA==
X-Received: by 2002:a05:6512:3988:b0:4a4:68b7:deb7 with SMTP id j8-20020a056512398800b004a468b7deb7mr4160498lfu.19.1677116860797;
        Wed, 22 Feb 2023 17:47:40 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id 12-20020ac2482c000000b004dc807b904bsm427376lft.120.2023.02.22.17.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 17:47:40 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 23 Feb 2023 02:47:37 +0100
Subject: [PATCH v2 1/6] drm/msm/a2xx: Include perf counter reg values in
 XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v2-1-24ed24cd7358@linaro.org>
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677116858; l=830;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mzjSUO+qHIiKaLiyXFVom/GoyNVpw37b+tvLzQHI5RY=;
 b=sOt90zAVghwEBEdFaBDhwOmr+WDEq6xWWtPbhadU8HLedLihLtGPgw3G+utNjj5nKzLKe9UXi7Sp
 /8dBYiuOABV7JJpxXdNZpynZqYX62ZFL3PLs9g7th7h4bt1MOJga
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

This is a partial merge of [1], subject to be dropped if a header
update is executed.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21480/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx.xml.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx.xml.h b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
index afa6023346c4..b85fdc082bc1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
@@ -1060,6 +1060,12 @@ enum a2xx_mh_perfcnt_select {
 	AXI_TOTAL_READ_REQUEST_DATA_BEATS = 181,
 };
 
+enum perf_mode_cnt {
+	PERF_STATE_RESET = 0,
+	PERF_STATE_ENABLE = 1,
+	PERF_STATE_FREEZE = 2,
+};
+
 enum adreno_mmu_clnt_beh {
 	BEH_NEVR = 0,
 	BEH_TRAN_RNG = 1,

-- 
2.39.2

