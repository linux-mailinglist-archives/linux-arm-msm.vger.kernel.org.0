Return-Path: <linux-arm-msm+bounces-31855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8897A6B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C888BB2382E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8FD15B13C;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCILYzyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CDF15AAC8;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726507623; cv=none; b=N+QALJEmLsNYUW5eNW3zUBzH5Z2Wa344e/PSfuou9KX8stPfgOXCWOQqCHYLcU/4aL3zfe+x63xenMHLvkTMjGplo5LkCzdkU0/YP4GeipHu2KssIWoJUVLzUnHu7xbhrZHLu/askWRg3pJvpN8n9BmPnALZiZVH5yx9Gc6tXkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726507623; c=relaxed/simple;
	bh=2FOD8FiK/h3Ovv4JzXzrjDug1ahckongn7Uoo/tlsCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hczvPHjWXJhBCZoRSfdBZzo5I+sVztay5F91Bd8B6U8eXBretLeRwhenTJcgPi06i0R7pT45yF6eoTht0JC1iTNIrDD3maa5GyM4dn/gLbvXCdJPsgD5qa3vxEPMoB5cIOqWT1QqUK1TER5+7+XFPWK0/jXD6cXId5dq66qHjSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCILYzyJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F05C4CED2;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726507623;
	bh=2FOD8FiK/h3Ovv4JzXzrjDug1ahckongn7Uoo/tlsCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CCILYzyJy0okcu+ucr1B9N9/NeNLkJOfwsqy1AG+ux/93td6XQJ91fLZn5/DvkxSF
	 FpkE4ewwjbXG+Dkreo3v1Ax9Y24yPz9m6mpax6Vj7pUPnb4qGC7xO6cGNJj9L0wnzJ
	 w/mMfnLmw0o566dgEROs62skvKhHogeMpPWwzkOg+33mmyIFpBrABiV7CTr2XqHz23
	 MyUHWu6tk2WCdfcJkisI96NK4qCE50qm1aADnEWvXUfoNkj759pW7rhS5RY9dWnciS
	 y+JCrom25qx4sfhdXm63bmV+xBzefTyJsFZ7nQdA+eEJPvr1WGdFQ/eTu0lG1yZ8FI
	 hYSYUrXRYxWOg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sqFVS-00000000236-3osE;
	Mon, 16 Sep 2024 19:27:22 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] serial: qcom-geni: fix shutdown race
Date: Mon, 16 Sep 2024 19:26:41 +0200
Message-ID: <20240916172642.7814-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240916172642.7814-1-johan+linaro@kernel.org>
References: <20240916172642.7814-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A commit adding back the stopping of tx on port shutdown failed to add
back the locking which had also been removed by commit e83766334f96
("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
shutdown").

Holding the port lock is needed to serialise against the console code,
which may update the interrupt enable register and access the port
state.

The call to stop rx that was added by the same commit is redundant as
serial core will already have taken care of that and can thus be
removed.

Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in progress at shutdown")
Fixes: 947cc4ecc06c ("serial: qcom-geni: fix soft lockup on sw flow control and suspend")
Cc: stable@vger.kernel.org	# 6.3
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9ea6bd09e665..88ad5a6e7de2 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1096,10 +1096,10 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
 	disable_irq(uport->irq);
 
+	uart_port_lock_irq(uport);
 	qcom_geni_serial_stop_tx(uport);
-	qcom_geni_serial_stop_rx(uport);
-
 	qcom_geni_serial_cancel_tx_cmd(uport);
+	uart_port_unlock_irq(uport);
 }
 
 static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
-- 
2.44.2


