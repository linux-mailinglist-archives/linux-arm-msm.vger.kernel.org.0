Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0486D3A0701
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 00:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhFHWjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 18:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbhFHWjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 18:39:47 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA47C061795
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 15:37:53 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id i68so18328810qke.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 15:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u6nopyLMPAoxnlWDGOhMKYkm1WK9uOWh/Ff2ikgmco8=;
        b=dBhF2i2bWydvlFPWtPw11k5ABHINgqarwasOxXdJvHjzHpPq//xv6ENn8QEff2AKB5
         6RTr1PN2iiMj6Dm5/IePXc65EClycFKHRa4r1HYI51Quz1AwWRNXt0PctID903df2k4E
         3fxOkKp9NEhk4uokyC7zmvgrKMug4sEKShiYerlM9lt2PL1sgfU9WRojKvSIN3arIYyO
         INUix6Vrc59blL1p7kfBavuhce2un0lJtN9Eii3azWXWtusR4wcrGQNNFfaZdMf9+NHA
         EEhUzGGp3MrlN48J9A7pbOBPi0r4wv6RAPZ+jBjERt3pjeS6RtAvkurAbg+ZTwpL2tMC
         my1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u6nopyLMPAoxnlWDGOhMKYkm1WK9uOWh/Ff2ikgmco8=;
        b=hLdmDTowfw/PBWuu9d6QMvdEllxZe32p+dTAlTiVpPrdcwXfr1sE/micZVn2MoPwun
         tZkQWchpDZo1K/HGZobL4ABvzOeqtsNANW6fuWpwHUYwTnpVJIw5O3TnMkiuP2MEvmRH
         /6wcRqBNNphta2B5ng8r8w0y+Kvpwe11x2clWp6uj5WVhuZdmJMLuxYBGJss+bxrM/lh
         hiYeGMikdezqJP3FBb4U7Zwpf6KM6D6z9NvDsM68IHBdCwn/h4ctvwJHD2+riv6fOg1B
         2/dmZ/oMW53MI6MYXulgAgF+G9xaJ7aT/kp7tg0UU8RdTjXybOEx49ExLO+SSdzjFJcu
         cSrA==
X-Gm-Message-State: AOAM533brVjCwhqlbRp1h4PVQPQoo7l6IG1rLLQ8Pm0hfyBtLNbpxWEr
        L/00CpOdQIsHZUQAuLFKdq1PsDvbgyZ9wyeisxFQow==
X-Google-Smtp-Source: ABdhPJyEf9he32H2/O0SLwGOvgHfcVv5obOnWxZINVkQJ04rEadyVM+XaP+tlmuiotkcHfjZKEXwJw==
X-Received: by 2002:a37:e13:: with SMTP id 19mr8285744qko.252.1623191872878;
        Tue, 08 Jun 2021 15:37:52 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:52 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/17] media: camss: csid-170: remove stray comment
Date:   Tue,  8 Jun 2021 18:34:55 -0400
Message-Id: <20210608223513.23193-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a leftover from my original patches, it doesn't serve any purpose.
(it was a reminder to figure out how downstream sets a particular field in
the register).

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index a006c8dbceb13..f0c6a72592f99 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -442,7 +442,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
-	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
-- 
2.26.1

