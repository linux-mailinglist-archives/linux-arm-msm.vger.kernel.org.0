Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 289511825AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731535AbgCKXOl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:14:41 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37351 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731493AbgCKXO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:14:27 -0400
Received: by mail-pj1-f65.google.com with SMTP id ca13so1780178pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+l8HEEp5z/NJMl2lmZaebCPqD2oTwZcZODCagAmwBoI=;
        b=gZsLsQ905xELdiFXDuvhCY948QmOeq8hgf7WRNwFQYggf7QXDlIrRdkt6RRbcRjNRw
         wCDMWcAZnWj75TZ4WmkroiHz3XAAsw/OTa+lAVRAp2o5sCdGCFOAvvSDqJKeZEUCpmBb
         BpstVVFKwXnMIPEHqdjum/DfKDyUB92ghvYrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+l8HEEp5z/NJMl2lmZaebCPqD2oTwZcZODCagAmwBoI=;
        b=NQAqEkRFvxE11Ssr8X5bKnN3I6rP1t5M8jrPhbWe8AQAU9ehdJTISnad9FCn3guOeh
         +q7QigPI/5vyB+qXOGqol/UjNkGE6r9ptaTsUeNwj8ZQyjoj1BEwdV0kIJj3Y4bzSoxo
         ztaIUXBkTEgDNschcgOlouA4KCuTQWA4mwS3UfURnwbv1rAA18MRAxaJNkI+oY4DS7uo
         +j3aMAqnKgq6merpoYWmw+7XT+ud3hkMAvkWLY0rzg0p4iUe8hMsmxmsC9RgAUWhh3za
         Wep6+XNUI9YwoqgStGhxzI3Zn3p8TJk9wuW5pQjUS8ddTE7uKd61fd6aSO0NFs5yrcgU
         mY5w==
X-Gm-Message-State: ANhLgQ1z7YnVeF+76S3Rw4bI5e1RugLFejoxnau3jWTMrh4i8gsc6HG6
        y8aCm1XW5Zc2im64wOJS+Qj3KQ==
X-Google-Smtp-Source: ADFU+vuyyhI1HC2LBNYvyyv/D6HXeGMLu7hKQzSZUyP6NZso3KnmgOeJay5KNjXVk2vcBMokDpLLZw==
X-Received: by 2002:a17:90a:b90a:: with SMTP id p10mr1029934pjr.81.1583968464591;
        Wed, 11 Mar 2020 16:14:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g75sm2606334pje.37.2020.03.11.16.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:14:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 10/10] drivers: qcom: rpmh-rsc: Always use -EAGAIN, never -EBUSY
Date:   Wed, 11 Mar 2020 16:13:48 -0700
Message-Id: <20200311161104.RFT.v2.10.I537337af59c51c72aac2c1625760a60519c66387@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311231348.129254-1-dianders@chromium.org>
References: <20200311231348.129254-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some parts of rpmh-rsc returned -EAGAIN when the controller was busy
and you should try again.  Other parts returned -EBUSY when the
controller was busy and you should try again.  Typically -EAGAIN was
used when dealing with sleep/wake TCSs and -EBUSY was used when
dealing with the active TCS.

Let's standardize and just have one return code.

If we don't do this then the crossover case where we need to use a
sleep/wake TCS for an active only transfer (when there are zero active
TCSs) we need to either adapt one code to the other test for both.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Always use -EAGAIN, never -EBUSY") new for v2.

 drivers/soc/qcom/rpmh-rsc.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index abbd8b158a63..8b59d07ef94e 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -497,11 +497,11 @@ static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
  *
  * This will walk through the TCSs in the group and check if any of them
  * appear to be sending to addresses referenced in the message.  If it finds
- * one it'll return -EBUSY.
+ * one it'll return -EAGAIN.
  *
  * Must be called with the drv->lock held since that protects tcs_in_use.
  *
- * Return: 0 if nothing in flight or -EBUSY if we should try again later.
+ * Return: 0 if nothing in flight or -EAGAIN if we should try again later.
  *         The caller must re-enable interrupts between tries since that's
  *         the only way tcs_is_free() will ever return true and the only way
  *         RSC_DRV_CMD_ENABLE will ever be cleared.
@@ -524,7 +524,7 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
 			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
 			for (k = 0; k < msg->num_cmds; k++) {
 				if (addr == msg->cmds[k].addr)
-					return -EBUSY;
+					return -EAGAIN;
 			}
 		}
 	}
@@ -550,21 +550,21 @@ static int find_free_tcs(struct tcs_group *tcs)
 			return tcs->offset + i;
 	}
 
-	return -EBUSY;
+	return -EAGAIN;
 }
 
 /**
- * tcs_write() - Store messages into a TCS right now, or return -EBUSY.
+ * tcs_write() - Store messages into a TCS right now, or return -EAGAIN.
  * @drv: The controller.
  * @msg: The data to be sent.
  *
  * Grabs a TCS for ACTIVE_ONLY transfers and writes the messages to it.
  *
  * If there are no free ACTIVE_ONLY TCSs or if a command for the same address
- * is already transferring returns -EBUSY which means the client should retry
+ * is already transferring returns -EAGAIN which means the client should retry
  * shortly.
  *
- * Return: 0 on success, -EBUSY if client should retry, or an error.
+ * Return: 0 on success, -EAGAIN if client should retry, or an error.
  *         Client should have interrupts enabled for a bit before retrying.
  */
 static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
@@ -580,7 +580,6 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 	 */
 	WARN_ON(msg->state != RPMH_ACTIVE_ONLY_STATE);
 
-	/* TODO: get_tcs_for_msg() can return -EAGAIN and nobody handles */
 	tcs = get_tcs_for_msg(drv, msg);
 	if (IS_ERR(tcs))
 		return PTR_ERR(tcs);
@@ -651,12 +650,12 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 
 	do {
 		ret = tcs_write(drv, msg);
-		if (ret == -EBUSY) {
+		if (ret == -EAGAIN) {
 			pr_info_ratelimited("TCS Busy, retrying RPMH message send: addr=%#x\n",
 					    msg->cmds[0].addr);
 			udelay(10);
 		}
-	} while (ret == -EBUSY);
+	} while (ret == -EAGAIN);
 
 	return ret;
 }
-- 
2.25.1.481.gfbce0eb801-goog

