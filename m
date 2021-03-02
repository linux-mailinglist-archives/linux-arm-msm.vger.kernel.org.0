Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD5E32B2CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242260AbhCCBPq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:15:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446272AbhCBN2y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 08:28:54 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8FBC0611BC
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 05:28:12 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id r5so13809925pfh.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 05:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4Ad7Ent8cof3XMClRVgB8zjonCBcH2IrC0ql/TQI38=;
        b=l8tRrWapgbJRkYaus/ItyDv82nTfHZpF6+OqBUdkRkJI7yPujxRr2oz/pyWwuB8LuF
         //zcr6Dk9KA3KMvAtldOErs+j2sgJbzfR2yDp7RauZIsKXoe8xtRbxZwQnAzxmHNvyC4
         8axFWG+9e4S5+caDu3lcpvNs9YuC6VAQynPgBD40VHbDb2pVUzccAipV9LvCHJiSaKbH
         /Da7k8vN/ABqvhg8itwiPFEhpSsjLjJBfVUrfHwyfF4m2KOkhP/7DeOHdanrtrwR8PhX
         u/veZdXSs9qUcc5HiZEbuOwS+jaw0P8j2QfBX/ET4aGv0UdSPM1ggTdbi87MyeuUWUTd
         SnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4Ad7Ent8cof3XMClRVgB8zjonCBcH2IrC0ql/TQI38=;
        b=kIyzcpjl8SayhSBuTQHvrMePUvomx3r4+oCRX2gs9kOyR2nEHmLIeniRE6G6PZ1uOe
         /Cxa6VgUAN3cMm/jfaOjhuGXOC5IdXbMTaJ3j/7Npb6NtMx0VRwsKiItmHfmtRRai2oI
         70LwbbW2P9nX5MOf2M86OgX8vRzUCvvL869oFpo7rGmETN9E+VIDGgxZ0zDrJfC/l0s3
         xH9vgPxmMb78/FcZa8emabwa0oxMhtCDNp1UyzuxyWVQ62Vr7lyrmjeibtTVd2GmjBGX
         +rZ1sTXF5yxenENZXCDRK0thK5GEIZD/xbF4OrjIP7gJ8udwciyCwSwQvv0rf0+9RYLj
         al9g==
X-Gm-Message-State: AOAM531oYCqFP8dcBSA7EaraXQT1XX6wxr5xtoLgBl3nmQocpKd48fcB
        w2B2Pm8CPUQOKcwARQXoKMApXDJ4ES7K
X-Google-Smtp-Source: ABdhPJzLbkWTyQk4y0GRM9ZfbaZuf3I4UEKB1ioFKcMq2eC/YLMqWeWZ1I05pt+w1IBSL89+7tvGTg==
X-Received: by 2002:aa7:9182:0:b029:1de:e96f:a866 with SMTP id x2-20020aa791820000b02901dee96fa866mr3292765pfa.67.1614691692127;
        Tue, 02 Mar 2021 05:28:12 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.74])
        by smtp.gmail.com with ESMTPSA id w1sm13027454pgs.15.2021.03.02.05.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 05:28:11 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
        Daniele.Palmas@telit.com, bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Handle probe defer properly in MTD core
Date:   Tue,  2 Mar 2021 18:57:55 +0530
Message-Id: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

These two patches aims at fixing the -EPROBE_DEFER handling in the MTD
core and also in the Qcom nand driver. The "qcomsmem" parser depends on
the QCOM_SMEM driver to parse the partitions defined in the shared
memory. Due to the DT layout, the SMEM driver might probe after the NAND
driver. In that case, the -EPROBE_DEFER returned by qcom_smem_get() in
the parser will fail to propagate till the driver core. So this will
result in the partitions not getting parsed even after the SMEM driver is
available.

So fix this issue by handling the -EPROBE_DEFER error properly in both
MTD core and in the Qcom nand driver. This issue is observed on Qcom SDX55
based Telit FN980 EVB and in SDX55-MTP.

Thanks,
Mani

Manivannan Sadhasivam (2):
  mtd: Handle possible -EPROBE_DEFER from parse_mtd_partitions()
  mtd: rawnand: qcom: Return actual error code instead of -ENODEV

 drivers/mtd/mtdcore.c             | 3 +++
 drivers/mtd/nand/raw/qcom_nandc.c | 7 ++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1

