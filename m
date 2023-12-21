Return-Path: <linux-arm-msm+bounces-5787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34F81BE20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68692286378
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 18:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9477318F;
	Thu, 21 Dec 2023 18:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jLUehBxQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884E651BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703183140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V5DIcTT5Lroakb0MY1T0EdVJKAtxjaPCe5FVxbyPj6I=;
	b=jLUehBxQqG1coO39PQfO+uU4Q86oTbOBPk6BlZVm09f86PJXodxKayHNi0s/nPk/Vxwqui
	T/n/N+AAh9yJpzFcFV7hoaG6PnJlIMiRw6VpuPylQyx/ZpavpUP1fMdAPULFAASMcP5t8M
	V0wjtiMxRQIpm6XptovLT07/W7O4V0s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-UTxuSEcRM_mW3KxccKR6Vg-1; Thu, 21 Dec 2023 13:25:39 -0500
X-MC-Unique: UTxuSEcRM_mW3KxccKR6Vg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67eee3fbeb1so16441206d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 10:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183135; x=1703787935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5DIcTT5Lroakb0MY1T0EdVJKAtxjaPCe5FVxbyPj6I=;
        b=Y6pV5oHokZSQYnXCk+9pKOycwcr4YhTvwHhC+u7uSTwif7vrKFjrnCPWh3ZMDULAbD
         0CO6QEFpUfIzgj/2HEYM4t26vWGuYG+5HsFR0LUluk5SsIcqDMD9ml1SrzNImxPrqHgV
         x6mMt/hQRww+ZrdXaIGKeBHkPvHHvKZF3I1uV8VMIWfuV3ZLXI5TMGD0cilfJg3qp1uv
         zgv4W3siWl1gDH8OdFfTnwPYDrW3v8+mLyyiM/laI7USbAp9gj880vx0ty5UangEQC5H
         3n8V8lXBLY63QghKVI8UML7nCfvfH5yytaglvqddFw7ixcB6W4h2lb+rrZZtTnvSHARV
         1krg==
X-Gm-Message-State: AOJu0Ywk2R3B0Ky8MvfPUBapZ161nW47ykChQhsxd6xqgWCy4fGGPDXk
	S/ybfd621CP6tQA3MiNLZCv8h5S+kCmDsCj6+jCMaDAyWDFDKZZoPAfv9lTSwqlxRinCOF9+Sqf
	CgkBEg3F8K3vllaDL7Fxck1fEq9ME2Kznug==
X-Received: by 2002:a05:6214:1948:b0:67c:d2fd:3e3f with SMTP id q8-20020a056214194800b0067cd2fd3e3fmr172125qvk.27.1703183134899;
        Thu, 21 Dec 2023 10:25:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpc21i8CXWcL7uGVYN0nuNkhKxkO1wr9OVN8ezMhEFu/TuLI+a1iHq3RjIIe+4CssICPiVQw==
X-Received: by 2002:a05:6214:1948:b0:67c:d2fd:3e3f with SMTP id q8-20020a056214194800b0067cd2fd3e3fmr172113qvk.27.1703183134657;
        Thu, 21 Dec 2023 10:25:34 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id da7-20020a05621408c700b0067f2c03d4adsm779605qvb.100.2023.12.21.10.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:25:30 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 21 Dec 2023 12:25:19 -0600
Subject: [PATCH RFC v2 02/11] scsi: ufs: qcom: Perform read back after
 writing REG_UFS_SYS1CLK_1US
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231221-ufs-reset-ensure-effect-before-delay-v2-2-75af2a9bae51@redhat.com>
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
 Andrew Halaney <ahalaney@redhat.com>
X-Mailer: b4 0.12.3

Currently after writing to REG_UFS_SYS1CLK_1US a mb() is used to ensure
that write has gone through to the device.

mb() ensure that the write completes, but completion doesn't mean that
it isn't stored in a buffer somewhere. The recommendation for
ensuring this bit has taken effect on the device is to perform a read
back to force it to make it all the way to the device. This is
documented in device-io.rst and a talk by Will Deacon on this can
be seen over here:

    https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678

Let's do that to ensure the bit hits the device. Because the mb()'s
purpose wasn't to add extra ordering (on top of the ordering guaranteed
by writel()/readl()), it can safely be removed.

Fixes: f06fcc7155dc ("scsi: ufs-qcom: add QUniPro hardware support and power optimizations")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 480787048e75..4c15c8a1d058 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -501,7 +501,7 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, u32 gear,
 		 * make sure above write gets applied before we return from
 		 * this function.
 		 */
-		mb();
+		ufshcd_readl(hba, REG_UFS_SYS1CLK_1US);
 	}
 
 	return 0;

-- 
2.43.0


