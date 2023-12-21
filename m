Return-Path: <linux-arm-msm+bounces-5807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD3281BEE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 20:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B80A1F23496
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268DD7691B;
	Thu, 21 Dec 2023 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IV+I3KR7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70D768FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703185852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4219KYM+Lx5MIoMXHlnouIE3ETSXouTN4mLohiWEzAY=;
	b=IV+I3KR7V90eENxBkyMKtn3WR96IrYLOdGxaf+tteEqSV5f+gxXUfzjpOvgxefZCt5/TTz
	bGgtjQ/JKsEqtlgpeTGNLGJhVAey+INFl5NjbHo4Vqd1pHAErVDYniEPGdXD0LRntOlOUv
	O9lOtExBg9t6TFkr45ohNic4iszHnwY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-1uhOwa4yOFip1GrGIkIQfA-1; Thu, 21 Dec 2023 14:10:49 -0500
X-MC-Unique: 1uhOwa4yOFip1GrGIkIQfA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7811e51eb8cso129395385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 11:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185845; x=1703790645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4219KYM+Lx5MIoMXHlnouIE3ETSXouTN4mLohiWEzAY=;
        b=gSPhv/eTWQxOWAw9QxrqJ2nFILX2taQUfRrWhiRCMFoVikW0EziczBoCt1qDTph1sN
         hIQ+bduIaQ+PmFwazgKtND33PHnAmircSaq+akzCh181QcQTnNo+Oy+eJcisCFG1mHsg
         ZL7OS4+9SpypIZEJKf9t/hjbAkF00rvGluN5GMgKlvZ/mdcg0EJVgDyPT4LMb70/4Rnp
         47EeGL8r+QijIpLFhDegv1GvKvaMx6TDYt3FPQaXuSU0t86rX/uIhs873evVcz1ghVHD
         reTh01bMyM3047FNqvzU0l/k0qkC2A+S0Zq08Mpi6sxQpqUkB/L3d2E2JRBunViZ3+q5
         ghTQ==
X-Gm-Message-State: AOJu0YyRlM7L0d2kDWAKTg618o8NenJWBowE49V+cjnjuC7Qjzhru5RD
	iX/it9pBZKwNSV5jpFRxOwNfV/iJSpyklBNn4/BLIU0FiK2jc40+O5wDVU0Q8CFXPvGXw9ymPpw
	NhuuB0teKh7YRoNOCkAfAQjXBf3ZdVbFAIA==
X-Received: by 2002:a37:c209:0:b0:77f:11d4:f58e with SMTP id i9-20020a37c209000000b0077f11d4f58emr286576qkm.148.1703185845415;
        Thu, 21 Dec 2023 11:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8jYkyl5NGRggoBhvuDpRsaNOweDEis0bQkLs57xnRD25grZcE9INmJJc/kRzCE79nsbsx3Q==
X-Received: by 2002:a37:c209:0:b0:77f:11d4:f58e with SMTP id i9-20020a37c209000000b0077f11d4f58emr286537qkm.148.1703185844782;
        Thu, 21 Dec 2023 11:10:44 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id 25-20020a05620a04d900b0077f0a4bd3c6sm846370qks.77.2023.12.21.11.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 11:10:42 -0800 (PST)
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
Subject: [PATCH RFC v3 04/11] scsi: ufs: qcom: Perform read back after writing unipro mode
Date: Thu, 21 Dec 2023 13:09:50 -0600
Message-ID: <20231221-ufs-reset-ensure-effect-before-delay-v3-4-2195a1b66d2e@redhat.com>
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

Currently, the QUNIPRO_SEL bit is written to and then an mb() is used to
ensure that completes before continuing.

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
index 6df2ab3b6f23..ab1ff7432d11 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -280,7 +280,7 @@ static void ufs_qcom_select_unipro_mode(struct ufs_qcom_host *host)
 		ufshcd_rmwl(host->hba, QUNIPRO_G4_SEL, 0, REG_UFS_CFG0);
 
 	/* make sure above configuration is applied before we return */
-	mb();
+	ufshcd_readl(host->hba, REG_UFS_CFG1);
 }
 
 /*

-- 
2.43.0


