Return-Path: <linux-arm-msm+bounces-32880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14B98BCC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF343285817
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6F21C4600;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiFd4R1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF751C3317;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787071; cv=none; b=f8oF8yGgRmOX22FJHBp1T0HN9DcKl3RGeczUMntxOOv1ZSBcw7XeQbJ6wtnzN24vvZZUTWmcmsC9xTTLur/4mvEzSXYxVaaYB75OZHZfVzHp+K3pIN2XwyJjUWJDkzHHzBvRbtPyttthurH2hp3M38OU+w/l81Op83hb3udH4QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787071; c=relaxed/simple;
	bh=8cjBwVE6o2FcnHOa80+/400/+iu70ZSyEBWqXZ6ATdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzX5FuI9WF69UVQgtgm+JUKeI2Xx5H6dBz/CEYqK1R/O5sXn37R4JqnI9rSUrEKwre1lhx0tmTTgShrk2IIltPqqo5ivXq+zUlAX55GwrMjd5jAyZPVg0kVwW3z5vbPv/nww5Kxqap1D7Yj9S3OHdlg2BYfIrsBrOGfyW1OgwKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiFd4R1T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF09C4CEDB;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787071;
	bh=8cjBwVE6o2FcnHOa80+/400/+iu70ZSyEBWqXZ6ATdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IiFd4R1TuTPnAN1+gACi2ZJdi7dWK4LSz+Z9pOo6XX8n8BptvPCsx1qAH3Ap20tVw
	 WmINjEt8hNG/1lE93sC8sNDF7RRFEgKIQxkpvwLKy6DTOV6mntxCMUKw7BWDiuZKz7
	 fohKmBozc2mKDMpk1R1Qc9/gUXMe1HVY8/v91OenxjRJJTGt84miw6rsrYB0OdcOJo
	 GTbvP4UgYvCzKd9SIj3tDpDhUd0wJL+zL7rGsESDIPYrb0V499LOavAf/2n9WMP6BE
	 v48fBzQAw4Cn/yagdqAzToywuHa7Dweh5OxxAVp8I54SxvbFA9nEza4CETciOD0YZI
	 LGQ7GQ5nyddQA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svcLP-000000002mU-23Hc;
	Tue, 01 Oct 2024 14:51:11 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 7/7] serial: qcom-geni: drop unused receive parameter
Date: Tue,  1 Oct 2024 14:50:33 +0200
Message-ID: <20241001125033.10625-8-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001125033.10625-1-johan+linaro@kernel.org>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Serial drivers should not be dropping characters themselves, but at
least drop the unused 'drop' parameter from the receive handler for now.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 8bc4b240bf59..daa852785bd9 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -562,7 +562,7 @@ static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 }
 #endif /* CONFIG_SERIAL_QCOM_GENI_CONSOLE */
 
-static void handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
+static void handle_rx_uart(struct uart_port *uport, u32 bytes)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	struct tty_port *tport = &uport->state->port;
@@ -855,7 +855,7 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 	}
 
 	if (!drop)
-		handle_rx_uart(uport, rx_in, drop);
+		handle_rx_uart(uport, rx_in);
 
 	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
 				  DMA_RX_BUF_SIZE,
-- 
2.45.2


