Return-Path: <linux-arm-msm+bounces-7838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E08B836E9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8BA01F2CB6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08ED60DC6;
	Mon, 22 Jan 2024 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NIE4eCMr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259A160B95
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944110; cv=none; b=F1MxMPk30ooloDCmxGd7yDhXP6+6dj69ZT7qxmEjsaljMZdfKhQ+47djBH8MIuRexenpXOzbXl6Rn3R5Enr9h87xlhPcAIYB6hAJKjTNeTYufQtejkK1cjghEkqDJIwrb6gsPIP3NHf8EimvwX/e4zLj9jV41HR9e9rJiDnY1yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944110; c=relaxed/simple;
	bh=r/jz8Df2KX737BM4u04ZW0ds9pGrXMmBG5wbF5ma2rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joSMHd41NUN9wkzQ8xPyWzl5/8Mx9Xnjjtb8bAmPEsRJSaChcMyDPuQgPyDO2vmHKFhy0gauTDNXEcw5Pstq/GMvlTRV2jvJMSUn+o5qzQV0vFCFAUzzExd52F4JoY+KA2Vs9af1cjBM7aat7BOnTmXxI/NegPKc6BSvub6mpxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NIE4eCMr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705944108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sjlATDY0QO5uIJmBTf+Xy8olJtH1umxQHbsM1EB2vCM=;
	b=NIE4eCMra7AUQP4iKgyXISkuTE/kFbyi3UuaIRR6Cl4Q2fy+igUS/8po809yS36v+RmVhk
	n4DCPl4IUK+JH5g8GG/UKF0teFRYvnGGhOOjQbL05T51WVzDnQbran4vMR+Xlwx/cJv412
	RyY6lO7wGgqXonIrFPGjcTIyYeyyBDE=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-l2U9aSlVNA-gGDOzNYVuvQ-1; Mon, 22 Jan 2024 12:21:46 -0500
X-MC-Unique: l2U9aSlVNA-gGDOzNYVuvQ-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6dfb69507beso3175318a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944102; x=1706548902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjlATDY0QO5uIJmBTf+Xy8olJtH1umxQHbsM1EB2vCM=;
        b=Rvq5zxgqJG3lf/Wc6qAmyJbUmTuuoxu8MkEf4zPzkH85qlC0aYX7sWGUCe9YoJlkNx
         KpqEpbHf5EULxx2MSupfTzM5HCurY1ZauAnBMMsOBq8HJF7wiWaR5zGPe9ux9JIi+iYJ
         LGkE570eGlDhtwL+gn4V93E8/SRvWX1TE820Q9MZUV/TkhDZf58GbEG1/50KSocZ+w5L
         PPIauVDR1t7UYjw84XxkdLBreDzFDQYKBKQzcwmXa32LlfeuNgg62pdGGlqav4okHd06
         OQT7Q77eGn4Q9XLXKeFt+J/nUkIn0MIzUooSZVRD5nxjixj2pIKvGalvFWIDXqUJEEo9
         G3uw==
X-Gm-Message-State: AOJu0YxO29k3V9jvArzNRUkNc/jQuFCt2GSsaIp/UCCSB2l44pFVDx42
	Fw/TPfuA3p4cIxc6CNkFgAIeNwW/KkvHwB7ur+I6GyGYuS6JeMfY/uyDB59OLNPQidm2K4GVcLE
	eBgT6LMKYBuHjdQuDaDXj+A9Qnp5N49+RayDGdAo/npNOMKRlQsBlfxDRwwNbN/E=
X-Received: by 2002:a05:6358:9386:b0:173:203:c5c1 with SMTP id h6-20020a056358938600b001730203c5c1mr2261914rwb.62.1705944101724;
        Mon, 22 Jan 2024 09:21:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuePQ2c2TR6znf0LRpOqv6HnOFMSiNT+KeM1co6Jjj6P9hOielxqplttblTBbZvrww1rTKog==
X-Received: by 2002:a05:6358:9386:b0:173:203:c5c1 with SMTP id h6-20020a056358938600b001730203c5c1mr2261899rwb.62.1705944101357;
        Mon, 22 Jan 2024 09:21:41 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id lf3-20020a0562142cc300b00680c25f5f06sm2567738qvb.86.2024.01.22.09.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:21:37 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 22 Jan 2024 11:21:28 -0600
Subject: [PATCH RFC v4 03/11] scsi: ufs: qcom: Remove unnecessary mb()
 after writing testbus config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240122-ufs-reset-ensure-effect-before-delay-v4-3-6c48432151cc@redhat.com>
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
 Andrew Halaney <ahalaney@redhat.com>
X-Mailer: b4 0.12.3

Currently, the testbus configuration is written and completed with an
mb().

mb() ensure that the write completes, but completion doesn't mean
that it isn't stored in a buffer somewhere. The recommendation for
ensuring this bit has taken effect on the device is to perform a read
back to force it to make it all the way to the device. This is
documented in device-io.rst and a talk by Will Deacon on this can
be seen over here:

    https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678

But, there's really no reason to even ensure completion before
continuing. The only requirement here is that this write is ordered to
this endpoint (which readl()/writel() guarantees already). For that
reason the mb() can be dropped altogether without anything forcing
completion.

Fixes: 9c46b8676271 ("scsi: ufs-qcom: dump additional testbus registers")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/host/ufs-qcom.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 0603a07a23a2..a489c8c6f849 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1429,11 +1429,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 		    (u32)host->testbus.select_minor << offset,
 		    reg);
 	ufs_qcom_enable_test_bus(host);
-	/*
-	 * Make sure the test bus configuration is
-	 * committed before returning.
-	 */
-	mb();
 
 	return 0;
 }

-- 
2.43.0


