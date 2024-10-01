Return-Path: <linux-arm-msm+bounces-32874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEDA98BCB3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B86DEB24675
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688EF1C32F8;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOmPsqE4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2F61A0AFB;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787071; cv=none; b=MJam2Oz39iIoqPKB0N2+wltP1rvGOZnbcEARskuvNqW98Z06B5jJGC0OSlpTYkp4RNvqudhCTqTeI1dGDsQ2tu38UQ/0HwWJ774wki++8pBupiESQxsxjX5ebt916lTHcXh4aNEegQgTmH4dZzWMCKQfuj/Wj2ReKyX9hmgFmOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787071; c=relaxed/simple;
	bh=1YDwGAT9d5r98sjNJsTBq19sCn2srPOrFhzzQ2PFT4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwtFN58nKDwIBe+vamZZZh8vbWnI/YBfiTrMzLhnnmZmt6GPCWyCb2Ks8FhhL4xq586pYrcKGl6U6dacBv6A8f1hI9KJLLoqjApNekvGWrJyUNr7ZBLeY8PSEYGdOBGC1tZ12FKpcncDothuhl0mA4/h5vCXtCSmMzOjYM13f6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOmPsqE4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DC3C4CED2;
	Tue,  1 Oct 2024 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787071;
	bh=1YDwGAT9d5r98sjNJsTBq19sCn2srPOrFhzzQ2PFT4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOmPsqE4C9yMR0T+4SsdeQy8l8gyG69CDCXCf9GPGrhCEL24IU58+GD/WGfOHkRgZ
	 mXnVzNpvCdiZ0vupH/ykosXZvXU5OSDiSaXWOzK2ggnIq0er7jG1w/i965NCPgW/Wx
	 UfDKvfo9YVA+/xDMawhReIXJNo8p6rKwqFGkmMEf2jKDB+wiaTJqNsccIYpLTf10BZ
	 vF+QWFipc1ZA7slXIwyKZR1GAXmsJ8wpCBPjuxjQl3gxGYMKyvEgIZEHbOQ7//a63p
	 7FbSIe34mRysEH5JEKIi4X9iiTHn6XyQDj/ij8bG7yK1NejlcNUFrzKXQRztqepfEH
	 7emdrcOEkLOog==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svcLP-000000002mI-0SiE;
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
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 3/7] serial: qcom-geni: fix dma rx cancellation
Date: Tue,  1 Oct 2024 14:50:29 +0200
Message-ID: <20241001125033.10625-4-johan+linaro@kernel.org>
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
index b6a8729cee6d..dea688db0d7c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -787,17 +787,27 @@ static void qcom_geni_serial_start_rx_fifo(struct uart_port *uport)
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


