Return-Path: <linux-arm-msm+bounces-30412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA635968AE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A831F22C02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC9D1A303A;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a98VxKJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2C119F136;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=J1ryzdO2OasB9N84E031gIAVa+G8nwCg5PP9z9thDrj8Wd8977LP3B0/+W95iso5quhx6dcGqUnhC+BVflIZB82Q51l24r5Cag8QxoMv0G/sgw5XWAfjLYPNR34Q8aXRWUeVSZPWWSsb58Ha6TGImCHJ1F3eqy/q/21X9pGLS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=J8laTVGLPlinWELLiAPvZYBQ7QhzLARn0Z1HPyqtgLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKNjXClaF3WsEDPygfF3zmNk+i6t/cvXoTuYAUdoly5Vip2pdHnm+MllLaMZxifJNiqJTFjVvxMUN03HF6YRcoUheWb2VaX7ZPMV8Mb8GwYph0N6i5HQwB9ntuO+YHWro7QBkLN0/JYO2J9nbNev5+EbmXWgAkV3MhKT7pjOXaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a98VxKJ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7707C4CECC;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290758;
	bh=J8laTVGLPlinWELLiAPvZYBQ7QhzLARn0Z1HPyqtgLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a98VxKJ86KTIH0lekyvOwkTqMZMjPr8BSv4hQghs0u7/IOd+ny56Jd7zhlvPAF4Nb
	 g8MitmGVcR3odE+SLQfHYbNZEZop2WyqG8W2w/SyqgzBDn/YxxBnVU1RqJ/A25z8Y9
	 fxGNh/Wt7/2dGJ50Ybc8AfMFKSfl8gyGkwBCT25O4L1bSW2OYY4kq7Ut+FEkELqZsb
	 P+jRzGheOXQc9fjE1InXJqSzeLHUF9alll5NbaWmSTt23n4DGPeRMub7ftYr/EIdtU
	 OPgahsm7Cw0CebjXXBcgoEnpkOe6NcVlw93jiVOvh27DKkg4caFcXr3nre7EIbi1vm
	 djW4T1yWSqSHA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wX-000000000Fh-1tFO;
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/8] soc: qcom: geni-se: add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
Date: Mon,  2 Sep 2024 17:24:46 +0200
Message-ID: <20240902152451.862-4-johan+linaro@kernel.org>
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

For UART devices the M_GP_LENGTH is the TX word count. For other
devices this is the transaction word count.

For UART devices the S_GP_LENGTH is the RX word count.

The IRQ_EN set/clear registers allow you to set or clear bits in the
IRQ_EN register without needing a read-modify-write.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20240610152420.v4.1.Ife7ced506aef1be3158712aa3ff34a006b973559@changeid
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 include/linux/soc/qcom/geni-se.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0f038a1a0330..c3bca9c0bf2c 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -88,11 +88,15 @@ struct geni_se {
 #define SE_GENI_M_IRQ_STATUS		0x610
 #define SE_GENI_M_IRQ_EN		0x614
 #define SE_GENI_M_IRQ_CLEAR		0x618
+#define SE_GENI_M_IRQ_EN_SET		0x61c
+#define SE_GENI_M_IRQ_EN_CLEAR		0x620
 #define SE_GENI_S_CMD0			0x630
 #define SE_GENI_S_CMD_CTRL_REG		0x634
 #define SE_GENI_S_IRQ_STATUS		0x640
 #define SE_GENI_S_IRQ_EN		0x644
 #define SE_GENI_S_IRQ_CLEAR		0x648
+#define SE_GENI_S_IRQ_EN_SET		0x64c
+#define SE_GENI_S_IRQ_EN_CLEAR		0x650
 #define SE_GENI_TX_FIFOn		0x700
 #define SE_GENI_RX_FIFOn		0x780
 #define SE_GENI_TX_FIFO_STATUS		0x800
@@ -101,6 +105,8 @@ struct geni_se {
 #define SE_GENI_RX_WATERMARK_REG	0x810
 #define SE_GENI_RX_RFR_WATERMARK_REG	0x814
 #define SE_GENI_IOS			0x908
+#define SE_GENI_M_GP_LENGTH		0x910
+#define SE_GENI_S_GP_LENGTH		0x914
 #define SE_DMA_TX_IRQ_STAT		0xc40
 #define SE_DMA_TX_IRQ_CLR		0xc44
 #define SE_DMA_TX_FSM_RST		0xc58
@@ -234,6 +240,9 @@ struct geni_se {
 #define IO2_DATA_IN			BIT(1)
 #define RX_DATA_IN			BIT(0)
 
+/* SE_GENI_M_GP_LENGTH and SE_GENI_S_GP_LENGTH fields */
+#define GP_LENGTH			GENMASK(31, 0)
+
 /* SE_DMA_TX_IRQ_STAT Register fields */
 #define TX_DMA_DONE			BIT(0)
 #define TX_EOT				BIT(1)
-- 
2.44.2


