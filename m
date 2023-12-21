Return-Path: <linux-arm-msm+bounces-5806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FE81BEDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 20:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D75951C240B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F787760BD;
	Thu, 21 Dec 2023 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MM4K1Qg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC001768F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703185845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1l5xZhbao6yyLMAHMlDGMBOyE+StA4U3ea1c7HAYjQ=;
	b=MM4K1Qg5ixF+7DvNKlLQvc0mNnHFia6PZkQvnz9jSDgw7WPKUsb/rUKBEq6W+f5Yudlly1
	7nNtg2YR2pxc3WzYvrKEy93FjhLDhUyMw+xES8RpuX09qqyQkWyWlrjaLOyTLcKGu8asdT
	5C2eUo9q+X86rWAe9fhAxsFT/0sY27o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-MoR5aDHFO7W81WxOzahxFg-1; Thu, 21 Dec 2023 14:10:44 -0500
X-MC-Unique: MoR5aDHFO7W81WxOzahxFg-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7810bb73a29so141912185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 11:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185840; x=1703790640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1l5xZhbao6yyLMAHMlDGMBOyE+StA4U3ea1c7HAYjQ=;
        b=WyH3C2Zzy3K0/a8AgE8eI/oZgGV5aMo+meFZox3f7Xb/5PDLxARgtpUa1YvFx+SnMZ
         tgfdrWMjBZ0Tq6Lnfjovj9UPINAcS5CyVMEVUfSqWAp42wHwbEpRNrJA8JHtPbjLYOnq
         mlpmp2ySjpKSRPRt9M1U8+enpRWl3aG2afNgGsNCeXNuAWDU4f8Foe5LWwYNb9paAWs7
         ne6jB5nnpQwvTUQblB//umEmIj8HmxHsfMX+eBPDZb9jgHh2mDFa6AM+5od7aLMDyxap
         0iewhLH8ylHA3yLMKtkR51Xek2ISFZ02Ja+S6yfsL38rTAnDd7tlKE8QffQG0Kjfh7+3
         K9lA==
X-Gm-Message-State: AOJu0YweoutnsvMIshqvxvHR+Xajv2kBBhGnHoUi6IjoOnQaT/rpo5hV
	ZldRCFG4MGAJov1/AoHnxOFou9Rzc5tBSL2TGLjRLMhdk4esi2AAbuMYzODf5qrnZSDaRgKR07+
	mBCTyXjHM95on+ygRtzTHoAI6S60iHEUazw==
X-Received: by 2002:a05:620a:4892:b0:77f:3d4a:6dcc with SMTP id ea18-20020a05620a489200b0077f3d4a6dccmr391384qkb.8.1703185839992;
        Thu, 21 Dec 2023 11:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX+dR9DtWOuolJLymek7d+eoRVfQ3BEH3l/IVbewzj2Pd/9nH3x1ycG5ZycRYe4RTUV4Zk5w==
X-Received: by 2002:a05:620a:4892:b0:77f:3d4a:6dcc with SMTP id ea18-20020a05620a489200b0077f3d4a6dccmr391370qkb.8.1703185839745;
        Thu, 21 Dec 2023 11:10:39 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id 25-20020a05620a04d900b0077f0a4bd3c6sm846370qks.77.2023.12.21.11.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 11:10:37 -0800 (PST)
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
Subject: [PATCH RFC v3 03/11] scsi: ufs: qcom: Perform read back after writing testbus config
Date: Thu, 21 Dec 2023 13:09:49 -0600
Message-ID: <20231221-ufs-reset-ensure-effect-before-delay-v3-3-2195a1b66d2e@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221-ufs-reset-ensure-effect-before-delay-v3-0-2195a1b66d2e@redhat.com>
References: <20231221-ufs-reset-ensure-effect-before-delay-v3-0-2195a1b66d2e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

Currently, the testbus configuration is written and completed with an
mb().

mb() ensure that the write completes, but completion doesn't mean
that it isn't stored in a buffer somewhere. The recommendation for
ensuring this bit has taken effect on the device is to perform a read
back to force it to make it all the way to the device. This is
documented in device-io.rst and a talk by Will Deacon on this can
be seen over here:

    https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678

Let's do that to ensure the bit hits the device. Because the mb()'s
purpose wasn't to add extra ordering (on top of the ordering guaranteed
by writel()/readl()), it can safely be removed.

Fixes: 9c46b8676271 ("scsi: ufs-qcom: dump additional testbus registers")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/host/ufs-qcom.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4c15c8a1d058..6df2ab3b6f23 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1332,6 +1332,9 @@ static void ufs_qcom_enable_test_bus(struct ufs_qcom_host *host)
 	ufshcd_rmwl(host->hba, UFS_REG_TEST_BUS_EN,
 			UFS_REG_TEST_BUS_EN, REG_UFS_CFG1);
 	ufshcd_rmwl(host->hba, TEST_BUS_EN, TEST_BUS_EN, REG_UFS_CFG1);
+
+	/* dummy read to ensure this has been enabled prior to returning */
+	ufshcd_readl(host->hba, REG_UFS_CFG1);
 }
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host)
@@ -1429,11 +1432,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 		    (u32)host->testbus.select_minor << offset,
 		    reg);
 	ufs_qcom_enable_test_bus(host);
-	/*
-	 * Make sure the test bus configuration is
-	 * committed before returning.
-	 */
-	mb();
 
 	return 0;
 }

-- 
2.43.0


