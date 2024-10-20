Return-Path: <linux-arm-msm+bounces-35141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF189A542D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 14:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B8291C2137F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 12:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C32919342D;
	Sun, 20 Oct 2024 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHMg+Ibj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E1192D87;
	Sun, 20 Oct 2024 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729429007; cv=none; b=IS+FpKE1jiBJMzW/OTSZIKeTry+6CfpoIlS30r+Hzo0NcAU5Wvb7w8Ocej1xLlqt7v7TNzrLG6KMnAyOIYprfv/FBwz7cR0OxjBHO4Bxg6WzAPmsHd/n4lZYKgy2bq08NV9+M9PPZyzAutO3vnh7x2//g8O61dDLhyjLmsjEVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729429007; c=relaxed/simple;
	bh=UlTDYWZVsPjmFXqO3SuPTCeEP1M0s4v2VqV1L8OcrJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NvLwi3FPjig1AGzwAr16GRWF3gqW5oiVIJe6qHBvKmy8i3UqrOlaY9xSXlZ8BZ2LFh3jx4T8WAF53wBe3sDIQjbpNEyskoYBHgKX5Y0rH72cbZNr38LxH8kz/FSvlQ1RJ5ULW41z1bwHPGck8Ft2Bs9emlz0aVZLWxQcHZZ/G7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHMg+Ibj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43158625112so34611825e9.3;
        Sun, 20 Oct 2024 05:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729429003; x=1730033803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDGKjKx/RHrvUZiVAr/5RFcyku1oUCaohmQwoCH6bXE=;
        b=fHMg+Ibjue1aenv7UspJgM76LTa0CL8Ab2gMeo/uf1MOAp56byJSoRcROXYExByDvP
         D35PGyx13dVVpnqzTFyYd23MgME+g8zt4CJEw08mmUc9o9G7E+GnWqm/gFC3LrB56w7m
         hIAQkPWA0IuKYNa0rlT5PxQGZ3J9BFWs1gKR08YUP4sxXFjxnNcycnqJwZvBsRccRZs+
         4RitlJwZB8Ua9jhw4QKUGzb3Se0XdbZx4fQ4BggDcCC1nJpLaI6pi93hz9Nvej/EpPT8
         uZr5MokhSSPhDsCBXqX9IO9OAR3KRp/QkfGdqhI70U4VaQzaWpYgTMAfDN49Sku+nDTe
         lAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729429003; x=1730033803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDGKjKx/RHrvUZiVAr/5RFcyku1oUCaohmQwoCH6bXE=;
        b=UX+BOJI7XQ1LjYYGGifiAVBQC4YB6VsHhnEg67ftn5anT0Ur7ZOsYksb+XYtkKtFMS
         S/dYbHCtiiqQm45yDzGkayHHVm7Dp7nidevFr8sGzRcKaqbv4G4lhtH5Q/hudw3S1PwJ
         Nqkm8oK2xCSSArr1xitjlKxSHAHL+X/ue1gDWBnCUg3jGzKDZkD1FujarYJX+zjtf/t2
         gsu4/WoYIGU4X/POVcBBbo0dOG0ILjcsarU4OfGLs5VGIaR5h3wXZnZfnpRrzf4nUYq7
         FT/8rCdDGwm+6dq6aJLZk485rIPOnQc+Wvpnr39WTMORR+67PuToPniwOZnWZShRSnQ0
         BQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKw/ggI42bh8ftn3R1pXVMiHS1RoJArmFwjn0exgYCq2TZWWWqv+LEzrr7LtuN8CCR6xMC7Su7@vger.kernel.org, AJvYcCVZnI2mKb0krzai+lLTvbuHWAwGwWIN0Mpi1Ede5YlRrI8PFOi8j20W+b5SYn/Ov0p08gh+FbMW/6Ey@vger.kernel.org, AJvYcCXSmVMOQNxkV+/ZAXY0BYzhHCcOAaD3QC40SMKDM2h8EzgSKMlcvw6CodJToaLpdo5hVe9Jr7oLuppwJN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vly+lvAiNytoNCksgmXF79zoD7p9KA5rdbnWiQNP6o4x4fHp
	7h0a4WF1hQPocBuio/OeWTDI/Jj3xOv+rfsN5E19AYaFJv6m3wcRxg1FYOBW
X-Google-Smtp-Source: AGHT+IE6u6+iI/Gmf76CwKGO0v/6Wqkc1oAzj5zIWD5wrVd1yU38i/mMS/GCJ/xijz9k2kT8i/jyeg==
X-Received: by 2002:a05:600c:3592:b0:431:586e:7e7 with SMTP id 5b1f17b1804b1-43161634f28mr65353065e9.1.1729429002910;
        Sun, 20 Oct 2024 05:56:42 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-5fe4-91f7-fa4f-9c21.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:5fe4:91f7:fa4f:9c21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fe00sm23010755e9.20.2024.10.20.05.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 05:56:42 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 20 Oct 2024 14:56:35 +0200
Subject: [PATCH v2 2/2] usb: typec: qcom-pmic-typec: fix missing fwnode
 removal in error path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241020-qcom_pmic_typec-fwnode_remove-v2-2-7054f3d2e215@gmail.com>
References: <20241020-qcom_pmic_typec-fwnode_remove-v2-0-7054f3d2e215@gmail.com>
In-Reply-To: <20241020-qcom_pmic_typec-fwnode_remove-v2-0-7054f3d2e215@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729428996; l=1282;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=UlTDYWZVsPjmFXqO3SuPTCeEP1M0s4v2VqV1L8OcrJ0=;
 b=yj+qfs4BY5cWpTg2VSEdKCRIJIqlhUmi9BfW2D40RyfMwQy6UtY9S9XSJKEMFrlJnxaLfmvgM
 fheWUnR655RDk74d/hJZ591Ylz2t5YhDvKCnyDNIZEZ/0+KdKufUoTo
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

If drm_dp_hpd_bridge_register() fails, the probe function returns
without removing the fwnode via fwnode_handle_put(), leaking the
resource.

Jump to fwnode_remove if drm_dp_hpd_bridge_register() fails to remove
the fwnode acquired with device_get_named_child_node().

Cc: stable@vger.kernel.org
Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 73a159e67ec2..3766790c1548 100644
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

-- 
2.43.0


