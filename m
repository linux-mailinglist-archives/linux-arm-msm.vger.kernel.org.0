Return-Path: <linux-arm-msm+bounces-31119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B10AF96F51F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673DF1F248EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B4E1CE71E;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRUcpMXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132D71CBEBC;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628499; cv=none; b=b1eup7Gkl+eJ+IcAvNVbIldWyLkphcp/RN9hARYsSlkaVOaaew+RotiAnHwaF8N+I983hfCbSF0BD9b/0FVBkhJCHMISAvOnIVCJZtpETr23GOiMGi1BKunAVhOUi9KNbZd9KfRzTRD3NePu7Tf0TKsmqdqb/3lzu52gT1U8Yug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628499; c=relaxed/simple;
	bh=uETuHjFu0CoXVLoeHxFZ1qxPWkCWtwZT2Bq3e+jgwPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H5FHOeLGDWYDeEbt/3UaUuacvdrcK+WTwXiu47ONSLeGGt1brXACcHNFE7d9MGkT/nKuleB96jB8W88hjCr++st/Aj2wq7ZXZjTRUMa+bUQG0MpF9u5Cci0dH+EmMfjp0qK8vMcxwyK59hPleNTlCr1plnXPjXF0CiyxZNyyIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRUcpMXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964CEC4CEC8;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725628498;
	bh=uETuHjFu0CoXVLoeHxFZ1qxPWkCWtwZT2Bq3e+jgwPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRUcpMXBkDcFKCPXlsR5GkNyvCI+N3fqALSfXBIjJlfW2G098nyZXtKNkqD6d9VD0
	 VmH81reDQYG0DhsaybwOuRweMn4s05sq+pxSY2GTwLyHmZSdsYDcJ+4MeddGOjDM55
	 4SxHipI7VouaQnn5+oiSzkHb+YMlgUUVj1J8fZnRa5tp7PCjRkgHVn2lDvTTzHRO/X
	 qjS98xS54X/aYH2eWbv898bNYDoTyw4MvFhs4BSB0sagTgfrG/Sr4UeTDjpVptI1jb
	 kW2HmTelG4aW5BPod9WgYrxtWF+v7EMHa6HUKU9qVsEDqVZ0ZAOewdsrqN9wGAZlF4
	 V8cPqtTC4xdTQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1smYo3-000000006Ak-20vh;
	Fri, 06 Sep 2024 15:15:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 5/8] serial: qcom-geni: introduce qcom_geni_serial_poll_bitfield()
Date: Fri,  6 Sep 2024 15:13:33 +0200
Message-ID: <20240906131336.23625-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240906131336.23625-1-johan+linaro@kernel.org>
References: <20240906131336.23625-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Douglas Anderson <dianders@chromium.org>

With a small modification the qcom_geni_serial_poll_bit() function
could be used to poll more than just a single bit. Let's generalize
it. We'll make the qcom_geni_serial_poll_bit() into just a wrapper of
the general function.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20240610152420.v4.5.Ic6411eab8d9d37acc451705f583fb535cd6dadb2@changeid
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 54052c68555d..7bbd70c30620 100644
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
@@ -286,7 +286,7 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	timeout_us = DIV_ROUND_UP(timeout_us, 10) * 10;
 	while (timeout_us) {
 		reg = readl(uport->membase + offset);
-		if ((bool)(reg & field) == set)
+		if ((reg & field) == val)
 			return true;
 		udelay(10);
 		timeout_us -= 10;
@@ -294,6 +294,12 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
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


