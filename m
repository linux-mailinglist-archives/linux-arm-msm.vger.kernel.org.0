Return-Path: <linux-arm-msm+bounces-32878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE698BCC5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DD8AB248A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99501C3F3E;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drdYBiEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6866E1C32F7;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787071; cv=none; b=hCO7Y1ogZ3OH/0MOz78STE/rWZFBvsSz0sAHYa4XxhjlkcvFyfBx9fwQaVP++J/EIqV4OimHdN+gEgooP3tBT/V26aXg8IG5dHjftCV3LJwJ0UKGZSxu8Dd8ZuTja7fThOJaCr9c6xOG0fHp7XQ190gx9RrwZnKafVqs3GWjjGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787071; c=relaxed/simple;
	bh=/3Y1QtQb1qYiCWkwzBK4UiZggYkQeDFvwFs2e86pxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heax1woyLAKenvVAX2KdcP8gSzO+WY1U9UoK14FMihM4Soi6FLDD0QuF6AdQeQUiATnSCUSs+iaSTGh4T7izz2rJTUCvUgmezz7LtEJ0VPp2lk+uAFvSnxfT7mO4dLLTBirS6ovYZ9BzzYCfUqD0v+Z0uGbGrQta9UfQoUgmn2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drdYBiEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAA1C4CED7;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787071;
	bh=/3Y1QtQb1qYiCWkwzBK4UiZggYkQeDFvwFs2e86pxBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=drdYBiEkAI74sbF73h9gFzv8lqUrYS+lyoAXrmj1BU3tTZuZAYvdEXSC0MM9Zbd+7
	 EbrYcgE3LK9amMdajvAHxx7KYAx45yE2J3mMUhs488TSALG7HzHvtYXaeHzYChLMV/
	 dWdlKhObrTBgxa3A07byY9xweulQjw75ukl6n6+hVCrXiSDKJzD2gpe7XGwvEmI73B
	 Gk6knV6ePAXmUrB0s7XGHW8lfG1jjiP71d0uwWmlOH7ZdvjAbWCgYNjzDSpmZMCOQ3
	 sech14LPgQiW56YRbD9kcL5+C469MUxFSAYKvUG57Ba7zesrSEr7hYqmAfuqfkd6FF
	 dZyFJEddOynTQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svcLP-000000002mR-1g44;
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
Subject: [PATCH v2 6/7] serial: qcom-geni: drop flip buffer WARN()
Date: Tue,  1 Oct 2024 14:50:32 +0200
Message-ID: <20241001125033.10625-7-johan+linaro@kernel.org>
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

Drop the unnecessary WARN() in case the TTY buffers are ever full in
favour of a rate limited dev_err() which doesn't kill the machine when
panic_on_warn is set.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 5b6c5388efee..8bc4b240bf59 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -570,9 +570,8 @@ static void handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 
 	ret = tty_insert_flip_string(tport, port->rx_buf, bytes);
 	if (ret != bytes) {
-		dev_err(uport->dev, "%s:Unable to push data ret %d_bytes %d\n",
-				__func__, ret, bytes);
-		WARN_ON_ONCE(1);
+		dev_err_ratelimited(uport->dev, "failed to push data (%d < %u)\n",
+				ret, bytes);
 	}
 	uport->icount.rx += ret;
 	tty_flip_buffer_push(tport);
-- 
2.45.2


