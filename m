Return-Path: <linux-arm-msm+bounces-5811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D6181BEEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 20:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430142864CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161EA77F17;
	Thu, 21 Dec 2023 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0/chAXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB31077F09
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703185869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4md7/lhuz61o/OLaxynlTwcjr95vaOPE75vAR/46vcY=;
	b=g0/chAXkkSSpJjX3/SdrU4TNpFDQtyPvZ4iTutEkn6zzUpRNJNgl0ow0MKAoHzoq0oi5y9
	lgcisK3IjDOMo+VL6sWv0FzQdpWXOI3HLewP/ulo1F8is6ZXAdknRm7gXON6pwPKPeajit
	/0Hc+O9DqGMhu+i1olxb1fkkRKu59yk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-U-DnkWnaPpWmUQqPRfm6Hg-1; Thu, 21 Dec 2023 14:11:08 -0500
X-MC-Unique: U-DnkWnaPpWmUQqPRfm6Hg-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7811e34e9d4so89986085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 11:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185865; x=1703790665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4md7/lhuz61o/OLaxynlTwcjr95vaOPE75vAR/46vcY=;
        b=gUCtcEPs0CZXqXrg71Q0TbmLvhRx7BjU89P14DhzWX55mza6DvDyhtaL4zMbUhPEbB
         GzevyrGKs4U8o6e0FWbl7gHidINC6UXI9jlq9/on5WId6a/6jsNocRBYXSiCodNjWmzw
         J6MHQ5Dx2YFlXHGwW9AV4N9BS8f/bW51ozReVIzPF+74AbOu4q2pB6Ulap+QoBAYlvwA
         u3lhVJuGyAMUQgEuP/XE4MS58fU+WeC/efytKjXfe0L+LMmyGG4McfqGEwcoKg6j8Xp+
         /9aTEKOxjR6W+4amNNDHpS97HxeYZj71tpySxE0G0TKLU1hwikStb97BvDQz+yD5UgU6
         dd1w==
X-Gm-Message-State: AOJu0Ywg0S/xMQQmBTwCxxE5f6gqCHCZZxNryJtg7+SmvI5QxdUIKoui
	eMd6cltJnrH1HHkGCxOgRquf0o49kv4lUryTFOpXVxyaAAQE3G44IPB6TGUmwSalGSh1vnIdHyZ
	Nl8D6nxufauwWhAPWP7xTfjmizAcEHMG1gw==
X-Received: by 2002:a05:620a:5632:b0:77f:983d:9627 with SMTP id vv18-20020a05620a563200b0077f983d9627mr329700qkn.23.1703185864731;
        Thu, 21 Dec 2023 11:11:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/K49x9prGlGjnmr9HhZOKjCQCFmB8Y6MsD0syYqTALaQ0fnr3fNWCWPBeNe6I2HaLNE6Ynw==
X-Received: by 2002:a05:620a:5632:b0:77f:983d:9627 with SMTP id vv18-20020a05620a563200b0077f983d9627mr329687qkn.23.1703185864363;
        Thu, 21 Dec 2023 11:11:04 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id 25-20020a05620a04d900b0077f0a4bd3c6sm846370qks.77.2023.12.21.11.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 11:11:01 -0800 (PST)
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
Subject: [PATCH RFC v3 08/11] scsi: ufs: core: Perform read back after disabling interrupts
Date: Thu, 21 Dec 2023 13:09:54 -0600
Message-ID: <20231221-ufs-reset-ensure-effect-before-delay-v3-8-2195a1b66d2e@redhat.com>
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

Currently, interrupts are cleared and disabled prior to registering the
interrupt. An mb() is used to complete the clear/disable writes before
the interrupt is registered.

mb() ensure that the write completes, but completion doesn't mean that
it isn't stored in a buffer somewhere. The recommendation for
ensuring these bits have taken effect on the device is to perform a read
back to force it to make it all the way to the device. This is
documented in device-io.rst and a talk by Will Deacon on this can
be seen over here:

    https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678

Let's do that to ensure these bits hit the device. Because the mb()'s
purpose wasn't to add extra ordering (on top of the ordering guaranteed
by writel()/readl()), it can safely be removed.

Fixes: 199ef13cac7d ("scsi: ufs: avoid spurious UFS host controller interrupts")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/core/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7bfb556e5b8e..bb603769b029 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10568,7 +10568,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	 * Make sure that UFS interrupts are disabled and any pending interrupt
 	 * status is cleared before registering UFS interrupt handler.
 	 */
-	mb();
+	ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
 
 	/* IRQ registration */
 	err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);

-- 
2.43.0


