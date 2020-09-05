Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF20C25E97C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 19:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgIERkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 13:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728434AbgIERkM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 13:40:12 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4D9C06124F
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2020 10:40:08 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id v54so7181674qtj.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2020 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0O2sDN9MRUJx80UJH/oPfzt4dGApmPFTm8Og0trLMlM=;
        b=PQI3pEBu3s9c3wGVmIuNH334mS4Xc4eJzP8j71PrrLcxVfR5EeZBMcR+Auusaw6/Ff
         1Fw+D1h5tmrw410p9aWH+jF5Z6dnxjbIEeE8J+In0S47NcWyOr0vBighN1vBS3/I+N8t
         n9VYeGfCxt7F4CbUBDAUk9DlIoEz+kJfWhdIGY/EY2XPGAsDrKhZQlUhDEf/ez9cb9Z0
         +hIc9YK3pnmY/ms0/Uo1h0c7mEiEpKJx0wPTUtky8whMSvqzRf3vJ0tXk2/adb+V0Xkl
         nyEaTca83iCgVUT5X2KZzNhHyEgCmexoxmyxXY5r6kPXh9lsiSd/W+eN1IAo++f2Wkiy
         iW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0O2sDN9MRUJx80UJH/oPfzt4dGApmPFTm8Og0trLMlM=;
        b=HtsGcvzxClTzfH/Jzpxxc2fFpfkVlEe8Hdpk3e4qDokgcKT69XFECvAVZhnqjJ4uab
         0mrlNVPcvnICw4PNvyw8Xarl+0Bhe2gDTghE55Y5QWmw8I/x/ubTj/IkBoNkooXQ72Ha
         wXl9yDBzVwIEIIuEsBOdDOPmJ9HDlli6G7eOgrII4Tfu3VoQtm4u9TvWqrzbnuJ94k7i
         4HX7vbik6HT9e2X1CH+Rw3WAlq7zj8i0wQlAeIvacdQyFTx1R9MSYthgj5AfUJmUMtBw
         MMUDDsHt3UHfV2C5gfwuNF+N3M7QoRcgFQFMK6nNvSlracugFAgJsDExcvkscco3R9rU
         4w5w==
X-Gm-Message-State: AOAM533ovIs40qwJ49+GLb/A86C5UgsaBhu8DbNSbo3nv18nEngfheF0
        UqIfWbOsaxl5VGGne5qpYOuU6sp1ZoQ/t3uNksw=
X-Google-Smtp-Source: ABdhPJxvu7IqOsyVda774F6SOjLfLez3tafKaihOLf6twPF1uFQYTPqcfzR9nDz531vmBmKxjwOt6w==
X-Received: by 2002:aed:2d06:: with SMTP id h6mr14027558qtd.301.1599327605930;
        Sat, 05 Sep 2020 10:40:05 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 10:40:05 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org (moderated list:SOUNDWIRE SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/4] soundwire: qcom: fix abh/ahb typo
Date:   Sat,  5 Sep 2020 13:39:02 -0400
Message-Id: <20200905173905.16541-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function name qcom_swrm_abh_reg_read should say ahb, fix that.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 915c2cf0c274..d1e33ef1afac 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -114,7 +114,7 @@ struct qcom_swrm_ctrl {
 
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
-static int qcom_swrm_abh_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
+static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
 				  u32 *val)
 {
 	struct regmap *wcd_regmap = ctrl->regmap;
@@ -754,7 +754,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (dev->parent->bus == &slimbus_bus) {
-		ctrl->reg_read = qcom_swrm_abh_reg_read;
+		ctrl->reg_read = qcom_swrm_ahb_reg_read;
 		ctrl->reg_write = qcom_swrm_ahb_reg_write;
 		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
 		if (!ctrl->regmap)
-- 
2.26.1

