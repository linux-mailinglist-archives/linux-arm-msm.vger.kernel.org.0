Return-Path: <linux-arm-msm+bounces-27051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E07793C716
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 18:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAECD1F21ABB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 16:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B070019D880;
	Thu, 25 Jul 2024 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L/o6qNOJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CC19D881
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721924624; cv=none; b=LBuKuPh6j597p+3O0l8I9uuQyKcGmRnOedWij6FKFDVevHEcuiEpzcyWxT3kToAV4OTLVLZWQVlImnrnJU+uibnbRUiSy8+jYFG2uKXh9hoHtEGrtNm23gkqssE8pRPB4uY1wXk5F7sH+rNDarKymwO1ueJMQDvCANjNj3NgJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721924624; c=relaxed/simple;
	bh=T/iei1fLWFKCwQfyecVBve0/6jQidK2SxYc6s1hBgsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aejY3IlMJGuUMbJqx5r/tossgrmeDFtS+A60ZcSAV1evMSQylpIa5M+CedCgzdirTzFVrJpPiSavOlR91BOJByagcLqH0395VNwefXTfF8z8VkITmrBDN87DrpIugSYAc2Jsp4J2wWY4+eld8tqX0gH6sEFbuCFLqyCR2rlw1fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L/o6qNOJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721924622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WOgno3QLXqECy5CZ8dvgXUOz8bAr9uDr07ugzGWm+iE=;
	b=L/o6qNOJ+vwGXR2jN6A2XoO0tJR8qwD2qYrZbD+ByIH6E0zc6vU58zTl+NkP38N76vuCxY
	X3zG4znADNfPqAPCZZmgyCDxI2RvVjdJDMYQuIdCoh3cs155ZjEG3+ht1esHUbyF7IFDxm
	QLAXHTm/KqSw2gclLl8YOUOgAxhfpps=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-cJOwwQtrO0KdxtrhIuH6CA-1; Thu, 25 Jul 2024 12:23:40 -0400
X-MC-Unique: cJOwwQtrO0KdxtrhIuH6CA-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7044952eed4so69430a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 09:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721924620; x=1722529420;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOgno3QLXqECy5CZ8dvgXUOz8bAr9uDr07ugzGWm+iE=;
        b=q9bGFTx5afhFiXjIztrP0aOMzBapU77ETNE2Hf1dOkXRNxaR8ywZW00WhQEYl/zCwU
         EStrkjvhMV1dPvPWtThSbBkgOdZdUcrCLKTGHQRFm7bDcIu5zO8hC0KpXZwH0FCTXESP
         vuTsSjua+VenERUQ/WSTrOlu3JNmzy0gW9M4mj2NKyxxlajnz/TyNnt8TVCgwVLDhN14
         Hg53JHT4dIq9ZU/ALvBTSqNwkrrYavbCaDzwfu5EKkV9fmrBbFJ5ZJKjqYQIl+iPy96M
         GQD6cV2gbUNL0HoWPBwTVcym7DEz4En2QtXZ2dlxu938vZKFNizkUrGpR8n2Fbs3fFGe
         2SeQ==
X-Gm-Message-State: AOJu0Yxy2igKpnDtwfmW4CfDbQyJirolbAKfv1lmDrloprapTfk8yCK6
	SLrGZUgADMPDAx5M3eZN3gIjaCNfDb3n8yt6VKpY4D/8/ip/rZ5uCdYtVh13h3Zilh6uSAnYG1L
	TTXk/3is3yzsmhk4etaz+cgkg5j1ex0ij7NVmpjiEEQFmplM/AoHdLzWiBkwphfk=
X-Received: by 2002:a05:6830:8d0:b0:708:455a:8f03 with SMTP id 46e09a7af769-7092e77d0b1mr4488405a34.34.1721924619649;
        Thu, 25 Jul 2024 09:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjoYC3zV3f9VhoQie8yDEAnXZIV5fmibvknLA8FJUvK07rxviXgQpTiP//Z8qcYPdxbZyt2w==
X-Received: by 2002:a05:6830:8d0:b0:708:455a:8f03 with SMTP id 46e09a7af769-7092e77d0b1mr4488375a34.34.1721924619283;
        Thu, 25 Jul 2024 09:23:39 -0700 (PDT)
Received: from [192.168.1.111] ([2600:1700:1ff0:d0e0::d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d7446a67sm98240085a.103.2024.07.25.09.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 09:23:38 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 25 Jul 2024 11:23:33 -0500
Subject: [PATCH] soc: qcom: pd-mapper: Depend on ARCH_QCOM || COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-pd-mapper-config-v1-1-f26e513608c6@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAR8omYC/x3MTQqAIBBA4avErBtQU6yuEi36GWsWqShEEN49a
 fkt3nshU2LKMDYvJLo5c/AVsm1gOxd/EPJeDUooLawyGHe8lhgp4Ra84wOlHswqjXC266FmMZH
 j519OcykfuuRCT2IAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Chris Lew <quic_clew@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>
X-Mailer: b4 0.13.0

The pd-mapper driver doesn't make sense on non Qualcomm systems. Let's
follow suit with the rest of the Qualcomm SoC Kconfigs and depend on
ARCH_QCOM || COMPILE_TEST to avoid asking users about a config they will
not use.

Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
I *think* this makes sense, but please let me know if you think I'm
wrong. I was dealing with sorting out new configs for fedora and noticed
this was being asked for x86, etc, which didn't seem right to me.
---
 drivers/soc/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 7f02f05259331..74b9121240f89 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -77,7 +77,7 @@ config QCOM_PD_MAPPER
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_MSG
 	select AUXILIARY_BUS
-	depends on NET && QRTR
+	depends on NET && QRTR && (ARCH_QCOM || COMPILE_TEST)
 	default QCOM_RPROC_COMMON
 	help
 	  The Protection Domain Mapper maps registered services to the domains

---
base-commit: 2347b4c79f5e6cd3f4996e80c2d3c15f53006bf5
change-id: 20240725-pd-mapper-config-1495b150f738

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>


