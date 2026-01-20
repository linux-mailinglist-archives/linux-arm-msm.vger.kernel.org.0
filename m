Return-Path: <linux-arm-msm+bounces-89883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICvRLnbwb2m+UQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:15:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F34C132
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C8C38A8408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013093A0B06;
	Tue, 20 Jan 2026 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwzEiHNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25FE399A66;
	Tue, 20 Jan 2026 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938581; cv=none; b=AtNPGC38V/9Lragfgg0KkemVqAA2yprAx87KqNg+3e8fJ5cYz37y0ENoDmBAbaXUYVlG0XtBEb9oB5OVPo0NWQ3lbJnvJhCi+41E0YIeogh0l8lTLI/0R2agXYyE6dCchcfPxOm7+AkkIYzQqt36JgxTcP3jyX4ukME+zww3ouE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938581; c=relaxed/simple;
	bh=kQ5wPQq2/U4blH4aBlsWKFYKSlrG3CZQkf90M+nd7o8=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SG7y2LJSpHeTNzb9c5PYLhYAlteXmNF/afso5nJjgUGJMVYXTlqhXzjuHUxshrebkt1fCJ5xjBxfgRgge7INYqTT8n5rwIyY9MrKpF+Mtq9CTaLqVDIdH+3+KgBmigzLdKyNXK0KF8eEy0T4wEveHr/nVWBSqsnLFhMGoa81m2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwzEiHNM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486B3C16AAE;
	Tue, 20 Jan 2026 19:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938581;
	bh=kQ5wPQq2/U4blH4aBlsWKFYKSlrG3CZQkf90M+nd7o8=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=bwzEiHNM61qLDewc2y5slgZLis4CQNCpYmQ7SOnkjdqx+r5jZMru3mLaxpGbWxaiq
	 3uC8ijwgzb1qp+FIEVdQW0hFZ4ByXEpUgJ7H6IN6F6BsJcV5PpSS9sDrVuh0NsWSZz
	 bHZfTf7cecBhEaJ7mWUSEdJYDbicveNlaz4WE3hXjgsjtS8LRScPp2AtiOMeI0jGnR
	 tmEOLBqXA/1SHuqvVS9+B1oEIMLLxWi6JAqBtMgxl21BlkzizwOtV3rBV39hanGVGi
	 epca1iK2R2GqzRADGCthNK1SJ7LP7KYJf3cXbeoxamJIcfmUv5Uy55hi8hJTaSqO5q
	 oK2ks800Ryjhg==
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jan 2026 13:49:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Icenowy Zheng <uwu@icenowy.me>, 
 linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?J_=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Mike Looijmans <mike.looijmans@topic.nl>, devicetree@vger.kernel.org, 
 Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
In-Reply-To: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
Message-Id: <176893840697.630984.16476349580844756180.robh@kernel.org>
Subject: Re: [PATCH v4 0/4] Enable secondary USB controller in host mode
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-89883-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,qualcomm.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,devicetree.org:url,0.0.0.47:email]
X-Rspamd-Queue-Id: 608F34C132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 16:03:08 +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK platforms.
> 
> Changes in v4:
> Updated power supply property for hub.
> Updated details for all 4 ports of hub.
> 
> Changes in v3:
> Updated binding properties for genesys hub.
> 
> Changes in v2:
> Add Genesys Logic GL3590 hub support.
> Rename hd3ss3220_ instance for primary port controller.
> 
> Link to v3:
> https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/
> 
> Link to v2:
> https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/
> 
> Link to v1:
> https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/
> 
> Swati Agarwal (4):
>   dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
>   usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
>   arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
>     port controller
>   arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
>     mode
> 
>  .../bindings/usb/genesys,gl850g.yaml          |  17 ++
>  arch/arm64/boot/dts/qcom/lemans-evk.dts       | 217 +++++++++++++++++-
>  drivers/usb/misc/onboard_usb_dev.c            |   1 +
>  drivers/usb/misc/onboard_usb_dev.h            |   8 +
>  4 files changed, 239 insertions(+), 4 deletions(-)
> 
> --
> 2.34.1
> 
> 
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
 Base: tags/next-20260120 (exact match)
 Base: tags/next-20260120 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


Warnings in base: 209
Warnings after series: 211

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/lemans-evk.dtb: usb-typec@47 (ti,hd3ss3220): ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/usb/ti,hd3ss3220.yaml






