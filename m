Return-Path: <linux-arm-msm+bounces-109462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIorAq4QEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:27:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A331D5BCB07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4F3D303E6E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BE737FF6F;
	Sat, 23 May 2026 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOK0EXvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517ED306749;
	Sat, 23 May 2026 02:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502842; cv=none; b=BcR3m7aB3sUOLxRNK+EMxw5eD3H7RqigdkmG0BxS9zC9DPMs1OaWyf9oGbOL0A6BIYZOMdnPURzcalpwwOJEQDgboImn7saiCutGINS4h+cmtUSfZchpbc3vrwVzfod39Uo3xy3LwazrIK7ABAPP9WCNe1CKG++sSHnMGgpQxZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502842; c=relaxed/simple;
	bh=WaI9cZHJ4Ng2+BH2UwkJufHIw/QTeKIjL8XWByc4Uso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibN694p4FSl6yuKYMW7oscJ4oU4vWA4qiicYVcYn8G2PI7KTmHpTQHjgi3TJ+O1rqglg7rA9ZtfCYP6ykOJjurdaJiSwwlqio5eFEwyPaQHsmont3VO2DGGkfvz+AwQzK5rfiGBLy71rZC1BSy1x6kO6NgNkZojR2L5u10UAZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOK0EXvy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7045B1F00A3C;
	Sat, 23 May 2026 02:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502841;
	bh=cBHwWlJr4hUKlV0jrnA8hVqOEFufOTtuaGLSxz86gaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZOK0EXvyjo9q7Xc7sr4Z4bNlx5t0me9Zt0RXoa9PHaC0kLh51/b8jGMRrBlee3GjM
	 P5Uj6cVDS5YGxZtNsF1xEFDA4lciMKr0HGfvTp+cdBZDzvN54uGF9o6v/7Qb4jZdcP
	 3mOaxXft3Y1G2F7uXD6Ct3QrNSGjrL9NA0W1UMDY02iY2Em7kBg3O3I3Nw6eh9nrnF
	 eJSCCknH0D1R0DeFIBmL6zqrpPt4uZTTP+jgg8TTCyiQ5V4z5q+lR/u69h5KGkMKVq
	 tRQCI5S5izB8GjFU9pZto7KeafVEuf1ga6UboZEDgp+Jqcb+eY62RlxYlTJBiGrGx2
	 Zg/a33vCXQ/Zw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on spi18
Date: Fri, 22 May 2026 21:20:06 -0500
Message-ID: <177950280366.1097700.8125828711987409701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515-hamoa-spi-can-devicetree-v2-1-d0e922608065@oss.qualcomm.com>
References: <20260515-hamoa-spi-can-devicetree-v2-1-d0e922608065@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109462-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A331D5BCB07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 15 May 2026 11:53:23 +0530, Viken Dadhaniya wrote:
> Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
> is connected via SPI18 and uses a 40 MHz oscillator.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on spi18
      commit: 181bef739979466b6ede95b34d6c94d0250b1c0e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

