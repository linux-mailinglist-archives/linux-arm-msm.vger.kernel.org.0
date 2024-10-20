Return-Path: <linux-arm-msm+bounces-35140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE69A5429
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 14:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 761B4283007
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 12:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEF6192D97;
	Sun, 20 Oct 2024 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k28lyNVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76013839E4;
	Sun, 20 Oct 2024 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729429005; cv=none; b=YYUe3ZGj7uB+yyXN+dqYnrvnbw2EDtajPkIyrL1qA47VPzq3WpKW0uAEBvgjkQu/37m0Gf3YJ57JdNdePwB2zvqDGsXRkTd2Q4PeMlPWEOoKGbOmHU40eNH+RET95czdKLrNiJlP93Ch+mj9Y7HWZ7SWFOhwGymF0R9gimalGIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729429005; c=relaxed/simple;
	bh=wEqYYZq0d5UnakVFln/sc8HZxkPFOy1EiUO2mt6WSMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dH8tLwCZNg/6jRAiNQl8JQaF3LLM61MEu93AjEPoqE0kXlbaB346J3p42rgbeBF7aeYwOpLkxGHCJX9Xa7cYGZ5QhlYIWzD+mPog1D0yg9vmNA4yy9JfSpy9anBkrAsFFO/VL0HSZ0Wp6jUqjOArQpi7r6Zzza/p0p9uLRKIKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k28lyNVm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314c452180so30773125e9.0;
        Sun, 20 Oct 2024 05:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729429001; x=1730033801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JFvgIdqvXuQshgDFeSzJnog5EipEBYoQ3fcCzur9aQ=;
        b=k28lyNVmYqPAlDWDN9bNs1sAeLrsmPk+B3mGJLDcpGZ4HARuGSx8eftxwmvyD6h70m
         76UYEhjOWDSpvPrM/0/BBUlsg1gG0sF9Oz0BeiNEx8ds+jusrqUjJyntXf+pdSZ0YCyH
         +2XHYe3kC/yhdko8C2ecvJaNQdrF3HSFjPfjYVRmdWQmPckfVkp8ZWAPZhtRLTFYyGHK
         InsDfqTw+z8ZX9vRvQsfN5PvxVb/DGAmqCuZJPgDqmvhPcmTDDNu5WMZhzhEQiQnKvDq
         MOFn3TgCWAwG7mLGmBnlE7snzASSgXFGZ79j4lRE3eoEOThowTQ4v9G2zAGjSQu5mciM
         jEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729429001; x=1730033801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JFvgIdqvXuQshgDFeSzJnog5EipEBYoQ3fcCzur9aQ=;
        b=fVAhkT8xvpSo58iyZq13i+eVzWthJ1TbtLw0vrenrIZWYfveMcOc0XzywRqn1GUCXK
         cRcCxBrEnV80HjGBoQ1QRGteBPSe4vXfi5TrO66tVYmPrrINbcoMu2Jek8tImdrf6t4g
         0+Sl9IlsKKRtO1yEyCml/+ue/yv8ry+IfvOA+bXMleQfjVfnOPAwMJMMS+rPCIlLvHAT
         7jz3TQaglloFxx5EAtITscxvJvg50Dpaupv8EGIJqVLBhiEhCNkYz5Wr9G6z0ebp6arA
         +MFb10IernqrmZx/hh+tj0EPas4ciDizA4Sr7+/zViQsJTowElvehhvaAn3UPOeF8Kgf
         kIJg==
X-Forwarded-Encrypted: i=1; AJvYcCVFtfKqHndkr0eLX4ojHRMaeTVsBQCIswLl4JZDeDBIw5e+45ul+5TdU5YoEXLPResGr3mthXbj8vdP@vger.kernel.org, AJvYcCXEVFfzc9fPE0EBIVJfjcV6/pvYkwytbquYBbfqrU9RbBpe6NB0yTYf9DU5mRJY3lBTjtFYwAdR@vger.kernel.org, AJvYcCXtFQrd92kIvOCGnoDqYk21RYfREI3iUC5tVR1SAxM0LHMGZhKM+4wMsVzIlNrCgjswCXj6j7x5mYZBjhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIAm10WbhHuc3HqI2duIolhJE2mF8ifLCo1Ordk2wa2ee88pM
	CLk70E89klaMfYfMbZQgw4XNJNLM7eYAwFuleUvu5XF2gtE6YxLAFtb2jT8X
X-Google-Smtp-Source: AGHT+IGKNGNqEY1E6QcN2HUxyiodyMdxTcNfE4Wkz06wY8Phia9k9TfYBwgFT1qzBrsjin79IoPLSg==
X-Received: by 2002:a05:600c:3546:b0:42c:b54c:a6d7 with SMTP id 5b1f17b1804b1-43158756e2emr81873555e9.14.1729429000982;
        Sun, 20 Oct 2024 05:56:40 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-5fe4-91f7-fa4f-9c21.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:5fe4:91f7:fa4f:9c21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fe00sm23010755e9.20.2024.10.20.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 05:56:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 20 Oct 2024 14:56:34 +0200
Subject: [PATCH v2 1/2] usb: typec: qcom-pmic-typec: use
 fwnode_handle_put() to release fwnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241020-qcom_pmic_typec-fwnode_remove-v2-1-7054f3d2e215@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729428996; l=1561;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wEqYYZq0d5UnakVFln/sc8HZxkPFOy1EiUO2mt6WSMA=;
 b=XUSPo8a+kAXSuJkrAATrt/JgB37q8aO3qW/6/KHDB8NzdGZ+RBB8hyXjFgUaMwhPUcwqT5znl
 +X8p7LTColhBkaEfrXdL49HvfJSEd0pSETH87R1zbNVnbM/ndnecpgg
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The right function to release a fwnode acquired via
device_get_named_child_node() is fwnode_handle_put(), and not
fwnode_remove_software_node(), as no software node is being handled.

Replace the calls to fwnode_remove_software_node() with
fwnode_handle_put() in qcom_pmic_typec_probe() and
qcom_pmic_typec_remove().

Cc: stable@vger.kernel.org
Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 2201eeae5a99..73a159e67ec2 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -123,7 +123,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 port_unregister:
 	tcpm_unregister_port(tcpm->tcpm_port);
 fwnode_remove:
-	fwnode_remove_software_node(tcpm->tcpc.fwnode);
+	fwnode_handle_put(tcpm->tcpc.fwnode);
 
 	return ret;
 }
@@ -135,7 +135,7 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
 	tcpm->pdphy_stop(tcpm);
 	tcpm->port_stop(tcpm);
 	tcpm_unregister_port(tcpm->tcpm_port);
-	fwnode_remove_software_node(tcpm->tcpc.fwnode);
+	fwnode_handle_put(tcpm->tcpc.fwnode);
 }
 
 static const struct pmic_typec_resources pm8150b_typec_res = {

-- 
2.43.0


