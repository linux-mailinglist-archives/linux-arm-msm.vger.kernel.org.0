Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F6F18743E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 21:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732586AbgCPUtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 16:49:08 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44248 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732571AbgCPUtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 16:49:07 -0400
Received: by mail-oi1-f193.google.com with SMTP id d62so19295601oia.11;
        Mon, 16 Mar 2020 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FwKpB9dezgsGNUxz1nNOwjc19tHL0rqvKXfkEKEGY/8=;
        b=Cb7/GBkJLJp64RKa6AX44fXcNNPL8ZxndHUjn6sCAS1kZmVV5zk73GoaBGgjU6kSwA
         ubqfcHH14i6g1cKZE3HE1EV1CVFheG266PjCzYpwTesYO7cEyfmagMQScGUavZrbD19R
         AOAC9gQWjHkeg4XZ48ScRd6VJ4qChPu9ncAxdshFtGxdbvLuk6pj/y957G1WIMLcuphj
         byLdZWV5ODm7ZGkHvlCZjRGCEIdy4Lon2IZDi7flQJSOqnMpadaB3QENWV7kKpjuuz1P
         JzaIoZEiT14M4Dxdd9pZNGZHeSaMQ6DnGrP0dAivYFBMf29HFrWkJhDyITbYM8j/GLba
         aV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FwKpB9dezgsGNUxz1nNOwjc19tHL0rqvKXfkEKEGY/8=;
        b=fU+Spf9nyYjwgXWGZ8OCXMz6r8DH/hBQxtZ42BqOPe8MX4otS5mvev2ZvLB1Ccp2YR
         x27tft/YRzHCKRkc+1AFDGUrlv+dNK7H7a2jT8lf6Gd8vYT4/A1Puo2Anj2aptD66D4V
         cJM02ePVT5Wjw5/obK4cyRwDkWFTU4Inmdy7YzYdFbleb5E7K21NxlXZiXYM+yUb8MWC
         hIx/hOxMrjW630LyEVWdvV0uGbLz56Bb9sb9cjQMhNlkbCpdeOkSORr828d3hQKBZgX1
         E67kV6ZX1+d20ezOpyQdgov/FQ+ZgzAajhMDHDhTWNkBoaKL4GO8L9vKsqoZPp7u1phJ
         jTVA==
X-Gm-Message-State: ANhLgQ2pNM6GBbSA4NOHnCQdlt6MgWgMOWa7RgEKJUEtKE4eaBOZOHaG
        xK/tugpZ04fLty8/p5XwFsw=
X-Google-Smtp-Source: ADFU+vvEjYOEDnaDrK2AIBMJUjh56ynJDxAdBGrx8W7H91Yx5yY0DH5GhjJyoGX2Ad4wDgRML4TLvA==
X-Received: by 2002:a05:6808:4e:: with SMTP id v14mr1083539oic.70.1584391745414;
        Mon, 16 Mar 2020 13:49:05 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id c1sm329747oib.46.2020.03.16.13.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 13:49:04 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] soc: qcom: pdr: Avoid uninitialized use of found in pdr_indication_cb
Date:   Mon, 16 Mar 2020 13:48:55 -0700
Message-Id: <20200316204855.15611-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.0.rc1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clang warns:

../drivers/soc/qcom/pdr_interface.c:316:2: warning: variable 'found' is
used uninitialized whenever 'for' loop exits because its condition is
false [-Wsometimes-uninitialized]
        list_for_each_entry(pds, &pdr->lookups, node) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/list.h:624:7: note: expanded from macro
'list_for_each_entry'
             &pos->member != (head);
             ^~~~~~~~~~~~~~~~~~~~~~
../drivers/soc/qcom/pdr_interface.c:325:7: note: uninitialized use
occurs here
        if (!found)
             ^~~~~
../drivers/soc/qcom/pdr_interface.c:316:2: note: remove the condition if
it is always true
        list_for_each_entry(pds, &pdr->lookups, node) {
        ^
../include/linux/list.h:624:7: note: expanded from macro
'list_for_each_entry'
             &pos->member != (head);
             ^
../drivers/soc/qcom/pdr_interface.c:309:12: note: initialize the
variable 'found' to silence this warning
        bool found;
                  ^
                   = 0
1 warning generated.

Initialize found to false to fix this warning.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Link: https://github.com/ClangBuiltLinux/linux/issues/933
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/soc/qcom/pdr_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 7ee088b9cc7c..17ad3b8698e1 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -306,7 +306,7 @@ static void pdr_indication_cb(struct qmi_handle *qmi,
 	const struct servreg_state_updated_ind *ind_msg = data;
 	struct pdr_list_node *ind;
 	struct pdr_service *pds;
-	bool found;
+	bool found = false;
 
 	if (!ind_msg || !ind_msg->service_path[0] ||
 	    strlen(ind_msg->service_path) > SERVREG_NAME_LENGTH)
-- 
2.26.0.rc1

