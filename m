Return-Path: <linux-arm-msm+bounces-16940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B24E89DF59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 17:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FB13B3238C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD90413C91E;
	Tue,  9 Apr 2024 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOUEkWKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902C13B5BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676564; cv=none; b=VoODU2kjNYjTYaolMuQjpCHegAl0ITZ/dSgEHt7Yn6CeuHzZw8SRi0x7mmfSsvxasO9DjOjiqxVbYKpPT39LXOXX6pXJbt66O4EW7V9HLcdhP9c81L4hNnOXSe5d/gPxMnzVlx3s2sB5Zamx8OcKXgaOcGwez6+HdQu5uGqLU9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676564; c=relaxed/simple;
	bh=Qii41m4WQHeAZjiOSBCpdD4P8rWOw8ayDA/3aiWLd8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHLjhke0mskr7aTFSxhJaGIZ20Stj9+XaAj7XgHW1OX8RU5ipgO3Cv1SxOS1SeC8Gkz2AaLQKi7OQtM0Bz94BnFm7NyIDiS6usaUhic/ZeVC5XiN2TTsAopVn7WWr3FaCGFc8xYafjrhy29pvdAiH4prSjSeDC95DZtBF5Rk0JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOUEkWKC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so5206586e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676560; x=1713281360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rK4J26zOCM/IkzvRWeb9dI3/SvLzqKWXafwI1/aF88=;
        b=QOUEkWKCmCxIBAP5sY/uH9inDRSXrPTOt/86djQ89oKg5GEwGwK0aFQIAXkYIjhbEd
         GKAOSzY2BY2wE/bYWqdnRtw8bAEEaK+Kf4yuufgkB37+1rFM1ztK6AoGrx66/2EpVvqT
         2AdgHeie864URa9l3NaDXNUbDwf8OE27jI+YAswRg551hUo/xqaLO7Vg3cgZo7Pu2sNl
         OrG+AV7dQoirxDx8P7Wec24fJQvS2Nl+50lLFXYREw1QF9H3Hh6Dp8zZ/1syiqkRz1L1
         BuxZ66qxI+zUJ2lUNUM7ug3GCD25uYWGy8OaPP83+oBIysc8mGZiGRTfjivi4oFgdNVm
         +1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676560; x=1713281360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rK4J26zOCM/IkzvRWeb9dI3/SvLzqKWXafwI1/aF88=;
        b=gUJI446dPezMIJQz3Hh/6jOBgHhTdanq3lGlS0fL3tSgBsKQkMsm/Cc/WVSE9GlGma
         CyOfIUdOJM7OkgegPIIZzBOODCamo7rq8oxH5wNOvcH+8Vf2VBzYp3Uhe8DMoVLJWbdC
         WoPZpnW6ohUY069RM1xAct5svkFGsZCXbJA6PS8/9N+e6veROaommYrz4bBJdmjHfNkJ
         SdJLAH1/KoOLsYL30JMVP5GcJyYufsj4aFH+A9ghHuTPu737v5uBxbC5Cit6s3vsv2bH
         ztHzHReMJKSsehcLw72TuUC7eBnVhUUtg2rwB5LsiUL+czrRVltK2VOKSfxWRusqPE39
         IFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+zmSYD6O3Kkj22NRvfNIb54e7vOOponDvU44oAteCV4Ab2eRzQLKzmkXwdpUChVD1L6upRBRdcmGWUwlDRRkbnoEjC1s/SgmkRdM9zg==
X-Gm-Message-State: AOJu0YzTn3H8qS71YG7+zyFOzLGzhgEY42C+venIFay5kf+/VFutNWfs
	rABqWf92LmFp2jXYpuSLQyWfD0Rqd9sUZrVsmMDkWd5TbLL9Vb+J70kVpmzEyx4OqJdegTnfQUG
	r
X-Google-Smtp-Source: AGHT+IGMKent0y5+d712rV157ro50tteaT7iALlT9p6G6N21wZ5FvY8p31VZWC1tP1MhiFwnv7+z+g==
X-Received: by 2002:a05:6512:4dd:b0:516:d029:b51e with SMTP id w29-20020a05651204dd00b00516d029b51emr8019855lfq.60.1712676560602;
        Tue, 09 Apr 2024 08:29:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a16-20020ac25e70000000b005159412ab81sm1579990lfr.216.2024.04.09.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 08:29:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Apr 2024 18:29:16 +0300
Subject: [PATCH v2 1/3] usb: typec: ucsi_glink: enable the
 UCSI_DELAY_DEVICE_PDOS quirk on qcm6490
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-qcom-ucsi-fixes-bis-v2-1-6d3a09faec90@linaro.org>
References: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
In-Reply-To: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qii41m4WQHeAZjiOSBCpdD4P8rWOw8ayDA/3aiWLd8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFV7NfOogr91/8Kf+FoWNU3eahnqt2+8+GmUBf
 1bZb1X99uiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhVezQAKCRCLPIo+Aiko
 1foKCACKFkuLgNblvsbMUbIOPyJPkyBv80SJal1FZyJm7wAjvXqbqKaNM40PqGlByQHjZ3zcFuq
 KCpCQw03UbOYRvhnRSNNFptDsnxLdtFXTrp9hhcfNioicXaw22I3GL0UxcYNNCQDQjvjnM+UAm7
 rU4d4GlcxbtlWV2oi/WrUlSFYuDC8pm8VAz5qPC/ZPSAAinWlkjLPm769thDt/W1zfYzO1m2tDp
 8kVfTxwg7hYrvcEUsbq4huiQnxtPTBvFI3rB4NmNoPYqTd5wr2xqkQPdHfFz4ZKSZdw2txDvm3s
 HKdx2E0KR7QCgFoORL4mtqKvGAue+efT4KC/y4aNXNHNTy8A
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the UCSI_DELAY_DEVICE_PDOS quirk on Qualcomm QCM6490. This
platform also doesn't correctly handle reading PD capabilities until PD
partner is connected.

Fixes: 5da727f75823 ("usb: typec: ucsi_glink: enable the UCSI_DELAY_DEVICE_PDOS quirk")
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index ef00a6563c88..9bd80a2218e4 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -316,7 +316,7 @@ static unsigned long quirk_sc8280xp = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_P
 static unsigned long quirk_sm8450 = UCSI_DELAY_DEVICE_PDOS;
 
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
-	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8180x, },
+	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
 	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8280xp, },
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },

-- 
2.39.2


