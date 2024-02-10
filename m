Return-Path: <linux-arm-msm+bounces-10478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A6850316
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 08:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 528AD1C214F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 07:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684653A1A5;
	Sat, 10 Feb 2024 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lyw5x2J3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A85F39FD5
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707548999; cv=none; b=UMK8V8Z+Xuzz9FWNAAJgoW+9JqPOzdm4DEBI3ITaJ7yR2CHb+559ng7nJsJeDczXbuKvEyO775Ipemj+6fLeHybuF92XpNEcp1ZHNyFmbfSo+eF2x+sz47lKHTvEoCIhJSn2gvurtONoXsjswGa5bJfaVf3Rf9NplXotEc/aKSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707548999; c=relaxed/simple;
	bh=GwUq4JCcVzOBtEc3gN3wYan172xsmr2kIqhpahEGCT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRfix0PMu43cj9HBHA7tQ4NJ29bgqH5oqplZ0dAnqJnWeZC1iXPJ9Sw9Jy+7ygoVd7Ele8782TcUMyNjVZ88fcg13irdXCCICrjqAcfq4lE/aWoosf2JI61bVIHsdZ5+XTyjcFG5V1jxgiRzhBUI/z3JumdrihOzOzsrOgSZkHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lyw5x2J3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d9b2400910so11870675ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 23:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707548997; x=1708153797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLa98sn79mVMdRvO7elcd3rFtE2dKbRCTOlf+cCBAQk=;
        b=lyw5x2J3+uK9Cx1DsuoFqkMjc2l1K8/1ncJqiF8tRyAcxvKsSnL7bYeP0y5cJbM6Fl
         bDuYZ168C7Y5Z6yl4kSXgCoJ9ZTQ8Gmh5iQnc75KRzSdROsBCEisbxVCuT0xg+88kzV+
         GESSJaAvwyJWPZLbllmTxcRkUwr2OLndBccNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707548997; x=1708153797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLa98sn79mVMdRvO7elcd3rFtE2dKbRCTOlf+cCBAQk=;
        b=nhaDxAMZJ6BOfFPuRtcgNId/Hmh5cJIq+XROnCC+m8Zs74LeaWttSVniW8Rv7RoG4Y
         l9g6usPbzyMMEjuUcxZV60x/mdfquZsA721MM8OXjznPWEETInR9+I5xNVxapSmpE4CA
         9HrCtPUKGGK+1UjSNfG9QEUJVqmvWQR1BLbavFEkKeVxBo+nQpJdAfwKAdZoW9cGxHhF
         1ZGCDo7NObI8ds9zNdXxxp91xB52BqL5rkTnfGzPaiUlXDUjmhX0pbr0swSXSXJ+KUkU
         nA+UUe5V6bGpVLAWabAw5eHhxO1M2v97Vcnu5SnPHGfeDOHSU3KKPNxJYbFuc+t+2w0/
         cZsg==
X-Forwarded-Encrypted: i=1; AJvYcCVHu2F/xcQrArlRZMWplQJ0KTOO3XLGNThiAzhg5QqpaG3o5O/wcElLT1LGK6MNMMIqFehA3aD1Fp/M1vN5TgdKf/SAtzfYcMU4f1XCpw==
X-Gm-Message-State: AOJu0YyGw5IdA48MwlYatBagIuTmL7VORFrhKXr3revOuPhYaMGhhCqA
	5CPDhLY7jElmQFO0H3Hbg8vfg4zdbmnicRvofDSZZpwiCzUYtlUWLAMnCW0UZA==
X-Google-Smtp-Source: AGHT+IF6Obhfaezt84euwognmHLhoystIjlBnFk4gq1ZlYgduARMLgwtIe7tncABPqYe8saWNFsTHA==
X-Received: by 2002:a17:903:1d2:b0:1d9:4143:5fe1 with SMTP id e18-20020a17090301d200b001d941435fe1mr2369262plh.0.1707548996758;
        Fri, 09 Feb 2024 23:09:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+9S47JyY4gdCNtKq6p6Q6R+TDCHy2IVHoHTOc3nq7FC2K4H+Qinp22boBPl2v6yZ3Q4nfK7yLXXNWHe0/UTHmWNVaY/x9pnV6ASHZjzlnHxUq/8MIEm+7/wUgodRVAn/yDQml5JspzkxJ78jfbivxNH9PUZJYbHMO0JQsxmgvSDNgkoUCsh5a+HE/+D7s3CmQJalrJlAc8t8MMidr7MP8A4QvVyfbaYvDJvKdvLo32/1Gr8tkoxt77ColNbqnY/a/7yQvf+M78QElBKweLeuDALe465OoJDkDM8V/8O/PiPQQAlZWfuKn/H6RPamx7SvzoEjD3ONViFyUaucVVRZ5bniRH6uPktTYY0H9qt3tU/QN1jh9xQ==
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id ko13-20020a17090307cd00b001d88d791eccsm2507677plb.160.2024.02.09.23.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 23:09:56 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 10/22] platform/chrome: cros_typec_switch: Move port creation code to sub-function
Date: Fri,  9 Feb 2024 23:09:21 -0800
Message-ID: <20240210070934.2549994-11-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240210070934.2549994-1-swboyd@chromium.org>
References: <20240210070934.2549994-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver will soon support devicetree firmwares. Extract the struct
cros_typec_port creation part of cros_typec_register_switches() into a
sub-function so that we can extend it for DT, where a graph is used
instead of child nodes.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 113 +++++++++++---------
 1 file changed, 62 insertions(+), 51 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index a23fe80d9d4b..1a718b661203 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -201,13 +201,69 @@ static int cros_typec_register_retimer(struct cros_typec_port *port, struct fwno
 	return PTR_ERR_OR_ZERO(port->retimer);
 }
 
