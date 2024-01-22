Return-Path: <linux-arm-msm+bounces-7835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBB5836E8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D15B287B1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7325FDC3;
	Mon, 22 Jan 2024 17:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NiOD/TPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038E35FDD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944095; cv=none; b=oy0HHXqkPFtFoS6zSFPKzmArgdfQTZr9Xw+1s3hxtP3N8JxD0oxwobKjbUQmnw7aBLxlxmHb4LsGI00WSUX5nnuTa7ZTh7jaQww1N3DPxjzj4qVxkJJeY052PSjD60KW/hBNXi5jMhTd+rkuGopIZ8gQ9N1bdsT3+HfjhPlCm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944095; c=relaxed/simple;
	bh=Dk0ZbzuKO2fbz8hwiyeupY3Rf0p2TkBz+OcBwj3by0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eYuKk+cmwNemDZt+fYXBSAD5UnEtmgsYM1l9xcjQj5VXFHh50WKq3GTV3in2PgjJ9uWE7lhyPYWBd7ilIlDRlWXN5p6cFPtQvZzL9eEql3X3nxiuYxzlGVWX8GOmcElQayVsxLehvXNR5tQZrws+5PeeuOnVzPDqrSB0iZ0ojJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NiOD/TPU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705944093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oXnNnX5CiwpvfRVPyz/BrNXU9nGKJpoL0+MVhH4Ub+c=;
	b=NiOD/TPU5yR5ijL/N/4XUXytK1pNSCDkzh39R/uAyE37zRF+OMjnSbPjqpYAF0jXqHtuT0
	OddiRhvzP3gru7PXLnBmYvNikNzm6dSFsNtx5fWrOz1Owyeus9OZXw/uBmwoLHb6oLRGOg
	sOJbhbyRyjYA3hBohv8PSYyzYUEZUIE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-rO8z_XTEPQagRpWyfAheoA-1; Mon, 22 Jan 2024 12:21:31 -0500
X-MC-Unique: rO8z_XTEPQagRpWyfAheoA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-680b7da38bcso74652566d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944091; x=1706548891;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXnNnX5CiwpvfRVPyz/BrNXU9nGKJpoL0+MVhH4Ub+c=;
        b=ideVbyuHDSXMFUxH1N0nKXZbOLxFEfVB7Io7gqW7sqIp3PWyFA1VNLCPjV9psoJlEK
         ufTDJbZK5KdxYTTuLGnD2Dh93HI28ho12h32+SQ4wHncnpiCWdFr8Enyyt7qKZUWcget
         KuBFDNOjt1fVwrxY1KD2ZYIoo+LZkDWx1jq3ezla7pgxV1vDk4ND5lssfYGCFF1hxpU3
         IWkXrj3S7H/v+/ikcqnIl2YFdxqrO2pobwFW4Ks1pCG3hlKBIZNALxY+jRr3Na2yqE8K
         AT3RgAqdf1ND5KLnKfpRXdbAmVVUPEO8fHbNCZVGrKlSc+3C7Up7a5LjGmxuYhz0kmak
         6JzQ==
X-Gm-Message-State: AOJu0Yw0SP/NQpIBLD0mqs4UlZ/LmP7fQIw6BMP9+/H0eKf6mXSezouA
	5dRyYhH5sMkDRrJmeOAY5hY0EcuxnRU/RqlbM9TG0Fj0KK0oxeFQZmRgYxtrKVCOSVYHlMZx9I9
	j5DtoiiQ/44KnGBsIwQX3o7EK7TD09FfaUe929TYhFkvmpYs+ZVQyXMo/k+4S0TU=
X-Received: by 2002:a05:6214:226b:b0:681:717b:33e5 with SMTP id gs11-20020a056214226b00b00681717b33e5mr7516340qvb.89.1705944091136;
        Mon, 22 Jan 2024 09:21:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcQJ65/OzyjOQQ1bkpEl8XAopfV3oHLH70XkmO68AEA+dh1x3i3YZjoV76bw0odnISE45pvg==
X-Received: by 2002:a05:6214:226b:b0:681:717b:33e5 with SMTP id gs11-20020a056214226b00b00681717b33e5mr7516317qvb.89.1705944090736;
        Mon, 22 Jan 2024 09:21:30 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id lf3-20020a0562142cc300b00680c25f5f06sm2567738qvb.86.2024.01.22.09.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:21:30 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH RFC v4 00/11] scsi: ufs: Remove overzealous memory barriers
