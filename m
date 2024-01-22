Return-Path: <linux-arm-msm+bounces-7847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B81E836EDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 19:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE4CD1C29334
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EEE63115;
	Mon, 22 Jan 2024 17:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="igFqURIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA3E6311E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944343; cv=none; b=OssdJnJXWf+YIxrzTzeS3u0ff3Cjd16a39Gjbb0RqwicFLe55qWETtKOi0CE7qqb3SVRRQbfv+wlkKyRjZnChTCH05l8I7GZ2tqiaj+mvwgIkRdkjEk2OQqX3uZLwZN4R0BbmPylyqXgXuOgA+Co7T07I8sgogvsJUNcX6L3b0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944343; c=relaxed/simple;
	bh=lrt06U9MjfT0+aAqB1+xoJHCrTf+UY09+oCiHhhT3Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMJox8Ke/1A4TX99+Av6XZYpyBCXF3Szm+Xry9mZV/WJDpy40H68O6aMnIopoP8g2/NLoU8ib/9AY6e+ZZMEhoqyl8qvHlzgAE36XjAUuC8IovIXNvQYmrYK+1cdDmEiRwewTW05aBqCpvIl6G71ObtqK8qwMqmYVsOqhZlDVlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=igFqURIF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705944341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvA2uv2JUZrdT2MKiipHpiF6tbdfVobWEO3O5fZ7MOA=;
	b=igFqURIFOW2u6PsxYBft1AMTYtpwpZkQzSjE4oBXde86q3mNRQkhh8ep474A+1BtOS5WyN
	T0LBmpVoGfFdwBdpY8i2wtTT/KrVzT+jiNtt8tEMRiWIT1ikI4aAdEB5//hfzhC8xOxnmP
	2zZslSDjoVM+y3nCQBtsApsi+5iZZvA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-t6Bxg40VMPSY-4vgg9WXdA-1; Mon, 22 Jan 2024 12:25:39 -0500
X-MC-Unique: t6Bxg40VMPSY-4vgg9WXdA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-429ca123301so70278811cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944337; x=1706549137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvA2uv2JUZrdT2MKiipHpiF6tbdfVobWEO3O5fZ7MOA=;
        b=gwkL8Evgrr7JpMmg/ElvooDrTcmeNtWpFXpEHF9Sv4B6LX4Sb8gqsLaY3oK3vW68PQ
         1BnPprOo2Qr+/oOV3KBaT4JY514jGENL+7Z3gmTBDXzEI1KJckcMXeVInnP/MH2sBDC1
         pZ0ef1ePjc/2qKWibib9N//GTiyqv8N0kpvtvs/2Xg33ulaoYm2MzZ/oURWz70up3aeM
         jodoHhnVsun8rvfdv408k9diQcBbsZneIJwrK8FmFXXYVE0ldgLd8BxWmU+gjAqWby4b
         qIoPnvAsKd5224R31uEM+or0OeB6cxVB6Qs4UZx0HI/TVcsb5uGoOpFEiYjR0RHnFkha
         LEyQ==
X-Gm-Message-State: AOJu0YzgwplPRIdOdD+l5OWMH7qsADF5kdT8DJyI6S+K/oNjQK40Ni5y
	PCKgq1yM4g8fos3pMj6o8vReNe1mQxuZgdoItirCQe1F9teT+YZZ+rYjE7nTZA8GtaO1YquSrLn
	vbHXiv0H0mxGRsBdojdkr/w9xzMvn15nd4pUpwHEXZYErWnm5QTGYs2jm0qxQUX0=
X-Received: by 2002:ac8:4c8c:0:b0:42a:2666:a410 with SMTP id j12-20020ac84c8c000000b0042a2666a410mr5552774qtv.63.1705944336853;
        Mon, 22 Jan 2024 09:25:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJcK9rtAYzFRJnLuAvRQK60DVL+9ETfuJh2rfvtLBRbekkrCVPXBMhXR6sp/967Twv/QzifA==
X-Received: by 2002:ac8:4c8c:0:b0:42a:2666:a410 with SMTP id j12-20020ac84c8c000000b0042a2666a410mr5552733qtv.63.1705944336119;
        Mon, 22 Jan 2024 09:25:36 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a200700b00781ae860c31sm2280992qka.70.2024.01.22.09.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:25:35 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 11/11] scsi: ufs: core: Remove unnecessary wmb()
 prior to writing run/stop regs
Date: Mon, 22 Jan 2024 11:24:07 -0600
Message-ID: <20240122-ufs-reset-ensure-effect-before-delay-v4-11-90a54c832508@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-ufs-reset-ensure-effect-before-delay-v4-0-90a54c832508@redhat.com>
References: <20240122-ufs-reset-ensure-effect-before-delay-v4-0-90a54c832508@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: quoted-printable

Currently a wmb() is used to ensure that writes to the=0D
UTP_TASK_REQ_LIST_BASE* regs are completed prior to following writes to=0D
the run/stop registers.=0D
=0D
wmb() ensure that the write completes, but completion doesn't mean that=0D
it isn't stored in a buffer somewhere. The recommendation for=0D
ensuring the bits have taken effect on the device is to perform a read=0D
back to force it to make it all the way to the device. This is=0D
documented in device-io.rst and a talk by Will Deacon on this can=0D
be seen over here:=0D
=0D
    https://youtu.be/i6DayghhA8Q?si=3DMiyxB5cKJXSaoc01&t=3D1678=0D
=0D
But, none of that is necessary here. All of the writel()/readl()'s here=0D
are to the same endpoint, so they will be ordered. There's no subsequent=0D
delay() etc that requires it to have taken effect already, so no=0D
readback is necessary here.=0D
=0D
For that reason just drop the wmb() altogether.=0D
=0D
Fixes: 897efe628d7e ("scsi: ufs: add missing memory barriers")=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/core/ufshcd.c | 6 ------=0D
 1 file changed, 6 deletions(-)=0D
=0D
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c=0D
index 21f93d8e5818..358857ea9ff6 100644=0D
--- a/drivers/ufs/core/ufshcd.c=0D
+++ b/drivers/ufs/core/ufshcd.c=0D
@@ -4722,12 +4722,6 @@ int ufshcd_make_hba_operational(struct ufs_hba *hba)=
=0D
 	ufshcd_writel(hba, upper_32_bits(hba->utmrdl_dma_addr),=0D
 			REG_UTP_TASK_REQ_LIST_BASE_H);=0D
 =0D
-	/*=0D
-	 * Make sure base address and interrupt setup are updated before=0D
-	 * enabling the run/stop registers below.=0D
-	 */=0D
-	wmb();=0D
-=0D
 	/*=0D
 	 * UCRDY, UTMRLDY and UTRLRDY bits must be 1=0D
 	 */=0D
=0D
-- =0D
2.43.0=0D
=0D


