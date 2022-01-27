Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEAE049E303
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 14:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241403AbiA0NCu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 08:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238381AbiA0NCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 08:02:50 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198ECC061714
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 05:02:50 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id c24so3560531edy.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 05:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeVrfXRiA/Z//HiAisq12dm/ACVeh9IJbIggThIJWrg=;
        b=T6MoQ6Mz7R494soC6mRyuhUTo5MO6w6umoo13tC58PNOlHn8ixbKHDx/ht0cvaPNXu
         W403+kp10BwKn2Dl9azMMCYJ2O7S5NEvVJ8EDDTIAfdJ2qb+dwPt9w8xlM7PUGrBpq8J
         ETxI/YK2FgUpnDZsmDd8bZ0rTmpdO5J4QjiXRvZ3mYD6maKkIIxZ0vU5PeGKkeDKHOL3
         3sVedy/1Al3mre6Zj2ct/0TTcDKlkoeRUnXirMJfgRWbA82T9EDIDuIh2K2JT4sT7Cs7
         XDhgSlss0VPx9T8eXQ/Nq+hjmboDpQsUR8/oj9vSOdGTswlqtnhO7/l+HKYUIdEZl9qF
         zy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeVrfXRiA/Z//HiAisq12dm/ACVeh9IJbIggThIJWrg=;
        b=PAlY/1XBdY3CC2njYCX0hhGtji6AtOUXfTxLJvyJDnRfeoG61dsYR7C0jue1iwHTw0
         XA8wPIyQ4S/i14536/Bqhvt/U15Sua3iJCNPH/Bjj4jJx0S9E3IIEuFTEvQUbe2DOEw4
         aaL5zzhDhUkJiA++1yekpNNe+xBTNBuQF1+wxip9HeTTHy2f+LfjhkOpg0SBi6CNvFya
         bJgOZlmPVyqGQg+bSeF7EZ2Ai7s+t6pk0ch9PDnU7+HNIj2cA29j3ZTThf554SmvtY6G
         sBwnNlMWUDgq7z9UIl6CcQDg7wBq4PKQrwR9+4VMyw293T4Os02znZowDHhnnbLtbmpR
         wvSQ==
X-Gm-Message-State: AOAM533idTPfdIQYMQ2b7/VDNlyAi3jEj+/phGbV6P6cMnF67wAA3E8Y
        iawDUeurpZGnrBtzK82DblDgtw==
X-Google-Smtp-Source: ABdhPJzHlRzs7ubUO9oh0RObD1YEaP3tN41AVUNYzI+hINmrw9SW0CMbu0PjEORzEdTnZxvXq3jHMQ==
X-Received: by 2002:aa7:cb17:: with SMTP id s23mr3519845edt.282.1643288568672;
        Thu, 27 Jan 2022 05:02:48 -0800 (PST)
Received: from bell.fritz.box (p200300f6af0b1300a70c0d30e044053b.dip0.t-ipconnect.de. [2003:f6:af0b:1300:a70c:d30:e044:53b])
        by smtp.gmail.com with ESMTPSA id n11sm11380621edv.52.2022.01.27.05.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 05:02:48 -0800 (PST)
From:   Mathias Krause <minipli@grsecurity.net>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Mathias Krause <minipli@grsecurity.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] misc: fastrpc: avoid double fput() on failed usercopy
Date:   Thu, 27 Jan 2022 14:02:18 +0100
Message-Id: <20220127130218.809261-1-minipli@grsecurity.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the copy back to userland fails for the FASTRPC_IOCTL_ALLOC_DMA_BUFF
ioctl(), we shouldn't assume that 'buf->dmabuf' is still valid. In fact,
dma_buf_fd() called fd_install() before, i.e. "consumed" one reference,
leaving us with none.

Calling dma_buf_put() will therefore put a reference we no longer own,
leading to a valid file descritor table entry for an already released
'file' object which is a straight use-after-free.

Simply avoid calling dma_buf_put() and rely on the process exit code to
do the necessary cleanup, if needed, i.e. if the file descriptor is
still valid.

Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
Signed-off-by: Mathias Krause <minipli@grsecurity.net>
---
 drivers/misc/fastrpc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4ccbf43e6bfa..aa1682b94a23 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1288,7 +1288,14 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 	}
 
 	if (copy_to_user(argp, &bp, sizeof(bp))) {
-		dma_buf_put(buf->dmabuf);
+		/*
+		 * The usercopy failed, but we can't do much about it, as
+		 * dma_buf_fd() already called fd_install() and made the
+		 * file descriptor accessible for the current process. It
+		 * might already be closed and dmabuf no longer valid when
+		 * we reach this point. Therefore "leak" the fd and rely on
+		 * the process exit path to do any required cleanup.
+		 */
 		return -EFAULT;
 	}
 
-- 
2.30.2

