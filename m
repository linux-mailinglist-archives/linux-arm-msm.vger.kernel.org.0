Return-Path: <linux-arm-msm+bounces-45695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDEEA17E85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 14:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E20D216B33A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 13:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9720B1F237F;
	Tue, 21 Jan 2025 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SMDboO55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7ED1F1308;
	Tue, 21 Jan 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737464932; cv=none; b=PR0HCyRJ4rkNwwXmgr/wF69Aug9pb4cTcqn8HWi2R+fr+kJfKgCOeoxN5b7G1ayxvucq23gPJV2KpB9PJGK+we7F+B80QPqKagboLlslG+XerAAqIEM23npHyA25GP/JJighvo60UexH40OIllTKWqvQDHSUbDBNvJMoF1gi2Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737464932; c=relaxed/simple;
	bh=0vBnWY+vSaYG+sEPtj0fGlKB5ScwDOe+r3qnqBDFnBE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/MZoHvHamyFtFA1rq9REfdkJIwdOzLkRUjT6jOoJABd3+MqvjNvDRY7LaQF+LJAmxwuS4DWFkP4LpULbMaZbRX8lXaRmYTwuu0H5O/W7I6/DucKOLU7Upq7Acq6Fvm1Nk54cHq3GkoGfWZMr3YxUK4M2R8Ix0FWTbPtra1Fx6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SMDboO55; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EE2040009;
	Tue, 21 Jan 2025 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737464928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il75rMT0w7WTkKxYVfwvba2fwzPLmWHPL1i8BZIxLOA=;
	b=SMDboO55VeXLOhdnmLSX/T4/NgRLenuWdo3wC8VmF3yKhXnBb+H2k3FDKDDlCipf0foJqm
	NIPGdoTw4bCIE6Z+QjEPlKxN425MXs2+bmuVSKZNbrDTOPenmuF1xqoeK/MzlhYLwf2nGE
	MYdz978SMSg1YpvyiN1wPsUQNIIO7iWsD3ZDlYTuH1g7q/aJHj7Cjf2c9ijkYDjKPfxFia
	8dLDqtKxcTG8ca0X6G119mu6LVR6HBYCpS4izqstRRMZ8PhATz+hzx2AEGiwvTnbtmW7Jy
	/vNYZE32/MRATqTpKs03Aj6eA/r/woYAnM17C+fsBFGLjsgH/KAG4ZhM82joMA==
Date: Tue, 21 Jan 2025 14:08:40 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Richard Cochran
 <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: net: ethernet-controller: Correct
 the definition of phy-mode
Message-ID: <20250121140840.18f85323@device-291.home>
In-Reply-To: <20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
	<20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com

On Tue, 21 Jan 2025 15:54:53 +0800
Yijie Yang <quic_yijiyang@quicinc.com> wrote:

> Correct the definition of 'phy-mode' to reflect that RX and TX delays are
> added by the board, not the MAC, to prevent confusion and ensure accurate
> documentation.

That's not entirely correct though. The purpose of the RGMII variants
(TXID, RXID, ID) are mostly to know whether or not the PHY must add
internal delays. That would be when the MAC can't AND there's no PCB
delay traces. Some MAC can insert delays.

There's documentation here as well on that point :

https://elixir.bootlin.com/linux/v6.13-rc3/source/Documentation/networking/phy.rst#L82

So, MACs may insert delays. A modification for the doc, if needed,
would rather be :

-      # RX and TX delays are added by the MAC when required
+      # RX and TX delays are added by the MAC or PCB traces when required

Thanks,

Maxime

