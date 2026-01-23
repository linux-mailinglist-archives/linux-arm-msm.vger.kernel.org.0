Return-Path: <linux-arm-msm+bounces-90358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOhtOEaGc2krxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 15:31:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 599077717B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 15:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4DCC3009E2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77808311C1B;
	Fri, 23 Jan 2026 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8swj7uh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F6C2D46D0;
	Fri, 23 Jan 2026 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178575; cv=none; b=LVNdpz6CHWOtFHbE6Kf65e3fZeXWAcOYE2FWAnLXzHumCMYXISciDQcAZg+J3XaKT4LCYa1g+tLgTkxzwoKkAp0NLGf37J1He3ooZUcrwuRuLk2pJVa9mzhTXYhYeyA1XStH04i1hDTu2bl+Ea/OwxtaCFcHpnhpvVnYlLCWggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178575; c=relaxed/simple;
	bh=CWwrxCccaDd6tWjNO0YYNQkWyrXaWDMiXBQCBbD0+UM=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iFnuyV/oQC6QyEfJuZN8lFhRFJrrahDdY2sUMx4/b1/k0wsIkJqbbsCFYLz0fWtEwpN18kWZUcE5G5k71lve3AKB9hrLNxXXpnK5nBkiXWJXZ/0Smo8iydkLm97FuR40YnfiwQTxeC8aYz46igQQPPXCqcNGWv4NnwJ0lT8trUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8swj7uh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAF2C4CEF1;
	Fri, 23 Jan 2026 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769178574;
	bh=CWwrxCccaDd6tWjNO0YYNQkWyrXaWDMiXBQCBbD0+UM=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=B8swj7uhHge2a3QHVT6kkd6OCmMVhCTMfhGmX4OKe3yePPbAh21x5uOx/Datp9BP6
	 FoymYVGsbI1j9bdnUmoGTkCWseRdq2fUyYMjpyjBl0Tbn23hEdobIy0kE51dRjmmzw
	 10x6sf4XFluE2G68Igu4UWwZrLgoO3sDztqXo4D/IPcTmj9JWpztQ6wH0w/TA2IaMm
	 GzzwmmKPXI8fECA/ksozSY5buZC9pKMxvlYKrBmp2nXoDEs+VPA53K10U5mtKLPNls
	 fxv9qZ9bAmQmpdboQ2M/9xbURxulw/9ITZ8Ym2tziBIVXDgiqj383ENWRpE1oT2IUb
	 mIx4iCkyiJt3w==
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Jan 2026 08:29:33 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com>
References: <20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com>
Message-Id: <176917840142.2044123.2902146730185439794.robh@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Add EL2 overlay
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90358-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 599077717B
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 16:05:02 +0530, Mukesh Ojha wrote:
> All the Monaco IOT variants boards are using Gunyah hypervisor which
> means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Monaco IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  8 ++++++
>  arch/arm64/boot/dts/qcom/monaco-el2.dtso | 32 ++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-el2.dtso
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20260122 (exact match)
 Base: tags/next-20260122 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com:


Failed to apply 'arch/arm64/boot/dts/qcom/talos-el2.dtbo': FDT_ERR_NOTFOUND
make[5]: *** [scripts/Makefile.dtbs:95: arch/arm64/boot/dts/qcom/qcs615-ride-el2.dtb] Error 1
make[5]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make[4]: *** [scripts/Makefile.build:544: arch/arm64/boot/dts/qcom] Error 2
make[4]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make[3]: *** [scripts/Makefile.build:544: arch/arm64/boot/dts] Error 2
make[3]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make[2]: *** [scripts/Makefile.build:544: arch/arm64] Error 2
make[2]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:2090: .] Error 2
make[1]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.






