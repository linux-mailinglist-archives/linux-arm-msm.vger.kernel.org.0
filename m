Return-Path: <linux-arm-msm+bounces-101844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB7HAyMZ0mmATQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 10:11:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952439DD07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 10:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37EC53008521
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 08:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBB636B055;
	Sun,  5 Apr 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cticqeNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B15D1552FD;
	Sun,  5 Apr 2026 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775376672; cv=none; b=l+0bl/C+oEcL26CPlYuLCX/HRFDejU5JA8EvR43UPaST7cSSQsUTwhX/QuNdWC08F0t90+vU+fty3Mikyh/hilmkaN32P6ec3PdhEfzG+O8jm1uIqclFexp2nJQzpU0RMIkAWQodZY2u3ryO8ZTjWbNS2Co2fg9rNo/iS8F+xVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775376672; c=relaxed/simple;
	bh=LXj6V1TltBxNcB6eUSVw1XojZwydV9ttSejwUOKNY3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ww5op2RZYNacbdEa3K7rp3bj1BNdtIfz9h9KPs+rzXoa23BL5UmBJMLKlrspXMdmPOHCKa0JKisPxeM2ZpHZDWlIMOFY79AQeGGyfp3jF1rGf3sZcIfqpsvzRDaNdUOJmGAEcGwV1QY+D5cKPCsw0LQvAbgxtA+q+lnG4jly2BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cticqeNl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A633C116C6;
	Sun,  5 Apr 2026 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775376671;
	bh=LXj6V1TltBxNcB6eUSVw1XojZwydV9ttSejwUOKNY3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cticqeNlaJxizDcQDRvjhsuVc/ryigIqLLhw4tlruDTNk4w3mg3OgB7IOrXroohwS
	 Heyt3zpCuW3N2uMobIZJQIT3pCYwCvlu5Zlr8Gx3aTWw+qN6s2Y0X29jspo9gqxRzS
	 eUBz5CyOGTUnr6nimkh8c3MA9iiTJwrHCu5FbljenjsudtE+nRzWvDxJP7JM9iwYvA
	 P/Apmu4c0/S0wtNfwtJA3eZak7d3vW8ox115IJ1RbrDBsGT5QbfB/g7XjnJimD3Hcy
	 SFXbi0C+KSFESxTplz5DOV+7Nthry1w4f0rimuaw7gtSleQh5h4tSItVySsoTgAzO4
	 cKoeg9hlitHfA==
Date: Sun, 5 Apr 2026 10:11:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: qcom: document QCS8550 RB5Gen2
 board
Message-ID: <20260405-congenial-smoky-yak-104d1e@quoll>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-4-895f8fc494fc@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404-rb5gen2-dts-v1-4-895f8fc494fc@axon.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101844-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,thundercomm.com:url,axon.com:email]
X-Rspamd-Queue-Id: 3952439DD07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 10:50:57AM +0100, Joe Sandom wrote:
> Document the Qualcomm RB5gen2 from Thundercomm based on the
> QCS8550 chipset from Qualcomm.
> 
> [1] https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit/
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


