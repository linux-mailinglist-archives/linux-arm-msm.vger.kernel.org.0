Return-Path: <linux-arm-msm+bounces-7218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A68EC82CE88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CDBD283ABC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2009C182A7;
	Sat, 13 Jan 2024 20:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTOoEGoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AB3171D8
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd8b661cb8so27320841fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179357; x=1705784157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOILqGWdvQGyp5yG9dNVVWooYzSrEZenpOm6yeqSMyQ=;
        b=LTOoEGoeUIP0lX6KoZ3uLXJwFiPj3eWEuRNTAu2Ths6nMMhXC4w8CdqQw5HW7/FMIc
         4Nc1ixf+NTyb3lGlQYtsYPKgUA4VsnuSJk1+tK/ZAoN2Fh7UznjOZmLDvSskWPnr2prn
         xVw3Iye1pNZWVD3saTSTRFi5ByHPIk9xB2e8Cr4pYy5gG8RxYRvRC1VUhXCoFWfSEQx4
         UooM31F8tf+rjPj4YfVQ6ykOybxSOOdP2VLSSndfv8UdxWTyDM2R/75Isqv7wh+rfe3y
         a2E8ps0QeCPxL+XIIn59qa55Y0Ok/7y6PjVMS7/+ZCHLXfc+LaI0xIzpswGr0SPy4rei
         QgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179357; x=1705784157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOILqGWdvQGyp5yG9dNVVWooYzSrEZenpOm6yeqSMyQ=;
        b=oUUt4rNeNCOZ34vqyZRr5AbypM+KiQkrc6Q+yeCwlPSXV2ueKEULc3of1UO3WQKmDw
         r86oY5UUPWYIBvP+sjX3i9tb/kzD4bNs/ATP8pqNXetOKa4cTE+JmG27lPHnD5NPt1tz
         J0Wt5x40sPGJMRKkq5jch3RzggxlFAdjrXIWx1UyQ167ehma1aRdpwgYzsBFYjhF8JUY
         EJvqVDG1uFYlLnctqb+E+PYKkmsnV/crLjm9Pk8zBIBUtT4LInPj/HtAnjmOGmTjr0ws
         NjucaRXnx+urkHv7+smjlx7Bq4Hd9l2t5jIY45wj3gq3qaPimd+j2zGCy5oFtRDgBxLr
         YeCw==
X-Gm-Message-State: AOJu0YxQnvgbJlPOAFvRfwKnacjXU1/BjxQ5tw+gLfZZ268f7GLyGmVj
	d0WF9FWFMEM28uUhqdAVvYZh8pmXs1JXEA==
X-Google-Smtp-Source: AGHT+IGbBpFSRp/Rl6zlZ4fJ2bTh5KOLJ9A0MfJxpzIVB/9rSCLgY5y9Hre1H/aLuz0I9VnjnNeXdg==
X-Received: by 2002:a05:6512:694:b0:50e:ac0e:ad95 with SMTP id t20-20020a056512069400b0050eac0ead95mr1258023lfe.15.1705179357738;
        Sat, 13 Jan 2024 12:55:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:48 +0200
Subject: [PATCH v2 05/15] usb: typec: tcpm: fix the PD disabled case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-5-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=th0VPhhVwgxzRi9BZeZWRGueot5zBad9lANgJUi6Tq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjW6dxyBLqmgIkLKgBNIXZP2morYd4M6kKeF
 0II/6WztImJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41gAKCRCLPIo+Aiko
 1XoOB/4qZ/5yHK3+7TdrBie0roUiq0G242K8R7XP22EtAdGvBmxWVzee55dJ3/+oHlrEWLpYiw2
 DHiVF7OJ/T04vnoqHN8vU0dEEcLmyBFKnkDWphBp4QAdHmbTg0iT+Mwu+2K9Uk8NaUK9mLk5OEU
 gImtz0ysLNcFI5mqe1mW4WPgD6QE5lMnn3wkNHC2DRpC7t0C+wv/DnjZGqO830bXqSBuzt9fg3s
 XHHZ8VZGmKb1ZoZZM6+GEtCj3ZooFds2sPN481vkCGiaIpPvuBzQSNtK9VbNuUb+0GSPopAiGhi
 C6Rc3vDxLup3pyubKVLVMyfD7EOZ5A7a0r8t2zlaWsVdn5RP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the PD is disabled for the port, port->pds will be left as NULL,
which causes the following crash during caps intilisation. Fix the
crash.

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Call trace:
 tcpm_register_port+0xaec/0xc44
 qcom_pmic_typec_probe+0x1a4/0x254
 platform_probe+0x68/0xc0
 really_probe+0x148/0x2ac
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0xd8/0x160
Bluetooth: hci0: QCA Product ID   :0x0000000a
 __device_attach_driver+0xb8/0x138
 bus_for_each_drv+0x80/0xdc
Bluetooth: hci0: QCA SOC Version  :0x40020150
 __device_attach+0x9c/0x188
 device_initial_probe+0x14/0x20
 bus_probe_device+0xac/0xb0
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x1ec/0x51c
 worker_thread+0x1ec/0x3e4
 kthread+0x120/0x124
 ret_from_fork+0x10/0x20

Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 5945e3a2b0f7..a0978ed1a257 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6848,7 +6848,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	if (err)
 		goto out_role_sw_put;
 
-	port->typec_caps.pd = port->pds[0];
+	if (port->pds)
+		port->typec_caps.pd = port->pds[0];
 
 	port->typec_port = typec_register_port(port->dev, &port->typec_caps);
 	if (IS_ERR(port->typec_port)) {

-- 
2.39.2


