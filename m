Return-Path: <linux-arm-msm+bounces-5804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469881BED8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 20:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AED8828636A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517A6651B3;
	Thu, 21 Dec 2023 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FIakCl5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF073185
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 19:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703185836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPTRfp6XgPJwYrXbStNGHlrTw26cplB52DVfER92OzE=;
	b=FIakCl5WZFdntBbaBYuqlVd/tkDtCZmtgFOcgiMD9jUndghowV3cLdySZ+8vywK9P0vqd5
	2dtH5xo94jCSQ+2enxil9o8GUXxDIFtW/6qKVxE0eSn/QycbjGZ6ng1kGTQfEtrc5eHKAs
	kHx6EwqQ0JwrGv+2Cyh8Pb90lxF1xzI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-lOGJCY4uMQWyXn5igUAK2Q-1; Thu, 21 Dec 2023 14:10:35 -0500
X-MC-Unique: lOGJCY4uMQWyXn5igUAK2Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-781146b7adfso135596885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 11:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185830; x=1703790630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPTRfp6XgPJwYrXbStNGHlrTw26cplB52DVfER92OzE=;
        b=eKye3ZjugsO15wwZHuOBC8DIiq5N2xXNOb2xlRXSEVWuwpRwyvj7VghLm9M7i0itAC
         TaFR4kY1a2Q+AjkkRBkFwsJf2KwTEPAGK/4wK8pwZPF6TKXsiFBB1XSj1ZxjmzJOc3Sp
         kfZzyYCkkOVT+uvyEyVOyGe85VLdwwykTna7MRjUt63ZZrah2v6FEjBnHVs1NFJf4sLB
         5RC+zHhwqdK051FBT6Y7a5z9SMWDqW9rucJZApHNgHB+kYVTSFCiizhqtoUY2qvF5GmW
         CUgwxetyYgPORIHuYEeOeqmpzX5XseWQjVYm14q/8wheiUW5iUS6j3nTXj9XUt7mZRhj
         2y9g==
X-Gm-Message-State: AOJu0Yz117rJuJp0D5BbFLZtaa0P0qu5fPnc1hsHrIk31gV+ScoJQ3Yq
	LoGTsL4M3AutdFyIVRjNvG+SvCKakPO8ZivsmqfbAfhGXJpCfRSSLtUOcbLnvl+YxkjGguxcnL/
	ufHm/1YoKWtC1vt7eY2wMfEujA/Zn7TaQAQ==
X-Received: by 2002:a05:620a:40d2:b0:781:1d86:730e with SMTP id g18-20020a05620a40d200b007811d86730emr409215qko.46.1703185830369;
        Thu, 21 Dec 2023 11:10:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjjwBX3fNd+UfPIhDxLgwriLU4sXMgeQMKrJUsdhqERZm93cgr9Xu5T3I+sMzpxXCKV6r9cg==
X-Received: by 2002:a05:620a:40d2:b0:781:1d86:730e with SMTP id g18-20020a05620a40d200b007811d86730emr409201qko.46.1703185830108;
        Thu, 21 Dec 2023 11:10:30 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id 25-20020a05620a04d900b0077f0a4bd3c6sm846370qks.77.2023.12.21.11.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 11:10:29 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Hannes Reinecke <hare@suse.de>,
	Janek Kotas <jank@cadence.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Can Guo <quic_cang@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH RFC v3 01/11] scsi: ufs: qcom: Perform read back after writing reset bit
Date: Thu, 21 Dec 2023 13:09:47 -0600
Message-ID: <20231221-ufs-reset-ensure-effect-before-delay-v3-1-2195a1b66d2e@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221-ufs-reset-ensure-effect-before-delay-v3-0-2195a1b66d2e@redhat.com>
References: <20231221-ufs-reset-ensure-effect-before-delay-v3-0-2195a1b66d2e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

Currently, the reset bit for the UFS provided reset controller (used by
its phy) is written to, and then a mb() happens to try and ensure that
hit the device. Immediately afterwards a usleep_range() occurs.

mb() ensure that the write completes, but completion doesn't mean that
it isn't stored in a buffer somewhere. The recommendation for
ensuring this bit has taken effect on the device is to perform a read
back to force it to make it all the way to the device. This is
documented in device-io.rst and a talk by Will Deacon on this can
be seen over here:

    https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678

Let's do that to ensure the bit hits the device. By doing so and
guaranteeing the ordering against the immediately following
usleep_range(), the mb() can safely be removed.

Fixes: 81c0fc51b7a7 ("ufs-qcom: add support for Qualcomm Technologies Inc platforms")
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/host/ufs-qcom.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 9dd9a391ebb7..b9de170983c9 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -151,10 +151,10 @@ static inline void ufs_qcom_assert_reset(struct ufs_hba *hba)
 	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, UFS_PHY_SOFT_RESET, REG_UFS_CFG1);
 
 	/*
-	 * Make sure assertion of ufs phy reset is written to
-	 * register before returning
+	 * Dummy read to ensure the write takes effect before doing any sort
+	 * of delay
 	 */
-	mb();
+	ufshcd_readl(hba, REG_UFS_CFG1);
 }
 
 static inline void ufs_qcom_deassert_reset(struct ufs_hba *hba)
@@ -162,10 +162,10 @@ static inline void ufs_qcom_deassert_reset(struct ufs_hba *hba)
 	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, 0, REG_UFS_CFG1);
 
 	/*
-	 * Make sure de-assertion of ufs phy reset is written to
-	 * register before returning
+	 * Dummy read to ensure the write takes effect before doing any sort
+	 * of delay
 	 */
-	mb();
+	ufshcd_readl(hba, REG_UFS_CFG1);
 }
 
 /* Host controller hardware version: major.minor.step */

-- 
2.43.0


