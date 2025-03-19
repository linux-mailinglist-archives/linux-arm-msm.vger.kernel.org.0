Return-Path: <linux-arm-msm+bounces-51887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B3A683AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 04:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F423D7A3908
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 03:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E8724E4BF;
	Wed, 19 Mar 2025 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7XJZyOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424A820CCE5;
	Wed, 19 Mar 2025 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742354577; cv=none; b=XHMTJ+ckb42LHlQyDXzWPhj7dq08H2uQsTbRyr+D06+6Y+yZ1ZlUpMS2dyv9IRP6zS5ENclhXGkN7xAAybBJlwCHNQPU9LPfJUJmBSup4749NQbCCXZAuLndUTqxoSHA0XVnBLQXTfC6Yjo4dXZmFVMLOxj0USrGs8/DS3cxw0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742354577; c=relaxed/simple;
	bh=cYuwxdwZwNpptSRKnZ3r6sjUWtozhGMOY3iV7LMaXhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIYhfyarzJq9SQYf+nPurOxxNT5we8XyzKKWO63W0MGYJnArLPUfyWPzxqmZRl8HU2/VODsQfWT18bTA2nBWywX0/LCJrh88F0ecgYWwc7jLvfeosptzxJ1cMt0XLYbQB9fFnXl4oaURRJRjcJ17jNrqnWjhuWMYsOVGGrxe1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7XJZyOa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4FE5C4CEEA;
	Wed, 19 Mar 2025 03:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742354576;
	bh=cYuwxdwZwNpptSRKnZ3r6sjUWtozhGMOY3iV7LMaXhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R7XJZyOamyfTkXqyqdTEqs9osfuLhbaH+y+EqJ8mzkg0TxkpVi6etvIIkKBgr3zIC
	 6129mlqzMFC+3gsSPovOo6XzjZGYwwdCVunoFm/kyDjGHiNkOnFpv/CxRgN3MmR32d
	 QuxA8pdejZU1JS5eNJP3zO0h2a1JhmHhFI9d13WTtmW+LR6SwPky2yreUhY7JqKV/A
	 3zUxdvPpjX+i1vLbtfkr8YyyXJ7Vm/7EVCXVbIQFiLrHtlk9nJKZkewdVKaiQfN2Br
	 4EVh4TCKiVWJOI7lxOsYPMagcumag1+ACQFXYd0hMdQJzmEUn3tACiXZuHtwH1rNCF
	 lSGUj1jtCpMVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A617AC35FFC;
	Wed, 19 Mar 2025 03:22:56 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Date: Tue, 18 Mar 2025 22:22:56 -0500
Subject: [PATCH 1/2] phy: qcom: phy-qcom-snps-eusb2: Make repeater optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com>
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
In-Reply-To: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742354576; l=1783;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=F7hjgKZGyX/2eLEjN8svonHsIEOir26AqogeCcUlWcE=;
 b=rYdWDRbOX/8sX0ywyxFrEIdhuYcea6Fgdn0JHBSHBmXVsYtepF/Etfb/31gQk04mSVN6QgPpc
 fkCi2bLlQ6fDEq3EejcttGvRSFjO2pPHKcYGnSYCJIVFBXUolthYW3u
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=rD3O9C9Erg+mUPBRBNw91AGaIaDVqquHZbnn6N6xh6s=
X-Endpoint-Received: by B4 Relay for
 bjorn.andersson@oss.qualcomm.com/20250318 with auth_id=362
X-Original-From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Reply-To: bjorn.andersson@oss.qualcomm.com

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

In a multiport configuration based on the SNPS eUSB2 PHY it's not
necessary that all ports are connected to something.

While this is allowed by the Devicetree binding, the implementation
current fails probing for such PHYs, which also prevents the multiport
controller from probing.

The lack of repeater does not alter the fact that the PHY is there and
attempts at describing only the used PHYs in Devicetree results in
failures to initialize the USB controller.

Make the repeater optional, to allow the these PHYs to be described in
the DeviceTree and for the associated multiport controller to operate
the other ports.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
index 1484691a41d59a7eaf257ef44300827c668bf7e0..8897d2072ccfcaa5b4a510c17761dcdeed5bad0f 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
@@ -401,9 +401,13 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
 				     "failed to get regulator supplies\n");
 
 	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
-	if (IS_ERR(phy->repeater))
-		return dev_err_probe(dev, PTR_ERR(phy->repeater),
-				     "failed to get repeater\n");
+	if (IS_ERR(phy->repeater)) {
+		if (PTR_ERR(phy->repeater) == -ENODEV)
+			phy->repeater = NULL;
+		else
+			return dev_err_probe(dev, PTR_ERR(phy->repeater),
+					     "failed to get repeater\n");
+	}
 
 	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_eusb2_hsphy_ops);
 	if (IS_ERR(generic_phy)) {

-- 
2.48.1



