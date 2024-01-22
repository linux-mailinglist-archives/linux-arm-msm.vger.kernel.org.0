Return-Path: <linux-arm-msm+bounces-7842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE229836EC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 19:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B511C29813
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900E9612E7;
	Mon, 22 Jan 2024 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EqlVXzgg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21324612CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944284; cv=none; b=W2I2Hlbdq+Zcc/icKFTRN8pF9B8OqlNdxzsFKS/mNR2vWSZ6Fgw9mhzdiK8io1BqiJvjLinsA0GpZAZEgHr6/o1JesVuKEJrdHYwNEspg/eeuEnyxwr3xo5V8HmuIcx/OYNjCXemJbMwOHrkFd4D9SE9RC0bC8PkSfcaf/Q5ETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944284; c=relaxed/simple;
	bh=zKxNl6WkG8B4Eq9wfZgbuUODUlpOt/Exm0CtlwBwjts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBvye//Ij11BE/OksXWafbs/XgKzDnDcYYKtckpXmRtzROIPGqslwWOKr5rbPfbFqz0grd8Yx4NHYWFsMccuczFn+C/H23Mfds+4pHozolw5AcFzq8sC+mKzQOpXOztfsQ+MUerWPLm9fUtP40Ea46xp3EeZ3NGad6cOifciHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EqlVXzgg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705944282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3rKjJ1dBHRScMpZN00CyaIUSPfncYm2oVF6llIbVjU=;
	b=EqlVXzggzmFFZmB0TS0wfEDMfCfHIBNjZa6vQ/9ok++DHIxe3zbumbyALfsmdCy8d/fqYE
	fWa/IewbeM+ON5wqOF3h2lNzT2rQEYlokIPUdl3/aCnARMm+gx+/iyJdesPnHcjHGub5Yq
	IdJiPKqYHKaqwVd2hOzwNbA4JAV/et8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-ZUMP9PvjNFKg7bGUMV7dYg-1; Mon, 22 Jan 2024 12:24:40 -0500
X-MC-Unique: ZUMP9PvjNFKg7bGUMV7dYg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-429ad534cd8so52998061cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944279; x=1706549079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3rKjJ1dBHRScMpZN00CyaIUSPfncYm2oVF6llIbVjU=;
        b=mUF/UBiq+mbr2qV5b3pJ1kAeoT7wxvybm4JXFWl6ynixkR+8IvVlUlhD9odjVevdwV
         +FF9/mQHKHa0iTJLwQZnxHRVNZL+XR0zz4gol4zJ6M2i6+ZV1rsUFeQk/O5yt/7xqMhP
         hZUMOnuGcL8Ccbhp67uO8DdOcHvn5Qhti72JlNop6khwvt4Z1v4q7WGOstgIZnqDUONn
         gLy/6OJttHpHFzm39BLV2/TFmkBMKdnqHvUaSmkZv/8YVr1ESBI+gU/CmlLVqyVN6guj
         oltuLy0LPNNHRKkrtuN20woABXiifoTK9ynVmM2C3aS5/sk63T/KuDQtgcpfdXrFtIXf
         1AoA==
X-Gm-Message-State: AOJu0YzylkVCdAIsCvnz4MuLC4ZXc2G+CAaWNNYVpNtzhB+2BR/RzNE2
	ymLQ2EL7yPl+lT0twtERT2hp6oW90dYhzg9gUztcYZjEWxbg02jHr8KEZSgofKGfwtM9eblNroR
	nJRND2GVAzxokuAhSqg9JS4Qz6ZNhUBPThVB586IviBRVFdpZw0HFpxPdG7e6gdQ=
X-Received: by 2002:a05:622a:1347:b0:42a:48e6:3d1d with SMTP id w7-20020a05622a134700b0042a48e63d1dmr681134qtk.8.1705944279385;
        Mon, 22 Jan 2024 09:24:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuY55kVsfL50Q7J3H8/c0F80dF+lr4iA1MexthqCvJRSr5PWyDSdjwYzVA9BBQ9jMpLW4EtA==
X-Received: by 2002:a05:622a:1347:b0:42a:48e6:3d1d with SMTP id w7-20020a05622a134700b0042a48e63d1dmr681119qtk.8.1705944279021;
        Mon, 22 Jan 2024 09:24:39 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a200700b00781ae860c31sm2280992qka.70.2024.01.22.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:24:38 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH RFC v4 07/11] scsi: ufs: core: Perform read back after
 writing UTP_TASK_REQ_LIST_BASE_H
Date: Mon, 22 Jan 2024 11:24:03 -0600
Message-ID: <20240122-ufs-reset-ensure-effect-before-delay-v4-7-90a54c832508@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-ufs-reset-ensure-effect-before-delay-v4-0-90a54c832508@redhat.com>
References: <20240122-ufs-reset-ensure-effect-before-delay-v4-0-90a54c832508@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: quoted-printable

Currently, the UTP_TASK_REQ_LIST_BASE_L/UTP_TASK_REQ_LIST_BASE_H regs=0D
are written to and then completed with an mb().=0D
=0D
mb() ensure that the write completes, but completion doesn't mean that=0D
it isn't stored in a buffer somewhere. The recommendation for=0D
ensuring these bits have taken effect on the device is to perform a read=0D
back to force it to make it all the way to the device. This is=0D
documented in device-io.rst and a talk by Will Deacon on this can=0D
be seen over here:=0D
=0D
    https://youtu.be/i6DayghhA8Q?si=3DMiyxB5cKJXSaoc01&t=3D1678=0D
=0D
Let's do that to ensure the bits hit the device. Because the mb()'s=0D
purpose wasn't to add extra ordering (on top of the ordering guaranteed=0D
by writel()/readl()), it can safely be removed.=0D
=0D
Fixes: 88441a8d355d ("scsi: ufs: core: Add hibernation callbacks")=0D
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>=0D
Reviewed-by: Bart Van Assche <bvanassche@acm.org>=0D
Reviewed-by: Can Guo <quic_cang@quicinc.com>=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/core/ufshcd.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c=0D
index 029d017fc1b6..e2e6002fe46a 100644=0D
--- a/drivers/ufs/core/ufshcd.c=0D
+++ b/drivers/ufs/core/ufshcd.c=0D
@@ -10347,7 +10347,7 @@ int ufshcd_system_restore(struct device *dev)=0D
 	 * are updated with the latest queue addresses. Only after=0D
 	 * updating these addresses, we can queue the new commands.=0D
 	 */=0D
-	mb();=0D
+	ufshcd_readl(hba, REG_UTP_TASK_REQ_LIST_BASE_H);=0D
 =0D
 	/* Resuming from hibernate, assume that link was OFF */=0D
 	ufshcd_set_link_off(hba);=0D
=0D
-- =0D
2.43.0=0D
=0D


