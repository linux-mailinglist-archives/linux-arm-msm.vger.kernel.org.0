Return-Path: <linux-arm-msm+bounces-33713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75398996EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F265284118
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849E719F124;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0hOxmkk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5568E19A298;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=mZ9Bh172rTOZ6vxdaQrebWb88fjoqrHv3vqY2CGrZQwGpovXQmpeMJZBD7xOmHZtrPjeCnNfdoLDbv64WOFVUbjWfHSTShEIPV9yAN+fNLUBc4Vll8An6ODz6ZXEAXx9wdZtCsXxOlE63+2J1CEKaQvpeJCqatxNsOVxQ1u6rKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=pg65wunbRaHs0FC1sH4Zw3j8qL0zORmfJsIvyL4owZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ud0V/6JBou9pDEb7zBczxFTtJ3Rik/hBgSE7tbhNEiBH0TiysK7SVnB0gua7KLpe+ONYzO4W7Kb4kND1UEuf0fRXw5GPfdNCuZ9lwadpZtc1TOl+Tw0/O0idCkm7QR3k9sEEosInxpNd+p6CzpoaUDL2RlTaG9iVbMM6UuN1kPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0hOxmkk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4BAC4CECD;
	Wed,  9 Oct 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485489;
	bh=pg65wunbRaHs0FC1sH4Zw3j8qL0zORmfJsIvyL4owZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0hOxmkka1cObw053hpuU66cW+Vfr1s1K1zMr2aA7RhfYfzAmipN18PyA1QREIoSo
	 7Ea5yXf80fFvXOoDbEMAxFuif+AQTYtDl4DfjAmgNysPcHJQgvJThujN65yjFPnSIu
	 ZXpkdL0uaA8FBXTDj7LHXBZzwod3Bzq+ZfGv1PkUEoIUqFSaA2aQG0l2qa03YKgsJw
	 6Jwve5Olma+azkSuVfJsuUIYFSdUE3Id4AIsp1GW9VBzKTN9Qru55+H34DPRDM3+eW
	 yzfAXWGrsGOiYe9mCB7pMJQuvAtLOtIG1QSF5NIIGajo6bfaL6iJGEdwTwKv9cqKsH
	 PagdXEMEig45A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2G-000000004OZ-3Owf;
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
Subject: [PATCH v3 3/9] serial: qcom-geni: fix shutdown race
Date: Wed,  9 Oct 2024 16:51:04 +0200
Message-ID: <20241009145110.16847-4-johan+linaro@kernel.org>
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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 2e4a5361f137..87cd974b76bf 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1114,10 +1114,12 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
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


