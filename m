Return-Path: <linux-arm-msm+bounces-15771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9589258E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FF601C214DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C17D6BB22;
	Fri, 29 Mar 2024 20:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aSuoJPyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F9A13B7B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745358; cv=none; b=sUGgxgeHGrBnHuO3fj5BiqimxBvuWXroHpRZ+ApKDwSXr5fz8S1otBzX3qC4S/BzLsFSqc2ewUGs365KjX/edD8cSLfM0mfWYgPWX33ZHw5XNqu/i+35oh/yQ2HwR4qWomjXlzMQfWTlVnBMj8WASxhV13X0DOhIwEnvTe3ocdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745358; c=relaxed/simple;
	bh=MqUK4t3jMDCrMMs9Mz5+Qm33rxyXcyDKec2Tc5qngjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2VBTg3+vdwwSmmi3R+9tXCkhBaDsG8GrRpHxG+WkuOTa/Jxq1VKD3L1YJQNQPpldwOevlbh9JctA3WhlQq6y1yClEaPqZ5EGnAWlMYri2D8sNhlW0oq/b6PIplQt45qYHZi5TGhjNPyLh8RlzhML0Hs8hLFfptARp8LRb77gOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aSuoJPyW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbrTh9OZvl0SuHCPomptfMbosBAijok3aL1EimHPcPQ=;
	b=aSuoJPyWaxGFPmnjwcKMAAiOggQi5Q682K/8/Zz9NLqjwuNAoFG3ok09Vw4hl3btgCd6ri
	eEUwrj+Ser8CXNIQjxnKi0zFki4xPX7Wx4RK8D0/2cHmC4c+pQ20LtIm309tKG0vMxv/uP
	mwj5/O0kkAPqJqUkw8E/2/6Q03AfRvI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-5tRc1IvZNlacBbqUYlvKsg-1; Fri, 29 Mar 2024 16:49:14 -0400
X-MC-Unique: 5tRc1IvZNlacBbqUYlvKsg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6986f2dba1eso24286606d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745350; x=1712350150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbrTh9OZvl0SuHCPomptfMbosBAijok3aL1EimHPcPQ=;
        b=kVgw92ppafz7fRAqsDeuyADl44IVC+vAUL3gFv3VBUEulEtQrzxZPe6jT5h+4NP0fO
         +HVQ8/wlneS52yXSAvNtklQOse+fGcn9e+afX5bCzSUG/u8gxAgbTnLl5H+aTexEiq27
         +giS1Q0OL0w3jXg/hzpmd0nAXRtH4oZfVcLXOoamtv6G2LJ0TOYRw4OPqQk63vNb4j1E
         Nc0CGQeamtSqyjOhLe6OwuQpf2sg40ssvCJvhTxXncohou5u3o9KvRjlo7xumCJFU53/
         D8wRw2BMsbhmb0teATKr+GSsqC5TN5jJkcQBn/eIKp7LrXedF4Xuut/swyhmQgPKIAtP
         jpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAUapPkUphDbOfKSVfVvWDWsBzqSlw0MfIcdpcYDTtfgMut+KJ8lxIx0fpVv+h4HeC5Qd+SXSYJMeOT56DLRThpZQ7D7UmmNXlK6+2hw==
X-Gm-Message-State: AOJu0YxvM3MUumDlmqHVIgeu687OvWV7MI392oZqTexZ9CsZavxiGJED
	aHk8H4I2ouGwgDtt0xF74pDNIUB+UpBugkXT8sfLNnAGizL5U79P/bgbz8TnhogEmdJ2JP4UWJS
	7eN+nSrEACjYJrA2KM7aFhqbv6RSqv9OAwc1BFq/muMCA6av/gG2af9zbCtORjFo=
X-Received: by 2002:a0c:d64d:0:b0:696:3a75:2964 with SMTP id e13-20020a0cd64d000000b006963a752964mr3120765qvj.18.1711745350517;
        Fri, 29 Mar 2024 13:49:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ88QIcMuVCz52/RQwc9/KpZS2Pszl/Xy5I/f0VraMqB6QDoXwQ9/e4R2qP+NldNZut7x/7w==
X-Received: by 2002:a0c:d64d:0:b0:696:3a75:2964 with SMTP id e13-20020a0cd64d000000b006963a752964mr3120749qvj.18.1711745350105;
        Fri, 29 Mar 2024 13:49:10 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:49:09 -0700 (PDT)
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
Subject: [PATCH v5 06/11] scsi: ufs: cdns-pltfrm: Perform read back after
 writing HCLKDIV
Date: Fri, 29 Mar 2024 15:46:48 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-6-181252004586@redhat.com>
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

Currently, HCLKDIV is written to and then completed with an mb().=0D
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
Let's do that to ensure the bit hits the device. Because the mb()'s=0D
purpose wasn't to add extra ordering (on top of the ordering guaranteed=0D
by writel()/readl()), it can safely be removed.=0D
=0D
Fixes: d90996dae8e4 ("scsi: ufs: Add UFS platform driver for Cadence UFS")=
=0D
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/host/cdns-pltfrm.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/ufs/host/cdns-pltfrm.c b/drivers/ufs/host/cdns-pltfrm.=
c=0D
index bb30267da471..66811d8d1929 100644=0D
--- a/drivers/ufs/host/cdns-pltfrm.c=0D
+++ b/drivers/ufs/host/cdns-pltfrm.c=0D
@@ -136,7 +136,7 @@ static int cdns_ufs_set_hclkdiv(struct ufs_hba *hba)=0D
 	 * Make sure the register was updated,=0D
 	 * UniPro layer will not work with an incorrect value.=0D
 	 */=0D
-	mb();=0D
+	ufshcd_readl(hba, CDNS_UFS_REG_HCLKDIV);=0D
 =0D
 	return 0;=0D
 }=0D
=0D
-- =0D
2.44.0=0D
=0D


