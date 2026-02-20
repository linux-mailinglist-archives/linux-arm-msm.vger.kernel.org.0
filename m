Return-Path: <linux-arm-msm+bounces-93464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAZHOS4SmGmL/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:50:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893A16564C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C473A3015CA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1005230AD05;
	Fri, 20 Feb 2026 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNYbR6AR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14301D555;
	Fri, 20 Feb 2026 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573804; cv=none; b=RtlhbGyMQlusv0yAIR6ZmeaEU6vw9rv3Dy2bUEtEw8xZcyijZdZfnuorzoJagQp1sPUqeNa+FKsZd2bsp0FfUDGaLZGIqlK1cd2U1/I0i/h89EtViqqrdv5yfxnLHwmxdaP8as8FLRGKRfHsMfvRTN5LxUNW1jVLIh7oFR5fmTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573804; c=relaxed/simple;
	bh=9CqEV0xEEvFTXp/6GSO6dribJdzQCXBbPNBbhFU1v1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAYdmJm5/BA2Jiao5OnTKD4SUbciINozi5CzTBr/JZCYfoT6zutCdoidkgSyNVC85ZzUUa/iWP4Ol/QwBQzZGNnzNgVrrXrHGd3l3cApEmPrdueKtobCU76BNRseXgN20y2D/osFXoIRJDt429CgT9VpiG8T6MBZusmzakR2ID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNYbR6AR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F048CC116C6;
	Fri, 20 Feb 2026 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573803;
	bh=9CqEV0xEEvFTXp/6GSO6dribJdzQCXBbPNBbhFU1v1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNYbR6AR8DOUNWidy12tXtsOx97WdIYH2gcaoRrvWq528C8Cw7sNSTkPSLrgUVY0g
	 ROmBkT1HGyz0OqU20tmaoLfhLfPwdqq+a/SUKt+nLmITpHnuI+Q+X/+BfLEPAZHvB1
	 Jo9B/N6kyGK3I+TpzuPK4A/tnLUVfOlEqYlAUSenUAR1bvD90eIVQ5rar9YLSmTA32
	 HWbTT+vn/cQZJiP3UtUMu2KO0btKdUiq9jU7NipZyLUtp6t3TOZKy/GIawkh2TAd0S
	 KD36Qr7kM/PTH7BosgfrzCw3ukPR0iECxdGQDkSbpXPBOMU2PuO2DQ34K1GwzAnhvX
	 n0coKc0JvbW5w==
Date: Fri, 20 Feb 2026 08:50:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitin Rawat <nitin.rawat@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document
 the Eliza QMP UFS PHY
Message-ID: <20260220-myrtle-pigeon-of-finesse-ab96d0@quoll>
References: <20260219-eliza-bindings-phy-ufs-v1-1-1635e7b53049@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219-eliza-bindings-phy-ufs-v1-1-1635e7b53049@oss.qualcomm.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93464-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3893A16564C
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 06:17:11PM +0200, Abel Vesa wrote:
> Document the QMP UFS PHY compatible for the Eliza Platform. It is fully
> compatible with the PHY implemented in SM8650, so use the SM8650
> compatible as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index a1731b08c9d1..7120741ea092 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -16,6 +16,10 @@ description:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - qcom,eliza-qmp-ufs-phy
> +          - const: qcom,sm8650-qmp-ufs-phy

sm8650 > sm6115

Don't break the order.

Best regards,
Krzysztof


