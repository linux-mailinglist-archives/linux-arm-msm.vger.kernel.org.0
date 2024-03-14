Return-Path: <linux-arm-msm+bounces-14161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C787C011
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 16:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EEAE284848
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 15:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9C074C15;
	Thu, 14 Mar 2024 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4qgswV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD2174C0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429889; cv=none; b=c0ByDcMkQ3l+7EDSO9V1g9+ddwHt50LMEJJ8zeoJRsae/1vvj9mwvMhG73wlLS6cs7xI+hyBmxGogFoiFGtoK3fBCk4Ug1wlvI1ETAAlRudvwh95tEDA6cydAikla4ZmorvDJIbc9PBji1cl5ji3fG/QFVLPjHWas+AAH9p47RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429889; c=relaxed/simple;
	bh=u+T142/W4OHi4TrqZYDBdEbmgdn1PJvXBdMP9ceIo3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgOdrfIk6oa2UMbi+W688sh9APuzEaqbsKGnVeKjpI+ZofawDM9GwJXJ4MaEKrW+6nauTQr+AS+VzGVvwf0rLvAWJgPIBU2AQQyQXjeclgffSM0cnEhCq3Rkb5bwocOc0+pc2rIsW09Te717rLDfUB2LEybhgy3f5drQfsGLpKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4qgswV0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6adc557b6so1047430b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429887; x=1711034687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UesLzv/s5weNz/WtSlaUPJ3gprn2+do0z55ESIdTIKs=;
        b=W4qgswV0m46zQ0JIFzAw7ojNW1QPG9H0DAU/QWiQjzZEH4r+NwaGK2kJUfIwoty0Ot
         NIvQ/c5B994zsP+8knTyVcRdYN/jsSOAaTd4PmmuvB5svkI5usXh+UeoZx1iRuSrsJqv
         W/y5VfJgQ/AimlvTxOQBu5k7/6tTZ9+7IuegVAPioNeLU1hgteo/9TXl80ys1LkQw0kx
         ZORoVdH3ddQLaCE1KmpfCgfYzekdFeVIKjkBeV/rOWJdUlTKD/FzGiT7E5QPzO1xZQRw
         D9Pwkp0EQsUS7jKsDSA03BUY/ZLmuKO3bciwE5/bpzldv1oRCo5vFQeoFuZTwh8cuxeV
         M5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429887; x=1711034687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UesLzv/s5weNz/WtSlaUPJ3gprn2+do0z55ESIdTIKs=;
        b=oNf/mlQxiaPymURNk2D6PHojNBr0FQ2wws8io+bl//ry13uORTHSBXntirC1IDg6mD
         kTWaNnDm3T+tvGvBxubwYp4xNqHwJL/49A29cxMvfHRtnm0ZSluju3yMsvtLFzrd3R6T
         wZxTzeQI+P34LdNRN1CZVX5RqB0Tn6ZOKGdpyhEoCrwkvqqHxyeAQSO4eIX/FtL8IYG8
         geEbrWuuqWvFxHBWrYF23+NwMsWNQOax5YzwGuoYYyt0WseqMEhEXRnrJup+WrQlVeFe
         Fpco6Uas73oYRZEInLIXs+yTZJM2VSK0vmCApw1aOaRc2ir5+jPJaWXYX6zEM8r3Vx9B
         TM4g==
X-Forwarded-Encrypted: i=1; AJvYcCW3C3tWfI7eIiD6Yv/15ryzsnZGTR5wA2f3kzvp7/D1a0byYf694xcWKYN2IFWG6HaFaMkdf5EDR4YD52D7C3Au3dejIElVAxThmY/ueg==
X-Gm-Message-State: AOJu0YwZcBt+mdseQ/ieFiKAT2kQphxP63UfKGbEtR3h3C1TEINjM5I8
	DDmS6rDDDlCXM+2zt7PzjUU6b6+GdjNxNrpS3R6G5KcA4jhZrTIOmrO4Jbnqkw==
X-Google-Smtp-Source: AGHT+IHQG5KLhzzNsvAOkfN5kVkEw1s96R6Mf6b+5IIQ0GHj3IiEjO1mYEkAkdOoQ49n+BrtdM4wyQ==
X-Received: by 2002:a05:6a20:12c6:b0:1a2:b33b:d6e0 with SMTP id v6-20020a056a2012c600b001a2b33bd6e0mr2571998pzg.59.1710429886716;
        Thu, 14 Mar 2024 08:24:46 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:46 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:48 +0530
Subject: [PATCH 09/11] PCI: epf-test: Handle Link Down event
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-9-6134e6c1d491@linaro.org>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
In-Reply-To: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=u+T142/W4OHi4TrqZYDBdEbmgdn1PJvXBdMP9ceIo3U=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaQb8VpKIpIa5FQmaHW85so3xvUG3jdu7yO8
 MV8jLLZotiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWkAAKCRBVnxHm/pHO
 9TcBB/wKPBWo7Z51yH6ZMP9ARLDl+xRfSnVueOjzfuJQU0rRD2off8VJhbSCOcELFIW+cCMat90
 Cnnu+PXjUtf0C/vXmThEaxNslVw045iRcOydgzgWH6cp8O3ZjC0PLUqbb2LcKyKxVnpTz9pe0Ib
 HykZ0yCgCQ7SSSzadoqKAqObqh2npoW0NeGs2Aj6PmGyNFeftCYzZ28PWINMmpL6AOH+WvkmD9/
 EdA79wTgjUDtsP5CG6WTf7l1G2oHngiWl9h7VcklbivUtoDbIoNqyy2uGelrkaW9NqhLpJfEEwX
 sZ8utoKYhryD+T0QQ1XEqVWTpIxdQm/kbSsabKO99Vos92Li
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As per the PCIe base spec r5.0, section 5.2, Link Down event can happen
under any of the following circumstances:

1. Fundamental/Hot reset
2. Link disable transmission by upstream component
3. Moving from L2/L3 to L0

When the event happens, the EPC driver capable of detecting it may pass the
notification to the EPF driver through link_down() callback in 'struct
pci_epc_bus_event_ops'.

While the PCIe spec has not defined the actual behavior of the endpoint
when the Link Down event happens, we may assume that atleast the ongoing
transactions need to be stopped as the link won't be active. So let's
cancel the command handler work in the callback implementation
pci_epf_test_link_down(). The work will be started again in
pci_epf_test_link_up() once the link comes back again.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 84cd47ebac22..97245228c9eb 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -823,6 +823,15 @@ static int pci_epf_test_link_up(struct pci_epf *epf)
 	return 0;
 }
 
+static int pci_epf_test_link_down(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work(&epf_test->cmd_handler);
+
+	return 0;
+}
+
 static const struct pci_epc_event_ops pci_epf_test_epc_event_ops = {
 	.init = pci_epf_test_epc_init,
 	.deinit = pci_epf_test_epc_deinit,
@@ -830,6 +839,7 @@ static const struct pci_epc_event_ops pci_epf_test_epc_event_ops = {
 
 static const struct pci_epc_bus_event_ops pci_epf_test_bus_event_ops = {
 	.link_up = pci_epf_test_link_up,
+	.link_down = pci_epf_test_link_down,
 };
 
 static int pci_epf_test_alloc_space(struct pci_epf *epf)

-- 
2.25.1


