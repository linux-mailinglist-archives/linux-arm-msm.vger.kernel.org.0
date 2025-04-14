Return-Path: <linux-arm-msm+bounces-54238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B0A880D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83BD41897ADF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50A52641C6;
	Mon, 14 Apr 2025 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4iKMGDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E62628C5D0;
	Mon, 14 Apr 2025 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635056; cv=none; b=AOLmPAa5ig/FC8Oda8RbDMwjkDM4hBAOjpW+JJ6jWQ5g7A146ymd1de4fT+LX1ybP/tMgGCAlK6E4pOXbuqvyPYI8IwO0N2cnKNt6wIn4Auq9UBkPae2KZ2BMBiZyK5Q+nvSkLJRzeYaW7ASXnty559AkVdEbdHRWAIyx11P5lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635056; c=relaxed/simple;
	bh=Hpq+te+xNFipgkBy5D5ZP51slg/EoG50lDrgIgS837c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XDaizmoRuQYOALYPf6D/R+myQM8KmjUIFq6k1dLFRj6qjJy71sXzy2QFrhPQImo2izkigEksccMc6pTcER6gYJeeFyirJ2QiNZUz3rVkjs/RhOgdvdeoOODBfsfVQA1Dccd+1NN5WabjfijPfW5A2yBv0kipSWUxOa2WtZ3yMP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4iKMGDS; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8fa2d467fso5233946d6.2;
        Mon, 14 Apr 2025 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744635053; x=1745239853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eEfnKTk32WTy+QJQiI3RNUOZJ9r7Y8K/vt3pS3W0F4=;
        b=N4iKMGDSJl7jUyPrwrnGETveRv6rRY83IYvz6Z9UlisidrQR64DLoinYDbSOeYx2Kl
         6qZps8arwt3VvLwd0R32cm6/InfmhlxB304r8SBJJXNjSaDnA+4nBBRgjqdmgK04Mqmm
         CNbMUBaPzXwl9dAhBRlI+uDN+RkX7xwotMEYvRxE6zBzkR/Cwx+wta/kExLvQHRTwvgG
         1wfcbpiihnEhdbFjuo6Ug/v4jScigBMg5BjmARJwHuHpUHzObtIpqpT0vKxQxeE2Km/H
         Lg/Pg/4maj4k1gPK3ZoJqLEN8AHirh5HMf7u+667inmU885Ou9QCY2Y/RCJtHMGotxJk
         OkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744635053; x=1745239853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eEfnKTk32WTy+QJQiI3RNUOZJ9r7Y8K/vt3pS3W0F4=;
        b=vgdkY+P3Min2AcBWiOx21AHjvQdZK9IlUavRc+e4ujpesE6Nlu7v3ZggkUhSrlgEiK
         wrUPkqO8ToOVA2I5iHXY3JYCkVU/y8QjtpLZKoXnuK6rSW/FsJj/FxMC5vJLzgh8ixGH
         AwwdrIum5Vhd4RRaD07sJDwj1byLd0dogAlWsEdC/GCzCmEhTo24q8LH4VHrNLqMFMOn
         IW/kcCmFfwb12To0lWiVcQ3/zwleBRBAzJL+wKiOJP8FKuJZpsjEUvKr+RUtgShOB3aA
         B5fLTe3dR3kvxTf1lZ846pw5wAYPvrR5m+BZRxriHuozcEEJPsz3kTrG48cXojWoYILX
         6vEw==
X-Forwarded-Encrypted: i=1; AJvYcCWknzdhrp9vM6kVtc30vyjFxCotwNCMjFyBwCihX0U144rzDE+I6pNSlL0Xncyi/StPkj/sCtV4pqnGSF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+1DpdJBiqJrUS7Zh3zcd5iiB49eRe9HBmO4/fPdL8RMWq/e/F
	FfBxR2ugXYjV/HczHrOqmnZbGR9d5rjOPfrXTCwbnFTCToLapvsjxtGJ
X-Gm-Gg: ASbGncv0QQj8IVGWObqjiZ85Jl9uS60wbvdKpxb0WDqAs4OgI4mhHZx4XtpFkwar9ti
	RYorroWRGbZ84AoGHWXumCcff9ciI7tKQUINj6mLA90/kaYE0ontkVps0A22m4Si1MadDWNEJgf
	ZG5LNxPz4+IhTWgxE3qviIVAg3zUcmxv7mR+gZHc0715CdKD2FLVgA9ieyayCT+1Bk5QIGE0s7r
	by5reQpILfcP4CEe9jF7sYv33rQ1i29z/biOFVwxh7SbMGo0Hkn1zT5s7vlOQiCDmsxPp8b8pgZ
	VEEVjw/mxr8D/tvvUnKiAXatMZzv6tvZEWvGiQ==
X-Google-Smtp-Source: AGHT+IFy7jmaqrgWyM7zIgpGp8coRUKQmwsw8NBxtyEF0Upi2ZIyVIy+TlgWPeYcRMzsZqNmhWaMMQ==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6f283adc8e5mr75255676d6.1.1744635052906;
        Mon, 14 Apr 2025 05:50:52 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0ed5bsm729732885a.105.2025.04.14.05.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:50:52 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	lumag@kernel.org,
	quic_kriskura@quicinc.com,
	manivannan.sadhasivam@linaro.org,
	konrad.dybcio@oss.qualcomm.com,
	quic_varada@quicinc.com,
	quic_kbajaj@quicinc.com,
	johan+linaro@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Date: Mon, 14 Apr 2025 07:50:50 -0500
Message-Id: <20250414125050.2118619-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qmp_usb_iomap() helper function currently returns the raw result of
devm_ioremap() for non-exclusive mappings. Since devm_ioremap() may return
a NULL pointer and the caller only checks error pointers with IS_ERR(),
NULL could bypass the check and lead to an invalid dereference.

Fix the issue by checking if devm_ioremap() returns NULL. When it does,
qmp_usb_iomap() now returns an error pointer via IOMEM_ERR_PTR(-ENOMEM),
ensuring safe and consistent error handling.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: a5d6b1ac56cb ("phy: qcom-qmp-usb: fix memleak on probe deferral")
CC: Johan Hovold <johan@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 787721570457..ed646a7e705b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2106,12 +2106,16 @@ static void __iomem *qmp_usb_iomap(struct device *dev, struct device_node *np,
 					int index, bool exclusive)
 {
 	struct resource res;
+	void __iomem *mem;
 
 	if (!exclusive) {
 		if (of_address_to_resource(np, index, &res))
 			return IOMEM_ERR_PTR(-EINVAL);
 
-		return devm_ioremap(dev, res.start, resource_size(&res));
+		mem = devm_ioremap(dev, res.start, resource_size(&res));
+		if (!mem)
+			return IOMEM_ERR_PTR(-ENOMEM);
+		return mem;
 	}
 
 	return devm_of_iomap(dev, np, index, NULL);
-- 
2.34.1


