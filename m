Return-Path: <linux-arm-msm+bounces-104888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIiLIwFi8GnDSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:30:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8939E47EE0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32DDC301022D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B947E3B5318;
	Tue, 28 Apr 2026 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az2yAtgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CDC3A9629;
	Tue, 28 Apr 2026 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360573; cv=none; b=vAy0fMyLaiu6SNOOUdJ2+JZpDujjE+MOWhKy/MC4sFSby0Co2h9a72RuvIXs1C16d5Vh1gFqqUk17YuGD05SY6nuxQOx5n3iJaPNoolvyqkBUK3YvKm5gC/dbCfbI4IDSZoHsZ8ugIFHplzLkE0dxS8tlZrin1rSlm9sgPm3hR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360573; c=relaxed/simple;
	bh=F+Bedh6UQky/XLr6sa/YBINvFDV9SbHhf9607gOUy1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePb1+uKu5xIAlERyGgXZoSIpfg6aLUxsJMYcsH1012m0qGhnfzEwWxPyARsJFpHSLlN6Ik5kZfp2eg1+me5j/z6IA0fr/NQwBa9h/w+y81jn0nbnRbyAvMxhwFE0c9rXAIV3Ij3/NM696RGH+oRNkIzeaQmZM8wdMsNZK4Ya4po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az2yAtgy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D62C2BCAF;
	Tue, 28 Apr 2026 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777360573;
	bh=F+Bedh6UQky/XLr6sa/YBINvFDV9SbHhf9607gOUy1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Az2yAtgyMj+n9xe/FVDCLwhh5yVZktsoCesWX1u/Y+MZUET/sm/8zTQq+BfQp93a4
	 2RCDJV9plrqyFwj20aoh0zXQeAcibhnsXVY+HidZutTcqX1rIglO99NWNsKlf53TiU
	 ZoHH0HmrfxQNSuzdGaC15qV1rO93NhztcPWVuqG9UIijVpZ0jJKcybwMO/ZkFum/H5
	 OIJ/wj1KakM5Hu3GeGPXfIETUqzHT9qv/IJ0sKaB9KA+ihjkkUY6fTYS5qKsTShcKC
	 N2rJa6UKlkRPVxlpOQk6jq9KecZm1/QSAzTqc1HAOYz+Ki23d56Sz3g1aqXTvpZ/8N
	 XwzR3qwjyilxg==
Date: Tue, 28 Apr 2026 09:16:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dt-bindings: arm: cpus: Add compatible
 qcom,oryon-1-5
Message-ID: <20260428-spotted-azure-labradoodle-5ddea4@quoll>
References: <20260427004619.229843-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427004619.229843-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 8939E47EE0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104888-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 08:46:19AM +0800, Shawn Guo wrote:
> Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.
> 
>   $ cat /proc/cpuinfo
>   ...
>   CPU implementer : 0x51
>   CPU architecture: 8
>   CPU variant     : 0x5
>   CPU part        : 0x001
>   CPU revision    : 4
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Notes for resend:
>  - Rebase on v7.1-rc1
>  - The user of this binding (Nord DTS) can be found here [1],
>    and will be sent for public review shortly.
> 
> [1] https://github.com/qualcomm-linux/kernel-topics/blob/early/hwe/nord-next/arch/arm64/boot/dts/qcom/nord.dtsi
> 
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


