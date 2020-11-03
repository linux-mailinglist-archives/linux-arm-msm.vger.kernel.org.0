Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02FC2A49BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgKCP3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728567AbgKCP3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:35 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131F8C0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:35 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id x7so19026863wrl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6LcLORed/eRcqDz+15+2dFY024jFSnB72dDtXU8CVP4=;
        b=sH3tSij4e2JXoVjfPBQ6g8riNJv08P5aobIjgmRhr+/oMHK6xFROnfShQu9+Uv2TbZ
         B6XHn9ghMLRkkHOoDh1Ya1eOCQgiakM+fKtKFxQyyLJV52Os4YVWRSanFuJHHzxmunW0
         X+SYf5bK0RSU5TibslsGUgzTh3+tha+zXqBpEFehQ+x39MVh+SEXA+INfEWYARmSL7E6
         tRCvBH6uFdOHAmnKTpCj7uGCkK3C+gql2NrTMQpsAgfoYJO7Gt6HWfTU7tLZw3yvNwSJ
         z6zi+pBYs8kVOWjctAFF/5riCzh8fMEPD+A7K467/36DnZAzRveNu6uo62OmN6HTWu14
         oDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LcLORed/eRcqDz+15+2dFY024jFSnB72dDtXU8CVP4=;
        b=AepwjNVj9t8l9QeO5mbprSrhiBUgkpIre/iEXFEbbLwDsSUuqMQWGpKS1nb3b2iiCs
         0lN9gyKsd2dTgnDAC1jMis5kg+0/LySTiPGfal/IyR7a+Khlxo4YfoAj9OqWNHW3Zglq
         ashF3qcPRLlYjaq1DtibvSiP+cCK0y4Pm98CsVlcIj5yyiiN6DEuGKp7wxNaonmX22sZ
         W2mIavKXDkvx/m7hYnWH0KsStZJiJaMlApOkzxyAfwwRZiGfuwBI/1IxyWq/kh41MkGn
         3kt9T/Wni8WmX+JSCIzGQl1n/xkOq/v4iU9/8mVOxxn1QEE5t7zqd6GNpjIUfVsg9265
         hv5g==
X-Gm-Message-State: AOAM533hdD4KrUqtuklzmeyNDbbXdF2HjsUThV55kEurJXKSRDVSUeqp
        gkncs2s4m6499eRsKvOCXQ5qqQ==
X-Google-Smtp-Source: ABdhPJzmEMb5hlUmWHwxx79VDvjikYpwPHslaSGaQMUNH9Aku0+bFz9qKAtJR2LmOFjS1GfOsx+zhw==
X-Received: by 2002:adf:e486:: with SMTP id i6mr26809923wrm.397.1604417373813;
        Tue, 03 Nov 2020 07:29:33 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:33 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 18/25] soc: qcom: wcnss_ctrl: Demote non-conformant struct header and fix function headers
Date:   Tue,  3 Nov 2020 15:28:31 +0000
Message-Id: <20201103152838.1290217-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/wcnss_ctrl.c:81: warning: Function parameter or member 'major' not described in 'wcnss_version_resp'
 drivers/soc/qcom/wcnss_ctrl.c:81: warning: Function parameter or member 'minor' not described in 'wcnss_version_resp'
 drivers/soc/qcom/wcnss_ctrl.c:81: warning: Function parameter or member 'version' not described in 'wcnss_version_resp'
 drivers/soc/qcom/wcnss_ctrl.c:81: warning: Function parameter or member 'revision' not described in 'wcnss_version_resp'
 drivers/soc/qcom/wcnss_ctrl.c:122: warning: Function parameter or member 'rpdev' not described in 'wcnss_ctrl_smd_callback'
 drivers/soc/qcom/wcnss_ctrl.c:122: warning: Function parameter or member 'priv' not described in 'wcnss_ctrl_smd_callback'
 drivers/soc/qcom/wcnss_ctrl.c:122: warning: Function parameter or member 'addr' not described in 'wcnss_ctrl_smd_callback'
 drivers/soc/qcom/wcnss_ctrl.c:122: warning: Excess function parameter 'channel' description in 'wcnss_ctrl_smd_callback'
 drivers/soc/qcom/wcnss_ctrl.c:272: warning: Function parameter or member 'priv' not described in 'qcom_wcnss_open_channel'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/wcnss_ctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
index e5c68051fb175..32bed249f90e5 100644
--- a/drivers/soc/qcom/wcnss_ctrl.c
+++ b/drivers/soc/qcom/wcnss_ctrl.c
@@ -68,9 +68,8 @@ struct wcnss_msg_hdr {
 	u32 len;
 } __packed;
 
-/**
+/*
  * struct wcnss_version_resp - version request response
- * @hdr:	common packet wcnss_msg_hdr header
  */
 struct wcnss_version_resp {
 	struct wcnss_msg_hdr hdr;
@@ -108,9 +107,11 @@ struct wcnss_download_nv_resp {
 
 /**
  * wcnss_ctrl_smd_callback() - handler from SMD responses
- * @channel:	smd channel handle
+ * @rpdev:	remote processor message device pointer
  * @data:	pointer to the incoming data packet
  * @count:	size of the incoming data packet
+ * @priv:	unused
+ * @addr:	unused
  *
  * Handles any incoming packets from the remote WCNSS_CTRL service.
  */
@@ -267,6 +268,7 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
  * @wcnss:	wcnss handle, retrieved from drvdata
  * @name:	SMD channel name
  * @cb:		callback to handle incoming data on the channel
+ * @priv:	private data for use in the call-back
  */
 struct rpmsg_endpoint *qcom_wcnss_open_channel(void *wcnss, const char *name, rpmsg_rx_cb_t cb, void *priv)
 {
-- 
2.25.1

