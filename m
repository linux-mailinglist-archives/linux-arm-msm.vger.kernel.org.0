Return-Path: <linux-arm-msm+bounces-5809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B8481BEE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 20:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 047CB1C23588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B6A76DD8;
	Thu, 21 Dec 2023 19:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RCA9+ixB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE876DC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703185860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFXXGAQMvAtKWxVkRcpFMTchD2fzgAOU8dNzT5bz2Wo=;
	b=RCA9+ixBk4GAmYwp/C31/P8Y+uuR8wYYD4jfDuVJxffWABaathUS3mya/RlizFHplmPUm6
	Dna6oDbmXjBfS7MOLkFTB7r5U7K+wZNH7CfrxWzrrN/b2QqivL1Xm0lkFpE8ttiKEKVgOu
	DkOes7jOdjl3/o1zRBKTHn822r/S+1s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-0wkBOFpENo6ej45xUdKp_g-1; Thu, 21 Dec 2023 14:10:59 -0500
X-MC-Unique: 0wkBOFpENo6ej45xUdKp_g-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7812afaaed7so1082685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 11:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185855; x=1703790655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFXXGAQMvAtKWxVkRcpFMTchD2fzgAOU8dNzT5bz2Wo=;
        b=b0X64rbrYbtiTbWiclLziOSvw2jJuUNgTQc01Lk72XkEXGH3wF7IjD3BmYw7qHT3OH
         2nPAzsRsfi0WR2+9b3vkj73ejb0njurEQDMmmuGsSgCAC/xxT1Pb7BpAhfot/54LPnIC
         fNybP+843GkBZ8JwsOlT34yR/d6jQ8MrGAxl+F7x76t+gsbjj6tH6AeJhXKtNloxmAAi
         QM9WV0noGT4qh9ubY30NAyEChmya7fHqZT5FIwcA7UZPs0IWWnD0pmgjTysYY3oKAjqF
         coeFHicU8Oih5u7jC/QlIBrisxf4yenDdzJnZ9GDpJluhJYR1ls3D4U/6ucmKSahWA5h
         v7kw==
X-Gm-Message-State: AOJu0YyQy+6/V3HVreUl933wzgBx9UkO5thnhmGxFgk1AnC5I2npuMiW
	qUfVQ1JgO432hr5KSa922P6bwAli+eDluyuIz4VOxuicmfuFrEfdi3GjB4aPE0YtywEka8XFPDy
	eEYMl1RDOfLBGGb2uQW2RbSn1YIlzhAnipA==
X-Received: by 2002:a37:c40c:0:b0:781:1c42:5d90 with SMTP id d12-20020a37c40c000000b007811c425d90mr241283qki.132.1703185854950;
        Thu, 21 Dec 2023 11:10:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH41P8+ouBveiK5K1CSO/CoPmnxClgg8ifdygVCzqdRtytdGED2eAZr0tztRiLQw8uOEhQXcA==
X-Received: by 2002:a37:c40c:0:b0:781:1c42:5d90 with SMTP id d12-20020a37c40c000000b007811c425d90mr241267qki.132.1703185854718;
        Thu, 21 Dec 2023 11:10:54 -0800 (PST)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id 25-20020a05620a04d900b0077f0a4bd3c6sm846370qks.77.2023.12.21.11.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 11:10:52 -0800 (PST)
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
Subject: [PATCH RFC v3 06/11] scsi: ufs: cdns-pltfrm: Perform read back after writing HCLKDIV
Date: Thu, 21 Dec 2023 13:09:52 -0600
Message-ID: <20231221-ufs-reset-ensure-effect-before-delay-v3-6-2195a1b66d2e@redhat.com>
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

Currently, HCLKDIV is written to and then completed with an mb().

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

Fixes: d90996dae8e4 ("scsi: ufs: Add UFS platform driver for Cadence UFS")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/host/cdns-pltfrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/cdns-pltfrm.c b/drivers/ufs/host/cdns-pltfrm.c
index bb30267da471..66811d8d1929 100644
--- a/drivers/ufs/host/cdns-pltfrm.c
+++ b/drivers/ufs/host/cdns-pltfrm.c
@@ -136,7 +136,7 @@ static int cdns_ufs_set_hclkdiv(struct ufs_hba *hba)
 	 * Make sure the register was updated,
 	 * UniPro layer will not work with an incorrect value.
 	 */
-	mb();
+	ufshcd_readl(hba, CDNS_UFS_REG_HCLKDIV);
 
 	return 0;
 }

-- 
2.43.0


