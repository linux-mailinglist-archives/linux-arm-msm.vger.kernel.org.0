Return-Path: <linux-arm-msm+bounces-5785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024981BE18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E99DB22EBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 18:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28F863505;
	Thu, 21 Dec 2023 18:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2xMDQ3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594BF63503
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703183134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPTRfp6XgPJwYrXbStNGHlrTw26cplB52DVfER92OzE=;
	b=F2xMDQ3H46WT9iwBqnIZQOUTVEHrKdLE3cSrkX63p4O/iaC+vjpjptKiiBxVmpWL1yQW2B
	+5aOR9SFrKf9WL+uo3+XddxpdBTIVF30/DUyLMtCccanzwToJYb+eoptPMB6S6DPfUv7xU
	2Tp4QedwRFnE81U2qY0fyn0DZ7kXVys=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-iS_eTF5MNba6JKPrAPXptg-1; Thu, 21 Dec 2023 13:25:32 -0500
X-MC-Unique: iS_eTF5MNba6JKPrAPXptg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67ec592bc29so15297526d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 10:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183130; x=1703787930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPTRfp6XgPJwYrXbStNGHlrTw26cplB52DVfER92OzE=;
        b=wBiTw9/MSJatzJ7tMzgwWIjpFrP046O++MOrCgGaYy5xK0NqPjKNwXhZzI2rewJpqC
         oWTqenx2kfO/srwDw+1OsKea1Jy4pdfKB54mQzKIaNPDzJ9xNKRtuoTrxJd3qR5zfXjU
         I691gNL/Bv21BJKXQAy0GB8KxqBMsmtNXqLRA4+wktY6GHJM0kt/EZz6P+gDKEnWPxS1
         1fa4441XtkZpc2tCxJwVuBkKvP5RevGapHMoHlgmwNCqz1yGKtPrOKm81rouE1mp5L/j
         NoAFaLDG2fSmKf8P0L3i0iGcwMtzvDAxu56B/bDmISrx5PXse/fHkbRG8T5hydmvSDN0
         DWKg==
X-Gm-Message-State: AOJu0YxgV/HDAoJR337VTlAQNmwg3PDdEBND1omiVGn9yARm3LTH8zvg
	kIxdDYnF/GBennPsXAcy1cIoE3yBEkPPZgXlOdLT6dMY6VBiE5wxn5A8SnnrakZIlTxKbg66Ozl
	P7V/dYVJMyhhnubb3oC6qVCkNcAoyOvhtKl+I94cYng==
X-Received: by 2002:a05:6214:c64:b0:67f:6bd0:4943 with SMTP id t4-20020a0562140c6400b0067f6bd04943mr151781qvj.70.1703183130106;
        Thu, 21 Dec 2023 10:25:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwaPbIS2XIOdrdnhMg3BXONESa5HLJNkdw6HTKr2QVRgSJuJ/M2fMoxfftCl/PZa0g5/UEVA==
X-Received: by 2002:a05:6214:c64:b0:67f:6bd0:4943 with SMTP id t4-20020a0562140c6400b0067f6bd04943mr151756qvj.70.1703183129835;
        Thu, 21 Dec 2023 10:25:29 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id da7-20020a05621408c700b0067f2c03d4adsm779605qvb.100.2023.12.21.10.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:25:28 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 21 Dec 2023 12:25:18 -0600
Subject: [PATCH RFC v2 01/11] scsi: ufs: qcom: Perform read back after
 writing reset bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231221-ufs-reset-ensure-effect-before-delay-v2-1-75af2a9bae51@redhat.com>
References: <20231221-ufs-reset-ensure-effect-before-delay-v2-0-75af2a9bae51@redhat.com>
In-Reply-To: <20231221-ufs-reset-ensure-effect-before-delay-v2-0-75af2a9bae51@redhat.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Yaniv Gardi <ygardi@codeaurora.org>, Dov Levenglick <dovl@codeaurora.org>, 
 Hannes Reinecke <hare@suse.de>, Subhash Jadavani <subhashj@codeaurora.org>, 
 Gilad Broner <gbroner@codeaurora.org>, 
 Venkat Gopalakrishnan <venkatg@codeaurora.org>, 
 Janek Kotas <jank@cadence.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Anjana Hari <quic_ahari@quicinc.com>, Dolev Raviv <draviv@codeaurora.org>, 
 Can Guo <quic_cang@quicinc.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
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


