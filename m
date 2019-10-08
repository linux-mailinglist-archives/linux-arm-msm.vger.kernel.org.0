Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62093D0450
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 01:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfJHXpH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 19:45:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43542 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfJHXpH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 19:45:07 -0400
Received: by mail-pg1-f195.google.com with SMTP id i32so173380pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 16:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VTqm4xb/uzwIx9+YkRrAq+5wI6d0RF9Fhc0L8BB6NNk=;
        b=F2YgMkA1ynyHIqcNAOXjwxuQ9rXAZK3WLuPIyavkipOEB0zP1opyPDqPjNwVhj8Eot
         6xN+Bu4ZO8owjzLtwwkQlwJyG/IUkLpv/hw80+Pv91CPDhw/KufGoFH5n4I9WbY0DSm4
         559gWD7ZyckraA1E0V6xntAWsrElrWK8ZKdPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VTqm4xb/uzwIx9+YkRrAq+5wI6d0RF9Fhc0L8BB6NNk=;
        b=oT6O3+t4ATmu5n5Um4cvwFq/VRme0V8mWINGKQ7G5tOh2mNuGVGKjLZNysfQUosWUY
         33MKw6ISDpBq8Gs07fIz2xKxXu225Y/OGHjPuucCqPKSYLsyO0GuB/JfxAdx3eG/93W+
         9vcV3TTpTERH96FUZzT9jPLRX4Kh5x8nAyAT4yke9bp6Lh5FQKvcaqvFf6CVZ6KuXgbA
         yfo8TN5zaM0AiBgFAwtX/VugiPU8NBRnPjAZ2K9nHOAgh4e5mW/b2F03leEfBynoBDf1
         jKSEVKCnruQynjwdwIVxIKNcwCXP1RWmLCt5ORNyE30tx0vE7M0CeJBk+/6S6+AY5848
         6FHA==
X-Gm-Message-State: APjAAAVSwtUD2gn/ohnfmgsCzipGisg+xMqNORgoLPzJXkqdCBC+txOB
        vnSijii4EI1vu6wNXj9AuSs18Q==
X-Google-Smtp-Source: APXvYqyCyssl7f7LcRQImARb9V8geHmWv1lXrYKrK4d1NYbjLQNxhvw8+A7+8FZ0hFL9ABbPD76Img==
X-Received: by 2002:a65:5bcf:: with SMTP id o15mr1094966pgr.370.1570578306792;
        Tue, 08 Oct 2019 16:45:06 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s202sm210671pfs.24.2019.10.08.16.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 16:45:06 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 0/2] Avoid regmap debugfs collisions in qcom llcc driver
Date:   Tue,  8 Oct 2019 16:45:03 -0700
Message-Id: <20191008234505.222991-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now a two part series. These patches fix a debugfs name collision for
the llcc regmaps and moves the config to a local variable to save on
image size.

Changes from v1 (https://lkml.kernel.org/r/20191004233132.194336-1-swboyd@chromium.org):
 * New second patch
 * Dropped static
 * See range-diff below!

Stephen Boyd (2):
  soc: qcom: llcc: Name regmaps to avoid collisions
  soc: qcom: llcc: Move regmap config to local variable

 drivers/soc/qcom/llcc-slice.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc: Evan Green <evgreen@chromium.org>

Range-diff against v1:
-:  ------------ > 1:  07bc0e8bdb6e soc: qcom: llcc: Name regmaps to avoid collisions
1:  0c54fc8a7ed6 ! 2:  5c4446e36783 soc: qcom: llcc: Name regmaps to avoid collisions
    @@ Metadata
     Author: Stephen Boyd <swboyd@chromium.org>
     
      ## Commit message ##
    -    soc: qcom: llcc: Name regmaps to avoid collisions
    +    soc: qcom: llcc: Move regmap config to local variable
     
    -    We'll end up with debugfs collisions if we don't give names to the
    -    regmaps created inside this driver. Copy the template config over into
    -    this function and give the regmap the same name as the resource name.
    +    This is now a global variable that we're modifying to fix the name.
    +    That isn't terribly thread safe and it's not necessary to be a global so
    +    let's just move this to a local variable instead. This saves space in
    +    the symtab and actually reduces kernel image size because the regmap
    +    config is large and we can replace the initialization of that structure
    +    with a memset and a few member assignments.
     
    -    Fixes: 7f9c136216c7 ("soc: qcom: Add broadcast base for Last Level Cache Controller (LLCC)")
    -    Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
    -    Cc: Evan Green <evgreen@chromium.org>
         Signed-off-by: Stephen Boyd <swboyd@chromium.org>
     
      ## drivers/soc/qcom/llcc-slice.c ##
    @@ drivers/soc/qcom/llcc-slice.c
      
      static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
      
    --static const struct regmap_config llcc_regmap_config = {
    +-static struct regmap_config llcc_regmap_config = {
     -	.reg_bits = 32,
     -	.reg_stride = 4,
     -	.val_bits = 32,
    @@ drivers/soc/qcom/llcc-slice.c: static struct regmap *qcom_llcc_init_mmio(struct
      {
      	struct resource *res;
      	void __iomem *base;
    -+	static struct regmap_config llcc_regmap_config = {
    ++	struct regmap_config llcc_regmap_config = {
     +		.reg_bits = 32,
     +		.reg_stride = 4,
     +		.val_bits = 32,
    @@ drivers/soc/qcom/llcc-slice.c: static struct regmap *qcom_llcc_init_mmio(struct
      
      	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
      	if (!res)
    -@@ drivers/soc/qcom/llcc-slice.c: static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
    - 	if (IS_ERR(base))
    - 		return ERR_CAST(base);
    - 
    -+	llcc_regmap_config.name = name;
    - 	return devm_regmap_init_mmio(&pdev->dev, base, &llcc_regmap_config);
    - }
    - 

base-commit: 8b0eed9f6e36a5488967b0acc51444d658dd711b
-- 
Sent by a computer through tubes

