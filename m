Return-Path: <linux-arm-msm+bounces-7845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F31836ED0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 19:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED311F2F8EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D81E6281E;
	Mon, 22 Jan 2024 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WUTtXlL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893155797
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944333; cv=none; b=d9H3hLOIYnmwz7DRsirZzqKMwcyzo/qORwKfwBnXeemQrRB0oHp6v6bUmlLG0muAOdB1Gl5Y3gbbbUmuwsX5NI7HxVXn5VZeymjIxCcCMt86sgLgGYCOCsNwNpm3SuMwrLS2tySggVCYF6lSIv6xtcG9uOR0pv7elHyCkuAo5Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944333; c=relaxed/simple;
	bh=MER45LHvwiXQD+ULDnSvsVxwXZ1b2Z5xk98z1OKFCA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HslToyDLpVOqYbNF/xltvHRtam7o1Nyah1TPKM0x0usx0uwWb09suw0ZOmWfkxwQHMQct4Z5Im+xYBJJUH050gd3QDTkWmoPD9b/fbtKGscxkTCTEqEcaJ2w4HdfOC/0HL/bCh8c/s7hZ37VRQS111WftqWQWC+lR7U/iwIzy1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WUTtXlL0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705944329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWSD/O3bKBCmQqSFNDTq3XZwC2CZzWCGf6aiHY6rT3c=;
	b=WUTtXlL0vFyi3Hn4WjZEZnZ79liCysFF1Bzx27qN9f+jWyp1F66+qofaiP+cmr4p44cVPu
	/g/cEV78g4pLFZDFt+pDGtYAwlk7vRv1+IAJ+IxR9D/sVo29LfaNKtr/SoKs22S0vmQBki
	O8yKJLcsB6p/m0qObNomzO0SapvGIq8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-tZJfIaAnMyyb2Ez6eiBlbw-1; Mon, 22 Jan 2024 12:25:28 -0500
X-MC-Unique: tZJfIaAnMyyb2Ez6eiBlbw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42793cd9d33so51643581cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944325; x=1706549125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWSD/O3bKBCmQqSFNDTq3XZwC2CZzWCGf6aiHY6rT3c=;
        b=IiuVzxQkWbAijA+ZH6mf6KFbazo4P3S+uD7Ks2sE3e7UqP3OO8iJzgI9lOztZeZwKM
         nBnzN0pqt60TZwnP5fcRzFU4zfF/ll7ezjAwtr7jEdmPIdkwNiUJQrP7sNvHbuVgK2XO
         ra4un7DFcswb4fzIeXlVzPQ41DUeT+L1a3kjg8Ulwez4UDDzw0yaYVTeEpO2KZMWrMuy
         j0D1BZ2TTvSQRXyg080E6aRde+ASgT2qZuIQCTmPrFJj33RAN+q688J6fpiUQSw4Q4At
         Ks+IM4FCv4zjQMlYS0M0gKvB9+eN6E2D7grNtwRCoqjhp59caZwru9UDVRYMAd3OMy8H
         DzIQ==
X-Gm-Message-State: AOJu0YzF51qR5a+wjhLLHt72NuVaGDv3vDGdaPyakYY24CqLNLgUa0Gs
	0HfgDldurtmqNS35PaErZ7xaUR/uRzmX4X/1+dB2320U35dQenXN8HZdUKO1O5zeaLndeaC2ji5
	qH7GKzQCv4BDJpyPK4iI27V9uIXNjPH9KFdsOhTr7TwN1JK4b1vEujUnE5cSgtsc=
X-Received: by 2002:a05:622a:153:b0:429:bfe8:7cbf with SMTP id v19-20020a05622a015300b00429bfe87cbfmr5989905qtw.61.1705944325639;
        Mon, 22 Jan 2024 09:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1/s3ITcewXmjQuuSVj/VeSaPz1pDK0mjWP46v77x8t9CGNfS3RSXaOLDKXeUxl+tVObwrkA==
X-Received: by 2002:a05:622a:153:b0:429:bfe8:7cbf with SMTP id v19-20020a05622a015300b00429bfe87cbfmr5989887qtw.61.1705944325372;
        Mon, 22 Jan 2024 09:25:25 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a200700b00781ae860c31sm2280992qka.70.2024.01.22.09.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:25:25 -0800 (PST)
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
Subject: [PATCH RFC v4 10/11] scsi: ufs: core: Remove unnecessary wmb()
 after ringing doorbell
Date: Mon, 22 Jan 2024 11:24:06 -0600
Message-ID: <20240122-ufs-reset-ensure-effect-before-delay-v4-10-90a54c832508@redhat.com>
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
index 9bf490bb8eed..21f93d8e5818 100644=0D
--- a/drivers/ufs/core/ufshcd.c=0D
+++ b/drivers/ufs/core/ufshcd.c=0D
@@ -7047,10 +7047,7 @@ static int __ufshcd_issue_tm_cmd(struct ufs_hba *hba=
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
2.43.0=0D
=0D


