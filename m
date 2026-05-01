Return-Path: <linux-arm-msm+bounces-105510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKqlKaDN9GkAFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C0B4ADD0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C21623022402
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D26B3D9027;
	Fri,  1 May 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="U/FsVG6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15363D8900
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650888; cv=none; b=aA4RxpHaM4Pl03qlZcBzZU6wiXXggJ7EuHM9AoLj31zf8XM7ln/283kZL1jqtXZRQDBpDshDCG0tvMqwec5ta2P69zDY+rnhmBFLAPbAT1aTyyWHjTJqP2BZNVH1JW+e2g3t23/jj4IFtPyZE7+aonzdSrsITy4b8jgh8BqTckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650888; c=relaxed/simple;
	bh=rWJMdH+guxvVRg/fYfPqNZhV8vkxgoYK2GCfMJpBrRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkyOm5Zfc85eV/+x1t43/ZAS9+v1J0/qkcrRw/PDShZ1sYrcFMLBzn/+m9stm2Vo07cybEEc32H5IN65mVqxDb44/JfvboBp6RMnNWvCmrIm2p3QDpFoXafz45cg01FRiME7hSDSoxolyhIrO63R8Xfwj+tK/HKIMXXUHlpcuDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=U/FsVG6P; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50d6b9bca48so26156651cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650886; x=1778255686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJZ0RqgIk8/DP02YY4aEMI6Gbsvdjs3yNWLkzeFClOw=;
        b=U/FsVG6PzyZt6PaiHwol1aUL60lqQbkzo/5IRLlwPh/F+u9Q6oJpp406tWYXgCB5xq
         2sOnKYSK1tZTXw1E7WCFzXPVm2984ZKyN2dKc2NcleWjXoKRc67HNhuPjRWkR5c/HH5D
         uOXdYVzfHdC5rkwrDRvQ4VaZyRh/McRSXU0l5usj1yR8wLlrs/r1gx2KZvNrztV3Sxbs
         1WhLNM4+MITbHZRfcCAa9dM8esWiT4DIbxkPmd1n/WD2sDyc4NJzhH/4ALY7goLcCPUx
         3eOQm8sSfdHkdcl8Oj6UFDiE8EP7YAuN1Jrd6S9c5W+2SKmVTaCFJ6n7AfqrjeiIb8SM
         x++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650886; x=1778255686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJZ0RqgIk8/DP02YY4aEMI6Gbsvdjs3yNWLkzeFClOw=;
        b=ZsxUxiEaRGKDzkrTqaTK3n2Tv10A7Bnoy05XEC3WZlKfD/YBW7gW5TUOCThk2dliSI
         TlEcK0iVWa5/62Ny5zv5ie6NCaroYCsKP9VQbiJq+jyBN8yL7l3Z0RlGkA3D4w7Bxv5M
         t1elQ8dfyD9RpIBNilQQ8IwzuFeAaInF92w8gNO28rhlegkxbzpCvhz4/u9RT5fAkkcG
         ALddrjPcWOE1yBXA3vqVNjgiMHlEGrK58BOnccit/X7heK80wuRr1AX8cQOrWI1Cu6VU
         zAYuoYsUF0MRWu2Hhjcr9rUc6BD41H3fqpuv8Y5PpvL/xSyzdsWkmyhJFDOOC4jKgatN
         bRaA==
X-Forwarded-Encrypted: i=1; AFNElJ8Al+YlGtXRV9hyCrTAaNgE1wH/OybkPiHIUzeyXFGRW5GscSmpWFtux9tPmEAHrFTytaXMZGbfRDc1726b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PIAP8q/v2LgNcRMuRzEikBxwfNQv7sZWjMoI7aCE52RLnf1T
	M73b+4cF1pqwp/hZp8JKzXK5PlougwrQvfi5lX76Y1BQq12C0kZgJlCPIITyI5YXuv8=
X-Gm-Gg: AeBDietqU3NwjApCdWdXL+Gc4JAPvydYNicUMb+14V6cSXez9D6DzVdkdIfY6mOK0kr
	iARIY4So1woqIOHWw+Gs1oOucKUt0W9vODBOWoUZL6cquJ2pQC9ZtFUwue424hSATJMD6RZIraU
	lADlghhxG/aj18SjidmyGNozKqKnJZSvn9Scvp+Vx1uSkzT8HHXr44yg5WTF76xP7oxXlKHjlE5
	0EEAZGK+c/a1/izf6ygwVT1TfJSDKFivAvzgSTht3ql2zN4y1lFMGiux2w1VOgih6BT1TnIX/hp
	D4kwOIMZLFPovKn3YtRzjX267S1osP1brddkrEV1kVef9MseBlSizZJwsG23hJ2BYZ+1BN9csuU
	6QjXTMFUCPElAL7cOHy5jVw+Nef2lCMcDHWVvWyeEuqoQ2km+64khtYXs/MZ+oZTBdI9WW4pm9O
	veLYs9VhQIyl1N4sEV1Kh++BZpA0VRQbAlB54vCUHBJW28qnwxEcQ4zEIE6G0XkasCFBoemArzf
	toDZA==
X-Received: by 2002:ac8:5d07:0:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-5102a940d0amr119383461cf.0.1777650884691;
        Fri, 01 May 2026 08:54:44 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	matthew.gerlach@altera.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 05/12] net: stmmac: dwxgmac2: Add multi MSI interrupt mode
Date: Fri,  1 May 2026 10:54:13 -0500
Message-ID: <20260501155421.3329862-6-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C5C0B4ADD0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105510-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_GT_50(0.00)[50];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Daniel Thompson <daniel@riscstar.com>

Currently there are no XGMAC platforms integrated using the multi MSI
interrupt mode. In other words no existing driver sets both
DWMAC_CORE_XGMAC and STMMAC_FLAG_MULTI_MSI_EN.

In order to support systems that do enable both options (such as the
Toshiba TC9564 whose driver is currently being developed) we need to
add logic to the XGMAC DMA callbacks. Happily we can simply
replicate similar code from GMAC4. Let's do that!

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 51943705a2b03..9b0b5cc619556 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -320,6 +320,8 @@
 /* DMA Registers */
 #define XGMAC_DMA_MODE			0x00003000
 #define XGMAC_SWR			BIT(0)
+#define XGMAC_INTM_MASK			GENMASK(13, 12)
+#define XGMAC_INTM_MODE1		0x1
 #define XGMAC_DMA_SYSBUS_MODE		0x00003004
 #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
 #define XGMAC_RD_OSR_LMT		GENMASK(21, 16)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 03437f1cf3df3..a84601ac32153 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -31,6 +31,14 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value |= XGMAC_EAME;
 
 	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+
+	value = readl(ioaddr + XGMAC_DMA_MODE);
+
+	if (dma_cfg->multi_msi_en)
+		value = u32_replace_bits(value, XGMAC_INTM_MODE1,
+					 XGMAC_INTM_MASK);
+
+	writel(value, ioaddr + XGMAC_DMA_MODE);
 }
 
 static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
-- 
2.51.0


