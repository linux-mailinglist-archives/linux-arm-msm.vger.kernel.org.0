Return-Path: <linux-arm-msm+bounces-15767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6D892583
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB64CB2207F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED8813B59A;
	Fri, 29 Mar 2024 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YGFs/+2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD78585631
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745334; cv=none; b=GIEz9rOfrjXb1EuTHLxgmDsw6xOjGWvMOVR45Bkr6sw1tM5zzfGoZSnaqIda4EJ99BC+2uRYMbMAk5S/0JuN28U+K+6/8L02eC8/fC/S6RxhhJ2iZUGm1s3OoD+lDX58lE2cPDZrugpq/5hX+u5KYdaH3Lv78jDWBtoIuQbwv/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745334; c=relaxed/simple;
	bh=noY0Ok43Br9Lq9vxVD8O578wOnnwfbfMJqrIM3jYkv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=moSMRlFll/JlwZTtGJdKbaXylTLmVpIed/wE4jL94JBgmE0OdZzmnfFa9rHPUbnfdQfgfnawwc0pGPg3t4dEyWwykm6D2evaq5+W3/E3pINEYLtG7778Iz5TOmvHzi1ePI10I1HK9UfLigQ1y2DC1o6mPSu1dJEPkd+ly5TJUe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YGFs/+2L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+uex28Uh2UrmMwKWwWQdWkljJkUfVw1qoAdqpkkJAvI=;
	b=YGFs/+2L/so5RkefOtHx1PlEAyKPR3ayWEem4sRFSWn6I9rLdflcV3p3LGBiwS8CSDflbO
	XwvciMh2J1z+wwe95LVuCd6Eq36YQarWz0i5Pua25rSpl0PH5oFM3BkiXwfnmptU0Ah/+M
	geLd/dfx4WmvZjEwk8Imhr6NCFfPHvk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-It82g8UQO_6h4DwrU7dheQ-1; Fri, 29 Mar 2024 16:48:50 -0400
X-MC-Unique: It82g8UQO_6h4DwrU7dheQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-696a266542cso20030286d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745329; x=1712350129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uex28Uh2UrmMwKWwWQdWkljJkUfVw1qoAdqpkkJAvI=;
        b=SHqQFfDX5Q0XZQ8zKJt+BVUgLjzrc8z8KiwJcZENd/MUwWeQX+uFemFf7aSqAemWtV
         q3AVAmui3SWyNEaYM/5e266dAdvpyZdgUtfvh/0c2ypNBwR65F07fLS0Aw2hk6m9rM8u
         lYc3/sVzLTMMaEahxk3lqoEevxvJ6Xp+RGllhAk6bO5dMVYW257TuvLLDUxgDCv4FibP
         GZ37FNi6BuzgAum7YN1skAvFmYs/FdLxl22uRYqBgy9MG76DILQqWO2ctZamQAHNzNyq
         b20MZqQF8nbT6th9vav3+lZrXAqgegFfAVDuv7d9apbfYC3ye0hy4OeBDd7KTCpJrwqQ
         HF/w==
X-Forwarded-Encrypted: i=1; AJvYcCUPG9cJ265gryN6QJxgxB/3H+gxD4JSe6wdwhBsPsu/3CQnjozLSQTMhv4H1Yx8p4je1Q2lgKrZenTeYDPwHQvqpvc9bTv2uiFKOtrFvQ==
X-Gm-Message-State: AOJu0YyECzYPv9fnlfnEOkAP/R562DS4wLLB4nWGrdf+XfYme1MVtyZN
	/4V25vLTHOmWHrEN8tF0fyVdq54oIn8d+tJlCkWGN9ahJl6DpVe1xHg36igl7RrlnhDl90JWUB9
	6gd/CcNwWQVIah+H/8wrXaAowXOT9dA4zuw0xxFvS9/Ua+AEHU//ivYm2fGbQrdE=
X-Received: by 2002:a0c:b542:0:b0:696:a324:cd9e with SMTP id w2-20020a0cb542000000b00696a324cd9emr3095518qvd.29.1711745328980;
        Fri, 29 Mar 2024 13:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvBfgYmwP1iGTeLUYx8CVUhOtv1wYg6+LYE6N5bTtRV/i7BJo/aa22Q4+l3Q6ah0cplyRTFg==
X-Received: by 2002:a0c:b542:0:b0:696:a324:cd9e with SMTP id w2-20020a0cb542000000b00696a324cd9emr3095504qvd.29.1711745328590;
        Fri, 29 Mar 2024 13:48:48 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:48:45 -0700 (PDT)
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
Subject: [PATCH v5 02/11] scsi: ufs: qcom: Perform read back after writing
 REG_UFS_SYS1CLK_1US
Date: Fri, 29 Mar 2024 15:46:44 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-2-181252004586@redhat.com>
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

Currently after writing to REG_UFS_SYS1CLK_1US a mb() is used to ensure=0D
that write has gone through to the device.=0D
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
Fixes: f06fcc7155dc ("scsi: ufs-qcom: add QUniPro hardware support and powe=
r optimizations")=0D
Reviewed-by: Can Guo <quic_cang@quicinc.com>=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/host/ufs-qcom.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c=0D
index 06859e17b67b..804dc8153e7b 100644=0D
--- a/drivers/ufs/host/ufs-qcom.c=0D
+++ b/drivers/ufs/host/ufs-qcom.c=0D
@@ -501,7 +501,7 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, u32=
 gear,=0D
 		 * make sure above write gets applied before we return from=0D
 		 * this function.=0D
 		 */=0D
-		mb();=0D
+		ufshcd_readl(hba, REG_UFS_SYS1CLK_1US);=0D
 	}=0D
 =0D
 	return 0;=0D
=0D
-- =0D
2.44.0=0D
=0D


