Return-Path: <linux-arm-msm+bounces-15776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6C89259E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BC00284D5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBC413CF85;
	Fri, 29 Mar 2024 20:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F9gR20l5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B410413CC63
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745453; cv=none; b=epZ82yfLYGRiZC6y4z93OR9O/jdZ2w3DLE/ngwrFWfSLSnxnldPHRVJvuxQNYdj2vdXIaj/UDHJgggjmABASMeeWvFsAVdipkv+9Tthw6b9Z5WJJa825GOwGwIbcmGUqTBKYdcDLQyWVTCDfFR0zhireYtmgqSFaKSubpEi3Rko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745453; c=relaxed/simple;
	bh=BGXknjcLA50bcUKtFtKJCi5N6HFf284Wv0+1aI9g+Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YkZpnHxrRdtp0bE2I1jh4BCz6HZENtiPAnvsNs0MSjDp3TaoGqbTeoyCexpqeuWTJrLV2bEyPhhLmc3R5JIEhyctf4cktAbu8GOOeVg1T01gSht6wr7h9t5nCPi3S9hYrH00HtHKEc3M5tCm/nEpgmyi3tVfCn99eyiJMYj4i1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F9gR20l5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uf4SOXbG4RAjshjCtScug3Y0ECaz5dSCoqxe3hdLj3E=;
	b=F9gR20l5kkJUOdbFC/a/+Q1MbFPY0o+pmrofmwlg0E9g6iazivYS5TCBFecsq4zwK0lZgR
	gCvvqjnukbAd/KlO5jIiD9CP3rb7CU4AqpH9GUyM+kBhSg20ch7F+d/9ML4nBsnZiRqaPc
	ke7T0/fNNA+q1vHXG4s843OFJYK7Q7E=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-5KmXAsEyPlugG5Rk_IZSIA-1; Fri, 29 Mar 2024 16:50:49 -0400
X-MC-Unique: 5KmXAsEyPlugG5Rk_IZSIA-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7e05b1ef83dso1098493241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745448; x=1712350248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uf4SOXbG4RAjshjCtScug3Y0ECaz5dSCoqxe3hdLj3E=;
        b=hTqwR2SkAwwFQsgXCQUaWNqIdVSZFxKSSS2QwE0TOhxr653/Ass4ZtbdL7BLVCKlrx
         2TLchsRNq/xZmKxVTkRpwUFtfSieMyktnhRc93JNwWb887GjNIPdvXZVvuqdepXcGbQl
         jXbqMJBM2NEwe58ZqfAFQi6emvSJjlo1UE8y+MhlzjudEJxapUnRAGUAgKA0ff5rRruo
         w9+Mt9qrv/35Xo5L8mYBAptYI0/ZGOADgnQdmujtHhcEmLUQbpR04OLsySTr6vp6ozQV
         uyaKkToueoWvOBxhrl7I+l7Twi+8crArk06LVHt/JG6PuaPQNvAULHr0PJbZ5pQPjtCx
         MKfw==
X-Forwarded-Encrypted: i=1; AJvYcCUmBxHaxnUOqBdwlvXFsyJYfAZzbG5o3TX3WFrCycfqp+6ToE0pGHwsvY9ttgZUH9vKUVq1sunVSRV7+12PmKIDlgBTpMFEHpaZIheH5Q==
X-Gm-Message-State: AOJu0YyKls743SRZC7edIDw+dDjqd+8meF+BcDsTqrgpy8xLJ5Fa9m3L
	Q8a16yXxWd6MrKtq8sDGjzyfkSCwLYvO+r9aW6KOLdSmEySVcPerFZRmkB4C5DzdGIRgD1OLQ2r
	PJSI1o7RUoRQw7APD/b8VrBhSF3M3Tbspx2Xhb+5uEWQFHvb4hBGpcBq9ZyEOtpg=
X-Received: by 2002:a05:6102:dd3:b0:476:fab9:237d with SMTP id e19-20020a0561020dd300b00476fab9237dmr3651558vst.2.1711745448249;
        Fri, 29 Mar 2024 13:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbJHgBjF3eN8i3ddN3z1R3cQ/XH02K5EBI2mtVmXktFIkJdXz1ZhnDrVZGUZxKmIZMOtcJjg==
X-Received: by 2002:a05:6102:dd3:b0:476:fab9:237d with SMTP id e19-20020a0561020dd300b00476fab9237dmr3651537vst.2.1711745447887;
        Fri, 29 Mar 2024 13:50:47 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:50:44 -0700 (PDT)
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
Subject: [PATCH v5 11/11] scsi: ufs: core: Remove unnecessary wmb() prior
 to writing run/stop regs
Date: Fri, 29 Mar 2024 15:46:53 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-11-181252004586@redhat.com>
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

Currently a wmb() is used to ensure that writes to the=0D
UTP_TASK_REQ_LIST_BASE* regs are completed prior to following writes to=0D
the run/stop registers.=0D
=0D
wmb() ensure that the write completes, but completion doesn't mean that=0D
it isn't stored in a buffer somewhere. The recommendation for=0D
ensuring the bits have taken effect on the device is to perform a read=0D
back to force it to make it all the way to the device. This is=0D
documented in device-io.rst and a talk by Will Deacon on this can=0D
be seen over here:=0D
=0D
    https://youtu.be/i6DayghhA8Q?si=3DMiyxB5cKJXSaoc01&t=3D1678=0D
=0D
But, none of that is necessary here. All of the writel()/readl()'s here=0D
are to the same endpoint, so they will be ordered. There's no subsequent=0D
delay() etc that requires it to have taken effect already, so no=0D
readback is necessary here.=0D
=0D
For that reason just drop the wmb() altogether.=0D
=0D
Fixes: 897efe628d7e ("scsi: ufs: add missing memory barriers")=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/core/ufshcd.c | 6 ------=0D
 1 file changed, 6 deletions(-)=0D
=0D
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c=0D
index a2f2941450fd..cf6a24e550f0 100644=0D
--- a/drivers/ufs/core/ufshcd.c=0D
+++ b/drivers/ufs/core/ufshcd.c=0D
@@ -4769,12 +4769,6 @@ int ufshcd_make_hba_operational(struct ufs_hba *hba)=
=0D
 	ufshcd_writel(hba, upper_32_bits(hba->utmrdl_dma_addr),=0D
 			REG_UTP_TASK_REQ_LIST_BASE_H);=0D
 =0D
-	/*=0D
-	 * Make sure base address and interrupt setup are updated before=0D
-	 * enabling the run/stop registers below.=0D
-	 */=0D
-	wmb();=0D
-=0D
 	/*=0D
 	 * UCRDY, UTMRLDY and UTRLRDY bits must be 1=0D
 	 */=0D
=0D
-- =0D
2.44.0=0D
=0D


