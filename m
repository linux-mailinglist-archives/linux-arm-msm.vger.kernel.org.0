Return-Path: <linux-arm-msm+bounces-25211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B996926A39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 23:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F7251C220C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 21:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA242191F90;
	Wed,  3 Jul 2024 21:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exalondelft.nl header.i=@exalondelft.nl header.b="cegEaOyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailfilter03-out30.webhostingserver.nl (mailfilter03-out30.webhostingserver.nl [195.211.72.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7E186282
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 21:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.211.72.164
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042105; cv=pass; b=aY+1ONEX/gXbm0jEq7vGJVPXY2LDxbbZjTjLeeEH1G79fM19+YL6Fn6DWwqTZfSxvbNUrPMKtmW7V07hJ1DD1LIOVxOxaAWSXsvojLWh5ywrqtZV+xH5jz8hxd6tyYSLCef3HVifbEjBslhewuzTPcmXUcqe3/Y6iftIrb+OdW0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042105; c=relaxed/simple;
	bh=Lzr/U/qKnONsBIfrOpzHoAvCwRD3pTy9JeYEDVNUKpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rW2ejCSoROr9VGhjGDAnYsgn6bWdFnJ9G+ADReEWZ4QhB9uovgAQiqCQZ7QsJXnxwzXzvExBxDVOzI5QuId16VrExZvqcYQv4CQ1DQoszo+VaWmzKCwK1rHQvJc7278wA42r9qaLnF1n6lUkainBgG6FqitZ1D+V138XBYbNC9A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exalondelft.nl; spf=pass smtp.mailfrom=exalondelft.nl; dkim=pass (2048-bit key) header.d=exalondelft.nl header.i=@exalondelft.nl header.b=cegEaOyM; arc=pass smtp.client-ip=195.211.72.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exalondelft.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exalondelft.nl
ARC-Seal: i=2; a=rsa-sha256; t=1720042033; cv=pass;
	d=webhostingserver.nl; s=whs1;
	b=tmUNeLmp+mvw2XoHIqFvjKueqOF2Y9EmvWhGiYt0Z0ESP3wwRZZVUmGKHVWVtlA+E3Ir/IQvgwzZm
	 W+uCqVH2icFheuth3M5eYU1JsnIlfp5X1VscFxi7kPjNQ4zbzZRr0aS/SbRNTsfYI957q6OQMZEjg7
	 DSekKxml7vzttqkVLgu2PLICVnfLRS7BotXXXfyDCtGHdNrLIYTLnddtimByb2X5I4p+1mI5F50pmJ
	 OeRVcKCK3A0PCvMmTEURgJmVrXlVwN/PGGscvxnj3Vu0cbgpkuRVtKof94rx0PqBagoNOS03Blyn5y
	 3PREs0NX5Nn0Opn6j/1Fs1NTjQaEf9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
	d=webhostingserver.nl; s=whs1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 dkim-signature:from;
	bh=PaY4INhElQh8/bXzT7uDWTqQXybclID2iv+hsZtCnWw=;
	b=sk0mZ3cmyQofEMrUrdi1y744Qyxxy+Trl685Nsz/Qv13ikGP6ZrbWk6iLWjdPfIC0q6W2zatAvg86
	 XRFWytylrRTkWkykwP0Yj6Pjk1dtmSubJNOFTfZQcQ28mFybdhYBpm4hkXBaMLt8CG57lUMTBYTZ28
	 bEJHHHxF19ycTCQtv/WwSrqrdy+Y6/CuROEIAgkHhxrmOtBC/2s1qqxouXqF5MNS1tuMwtte1g2MdW
	 a6iDOx0+5pJF6phs1eX7SdWIdTCXnpenmQeM+G49oGWk0HPIMZmT2sMRPRnByLHNeJO0nCWk5QqwuM
	 6uRI2f+QTVdV7KR5aG7LlmJAbKS1Png==
ARC-Authentication-Results: i=2; mailfilter03.webhostingserver.nl;
	spf=pass smtp.mailfrom=exalondelft.nl smtp.remote-ip=141.138.168.154;
	dmarc=pass header.from=exalondelft.nl;
	arc=pass header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=exalondelft.nl; s=whs1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=PaY4INhElQh8/bXzT7uDWTqQXybclID2iv+hsZtCnWw=;
	b=cegEaOyMQrcQzAFpISnntR0AP6FXwM7nUfJPILRNXLUtMhwKym0QowEcfUkd9qivS64ngtJ6lmj2Q
	 tPh+fmd1TP31u7wH/ByloBMtooPo6TJuq8ytIX3MhpKsGmZFJ1fXtjqq1MmF/s9ExUJeb6CGKpITTq
	 +UdBf9UmWkzXS1sQ5wlh155Jl2AZqfX3cHCI2DMQb9FLED0lmPod10X4SB1EWekHKPH2g9UCGQWg25
	 qJB5WFHqVH+t5iZVUVCmuc1TnL+IfsA/6z3UCRjMDijyEMw2S0PLOAWgRRXZzH/9zOj1lvI+XL+Qm+
	 mjJ2dM17WyHE3E1CefLb18Q68I+8Zbw==