-static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
+static int cros_typec_register_port(struct cros_typec_switch_data *sdata,
+				    struct fwnode_handle *fwnode)
 {
 	struct cros_typec_port *port;
 	struct device *dev = sdata->dev;
-	struct fwnode_handle *fwnode;
 	struct acpi_device *adev;
 	unsigned long long index;
+	int ret;
+
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	adev = to_acpi_device_node(fwnode);
+	if (adev) {
+		ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
+		if (ACPI_FAILURE(ret)) {
+			dev_err(fwnode->dev, "_ADR wasn't evaluated\n");
+			return -ENODATA;
+		}
+	}
+
+	if (!adev) {
+		dev_err(fwnode->dev, "Couldn't get ACPI handle\n");
+		return -ENODEV;
+	}
+
+	if (index >= EC_USB_PD_MAX_PORTS) {
+		dev_err(fwnode->dev, "Invalid port index number: %llu\n", index);
+		return -EINVAL;
+	}
+	port->sdata = sdata;
+	port->port_num = index;
+	sdata->ports[index] = port;
+
+	if (fwnode_property_present(fwnode, "retimer-switch")) {
+		ret = cros_typec_register_retimer(port, fwnode);
+		if (ret) {
+			dev_err(dev, "Retimer switch register failed\n");
+			return ret;
+		}
+
+		dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
+	}
+
+	if (!fwnode_property_present(fwnode, "mode-switch"))
+		return 0;
+
+	ret = cros_typec_register_mode_switch(port, fwnode);
+	if (ret) {
+		dev_err(dev, "Mode switch register failed\n");
+		return ret;
+	}
+
+	dev_dbg(dev, "Mode switch registered for index %llu\n", index);
+
+	return ret;
+}
+
+static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
+{
+	struct device *dev = sdata->dev;
+	struct fwnode_handle *fwnode;
 	int nports, ret;
 
 	nports = device_get_child_node_count(dev);
@@ -217,60 +273,15 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 	}
 
 	device_for_each_child_node(dev, fwnode) {
-		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
-		if (!port) {
-			ret = -ENOMEM;
-			goto err_switch;
-		}
-
-		adev = to_acpi_device_node(fwnode);
-		if (!adev) {
-			dev_err(fwnode->dev, "Couldn't get ACPI device handle\n");
-			ret = -ENODEV;
-			goto err_switch;
-		}
-
-		ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
-		if (ACPI_FAILURE(ret)) {
-			dev_err(fwnode->dev, "_ADR wasn't evaluated\n");
-			ret = -ENODATA;
-			goto err_switch;
-		}
-
-		if (index >= EC_USB_PD_MAX_PORTS) {
-			dev_err(fwnode->dev, "Invalid port index number: %llu\n", index);
-			ret = -EINVAL;
-			goto err_switch;
-		}
-		port->sdata = sdata;
-		port->port_num = index;
-		sdata->ports[index] = port;
-
-		if (fwnode_property_present(fwnode, "retimer-switch")) {
-			ret = cros_typec_register_retimer(port, fwnode);
-			if (ret) {
-				dev_err(dev, "Retimer switch register failed\n");
-				goto err_switch;
-			}
-
-			dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
-		}
-
-		if (!fwnode_property_present(fwnode, "mode-switch"))
-			continue;
-
-		ret = cros_typec_register_mode_switch(port, fwnode);
+		ret = cros_typec_register_port(sdata, fwnode);
 		if (ret) {
-			dev_err(dev, "Mode switch register failed\n");
-			goto err_switch;
+			fwnode_handle_put(fwnode);
+			goto err;
 		}
-
-		dev_dbg(dev, "Mode switch registered for index %llu\n", index);
 	}
 
 	return 0;
-err_switch:
-	fwnode_handle_put(fwnode);
+err:
 	cros_typec_unregister_switches(sdata);
 	return ret;
 }
-- 
https://chromeos.dev


