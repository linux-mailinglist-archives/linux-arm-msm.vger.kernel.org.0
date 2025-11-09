Return-Path: <linux-arm-msm+bounces-80863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4B5C43AFE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE2DD4E317F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C0C2D8372;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEER7+0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD12D6630;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681205; cv=none; b=RoJYv4RYBjWcmgcJBB5davulvBKaYi6xicvX1zDpq5zR3AAh7toagx382J7L6/yndz6hrVWJeux9QP2nZlHLqGxw2bsp/bR35VTJbfD5Yiec3Kaat8OXz4Ms/0UZiRWennrRjySbS0oTwvYISsaSytYLRQUgvN79opW7VMfepkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681205; c=relaxed/simple;
	bh=dqMMUSeQ+jdd/9lo3As8qjx3qL8HhQ6Z6MvK10c0nc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJ6NaLshBejC+ihjDtfuQKlTCFxMuEN8hddmknncanVKHtND3LjzEbl5BiSqUonqnGys/GZkXLxjbUgDCkR8tMPGX7FVvO2gMmEky479M8rLuj0pZd5oj62A/kdoQ9+aq7Hyby4PH/WmveqyFHNhYQnimKZFDdKxb2GEaU1rcG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEER7+0d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50B7BC2BC87;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762681205;
	bh=dqMMUSeQ+jdd/9lo3As8qjx3qL8HhQ6Z6MvK10c0nc4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MEER7+0d0Rt/3WDwJi27yct5Gll/TNY2Ir8P6yjR4l9H605/9M82TGWFsDUU4qFUs
	 Vwfs9qfHrKm8o55/2adNwCiEJJZlpuWJLXVer1QxSJ8EwycQvEqiSjCmEi8mfzyiC+
	 oIssUYyZGcdGaV17R2dDMRkrELihyKmqFYDIJ7qXT8JLQ8JWVypIUfgl6TywwKyQ4D
	 2bZl58k3If+j7vz6KQWXRc9o2Aec4tUOgwv5Z1sF68x8mGV1ftcswT80LrW26OWr9f
	 KSw9s4+hVwCL9zl0BQdXs6DRe9MJBpZPD4dkOTtC7era90H13qSXwM1MeCB7r0ZZu6
	 C1O2mnPf83qSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FC7CD1297;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Nov 2025 10:39:51 +0100
Subject: [PATCH RFC 8/8] media: qcom: camss: Remove D-PHY-only endpoint
 restriction
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-qcom-cphy-v1-8-165f7e79b0e1@ixit.cz>
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zDsFzpKtJmk7KEk5h22OnNp/nXx6STTnT1WeAcZBwYA=;
 b=owEBbAKT/ZANAwAIAWACP8TTSSByAcsmYgBpEGFzR5ywwp3YOPFsLYzk5y09hMnyI69rHKk2T
 p7r1//BEMmJAjIEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRBhcwAKCRBgAj/E00kg
 cu0MD/dBQ5LH7bVr49IyfhX1vXrMkQzuBHMIUfDpVDGWKWzVVznV9CcopTkNZbdz6lfcbfl/D3p
 dF2G68aYGuo79pBTTsX5LycIJZqqrYLl3CmMM/CA2YqpDydDlw0/O2zwCx67lb6Ir6JZ/knCX08
 IGInYTQD9FsrfdRhxjYJ+rkoJLefYTgA1MBY42O2KzyFVymbdf5bR5VnfY78E3vHCb4PGvny6+q
 tD+luO9u8EWKmKjY9lHE5Ybs5eINa+q+I7gGue99qaWb7MFtoK0NevIZ9ZObMMiKLSxxvp2T138
 c4n13yoIPaQ2tDX26Gb16hp+Vv2pP1pbXZnlv65xgRb0v99atQdoeOQX4UT/h+sYP52ldYfy2va
 CBQnxizONrKdhpNS1j0d34qhOLXu0fzipXASRvJdutGPITHfUG6NQTK1BVHAr+H5KuDxXGRmOyu
 TdIknVTiCm0MKYvM7Z/4InX0aV1g2uSmlmyJMG9BjCfFlEjurO7SQBI+69BOEzVMhujZa8LEIVj
 9NDVrOjJjagF1UEdFUhBW1Y2C9Eb7s7n3oSLFmv+tE6z7I7vlF04HH6U4Z/I1M9VDedMe2fzYh1
 uc3FIkug3CIzlP/CpYGDuPr241go4qkqSs5Sg0vT2aaNtSX80LqDUAbmAvz6KauHOsFHK/jy3ry
 7Qjq8E6v5qi1B
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

C-PHY mode is now supported, so the endpoint bus-type restriction to
D-PHY can be removed.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 248aa6b21b5ad..1408e8a03f0bd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4044,15 +4044,6 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	if (ret)
 		return ret;
 
-	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
-	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
-		return -EINVAL;
-	}
-
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;

-- 
2.51.0



