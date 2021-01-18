Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4623E2F9960
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731939AbhARFkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731837AbhARFkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:40:22 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E022C061799
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:21 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id v19so10224013pgj.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m0wnw/GO7SMQLUuP66bopdd4iBEqxTv/KVER94R1YRA=;
        b=lJ6+ejp6oT29txHyytFy7vapxEJdlHjfQjuJ87+c/MVSCnWxZhxY8Cbx2nYrlKKbeV
         HlFaMvzW/KQoMs4b+J+vV61uSR6DmiJhgjt0UyBhpq2y36Q5HqxujVZBiCUfPZTccJuU
         Aelw7NNjB+8xNCFspU/ba9GYT865NsXQZ4hWV4Bpb9sPJNqFs7mIunddsrUVRe/UKdHA
         kKao1JPn2EOhFzoxMQ61jeGa4Iw/H6ihpPkULEFVa7AOhuELAjvPze0eVsWBzd8cAm92
         cZ1kfYs3cO3uKFNgPzD9Cn0hIK8PB4H9T7YY0QBOJKQyYsSZ9VpOtd0NSH1sDuIo4u6H
         ZqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0wnw/GO7SMQLUuP66bopdd4iBEqxTv/KVER94R1YRA=;
        b=c8bOD7Q8gPKnGkiB5Ix02M4tKIV6qa+bR4bXvIyzvl4ITQFJKYqSnMlcSxP4nJt2Ir
         2prnpvROlLmL7KO4jEHpfkyWS+BvPCCOwmSIJulyTlvozNay+IBJ6OSFSEMFVCHvt9ZE
         UIUQz+bbNopJwjhmRR4EVUjKeJ4wcyqBqGQyKDyJkN7idI7JcxEgQYB9hRHc6BFtXZSO
         u7/nJokl20fxOYgDagVomfkveiIDvemKXwjR3CISPjhbrCOyJoNJGqRcG9oB5eY6C/xs
         QWsHM7D9Iy9gq+RKjNb2u3uCG2O0UpF897Se+meU2tfaWHj4uz57QByjGBn5F1/y0k3N
         zDZw==
X-Gm-Message-State: AOAM532dDcsJDTb+I+/pHN920NgPIqyUQL7UzIN0MQqxucNbbS4QZC7U
        amJWJA4YgPyBVBEM+wSj8HBx+JapFxC4
X-Google-Smtp-Source: ABdhPJwzetYnaWzKHS46fLYkf9S+zJ9wkwpSYH+6b80DkTOLX5a5QyzS82OMBcJweqCCGAWXbtg7Kg==
X-Received: by 2002:a63:ca0a:: with SMTP id n10mr24815770pgi.326.1610948361037;
        Sun, 17 Jan 2021 21:39:21 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id z6sm14627271pfj.22.2021.01.17.21.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:39:20 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 06/13] ARM: configs: qcom_defconfig: Enable UBI file system
Date:   Mon, 18 Jan 2021 11:08:46 +0530
Message-Id: <20210118053853.56224-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
References: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable UBI file system support.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 07737cbe557f..51eeefd264d3 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -274,6 +274,7 @@ CONFIG_FUSE_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
+CONFIG_UBIFS_FS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
-- 
2.25.1

