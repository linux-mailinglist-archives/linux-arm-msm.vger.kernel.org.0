Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E221C3CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 09:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfENH1g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 03:27:36 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39940 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfENH1g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 03:27:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id u17so8630593pfn.7;
        Tue, 14 May 2019 00:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:mime-version:content-disposition
         :user-agent;
        bh=lyCo4RhtPFnk5/aO02qephrgTtbsGXyGZCb4n0cJnyw=;
        b=rC/4goGz+dlS8ODMHvQ0+YTx8qA0gG2SUfvLdyOUSeyYt+5CrLa3HOF9uZRs9AmFj/
         JK8uvTZvnPUMuYG/4AQT+0ysU8q1Q/xh27z/gof/bP2598F0TPBcctKIfMm7ES8nDttU
         tlZEJhiIP4+d0RsrWCPzBjVrxnXZ+yiNeA0VdbBMnzGHGsVFClIhIrN7LzrmqvqXv5wA
         mE44F27yJcCf3IeSVBOh8YkngCVLsy//JXGwU7Tb/JUJZda7vvxw2ppB/5L1mTXich7+
         keJcx7hqHVRTzu2ovsv98FmzxDCARMMrG/V4yXt26xTqJCO5RPxhJn9qUS59q1CnubD6
         IPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:mime-version
         :content-disposition:user-agent;
        bh=lyCo4RhtPFnk5/aO02qephrgTtbsGXyGZCb4n0cJnyw=;
        b=TsSDeFizZxD+JRvtNLLyU67zEt8GSZPZ1DFUA9WukeNHiLKabtMZ56oolPveHsPL8S
         GwnOtgskeMkujihimmH77ChTIWVYSbgEPzJofHNBjMycZhc7wXfd6evN3/Fzg9jgA5mQ
         9jO3OGaYJ2W8LcdM1swYGNLu07ZnmIdx+TSgEd9teAmBAa7wqtEFe68WWVT2V4NvtLSL
         mEon0B2dI4jpCqqjR01jffPxGOBVqQ1jjrHqx+3yhc46V395JM+TYU5cveVvbcJ9EKr2
         WbCPzHf2f9gorRfEvwSXph6fmKtML5tvGnR/DZkpyqqKKDhL8+c3tfz9PftHjM6/io3k
         QUDw==
X-Gm-Message-State: APjAAAUGRjBXq1yJHQg9zNP52un6UT3eA5VbE5alpqfHmWdYU15ZnL3d
        UzeJIiFSTfCc3ab4oMdEfCx6hQmX
X-Google-Smtp-Source: APXvYqxbkyut4p6mQIIgh6NfXlp+BvZaBtJJSbumEGh8I67qHa+vAQhNgHsP9GFw7uocH/XK7BDc6g==
X-Received: by 2002:a63:1e5b:: with SMTP id p27mr35433842pgm.213.1557818855330;
        Tue, 14 May 2019 00:27:35 -0700 (PDT)
Received: from sabyasachi ([2405:205:641d:f30a:5511:e7cb:49d8:c4c3])
        by smtp.gmail.com with ESMTPSA id z9sm8613380pfj.58.2019.05.14.00.27.33
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 14 May 2019 00:27:34 -0700 (PDT)
Message-ID: <5cda6de6.1c69fb81.a3ae5.836a@mx.google.com>
X-Google-Original-Message-ID: <20190514072728.GA6348@sabyasachi.linux@gmail.com>
Date:   Tue, 14 May 2019 12:57:28 +0530
From:   Sabyasachi Gupta <sabyasachi.linux@gmail.com>
To:     robdclark@gmail.com, airlied@linux.ie, seanpaul@chromium.org,
        jsanka@codeaurora.org, jcrouse@codeaurora.org,
        chandanu@codeaurora.org
Cc:     jrdr.linux@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Remove duplicate header
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove dpu_kms.h which is included more than once

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index dbe48e00..d692dee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -16,7 +16,6 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_dbg.h"
-#include "dpu_kms.h"
 
 #define LM_OP_MODE                        0x00
 #define LM_OUT_SIZE                       0x04
-- 
2.7.4

