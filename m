Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DA44743B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 14:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234514AbhLNNo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 08:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbhLNNo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 08:44:28 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67530C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 05:44:27 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so13807025wmb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 05:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1mhRHP4X+oGbr9vUYJw9h3wTdvApii8dNl7z1JaMrVU=;
        b=LidxquP+3NEUrudqx/q2j3ktNE7QBC/g9p9t3UtU2V5eTjk9fFGsiVximNSB2XgX/G
         8w/VOfm57KiT9DGqnTtwCJrVRfF3jKFW4dt9BuQUpCG0N/g6pDTrKAuT0f/q0DbT+x03
         oZb8ZBOO27fjEca5fuvUf4xnv8WzQsKlMmwY0l4wDf53x/oT+FCK8gWOK/+AiJ/zckke
         SrRwrzIB2SHdDQa9Eu1r00UpBw6daOw2lnJcLYWBXVPHNDNSD8Tkcm2vJZPSZkMK6TRT
         TCv3Zgw9ov4JQsjdDPeoYWqm7W8wk9O3YVf1FbwCHnwPQ75YyMx3hP46R5tVAY/pchdd
         lqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1mhRHP4X+oGbr9vUYJw9h3wTdvApii8dNl7z1JaMrVU=;
        b=zUOVwnWDLnrU0gcUYjYD5JvbzGpKZXSU26RiGzUlj7L/AAfmqazHatDgWLSajnViKd
         Avuxo0YAkXTedPTPwFKLBoAymY8hB5iKFZ13gsSzFzZARz9GZiXWpTnwskIxegxc+iY/
         N/aDtgoNuMl4uvgYWinxfSDYYYQPhMkErvy5oKRQnqJ26BuxDKS3+6I7c7UY4I7TSw2i
         EBlKSZUdFnsc6ygD5hMHKTyp8daIJAI7SKXj82C3Udxo4/p39meukl3F1CuWF15BHrCm
         tOwjyM/dCg+YmKBLFzFJKHqyJ4EnqH6x1rWOx8TZ+qs/34Yj4DO2n9/GoSgBPnE5MGQq
         8wdA==
X-Gm-Message-State: AOAM532UHqsm5F/pXA3UXmEK5DAaAhTe8aEMa7tzkLngw8durVoQVx2e
        ZJFIjz4SQGg2z9DZVbTkD/0N1Q==
X-Google-Smtp-Source: ABdhPJx8wSMHkWyLRrDH692NYaXXdnxRsQ8chUdOAHUNC0FVZ122HvTK5AsxIAUFHzJtiKwkNmlwBQ==
X-Received: by 2002:a05:600c:190c:: with SMTP id j12mr7079286wmq.117.1639489465891;
        Tue, 14 Dec 2021 05:44:25 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g19sm2309592wmg.12.2021.12.14.05.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:44:25 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/3] wcn36xx: Implement explicit beacon filter tables
Date:   Tue, 14 Dec 2021 13:46:27 +0000
Message-Id: <20211214134630.2214840-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V3:
Adds check to updating beacon filter for NL80211_IFTYPE_STATION only - Loic
Adds Reviewed-by as indicated - Loic

V2:
Removes duplicate definition of mask field defines

V1:
Downstream provides the ability to directly program the beacon filter
tables. Currently in upstream we rely on whatever is the default filtration
table in firmware.

A trivial packing fixup is required for the SMD structure. The downstream
filtration table from the Linux driver is applied but, we are not
necessarily constrained to using this table forever.

Tested on wcn3620 and wcn3680b.

Bryan O'Donoghue (3):
  wcn36xx: Fix beacon filter structure definitions
  wcn36xx: Fix physical location of beacon filter comment
  wcn36xx: Implement downstream compliant beacon filtering

 drivers/net/wireless/ath/wcn36xx/hal.h  | 30 +++++++--
 drivers/net/wireless/ath/wcn36xx/main.c |  2 +
 drivers/net/wireless/ath/wcn36xx/smd.c  | 87 +++++++++++++++++++++++++
 drivers/net/wireless/ath/wcn36xx/smd.h  |  3 +
 4 files changed, 116 insertions(+), 6 deletions(-)

-- 
2.33.0

