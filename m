Return-Path: <linux-arm-msm+bounces-5791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5E781BE2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C491B2567B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 18:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DC276DD0;
	Thu, 21 Dec 2023 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="enNpJMA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBAF76DAB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703183153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4md7/lhuz61o/OLaxynlTwcjr95vaOPE75vAR/46vcY=;
	b=enNpJMA4fN8JH3VNlV3uLcxRq80vl2Oc+/iVP7UrgiyZnNRsoWhRTigt40jpd0er/UInIB
	Dk0cw0HmMGSxQvT5DjkjsyRsRpqJL1xa8LeZ5epFQuZBQqpC8IsJBaO9cgbcNMFQzchx1H
	rSwENWZW1vzdnEkOci3Tlr7kaAq/oOU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-lbDaR5FQMuiXv9Tx9_-zKg-1; Thu, 21 Dec 2023 13:25:51 -0500
X-MC-Unique: lbDaR5FQMuiXv9Tx9_-zKg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67ec592bc29so15300126d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 10:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183151; x=1703787951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4md7/lhuz61o/OLaxynlTwcjr95vaOPE75vAR/46vcY=;
        b=sBDq3wkDud7Tq3GTEvHwbTxjZv8kSPqpb5w6ytKpg6dE0Rgk7vDQ7HArgBCrtoWJKm
         3qIyW7rh6T1MoSYgyBUFy1PHN/pyfpZF3tPfdMphVtwjCDMJEeuUwxW2Q8vWn9h3b7SQ
         h5X50YmUhehJH3mKPkjlNtqr+KLQWHrax8lewv7B++ZWMNUvJ6V8f6USiCiD7YesdgzM
         5IxRKR5n54vhgggZI/BBvxJmwZvsNQmgi+T2Ly4I9lbOnXycmFHOPoW49uqhmzOb79Wg
         wCSHEFoNneVFugDvQQg4nPbezGA857Zv3Axf0WAem6mPYNlaoNF3Y1AzZev0L8QXcjLI
         IYUw==
X-Gm-Message-State: AOJu0YyPGAXbSR2CFHb4I63CyMDmX4Vuk+baUzDAxcpstuaZpqnBmn+R
	mOlhK4436NKmR0y/7sLj4Y3vttWte0R/YAwhf4ibyMV6v6awTPPOYnueOtK1xP5KaHit4d6fk47
	X0S6LqhIqPZS0pkbQDgVO788UPo17ehGb0w==
X-Received: by 2002:a05:6214:f04:b0:67f:106c:aaca with SMTP id gw4-20020a0562140f0400b0067f106caacamr136463qvb.48.1703183151343;
        Thu, 21 Dec 2023 10:25:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExmZV+caO5vbXAe3tRFmp3a2qAi57YtrPfWuDvh+LaHqaf0w9mGD/BoRsz8IzVXIh+shJ/JQ==
X-Received: by 2002:a05:6214:f04:b0:67f:106c:aaca with SMTP id gw4-20020a0562140f0400b0067f106caacamr136438qvb.48.1703183151057;
        Thu, 21 Dec 2023 10:25:51 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id da7-20020a05621408c700b0067f2c03d4adsm779605qvb.100.2023.12.21.10.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:25:50 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 21 Dec 2023 12:25:25 -0600
Subject: [PATCH RFC v2 08/11] scsi: ufs: core: Perform read back after
 disabling interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231221-ufs-reset-ensure-effect-before-delay-v2-8-75af2a9bae51@redhat.com>
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

Currently, interrupts are cleared and disabled prior to registering the
interrupt. An mb() is used to complete the clear/disable writes before
the interrupt is registered.

mb() ensure that the write completes, but completion doesn't mean that
it isn't stored in a buffer somewhere. The recommendation for
ensuring these bits have taken effect on the device is to perform a read
back to force it to make it all the way to the device. This is
documented in device-io.rst and a talk by Will Deacon on this can
be seen over here:

    https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678

Let's do that to ensure these bits hit the device. Because the mb()'s
purpose wasn't to add extra ordering (on top of the ordering guaranteed
by writel()/readl()), it can safely be removed.

Fixes: 199ef13cac7d ("scsi: ufs: avoid spurious UFS host controller interrupts")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/core/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7bfb556e5b8e..bb603769b029 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10568,7 +10568,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	 * Make sure that UFS interrupts are disabled and any pending interrupt
 	 * status is cleared before registering UFS interrupt handler.
 	 */
-	mb();
+	ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
 
 	/* IRQ registration */
 	err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);

-- 
2.43.0


