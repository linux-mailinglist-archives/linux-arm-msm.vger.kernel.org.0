Return-Path: <linux-arm-msm+bounces-62355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317EAE7C65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 108E03AA3FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1089F2DFA2F;
	Wed, 25 Jun 2025 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ga0dbPT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F229AB1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842886; cv=none; b=ofbEO9AUdFeJcQMhUbCPMmXVhAKiR1kBF7r3nyWamrJJbyTlJldW21le8FLXXfVms6x/lhfDLlHzI0EoSDr8ywylLEWeqCYNR/2BtEi0SWMLskBkUwZvagYGeVhHCdrjisNOj5iPB++GEKGq+lJk/E8IbDH4OMHcOzrjNClwlYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842886; c=relaxed/simple;
	bh=6jOwOjfHBLUytEzmwKQuMf9peA0A54DjyUpxSjnkgtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2VbWsi9/BFwh2PaohpAAMQ+bQnYeIg9J9Ry2dF9OXjc2YQTvj3rKA98RoDlz4dRJ/9Uc4v2pEFYN4T5wqhEGfvHZbFb9WJ233m0gRD7l3OVXRItJoGWVycpULg03b9flR3kbVYq3mbDQxCN0WMsFgSL7AlEbFP/556QEbqG2Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ga0dbPT6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0a420431bso350672866b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842882; x=1751447682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAc6RebJyqWkfWaiafshoyDeXJgwWVip4sEPQbkZWzY=;
        b=Ga0dbPT62LBudAjS5KAF3Dl+1ywJMm1T+/EgYrcfqWPrcdqR1Ray6LpynM/gIoIXzc
         hxhlZ/AALcxfOnn74LeXbsB72ONBB9/b24etS5nkIIUUOqqYS55N4LXaCZKTN1gNPlXX
         93kQ5EnIoJPP14Hh5Pvbyrd2rvSfbJayry5CunpfnCAVd8HdASMF3gYLByN4ZxEyDCeb
         6wcF16CIncHTqa70b8Z20OudTju+0J+gbZtgBIEi54DLAvgCzXZ2m3JLZiYzcOxurP/f
         hoarw8jhyKIOLwBjlphRm1v2Kkz8mgOmxFE65o3DASPpksY+3DjxPYaDFMEdR37Gt01l
         5LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842882; x=1751447682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAc6RebJyqWkfWaiafshoyDeXJgwWVip4sEPQbkZWzY=;
        b=aHSmLoLC1oqSOUytDM36sadukAmh8WEdAqKNeEQ3as8HXoqyuV9Njauwk+udhKcJsK
         3c2CIgpq38aVpEhi+Puc35sHEmborFAxhM71v7pTc+tlEsa7uO8YF5tMOu+K2cfkPXgu
         dmIZUkGeWipf/TKOQiF/DryJeUEXHk8yPGnbQZrwtiBbjAYv+BVhu9+WGjdoODoPf4P7
         nZGRWbhFQ+3xY1BkN8cg4ZIbr4Tvxwc3Bls7ENPCVFpFBAF1pc2lvb52Fa11AxFlRGfU
         hyIsjYlF8E3iMbHxeve6VcJEtVn6lStRfGxZotavGj/BpYBNzP8BlOWsIiEBvmLUA54F
         8w5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxFF2gM7HDSLIfLMIGvwBTH4rpbmKy9hwA3jCFN81UJpGHTCRhL6y7mivv5PC1A4/Rsl55iABErn3jaawB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7tMODh5b49gKzYlKqw5z98CNIukT9gSu9Ff4iHktT5o9TXgde
	BzgJ3Ueiot9CmHmoj1ictogMhyRBKhMQTsWPoiiI7cQaJZ8PUUQawURB6CtIkHKk3Ow=
X-Gm-Gg: ASbGnct26HFw7/Ski/RRdLtTC2opsYt7bz1HkWRohdjncKMyB/4GMkG06kaZfiJ+xIz
	V9RkANOiiKuJZS+TcEgiIMaRHwboA/bmXwRGt+/+vq7LqjcYyDrODnR4NVadx1tJfmlHITQ3T36
	LYlV+QPbUb4GpQ0PVlZsR86gQGwiAuyusJ8YtwqEPbKOWL1FVQ+alvbBGX1J3ka/Hpam12IYG+0
	WNEx/N2n9Dpf+p3B7jA/QyOchwotSM+9jRhzvB3CMEFN/JBBuSeLCXtS3YIpJqCbqEZI9hfZfom
	Q00ruGMWzy8N/rUJTWBzbHsyfNwk9U3rLxrFFbP04dLFEaCQVunOI+vYZ5FZXcP2nAtU6uJoxoh
	01URAYhky5iGi+RDI+tQdmAhiplmP8XXj
X-Google-Smtp-Source: AGHT+IG0l8SlxqzbJy5yTWk4X5Wj8Qtynwz8Lsq7ZGJOC1TtSj2YLID6Gs1lC0BpZmycf4LOOW/++Q==
X-Received: by 2002:a17:907:e2d0:b0:ad8:a41a:3cbf with SMTP id a640c23a62f3a-ae0becb6e06mr214652366b.13.1750842882078;
        Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:41 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:31 +0200
Subject: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write from
 init sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=984;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6jOwOjfHBLUytEzmwKQuMf9peA0A54DjyUpxSjnkgtk=;
 b=knC8BOEkeNO8OiE+NnKYB5/k14fP2simRn0FEiUH1MxKyG5zzAMDRqRJ4zNqyeyJsLSuAzNFP
 7cMvV9XCTULBI8qv+2u1CuI8W0OhIAvgqX7c6mnUvgVxb6/pH1mdEUa
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
'latest' HPG revision (as of November 2023).

[0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/phy-snps-eusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index b73a1d7e57b32cfdfbe314ab938ec54746ed53be..e232b8b4d29100b8fee9e913e2124788af09f2aa 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -437,6 +437,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
 				    USB2_SUSPEND_N_SEL, 0);
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, 0);
+
 	return 0;
 }
 

-- 
2.50.0


