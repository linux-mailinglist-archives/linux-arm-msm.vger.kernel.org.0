Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D7E4ADD7C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 16:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239453AbiBHPuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 10:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345827AbiBHPuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 10:50:12 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7979DC061578
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 07:50:11 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e3so17593989wra.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 07:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdCv/e4Lout+hSyC3wopJXpraLZXoqzrPsSBbu5nCgE=;
        b=k8MjIvKrepUHPzOaub+Mhfb8DEajKGDJ/KanDQokW8TtzeUlgriV1KUiSrICmn/NdT
         A54lEz78IAphFK/sNe0G5T0XEYo6Un0B4fN7g5TLvFS9k78KlUVjl28ode3e07uoswJj
         Nb3RgaFDl+b3kV7vWai0upxvqtm37GczB3xpFW+magR1HcPfGUgvEKR5uS2hMXfnBYJV
         c2VO7Mxq3vDpSHSjBszHvrPFPZf+w4WAGeUczlNS4ZULmt/jEhzHRm6EO2T6FrzEoxWl
         5GI1ZLDWyeWL5yGkBSoNY1Vi1tRtgXIkcIk7nh6xNcpsv36vYgmUoltzQOCq+hsgBXBw
         +Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdCv/e4Lout+hSyC3wopJXpraLZXoqzrPsSBbu5nCgE=;
        b=6nio5/+uMGdRAGPUT2bp+sNJH1tNDT33uItnO1WppQULb7rddiMXpSxvA5NwqK7aNC
         Qy3hDddGBcPzmojmE0tT2U2c2fNejGM+xZTSH2eTFh921NLuo/r/qzLSMPv+MtAssb7w
         eaevQZ1pQ8nSWFdhmcD4r6k6phjNddgndYbJK1RZOdP/+sA2NvkIyJCC9uFvDVaLsYTV
         q36cAH/LitXjPZ0VxjA/oLBpYCdfSEr3rpNP2s8D3GtxjJtl4seDrFIc5hsaZCt1Oj51
         9PZWZ720+c/Onq4cjYkntacniNERjXVIAeAk5Oez29AIMAwA5jiZjZmDg7QvI6NPB1U+
         4HoA==
X-Gm-Message-State: AOAM5304ttyBlCIEEDC7APWJ/riXkKCznDi0ddPyLZNTggkz7isHytC5
        5KcHm6PoM10zrFGu5gjpnNwuoMxlhlIlTw==
X-Google-Smtp-Source: ABdhPJz4/1yJUf+OiyO/9YQQMmLN9cBM5av45NCmbvWIJYkMWk5x9XlBbBqtdzRYBiqDC37XrxwcIQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr4253787wrz.500.1644335409911;
        Tue, 08 Feb 2022 07:50:09 -0800 (PST)
Received: from localhost.localdomain (hst-221-62.medicom.bg. [84.238.221.62])
        by smtp.gmail.com with ESMTPSA id n13sm2700503wms.8.2022.02.08.07.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 07:50:09 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: hfi_cmds: List HDR10 property as unsupported for v1 and v3
Date:   Tue,  8 Feb 2022 17:49:57 +0200
Message-Id: <20220208154957.630720-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI HFI property is not supported
on Venus v1 and v3.

Fixes: 9172652d72f8 ("media: venus: venc: Add support for CLL and Mastering display controls")
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 5aea07307e02..4ecd444050bb 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1054,6 +1054,8 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI:
+		return -ENOTSUPP;
 
 	/* FOLLOWING PROPERTIES ARE NOT IMPLEMENTED IN CORE YET */
 	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
-- 
2.25.1

