Return-Path: <linux-arm-msm+bounces-32879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A898BCC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6876A1F24C10
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6821C3F3F;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVBqjVPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A91C32FF;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787071; cv=none; b=lg+z58IY/Q23rItS5c9fB4UU0Of1ErjO08tRGbIKQmJrglAQGbv8z1bSk6sA3rshu17J3WbpiZ8YK1CNsaO4wi63e00ZRh6fAzos1RwlBj/vj3bUSk3KUTkkKXQrJsZh/jW9WOV+OvmM6/6AYu7ZY/OhNEf1wucLMr8esAJgJKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787071; c=relaxed/simple;
	bh=Kp3teGk4rjGOq/WkTqWVcLgkD5aACFrNaTM4GdXjOIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPWqSbvRAG98C9hH7llNZN01MML9yCKZw+pgYKVBNh/V1m83rtimD/Jxat1DBAAMWpAjQcEvxiHPmUOZpt8o5xeVv/yxhV24xcPmPm5n4bXwt+JPb3PBOCwF3Qd6ARE1Kh9i+/xlJm8In+N+xblnFAOXeRwJ4mRDbdxGCD/ExJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVBqjVPJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAC6C4CEDA;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787071;
	bh=Kp3teGk4rjGOq/WkTqWVcLgkD5aACFrNaTM4GdXjOIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVBqjVPJhpe3uvE0x4f9BZmni1qn4VvRXm7FYMK7T0O5VylDMR1iUF9c+sjcpHsEF
	 kMHP8Yrfa2i8ZERgBzfUzFumZYyCN8lhvNxDjQpRyGzf5sHW6IeUO611N/Wk+bQr9l
	 UFSJCy8uES93mJlJ/5LZcLFzecqBLBHR4IsvMoYyTVC0DCOapSuiunpdvyYcDu8xrx
	 SB5SngYQsfmmRHP3THrzU/7n2w946WV2fMxAJOV19lWiOM9/lzZJdRF3qk4/WLVl9J
	 ZVTNhKh51Dkdg0ZXDcHjTwYftP7PlQfuZxtl/ZRLfBQ5b8CwHFV5o5J7gH5zIYhAr+
	 LudOLBZ7iKLHA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svcLP-000000002mN-1G3W;
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
Subject: [PATCH v2 5/7] serial: qcom-geni: fix rx cancel dma status bit
Date: Tue,  1 Oct 2024 14:50:31 +0200
Message-ID: <20241001125033.10625-6-johan+linaro@kernel.org>
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

Cancelling an rx command is signalled using bit 14 of the rx DMA status
register and not bit 11.

This bit is currently unused, but this error becomes apparent, for
example, when tracing the status register when closing the port.

Fixes: eddac5af0654 ("soc: qcom: Add GENI based QUP Wrapper driver")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 include/linux/soc/qcom/geni-se.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index c3bca9c0bf2c..2996a3c28ef3 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -258,8 +258,8 @@ struct geni_se {
 #define RX_DMA_PARITY_ERR		BIT(5)
 #define RX_DMA_BREAK			GENMASK(8, 7)
 #define RX_GENI_GP_IRQ			GENMASK(10, 5)
-#define RX_GENI_CANCEL_IRQ		BIT(11)
 #define RX_GENI_GP_IRQ_EXT		GENMASK(13, 12)
+#define RX_GENI_CANCEL_IRQ		BIT(14)
 
 /* SE_HW_PARAM_0 fields */
 #define TX_FIFO_WIDTH_MSK		GENMASK(29, 24)
-- 
2.45.2


