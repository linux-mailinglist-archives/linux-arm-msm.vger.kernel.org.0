Return-Path: <linux-arm-msm+bounces-116997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YusvJSkDTGriegEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:34:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA1715044
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:34:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=wTRWQ2Np;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116997-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116997-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A90A03700168
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAA5435A9C;
	Mon,  6 Jul 2026 18:03:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62342EEAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:03:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361035; cv=none; b=C75e2RUHcsYCGm88ouaPUXF1RFTrX2vFT0PIXeGs2OwH9zzAFSGjF0Uw9U71Bp900YQs6wHJqy1p7r2TOKA6Oglt+ZOYfZnBU0BK+sBL4pBWkSBJTXNjdIsMhuRVWf/sdVSqnxQEdW9RdMsSpkEozaILehKVZITuEW69iuT/XBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361035; c=relaxed/simple;
	bh=VZDaZKMK4kEJKXIJDaekq8HWph4OgLHsGNpx0bYPXmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MCHdPFpTXHgjqJirFgER29ugPsOc0oUVtGbJnUYwEUxsODDUhBCWlkntBklDggfESDxlKSVjw4vM/Z/kgqRfxbG9UgXnSuzGTLJcddcwBcTz7MVsEjeJ04StXB8Lk7MNLvghJZS+K4InedEFHC+pvE25Hm9K1d+/2Xx4u8tVl3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wTRWQ2Np; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c733f15aso33513655e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783361030; x=1783965830; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5luYFUMmAggGGBEA0YYlTH7BdRmbZuziZyzSdwJJOPQ=;
        b=wTRWQ2Np6WaCMlt7TjVkhSrofasG20GHt9KIcPDUjU8l9rH7IFK0Ss8VETK/02GhmE
         XMOr8xgopWXFd3nIBaaMg6Qd5nKz4cVUdvjUvXi+4T2S9NaOOhv2pm4KuLQFPjGKPWRZ
         ftbY/OUw2tRpxelwiGc2yF0X6fKyHKBYknhTr3HO8+bSgmf0GF7ZQNSVIXu2DASnR0F4
         gwhwLzIE4C/TfL22YM1oCdDWeOOa9eWMfOwbk+kWt/mKJ2CgMdYQpx/+dELj7s3N7/CR
         e4m/95MmUJtXZtu3hWjkQMa4A/m0DoKDzwVDiMPuDJ69TGIUFVZD42t+hE37tzaFPLC/
         6NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361030; x=1783965830;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5luYFUMmAggGGBEA0YYlTH7BdRmbZuziZyzSdwJJOPQ=;
        b=ZlVfzCBrFxZM2CCgqNTlSXbqbQkc/7ve9lcee5lpHa0SPlLAaZIFl6OzKSF69cn3Ba
         6jkn2MT/Blbk2KfrNiwDAWG1nO2BbeVMLDDz7Q2KWbwO2LQ66ua75xSfrVXFdZAjnEbj
         5Nt5mzXWc1uBg0fwyO9N3NeSgcZ1KUFJfTN4GhuFuhve0V7LPK99wBBunSlGjkbQHBQ7
         64tbEYOLbo8Da8ni2BB95pSrW3ud6VuK3H0CQl6fzBnAaWUQJk1hSnBGI6UAgFWXet/G
         bAqqb2/egaCcnBAoNMszvtXIZUb2VeIE4Qo5D9HpUAdJjuoC+lHaTpwfy/kKAVM0Kbqa
         svcw==
X-Gm-Message-State: AOJu0Yxj/aR9peaKD4T2r24xzg0BxqMbxjVpeJSpe5sAMVxaDc1vdPwG
	CNn8H64m/E970ej5xxN198yum12jLCT4dCxco4t2tDOdgQMSSyVbAiIwAfIq5Ap5yR0=
