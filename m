Return-Path: <linux-arm-msm+bounces-15774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B3892598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE5CD1C21487
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7686F1353E1;
	Fri, 29 Mar 2024 20:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TPTjhLSv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45713BC36
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745443; cv=none; b=VN1fZKSA6M8NWKT5mPIXRa7r21pc+E+S3m7sRytcTFYX1CYLgRQ9x96ZZn6Wj8sGsgGE1YCmQyyMpr4fPtmp4eM0rKUG8dWNBa6wpEQOby0s80VTRsgwRoZjGg0cdwYMdOsJfSqEKYg0wvtlLCNcZWZfKypgrulb5a3cHEfjp/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745443; c=relaxed/simple;
	bh=PqxfmcZUl71aJ83+FVaDE3fBXAA/MF4FXGrWqbmE6/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MpqThj3kA3bD6KSy0zhCUpV5/WWXYY4V0WHmiq1UReZFuOAbsRjviG5ZP2g6+Hvl0aZVFowGG1Ml/Ot93olR7qHlhG28HJx8Z29Qa8SpqX/ryAKu6yJXNeuiccq3t+xc5B9E2UmXjrMUP3Pg5DtVJYzFTuCGyLq5EU1Lxh8PWZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TPTjhLSv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QjyaSVMjBwePVdedDMMBn4vO294tfAzIl87qC/KNtw=;
	b=TPTjhLSvN75ogmMa1GWYwNuVnquMKUW5nipcCVLsEZGwG7PdVic0CXYaSlwKRHt0FLCW7w
	urDZZ381YfWwSV+z5p6T4qkHOZLRZrVCFLfsH8eeXnRSdrY4VQyoZi5ABBAHbXR2FpGRSc
	wB/eP0w+NM4aoTv10vkQlcnCy/TJLcA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-JaIn5e-mMvGZae4CVai66Q-1; Fri, 29 Mar 2024 16:50:39 -0400
X-MC-Unique: JaIn5e-mMvGZae4CVai66Q-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-69654139bd5so22967316d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745438; x=1712350238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QjyaSVMjBwePVdedDMMBn4vO294tfAzIl87qC/KNtw=;
        b=ruSd9GyKAGk+bUZJw6mCEUENME7WxekhMz2BHfOJ56M9ZQ8DuFa3DOr3VUBY/U+5xY
         ZVok8I0Prq5sHuBAFn2YHRWbPACAzJ6FZ9RUXo7wU+xMBNFJJvnXumEAcOj3bYGO4da/
         M1QMePtD9vj2Cn/IA7LR7i6ZfT0dFsjMdX9hzEjLA8Dz5NUvjZptWvf1lsf3BJA/85px
         19ot62Ufl4GtK90JBJZASt8fyR0EfMuRPfMTiyka5SQ309cPdKDj3dLCWTHxDJJ8Urwx
         NbB4tLn1DubM1aLUDK+eW1rl+9bApomDyHy84ps9o9eyrFhb18etUosZznXhdiaAIvFr
         9xUw==
X-Forwarded-Encrypted: i=1; AJvYcCUJDgCzYKAmYFytRRPA+GbF7syI9cNERrSsGG/U+KLW0bw/Dr2cOxIjLDqpziX3q1KPDANZNo6hKpfrNozf8ctfwxle5TZ4o3+Ut/Lmxw==
X-Gm-Message-State: AOJu0YzeKCP7Nmr/fdjiuPfiOuna4YH7eRtxJh8g5xwYArLNtvkHydSj
	k5Dg8IpW8Qw96MloQFiRYWGKPB71rq6vDKHqHsHDLkjWpl6dbg2L6PATqvqogF3hNl/y+LT/n4w
	s6Qb8OpDB2iVonOuiKaN8cIhO9peCikZkVc36+SAqcH7MPdsVAYlM06WqhZWbVq4=
X-Received: by 2002:a0c:f98b:0:b0:696:b03b:95c9 with SMTP id t11-20020a0cf98b000000b00696b03b95c9mr3554501qvn.45.1711745438108;
        Fri, 29 Mar 2024 13:50:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeopnUxHF7SURKgs64+ifYV1WqjEh+CLYVI3V7yZtqeLq0zE8KjS5O671BagYz47YJT4NKBQ==
X-Received: by 2002:a0c:f98b:0:b0:696:b03b:95c9 with SMTP id t11-20020a0cf98b000000b00696b03b95c9mr3554487qvn.45.1711745437715;
        Fri, 29 Mar 2024 13:50:37 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:50:34 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 09/11] scsi: ufs: core: Perform read back after
 disabling UIC_COMMAND_COMPL
Date: Fri, 29 Mar 2024 15:46:51 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-9-181252004586@redhat.com>
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

Currently, the UIC_COMMAND_COMPL interrupt is disabled and a wmb() is=0D
used to complete the register write before any following writes.=0D
=0D
wmb() ensures the writes complete in that order, but completion doesn't=0D
mean that it isn't stored in a buffer somewhere. The recommendation for=0D
ensuring this bit has taken effect on the device is to perform a read=0D
back to force it to make it all the way to the device. This is=0D
documented in device-io.rst and a talk by Will Deacon on this can=0D
be seen over here:=0D
=0D
    https://youtu.be/i6DayghhA8Q?si=3DMiyxB5cKJXSaoc01&t=3D1678=0D
=0D
Let's do that to ensure the bit hits the device. Because the wmb()'s=0D
purpose wasn't to add extra ordering (on top of the ordering guaranteed=0D
by writel()/readl()), it can safely be removed.=0D
=0D
Fixes: d75f7fe495cf ("scsi: ufs: reduce the interrupts for power mode chang=
e requests")=0D
Reviewed-by: Bart Van Assche <bvanassche@acm.org>=0D
Reviewed-by: Can Guo <quic_cang@quicinc.com>=0D
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/core/ufshcd.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c=0D
index 268fcfebd7bd..dfa4f827766a 100644=0D
--- a/drivers/ufs/core/ufshcd.c=0D
+++ b/drivers/ufs/core/ufshcd.c=0D
@@ -4287,7 +4287,7 @@ static int ufshcd_uic_pwr_ctrl(struct ufs_hba *hba, s=
truct uic_command *cmd)=0D
 		 * Make sure UIC command completion interrupt is disabled before=0D
 		 * issuing UIC command.=0D
 		 */=0D
-		wmb();=0D
+		ufshcd_readl(hba, REG_INTERRUPT_ENABLE);=0D
 		reenable_intr =3D true;=0D
 	}=0D
 	spin_unlock_irqrestore(hba->host->host_lock, flags);=0D
=0D
-- =0D
2.44.0=0D
=0D