X-Halon-ID: 00a1e1b1-3983-11ef-b271-001a4a4cb9a5
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
	by mailfilter03.webhostingserver.nl (Halon) with ESMTPSA
	id 00a1e1b1-3983-11ef-b271-001a4a4cb9a5;
	Wed, 03 Jul 2024 23:27:08 +0200 (CEST)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=webhostingserver.nl; s=whs1; t=1720042028;
	 b=w6uZ5pl58x6/D4JL6lkxYe1ddu7EpXNtcji6KZWzgXtHDjcdmoNp3ib0yuXKP7V00Kki8QtnzJ
	  JszmtbRpoFqR09Mouzj8a8QSqmMCojwmwXNxpRTi2Ze3NNzF/w013KY8czyzh5mZkFM5uKRQCa
	  dY8+Dl87dWYxRIYA6lbfUR+M65ZoVIFwb5Wqh6rPCppHJxRKXLR3K4h3JRPWQVSysv2DEWost2
	  Wr9RgMUXhJRR8Pm9jafMgEUiBt4Rr03ieE5Qk7xZ13K5WXtojNQDsUOzYGEvo1SUYw7P6VIQIa
	  erzHtyJkaTaHgN5V3slR6ZO5GwNMkHPOh3LB0y/AFWLdRA==;
ARC-Authentication-Results: i=1; webhostingserver.nl; smtp.remote-ip=2a02:a466:68ed:1:46c9:4818:36c:3aae;
	iprev=pass (2a02-a466-68ed-1-46c9-4818-36c-3aae.fixed6.kpn.net) smtp.remote-ip=2a02:a466:68ed:1:46c9:4818:36c:3aae;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=exalondelft.nl;
	dmarc=skipped header.from=exalondelft.nl;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=webhostingserver.nl; s=whs1; t=1720042028;
	bh=Lzr/U/qKnONsBIfrOpzHoAvCwRD3pTy9JeYEDVNUKpI=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	b=O3TKpDHQ+bl+w2US9vaXuM2LgwTQT01FydvX4BETgWU7wEmUkRmZ5FTt8pmYbFtDZ2/C0rzyAL
	  pWrcP4nrhJ59EMHboZGxOnd1GJUKUNwH+O86lfZ2CtxqKMVYH2LJy4FnqtYENp8hyEsF5j+YS+
	  03+OyUKd/I/ViC6gpDrjLfOdhAaAzrYCF5isNzS4p0Do6Kl5D6ShISBp4JygM6f7740gBlflmq
	  dtLuqYJu7vKMKHrvtTpOcvLXY+tQ/NIy6gACwHqDGgsuvAP+zy+AUv5xPDPmYX8z1h5mYU13tx
	  y2v0+6Ck+DkHqodMOSw5y9XpvHCXhVsNiMff5ZxbcOSxjg==;
Authentication-Results: webhostingserver.nl;
	iprev=pass (2a02-a466-68ed-1-46c9-4818-36c-3aae.fixed6.kpn.net) smtp.remote-ip=2a02:a466:68ed:1:46c9:4818:36c:3aae;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=exalondelft.nl;
	dmarc=skipped header.from=exalondelft.nl;
	arc=none
Received: from 2a02-a466-68ed-1-46c9-4818-36c-3aae.fixed6.kpn.net ([2a02:a466:68ed:1:46c9:4818:36c:3aae] helo=submission)
	by s198.webhostingserver.nl with esmtpa (Exim 4.97.1)
	(envelope-from <ftoth@exalondelft.nl>)
	id 1sP7VL-0000000CSYn-23jx;
	Wed, 03 Jul 2024 23:27:07 +0200
