Return-Path: <linux-arm-msm+bounces-54938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFDA9676F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B714D165D60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8B62AEE9;
	Tue, 22 Apr 2025 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YDqvVgVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA827CB22
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321540; cv=none; b=T6lHKAc3+juIZ+oRj/4AOWKsShN5INFyogbiZEwyzKVpiKAf4QjximRt/7GHi1TZSfWaLb1qEzlcWwdRz6S5gcFBiisnFn9Jhf6520+lthRL/dRDyjyDAdjZqnOd/NDioTEVzw7locKpQ3AURAsNWzNNDz9GKkn1AUEhUIDZUbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321540; c=relaxed/simple;
	bh=6Ex4TDV2zsYu1F8S7MzsO2fAsL/9qH/bHusCYK0VeV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPLHCpRl+UIvTasdco204f8Q0kdptFmRehSCIVjASTwIZFhjyPPvQ3OxNWE14je5sjjdamjojDV42Dp7t0qqVCrXguxCptZlgsz6/q5phAyNbRr5e0XrSEPrmsSAojurFR8x27rLuQt+1afU72OaUO6Ogeyvp2f4O622g8LAjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YDqvVgVw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3535170f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321536; x=1745926336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdGiljQFkRF0Dbr2acCgX0s9x3K0UlpkYw5viR3VBTU=;
        b=YDqvVgVw/Dleryy20k5uU6BSRNuUwsC+OcGiu/jiGzAVKqE4WS/veIsAN+xi23/DFG
         J8Q6myPs9EmBgkabyi6bltBiU1jelBDnn2ORpENjgLm2iIxKD35igd9NWjbZhnjmY6UG
         YX62IKZ58TWFfFdyvjSfLblKKtfPkYLg4i0LYuCkbpqAWKZ1vIqassupGBbEfnubamBC
         PQzwn0Zi/dSyls3c/PZmwWInViKcadEp7uSDWbz0gc2sp+egC1K0qc5FXJjfRe7CPCwT
         ksSFu7OrC8K5H2GaEOQpIWEGfU0A77u6icbZ8VPywf22dCvDv9RGAzm1Z/Daa0NU+0ZG
         7uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321536; x=1745926336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdGiljQFkRF0Dbr2acCgX0s9x3K0UlpkYw5viR3VBTU=;
        b=kXPdB32cPyWNBPxcxWqMIxB5qhXIZtkBOfulW8bXyHiSAjaCrcDV/HguTFrqZPjBpp
         LiH+VL0pKKtJFx8i+uC3uGkFiLs1kTcWcrrDClq3KAU6de+Sxy7Fxk7WM7MztOTjpORr
         yye4JPGiCgxtxlFiEvKnYg2gs5xIwzbxeo+Fgt9gkfW1ryrNUQFyMdi3h9bf9M/AzOVm
         Z1q7/VjKutAdFssz2r/X9iJmhdZDK0QqUjkw++9OMI0/ZXMoPgVM7Et008oyecJ4WbOI
         klMRHJbb3btCcOTYeqpvXUOBSWxPaobOenwxO7DKj2I/gQMj6ftW7vqtngtQBz/tqNjY
         wNIg==
X-Forwarded-Encrypted: i=1; AJvYcCVPsbu+2at3kqUB3MBoPscMoh2wOyvRA2oEbGF3yiY7QZia9EfvFRRQ/awvnQ8vRsGMd/3owMOh6/oBfKbp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4OadZw/XlyHJOBjY5AobqBZAHpqFt46/KroGn4+pruZZ+4RRz
	GbPiQeBvN+YkEKOJiYJzfZDzJKoVt+gWo0PxoDbQqkjpIJRaBdN1AfzKc4RsNQM=
X-Gm-Gg: ASbGnctOOT6QZtUnvOop3RdHX0RwL0w8DTKvbL1Usn14SLUbavUgJmJ7t57G5t/A0yG
	YaaLgbR8oUOugVnZ2EIzxGVchaSNkVB/XH3mBemQGTS84B6S7R8CaPOvn2ruJn4OPnTacnQ33uf
	iwVwhcZfmrXqHsVqU1p5zv4glK4TKIQYgVZ7hgqHS5abORY2nZaJKuZaZhxatf53uGf0zeMAGfq
	VmrRxUw/XOmdGSpo4mmqFlgi/olBObyQnNkZLnTb2ysW5HydUX4juiXHYDMvp+jThSDpPKQRwQc
	gWA9dRZJYuIonEYZVQijxn8q6F6ToHC3OswnCPh6P7tHp+84VEUb
X-Google-Smtp-Source: AGHT+IG0T8nDsUkbBz1LgLUHc4nOz1k/hW6xtvig54WUQh6HRN014aiXPO5h8JbbZcarpvLjXHIJ/g==
X-Received: by 2002:a05:6000:4012:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-39efba37dbfmr12326916f8f.1.1745321535721;
        Tue, 22 Apr 2025 04:32:15 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:15 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 04/14] soc: qcom: smem: add minidump device
Date: Tue, 22 Apr 2025 14:31:46 +0300
Message-ID: <20250422113156.575971-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minidump platform device.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 592819701809..985147b563f8 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-md",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
-- 
2.43.0


