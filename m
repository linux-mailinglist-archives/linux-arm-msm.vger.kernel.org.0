Return-Path: <linux-arm-msm+bounces-32876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3F98BCB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF751C230B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACB41C330C;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDJQW6zT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3FF1C245F;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787071; cv=none; b=UEulrr7toOsCCsr1RZg6ymHs3Fw1iI6Q0wUMEzPkF6IGkk1P6Ejj2nHf09Xi7kzuOUEuYQuDU046evnNoaPpkN06PAiaeon/nBkuaAzuI2Ql6HZbm8DZNZduME0WSu3Ah6otnuwlThaJQ6ev/G7iS6yvdjnWw05UVY/ODkF3Qww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787071; c=relaxed/simple;
	bh=hPaxSeDJ1aGZNJvz+/cNIjIukyj2Wnde/8UoejTcVrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qo6tqgik5m/3KRjSp22tm4ncdBHnbjJOlabBXInWwYqZr6srlNg6iBQ3svUmWZ6jatQM+UbyORsWRyMvEFzNQac0kRT1nHS4K/xHtjFeDRL4F45KdZ5GiMuy3v+yQCSs0A4QeqZe7OmSJDugFiYTnmhkuRy/LG0nU3OqhF1u7s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDJQW6zT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9F4C4CECD;
	Tue,  1 Oct 2024 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787070;
	bh=hPaxSeDJ1aGZNJvz+/cNIjIukyj2Wnde/8UoejTcVrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZDJQW6zTJQc78P6uzypLd8EsVnn/frB19SXivNy4Q1Yi0dtxCVVVvnSNrdfs7bdXI
	 ptXiMgbKysxUp/t9M+T4UviRa/sBJbBiFBHJZey9whRi6eVqwEZJt8VdkLuhWwpdMS
	 VXWrXbSyBxYZ+kW6+g3iwbfxPe8woAemB2KNmlPgnMMl5B4cGl19Qi3N8OECno5T+j
	 m6P9LdzdNMMKebIpumtu9lF0sIR7uGZMTKvWkCPVPGB9TNQ/LVV71t59rwCJF+bcoq
	 kPtjPYLlDZCH28TuadXJo3Dzc7wF66BS6Zwwwg4dAO32RPa14MPOmnzn09HZW8KeNF
	 kXOYy4HvfZhqw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svcLP-000000002mG-02ff;
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
Subject: [PATCH v2 2/7] serial: qcom-geni: fix shutdown race
Date: Tue,  1 Oct 2024 14:50:28 +0200
Message-ID: <20241001125033.10625-3-johan+linaro@kernel.org>
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

A commit adding back the stopping of tx on port shutdown failed to add
back the locking which had also been removed by commit e83766334f96
("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
shutdown").

Holding the port lock is needed to serialise against the console code,
which may update the interrupt enable register and access the port
state.

Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in progress at shutdown")
Fixes: 947cc4ecc06c ("serial: qcom-geni: fix soft lockup on sw flow control and suspend")
Cc: stable@vger.kernel.org	# 6.3
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9ea6bd09e665..b6a8729cee6d 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1096,10 +1096,12 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
 	disable_irq(uport->irq);
 
+	uart_port_lock_irq(uport);
 	qcom_geni_serial_stop_tx(uport);
 	qcom_geni_serial_stop_rx(uport);
 
 	qcom_geni_serial_cancel_tx_cmd(uport);
+	uart_port_unlock_irq(uport);
 }
 
 static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
-- 
2.45.2