From: Ferry Toth <ftoth@exalondelft.nl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ferry Toth <ftoth@exalondelft.nl>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: neil.armstrong@linaro.org,
	AlCooper <alcooperx@gmail.com>,
	AlexanderShiyan <shc_work@mail.ru>,
	AlexandreBelloni <alexandre.belloni@bootlin.com>,
	AlexandreTorgue <alexandre.torgue@foss.st.com>,
	AlimAkhtar <alim.akhtar@samsung.com>,
	AndrewMorton <akpm@linux-foundation.org>,
	"AneeshKumarK . V" <aneesh.kumar@kernel.org>,
	AngeloGioacchinoDelRegno <angelogioacchino.delregno@collabora.com>,
	BaolinWang <baolin.wang@linux.alibaba.com>,
	BaruchSiach <baruch@tkos.co.il>,
	BjornAndersson <andersson@kernel.org>,
	ClaudiuBeznea <claudiu.beznea@tuxon.dev>,
	"DavidS . Miller" <davem@davemloft.net>,
	FabioEstevam <festevam@gmail.com>,
	HammerHsieh <hammerh0314@gmail.com>,
	=?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
	ChristopheLeroy <christophe.leroy@csgroup.eu>,
	ChunyanZhang <zhang.lyra@gmail.com>,
	JeromeBrunet <jbrunet@baylibre.com>,
	JonathanHunter <jonathanh@nvidia.com>,
	KevinHilman <khilman@baylibre.com>,
	KonradDybcio <konrad.dybcio@linaro.org>,
	KrzysztofKozlowski <krzysztof.kozlowski@linaro.org>,
	KumaravelThiagarajan <kumaravel.thiagarajan@microchip.com>,
	LaxmanDewangan <ldewangan@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	"MaciejW . Rozycki" <macro@orcam.me.uk>,
	ManivannanSadhasivam <manivannan.sadhasivam@linaro.org>,
	MartinBlumenstingl <martin.blumenstingl@googlemail.com>,
	MatthiasBrugger <matthias.bgg@gmail.com>,
	MaximeCoquelin <mcoquelin.stm32@gmail.com>,
	MichaelEllerman <mpe@ellerman.id.au>,
	MichalSimek <michal.simek@amd.com>,
	"NaveenN . Rao" <naveen.n.rao@linux.ibm.com>,
	NicolasFerre <nicolas.ferre@microchip.com>,
	NicholasPiggin <npiggin@gmail.com>,
	OrsonZhai <orsonzhai@gmail.com>,
	=?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>,
	PatriceChotard <patrice.chotard@foss.st.com>,
	PeterKorsgaard <jacmet@sunsite.dk>,
	RichardGenoud <richard.genoud@gmail.com>,
	RussellKing <linux@armlinux.org.uk>,
	SaschaHauer <s.hauer@pengutronix.de>,
	ShawnGuo <shawnguo@kernel.org>,
	StefaniSeibold <stefani@seibold.net>,
	SumitSemwal <sumit.semwal@linaro.org>,
	TaichiSugaya <sugaya.taichi@socionext.com>,
	TakaoOrito <orito.takao@socionext.com>,
	TharunKumarP <tharunkumar.pasumarthi@microchip.com>,
	ThierryReding <thierry.reding@gmail.com>,
	TimurTabi <timur@kernel.org>,
	VineetGupta <vgupta@kernel.org>,
	MarekSzyprowski <m.szyprowski@samsung.com>,
	PhilEdworthy <phil.edworthy@renesas.com>
Subject: [PATCH/RFC v1 0/1] 
Date: Wed,  3 Jul 2024 22:56:36 +0200
Message-ID: <20240703212613.56024-1-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ACL-Warn: Sender domain ( exalondelft.nl ) must match your domain name used in authenticated email user ( ferry.toth@elsinga.info ).
X-ACL-Warn: From-header domain ( exalondelft.nl} ) must match your domain name used in authenticated email user ( ferry.toth@elsinga.info )
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus

Since 1788cf6a91d9 "tty: serial: switch from circ_buf to kfifo" serial 
transmit when using DMA uses kfifo with a SG list with a single entry. 
This obviously lead to 2 separate DMA transfers when the buffer wraps 
around.  

On the receiving end depending on the UART the receive DMA might 
terminate when there is a moment of silence (an interchar gap) of a few 
(typcially 5) characters length. The receivers FIFO will help to extend 
that time (depending on FIFO length and threshold).  Currently high 
speed UARTs (HSU) can have baud rates of 3.5MBd which means terminating 
a DMA transfer and handling a receive interrupt to set up a new DMA 
transfer has to complete in 180us which is hard to guarantee. Especially 
under heavy interrupt load.

As most serial protocols will transfer maximally a buffer length at a 
time it makes sense to eliminate the interchar gap on buffer wraps by 
using a SG list with 2 entries.

The following patch has been tested on Merrifield (Intel Edison) which 
is slow (500MHz) but has a HSU that can transmit up to 3.5MBd.

This patch should be viewed as a preparation for a follow-up patch that 
remove the interrupt on the receiving end entirely.

But first I would like to make sure that: 1) either all users can 
actually handle 2 SG entries 2) if not, get your advice on how to best 
make the number of entries configurable per platform

Possibly on RZN1 due to aa63d786cea2 ("serial: 8250: dw: Add support for 
DMA flow controlling devices") we might anticipate problems.

Please test on your platform and let me know  your suggestions.

Thanks!

Ferry Toth (1):
  tty: serial: 8250_dma: use sgl with 2 nents to take care of buffer
    wrap

 drivers/tty/serial/8250/8250_dma.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

-- 
2.43.0


