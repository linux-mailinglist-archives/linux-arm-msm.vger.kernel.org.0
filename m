Return-Path: <linux-arm-msm+bounces-90029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COrkN0PqcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:01:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8845458DF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50EB370A7B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78793492183;
	Wed, 21 Jan 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt0EzPf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D77347ECEC;
	Wed, 21 Jan 2026 14:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004753; cv=none; b=WrMcJrq6VPaQTI/xcmNCyVY5RHK0+/m4XKncuWgC9FBHDdMzdfS0xmCTG5CEnaoMCfIcVhh9lssmv/P1nzxC+OM4ryYDExKQHtsKWiTHyh1tYf2vx92bEpKMl6VvmKjNFoOG7vyFYTHOx3kHQj1ZlPZj3yWuDpuq/kO5URYXZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004753; c=relaxed/simple;
	bh=QUvywTP120lPX2zmeiNDaum5zzaDqE8/xxz8R/GnGI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l94tjz8ndouMiNjmH0J09MJA0af6d4RaygiLKn5s/CY85QNTseJ7oaImCMrFz6mBXsRYEGP9T0JSfNRiaIBsNsJqwZwiucKXwiyrBJajpW4lHprlL0duX06JXA7wWWDDrm3MTqZtb6/ASrEu8fLaB2MhWASJtATfQTf6wyrihgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt0EzPf2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF78C4CEF1;
	Wed, 21 Jan 2026 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769004751;
	bh=QUvywTP120lPX2zmeiNDaum5zzaDqE8/xxz8R/GnGI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zt0EzPf2dHAzrbt9W1MJ9euiqzfhy+I3Yu26CHtDy0s5/8dfhYXTLPXazDr1QycDO
	 ed/TiqwkJ6Pky9pkuH24ZXhSjv25lMB9BycbzdknhGczyQ9UyGWqVi8kaP9yzxuuRj
	 5/uaES8xX+TNEYCZBhrT8QIsrQWqw0uxmppo3XsSLbs08YacY1P5n/agHJmQzAKC2g
	 eoH7ExC5BvDt+BP+25bl/lXOwe6BA1CwxgdLYWiK4xiL5h+yXhyvToY7TZ1Kl1/obK
	 0GO4tnEpyJEObBuuNImHaCmjMFJ3L2cr6K1IbBO1aoEDRFXbsPfDCPO9uLwkPMoJDo
	 amnRDX6M6T5UQ==
Date: Wed, 21 Jan 2026 08:12:28 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	prahlad.valluru@oss.qualcomm.com, Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Enable lt8713sx bridge with displayport for
 monaco-evk
Message-ID: <ke3xn2344ray53viwiyxfap3z22tguyo347ixic3vg5xxe4nje@juujoqxqptq5>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-90029-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 8845458DF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Dec 28, 2025 at 07:10:37PM +0530, Vishnu Saini wrote:
> This series enables lt8713sx bridge and displayport on Qualcomm
> monaco-evk platform.
> 

Please answer Dmitry's questions and please send out a new version once
dependencies are in linux-next, so that I can merge it. Will drop this
version from my queue.

Regards,
Bjorn

> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
> Changes in v3:
> - Used  existing qup_i2c0_data_clk as default i2c0 pinctrl and provided it's drive-strength, bias-pull-up.
> - Link to v2: https://lore.kernel.org/r/20251219-lt8713sx-bridge-linux-for-next-v2-0-2e53f5490eb9@oss.qualcomm.com
> 
> Changes in v2:
> - Configure DP PHY supplies and DP pinctrl
> - Configure in/out ports and connectors for lt8713sx bridge
> - Use correct base commit and fixed build issues 
> - Link to v1: https://lore.kernel.org/r/20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com
> 
> ---
> Vishnu Saini (2):
>       arm64: dts: qcom: monaco: add lt8713sx bridge with displayport
>       arm64: defconfig: Enable Lontium LT8713sx driver
> 
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
>  arch/arm64/configs/defconfig            |  1 +
>  3 files changed, 96 insertions(+)
> ---
> base-commit: c2469dc74020684c2aed314701d999cc37c95717
> change-id: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719
> 
> Best regards,
> -- 
> Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 

