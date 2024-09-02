Return-Path: <linux-arm-msm+bounces-30407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E9968AD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB159B210B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE07183CD4;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pK7K28xj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001E41CB501;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=u5UtS/532kwcH3eTZPjWe6tJud/Jl88u3UwMbJj9lyzswQGsAR42AhKGJd9MhYMpSvkbPShCNTu6eU1WLG5rFDrDS9mbwoHORdX1GFMslJaC1v5Gj9TCo+s9esasEYUozdLfvY8Ic7vIuP6dHqFm00FghppQxzT1NfyOltO+454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=6qwBsSCf/GtWxgFU1QkqVQnuxGm40YTcLu2qd495UNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gb9ftEh1Yz/khREI6aKS08dOaExYlagStqcW1avphxOlSje88uI22dPDkWzwPbJfOcI/uE0mc0HVtgDMSo3YkFvR+wJOMWnp/tifQ7ydv+3k0v+kjpfdUq7alBNzP5mKB3g3uohoWv75JaAKUWi5oIlx9t9TA8vGqnBf0u4pSnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pK7K28xj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB326C4CEC8;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290758;
	bh=6qwBsSCf/GtWxgFU1QkqVQnuxGm40YTcLu2qd495UNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pK7K28xjwPNKuYZW+2t5hexUwGT65M4ApJQFfDLKmjHBZI+vI7PUUzTb0A0ZaG+me
	 0JeeLO6r4P5aPxvZF2tNWB0ICnrKvL0FMo4k7I/pbVw7h8KLiKYM47q/LVqrgZ9Yse
	 UjR+nrm3KKdMQPQ3Xc1iNXnepnuzi09UfLLDK5NVfdjw+H2FWOz/W3UX0raUnr+WQh
	 FBb3G43IMbg739ObOeE4kOtOu8dYGIhgUea6c/1SB4GyjgjBLDjyaIb3XYodzPmrRJ
	 z4gbxrqo9oQxB05E6aG9J9lFgf4VQAMcfg1pNUIcp0AiNb2P5p55AnCWbrfazyu1h0
	 KgI9KYpeA7soQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wX-000000000Fm-2gkU;
	Mon, 02 Sep 2024 17:26:13 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?=27N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado=27?= <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 5/8] serial: qcom-geni: introduce qcom_geni_serial_poll_bitfield()
Date: Mon,  2 Sep 2024 17:24:48 +0200
Message-ID: <20240902152451.862-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902152451.862-1-johan+linaro@kernel.org>
References: <20240902152451.862-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Douglas Anderson <dianders@chromium.org>

With a small modification the qcom_geni_serial_poll_bit() function
could be used to poll more than just a single bit. Let's generalize
it. We'll make the qcom_geni_serial_poll_bit() into just a wrapper of
the general function.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20240610152420.v4.5.Ic6411eab8d9d37acc451705f583fb535cd6dadb2@changeid
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 4625a2e5ebfb..7029c39a9a21 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -265,8 +265,8 @@ static bool qcom_geni_serial_secondary_active(struct uart_port *uport)
 	return readl(uport->membase + SE_GENI_STATUS) & S_GENI_CMD_ACTIVE;
 }
 
-static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
-				      unsigned int offset, u32 field, bool set)
+static bool qcom_geni_serial_poll_bitfield(struct uart_port *uport,
+					   unsigned int offset, u32 field, u32 val)
 {
 	u32 reg;
 	struct qcom_geni_serial_port *port;
@@ -294,7 +294,7 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	timeout_us = DIV_ROUND_UP(timeout_us, 10) * 10;
 	while (timeout_us) {
 		reg = readl(uport->membase + offset);
-		if ((bool)(reg & field) == set)
+		if ((reg & field) == val)
 			return true;
 		udelay(10);
 		timeout_us -= 10;
@@ -302,6 +302,12 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	return false;
 }
 
+static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
+				      unsigned int offset, u32 field, bool set)
+{
+	return qcom_geni_serial_poll_bitfield(uport, offset, field, set ? field : 0);
+}
+
 static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
 {
 	u32 m_cmd;
-- 
2.44.2


