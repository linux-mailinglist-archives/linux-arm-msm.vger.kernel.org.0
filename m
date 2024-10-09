Return-Path: <linux-arm-msm+bounces-33715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F449996EA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A1F283FB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F0D1A00C9;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoryG9Rx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6320719DF66;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=Xm6itTZE9mub5xFfN54MMd1kgHZYkBsWdviOz4sMXvTIpj4317NYM0UXTctW5OmtNDT2OPc+cudfZtaZnFPl0Q6oWZT9sahhOpXXnIbrBiXkSbplrwrJquuyqL1Ts2H/00DuMQJB6xKO8Xz+5K1T+BGjUAt2uOZOKEvdALpnefU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=8X8bYgJ/bLzXHmg7ansb2AVdDbQ7EA4mcg+m5MbuV7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3/sfC+h5bn6rplZcDFNrKW5DTquriZGEhcVlbEIU18ewFaNK4eb5WDaV+cdOBQl7A5wHgEvd2FtdgyQ6xOXtYCQwrkniHGgbfp0f6iLde46QoaL4XC6jfukDbun7Fowyjeblip/00LeWTmBySwmwNdNvyJz8vZnUXcOtAi8o98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoryG9Rx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CDAC4CED2;
	Wed,  9 Oct 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485489;
	bh=8X8bYgJ/bLzXHmg7ansb2AVdDbQ7EA4mcg+m5MbuV7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DoryG9RxInL94A5z7rXV1h7bntGYE5nUkl1AUvYrgBSRWz5TCCsoernFQHUvNYgzb
	 xYFVzr0Tft5VTdop3DvhbHd/My3Zy5S3bFgGsN4zsxt7TY0dWDXxE6vNRN7lMCUuwZ
	 VgtLAqEBI5G9ltX3+cYaFa2oHAJeiCTAYN28nVu0ycGyATodnx5N9vqg5rasUxji1H
	 zgkxSTfxNzHKQ1OUqgDfKfxC7/VWinbX19lz/dKvuphMwVmYWgOAaet8UrynlV04T0
	 Gl+8ZzGwHRVmeYsYPaZ6clQrnEH7vb0cVvxmVDE/tmAvBWXFsIH3jyTl2z+FaLim5z
	 x0Vi4cLJyI1dA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2H-000000004Oh-0NSf;
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
Subject: [PATCH v3 6/9] serial: qcom-geni: fix rx cancel dma status bit
Date: Wed,  9 Oct 2024 16:51:07 +0200
Message-ID: <20241009145110.16847-7-johan+linaro@kernel.org>
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

Cancelling an rx command is signalled using bit 14 of the rx DMA status
register and not bit 11.

This bit is currently unused, but this error becomes apparent, for
example, when tracing the status register when closing the port.

Fixes: eddac5af0654 ("soc: qcom: Add GENI based QUP Wrapper driver")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
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