Date: Mon, 22 Jan 2024 11:21:25 -0600
Message-Id: <20240122-ufs-reset-ensure-effect-before-delay-v4-0-6c48432151cc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWkrmUC/5WOQU7DMBBFr1J5zSDbSdyEVSUkDsAWsXDqcTOmj
 VPbcRqq3J0obGAHyz8jvffuLGIgjOxpd2cBM0Xy/TrKhx07dro/IZBZN5NcFkLyGkYbIWDEBNj
 HMSCgtXhM0KL16zJ41jMo5KpuGlOVomEragho6bZp3tjryzN7X48dxeTDvKmz2F7/s2QBAmrNb
 S3NXvMGDwFNp9Pj0V82Q5YbdeinaD4Lkmei7G452emqEjmfTl2lzXylwbm2mkz2pRvG/ZwPTtm
 P2F0qGkb8RhU/AqX4Y2ABHKRoKi1apYz8Hbgsyxf4RFu7fwEAAA==
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

This is an RFC because I'm not all the confident in this topic. UFS has
a lot of mb() variants used, most with comments saying "ensure this
takes effect before continuing". mb()'s aren't really the way to
guarantee that, a read back is the best method.

Some of these though I think could go a step further and remove the mb()
variant without a read back. As far as I can tell there's no real reason
to ensure it takes effect in most cases (there's no delay() or anything
afterwards, and eventually another readl()/writel() happens which is by
definition ordered). Some of the patches in this series do that if I was
confident it was safe (or a reviewer pointed out prior that they thought
it was safe to do so).

Thanks in advance for the help,
Andrew

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes in v4:
- Collected Reviewed-by tags
- Changed patches 3, 4, 10, and 11 to drop the read back && mb():
    - Please note all of those patches got reviewed-by tags by either
      Can, Mani, or Bart, but one of the three pointed out that they
      thought it could be dropped altogether (some of Mani's comments
      are on my foobar'ed v2). After some consideration I
      agree. Therefore I'd appreciate re-review on those patches by
      you three to make sure that's appropriate
- Link to v3: https://lore.kernel.org/r/20231221-ufs-reset-ensure-effect-before-delay-v3-0-2195a1b66d2e@redhat.com

Changes in v3:
- Nothing changed, I just failed to send with b4 (resulting in 2 half
  sent v2 series on list)
- Link to v2: https://lore.kernel.org/r/pnwsdz3i2liivjxvtfwq6tijotgh5adyqipjjb5wdvo4jpu7yv@j6fkshm5ipue

Changes in v2:
- Added review tags for original patch
- Added new patches to address all other memory barriers used

- Link to v1: https://lore.kernel.org/r/20231208-ufs-reset-ensure-effect-before-delay-v1-1-8a0f82d7a09e@redhat.com

---
Andrew Halaney (11):
      scsi: ufs: qcom: Perform read back after writing reset bit
      scsi: ufs: qcom: Perform read back after writing REG_UFS_SYS1CLK_1US
      scsi: ufs: qcom: Remove unnecessary mb() after writing testbus config
      scsi: ufs: qcom: Perform read back after writing unipro mode
      scsi: ufs: qcom: Perform read back after writing CGC enable
      scsi: ufs: cdns-pltfrm: Perform read back after writing HCLKDIV
      scsi: ufs: core: Perform read back after writing UTP_TASK_REQ_LIST_BASE_H
      scsi: ufs: core: Perform read back after disabling interrupts
      scsi: ufs: core: Perform read back after disabling UIC_COMMAND_COMPL
      scsi: ufs: core: Remove unnecessary wmb() after ringing doorbell
      scsi: ufs: core: Remove unnecessary wmb() prior to writing run/stop regs

 drivers/ufs/core/ufshcd.c      | 15 +++------------
 drivers/ufs/host/cdns-pltfrm.c |  2 +-
 drivers/ufs/host/ufs-qcom.c    | 12 ++----------
 drivers/ufs/host/ufs-qcom.h    | 12 ++++++------
 4 files changed, 12 insertions(+), 29 deletions(-)
---
base-commit: 319fbd8fc6d339e0a1c7b067eed870c518a13a02
change-id: 20231208-ufs-reset-ensure-effect-before-delay-6e06899d5419

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>


