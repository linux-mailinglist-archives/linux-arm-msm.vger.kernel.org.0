Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D24E7AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 22:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbfJ1VCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 17:02:54 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44118 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbfJ1VCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 17:02:54 -0400
Received: by mail-pf1-f196.google.com with SMTP id q26so4130860pfn.11;
        Mon, 28 Oct 2019 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=jOsPk8O61mge9n7NaaqisDZ0F14LpJepTwa7yUngAe0=;
        b=uSUvninV+/uL4MGUfbE7yXkdkq2d6KHpOThqfXiI2l0ggHiWTzZjOXRn8iSgAHhOLz
         Xjck1xLi74AyKGCH6KHqoC3wvUXhponr69K8lmAScP63spwSssiouBnzSwvlNdl4c8rL
         Y0+VPNTXe+nnr+EAUG2WhU0zZUrEf9SqtBOI7Og8smDM9r9OgxiTT8iUvqiXybtPz953
         7yN5NQ6T0+Ckb+VKpRpZkvhUPzB0K1LRp7HO6dsETge8Bc4uqgnq1YHXCXNi6wvpQ314
         bScz8tY62gcECXrIJ+X4geBd0BEZgvTVGeFEs4QqEtwqUdUTXq7o4kA7mXqieKE/d3II
         pEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=jOsPk8O61mge9n7NaaqisDZ0F14LpJepTwa7yUngAe0=;
        b=EJORYo+34lmbVk8bw8tacS7hsAoGgNgnWSoExyZAY/JtOeBF5vMuh7mn5KJLDgH1r/
         jqjHYTBtiGxBW8vHfxrdepWstwN08LtYgGiZ9cVGBn3d6qLEPyEFyIfhFcOsHI7yYOKS
         K1YyZPxO90eQPQknzdAbgPSmUDBsG+ocqk2yq9grJspLjV4VqmOr/uLgSw8W52owSvQb
         MUyeoLfB1wJ9Nj/Y/Sp70wNKQuVra/VFvnvC/9RNYztYQ50scTUKjBHJxT/sz9t9gwv7
         kXwXRhz2kSlOjVd0+2FRZo+/ZtG/k/P3noXh1g+jWoq6MMZnmN8qTGuqOsHmFVg6yS/d
         qapA==
X-Gm-Message-State: APjAAAVqwOqgnpY27qXBGSJu6Yy40BdWvoqQvQ/5T3MmL65y8Ekq9baR
        93tH1ZHTXEEKX0ExhYoncq8=
X-Google-Smtp-Source: APXvYqwICjoQQCp5Sef5P9/pJpLavd43gIrGTZeXBi53Nj/HFTdCSswNzcioCn1T/QWF/+hWvFnBGg==
X-Received: by 2002:a63:c24f:: with SMTP id l15mr2638233pgg.279.1572296573054;
        Mon, 28 Oct 2019 14:02:53 -0700 (PDT)
Received: from saurav ([27.62.167.137])
        by smtp.gmail.com with ESMTPSA id x139sm11878979pgx.92.2019.10.28.14.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:02:52 -0700 (PDT)
Date:   Tue, 29 Oct 2019 02:32:45 +0530
From:   Saurav Girepunje <saurav.girepunje@gmail.com>
To:     agross@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        pedrom.sousa@synopsys.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     saurav.girepunje@hotmail.com
Subject: [PATCH] scsi: ufs: ufs-qcom.c: remove unneeded variable
Message-ID: <20191028210244.GA29784@saurav>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ret variable is not modified in ufs_qcom_suspend().

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index a5b71487a206..0ef24cabe1dc 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -530,7 +530,6 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct phy *phy = host->generic_phy;
-	int ret = 0;
 
 	if (ufs_qcom_is_link_off(hba)) {
 		/*
@@ -545,7 +544,7 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufs_qcom_disable_lane_clks(host);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
-- 
2.20.1

