Return-Path: <linux-arm-msm+bounces-15766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57362892580
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CCA62842EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6491848CCD;
	Fri, 29 Mar 2024 20:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ihgZkzNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB645955
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745330; cv=none; b=K6lKGiSbbkp5ZIBSodWuiIRkVJ3kBSocOGzn9oeq+BSAocmZvpKsUQA2xRLg3AvPpFbC3e76ffqkn6rrmf46rkG+L9AR5MMwqJGMVB6LJe00mjluxE3f8lrRBaon1CRHqffwGWiRilqpedvad6n98ARrbilfNoOj2PGdcReURlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745330; c=relaxed/simple;
	bh=BP7pHzMFsulC5h5RfnNlVkbRbr65ixQCUgccOfbpOGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XrU3Sr3kPEnKp+WTKQdF4tm2zO4OwNFSkpvJ2tLwxRerg1X1ww1SIiBi/rPnuhJx5YcwtY54X5sDJGJ+t9iHtRiVFyBZ16SxBZXnV1PjcCWhVIFDGkmhhKkLK01lUtnG4cm64QgpP5fLru0ZOLL92LKmWD5pvbZQylz/EWoI/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ihgZkzNZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4OnoxFSVXPqXgZAXqDum+B43kEJjiL2qzIJ+ix8ScM=;
	b=ihgZkzNZq/JpOW2vPEjH6zFnshY0qEon3TspKAAy3Qz4B/zFQJknwdv7Aj0hSLhpFMaMEe
	WDuS/j58qhflbPBtvLo2H7wrM/0YO9XlU/CMI4aYEEz24Apz4+sLNBreM97yBnGjg9kBRw
	nnmPg4TgBmcKgkiH5f/9xLQvbm7uzI8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-lcvsFP0CPamJZa8a7Cw5Fg-1; Fri, 29 Mar 2024 16:48:45 -0400
X-MC-Unique: lcvsFP0CPamJZa8a7Cw5Fg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69680b07160so27357876d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745324; x=1712350124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4OnoxFSVXPqXgZAXqDum+B43kEJjiL2qzIJ+ix8ScM=;
        b=eHrSy5Se75miTU7ZcdpQQbGFv6Ehe1c/a8bS3wcXE1te2SsV3AcF2XEXjn/74xK9sI
         pbk2E1mShewPC3EtceFIELbsxXZxZf93+co+mK4OVasJ3ThtNZCZn61ERjXX/5S2MClA
         zCh9jIIHuERZKP0FFJiurFBEyrjvgSdxRj9QD61+FDe/Vdxp+tIixRBwSleggpmVGfy/
         B9KA8RHHvhdCjjipsH0Fdv1edCPz2+JTI5cbzutQDsbjpsm+EUl6AAqugiUBsHcXTPQR
         7jSgjjQ3TLqdfMnLNC2W1Zm3x0MUBFFNfDZa/JrSXObCmwcLRUhw8bMvKnRs+4W/k30j
         +6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCURoh4rSTX7llY61q9JK/lJbkiKE1T/u9CXLB6lg+zBiiiIKrA4rCoMKWOJYQAEuobseeTZgfIA5Q/rmzmtDQLCEan6gK7Wz2QorUY8RA==
X-Gm-Message-State: AOJu0YzxdAUP8dQkMokOpE+4xCk+3XbrrcPyPojdt2jI+mmdkISKqusf
	CijFaDEomLKnjF4rS2fhsx9wsoOSQgJShsNmf9EhHaSTFuJJYxZ0jCNOz+dfGCDdELUXUmjTUuy
	u3CG8n7BSvyL9kpouvmTRDAyCoCTkNsllk2OnmCbsDa0lJr8YNTo2rZ/7VuHHQrg=
X-Received: by 2002:a0c:9a91:0:b0:698:f39f:841f with SMTP id y17-20020a0c9a91000000b00698f39f841fmr2060283qvd.20.1711745324157;
        Fri, 29 Mar 2024 13:48:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJf7oVmqD60ifmlE6hginnH1lrLHud0fYzJl7uMi++kQu2bupDlSX6vEV/iu1GxrCkHuddlQ==
X-Received: by 2002:a0c:9a91:0:b0:698:f39f:841f with SMTP id y17-20020a0c9a91000000b00698f39f841fmr2060248qvd.20.1711745323770;
        Fri, 29 Mar 2024 13:48:43 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:48:43 -0700 (PDT)
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
Subject: [PATCH v5 01/11] scsi: ufs: qcom: Perform read back after writing
 reset bit
Date: Fri, 29 Mar 2024 15:46:43 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-1-181252004586@redhat.com>
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

Currently, the reset bit for the UFS provided reset controller (used by=0D
its phy) is written to, and then a mb() happens to try and ensure that=0D
hit the device. Immediately afterwards a usleep_range() occurs.=0D
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
Let's do that to ensure the bit hits the device. By doing so and=0D
guaranteeing the ordering against the immediately following=0D
usleep_range(), the mb() can safely be removed.=0D
=0D
Fixes: 81c0fc51b7a7 ("ufs-qcom: add support for Qualcomm Technologies Inc p=
latforms")=0D
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>=0D
Reviewed-by: Can Guo <quic_cang@quicinc.com>=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/host/ufs-qcom.h | 12 ++++++------=0D
 1 file changed, 6 insertions(+), 6 deletions(-)=0D
=0D
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h=0D
index 9dd9a391ebb7..b9de170983c9 100644=0D
--- a/drivers/ufs/host/ufs-qcom.h=0D
+++ b/drivers/ufs/host/ufs-qcom.h=0D
@@ -151,10 +151,10 @@ static inline void ufs_qcom_assert_reset(struct ufs_h=
ba *hba)=0D
 	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, UFS_PHY_SOFT_RESET, REG_UFS_CFG1);=0D
 =0D
 	/*=0D
-	 * Make sure assertion of ufs phy reset is written to=0D
-	 * register before returning=0D
+	 * Dummy read to ensure the write takes effect before doing any sort=0D
+	 * of delay=0D
 	 */=0D
-	mb();=0D
+	ufshcd_readl(hba, REG_UFS_CFG1);=0D
 }=0D
 =0D
 static inline void ufs_qcom_deassert_reset(struct ufs_hba *hba)=0D
@@ -162,10 +162,10 @@ static inline void ufs_qcom_deassert_reset(struct ufs=
_hba *hba)=0D
 	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, 0, REG_UFS_CFG1);=0D
 =0D
 	/*=0D
-	 * Make sure de-assertion of ufs phy reset is written to=0D
-	 * register before returning=0D
+	 * Dummy read to ensure the write takes effect before doing any sort=0D
+	 * of delay=0D
 	 */=0D
-	mb();=0D
+	ufshcd_readl(hba, REG_UFS_CFG1);=0D
 }=0D
 =0D
 /* Host controller hardware version: major.minor.step */=0D
=0D
-- =0D
2.44.0=0D
=0D


