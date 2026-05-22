Return-Path: <linux-arm-msm+bounces-109163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGg2AoXQD2r0PwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 05:41:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE095AE5FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 05:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 580EB301DCDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 03:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D23234C9AC;
	Fri, 22 May 2026 03:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsBGVnN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8E285CAA;
	Fri, 22 May 2026 03:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779421282; cv=none; b=CYK63cTw6HTFTO1LUFRZoeq25THD6wv0qX3zkz2dm9B1cBgn+rfmoWUzts6nBIzsF4gmjvDqXJfK9nRokvdHPcEG+Dnu6qsosVJrZKSiSy/BUsmhOJZ+2YtSwB4VHbt5eqJ9WxMXM/N1u0SGz9vt2TGukEfI54m1mPsmdfOPVDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779421282; c=relaxed/simple;
	bh=/d/+kbkKM3AJWlE05FhfFBDsXen15tnt3tjfNlTayIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWUeY3Tw+T0PxpvG3EDHwfkwk0lmChyBPfcQL7Dkmnb2KqnK6WHzdwjzwrSkzPA0vuGYR3X5uZqGgzW+eE7ABZ6A5JwGIGigSzLwJYBIJsbJLMC7CH3dbiKxoasIR5B4G9HPLBjVvKiaEEMxtrklzoScqdQFD23uwU2DRDG9pLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsBGVnN/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6406E1F000E9;
	Fri, 22 May 2026 03:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779421281;
	bh=WlQZKrhx4S0Y9UNXIDwfqjvBw2+lbS9FRoZVK885FQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YsBGVnN/3tstO/y/0tskSGXgEHqz/CQQfGZKVPDpWD/EPGGgeKiAangrJL20+Ytgm
	 W2XdqX2/O96OPDc1yhMqEhNhIQyMEOaE2X0e+dfgKNY8r5DvybFinhYQFyLy/cTJlO
	 bZ4R3fTpC5vzAZW/uKm0vbUAeycYUX6jEDJ36gHNG8JBflHAOev3b5a2Cw8o9t2l9b
	 vTG7uy6Rf5MC+VuNBp6EWgAVEtvjJBSOgyMtlmmjz2rjZqiaLyCX+QU9yvivbD6GTd
	 612452rCWJASZfIKCn/Ql1zp8wn4ZV4UFDoQ+JlXRlN3iN1nRGuWHbrFHwOpB6RALs
	 HeF0jytMsi7eg==
Date: Thu, 21 May 2026 22:41:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via
 QMP Combo PHY
Message-ID: <ag_QL5DIo7MxsdYU@baldur>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9BE095AE5FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 29, 2026 at 12:10:39PM +0530, Mahadevan P wrote:
> This series enables full 4-lane DisplayPort operation on SC7280/kodiak
> platforms by wiring up the QMP Combo PHY correctly and consolidating
> the DP endpoint configuration in the SoC dtsi.
> 
> Patch 1 adds mode-switch to the QMP Combo PHY node in kodiak.dtsi,
> which is required for the PHY to respond to USB-C Alternate Mode
> negotiation and switch into 4-lane DP configuration.
> 
> Patch 2 moves the data-lanes property from individual board files into
> kodiak.dtsi since the PHY-to-controller wiring is fixed in silicon.
> It also removes redundant remote-endpoint and orientation-switch
> overrides from qcs6490-rb3gen2 and qcs6490-thundercomm-rubikpi3 that
> are already covered by the SoC dtsi.
> 
> Patch 3 updates data-lanes from <0 1> to <0 1 2 3> in kodiak.dtsi now
> that mode-switch is in place, enabling the full 4-lane DP link.

Are you sure that herobrine has 4 lanes routed on the PCB?

Regards,
Bjorn

> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Changes in v2:
> - Split single patch into 3 patches.
> - Move mode-switch and data-lanes to kodiak.dtsi instead of board
>   file (Neil Armstrong, Konrad Dybcio)
> - Remove redundant board-level endpoint and orientation-switch
>   overrides now covered by kodiak.dtsi
> - v1 received a Reviewed-by from Dmitry on the combined change;
>   that tag has been dropped pending re-review of the split.
> 
> ---
> Mahadevan P (3):
>       arm64: dts: qcom: kodiak: allow mode-switch events to reach the QMP Combo PHY
>       arm64: dts: qcom: kodiak: move dp data-lanes to SoC dtsi
>       arm64: dts: qcom: kodiak: Set up 4-lane DP
> 
>  arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  2 ++
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
>  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
>  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
>  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
>  7 files changed, 2 insertions(+), 24 deletions(-)
> ---
> base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
> change-id: 20260420-kodiak_v2-d7a06d50db5e
> 
> Best regards,
> -- 
> Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 

