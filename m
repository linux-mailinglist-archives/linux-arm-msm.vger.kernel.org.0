Return-Path: <linux-arm-msm+bounces-15770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A089258F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDABFB22154
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F050D8562E;
	Fri, 29 Mar 2024 20:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JpRCu9Zw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACB13D8AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745352; cv=none; b=d4ehk460zviMlbdDb5oYJADp0U23FSpMV7cGkKfpWL7n7rw37blZwjz9bUvj8OdsFDaA4lgYXyp9QnBakgL/1xObgfdeCsHaWHvyN3mtotMBf7zZx3Ht8gb4Orrf5Orbsubswbo2ULYh0YpexLIxzt63wI8V0oVEWvzWzVf/v3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745352; c=relaxed/simple;
	bh=JPm8JpiIg5DDpXdT/Hl8Z1KYHSXLOLaFeveBG2eb/HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mSs4MtA9l01fzmOOHm6QJ0RMdDVhDpP66NQcPEgTABS1itD3nlM65vkzBRnT+qQdg46b7518j87aAao65DrmirTHISO30/JixhjSvrSVADa0+YHBXqgTfEiWYcrh0MWxx7Q6zZQAKTM8u+6jSVzfPJsdh1c9Oi+3Kwu51RNAUfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JpRCu9Zw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711745350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHNJWGEhyWXwbIrUI9vWUKtE+BqvwNE/X15Guew4lg8=;
	b=JpRCu9Zw/2JD6OjEhm9o2iYvNTMJAydDcbNAwWyCml7eJwEQu0QBRIQuCpOwloUAQ81MVd
	1roV/CdsxlTfYJA+avuSWAmkcQdl0z2xehwivzte0sN//fqnR2Bl5U3tWOC0mvMqFx7mtu
	ce+oHgzoiD8dOJsxhf/879DHJcSWwtU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-FneAG82nPl6d5BECm3NoQA-1; Fri, 29 Mar 2024 16:49:08 -0400
X-MC-Unique: FneAG82nPl6d5BECm3NoQA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-698f302cec1so8127256d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 13:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711745344; x=1712350144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHNJWGEhyWXwbIrUI9vWUKtE+BqvwNE/X15Guew4lg8=;
        b=oSTEBh9G0Uh040rmF9LU4zTtc4xN0cYq/OujUkiJKynCnOp7mvwsdCBQWGMENRH2uS
         T0HltyvnvbFmPTObeKD8ATug4PFu5h7MmQoYHJRqi8senmc4XbhCw0rbPRXH/N9XDK53
         q+SpcjBC33QeUECdn2MD1UCcP+wPcGplUFVV9FD+wA9pntugoc/ytqfLhMBxUG1QjRhK
         mG05Lxb2gBujz9LMaAov51XnRlgbrwC4hK2esyhss/mvtuuldqa3I7Ea5NOlpq/pfeT7
         bsz5AmFuO+WFNe5Ex7aMfUcjRM53A2OG4gFTGBSjHF3fiXLo7brl7h8oWznRMRyXUZ28
         gP1w==
X-Forwarded-Encrypted: i=1; AJvYcCWoH4CRX0VXeDKZcDhly1w9I/OqpmhGoMX7EGUqO0Cy0Kr7NGdUrgGZ1gV8o969MU9C1wq4ya0bFUhNyQ3JTYTh6ZO49uGj9iqM+1uU0g==
X-Gm-Message-State: AOJu0YwI/v8/Dbn7PV0dLbebh5mtPF+45b1oJdQz8sGbIJx7OM0EIrY9
	zi8Fil7DrGDvQYYo1kYcqCRGJXux00Kv5kbrqjr1WvRcal/qGePE3/GPjeW3H08oRCq5bbSrAGn
	gh442262+IIn6YFIeeaeXya8qEzgiskA9u5nHGW/A2DQD2DQMQ5AGUvxR+CFKqtA=
X-Received: by 2002:a0c:f808:0:b0:696:78fd:560 with SMTP id r8-20020a0cf808000000b0069678fd0560mr2809357qvn.50.1711745343826;
        Fri, 29 Mar 2024 13:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGaO1tH4VVlNQZbk2JjonLDJ9CuVy6dpCa31G0F7BhjlUaz/qGRnFWhAFgA+WY2cPB4nTOgw==
X-Received: by 2002:a0c:f808:0:b0:696:78fd:560 with SMTP id r8-20020a0cf808000000b0069678fd0560mr2809335qvn.50.1711745343423;
        Fri, 29 Mar 2024 13:49:03 -0700 (PDT)
Received: from x1gen2nano.redhat.com ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id jz10-20020a0562140e6a00b00698f27c6460sm794271qvb.110.2024.03.29.13.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:49:03 -0700 (PDT)
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
Subject: [PATCH v5 05/11] scsi: ufs: qcom: Perform read back after writing
 CGC enable
Date: Fri, 29 Mar 2024 15:46:47 -0500
Message-ID: <20240329-ufs-reset-ensure-effect-before-delay-v5-5-181252004586@redhat.com>
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

Currently, the CGC enable bit is written and then an mb() is used to=0D
ensure that completes before continuing.=0D
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>=0D
Reviewed-by: Can Guo <quic_cang@quicinc.com>=0D
Fixes: 81c0fc51b7a7 ("ufs-qcom: add support for Qualcomm Technologies Inc p=
latforms")=0D
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>=0D
---=0D
 drivers/ufs/host/ufs-qcom.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c=0D
index 66a6c95f5d72..1439c1df0481 100644=0D
--- a/drivers/ufs/host/ufs-qcom.c=0D
+++ b/drivers/ufs/host/ufs-qcom.c=0D
@@ -406,7 +406,7 @@ static void ufs_qcom_enable_hw_clk_gating(struct ufs_hb=
a *hba)=0D
 		    REG_UFS_CFG2);=0D
 =0D
 	/* Ensure that HW clock gating is enabled before next operations */=0D
-	mb();=0D
+	ufshcd_readl(hba, REG_UFS_CFG2);=0D
 }=0D
 =0D
 static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,=0D
=0D
-- =0D
2.44.0=0D
=0D


