Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628D81A6636
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 14:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729409AbgDMMOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 08:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728248AbgDMMOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 08:14:43 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB64C03BC85
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 05:08:08 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t11so2412964pgg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 05:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wj+YzA/86Frd7Zd8PQVfNidgsoO9NUSMQrAh2tNMoqA=;
        b=dG9sYOZUsDVAhsdHt6BN2RGAy6u4VjKhSrkwCY7tmN9DkDCxfHjm0G04Gf7NxoN/QY
         /R89MOOvJfcw+PM4/H0w4RsO6sis/w5RWOWFSGD6n6A2spje73hMrzS5qIrPBBXcfkeI
         yeeB0J+JBRj5FXEsrguoTEQmQ7v61tCzMfR1mqOlDZ9Vp9b+3yGMDvZw63zF//CNPTgn
         /cfEqB3cFt/E6djM0copsYuxrMpl5YeOx099jlDqolposKjQhiTRxZreGsSPxWU9vl9Y
         cYbCkPy9aoQ5lHe+WUVZT5BbVGJlM9qUCamzyUhvZO8y7i5KOrVxpTdYx2TQay9QzW0T
         A/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wj+YzA/86Frd7Zd8PQVfNidgsoO9NUSMQrAh2tNMoqA=;
        b=hp5dvGfLVwfLlPrxJUQa++c3eHHyQgJ0JXFsJe7vOWXxroK2UNsdSg8NOja0TqDVYC
         OyRIllUbSsFmUmvU7Wt+Fe3xZiIgRuCjEucbadASgI9m/7W+QPQe28ooYptjWAL/kL+t
         o24zSvQ+1N6ClpW+h653krJ4TI3+PyJHSpmnwaPKdpbOY5MGUW52FMnaX9agp6yB84Co
         8msUN7BBXjZXnENwB/7bEON3MeucxzWGjbSRYS600D3BtSerA8lhheMz0FL4O4yalSFU
         hzUTCBjXkp67HYoKhartVjdI2uy3P2JuaEbHwlDhdA24lhz9ziV8OJmb4tSBKiyx0djS
         8U0g==
X-Gm-Message-State: AGi0PuY+SVC5DYaKgOFLoAUQalqSbu3jN+a8CBpD6gx5XJ9DNF/HKHs2
        L+kcTMkXtROpkNWReUq0gpvh
X-Google-Smtp-Source: APiQypLVbVZy3eG1BQGA3TqwQvzB8FXO6P1puwgwbPzXylzHbBtdhA9hnLrP3OJm/6/SOygpRQzHBw==
X-Received: by 2002:a63:cc45:: with SMTP id q5mr16453175pgi.270.1586779687807;
        Mon, 13 Apr 2020 05:08:07 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:621d:5eab:c98c:e94e:e075:c316])
        by smtp.gmail.com with ESMTPSA id i187sm8493136pfg.33.2020.04.13.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 05:08:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     hemantk@codeaurora.org, jhugo@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        smohanad@codeaurora.org, dan.carpenter@oracle.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] bus: mhi: core: Fix double lock of 'mhi_chan->lock'
Date:   Mon, 13 Apr 2020 17:37:41 +0530
Message-Id: <20200413120741.2832-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200413120741.2832-1-manivannan.sadhasivam@linaro.org>
References: <20200413120741.2832-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_queue_buf() will grab the 'mhi_chan->lock' for doing the doorbell
access. Hence the lock needs to be dropped before the call.

Fixes: 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 4165a853c189..ed995137c3a0 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -538,6 +538,11 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			 * from dropping the packet
 			 */
 			if (mhi_chan->pre_alloc) {
+				/*
+				 * mhi_queue_buf() will grab the mhi_chan->lock
+				 * so let's drop it here and grab it later
+				 */
+				read_unlock_bh(&mhi_chan->lock);
 				if (mhi_queue_buf(mhi_chan->mhi_dev,
 						  mhi_chan->dir,
 						  buf_info->cb_buf,
@@ -547,6 +552,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 						mhi_chan->chan);
 					kfree(buf_info->cb_buf);
 				}
+				read_lock_bh(&mhi_chan->lock);
 			}
 		}
 		break;
-- 
2.17.1

