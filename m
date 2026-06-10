Return-Path: <linux-arm-msm+bounces-112555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TQhpNQ7DKWqqcwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 22:03:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF666CACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 22:03:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VAf4Nh34;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112555-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112555-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1624E323B308
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82A837D110;
	Wed, 10 Jun 2026 20:00:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED2537D128;
	Wed, 10 Jun 2026 20:00:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121615; cv=none; b=pJ/oTRKyjiwnkJeO6NACJRzPOX0/2mdjEAjsYGvhC0IWwt7PIOIK7P99o8abVqcS0UelfcNZ2GNGlykaO8uW+Xhh3IlghOPMCJ5wsy6SYIQ7Bu/vSEqY6aGN/4eA3L5BaAb7ptJFM2LPhKOOAcy8/VPtG5JtHa3VOv3qD1EF/qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121615; c=relaxed/simple;
	bh=Rtu4PCPrQrnpGXPDWa37Ka+8zUeOAO5dxlEBpiDJ9Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyCylHB4hD/uflhqQp31iXhZHoZAXZ9yur+H4fwaTdQgheDbBtvXDCm4vKUOs+tPddWtuI6PaDrNEE5rNyjqL8SG4Np333erMFnPuJRZmYheYu0hrNZISG6/Z9evbPG7HPcNQFiXky5n4VL5HT2EhzOx9PajBPnV1Pyr+SUYTQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAf4Nh34; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1237A1F00893;
	Wed, 10 Jun 2026 20:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781121614;
	bh=lEiT5nfQy5M2WcLyUsRW0iH+7nklJOdrIO/F3wDlgbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VAf4Nh34MZ0WafXhdetK/bmREXXT5GVeCvBWaxJYyp86JhxsavKNUzrAdEFZV9VgY
	 cE4Q5K4DAYXZe3I4n8TWkrTzIHhPqWF0zf7PU7ixahduD3Bw6Mb08seckroYON2Vzy
	 etJKo01eFEwOVlPfNc7+5DXWjJ5Bn01Sqvy3adj3ODYMsfY12AIQtSIxGcPXfMtpa5
	 s6SHxwZdKsgieg8qwtUnD2mEcX+fgx4Oug66gfEFA0gtrrRacskBeKgu7Lg3Riyxm3
	 k8n06TKWq3aL5N80saIPiQ8OLd/N/97UIhN2dE94WkarTO+7s5HFZFW5ZyvxoQNq+u
	 YphEfbhuFiEXw==
Date: Wed, 10 Jun 2026 15:00:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-phy@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	YijieYang <yijie.yang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: sc8280xp-qmp-pcie: Disallow
 bifurcation register on Purwa
Message-ID: <178112161290.713172.14002683325677777588.robh@kernel.org>
References: <20260610-topic-purwa_phy_shutup_warning-v2-1-951c1fbfe9b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-purwa_phy_shutup_warning-v2-1-951c1fbfe9b2@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112555-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:yijie.yang@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:email,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CBF666CACC


On Wed, 10 Jun 2026 11:45:12 +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Neither of the two Gen4x4 PHYs found on Purwa supports bifurcation.
> The PHY is however physically laid out as if it were to, since there
> are two separate ports (A/B).
> 
> Split out a new if-then block to un-require the bifurcation register
> handle to squash this warning:
> 
> purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
> 
> Fixes: 2e1ffd4c1805 ("dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe Gen4x4 PHY")
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/176857775469.1631885.16133311938753588148.robh@kernel.org/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebase
> - Don't drop the mention of the warning, as it now actually exists in
>   the tree..
> - Link to v1: https://lore.kernel.org/r/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com
> 
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


