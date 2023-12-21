Return-Path: <linux-arm-msm+bounces-5792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C281BE32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 271BFB23BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 18:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA30376DAA;
	Thu, 21 Dec 2023 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XX8nyX0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4894D7764D
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 18:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703183156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xUUJuT608SRhCl6+0/SpXWAx7Kuk//nvBAACeA7YhJo=;
	b=XX8nyX0P3G9JUE8n3EBALOWDXFnoioqhf7rGzqxwp2rBmdT46rL2+bbPFCVGwQQUsC+BaL
	jE271mJAByekCzbGwrCy1rZMPzaLjrcdoLeynkITmdlMqi5QRxIqZTb8uiSP3+JzpGpND8
	qYwXl0YxHH2VEy1BDdmuwmSnfCq6uVk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-W7356vkkMX-y9wQMhcmiAA-1; Thu, 21 Dec 2023 13:25:54 -0500
X-MC-Unique: W7356vkkMX-y9wQMhcmiAA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67f4e1a35daso15009686d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 10:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183150; x=1703787950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUUJuT608SRhCl6+0/SpXWAx7Kuk//nvBAACeA7YhJo=;
        b=XU4jOBobN4L33DATYwtSDDTMuTRfnaEc48lPSOJeEKgJMfYlJAc6OpRa8wgIYLcs+J
         cJg8fxucbXVyB4VjMFBuoVtILF2SxOUn3lTfjO/RQNHovCuATHar917rpn5dRdSiONPv
         sOu8VCtDPbASt0WS+L8yJYTLgY/iah2mkygtP+BjN7LPDYnADbJxGsJgM7mO8NMz8EuX
         KA1N/9XMvQGXKk2iFPaWdklYTliSu2YLrdAFPqwLGvxEzlib+6HG/qEa20wFlc5MYM9Y
         oZwCuwK/8F+WW4HAaqWiZgwEgmUNVH2npnIo5NurIVCluzgMib+9kPDsYkD2moOZIYCi
         xfFg==
X-Gm-Message-State: AOJu0Yz/45FcanrFYZ3kJCgdVd7HFmjDp9PamK1nMEtR4p0PCOSj4L1x
	fRE/RHFRCWpLFeD9n1x+jStCnu+eLjm6tl+VfC4Xcs/gI60xuAziibEXb+GOa1Mrvj+x/VT7yiQ
	VZw6s3YK4TFvurPROkWUCELDJ0du69RtzmA==
X-Received: by 2002:a05:6214:23cf:b0:67a:a721:f313 with SMTP id hr15-20020a05621423cf00b0067aa721f313mr119299qvb.83.1703183150064;
        Thu, 21 Dec 2023 10:25:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ9Kju9IqTA5EEJRzv9VHVG6omJS9ICt+kO57nwljfFPxGim4CiNb9HpK10WnlhSNr539//w==
X-Received: by 2002:a05:6214:23cf:b0:67a:a721:f313 with SMTP id hr15-20020a05621423cf00b0067aa721f313mr119290qvb.83.1703183149828;
        Thu, 21 Dec 2023 10:25:49 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id da7-20020a05621408c700b0067f2c03d4adsm779605qvb.100.2023.12.21.10.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:25:46 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 21 Dec 2023 12:25:24 -0600
Subject: [PATCH RFC v2 07/11] scsi: ufs: core: Perform read back after
 writing UTP_TASK_REQ_LIST_BASE_H
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231221-ufs-reset-ensure-effect-before-delay-v2-7-75af2a9bae51@redhat.com>
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

Currently, the UTP_TASK_REQ_LIST_BASE_L/UTP_TASK_REQ_LIST_BASE_H regs
are written to and then completed with an mb().

mb() ensure that the write completes, but completion doesn't mean that
it isn't stored in a buffer somewhere. The recommendation for
ensuring these bits have taken effect on the device is to perform a read
back to force it to make it all the way to the device. This is
documented in device-io.rst and a talk by Will Deacon on this can
be seen over here:

    https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678

Let's do that to ensure the bits hit the device. Because the mb()'s
purpose wasn't to add extra ordering (on top of the ordering guaranteed
by writel()/readl()), it can safely be removed.

Fixes: 88441a8d355d ("scsi: ufs: core: Add hibernation callbacks")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/core/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index d1e33328ff3f..7bfb556e5b8e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10351,7 +10351,7 @@ int ufshcd_system_restore(struct device *dev)
 	 * are updated with the latest queue addresses. Only after
 	 * updating these addresses, we can queue the new commands.
 	 */
-	mb();
+	ufshcd_readl(hba, REG_UTP_TASK_REQ_LIST_BASE_H);
 
 	/* Resuming from hibernate, assume that link was OFF */
 	ufshcd_set_link_off(hba);

-- 
2.43.0


