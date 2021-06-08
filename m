Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498C13A071F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 00:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhFHWkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 18:40:47 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:35501 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235032AbhFHWkp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 18:40:45 -0400
Received: by mail-qt1-f176.google.com with SMTP id g12so4205891qtb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 15:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t2aDM1URYTj/cZhUOY8AnySlXR+xZP1ewZ8+fSzahOs=;
        b=NM30DSAhLHVqVz4KXkiSrd53diDP2xzYLxrbDTuzjnQ1LK88wi5T91JOoSc/3sPe7O
         rYgBNOrwogUwZql5V2jqtPSD5kMTrupX+/Q9HjJIAhWFC74m9uPp4GyhToyukiOj6qdY
         o6019JAic3YW7BDky/cv2WjvBWTtASIIexqP045kXtPxMc/jBtO1HvucqCknwLqh5knG
         7EQ9/icMOpOfanLjcPr8iRJqUl8CbgycFljqMRfENl2r0UoTDNwT0UtJ6aBnn1vRxQV9
         xCrT8RC3MFH3dTN+I1+7pw4MOFe3lOLEQ3pRQs/WvcAEm3jbbYN2YUGbFAO2JIIG2nTD
         pYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t2aDM1URYTj/cZhUOY8AnySlXR+xZP1ewZ8+fSzahOs=;
        b=d5RWsIAQD3IClojEhH0wfZwevc/jiwDUM4JdGlhkUKgF/yeIYDWyQTKaAVXiLlQZ+F
         rxfdS+hnGVas0B7g/wdeB0hHnL4trqDe42xcH8XBzwQhcngFLUlUfssOemEBQF4RprVB
         gc2RLRZgykyFF9ydWTGSr2hb3+59br+zc+G5gWH+pSHz6wdbaGIHtYAx0HqpZ9MpHAEw
         Y1bJRHYpcRYGei3DirYDkBe88oi2NMZfF6+48Uz1y1IpTxqbgqzd6HpR5Jb3bNT971Cb
         YnR7Nc1oH6rwGMFSInDPxMzfruYoqBHmUdviB7DrxAcI38hyoCdWtMD1tNtcS3CLp6cY
         NJAw==
X-Gm-Message-State: AOAM532qD0Q8f5G6j/cHEj2ue0TUXaFUqCZDzMGfAKBXJoy53VowsU6A
        nAhNNMAGXgVb7hjU0srmT7T/6u7HxCEEAVEXXhJT+w==
X-Google-Smtp-Source: ABdhPJwd3il/U7qh7jj3TzEJIbC6nFaBQQsU/l+UiqmN5Dq8sArZPapbPRL18OhU44Y+bE61KW1ENQ==
X-Received: by 2002:ac8:647:: with SMTP id e7mr23334269qth.156.1623191871678;
        Tue, 08 Jun 2021 15:37:51 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:51 -0700 (PDT)
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
Subject: [PATCH 05/17] media: camss: csid-170: don't enable unused irqs
Date:   Tue,  8 Jun 2021 18:34:54 -0400
Message-Id: <20210608223513.23193-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

csid_isr() only checks for the reset irq, so enabling any other irqs
doesn't make sense. The "RDI irq" comment is also wrong, the register
should be CSID_CSI2_RDIN_IRQ_MASK. Without this fix there may be an
excessive amount of irqs.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index aa65043c33037..a006c8dbceb13 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -444,12 +444,6 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
 
-	/* error irqs start at BIT(11) */
-	writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
-
-	/* RDI irq */
-	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
-
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
-- 
2.26.1

