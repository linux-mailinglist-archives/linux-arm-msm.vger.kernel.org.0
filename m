Return-Path: <linux-arm-msm+bounces-116827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iVw7DWSoS2o/YAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:06:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9021711056
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:06:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=MMUj76yf;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116827-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116827-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D76353607360
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC1A420867;
	Mon,  6 Jul 2026 12:55:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AD642086E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:55:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342541; cv=none; b=tHXheMm39sJ9AuYCbctp1uRab6HraSwDIpiOEeowfrJY16QRBWkkn0OrZmk0IceDD2aydY9RDLyvT8M890rGtdsv6E4nlfwaSPwy2rwXql43LfUyz/DP5De/5Eu7nC1VWU07V5xHVXu6Sa9EwbP7U1wXGMuhe0rGPVf91Eoo7Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342541; c=relaxed/simple;
	bh=bT+72sp86CIVIp/ogp9isiWyW9mszXa47KCTY8allM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKoWzKVDfDFD6+JiiuLOMo4jHl8sQKKGjCoD6z1m7OPpJShDszfkII2xcPXGOH5l/ZGLqu0gJ4bxehn7rOagrIEP11kZGgmvwzC9QyhtB9zrqnbnFcD/X6ntxn25IO0/OxSecPIZ8AnUXVUyGLTp6mNVzlvVq5ybnz34vQF8nhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MMUj76yf; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1463768f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783342538; x=1783947338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qF6R64HmcT1c2a3xEhtCiEIwl/af807a27WtqelA0FM=;
        b=MMUj76yfCLTiRtx5Ir6Rh2186YluuIkSQgyEMLvFSYXkczgMoFLGCMMnmaY0uY0SeD
         8RY+ECBhdxzTS9AXNG+yU/uhfVmU/wl/Jja6sjNT/0FE4xnHcV7pHTCrE2F9y4Yy5Avu
         gFGQ/tjhuug7Bmqjp5N2FDc1jUmzD1a3OEfS7q61WxqMpHx6rQTpZs7UT9jxdAB1UF3w
         LNOtrTDXtbxh6ArBhE6o1IbivSudMvfia8AIT9/59E9jPPegqdzHBpIvgVgeDrgFn4eU
         lZYqNYcolOdOTXdfqWS+C0EVmeV/ZPnfrGBrCHGw81MEjwgHA1FCBFXzkCb4+uWdvw8J
         nZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342538; x=1783947338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qF6R64HmcT1c2a3xEhtCiEIwl/af807a27WtqelA0FM=;
        b=qOsYleVih54TKW2FZeXPwxCGAWpX71fRqwGwwKyDef/XxbX6pa/rzKrsKgm87fpWvs
         3gPzw67HMnR5MIjXb0DOB3QhQ1tvn0W84L/abKM1VLzdZ/KDiV9vC2VD4LsPBrG/gKW7
         kkJuNp9kSTGm2Ngvg50dwWfneW2DkvREnMcguHmkZoR8jP0iL/sPPGnsBPNsNfFmDibH
         eRDY0Ud6YocxALMOtYOY0/8T5dd/3lgcihLos6GSKXHVZTtkcsBiGSAnf19SK8rBpVWf
         y7zPKSKVWmd8l5nZzWLPDlGdnWthVQDXfflVdC/peZ2j4hWNY8uCIYKMw0c2mT1mAhMo
         8LEA==
X-Forwarded-Encrypted: i=1; AHgh+RqmiE0ZhRqn9u+2MbEtNaXv24NSe2qCyPFaoZZPtHDsZf38WXNa6fxkwicrUrcCzJUn1tc22AsUTfdRDwLg@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQ24SjJIR8GHQ4DagjtbpL6HKW4sUGhak93h1F4cZ5UXD6Mpc
	IrxPzv0+T+AfWyc+girASolZHwa9ORwi3/noLw8745aCdUdsmx7qU58X1t4MMWb61/E=
X-Gm-Gg: AfdE7ckvMQNlQP2Oa0i+SWIrrpjaxHW9lAaSZPF7sWfDtf/d2gZMeuQsSdviycV6PuC
	O/aH3HJMo10H4BM/6e7j3S01o/6lmedSErf3bjskXLhdb8uka4ZKyKXx0HQJMbjy+UZpSs3HeHK
	uNuT+eNeGIQ2Kld1Oy7R0JR1JhryH0Y5Ru06NuaseklshwMyHjFlDMgCPtBPUpYpLOpKwQvfk4c
	EF02EA/URYbcalbV56VSIe8hFAuV8q1T0ZNMg93wccl+xqQpIyEvixu4PA6IiWiEUD04zKjzrGt
	VTb3I8R8/6LFZqX0iqqpvqGAfeS/ox1asWozBdfv4qGpAkh/E/Jj3AHINj6RkV+COfAfVYywp4e
	eylXNVK8FzPA401lQ7OTopu+TF01Xztl78XpJkWAgxRUwCrRAdh+oOW6ltcY09eyhwEwOOmU+FB
	6PT90BJyZ5hNOONiMK/KsIXRxX
X-Received: by 2002:a5d:564b:0:b0:470:2fb1:3dca with SMTP id ffacd0b85a97d-47aac5e17damr8744560f8f.30.1783342538035;
        Mon, 06 Jul 2026 05:55:38 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm24762493f8f.15.2026.07.06.05.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:55:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:55:26 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <akult0UUSSwKQ8F5@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116827-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9021711056

Hi Miquèl,

On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> > is missing the rest of the hardware changes in QPIC v2. There is also only
> > a single clock that can be controlled using the RPM firmware. Document and
> > add the new qcom,mdm9607-nand compatible for this setup.
> > 
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> You could ammend patch 1's commit message with the information I shared in the
> reply. But nevertheless:
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 

Do you want me to resend the series with patch 1 commit message
adjusted? There were no other changes requested as far as I can tell.

I think the current commit message there is fine, especially if you add
the Link: tag during applying. The extra context will be there.

If you want me to resend, I would just replace the second paragraph in
patch 1 with the following:

---
On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
(ahb, core, aon). However, the access to these clocks is restricted to
the RPM firmware that controls the shared power resources for the whole
SoC. The clocks cannot be controlled separately, there is only a single
RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
The only exception to this are some IPQ* SoC that are not using RPM,
there the clocks are directly controlled by the kernel via the clock
controller (GCC). Require only one clock in the dt-bindings for MDM9607
to avoid having to define dummy clock entries.
---

Thanks,
Stephan

