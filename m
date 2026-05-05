Return-Path: <linux-arm-msm+bounces-105858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHB7IoWe+Wl9+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:38:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9E14C817E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3543730022F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3373D16E9;
	Tue,  5 May 2026 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNfCTRNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C709218821;
	Tue,  5 May 2026 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966722; cv=none; b=Eawhtd5Ii2IMSHblSx5bz9hIa78jN1DO0iIfeUcWmeby572NI8o0IAtTUFlauLX5+CJybgroMOtpxoCQujKQHRpKZr3GQQcbMc0QfdHZPhRc5ig4VLEhxp+iMWXf3qBoR5Qn3TPwknJLoScMJSPZizTKkSQGphQydGNaZ6JDntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966722; c=relaxed/simple;
	bh=ywPxxuDnmp9Eosu4CWKzEO6jPTX0XZmGTMwmBYiGgvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHw9+m2tKPIm+8aDmDiVzTvsksuv8PLwBgc2ljWT5/LE3mH8b5YYrRCoPj8qVDzlQM/lMjyI0kTW1jGEE6va25yw9eNZ1diHJ6XpAUfghc89IY+ZPpA0N26joApJnXHqwxEzZp2cJGWoGW3gXC+VP2HGiYrn5Y4vZzevTiKdTd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNfCTRNf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907A7C2BCB4;
	Tue,  5 May 2026 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777966722;
	bh=ywPxxuDnmp9Eosu4CWKzEO6jPTX0XZmGTMwmBYiGgvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNfCTRNfolOEjDv7Rx39X+4rWljsO1EWRGpqRejg93V88E6vXOnHoKZLBBtEcjs26
	 3AtxvveEMTuNAEswIPArQg7KhjWIvBNEhh8QmuWTjWxWWuETeJQEDNaGBeSzuSgHZg
	 SOh9ZVMQrdegAZTAki8xPMeeJBaWWYgjvKR1l2I2yrsZkVTuap9nDjJ7G1FStlodBW
	 NI3mPMn7ikwEcPiM7m+6E1qLjsByFx++tafv41NgbO7W39vrZkGCp7I4gTrBDIbqHT
	 qlNFcqipTYSNSjUSfohmxbInseBB73+20vzFz7J2cuF1vtj7rERWiYDnSGMXAHoXKT
	 pTTLZkiZSwGTA==
Date: Tue, 5 May 2026 09:38:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document
 Nord QMP UFS PHY
Message-ID: <20260505-ambrosial-nifty-manul-b9f40f@quoll>
References: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2A9E14C817E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105858-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]

On Mon, May 04, 2026 at 04:14:42PM +0800, Shawn Guo wrote:
> Document QMP UFS PHY on Qualcomm Nord SoC.

And here you explain the hardware, IOW, that it is or is not compatible
with something and WHY.

> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Improve commit log to drop "compatible with" part

Devices are compatible with other devices, not with a string. And
previous commits could be a guidance here.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


