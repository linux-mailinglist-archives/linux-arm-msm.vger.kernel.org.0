Return-Path: <linux-arm-msm+bounces-100114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH5HFRc2xWn/8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:35:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F87D3360DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EF9130A0857
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67182D838C;
	Thu, 26 Mar 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KalNr4PY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930572D593E;
	Thu, 26 Mar 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531504; cv=none; b=OxBbYQA2EjXAuR2Y/ihqsQdzwxW7aIsIPkw6rZXMi9T24HoJxSfk/bsZOEHYO+rvzX30yNaWETkiEwcUVh3SSVNy3tcPp7E/Vt8FBq8pqQYsbirhe7B/bnvr578ULiqUL1oryx7v3pVKwc2aZQaRjQ3PS6Y22jD45UmqRvyV5g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531504; c=relaxed/simple;
	bh=slZDjHDBkDBOv9ZPw6AKRurx6jWSVWj20hE5CGDhROU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHrE5FIMSLQSOsygRL6ZXBzq0RKd+8QO7IEdTV1jJpIcG5MPQ6BcJE3VKO3x8kL53uk5AhR2ueAUPFCRvYnY5+OwR3kqlLCAGzrwCkpk3wNqmvcCiv9epj54PsxKKsrhR1wII1RpLP0wMp8nM9hsDNR2gtLj1yShJcsXdlaFE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KalNr4PY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C7BC116C6;
	Thu, 26 Mar 2026 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531504;
	bh=slZDjHDBkDBOv9ZPw6AKRurx6jWSVWj20hE5CGDhROU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KalNr4PYE3MJeu0+hZzIon5d+NVDBpt1iDmrl+S2fli1vImkdTnVasaqt1EtdRU7r
	 83ZAeCbbXEEMkdMh4+qoSrTQ4DKaqn9HxS19x4voL8Vr4thcJZCE2KJNXVpLnXXmHd
	 VeRXAARxQFKREHg/0w9iLfb8CYgM+HKLbXRkdm2OcMvKS4rH+ldlJg2v83PW6WMY/R
	 ZmLpEX5fkZY0DgSAe8mAa24xOQ87PPiwjRe7ehNpF9GsgjEV/J6H2o1k2xQwuUlNUF
	 dRAF6LYcZYr9fx8Zq8UOXFKL7VrqCWjMlkhzXy6bXtsK2DWhxZKgfDxV6t91hjLAUT
	 OXBNawrSDv1hw==
Date: Thu, 26 Mar 2026 08:24:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: monaco: extend fastrpc compute cb
Message-ID: <acUzKYUCbUOIOrw2@baldur>
References: <20260326125834.2758331-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326125834.2758331-1-srinivas.kandagatla@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100114-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,b:email,c:email]
X-Rspamd-Queue-Id: 0F87D3360DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:58:34PM +0000, Srinivas Kandagatla wrote:
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
[..]
> +
> +					compute-cb@b {

That doesn't match the patternProperties "(compute-)?cb@[0-9]*$".

Is the reg an index, or an "address"? Should we use base 10, or should
we fix the yaml?

Regards,
Bjorn

> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <0xb>;
> +						iommus = <&apps_smmu 0x19cb 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@c {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <0xc>;
> +						iommus = <&apps_smmu 0x19cc 0x000>;
> +						dma-coherent;
> +					};
>  				};
>  			};
>  		};
> -- 
> 2.47.3
> 

