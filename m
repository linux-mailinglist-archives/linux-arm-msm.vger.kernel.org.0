Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20C920D955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 22:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387456AbgF2Tqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731908AbgF2Tqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:46:44 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62FDC061755;
        Mon, 29 Jun 2020 12:46:43 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d17so4920232ljl.3;
        Mon, 29 Jun 2020 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yW2N/sZTeFOka61e1CNf+2xQi6YWDt9t6wLYYbiilaA=;
        b=VDaLUZ8iSqn7cD0QR9+EyF5l63jrz8oPVBC6du0FHfOEN6y945EeRP3j9IEZmYZXcP
         TQdNSu+zX6KWHnsyuDARFJqAr3m+K8l/YYayM6tUhQ3t/lntVE4MnkOt/o+xphoa5qiO
         yGBV5uF3vmYds+TZnfTjRK0TwZbRObCkWEFwfdJflN7OwVhapi1FvcFxdfl9evr2kHFz
         05Il1pnJnGFrVE66TfJIR6ip27glEp+GVhUZ5P6OSY0fcl+3qlIOvAWanihgSmDk5c9m
         9yDfLbioz8KAfjLIf3F5O/yjfF1uvpIdClo1zjPPmjV6A+MddlZhsdwtLwSFOhRjbQJc
         +SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yW2N/sZTeFOka61e1CNf+2xQi6YWDt9t6wLYYbiilaA=;
        b=egH1k+LETXRqjEj26uSh5rTH7b0UmXuRz/s76KCfxuQgv4s8+5v/oUOvhSyoeg9B5T
         j9WmfQR9SdR9jKRAfPAEy0TXF+9V4sh79zKsBdG11kYKKt/jjo8nWMfmAz9Dq4DwCAF7
         rTOA2mh+fgIxv00rBMHgG/jsajvzsNVTbpMafFSKCiD+tKJXBiwPug2e6c9piFv5ZugM
         xRR0OfvV296q+QeQ364S9h8hfnaI2c8Dx0jbtmdiYzfH0dpS/TRaHN3PxPOQ4V1rshcb
         94Nj59gtohuXlcrVbZS7c+jWAgOmzGThVe6/JBkqIOtFYY50D8sXNGuOsvsll/JPRV4n
         k79A==
X-Gm-Message-State: AOAM530k0zTN5vZCCc3H51p9rv62uwY001rBrsYDtNi8RmqgJLh7QBNU
        ErCBj69k59fynRP9owLo5Ag=
X-Google-Smtp-Source: ABdhPJwHRLunzx+iZfO+XnOzdRcm6JIpPwrEGHua7lMghZlsvgzBExcytpP3CswdyVtIND48oleGDA==
X-Received: by 2002:a2e:b8d5:: with SMTP id s21mr8386732ljp.34.1593460002225;
        Mon, 29 Jun 2020 12:46:42 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-147.NA.cust.bahnhof.se. [98.128.228.147])
        by smtp.gmail.com with ESMTPSA id q128sm154750ljb.140.2020.06.29.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 12:46:41 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 0/2] regulator/qcom: Constify static structs
Date:   Mon, 29 Jun 2020 21:46:30 +0200
Message-Id: <20200629194632.8147-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Constify some static structs to allow the compiler to put them in
read-only memory.

Rikard Falkeborn (2):
  regulator: qcom_rpm: Constify struct regulator_ops
  regulator: qcom_spmi: Constify struct regulator_ops

 drivers/regulator/qcom_rpm-regulator.c  |  6 +++---
 drivers/regulator/qcom_spmi-regulator.c | 24 ++++++++++++------------
 2 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.27.0

