Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E34C38BCAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 04:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbhEUDAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 23:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbhEUDAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 23:00:10 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEB4C061763
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 19:58:47 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id k19so14404969qta.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 19:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s82gU0CvYVEzMfDJUYBwwm+dkoLpB7QNQtjnELQGLks=;
        b=Z0cO3HPKhIbRrcfBJkLD12io9fn2JH+0LemiiV2AxbExD7drmX9OoFmxisHlHfNJ+P
         YZwr0JNxxPH1si+dQU+Pk326rxvR7RmVxYHzANZcxQ3LUGw9H5uRN8hSWq2HvUFygRjC
         T35Iv/Nlna7vMHPtZlZJrujL/H5e9QXalyReocZ23ofwIznkbxFzfKgKSHPcWdJnDxuf
         HjOC1QxXlPgHQnBD5p6S4EL7pylJk6Ubr1kKeWeYy2HGkUcSGRenBqbN2kePOoAdcKJN
         GHBPc+Jyp/11sFSPX9qLj472gmyYZnc9pVpCGte1/9ApZf2/4NFZwhVl5Y2aykBSer7c
         Ceng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s82gU0CvYVEzMfDJUYBwwm+dkoLpB7QNQtjnELQGLks=;
        b=AIv2QhPsOKu5oRBj1fpuKkLbl7aFdHhs63vXduJmXZp07GAJjlfp3awUJVf8xf4GxM
         jkweHPiXhCPkuS8r2YQ7LqBddTztHKFBSz1Y3P9/fsveG3ae5D+xG/vm4zL2JpCN0c+C
         RdT7OGUOOuI7kepIXpo+6w1CLJqMsjeWIdjjpFAAkq5tmmzUYIyN8Yx3XSHTdTO4rvf3
         JWpyOwU+gcUMbuAHbLhQhgI4nGoBcq5sgC3342mcflxW/yhmTh3V/mE2wAB9S2xvGwg7
         1KSDGO4EfOQfCKvcxn/OZI0XnZhwxdFeeVAe3ipOvbZBQ1s+509ciVU0Ee/74sMR1q8B
         quNg==
X-Gm-Message-State: AOAM533fIxXe4fvkZvfeQxJdWRD5bw9Dn724cEcLk3t9kjHw+ok7Jjjy
        tKZe1YyFFD+P32/SRAURpSODCg==
X-Google-Smtp-Source: ABdhPJzDgY0jE0nSA6dmpv9KCPnaZhfPLBueYtnDCaRB46wjOODRYcxATmF8Uu0HUhndQXeGpIpS8w==
X-Received: by 2002:aed:3071:: with SMTP id 104mr7349289qte.119.1621565925970;
        Thu, 20 May 2021 19:58:45 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id a10sm3510534qtg.40.2021.05.20.19.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 19:58:45 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add maintainer for Qualcomm crypto drivers
Date:   Thu, 20 May 2021 22:58:44 -0400
Message-Id: <20210521025844.1239294-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no maintainer for Qualcomm crypto drivers and we are seeing more
development in this area. Add myself as the maintainer so that I can help
in reviewing the changes submitted to these drivers.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6df5a401ff92..d478f44be7ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15136,6 +15136,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
 F:	drivers/cpufreq/qcom-cpufreq-nvmem.c
 
+QUALCOMM CRYPTO DRIVERS
+M:	Thara Gopinath <thara.gopinath@linaro.org>
+L:	linux-crypto@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/crypto/qce/
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org
-- 
2.25.1

