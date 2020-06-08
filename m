Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAF41F20E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 22:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgFHUoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 16:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgFHUo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 16:44:27 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28459C08C5C9
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 13:44:15 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id l17so4890284qki.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 13:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdQIVrxrcWgdEfMxOy8k0QA3bySSLO8hLrFtwiG/Nyg=;
        b=TbEEcd0epDDJxtIhsogl5/yVZrtqN8SILEvvnLZ04uF86KSRpPvl6jjeQ5Bs6pzHzZ
         5UFr1cbWg585VsBfEbgtnx25trM0iBAtoajfQf7SxJ0uNRyDzLxGyb7xdDwNpixUcQrm
         ogVx/qiWyyCfviUbwYRvXxLOFfwhEgNFigF5l4XH8xjImCG22+dhmbJFPyfWcomU5grl
         3rKuZ0VJlJbOoVufDpACJ1IqJ9lYJo8Nla5Mg1u5r82zlbljt7746AHKw+mWX5n7hLrm
         GerYChWxLd9wH/y9cIhGmE0c4nomibogPkmtXbbUJx6i4AJ1P/TNHdYIRvNVb3ENX92y
         LrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdQIVrxrcWgdEfMxOy8k0QA3bySSLO8hLrFtwiG/Nyg=;
        b=XZ0ifr4eEWUmYM1MMKnUe8j7fUKbpQ/Vy5P8fygmlQC3pRbzRQXLGJ4rEFtmWdohHU
         FMpUiTChJg35wwvGngdGAyttI080AUSRF3nmuMwVTn/QrQ/C4TNcKHCSmvE3bR2M9eDX
         DpTb+B0NqFrM9/MJrH3rpaViR0bteZjkNtKYIcYt2Om3mspEH2ORpTcFrPR4S8yrKnOY
         FGfFDd24SnB4/ng/zz3otyz7o5/AHDIEZloCWN1gWPX1P8BCbt2APREF6rmqi29Wn2hE
         pFWTgkjsIILTovGO70dc7hfY8HQGXBxUe3aq5+wiUJVDOKJ4xQiPDq43l9RBaSBjBUub
         8i2Q==
X-Gm-Message-State: AOAM532XwGezMnG/+z53+cbcSfA2GtoSCpgrqWEQCGteZ0p6e7QD/C7D
        7JLjKHnsHl53vs8opSM5Hu1UYA==
X-Google-Smtp-Source: ABdhPJzI8WbUQ4+5LY+YoO9q2MUZma7oEMCKrRsz1GX/pV0LBOaUljnGhawiLinbYjlLdD5jPvsB7Q==
X-Received: by 2002:a37:b14:: with SMTP id 20mr24490042qkl.401.1591649054370;
        Mon, 08 Jun 2020 13:44:14 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y16sm8895565qty.1.2020.06.08.13.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:44:14 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     alsa-devel@alsa-project.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] soundwire: qcom: add v1.5.1 compatible
Date:   Mon,  8 Jun 2020 16:43:44 -0400
Message-Id: <20200608204347.19685-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200608204347.19685-1-jonathan@marek.ca>
References: <20200608204347.19685-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible string for HW version v1.5.1 on sm8250 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/soundwire/qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 628747df1c75..14334442615f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -880,6 +880,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 
 static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.3.0", },
+	{ .compatible = "qcom,soundwire-v1.5.1", },
 	{/* sentinel */},
 };
 
-- 
2.26.1

