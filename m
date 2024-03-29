Return-Path: <linux-arm-msm+bounces-15769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE3892589
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D661F22D28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B5413C3C5;
	Fri, 29 Mar 2024 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sh7InM7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAA313C9AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745343; cv=none; b=WGjixsuLEjRW/ZIHKWQlv52fOHLjIH5ix6bdJduiVdc7BLwH6G1rkltYZk0HsMWZGoN7lRyN0pjBIZIBU5mfi9s85D3uPPTQM72kmk0l7vb1rtg3ngQAn76Uq7M/5Ts21mntJVYn0Un07/mmZzTtPp+AQyEgT7GHaCBYXG8vHzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745343; c=relaxed/simple;
	bh=O6r7hIkp4pDUEFyTU1K4yQZhhK4XwokMFD5oh2534Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LKDJJ3ee4+htVjAMMTHmxXWJpw+cKeSL8T8i/yL05r6UFya/4HD3VNlk70BFlcMRnSAMUWIbOXgYYbYM5ApQI/iPUA6aGxgMCJXyUkhSLd2abH/kefcBmNxqHb4pSUbU6WVTUoki+nxxIlQywMWXZWnK8UFERFTSaZsjb2HGf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sh7InM7n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWQA/2e+hFkNwU2pe5LsnYGd5I3g3WoCTrNziOID4Hc=;
	b=Sh7InM7nqQpdize4THRmPlTOSWKz8eCYXAryvN5qwUcrP4ucg6jDEePnln0kX2Fe6+0RR8
	icZa149ERiFHna+X/CrMlej1JAnrINc7zlLIIAZiaep+sLK+el7A3bnbQEYbvM/ucdUM5X
	soJb9tcKDjFHaYw1MKzGic092tEKDfY=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-5jPGH2DNOseYoDibs_bh5w-1; Fri, 29 Mar 2024 16:48:59 -0400
X-MC-Unique: 5jPGH2DNOseYoDibs_bh5w-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6e6838d04b3so2153287a34.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745339; x=1712350139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWQA/2e+hFkNwU2pe5LsnYGd5I3g3WoCTrNziOID4Hc=;
        b=q9iOoc1unTO2PxlOGZvqejVZhvEgb3XvekiLMRJ2MQrYOS0IsvyHvnE2LYe2zgwim1
         9BRQsTbM1wZll1EQMTiPvHsNTrNqkTl0TqYUC58KC7e6rkPpzqoi68tNYddbx8YsKo+o
         kka8IOyLFd1WCCXduUFuF30dXStGWGiNpi2GJQKur2N6C3ziZgQmJRjGHjHyvH358DGQ
         ywueJLXwclZ0GbCMZojYU/fDleOyD9rTSopKxycWTzmB+lGtFPD8w1aM2MnlzgAB5rS9
         3sPb+2dIVCXTTJase7nXfl9lnf1sbskDKGGudWbMEBYZ+UqXUPos3ufUZ3o6zLwzlPGk
         Sv7g==
X-Forwarded-Encrypted: i=1; AJvYcCWB1KpCxTY/fzXHTwJM1tR8E0JhVK0KcYO6AyK9PhHiJDMXJWKUZmbX5FslRwqY9oRn3eY/Vvoy+adRK8q4UKwmLCpdSS/m3XgePBYUhA==
X-Gm-Message-State: AOJu0YzN3l2KgLjMMhMaYwwD01ouUHy7LnKlqwAmHQBeCOjZJV6Xq8cf
	dv09C06wD55PTVMndw29nnYCCGVVbUWO35qJxIrlTMSuGfHALzHmttHKTfKxzDaXBYn+NiCwBDs
	9klMN6KoUyQx2Dh0JfH/4zKSCIdqRXCMzQT6qlRky83m0h8H922sVWLm4D6VKxVk=
X-Received: by 2002:a05:6830:6f47:b0:6e8:80ad:7053 with SMTP id ef7-20020a0568306f4700b006e880ad7053mr997898otb.22.1711745339266;
        Fri, 29 Mar 2024 13:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdygFKimRtHNOnD4kBIoC+a16ccsbX/L5MSYf1N8IF5y+Qv/ZoWQTsz6gRpJuVnt4/kbzHiA==
X-Received: by 2002:a05:6830:6f47:b0:6e8:80ad:7053 with SMTP id ef7-20020a0568306f4700b006e880ad7053mr997882otb.22.1711745338883;
        Fri, 29 Mar 2024 13:48:58 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:48:58 -0700 (PDT)
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
	Can Guo <quic_cang@quicinc.com>,
	Anjana Hari <quic_ahari@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/11] scsi: ufs: qcom: Perform read back after writing
 unipro mode
Date: Fri, 29 Mar 2024 15:46:46 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-4-181252004586@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329-ufs-reset-ensure-effect-before-delay-v5-0-181252004586@redhat.com>
References: <20240329-ufs-reset-ensure-effect-before-delay-v5-0-181252004586@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
Content-Transfer-Encoding: quoted-printable

Currently, the QUNIPRO_SEL bit is written to and then an mb() is used to=0D
ensure that completes before continuing.=0D
=0D
mb() ensure that the write completes, but completion doesn't mean that=0D
it isn't stored in a buffer somewhere. The recommendation for=0D
ensuring this bit has taken effect on the device is to perform a read=0D
back to force it to make it all the way to the device. This is=0D
documented in device-io.rst and a talk by Will Deacon on this can=0D
be seen over here:=0D
=0D
    https://youtu.be/i6DayghhA8Q?si=3DMiyxB5cKJXSaoc01&t=3D1678=0D
=0D
But, there's really no reason to even ensure completion before=0D
continuing. The only requirement here is that this write is ordered to=0D
this endpoint (which readl()/writel() guarantees already). For that=0D
reason the mb() can be dropped altogether without anything forcing=0D
completion.=0D
=0D
Fixes: f06fcc7155dc ("scsi: ufs-qcom: add QUniPro hardware support and powe=
r optimizations")=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/host/ufs-qcom.c | 3 ---=0D
 1 file changed, 3 deletions(-)=0D
=0D
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c=0D
index 649fada24345..66a6c95f5d72 100644=0D
--- a/drivers/ufs/host/ufs-qcom.c=0D
+++ b/drivers/ufs/host/ufs-qcom.c=0D
@@ -278,9 +278,6 @@ static void ufs_qcom_select_unipro_mode(struct ufs_qcom=
_host *host)=0D
 =0D
 	if (host->hw_ver.major >=3D 0x05)=0D
 		ufshcd_rmwl(host->hba, QUNIPRO_G4_SEL, 0, REG_UFS_CFG0);=0D
-=0D
-	/* make sure above configuration is applied before we return */=0D
-	mb();=0D
 }=0D
 =0D
 /*=0D
=0D
-- =0D
2.44.0=0D
=0D


