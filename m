Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6942827A645
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgI1ELu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgI1ELu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:50 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E10FC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so2787381pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=maouQTMrsxpLVka2tVtG0rlrDbgTOcw+DDAUcgByUy4=;
        b=EnGXoE45L2FBqA4SXbEjfeVSxc2ztg3wwOZ+fEZzRbUGKitcNafLTeyH2WkeYTDkW6
         E2TJ+991gVG7P5Kgy8Gb5EOgKri0dIbX6WoNAFyoWs2yDYa795WIdwT4G4l4Q6RnU2Oo
         ISMqPoaEAjZwff0QW3YKriJHNCqcqr5kZfiM0b8UdnTtgNm3jJyVMv286TY0s+/xVGCj
         z0Ne254IIky1Kqvczz+Qlho3J1ST2Sy+VzzJdMV5ayg3wcJvGqpBWF3ajJRgu2LA1LRB
         s8WoNUtspSS8jrWcPwdD71v7J2lLpU/TZ381A0sNbSs2M6iDnXurVdgLwIOJr+4hWXkm
         eM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=maouQTMrsxpLVka2tVtG0rlrDbgTOcw+DDAUcgByUy4=;
        b=ajL972gZceNX9QBK21kxfj+m5sbLhwWdwRlwzVpZGwMCCUDIEWsK0LDPyPTqqubpA/
         3UquQ4houlWJf2lrmxDxYPrtAzuwO9DJsEzA6uiprpwzXhN24eNNJHcY7Yy8RcRDW0nm
         N1r794INHUu20XVyARRA2AkTkbEilmHEUz7nJCBK8BX+w1horV7Tm9AuCVwl9dJjMbfZ
         gC7H2aWQ/TtboYNY3kVNBJqG6GxxWp/r3Bn6BVACIDrn7u27oofbF5w0mfwAyDfzBrI3
         G738T3sjD06p8ykMiXmWeen7uoQAhpXBF+x9AyhX2hPaDGow7eaccAQbSYciSLpqjib4
         uIzQ==
X-Gm-Message-State: AOAM5330AlIFqq8cxf33Q8Kb80LnU65UzWGU9tTd5oROM4PP/z36+Msm
        L0CYL2uW5+4qISkCYTai4pSz
X-Google-Smtp-Source: ABdhPJyNZWpa3JZqrcjoZjGCi1aIKKfaOSkrrDX84qOzktwQZaEOsv65o+NS1VwYYaPWvm0z4ZX2hw==
X-Received: by 2002:a17:90a:b78b:: with SMTP id m11mr7788468pjr.13.1601266309959;
        Sun, 27 Sep 2020 21:11:49 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 19/21] bus: mhi: debugfs: Print channel context read-pointer
Date:   Mon, 28 Sep 2020 09:39:49 +0530
Message-Id: <20200928040951.18207-20-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

This value was missing in the channel debugfs output.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
index f50d73054db4..3a48801e01f4 100644
--- a/drivers/bus/mhi/core/debugfs.c
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -115,8 +115,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
 		seq_printf(m, " type: 0x%x event ring: %u", chan_ctxt->chtype,
 			   chan_ctxt->erindex);
 
-		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
-			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
+		seq_printf(m, " base: 0x%llx len: 0x%llx rp: 0x%llx wp: 0x%llx",
+			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->rp,
+			   chan_ctxt->wp);
 
 		seq_printf(m, " local rp: 0x%pK local wp: 0x%pK db: 0x%pad\n",
 			   ring->rp, ring->wp,
-- 
2.17.1

