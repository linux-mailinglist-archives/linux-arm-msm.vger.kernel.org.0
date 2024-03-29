Return-Path: <linux-arm-msm+bounces-15775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB4989259B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D9551F22DAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF0613CAAD;
	Fri, 29 Mar 2024 20:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8tl1ftA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9D13C8F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745449; cv=none; b=rJXLjraPiJXG5ioqBC63n/xDVjU6Yg1/8dCjrJMQr1qGvQOcw13GH6EuZDn7/U2s5Qm+sNDcJm3u7J8Md9DtnVKKwrTtnm0Q+2QA8YN2Soy1n9p8OLIraMcPKqpZE/L+IQSv7aBCwEVFA3RUvz+9JqCGj50O2QH/qocHumv+fjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745449; c=relaxed/simple;
	bh=Zy+bgvSnjLkgq0s4C6zNdmvBRZh1cOH+2n6Swd6Xvls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FhK32MEBL7ec/yFaOFAHCWm6O4fls3QNjXMxdEA+YxPDV990oAwquNBDFW/sHJilmJFKBgdMPJ5Ber7y0rZzGwp25haBmYrgAYls6pjvFXCTJazi77Azj80GZspkeGQMvt6AwIZb2G01w9in8oW4bMRZGYRGpoupo9BhgR8QRPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8tl1ftA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XPnsustGT4GoUrGTcO/hGoT1b1FUZsTVit4gdTDovY0=;
	b=F8tl1ftAY93g62ur+GV/+k+4rImoZC+nsdkvx9q659c8z7ZT/L5IzWN4DR5FW8jHZIgub2
	ZTx5GkgdI2HDAXisEDrn4Gjtx/CTqlcKUqrxvB03cDSC9KZPm1mIGJIHpoUDDlYy8bAKg8
	fP77roGtnEgLxIuZi02zmB7BkNwY5JU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-DKGuWXSyO0-WQ1YvmQCh1w-1; Fri, 29 Mar 2024 16:50:46 -0400
X-MC-Unique: DKGuWXSyO0-WQ1YvmQCh1w-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6962767b1e7so28160956d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745443; x=1712350243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPnsustGT4GoUrGTcO/hGoT1b1FUZsTVit4gdTDovY0=;
        b=wgw7GLbc7ZRBZhL4/sTo16MZz+CTsorbAgmsyrTIOSZWjfoJEXyBTWsnHJVpSBDziP
         FwfH3j23ApPRepjQUoUm5FytdeYg05+QOeV/P9XTe1EzGKLO/3ik8znInprv54MXsshK
         cFSphLm6gt3vdzZFpSNoKmOOvKnusuUQX/WxBbcvxQAgrXVBLsEkxSlo8+8TJURRF7No
         QeUg+GrP5zIZbgQEJiUjQOHC12coR3EGXppZm0QB/l12F99FYNslQdf+nO5MFJfV2WZP
         qduSBiB4idzAbt36elsgcvSElBzzDzCNJPRdiSIlUeZ0LrsOHJdZnR6YzyUFFOR5SWsV
         VWkw==
X-Forwarded-Encrypted: i=1; AJvYcCWCl/F5E8hLsTPpfUh9HNxNyMVhiG8cEssuntvBORPUm4Hva49G8jGYlesceCOyULo2+94HgXZ/RFqD1d8qlPoNh/pLhrnhqf2gNs3+2Q==
X-Gm-Message-State: AOJu0Yxl83gsD/Y71qKShPUeMNYNWPV4T9WVdxqqVnzjuIDTYFo59AaU
	7UQE4FgStsLnfm/nfO0YVcKBcTL+cYLk20kD6gVGjQPiWR6Wg6cgYwjcG00G04ua5jQfyFGqSS2
	cXUUclxUDQN5ogVL0uH5opIeY+1nR3crLc9dX2onxLuafcoem+dnhGpl4ojfQKLU=
X-Received: by 2002:a0c:d646:0:b0:698:f3f0:39dd with SMTP id e6-20020a0cd646000000b00698f3f039ddmr2065519qvj.6.1711745443269;
        Fri, 29 Mar 2024 13:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBLrn+K4mLNtCh2Rz2Xmh067Hv24Kl9mQ40ZdwbQbhkZQb5T0j5S5g1FGjMUP56UzrNARqQA==
X-Received: by 2002:a0c:d646:0:b0:698:f3f0:39dd with SMTP id e6-20020a0cd646000000b00698f3f039ddmr2065487qvj.6.1711745442848;
        Fri, 29 Mar 2024 13:50:42 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:50:39 -0700 (PDT)
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
Subject: [PATCH v5 10/11] scsi: ufs: core: Remove unnecessary wmb() after
 ringing doorbell
Date: Fri, 29 Mar 2024 15:46:52 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-10-181252004586@redhat.com>
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

Currently, the doorbell is written to and a wmb() is used to commit it=0D
immediately.=0D
=0D
wmb() ensures that the write completes before following writes occur,=0D
but completion doesn't mean that it isn't stored in a buffer somewhere.=0D
The recommendation for ensuring this bit has taken effect on the device=0D
is to perform a read back to force it to make it all the way to the=0D
device. This is documented in device-io.rst and a talk by Will Deacon on=0D
this can be seen over here:=0D
=0D
    https://youtu.be/i6DayghhA8Q?si=3DMiyxB5cKJXSaoc01&t=3D1678=0D
=0D
But, completion and taking effect aren't necessary to guarantee here.=0D
=0D
There's already other examples of the doorbell being rung that don't do=0D
this. The writel() of the doorbell guarantees prior writes by this=0D
thread (to the request being setup for example) complete prior to the=0D
ringing of the doorbell, and the following=0D
wait_for_completion_io_timeout() doesn't require any special memory=0D
barriers either.=0D
=0D
With that in mind, just remove the wmb() altogether here.=0D
=0D
Fixes: ad1a1b9cd67a ("scsi: ufs: commit descriptors before setting the door=
bell")=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/core/ufshcd.c | 3 ---=0D
 1 file changed, 3 deletions(-)=0D
=0D
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c=0D
index dfa4f827766a..a2f2941450fd 100644=0D
--- a/drivers/ufs/core/ufshcd.c=0D
+++ b/drivers/ufs/core/ufshcd.c=0D
@@ -7090,10 +7090,7 @@ static int __ufshcd_issue_tm_cmd(struct ufs_hba *hba=
,=0D
 =0D
 	/* send command to the controller */=0D
 	__set_bit(task_tag, &hba->outstanding_tasks);=0D
-=0D
 	ufshcd_writel(hba, 1 << task_tag, REG_UTP_TASK_REQ_DOOR_BELL);=0D
-	/* Make sure that doorbell is committed immediately */=0D
-	wmb();=0D
 =0D
 	spin_unlock_irqrestore(host->host_lock, flags);=0D
 =0D
=0D
-- =0D
2.44.0=0D
=0D


