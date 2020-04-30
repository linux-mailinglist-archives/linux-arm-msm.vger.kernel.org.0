Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4041C0599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgD3TGO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbgD3TGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:06:13 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DDDC035495
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:06:12 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id r14so299582pfg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PYOJ3yLwIAGO30efCpTPWER9xTfitoIf/wwA38TChl8=;
        b=Sgo48uMdYecKrrgqgwTBEEN3gJutl3bCuqOzq7KuR/qnP+KWyRfVmi7zLQ5yqeoAkC
         KqwRimHiqEjCcNKN8Pr9bLn81TE0h2cpRd22UiT7V+1Q62UOkqJI1su87B/U1Vx16Dcd
         o0vhClWZY/Lzt2KUeVYPfdu+OIVLNaL3L2iwXD5dndzeUzPXDlDaiupZ+OpL0zqQTejb
         G9nQqhHbp1XF4jHO+btSCEITcapnG+p2mrhRTN1OfeLqOSx4dZLVFD6SAFMDfUmpipgw
         LQheJbwURBXnEW3f7c77aP501BU1LdEFKOSXVvywpyxjOn5pbvbk7jE4+7bqA1i183W+
         d7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PYOJ3yLwIAGO30efCpTPWER9xTfitoIf/wwA38TChl8=;
        b=Uw4hgXerkvOLW2ZfDP6u6fREs/Om6kxfP9d8+L/Sk0RKoFJgOJLbtzh3HXHI9owTf7
         xjTutFqW2OUOJ6CfRwhhKffj1xKN5DqHftpMiveVwW/+5kW4UgxARHEEG1w2NYO7pJWw
         3cdAFyJSYCB03xoodPzcFmph23/rDX5MFKQB/ItsV7shm7kbwDIosCxmsBHzzFjQnEaf
         nkCngxhf6Sc0W2b/5NyEtWfTvqVZlTgEqimBObOkJP8Uh1R6dGODT/J/aXAPrk4m5mL6
         ySg2XwwlloXdEjWbEkPpWXZwGHgzhI+0UQKmxXGl5peBLPTGrLbIso7lvKbuZ6L3KKtI
         T5NQ==
X-Gm-Message-State: AGi0PubpN7XzsvmA+/7lvONYz/cge6tbezfnBgKXa3EvQ9V8OoX5p09z
        Y7cl//lKGFPhXUC60wUTWHv4iHRgh58l
X-Google-Smtp-Source: APiQypLKBUFmbFTOo2CXOA/EFneBmv7DqfeIDYQfitIkisaTk6nfw7IXyPd1DrmCC9bPAPrvIOG8pw==
X-Received: by 2002:aa7:864e:: with SMTP id a14mr192381pfo.67.1588273572011;
        Thu, 30 Apr 2020 12:06:12 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id l37sm467863pje.12.2020.04.30.12.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:06:11 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/6] bus: mhi: Fix parsing of mhi_flags
Date:   Fri,  1 May 2020 00:35:50 +0530
Message-Id: <20200430190555.32741-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430190555.32741-1-manivannan.sadhasivam@linaro.org>
References: <20200430190555.32741-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the current parsing of mhi_flags, the following statement always
return false:

eob = !!(flags & MHI_EOB);

This is due to the fact that 'enum mhi_flags' starts with index 0 and we
are using direct AND operation to extract each bit. Fix this by using
BIT() macros for defining the flags so that the reset of the code need not
be touched.

Fixes: 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index a4288f4d656f..3e76dc9cba5d 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -53,9 +53,9 @@ enum mhi_callback {
  * @MHI_CHAIN: Linked transfer
  */
 enum mhi_flags {
-	MHI_EOB,
-	MHI_EOT,
-	MHI_CHAIN,
+	MHI_EOB = BIT(0),
+	MHI_EOT = BIT(1),
+	MHI_CHAIN = BIT(2),
 };
 
 /**
-- 
2.17.1

