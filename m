Return-Path: <linux-arm-msm+bounces-15768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B7C892588
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FB11F22C5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3330D6A346;
	Fri, 29 Mar 2024 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QTWpY52X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C29213C90E
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745341; cv=none; b=Wn+kcR70jSo+faKruDClhok71MhYlVM1B7RYYXVoTDD1UyWnCTKFr1y8y8JtBtolsJh/igVcTfg9zf2RVKmVJtGb6nucu8c2K1awfcRWN+1fPZtp/atJ8wAIRif0OTppys76LGbl6QT7gheo2Rfn798ACHNeOLGTfbXseslXwMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745341; c=relaxed/simple;
	bh=M0HmSuHrJbtKk/I/nkhQeb6zl3F7XLvSgrHE9dAggrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sJNrUM6YzrjmGCNYThBcyrRPxA9xbm4Sqg2IEJbVBCESyrhLZFTWb0uTrLuRH/0jLMQQmwW+y13WuDphF1kQ+8vZLZ7z1aNzlfMMnmqXEwpirS09hKaJUjXpFHFBL+jXyZkNAIVw7UDLVVVM9RAUBYPAA3yh+7mNAHQDjj3BRAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QTWpY52X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0qQj3sTFTK+mhy/Yusmh65mAI4F/GLA2+G+J6DdmJA=;
	b=QTWpY52XUNjH5kJLK20jHghUqk5po1l2URBed7YyIvI3d7nFVcLwJx4YupuwwO/71QVlgM
	7vtzxDfp4yUJTZJ0v32cELo+fNkyarkIzytacI69cehvXpomknZGAswB/j7qNU5do/4i+l
	acyzqObheI/q8cS3J8qk4lRSHUS1xYg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-ZBNt-s2BP7C-6BlntJgPzQ-1; Fri, 29 Mar 2024 16:48:57 -0400
X-MC-Unique: ZBNt-s2BP7C-6BlntJgPzQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6964043b5f1so29083386d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745334; x=1712350134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0qQj3sTFTK+mhy/Yusmh65mAI4F/GLA2+G+J6DdmJA=;
        b=dsTaJR7gav6qUNCsZx8wq9PAtA2r0VJWePzskUJR1rjgna2DNDO38BhRuW/kCgcL02
         h7qVcINEXWDPOdQy/L6KHeB8FOhWyUVgou9UQjI2Lxb05PUfgZhdCsy6CZZGW0hQ++fv
         AGKp9NBzFdSkuTiqVnjCMhZKC0yZbI076avkcV/OmAN3NtFPLYUWeOpirgfp0C4+EXxj
         PFlWhlKBK14YzLHlBp8k6sv3s7bv5dXMYbnj/K6+8Lr8ockXRWqQ+XRLbD6K115qHdvP
         5ifoOc9MiYfpeFltNUf4Y+mwEiZL+rgCETl1ayZR9XyKP5uYQqAPVZEKGSorFI6RV2aQ
         pBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwDDjVrj1YMww3l5uGr0o+R3Q5yZDRJMN9jOn+R/+bzZjRfBGo7U7reoi966J9n/2SuHYVZCJ9CCxniPy2StTzCN4b2cf//OrmFZunwg==
X-Gm-Message-State: AOJu0YxRG8CQjVuxgLKxxNWsJNh2/IZ6nsct+rZp9jPB4V5xZJ3wrAvu
	ECVchXOELMLM65rEV8mIK63tI4ErXMebAVNIL1mEI1AbjVKMXYt2SwuWye9ZV1vP5zxByBogZwe
	WOJE8hBTYttLU6lISgT+ngalVKyohv7KdpRzPcirLLDJizTcFVULOqNXX5UqxT34=
X-Received: by 2002:a0c:efd3:0:b0:690:d4e9:fc5b with SMTP id a19-20020a0cefd3000000b00690d4e9fc5bmr3083323qvt.27.1711745334043;
        Fri, 29 Mar 2024 13:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGISpvmF8VgRSHeRST+j7omC+e+VDTZ18XcHvzjN+d0L1YGqF6uvIupDDiFZlzuG+tXsm4PSg==
X-Received: by 2002:a0c:efd3:0:b0:690:d4e9:fc5b with SMTP id a19-20020a0cefd3000000b00690d4e9fc5bmr3083293qvt.27.1711745333564;
        Fri, 29 Mar 2024 13:48:53 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:48:51 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/11] scsi: ufs: qcom: Remove unnecessary mb() after
 writing testbus config
Date: Fri, 29 Mar 2024 15:46:45 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-3-181252004586@redhat.com>
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

Currently, the testbus configuration is written and completed with an=0D
mb().=0D
=0D
mb() ensure that the write completes, but completion doesn't mean=0D
that it isn't stored in a buffer somewhere. The recommendation for=0D
ensuring this bit has taken effect on the device is to perform a read=0D
back to force it to make it all the way to the device. This is=0D
documented in device-io.rst and a talk by Will Deacon on this can=0D
be seen over here:=0D
=0D
    https://youtu.be/i6DayghhA8Q?si=3DMiyxB5cKJXSaoc01&t=3D1678=0D
=0D
But, there's really no reason to even ensure completion before=0D
continuing. The only requirement here is that this write is ordered to=0D
this endpoint (which readl()/writel() guarantees already). For that=0D
reason the mb() can be dropped altogether without anything forcing=0D
completion.=0D
=0D
Fixes: 9c46b8676271 ("scsi: ufs-qcom: dump additional testbus registers")=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/host/ufs-qcom.c | 5 -----=0D
 1 file changed, 5 deletions(-)=0D
=0D
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c=0D
index 804dc8153e7b..649fada24345 100644=0D
--- a/drivers/ufs/host/ufs-qcom.c=0D
+++ b/drivers/ufs/host/ufs-qcom.c=0D
@@ -1445,11 +1445,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *ho=
st)=0D
 		    (u32)host->testbus.select_minor << offset,=0D
 		    reg);=0D
 	ufs_qcom_enable_test_bus(host);=0D
-	/*=0D
-	 * Make sure the test bus configuration is=0D
-	 * committed before returning.=0D
-	 */=0D
-	mb();=0D
 =0D
 	return 0;=0D
 }=0D
=0D
-- =0D
2.44.0=0D
=0D


