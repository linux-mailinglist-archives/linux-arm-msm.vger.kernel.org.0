Return-Path: <linux-arm-msm+bounces-25261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FAC9273D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69D70287191
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9801AB905;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HN+qGK3n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8BD1AAE1A;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088361; cv=none; b=Bhya0ty13+tVIhVxDTeaWKtNrHcIRZ5zHy0LCXOu0yo6/0Qn9D81Mxa4pKBWc/i+sb6wXr7838pBqL2l38FrePR4QNNbWr9cLg+8T4puTTX1WbqXHwi/+/wLbXTlRJ2r/6tc7Q/rz5IS6zBNGwgW1qYCC91j/0kIAqdvuQA0Wcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088361; c=relaxed/simple;
	bh=ReEZb7hAFfQAyy9IF/NSMp6O9E23hw+JmMg7zAegyBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvrQPAHKCE9v7wgo1/+S0FBdTIC17uSaVF9d1eOONYgyu1P7iiMjqvRmfwKvgNrB5UFqLbYa9T8UDIpd40S7yXQ39a/WryUO/WOdA+SV/9lo8sjGtfSi2zV37L1dZHHymujuMdYYgLIY/qLTcef5brWhCyM58+322lM4VeG/B9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HN+qGK3n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AEBC32786;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720088361;
	bh=ReEZb7hAFfQAyy9IF/NSMp6O9E23hw+JmMg7zAegyBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HN+qGK3nq80EbYDzuiWUPl+mScDHcNU/L1vkwylY5w0ddAnOJd3vn58ldxl+DOgZk
	 ur/xnGPfbGM+/fff/1H7sdwCCRc1I4Os2uAc4/4jZrWBdxQ0q5w4AWkuo/WskCw8zO
	 8FoR5gbSU65hsQbHmTU58bvr4ThxowMXpCGWK3WFkFZlKcHS8GyJduxwzS+bYbUdQ0
	 wqgvmDgWu9xyLGLXSOZTU9BFb/70RvAefiTiyWuYNttUfYAeuhF+M/JRMNhixtqCgC
	 9C+iLx0yo0fLblgDQFYVtmfwe0d4IEKZh+XlZAFfKpbepKwMod15vl28G5BkIInQPV
	 8dEMhGT3bBI1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sPJYf-000000007zR-1RhI;
	Thu, 04 Jul 2024 12:19:21 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 3/3] serial: qcom-geni: do not kill the machine on fifo underrun
Date: Thu,  4 Jul 2024 12:18:05 +0200
Message-ID: <20240704101805.30612-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240704101805.30612-1-johan+linaro@kernel.org>
References: <20240704101805.30612-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm GENI serial driver did not handle buffer flushing and used
to print discarded characters when the circular buffer was cleared.
Since commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
this instead resulted in a hard lockup due to
qcom_geni_serial_send_chunk_fifo() spinning indefinitely in the
interrupt handler.

The underlying bugs have now been fixed, but make sure to output NUL
characters instead of killing the machine if a similar driver bug is
ever reintroduced.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index b2bbd2d79dbb..69a632fefc41 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -878,7 +878,7 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
 		memset(buf, 0, sizeof(buf));
 		tx_bytes = min(remaining, BYTES_PER_FIFO_WORD);
 
-		tx_bytes = uart_fifo_out(uport, buf, tx_bytes);
+		uart_fifo_out(uport, buf, tx_bytes);
 
 		iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
 
-- 
2.44.1


