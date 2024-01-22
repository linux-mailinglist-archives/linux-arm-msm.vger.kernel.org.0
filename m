Return-Path: <linux-arm-msm+bounces-7841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDBA836EB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 19:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52F361C29203
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640A853E2E;
	Mon, 22 Jan 2024 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KivX6ADN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21653E16
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944277; cv=none; b=RiP0q5hZtUgQHIxLL7g4Gcg2asAi43rpGnAAgawEGp2Fq9r5nB0JCi3/ND/8J3Iq8o4+h3vsJbZ1F7FJf73TJUJL1M/k8GqCpMZu4vSJs8wfoWpIbr0X2hRrL8qRZJkcalMkPjbkXn3CQ4M8b8khMgkjfI26lUlJxAVFNidBcxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944277; c=relaxed/simple;
	bh=s5zG+L/VGA4r6opNYDq/X6r4u7Dz3JHhUiw1v8rHzzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZpm3sQxPjY6YhrFSdOXa1rtOU8bpv2QgYPZ69HEa2gQKeAC8Xh9bS9rGYhLRcJWCHZUeiBZmwc2WEz6oiski3VmZY0kgOf4fyFr+VASi+dpnq2NbBAVKWtXoNYp8rO72USplzNM90Oiatmv4sTTGwKv+iuPl/wSPYKjm+Bh/EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KivX6ADN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705944275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nbn1T5pI3z/UbfuUYU7cHvzOeNQR0JNnB8PBypvklZ8=;
	b=KivX6ADNIhY09GWVp6p/rIPXt3HB/0dprmGN1wVELq+p/ac59OI0MOLc4GOCL33VuM08js
	vxcy/NibpgP1AvvfMlvkS03zt6FfyLVP2qbRiJHBEH5G4+BB7Tx711SOgkrTm956HEdQ7r
	APYCpCyA83sj0rKG7d8x0CPQJwbElNo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-rjUxsNHlNM--AaxEB7fm-g-1; Mon, 22 Jan 2024 12:24:33 -0500
X-MC-Unique: rjUxsNHlNM--AaxEB7fm-g-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7835bb86ca6so578389385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944271; x=1706549071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nbn1T5pI3z/UbfuUYU7cHvzOeNQR0JNnB8PBypvklZ8=;
        b=OCOmlfFPFGwTbyWXHscnCgLcSiKx/uFerirOZKmRk9fVOv9aXS2Mb/bZGo0ZMG0U5j
         +HfJhAkr5e2ukGFGojeoi/tTOjA6WWwaRjy3slJUVtbY/4IgJYYobUMO7jdR83V8NNOq
         thEoNsa8u+7VQ1WEF7UniD54ZcNKi+bMoDTVf3yrFr+P3rv6nwmAmYNJ0HAe0nSPB08n
         WkLDut3skvbdyZE7+E50P8p8eDZHoIPVjL/YCZERcwwr/tkleDUwlkE4mZrqT13dyq9s
         FMKNhKib+KOt2X/QJa9Zv2kIGfaAk9kaHLiDppWwMEor2CfeGJ7SJuADcCY6K/F4lrPF
         xG7g==
X-Gm-Message-State: AOJu0YxrdtqRx6rOctiNOWfdT+yJzcL6NpNf+OB3BK6P7j9dBX1+B+Uu
	BDKYKqk2M3vM0nbAJx4d7X0uVuwU1FPjKFEZSCJ+vLA88JihlQPlt77s5NT3NUGLLz+NYLGVHzZ
	YfqgMTnf3+4QuUDAlYtVRHQiQWimoKX76Ab5tJ7dBXv6Kxwi4hRMhfKkrgNt7bIM=
X-Received: by 2002:a05:620a:4092:b0:783:a2ba:eebc with SMTP id f18-20020a05620a409200b00783a2baeebcmr1181207qko.24.1705944271366;
        Mon, 22 Jan 2024 09:24:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+cIRyR7E/BPa15GlhIFB+sJnWKn/RhvzQjmmC1gCPckHcfoCIOnQhcFc6TJFKCb9MtxlDLw==
X-Received: by 2002:a05:620a:4092:b0:783:a2ba:eebc with SMTP id f18-20020a05620a409200b00783a2baeebcmr1181193qko.24.1705944270958;
        Mon, 22 Jan 2024 09:24:30 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a200700b00781ae860c31sm2280992qka.70.2024.01.22.09.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:24:30 -0800 (PST)
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
Subject: [PATCH RFC v4 06/11] scsi: ufs: cdns-pltfrm: Perform read back
 after writing HCLKDIV
Date: Mon, 22 Jan 2024 11:24:02 -0600
Message-ID: <20240122-ufs-reset-ensure-effect-before-delay-v4-6-90a54c832508@redhat.com>
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
2.43.0=0D
=0D


