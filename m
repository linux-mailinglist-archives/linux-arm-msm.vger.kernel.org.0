Return-Path: <linux-arm-msm+bounces-35136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E99A50EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 23:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64EC628273F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 21:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6E71922EE;
	Sat, 19 Oct 2024 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC6xKdy/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCD8136982;
	Sat, 19 Oct 2024 21:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729372269; cv=none; b=T/b/o8zkQcJamY7mVvYYqMPA+Yo4vswyKJnBZhT1fy/8v0owXZaREDuRLqzmP0kUsKxEU3nJhpCKogruEdvVO87M7hIJgX72gFCJQyngI/UG7Y5gVB3/kG6nOTJ4J/PO9XjKclpz0vO/wbbwK9gRUBy5mjlCID52JP/2MTZDUKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729372269; c=relaxed/simple;
	bh=qfuwbrXniesiCqNvMuuNW4R19iV5Zv3fZ+JvoK/qX3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MRFTYfxXnYIzHQzzpEDAc4pZFuQiHml6puibC/zTIXUXqlCpFa85ym2ajUdEql41lOz2ZUcUS73nCM03L5K3mE4cJq0zH3N92R1K4gaql0gZkQUshcnHd7FS1H8AOArbCx1MgnI9eq0FZsl2sq+s0sUSJneJIM0wFeKEkyEhuG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC6xKdy/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so8731545e9.3;
        Sat, 19 Oct 2024 14:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729372266; x=1729977066; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXuFFjarxobfIm4uDiHyZ/oOM7SSObKOv6PL/LdrCoY=;
        b=FC6xKdy/5ZnCbYur2cDvGD7cVB0FyZOiULit32BWiqxyRBoO49K4wzaUIf7KBgmoSX
         ggxHX6+vbhX2h0fDKuDtuGfq062xr+GEwZyz2RRTubyCPK0ftK4zLPF8E8Gm69pL5FWu
         mFsspeWnd0M94cwV6PT6Hg/5DOOAcNqFBJiHo+4IgqQFeF6Nck4XmtQxVkiwaM8ZdJOS
         IJmnJXzH6pAHBDvxUCuOyi9DghRTgWoma3r4rPV9pqVGzoZ1etLh9U/6YEJxVLiz1T+v
         A1woCztFkajs7iL3c30dHonhK3Q9GI2R+bEDH3X2WRvNYOcWBhhHryBoxOXg0GlGHtCv
         cpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729372266; x=1729977066;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXuFFjarxobfIm4uDiHyZ/oOM7SSObKOv6PL/LdrCoY=;
        b=KlEvLm2OjchVbFUVQWjQnwWCNQryxdke0rR6b0VmvaiM1mGQMXLxSV+NOZtueqo1ny
         anWgFsekH2Ib6qCVfdxUsZ4melrH73hU2ppn/ZIBe291/St61EcdFpxTpV+nzqoZ/soz
         CHWw1EKSRizraOOhHNbzHMVm+/ONfVBQFoaxCtQ95VWuVYh2DEIV7K2JJq+m6itOqphn
         WqyewEnsceEo5E2uWCGeVzIeSRiEMj1tusV47ktIns609NRtxp36RkxYfRA/d//xpm3H
         8k53dKPdaekn01qzv3pbPBwnMxMlIXzZwV5+7e2cAt3R+Qrk76KwZn6S7EU4dA7lkFDz
         nZrg==
X-Forwarded-Encrypted: i=1; AJvYcCUfJr6mzoRPY9p7LYZGSSqlee40nRZyCRFal8V0AWU+2B0fElfWUMHW2536nrgvZBeUQwgdgHwz@vger.kernel.org, AJvYcCVQOwIHpITCir3F0ZJWS3cefxTS062rQmk02/ECd2FZo+bn+A8SeKXDRjeJgV9dPvFZXSIyZKfMnQmH@vger.kernel.org, AJvYcCVcXnt08LWPAYNz8BMviH3SY40gNNZqPjtIcorPTlPlgzQorbbfGcDNZPQAGKVOitlyEEDOT4f2VtRHDZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk8Auc2YlzUSTHxPHjTjvp/nLJZg7i0SFaqLQYNOwHEQKg2kxO
	7uRm4QsLKx8pvfBo/haODXDSW5AhLQexphBAq3pOhjf5qClwqiz2
X-Google-Smtp-Source: AGHT+IEZrDRm/2sQzA+KwEhqn68UKlqWb0oQCvw0d2zXMoWdNtVYNcxKeZCTgr29BthRYh33sms5bw==
X-Received: by 2002:a05:600c:45c3:b0:431:3933:1d30 with SMTP id 5b1f17b1804b1-4316161f596mr57344375e9.5.1729372265771;
        Sat, 19 Oct 2024 14:11:05 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-f8f1-d6d3-1513-aa34.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:f8f1:d6d3:1513:aa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fc17sm4479865e9.15.2024.10.19.14.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 14:11:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 19 Oct 2024 23:10:51 +0200
Subject: [PATCH] usb: typec: qcom-pmic-typec: fix missing fwnode removal in
 error path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-qcom_pmic_typec-fwnode_remove-v1-1-884968902979@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFogFGcC/x3MTQrCMBAG0KuUWRuYlIjUq4gEmXzRWeTHRKpSe
 neDy7d5G3U0RafztFHDql1LHrCHieRxy3cYDcM08+ws28U8pSRfk4p/fSvExHcuAb4hlRWGOYh
 b+OgknmgctSHq5/9frvv+Ayi4qAVvAAAA
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729372264; l=1482;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=qfuwbrXniesiCqNvMuuNW4R19iV5Zv3fZ+JvoK/qX3w=;
 b=e8pTZRo8KiJR+JkV8+CgcmEKtiha0LlKSFWcJbTD4kd3hClgyK8PiBWR29Ghgwgrc3rogkTJI
 a+HzbJBCuqEDJEENNOTtVN8FYfUxDsWFIvzuUHbyePArlkr8WxoATmr
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

If drm_dp_hpd_bridge_register() fails, the probe function returns
without removing the fwnode via fwnode_remove_software_node(), leaking
the resource.

Jump to fwnode_remove if drm_dp_hpd_bridge_register() fails to remove
the software node acquired with device_get_named_child_node().

Cc: stable@vger.kernel.org
Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 2201eeae5a99..776fc7f93f37 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -93,8 +93,10 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
-	if (IS_ERR(bridge_dev))
-		return PTR_ERR(bridge_dev);
+	if (IS_ERR(bridge_dev)) {
+		ret = PTR_ERR(bridge_dev);
+		goto fwnode_remove;
+	}
 
 	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
 	if (IS_ERR(tcpm->tcpm_port)) {

---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241019-qcom_pmic_typec-fwnode_remove-00dc49054cf7

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


