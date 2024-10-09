Return-Path: <linux-arm-msm+bounces-33716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F61996EA8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B191C23050
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8181A01C6;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qa+rwKEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631BB19DF64;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=e3kMb+qv+jc7SbrMvHEfdfrY/4bR8MKcSgyxVLublLnpAvU+W5t/GiV4wXROjweVx2NYTcyzQCHB/sk2Q33m8oKQaIsIo3akTnWGgGj3Mjt42NYIPh1gJVMJczbMX1E5FlH+n48bXgYbYESMqVlifCbOvYeTQ5+UHz8bhk1Vil8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=vkgrwqXtD8jHs1HvPnaoOlMxPl4TCLbLFcFeGyGrTxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pr24SMEcBxRMxsrKI03DMjYZQ/ntqyvhZkPr0Y3PmP12uw9CTHBCO9gb92MrlCF4q9wjpTfa5gp9i1bGGdFRtF/3l9LD3TSJnaZJk+dxZ6SII27AV11HuRznxbOhmYCmxJQg3ndNQ32QF/sH5w4nC1/MQ6jlahlGNfnSdWb9+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qa+rwKEz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F157CC4CECF;
	Wed,  9 Oct 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485489;
	bh=vkgrwqXtD8jHs1HvPnaoOlMxPl4TCLbLFcFeGyGrTxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qa+rwKEzqiuQ3gOaG8J4ezvUwTiL86WA63Zu0B7O2UKw/QatnqdQ3wwf/rlnhgJDy
	 zAbnyPQyIQ4im77xUC2eXa+e0olt0/wiyA3mvIHGU9D+sbOKT7aEGh880EgnrLo4FR
	 d6b45tptEQ7bX0g6Lgs4Ne1Cz1uY4selvU4Ux/Xn8aghSLJCgHvLfIMaOvRrvAG4QI
	 OC2QRzJuJhLaMC+1B0S++OfeXwN7KtrKiRgfUm1j2dCZQ2eSuyaZVwcq4Acst7bnZA
	 u6WaxmDOJIZ0ot59MjVT8Xoth7NkWNr9+zJ0PDnzTJ8sh9T8s2QZYTB3TDFYdHRqbr
	 22qxWN5kafJDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2G-000000004Ob-3ja9;
	Wed, 09 Oct 2024 16:51:32 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 4/9] serial: qcom-geni: fix dma rx cancellation
Date: Wed,  9 Oct 2024 16:51:05 +0200
Message-ID: <20241009145110.16847-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009145110.16847-1-johan+linaro@kernel.org>
References: <20241009145110.16847-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to wait for the DMA transfer to complete when cancelling the
rx command on stop_rx(). This specifically prevents the DMA completion
interrupt from firing after rx has been restarted, something which can
lead to an IOMMU fault and hosed rx when the interrupt handler unmaps
the DMA buffer for the new command:

	qcom_geni_serial 988000.serial: serial engine reports 0 RX bytes in!
	arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x563
	arm-smmu 15000000.iommu: FSYNR0 = 00210013 [S1CBNDX=33 WNR PLVL=3]
	Bluetooth: hci0: command 0xfc00 tx timeout
	Bluetooth: hci0: Reading QCA version information failed (-110)

Also add the missing state machine reset which is needed in case
cancellation fails.

Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for serial engine DMA")
Cc: stable@vger.kernel.org      # 6.3
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 87cd974b76bf..aaf24bd037a7 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -805,17 +805,27 @@ static void qcom_geni_serial_start_rx_fifo(struct uart_port *uport)
 static void qcom_geni_serial_stop_rx_dma(struct uart_port *uport)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	bool done;
 
 	if (!qcom_geni_serial_secondary_active(uport))
 		return;
 
 	geni_se_cancel_s_cmd(&port->se);
-	qcom_geni_serial_poll_bit(uport, SE_GENI_S_IRQ_STATUS,
-				  S_CMD_CANCEL_EN, true);
-
-	if (qcom_geni_serial_secondary_active(uport))
+	done = qcom_geni_serial_poll_bit(uport, SE_DMA_RX_IRQ_STAT,
+			RX_EOT, true);
+	if (done) {
+		writel(RX_EOT | RX_DMA_DONE,
+				uport->membase + SE_DMA_RX_IRQ_CLR);
+	} else {
 		qcom_geni_serial_abort_rx(uport);
 
+		writel(1, uport->membase + SE_DMA_RX_FSM_RST);
+		qcom_geni_serial_poll_bit(uport, SE_DMA_RX_IRQ_STAT,
+				RX_RESET_DONE, true);
+		writel(RX_RESET_DONE | RX_DMA_DONE,
+				uport->membase + SE_DMA_RX_IRQ_CLR);
+	}
+
 	if (port->rx_dma_addr) {
 		geni_se_rx_dma_unprep(&port->se, port->rx_dma_addr,
 				      DMA_RX_BUF_SIZE);
-- 
2.45.2


