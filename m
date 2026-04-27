Return-Path: <linux-arm-msm+bounces-104816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D7GJFa172mFEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:13:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF9479229
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 166B23048570
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8A43EDADB;
	Mon, 27 Apr 2026 19:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmrsFOaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571E13EC2EF;
	Mon, 27 Apr 2026 19:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316837; cv=none; b=ko4TdRd3tALG4BSHgIwN2Ep1dBfFaZEBjz5xm4a2cKl/RUAeV4NTpfy9FdY/Ub40PrNAPzAKrwm+tL8CUDTfbdfD+X3tSZTPxP1ZvdvzlBEFiI0eLWoADgAhbJ4jF0XpEaLVdPIuoxEwosgyARrjYeIzMJWDum+vi59TnY7zD6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316837; c=relaxed/simple;
	bh=kaWSsd/pdxM96b9Orz9WaFX538evia18hAD2SC23uFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kv9jlTdwXM85nH1A3nAtg2jujgdIg+dwDyyCbJueLm8upkacoFFd1GkUpGz4Hql6LCBf5xk3enoQ7wOf2lnrzy7t851RejqNWfW72OiZVwAAosgkqRX+rNHCKjlR65k+dgGAPndwCp6qQE/3BYQLc8Hb74qb1q9GZxsLzcwr5es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmrsFOaP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CB5C19425;
	Mon, 27 Apr 2026 19:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777316836;
	bh=kaWSsd/pdxM96b9Orz9WaFX538evia18hAD2SC23uFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmrsFOaP7VmpVt3DNsCiAVwAfIB1MFCtyt/9EKxkWnoC3wts7WfZc1n2Lrl7JIt/d
	 XvXzRzhLclRn1b8nRTpNfLUiqCfZVpHTxYgQleta3vstsN047okyGNVsV+oJ49oEa1
	 Q9WXIU1cPwkwY85o01VNmGuISK2i9rivMvXOxmZEb2BRZg3kAeIXGyhHOqgR7XSqdP
	 nsH84LpOLRlk6O1cleva1OJCDWfXGGirEFeVwdrMfvXaMKMrAWP5bwNP5tmcDiaGvp
	 iisGQxe35e4piOBp0zyjAPBJVGLMJhCE2lv3RJVWVCYTFsRi6+W7RdGBhTncmzcmzP
	 jAhh2kS1gwiXw==
Date: Mon, 27 Apr 2026 14:07:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: pabloyoyoista@postmarketos.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Richard Acayan <mailingradian@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/3] Add support and enable the debug UART in the
 Pixel 3a and Pixel 3a XL
Message-ID: <ae-zV6gtMA8LLTex@baldur>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
X-Rspamd-Queue-Id: 03FF9479229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104816-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,lists.sr.ht];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:email,msgid.link:url]

On Sat, Mar 28, 2026 at 11:58:39PM +0100, Pablo Correa Gómez via B4 Relay wrote:
> In order to get logs through the SBU pins in Google Pixel devices, it is
> necessary to add support to the devicetree, and enable the corresponding
> UART. With this code and an USB-Cereal board, I was able to get full kernel
> logs through serial.
> 
> This series depends on the patch adding a sdm670-google-common dtsi for
> dealing with both the Pixel 3a and Pixel 3a XL:
> https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/

Please resubmit when this dependency has been accepted, or perhaps work
together with Richard to send the two series together, if possible.

> 
> This is my first patch sent to the kernel mailing list, so apologies ahead
> if I missed something in the documentation.
> 

Once the patches are applied, the "Depends on" statement in patch 3
doesn't carry any value, so please drop that.

Other than that, I think this looks good.

Thank,
Bjorn

> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---
> Changes in v2:
> - Fix typo in (3/3) commit message
> - Link to v1: https://patch.msgid.link/20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org
> 
> ---
> Pablo Correa Gómez (3):
>       arm64: dts: qcom: sdm670: add default uart pinctrl nodes
>       arm64: dts: qcom: sdm670: add debug uart soc node
>       arm64: dts: qcom: sdm670-google-common: enable debug uart
> 
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |  18 +-
>  arch/arm64/boot/dts/qcom/sdm670.dtsi               | 207 +++++++++++++++++++++
>  2 files changed, 224 insertions(+), 1 deletion(-)
> ---
> base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
> change-id: 20260328-pabloyoyoista-debug-uart-on-rdacayan-next-69274358cef4
> prerequisite-message-id: <20260217002738.133534-1-mailingradian@gmail.com>
> prerequisite-patch-id: aeaea0c438bff770d0c4c33d937db5706d642daf
> prerequisite-patch-id: 11ce654ef61d48fdebf1c4e1d9d184cfb7bcaa59
> prerequisite-patch-id: c6203c8a71fe103b983b6ba5fc99a22948118fb4
> prerequisite-patch-id: f9ff17c7e4b4396850f51e45249d2f6e35df3725
> prerequisite-patch-id: faab09f9fe421a6358e5512c6050dd70d3271273
> prerequisite-patch-id: adb88e3ddcbe33db1e3fc60ea4cb195dac18a8b4
> prerequisite-patch-id: 0c8f7fc0835cdda72529fcfa7b654bb97109fae4
> prerequisite-message-id: <20260310002606.16413-1-mailingradian@gmail.com>
> prerequisite-patch-id: eb2d2be6edae3d09973b49f3ff6c48fa0845e7e0
> prerequisite-patch-id: e6d9e56eaeceddee68d56e2ec8ac20997bff52c9
> prerequisite-patch-id: d5e2975adf904bf656827100df7989218ac9e963
> prerequisite-patch-id: 04478351b1304dfe1357d176c8d0c235346ca40f
> prerequisite-patch-id: a54db56ccdf1491c46158a84ac1cae70f74bb36c
> 
> Best regards,
> --  
> Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> 

