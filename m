Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECAA5818A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 19:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238916AbiGZRjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 13:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239533AbiGZRi4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 13:38:56 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49003326D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:38:45 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so649601pjk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nfROAXY/moJLzNsb5FMhoMcqb29l4Ohc3eBLspjd7i8=;
        b=CdKkn2TAJXxhAQ0zVV/bxvv+NtJ21HCRpY2zDxPmR+AKTLuroLHcxjjFP3IX++SaAY
         r4web3polSC0tU3jg59fs/V956n/OI3RrS6OndczV+r94MEKeyJyRNkG6Cc0DEM66YY7
         BIeGKM4svzgyhiOM6KEphErb3pwFkbUp8wUFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfROAXY/moJLzNsb5FMhoMcqb29l4Ohc3eBLspjd7i8=;
        b=OgXRHYRQ6X/MEx7ZPq2tU49sxAGJsyR48oJ1tG4k3ilLWQu1HLtyQ83bpcDwyAm/X0
         NBsLf2WTcmOnSn6ZfXXlx1qn7eQwQcEiL+ouXvS25XYMHf9KBuMjzvimzkN4OJOleym5
         iHzprhVt6mCxypJKgS6fUfaOtQWo2FAOPtkNIT9ipDVmMte2qkUpDbcKQrC07d7TUIWB
         4Ql+UPHgkjtg9bnrkYalhY0EDM1bvehkESPAlYkdpUDM7GyWFj5vSXStcyTcKBEjWgcR
         pnuWM1OhEeXtT7TP4vJuKoLAH+ja5wMnJSHVYXg+9vSs7BJa8gUDA0OrRzqqOW2NZ8XU
         abTg==
X-Gm-Message-State: AJIora+sQSgm5Ap5/HbeEvQ9yJrg+r+wU+9aPsmcsFOJrMUBhb9Lz8Ja
        RZaEIjUOzG8wUs6Jnpsn9bgFzw==
X-Google-Smtp-Source: AGRyM1v4Qxmej3AUYLBc4E4fc1Qdq3OKx2v7JS9BtYZRthjbwBf3uE93fWlt0LAQ9pq0KRrfZkzpTA==
X-Received: by 2002:a17:90b:2407:b0:1ec:dd93:511a with SMTP id nr7-20020a17090b240700b001ecdd93511amr300477pjb.212.1658857124631;
        Tue, 26 Jul 2022 10:38:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:8693:e9aa:75c0:5134])
        by smtp.gmail.com with ESMTPSA id ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:38:43 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] drm/msm/dsi: Fix number of regulators for SDM660
Date:   Tue, 26 Jul 2022 10:38:19 -0700
Message-Id: <20220726103631.v2.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1 regulators is specified listed but the number 2 is specified. This
presumably means we try to get a regulator with no name. Fix it.

Fixes: 033f47f7f121 ("drm/msm/dsi: Add DSI configuration for SDM660")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 02000a7b7a18..72c018e26f47 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -148,7 +148,7 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
 static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 1,
 		.regs = {
 			{"vdda", 12560, 4 },	/* 1.2 V */
 		},
-- 
2.37.1.359.gd136c6c3e2-goog

