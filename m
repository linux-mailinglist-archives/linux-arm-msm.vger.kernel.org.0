Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A0032C23B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389818AbhCCVr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241656AbhCCRoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 12:44:23 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF8DC061762
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 09:43:23 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f1so38489439lfu.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 09:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=843Cqu10do3AOcdjRFPledKrGoMFl6vHJzmaFjeMBSM=;
        b=zix6/HFrJghHi2HtjcVyWLj0N+uc6HhJDfNpB38u08KjESRVwSyspbvWr93KTIwSfl
         4cbcUGdgY8NwVv5x/WJWPg/BDaMShLrKU+xdao/Sqsrk2WMrmhH1B2xMXh5h+UGckrms
         JLmOflDgf8EGD3FsfoxRr/JupQHIkt2hkS3RFbkFWze5IyS8KmVpzFsHGxsO35F/JWni
         i7Q/FSwCvrva4MASIHcRp4+t5ncbfkg0gB3ZYXNOWFoBgTKVlb5lVkOMAS6A0tLWM4iD
         zfrgGoMRkbuF0wddNl5ovU0IlkSzfTFIZYZdRQjnPxl07z3KSSLeOlCpLwUSM9D4QQ9D
         hXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=843Cqu10do3AOcdjRFPledKrGoMFl6vHJzmaFjeMBSM=;
        b=h7HN4xNvKRsCHLBzHWscNPjhdgAo3a1YuYlbdzmKLvXR5Ko/982GT72QvfwB5w/vYf
         dnfso4CvUX3Ao71acfGnUgjGtmZxwyTvG/t++awURQupuzsh/QR3ETeVAoTMTYbKoRae
         XcqhEphA+aJ/Tk1O8WkFN/YeialqmbR10aCoPcl4ueKn7TKggK3tLRf09wi8MqJBWoJD
         sATsY+8D3liwOJ6xgpiB+6K+1VATPAfnSxbYLDiMRL+5G1/zv9l2NlrjFQx4zqalTwdl
         SIBRaU4cCK/luaVPAeF2t6q8TNPcjreaQO/9ncg89/Bp7X91tWnAVH67VzbSbGuRVuvo
         o4hw==
X-Gm-Message-State: AOAM530wWTH2m4+XYKJITtjs/VTGMQSTXdfIUP8JfB/zMKB6yM3sa9nR
        p+CAt3wiJa3bniUW24joRqmvpg==
X-Google-Smtp-Source: ABdhPJzaAvVl7zIW7ODmVHAFeI6Rkd3rf7v10ndmHfmNMb50G2CfnOjWagvTE+aUo0mJvzdSYzvKVA==
X-Received: by 2002:a05:6512:3081:: with SMTP id z1mr15929096lfd.257.1614793401892;
        Wed, 03 Mar 2021 09:43:21 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id s7sm2101441lfi.140.2021.03.03.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 09:43:21 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 1/3] v4l: common: v4l2_get_link_freq: add printing a warning
Date:   Wed,  3 Mar 2021 20:42:48 +0300
Message-Id: <20210303174250.11405-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303174250.11405-1-andrey.konovalov@linaro.org>
References: <20210303174250.11405-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Print a warning if V4L2_CID_LINK_FREQ control is not implemented.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 133d20e40f82..04af03285a20 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -469,6 +469,11 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 			return -ENOENT;
 
 		freq = div_u64(v4l2_ctrl_g_ctrl_int64(ctrl) * mul, div);
+
+		pr_warn("%s: Link frequency estimated using pixel rate: result might be inaccurate\n",
+			__func__);
+		pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
+			__func__);
 	}
 
 	return freq > 0 ? freq : -EINVAL;
-- 
2.17.1

