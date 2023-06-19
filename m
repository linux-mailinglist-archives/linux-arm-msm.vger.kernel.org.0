Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E07E2735C5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 18:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjFSQoe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 12:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbjFSQob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 12:44:31 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BEBE64
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 09:44:29 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b45c289615so46308781fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 09:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687193068; x=1689785068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFAqDiLltNdklyeWnFl2VhcGAm3uwoOV8Onj4m150Sc=;
        b=ydvczJg9iNkM262T5XB6cmLMaJVfVu7iYHqszB8VXkxPeO5NQ9+exlDXnGKGIe/7TJ
         OYe/SfNNS6DnMMSL+Bd9RN+tuFtwo+voglslPDHyFEiF0kJami83CNgVtn5fGpkMnVOV
         aZlL6SCjcvi+Bmqgi1cZ8J5LaQslfcscVzbcJCzL8FTAhqRF3fjW8/52N+PbPIbm/a0y
         vVsHNDTVwgQhvhyFskNDxBVxsPrWEebE8qk4Y0bH+ql076gOj8h31mOr8w9UAoJqGd5C
         TAhrSJ0hB9i3FqOz7rqBP2GSNGpet5dyP6+lbLKboYmYxd9gxRzbCFNbX3xD8OP71z8O
         oO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687193068; x=1689785068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFAqDiLltNdklyeWnFl2VhcGAm3uwoOV8Onj4m150Sc=;
        b=TF0prVt0ipYT+Tc+Y0xtSDTzi9zvpc6hI66yZwwQuz71xFfAReVyoTYAk6F10jQBGf
         YaDgkbK2EaXu+SFzlZbCtkgtgiUNiTcajvGPCXDtq4q00QhrXiNDzqFtJzDEloGtjb1n
         SjOQVhcRdYhvahop/9+qTJC/25YNgppNTerHFE/TPkPWKKOuaPRbEIOq3hO3jRDbtAND
         i7BhgsRFzABRpC2gWcPwwqrm6iCuBEaR2NLHTa/3RjRSFdhACskbkce4V244aV21h8lt
         ZQUd89toqNUbSSeK3viZONOKckdM6k/q53fYuKH/wKT0W1xufMiWjghqsp8Q+lNm2SPs
         XBLQ==
X-Gm-Message-State: AC+VfDwadAr7S8yDU5RSIvYPrST4bFJeifEBVLThk5Zs37ueK3PZ2DF5
        beJLzrd0qA+RPYoTJ+Iw2EzaYw==
X-Google-Smtp-Source: ACHHUZ6GvqCREQISOX1d7De3EJU6DKvTJPcAypBgXVFT0pSTLd/AWtoPgTlrqTVKu+0llNXPSU3EBg==
X-Received: by 2002:a19:505b:0:b0:4f8:5af4:73ef with SMTP id z27-20020a19505b000000b004f85af473efmr4160229lfj.28.1687193068133;
        Mon, 19 Jun 2023 09:44:28 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id d9-20020ac24c89000000b004f849605be7sm1774293lfl.292.2023.06.19.09.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 09:44:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 19 Jun 2023 18:44:24 +0200
Subject: [PATCH v3 4/6] drm/msm/a6xx: Ensure clean GMU state in
 a6xx_gmu_fw_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v3-4-a3ce3725385b@linaro.org>
References: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687193061; l=1213;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xLnqc6AHpOSP+ED80kyz8V2j7nuk18OJ2Jy8h13Cf1I=;
 b=dCZGseLgFqy+mQCr62XX8kh4lVXddSmsA/R+OcREroBFhCmvIVQXZ/rLg2/fzr8nh4/9VxGJU
 hqJVr4eX8zFDsryMCP6ihGHaz2PEVQGJ6qdRYjm5iBQfnC1QUYeCZ4A
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While it's not very well understood, there is some sort of a fault
handler implemented in the GMU firmware which triggers when a certain
bit is set, resulting in the M3 core not booting up the way we expect
it to.

Write a magic value to a magic register to hopefully prevent that
from happening.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5deb79924897..9929ff187368 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -790,6 +790,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
 		(1 << 31) | (0xa << 18) | (0xa0));
 
+	/*
+	 * Snapshots toggle the NMI bit which will result in a jump to the NMI
+	 * handler instead of __main. Set the M3 config value to avoid that.
+	 */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
+
 	chipid = adreno_gpu->rev.core << 24;
 	chipid |= adreno_gpu->rev.major << 16;
 	chipid |= adreno_gpu->rev.minor << 12;

-- 
2.41.0