X-Gm-Gg: AfdE7ckHhYAVZmXJ9hFmM0QQDoW99i946V+VUUPGAsXbIHIhf5tn7/DMUVedAyPD739
	e3X8pTY8+FtkHBTmucLtVjl/n/goQuwzbC2HhUblkZz3d/ofSm4w5ywvjWdBghZdhpyGW3qDRcx
	OF6L8qaysjlOziy/LvsTWkSWMMNv6pgSxgvUEpOTWhhRzWFwB9wDnC2Oas/73x8+RDNiBOI5CG4
	M1vrKjhJpf7uJ1ZqN83ytKtEexCEv4UyjUoH09yBrPSlp/1RG0XnX33TLTsbDr9rbwB70AioPsT
	iN9kripkjReec9kU0aPohW4jzMQ4hDqejh5UU3rRPXKgq2tOMnoFEUBS3gCn1xcVqv9d/iT8I5D
	WjXbvEbtUbVIIT27GZ8p+/yZX/0QNhibux6TfvPx1a65BE1xxpHgJFggMtwvb9EoUVshxFOdtUh
	oaH2qO38xq4byxJaaJvTNESVK4SQ==
X-Received: by 2002:a05:600c:3f14:b0:493:ad1b:b38d with SMTP id 5b1f17b1804b1-493df0a0891mr17558835e9.37.1783361030506;
        Mon, 06 Jul 2026 11:03:50 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e00bd6a0sm1109505e9.15.2026.07.06.11.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:03:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 20:03:32 +0200
Subject: [PATCH] serial: msm: Disable DMA for kernel console UART
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-serial-msm-console-dma-collision-v1-1-3179b8cb1d89@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPPtS2oC/yWN2wqDMBBEf0X2uQuptkb6K6UPSVx1Sy4lW0UQ/
 73Rvs2BmTMbCGUmgUe1QaaFhVMscL1U4CYTR0LuC0Ot6lZp1eLRNx6DBHQpSvKEfTAle3+OkWy
 nO9sMN6vvUDSfTAOv58Xz9WeZ7Zvc9/DCvv8AtxRLQYQAAAA=
X-Change-ID: 20260706-serial-msm-console-dma-collision-eb878b3f4b75
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Sam Day <me@samcday.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116997-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:me@samcday.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03AA1715044

At the moment, concurrent writes from userspace and the kernel to the
console can trigger a race condition that results in an infinite loop of
the same messages printed over and over again. This is most likely to
happen during system startup or shutdown when the init system starts/stops
a large number of system services that interact with various kernel code.

When userspace writes to the TTY device, the driver initiates an
asynchronous DMA transfer and releases the port lock. At the same moment,
the kernel printk path might grab the port lock and re-configure the UART
controller for PIO, without waiting for the DMA operation to complete. It
seems like this collision results in zero progress being reported for the
DMA engine, so the same text is printed to the console over and over again.

For the kernel console, we want a reliable output path that will be
functional even during crashes etc. So rather than implementing complex
code to synchronize the kernel console write routines with the userspace
DMA write routines, simply disable DMA for the console UART instance.

Similar checks exist in many other serial drivers, e.g. 8250_port.c,
imx.c, sh-sci.c etc.

Cc: stable@vger.kernel.org
Fixes: 3a878c430fd6 ("tty: serial: msm: Add TX DMA support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/tty/serial/msm_serial.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 2e999cb9c974..bfa44b01c3e9 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1228,7 +1228,8 @@ static int msm_startup(struct uart_port *port)
 	data |= MSM_UART_MR1_AUTO_RFR_LEVEL0 & rfr_level;
 	msm_write(port, data, MSM_UART_MR1);
 
-	if (msm_port->is_uartdm) {
+	/* Disable DMA for console to prevent PIO/DMA collisions */
+	if (msm_port->is_uartdm && !uart_console(port)) {
 		msm_request_tx_dma(msm_port, msm_port->uart.mapbase);
 		msm_request_rx_dma(msm_port, msm_port->uart.mapbase);
 	}

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260706-serial-msm-console-dma-collision-eb878b3f4b75

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


