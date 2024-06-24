Return-Path: <linux-arm-msm+bounces-23954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8421914EB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1111F22302
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB49C14374F;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9W3mh5/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766B7142E6F;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235901; cv=none; b=kc0XJEj42g4nxhSijNVSyf9AqPacZX1Atg9qIrz6Ss4fzMYv6pl1DPuevaAvpraGSJcBC9fhBRlKXXrhma7CUq1WMvrM6Sb50fTNlsPuXxt7Y/rdKJztyffjOwbgaYShLZtt3Mx7jAvW+caBGJErttYdUN8NkgwcBunCJssDnro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235901; c=relaxed/simple;
	bh=JT50kJAxXSVLOVDE7qwzG8MW4VwAdei3qjuQkLBLq2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYb3GdySmHFVX1gDyZWDhSI9yNqs2Hc3fnXRmFE/0FXV4LTn/1eTOMUZECjX4y6QJI/k/X3UgVZxnfy0HFY7g/jtctGQ26ii+988/60MkJNbPOFtL/NXPIWmJ2uIjMkPb5yfPJBsYzIrZ2nT4AjgxDX0ZDE2xKG70fJ7Gp7iDLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9W3mh5/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AD9C4AF0A;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719235901;
	bh=JT50kJAxXSVLOVDE7qwzG8MW4VwAdei3qjuQkLBLq2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9W3mh5/6j2/ymSepi34zTH0gKwchWbRSK39XTO5jYJpvAqt17dzFu2a0AZDXz6rx
	 cebHPWIUdsF/+GDvyoN9OE61NuAfeMVjPcG+4IxKZKMBreUUd9+3crkQpvxaLuFcvl
	 2ySztRlAr8kGuuXrWrIvmiXinBsG1gYcn+mdwyYTEP/Mo1TZn6Fdja7d5uLRflzWPK
	 +HhYkEeltBypGo+/LZoNdtwmIVN8H3E/Bv3udMJcfkfOzGsf8xik5hxqbR9DL4NJXO
	 sbLk//HCOjm4VU8dq7YB5hIPR3M/5OmLzg/FR+Tz1lbIRl5j06auNFdBobQDZIvPAT
	 ymvQ+XQDw/xpw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sLjnP-000000001wY-0gzi;
	Mon, 24 Jun 2024 15:31:47 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] serial: qcom-geni: fix garbage output after buffer flush
Date: Mon, 24 Jun 2024 15:31:35 +0200
Message-ID: <20240624133135.7445-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240624133135.7445-1-johan+linaro@kernel.org>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm GENI serial driver does not handle buffer flushing and
outputs garbage (or NUL) characters for the remainder of any active TX
command after the write buffer has been cleared.

Implement the flush_buffer() callback and use it to cancel any active TX
command when the write buffer has been emptied.

Fixes: a1fee899e5be ("tty: serial: qcom_geni_serial: Fix softlock")
Cc: stable@vger.kernel.org	# 5.0
Reported-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 72addeb9f461..5fbb72f1c0c7 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1084,6 +1084,11 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 	qcom_geni_serial_clear_tx_fifo(uport);
 }
 
+static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
+{
+	qcom_geni_serial_clear_tx_fifo(uport);
+}
+
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
@@ -1540,6 +1545,7 @@ static const struct uart_ops qcom_geni_console_pops = {
 	.request_port = qcom_geni_serial_request_port,
 	.config_port = qcom_geni_serial_config_port,
 	.shutdown = qcom_geni_serial_shutdown,
+	.flush_buffer = qcom_geni_serial_flush_buffer,
 	.type = qcom_geni_serial_get_type,
 	.set_mctrl = qcom_geni_serial_set_mctrl,
 	.get_mctrl = qcom_geni_serial_get_mctrl,
-- 
2.44.1


