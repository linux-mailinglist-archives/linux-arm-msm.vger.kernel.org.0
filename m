Return-Path: <linux-arm-msm+bounces-16751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0A89B6F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 06:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1635C2819B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 04:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BB21DA3A;
	Mon,  8 Apr 2024 04:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yQXgrV+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94C6847B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 04:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712550659; cv=none; b=YZnwLmeE0zrgY1r+oxFXxsWTKM1dIdo8MtmeV/SIhwjqLVy+R3PhOxyQsr9d+/l2+zIn5f+dQgCq0pv9ic4I8jIqFmEYBeS5ZY3tYIBuqlabSH0QzLvdA5joz0Cf65P3dtoQnFgHDeYMp9DGpu+YooOZYHajmhYxvXLDOa3t3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712550659; c=relaxed/simple;
	bh=OFNjqXgDmhJBCTwEy8oCd/Fyq6JPLE6X9Ia9XrIuJs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBRWZMoW7l9eE4BPNkj8S+IF6qLQXDZzQXBuHsmx2xA7Otkfj04aw8XsNBKXqsq7M385RsJLp0eSNJ7EXZjI4kIQRGowVQhBfU6Tt8xC4pBLHUPqdYHUujlszKvl2naDqrkJ/PN0tLsI1gxOh/Wtbya3C+JVDEdAaZY4hZdOcDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yQXgrV+e; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516c97ddcd1so4453413e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 21:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712550656; x=1713155456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdS/iAbBxLLUZl8me/kS3vqa9hXzOuPdZZo0B9BMFVE=;
        b=yQXgrV+epafKe1hURc+6Q2r/2o5kntlDvrTEH3kWs6JcxakTMFbRsbd3lrRvO0pYVy
         zi+XOrgSN82fnAIVF8iJ8lXQnq89Pu/m3on220dn1gHN4VFgI+uitsmnX4E+gz1IYXCJ
         snmoXqfqOtF/PRSZCTvjKHcfETs5GnJWtU6rxxzZRKiumrQZr4vPr1J/PtzAEIh6N36+
         xJ7rcmqaiX/fvvv5RbOtsSpED5hlCcKymaeRClUJT2lPwzAICAu5aTAkkvEfWBnT06b4
         DddpTBYmgqIjAFD6tke6raC6eGNL1XhqgizPVnSmyK/ZgkhkxA0pAbH2YYVLyNTHUJPo
         3+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712550656; x=1713155456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdS/iAbBxLLUZl8me/kS3vqa9hXzOuPdZZo0B9BMFVE=;
        b=QZfWCtr9naJ6VmxXOlNORuq5I3IEMP6hJ/FmDA0BkHwwZe465ARPY7g3B2ccx0O2PY
         7juDIfk8BuZdCipuMJD4rvINC349qhYt6yNUGvV2OLP0qn8c/FO7m91mgbWw/5eJN7Ho
         6Vbh5XwMrsIEh0f8H61h5qqFdtwi9cVA3NYAFZRfMRMqLkO1Zk8naAhgFoYSfzdd4WKv
         iXxYkMOmQRL5u3CstHAriI5uPotJJtaLQZLewPVsL7GbaUaUYxp0aa3PHLDbJlo3QMar
         CU8e2mpmjpNyxT8dwY69ddbrWhl97R8EvTwUO9W81RvNfkYmxt58t86eD0GzwyhhnX9p
         XavA==
X-Forwarded-Encrypted: i=1; AJvYcCUwNy4R+EhLq7IRDmIHj8K1iQSwzVfOP9svLYXJPXeB2AIiyTu0a6YNZh3cS91PghaTL9/Y5tlh3ujVMng1aeV52KBiS3GPvdEsQ89B+Q==
X-Gm-Message-State: AOJu0YzCE339QRN+pEFiZ9kFUKausjJjgntyY0O4td6uZmlUs0iwk6aK
	w/uPe2/5RTprpjITM+NONZc4R3ty429ODjkY6OCiAFGVtA+qY9LiozKYaPk++LY=
X-Google-Smtp-Source: AGHT+IGolJn7tKx0Ibob0MCiWR5rKGe2h9hkerxCybsDQSTV08jAZ4Jp1ilgPOu7qsys6iKUMvZ1vg==
X-Received: by 2002:a05:6512:14a:b0:516:c9a8:5ade with SMTP id m10-20020a056512014a00b00516c9a85ademr4869967lfo.22.1712550656243;
        Sun, 07 Apr 2024 21:30:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g13-20020ac2538d000000b005132f12ee7asm1033207lfh.174.2024.04.07.21.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 21:30:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 07:30:53 +0300
Subject: [PATCH 5/5] usb: typec: ucsi: glink: set orientation aware if
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-ucsi-orient-aware-v1-5-95a74a163a10@linaro.org>
References: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
In-Reply-To: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=899;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OFNjqXgDmhJBCTwEy8oCd/Fyq6JPLE6X9Ia9XrIuJs4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE3L8yVMFuaX6oHTn7NO/hspCBjSC7aWF6DmsR
 yOlWW4CTxCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNy/AAKCRCLPIo+Aiko
 1SSCCACemQ21Bu0P55MdKeoqBVCH0prRGLInuVwcWDnQwyo+HgZGlTELmAHitNKlu1iW05uq3Di
 OB4Y/g3Dlk8j8pL7LulULIedAm5OfyQ5yihlH7zb1v73cIYscYn2cKoeDPMkReYqVn89sLFOmOd
 XaorhMzVfO3GashouK9oMTWBvWrfpPx1SWJWne2YJHWMpB49EANCgBtP7mqXpWKnQoSkCVSsgSZ
 qIP59I+SULpp6KlkhROoMmW56lp8lhAjxbPWu82pQ0mLlNgNhOj9VMBQh73s4St16xvGs3UU8lt
 10mxv/8AJE9TKcl+Uu3DkNgZ6sgoPFMZeZ2kQKEcSiqLf5s2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the PMIC-GLINK device has orientation GPIOs declared, then it will
report connection orientation. In this case set the flag to mark
registered ports as orientation-aware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index d279e2cf9bba..87a8b5f88da4 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -378,6 +378,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 			return dev_err_probe(dev, PTR_ERR(desc),
 					     "unable to acquire orientation gpio\n");
 		ucsi->port_orientation[port] = desc;
+
+		ucsi->ucsi->quirks |= UCSI_ORIENTATION_AWARE;
 	}
 
 	ucsi->client = devm_pmic_glink_register_client(dev,

-- 
2.39.2


