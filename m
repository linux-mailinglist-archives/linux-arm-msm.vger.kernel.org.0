Return-Path: <linux-arm-msm+bounces-7844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C558836ECC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 19:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27E0C1C29F3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C572755795;
	Mon, 22 Jan 2024 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gge7vfzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAD62805
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944329; cv=none; b=atW3qTJqdXG1+Q+2octlqPiJy8k5bHrQmngaoAqk0qsf7oZwih4/hz4fds4BlPsoJRN3oXNzN7E9Xn5iAIvaFg35L0Ysa50WX1OO1hHZMwcAX/zXrYRg5OFqasEBkiRgAeD8LnN+BBxQo6vQ/egm4D5a2Pw9tX+82mTfl4Vy5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944329; c=relaxed/simple;
	bh=eqU9bnJJL8L6334KQv0i2/sTryAarZX2XDro3a1bVTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AwLVCP1In7KlvfNojuEYxQMCry+36gr6FV9lQyNFakFxIq12D/XAMPHbpTQnTY9/CoqC8a2NcbudYkngwx5iqMIH5cfCRCBScnAYWBaVGMEV5ihD62BbLdtoR4THKPvCtmytNO+bc2mUbFVE1rJISk2AzH6oj6w//zVGydBanxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gge7vfzL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705944322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9E8LP/sXchUxMDynkpMldI5w3cNLtCQjxmXDj4qu+Y=;
	b=Gge7vfzL3SSLRivQ5AC/2CY9lotMpeYwtJTIkd3Q+4MgUzxj2OaTRN2LDUL1X2LIbXI4/J
	ojxvgmIlKKDWtPET5OCX6US9AhUK8RnYMbpGCpXT/EAjlrVi9wBFMnyItGzw+fDdE5q24g
	HTrRU8gVyeLos7xsU3KhTPEWlEKGQxo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-KEIA1clmM8qC2GA1HPF4Iw-1; Mon, 22 Jan 2024 12:25:21 -0500
X-MC-Unique: KEIA1clmM8qC2GA1HPF4Iw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-429841cf378so59687911cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944319; x=1706549119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9E8LP/sXchUxMDynkpMldI5w3cNLtCQjxmXDj4qu+Y=;
        b=DA3hVjFXhmttEzOEYOgksk6nWMwAewllI7+GJuKKxR6aowBTgds2pn0HSE+juk3NFS
         hdI0rVHR4IoIE32T+ZyN3RBpVdS646k0DoNxiKtK1jV/aIarKnXoCqLf01t3OoSGqNBZ
         dCN9N7M0+ydDW/qLBdobZlJD1BaMStH2l0U26fxvbQFo27SF7zhJ+Tzy5P8U6m+MXiLh
         SCIpeseY2YYwhCNpJbHJkL5DJr9ASmGYStHKXHR0Qwqc9n+4gQ1aVC1c9tvZsgMLNm6C
         m++D5resmueDW0cQkyZOf2HIQWiUV78qpU9++srBa/GKj8pf9wAGP/zO0E4Yiy4rSbNT
         /AQg==
X-Gm-Message-State: AOJu0YxOlziGDTSIz1z8mhfmOL2mnKIoNktJoHbHP2wtJrH2ohDZdfwy
	L16CtHASspLhJxA7+9MPMpoH/+kbhYYaXHrKCN3BHmMVxFWmxQ0kdzvc30iVDJdg7Dhs12NXe+u
	EzsRrgawEUsc4XC9odoHw78N5tfQQNrnrLSq9YJFHoPYKBumVSwPEd4SsvPBz4PE=
X-Received: by 2002:ac8:5c06:0:b0:42a:2be8:37f8 with SMTP id i6-20020ac85c06000000b0042a2be837f8mr7667927qti.46.1705944319780;
        Mon, 22 Jan 2024 09:25:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw9tYpVM1Vb6nwYLykf7yZWc23Mfc1dOE48wD53sQO6xtnskKBD0ZYOxmi4yAMEBoT5Y13vg==
X-Received: by 2002:ac8:5c06:0:b0:42a:2be8:37f8 with SMTP id i6-20020ac85c06000000b0042a2be837f8mr7667911qti.46.1705944319483;
        Mon, 22 Jan 2024 09:25:19 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a200700b00781ae860c31sm2280992qka.70.2024.01.22.09.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:25:17 -0800 (PST)
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
Subject: [PATCH RFC v4 09/11] scsi: ufs: core: Perform read back after
 disabling UIC_COMMAND_COMPL
Date: Mon, 22 Jan 2024 11:24:05 -0600
Message-ID: <20240122-ufs-reset-ensure-effect-before-delay-v4-9-90a54c832508@redhat.com>
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

Currently, the UIC_COMMAND_COMPL interrupt is disabled and a wmb() is=0D
used to complete the register write before any following writes.=0D
=0D
wmb() ensures the writes complete in that order, but completion doesn't=0D
mean that it isn't stored in a buffer somewhere. The recommendation for=0D
ensuring this bit has taken effect on the device is to perform a read=0D
back to force it to make it all the way to the device. This is=0D
documented in device-io.rst and a talk by Will Deacon on this can=0D
be seen over here:=0D
=0D
    https://youtu.be/i6DayghhA8Q?si=3DMiyxB5cKJXSaoc01&t=3D1678=0D
=0D
Let's do that to ensure the bit hits the device. Because the wmb()'s=0D
purpose wasn't to add extra ordering (on top of the ordering guaranteed=0D
by writel()/readl()), it can safely be removed.=0D
=0D
Fixes: d75f7fe495cf ("scsi: ufs: reduce the interrupts for power mode chang=
e requests")=0D
Reviewed-by: Bart Van Assche <bvanassche@acm.org>=0D
Reviewed-by: Can Guo <quic_cang@quicinc.com>=0D
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/core/ufshcd.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c=0D
index 9b6355555897..9bf490bb8eed 100644=0D
--- a/drivers/ufs/core/ufshcd.c=0D
+++ b/drivers/ufs/core/ufshcd.c=0D
@@ -4240,7 +4240,7 @@ static int ufshcd_uic_pwr_ctrl(struct ufs_hba *hba, s=
truct uic_command *cmd)=0D
 		 * Make sure UIC command completion interrupt is disabled before=0D
 		 * issuing UIC command.=0D
 		 */=0D
-		wmb();=0D
+		ufshcd_readl(hba, REG_INTERRUPT_ENABLE);=0D
 		reenable_intr =3D true;=0D
 	}=0D
 	spin_unlock_irqrestore(hba->host->host_lock, flags);=0D
=0D
-- =0D
2.43.0=0D
=0D


