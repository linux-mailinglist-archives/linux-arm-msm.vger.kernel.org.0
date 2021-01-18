Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5772FA48D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 16:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393406AbhARPYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 10:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393380AbhARPXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 10:23:19 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C7DC061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 07:22:39 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id v67so24619391lfa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 07:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UDbFBKM+NToZkfKZaMXOQfZrWXoa1JGZS1Y+JAg8jIs=;
        b=qkbl34IqTAeq41jPqeJFN4AXm2OXs6lGFEc2NKYkLVuRvIgHPAo8E0f53CdFowRkZ/
         WkfZrRxtt/B8+Q6nIsHfzhAuWG4ed78Yt7D5O/CH5Oh832WJQMtv2ICJsjPg7xpmFcoc
         6rNLO71N+E7+pM/IEZ5om9Rs87HIWc4SPcjLb96bNvz/DPklAlE3UN/y/thC/yWQXMXr
         3qcGNbVF1OY5TPxhDuKDLF1PgybWzAuLiHP/h1HpgzDf7JEgKft4vZSxpNF5nWXOrrEY
         StOKhG5oQGYxfdeo2OpZwaxz2WzEsvLS+kqIDYeWfViK+w5tzknpd8PhW86xmnZmSSG0
         l2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UDbFBKM+NToZkfKZaMXOQfZrWXoa1JGZS1Y+JAg8jIs=;
        b=kML8nz0lczAGM5725av05pGLRJyU24eP93YvSYU3gVdkswmFkr3UvF/2JGIrEsllWw
         a+kYC9jnOKek8wXjv4rlhEbiaEtZaJkFrv0pzfilsrO4gbMB6nvPpvZDkv1W2Auzm9qv
         uhU9Z869m24L14NiTd5MozLefQmePEkekZDfyJ9fNXIAk/w4WX0kz8h8PXvv1BOrDUVf
         FL846/zDPyHomPurnsBfCwBPoclPscKoUIbLoSCLzJa8blvr6Tgf1OilCZ2w5pTJsOXt
         9QTDOWmA24XAZrS5umQnLg1xG6dJTHruGImICv+i/ZWLAHI3T0je7RpWT+63W2Z+9Sx8
         cIHQ==
X-Gm-Message-State: AOAM532YcdeAKYogy/NdwX5kv3eU47+EXWiN0uPPgPVcaAqolYT/WW45
        4Vu7Y7cSxo4R+r7XDnbj0VBRxlrfTebgeQsA
X-Google-Smtp-Source: ABdhPJwoCfCnjXo5vg4da49JfvqipaWz0vctWLv/V/JXH2hCCX12DCJHXUPyoLnwHIIGgOx+HE21VQ==
X-Received: by 2002:ac2:5d43:: with SMTP id w3mr11958863lfd.49.1610983357843;
        Mon, 18 Jan 2021 07:22:37 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.4])
        by smtp.gmail.com with ESMTPSA id b15sm1541400lfj.306.2021.01.18.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 07:22:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: fix two sparse warnings
Date:   Mon, 18 Jan 2021 18:22:36 +0300
Message-Id: <20210118152236.514776-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove extra le32_to_cpu() conversion, data is already converted from
le32 to cpu endianness. This fixes two following warnings:

drivers/soc/qcom/socinfo.c:322:36: sparse: sparse: cast to restricted __le32
drivers/soc/qcom/socinfo.c:323:36: sparse: sparse: cast to restricted __le32

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 734c78e7febf ("soc: qcom: socinfo: add info from PMIC models array")
---
 drivers/soc/qcom/socinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index a985ed064669..bfb68dc370b5 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -334,8 +334,8 @@ static int qcom_show_pmic_model_array(struct seq_file *seq, void *p)
 
 		if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
 			seq_printf(seq, "%s %u.%u\n", pmic_models[model],
-				   SOCINFO_MAJOR(le32_to_cpu(die_rev)),
-				   SOCINFO_MINOR(le32_to_cpu(die_rev)));
+				   SOCINFO_MAJOR(die_rev),
+				   SOCINFO_MINOR(die_rev));
 		else
 			seq_printf(seq, "unknown (%d)\n", model);
 	}
-- 
2.29.2

