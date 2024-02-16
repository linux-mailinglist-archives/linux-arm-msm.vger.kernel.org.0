Return-Path: <linux-arm-msm+bounces-11395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C09858437
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 18:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B42E61F210F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 17:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C7313329C;
	Fri, 16 Feb 2024 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KPrPgQZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494713473D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 17:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104925; cv=none; b=m/+AEajyja9S/kzKnl6tacCW33yHAeLin+ZLH9uqYyqXyvvXGg7HnsYUQQeT/2xtGfE2IO2mvXSjPHc1ZnCRnERKUGeLYIWxz3+BRqpGKZhxu0X8LmwNoF7D6P1i7MqQ5+JHUASeQ5BvQHl1Cyn7Kxz7T8rk8uPcq9BKn5VVm58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104925; c=relaxed/simple;
	bh=R1GLPwlYfMEGgtPbyaSg7QFWg/JNBX3HH10DnKKcCK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hku1IW8e0IDkBG5jDm13DI/fDp+PRbTrBXy+izTjECRCTUaYdObyu5Yk0dQUu1gKtbhF9FZ2rywRlQ3qy/L1ghb/Hi3Cw7NxSV/cOaS/DiRvuarPz/0QS96q4syYoIyu1sBsT4OVZ9EjpVSxuZLv6PsDNy76DBCbJDcvgmkUIIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KPrPgQZM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1db6e0996ceso18499385ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708104923; x=1708709723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWuu4IaCb+ecu+2X4FcUxgf2SPat8siMwG6Oun2YK2w=;
        b=KPrPgQZMwL1HCPXC7wBU5oYFvj++78+R55108VsQBi9jWS3x1PBHwgZBUJwMGjt/Xv
         WVjSaOp7tOYhLOP8O6I0ZLqJ4/Wu4fg/CkBFN8IyfO5ycTtacmT9czYIuhMMhjPKJVia
         4h95pCe9D530v3bQIKJ+XaL0xamOufrpXZUtpbssjW+t8I1RHatNGdiudZkqkMjtW9q6
         VfT7l2oCkFqsAJEa9U1KrPRxjlj+O9vPKqtcpRA58/2JEf5wlDoF0ry+Opw7fH6EmOin
         32bAYoR8TAcbdnquUDA6xZeNuJnknd9ZgmUAebdqOR29ir+Rdega9Q9mrcqdCcXQatGd
         QPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708104923; x=1708709723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWuu4IaCb+ecu+2X4FcUxgf2SPat8siMwG6Oun2YK2w=;
        b=Rz5mMfdNWkc/sHpy3g9kpu2E17dbpkFhGv+2XmkeRIdmJLTkBITPDtZk1Zcdl8x/1r
         Bt4HlAbpte+tdXt+ofezv0Ab0Dio+VkbgjVZvwZxNb80Rv+xOtF7OA3xHPwfLuea+D2Q
         Piv/fB6vJ1lk4I4KuMtKobHeDeIcRhfl2GE4Sa7Pt+gRn69mSJir2g3CknvMzRNjyf93
         rb3BcccSjXGEYchAk/4odaCE8Ne2TJqW7gmBJLwu/QYrwS3YWn/cmHMsonxvVy++siPO
         BIdF8TScanN742h9E1ATdDleqZjAr3lHcK0BIwu1PB0afOdWVk+PWjgXvIHYw67wdril
         1Fbw==
X-Forwarded-Encrypted: i=1; AJvYcCU3kiw2NkC4WAvFwvGGR36nbatAyIx00B1e1TMCUrzGFYTRgrXRWPl6rstU6bhxImIIeFcvUPbKRyiVOEM68KIGxtkC81v81XnsyjnXFA==
X-Gm-Message-State: AOJu0Yxk/qFIH9MrqmcoS7eVDBxMSMHvAm/9Cxykyo1D1J3xKq20a87M
	cgMQS7qL+2S6zDNr+7Y/63Bp9jZu6NT/LvkONTSfERtpWpd8g6MBeTBoUrl5PQ==
X-Google-Smtp-Source: AGHT+IGdCXZredO/BC7qQxhRij/KCAb3j/MIg4DPBT6lo3YCmbYRREkXZE3AZg1N6MirSxETbxerBw==
X-Received: by 2002:a17:902:ea12:b0:1db:ae5f:a38d with SMTP id s18-20020a170902ea1200b001dbae5fa38dmr2114924plg.5.1708104923231;
        Fri, 16 Feb 2024 09:35:23 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id v9-20020a170902b7c900b001db5241100fsm118592plz.183.2024.02.16.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:35:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Fri, 16 Feb 2024 23:04:44 +0530
Subject: [PATCH v2 5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-dw-hdma-v2-5-b42329003f43@linaro.org>
References: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
In-Reply-To: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=l9TZl5f3ruMfAhDvync60x+vuqThCg8E95q3H1HbSYw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlz5y+NwBcDBvMsgLY/9ArhUeU4RtpAOkSNOPA0
 cL+6HT1tTCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZc+cvgAKCRBVnxHm/pHO
 9YdiB/9TA+DKLXxIZYpi/4hnMyIkUsM2WJIWyQ6w7vRVyPe9xkvRVouAEDo3kakdlZprxiUhdRE
 RVaU7JFkgelmHQuyS7am0hGDZJpDmEmPrmuGigJlrygDliRLE85n5WP2vnnN7WKQuYN+W8HQnv0
 l0f9zuR0+G+HEp9D1og10j/2BOueS6fmgssxK8rtfpi2VW+6FgY0KiiqpsWdUq7od5/Ucw2nR1F
 NbjzPj1POiJNg12Bi3HrhcTLZjvb0KwfS/lV5Mj1NKvbtl2anyrbqaqqbejjAuqCSzx91cCovSW
 ddbe/L2NDfdpqcgHjOuBkoP+92IIH3SP4KN6C52nTmQjmNqV
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Mrinmay Sarkar <quic_msarkar@quicinc.com>

SA8775P SoC supports Hyper DMA (HDMA) DMA Engine present in the DWC IP. So,
let's enable it in the EPF driver so that the DMA Engine APIs can be used
for data transfer.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
[mani: reworded commit message]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 2c54d80107cf..570c1d1fb12e 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -137,6 +137,7 @@ static const struct pci_epf_mhi_ep_info sa8775p_info = {
 	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
 	.msi_count = 32,
 	.mru = 0x8000,
+	.flags = MHI_EPF_USE_DMA,
 };
 
 struct pci_epf_mhi {

-- 
2.25.1


