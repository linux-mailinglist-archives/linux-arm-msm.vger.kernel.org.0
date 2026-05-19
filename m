Return-Path: <linux-arm-msm+bounces-108465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBfJImJJDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:28:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACAB57D93B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC294316FA8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CDE3F7A99;
	Tue, 19 May 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWz7Kx5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A19D3F1AD0;
	Tue, 19 May 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187964; cv=none; b=o1uIAlss0TJbWqjCgrcHHYfWXPj1agKTV+4TMD4Z77Fb84n1nkX7uCmKH1AFtk456s8fjxuoKCJSF6/oj40E9a6LtdyJKC97mtO8l2RpI7tUexYKM/KRW0jPfUvfIZvDL11u6MBvvjwEnoTtSVxN9284HYgabcArkw1BNAsjdtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187964; c=relaxed/simple;
	bh=Cy2/bPs/rSok9uMT/gK2sDe+hS8oVGB88lo6zGkQOmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBhdnZ/Otf+6QzZ8FiIE+xQkreJt5gk/rVCgqFmyo1/2W8FX2izoQhmIM3b+rS8ZH96b6jjQReOh43n4g0S6UKVQBv+QGx5TrdDNi65CDLMLKzNCmGd0p3lrk5YXTuKXIRnoWC50bk8+t6FOM+5tsSyt0yoxiPsqlJuDbVZDPrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWz7Kx5T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E209C2BCC6;
	Tue, 19 May 2026 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187963;
	bh=Cy2/bPs/rSok9uMT/gK2sDe+hS8oVGB88lo6zGkQOmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWz7Kx5TVLlWVu72GY9voiMhxIyEuEm9imAfQlzZYq+bxM21xfMAVwAl3zvQbZEUZ
	 JOcHNGebtV4o6d8OG2PEuWvhTI5tMTgZywq/yvA/YTEjtAgN0I8TZinb/zOVLMpQG2
	 lMVcdeSxgb15YzHeGfpNg63ryBWav5NmIPgdlW40YXPFmn887JvuqvtKW81x/Q7qH8
	 8sLNVflNCsJ63BzbZQvdyIgX0SGpFFgeFrJSqSnQ6LDAAEIYKRLs/xTI+VbXMTxmc4
	 cHwvSyDIThKz9M+NCbVJyeSKAqU1k6uh3S80K/Xa6FQDUlyp+02SWk0/ReZbfK21gW
	 PzWbQMCgRqqWQ==
Date: Tue, 19 May 2026 12:52:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
Message-ID: <20260519-adaptable-beneficial-emu-00da28@quoll>
References: <cover.1779127507.git.taygoth@gmail.com>
 <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108465-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0ACAB57D93B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:22:48AM +0500, taygoth wrote:
> The Qualcomm PMI8998 PMIC integrates a USB Type-C detection block in
> its SMB2 charger USBIN region at offset 0x1300. The block performs CC
> sensing, debounce and Rp/Rd resolution in silicon and reports role
> changes through a single consolidated "type-c-change" interrupt.
> 
> This driver reads TYPE_C_STATUS_4 on probe and on every interrupt,
> decodes the hardware-detected role (host / device / none) and pushes
> it to a usb_role_switch consumer (typically dwc3) so the controller
> can flip between peripheral and host on cable orientation change. An
> optional VBUS supply regulator is toggled on USB_ROLE_HOST transitions
> so bus-powered downstream peripherals can be powered.
> 
> No software TCPM state machine is used because the hardware handles
> the Type-C protocol natively, and the PMI8998 interrupt topology does
> not expose the granular per-event signals the TCPM code path expects.
> Power Delivery is not implemented in this driver; the PMI8998 PDPHY
> block at offset 0x1700 (register-identical to PM8150B) can be wired
> up by a separate driver later if PD negotiation is required.
> 
> This enables USB host mode on the OnePlus 6 (enchilada), OnePlus 6T
> (fajita), Xiaomi Poco F1 (beryllium), SHIFT 6mq (axolotl) and other
> SDM845-based phones that use the PMI8998 as their second PMIC.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>

Incomplete identity.

> ---
>  drivers/usb/typec/Kconfig              |  17 ++
>  drivers/usb/typec/Makefile             |   1 +
>  drivers/usb/typec/qcom_pmi8998_typec.c | 213 +++++++++++++++++++++++++
>  3 files changed, 231 insertions(+)
>  create mode 100644 drivers/usb/typec/qcom_pmi8998_typec.c

Do not mix up subsystems which take entire sets in one patchset. USB
patches should be split.

Best regards,
Krzysztof


