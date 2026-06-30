Return-Path: <linux-arm-msm+bounces-115508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZuF0KwDuQ2rTlgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 18:25:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200F6E66BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 18:25:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="EJt/97sT";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115508-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115508-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FF65300BCA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480F04779BE;
	Tue, 30 Jun 2026 16:19:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915E477E2B;
	Tue, 30 Jun 2026 16:19:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836392; cv=none; b=nnnx43bbo9rbaoJvIFPf2PnvDKhwIs7KRJrKevUkaPF7WufWAZYTt7yxbVBlQvd4oCN1tensGauVqb3E1K0kTXQGJZj9FCBp+oCbBa26RuvX4zNumetJuQ+FlWcs5CGMXY5z4CENHQrGg7xiKr1dH8KStsCadqNf1Za7Rr71ZrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836392; c=relaxed/simple;
	bh=ZhG0+t3u68UUlDYIxyFKLXlma8CFzZuuNvrORCf1RNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT8dtshsqAAF2LwnrdVIRkraGq6iVIDllic2lr1cEJMQSEGKW2djjDxs/fDi4dAb4rm7+Iny3paiAT49pnRqVK/tVYRGXlo0NttJgiovrse5sivZEICmzdoyKZWMTs+V5N0Tp3j8ocDrG70EGH1GmnNmhcofvkGcRwrkkxI7wMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJt/97sT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F2F1F000E9;
	Tue, 30 Jun 2026 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836390;
	bh=omT3sztJxXgc1myUj3jR2I68Hcn3vATp8SCJ4OAByRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EJt/97sTbGnzoDbc8gn3XJcEx1V4fSl/3qawgutaqszC6x6hPw+DMFZEFGK9ZGei5
	 NkE6E221kWA3RpostmgwCUv++C8Mzy4G9gpR97xggXe6ZDXBbPH7AOEbLOx7VjG5wU
	 lJ4O2I+tlw84iyESBbP73Bx/PXCvccExY9v4+ghjBPAp7nu1FlEfdb1UfXDuY/rgbH
	 NKqyvvzKPo/av58HwMSO2obnbN6/pGOx/1Vul4WcybT/fRRqz6qOpi/6z4vkFZRmnd
	 9FBNf5HfGHsWtWqOKCSHcVxDu6VNuMYk1LM3VMoAx8sT9RYW8ggiJiEFZ/uV4vD+C3
	 QtlGFzc8Hi/Mw==
Date: Tue, 30 Jun 2026 11:19:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
	Guru Das Srinagesh <linux@gurudas.dev>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH v4 01/19] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <178283638865.3843708.10270414669600515331.robh@kernel.org>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115508-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,chromium.org,vger.kernel.org,gurudas.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:devicetree@vger.kernel.org,m:linux@gurudas.dev,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:robimarko@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0200F6E66BC


On Thu, 25 Jun 2026 00:38:12 +0530, Mukesh Ojha wrote:
> On Qualcomm SoCs that support minidump, a word in always-on SRAM
> is shared between the Operating System(HLOS) and boot firmware.
> OS is expected to select the minidump download destination
> either USB upload to a host PC or save to on-device storage.
> Boot firmware will reads this word before DDR is initialized
> on the warm reset following a crash to decide where to deliver
> the minidump.
> 
> Add a 'sram' property to the SCM binding to allow the OS to
> identify this SRAM region via a phandle.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


