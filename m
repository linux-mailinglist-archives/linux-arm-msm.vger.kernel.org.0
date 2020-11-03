Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524CA2A49C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbgKCPai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbgKCP3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:31 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0724DC0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:31 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id w1so19039377wrm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F5XEFxf3V3a/7KJuxM4jGDFH/VFMglui44AFEjsXTa8=;
        b=TWneApmGdiFuxJnI307W1fbIDdA3pgj4MFQbUWbEY5qVeFgEVompzAecKUyLT0YHSq
         Br8HxIFcSCzUouyHOtW6ibcdKXWIsjnysbKv+KN+xw9ZdkMPm8gW1MQ/bqOmQGKUnyxN
         RyItJwLxjp5HcpWcJPSEUFaUfCte7diB/Hsu37Ae7h6xsBKHJ5pUgeAFtGfOt9t3uV8b
         T0lvNYaqGBlBO9MP20TzPHtZuBOa34rPEXoYHyIw5hD92oNwCt4BsMSrZv53PdmJW9mI
         aRGlU3c7SiT/lwdEtToWYkvLdMJRrh8MNzfGg9vozs3PIU/90iz8kZzoamn/Dbbb2mbn
         iF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F5XEFxf3V3a/7KJuxM4jGDFH/VFMglui44AFEjsXTa8=;
        b=BCx7WPyc9CYAeP+ECPmEUp/Yd63cM4RdISc1p14U8oAm19JbmNd3g6ImqxkRgcSpN1
         bMasHW7N0ExlOo/9u8Ru/POzUdDDYUCSDfR7Q4cYZl7QcaEBwBsmRcEvp6ndgD1fKj2W
         P+k9ysosJawkNW3ToWvAtmmvTX2xjdor3FzLw449iRohrCEL/ZxYEm2rStYIE7pFFxBQ
         R4QykSXAEs4cUZBpZBKscHTIEI/4JArTGaFc2p8mMoy6rixaS1Ag5AjXYHxwDveeQpga
         MBJRwdO947NEmSOtU4roClVcmy3S445U5R2Oh4YGQJtOAUBhpo0YBYcJRnkpSDPHH8xS
         pNTQ==
X-Gm-Message-State: AOAM531SD95QQTTWUqaFMrhX322TSS07B1/eLbeRRmR6LKYBOt3inNXw
        Pz2PQYW+OYgRGG5w/vTRn28t9Q==
X-Google-Smtp-Source: ABdhPJzMxnEx44QOmexRXCOsJZJfTIEAa7PuWZb3XF7kaMsp8G0uEviimi1EFwiDd3bvXYdgC5XU1g==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr24896182wrn.73.1604417369783;
        Tue, 03 Nov 2020 07:29:29 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:29 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 15/25] soc: qcom: rpmh: Fix possible doc-rot in rpmh_write()'s header
Date:   Tue,  3 Nov 2020 15:28:28 +0000
Message-Id: <20201103152838.1290217-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/rpmh.c:266: warning: Function parameter or member 'dev' not described in 'rpmh_write'
 drivers/soc/qcom/rpmh.c:266: warning: Excess function parameter 'rc' description in 'rpmh_write'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/rpmh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index b61e183ede694..ad1f062620ff8 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -254,7 +254,7 @@ EXPORT_SYMBOL(rpmh_write_async);
 /**
  * rpmh_write: Write a set of RPMH commands and block until response
  *
- * @rc: The RPMH handle got from rpmh_get_client
+ * @dev: The device making the request
  * @state: Active/sleep set
  * @cmd: The payload data
  * @n: The number of elements in @cmd
-- 
2.25.1

