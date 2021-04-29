Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E598E36E7EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 11:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbhD2J0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 05:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbhD2J0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 05:26:00 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E476C06138B;
        Thu, 29 Apr 2021 02:25:14 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id t13so8245373pji.4;
        Thu, 29 Apr 2021 02:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Hc7qwEWt0TQypk1NpxmfhrdUGD/9xTC+FVNkE0PCDPk=;
        b=doJSUANF+Dq7ZsjoPCEistPnbGK/JuTWTDxUpl1X+jLEN/iAxF5HyqYv47fIS8EOS1
         aWfgcvdUjOOc8RR2wDvrI3QcPgsdvmboE79Z0PA2eD8SkZl71zB0EAAwXwDwtyWQhZw0
         r+NGGlnKMwxXpqTwDm8mUGnZ+i1wG8cp4D74H5GWBn0EZbLo1mzgMrrRxGa2DoUednKH
         yx7v8WMtcPTGL50QaTzmqbWMFJ8wmse8Q9Z+59ciTX4R/qvCItQQdENBJFB3Ge35+jc1
         BPGhK03Xb/kJIyEBxz5ktnfq88PZjZKboFIfAwGVisicojSU6fcr9V25WyassBo1XYk2
         wR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Hc7qwEWt0TQypk1NpxmfhrdUGD/9xTC+FVNkE0PCDPk=;
        b=lRuuaxnvWb9//94zaPNkfyZw9bQeOFXcctCg8RxGjJ0EOmxokZGrRhu5J4ZNeG1nfH
         +oKy+gdGOeuJDW8ofvQ9/YMRIQMs5hYd7qZ8lLlKfIrgtfaNMcpnWAdWEsETRge+s515
         gri99jXZrLfvtnPLCQBG/WW2jjo8Jh0dgyIKNl2cU/KN4qEsSya16kQsjm+9eo4TyFXq
         33S+9Qyui7L2KGfdneY5O1BEctaWAYEmlDTJ3+BgZ7Be6QK/pQ7tm2cdJop0vQ9NGV2W
         4njDYD9rTIf2knunJnrp7s+RsZtDgtPLYC0kpljFxkq0PhAmxbqgXYhWsITvM0JZWUcU
         kF9A==
X-Gm-Message-State: AOAM5302ymmTBvrMZ30G+fFdVhiSXSMu/wiiVRkvaWEvR4ShJ5HoYDUC
        K19/Jw10wBZ0ZW/WsSGDOZs=
X-Google-Smtp-Source: ABdhPJwIKMM5WeakUgaxHGL5V94vdsm/Y7DRjAdrvfr1VxbJ6AY43JpMQGSBU46hdFmarfcpO1NiEA==
X-Received: by 2002:a17:90b:370a:: with SMTP id mg10mr6303916pjb.219.1619688313938;
        Thu, 29 Apr 2021 02:25:13 -0700 (PDT)
Received: from localhost ([157.45.42.16])
        by smtp.gmail.com with ESMTPSA id j23sm2069548pfh.179.2021.04.29.02.25.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 02:25:13 -0700 (PDT)
Date:   Thu, 29 Apr 2021 14:55:05 +0530
From:   Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, sanjanasrinidhi1810@gmail.com
Subject: [PATCH] drivers: slimbus: qcom-ngd-ctrl.c: Added space after comma
Message-ID: <20210429092505.lamh5km4inoynjar@kewl-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A space has been give after the ','.
This is done to maintain code uniformity.

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index c054e83ab636..cb9612a5c30c 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1348,7 +1348,7 @@ static const struct of_device_id qcom_slim_ngd_dt_match[] = {
 	{
 		.compatible = "qcom,slim-ngd-v1.5.0",
 		.data = &ngd_v1_5_offset_info,
-	},{
+	}, {
 		.compatible = "qcom,slim-ngd-v2.1.0",
 		.data = &ngd_v1_5_offset_info,
 	},
-- 
2.17.1

