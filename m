Return-Path: <linux-arm-msm+bounces-33720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2312996EB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 472F0B2214C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B8E1A3029;
	Wed,  9 Oct 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYVTBUtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322D1A0B0E;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=qr+tyuzuPEWOK5FE0ZkDtJhvYvb9JtvPtLfUEFVJZmVRZPGCUatq09fC44hyWaQ7rX2GH+pmrcVzhie3cMns2VbZTrqRzc+Xrfd/QktKNJLzLN1Se1/v57oAEo3G957d5pPoFPDLoGW73R/T4hc8LCh9xGePEfNpvWurHDjhQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=zTNuSmS2bXWBPJ54yuFv6Uyyngn/rp4ZjYaJOdvz+Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbL+XV5zcim+4j2llgrkw+B7nezi6pEe7wlhixxT4KOvtlrtJlg/S3IFiG/p1rjA/5N9Kxq2J22RsUteW0RKCBvbGCyK4kxDClNfx/FfPUNQgibwMZY5A4CiWGcsPdHa/5gtDforohxszkEnvKzmg3Ua4BnZZX7lFL1cBC6YW6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYVTBUtm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8C7C4CEDF;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485489;
	bh=zTNuSmS2bXWBPJ54yuFv6Uyyngn/rp4ZjYaJOdvz+Ik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYVTBUtmyXRqXmJ6f69XAeTNSgHwKLEofFYvHNj7+8RkTuF0wY501ONV447mpOvMV
	 Z4l3AxSpiWVFqitfxI/6GLw96q8Uabu7gzYGrMmlDIxU5vAQrAEV/ukVnmRfOwOIEZ
	 Qn9OV2/s2o4bw5dk7mBUjWMqX8xKesuYyO8xiW5NL6c12HCDbZYOZqDqBpEdPGMbpV
	 QBSqsJCtmB9bvHEySQolfGUrIzCkCz+rb+cGt/TrgXEZH9fqT9Y2S2Fj1+nbcQ3ZVr
	 YrFbtEPSWyAt/Q2VmofUFARZkvzstPnE9nylQoSO+Owjgsk13F1JvhLlIHS7NAzPLl
	 ztBHemp315rZw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2H-000000004Ol-11L7;
	Wed, 09 Oct 2024 16:51:33 +0200
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 8/9] serial: qcom-geni: drop unused receive parameter
Date: Wed,  9 Oct 2024 16:51:09 +0200
Message-ID: <20241009145110.16847-9-johan+linaro@kernel.org>
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

Serial drivers should not be dropping characters themselves, but at
least drop the unused 'drop' parameter from the receive handler for now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 22e468065666..9dd304cdcd86 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -580,7 +580,7 @@ static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 }
 #endif /* CONFIG_SERIAL_QCOM_GENI_CONSOLE */
 
-static void handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
+static void handle_rx_uart(struct uart_port *uport, u32 bytes)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	struct tty_port *tport = &uport->state->port;
@@ -873,7 +873,7 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 	}
 
 	if (!drop)
-		handle_rx_uart(uport, rx_in, drop);
+		handle_rx_uart(uport, rx_in);
 
 	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
 				  DMA_RX_BUF_SIZE,
-- 
2.45.2


