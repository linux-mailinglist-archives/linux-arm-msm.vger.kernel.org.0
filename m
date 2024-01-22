Return-Path: <linux-arm-msm+bounces-7836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121F836E92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5DC1F2CABC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E3C6089A;
	Mon, 22 Jan 2024 17:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8zi/j1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A120750A89
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944098; cv=none; b=mjUi+ZbqADC15Iz0dPYPfhLemq2/fdEIFw8tLrkCNopmW7JTxZzsbnMQOg6JnOg+nhMG7gObhdNnNyxV8asP3Q53LLHAVN49167Y6OnJUa/fxmfQz4dTlgfDxp4ZR75onOSvntJALOGYent9KxGPZDS2SREeQ1IQwI/SqDzt+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944098; c=relaxed/simple;
	bh=09zxCdt+NCfT08JtVbcGX9+GXw8iPNk0hTs2e6ou3d4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JW7SJM3z20sNky4as/zBZfP2kkBbOcC68lh0uIHo/Kx+v0E7tA63lVKmXK0lqn0nAd61w+SiAeEs3x791k6Zr9NjKOUOPhhRdM+ch1eg8Jky4kGDsqOOe2of1Pt40jMd8uks0kpnabpsL8aDgYuzFZFrgFKO9fvR25Vx/L2sWus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I8zi/j1S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705944095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NX3H6VfoJEzhW/8XTfEE0I9qy52CGxJXMOtu5CoBhrc=;
	b=I8zi/j1S7IB4NpQfdjdui+zd83tJ+NjXvb89lIwEO925FHlbPZCoo+Jp8YDep62a90Zai8
	yBRGBBJuDNOXepe/0oZzWps/xAmHCB/wsgXC15RJRMnTMPLhtX4iTsjonjTp9NKoVxzs4Z
	5mibiSI7cEOof59qwKNUn3AtN1KDaIY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-hhA9XIJoO_yHkKDGE9i5BA-1; Mon, 22 Jan 2024 12:21:34 -0500
X-MC-Unique: hhA9XIJoO_yHkKDGE9i5BA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6855c0719a8so36356716d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944092; x=1706548892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NX3H6VfoJEzhW/8XTfEE0I9qy52CGxJXMOtu5CoBhrc=;
        b=dNrRVF1P7BnrHJW+NwSuDJ+I7+yqfAvZF2etx7hhJQPYTUWmMsx0i137j0C6VMib4D
         Eux+Y57yGvlu7ZLoTT0T+lxYXTI3LepgqvQBYqRYO8WoFY+7EgtPsgD1ZX9BE8VIdL8t
         hWNi9QOe44adzdfeOydtKI3r8BTR44G6i1lG+RvLURVPY+tmqECGu95C4accRTHvE5dn
         i+lsefUFE4iRhosLViAXVfaPZP+YgS0ThaKMdDjxits2LQ+PSICh6FFItQE7EEGa1aKr
         EdAZGkta9phlkALFTFel/QfvpWlLZKfeJFc9h5pMBD+E2sACJDaBPGu2GOYDcjaD7q33
         NZYQ==
X-Gm-Message-State: AOJu0YxTzjZzNmn+2QN/pU1kQrHGNvkh2Hc1rrhl4AhzoxUJnEdT/BBp
	edyXT7RCsF8hqYZ/v3WRi54QEh2tPdPj/WshvWLkIoFEeOAZmqtXZ5D/4yEI2lFbkShzDbWkBhI
	3l7wixIuGNbS/5qvGUjTZ89kiG7sjjJF/Mzfpr6vBREgh3QueIb1AhENVdICx2AQ=
X-Received: by 2002:a05:6214:76d:b0:685:7524:dd7b with SMTP id f13-20020a056214076d00b006857524dd7bmr5671164qvz.97.1705944092379;
        Mon, 22 Jan 2024 09:21:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETM3O+0LREiehrGMV5y+Bz61CfAxNisi0IJmhr61MCq4f9E5bPXPlQXvd5/xIk78wvftei+A==
X-Received: by 2002:a05:6214:76d:b0:685:7524:dd7b with SMTP id f13-20020a056214076d00b006857524dd7bmr5671151qvz.97.1705944091962;
        Mon, 22 Jan 2024 09:21:31 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id lf3-20020a0562142cc300b00680c25f5f06sm2567738qvb.86.2024.01.22.09.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:21:31 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 22 Jan 2024 11:21:26 -0600
Subject: [PATCH RFC v4 01/11] scsi: ufs: qcom: Perform read back after
 writing reset bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240122-ufs-reset-ensure-effect-before-delay-v4-1-6c48432151cc@redhat.com>
References: <20240122-ufs-reset-ensure-effect-before-delay-v4-0-6c48432151cc@redhat.com>
In-Reply-To: <20240122-ufs-reset-ensure-effect-before-delay-v4-0-6c48432151cc@redhat.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Hannes Reinecke <hare@suse.de>, Janek Kotas <jank@cadence.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Can Guo <quic_cang@quicinc.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.3

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
Reviewed-by: Can Guo <quic_cang@quicinc.com>
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


