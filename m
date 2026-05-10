Return-Path: <linux-arm-msm+bounces-106812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE6UNrh0AGq/JAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:06:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D295D503D91
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16A92300BDAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11E437DE87;
	Sun, 10 May 2026 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXcgZvYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01A21FD4;
	Sun, 10 May 2026 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778414771; cv=none; b=qhTFmJhEUqrpWL/Qp4CIVmg6CFX/cH7+YzjQuzwUHdLzoyHOK+wI1RRmV5u3yAM6ZQ+45SngTrYtfsO+OYzIL3eGEPfDQEENY9SkvPyJhVKTxJhRXu2rMRmt6PxnMvSLJA87KJEXDZbFXlgJSMcfu6NYIHTuGadz5L7CnTTyO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778414771; c=relaxed/simple;
	bh=WJCic6gx6wQ/DFnJ7oL2MXWU3DEQuCCMibrQtMIN/44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLKfqehgHZ4UBjIIy1HSxUSQ5ZaUkrLKzhrMaBVZN+p2GK3yu/DI4X/WsYK3AmIGroNuhBEyCLaUmaqwyLTRHf2fxjt9U0lZ0QD2tek8AUReEp+aLUinAHsBhA0dHt0da+rZsCSvtv5O5PCnmF+odV3db5H/JY8HH3ozNFUwzFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXcgZvYk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA8DC2BCB8;
	Sun, 10 May 2026 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778414771;
	bh=WJCic6gx6wQ/DFnJ7oL2MXWU3DEQuCCMibrQtMIN/44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXcgZvYk7XZbPGUvc/4EBro3bkJAHbaHLNBgSwKY/VVEtZ6aA0SKB7hJr6BNbFdlH
	 To6kwm6MCnB6V785ixdr/bnzg2LW/+GzWxdnA0xHgjBGGrU8HVg9tUHI97Kidnitd5
	 12Vcms4c2ZpAFFYGADYOd3y30KbIFUVa9dwWj9sm1BStzn1vO+UC5VYKW8oMhPeKvB
	 QaZPNU1m099+b8izbjqVwXliJ2fAiGu1x6XZjqduP1GlCLc/Thvk8NcvuD0m6snNnA
	 VYBA5X97o8VU5j5BN2y9hNIGTF5qe6Hc3Fa/b5m03uMi7YWaXYaEOKkiX8IimsmN2+
	 4DwKbLqQBGb2g==
Date: Sun, 10 May 2026 17:36:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Eliza QMP PHY
Message-ID: <agB0rvM07sgq_1Ih@vaman>
References: <20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com>
X-Rspamd-Queue-Id: D295D503D91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On 18-03-26, 11:54, Abel Vesa wrote:
> Document the compatible for the USB QMP PHY found on the Qualcomm Eliza
> SoC.
> 
> It is fully compatible with the one found on Qualcomm SM8650, so add it
> with the SM8650 as fallback.

Can you please rebase this on phy/next

> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index 3d537b7f9985..4eff92343ce4 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -16,6 +16,10 @@ description:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - qcom,eliza-qmp-usb3-dp-phy
> +          - const: qcom,sm8650-qmp-usb3-dp-phy
>        - items:
>            - enum:
>                - qcom,kaanapali-qmp-usb3-dp-phy
> 
> ---
> base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> change-id: 20260318-eliza-bindings-qmp-phy-c53be4b0b131
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
~Vinod

