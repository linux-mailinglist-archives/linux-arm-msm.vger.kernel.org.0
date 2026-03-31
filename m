Return-Path: <linux-arm-msm+bounces-100976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMjuODWLy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:52:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5556236675E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC3B130C3332
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075943E95BD;
	Tue, 31 Mar 2026 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noucimaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D8D3E95A7;
	Tue, 31 Mar 2026 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946712; cv=none; b=XajFDcI8qLMWY87/DxAWyDeA31c/nNsUbjCpA+DynggO7vgphbYiQneLVgArh5kwbn+aQ77Kr6j7k4nA4TlCBcPagYUbWsCMdOicKiAiyRfdQ98IUiOnweTgVA5v9dUKcLNK+v1ZIbOWFietYYeZhEE0LNbJTdeFUf84k0qQ3Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946712; c=relaxed/simple;
	bh=1CXtYr5TJQ0SHgU+lZHYag5FFsCHDe5IkfVJGW01F6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/8XlAehnotjgKA7Or2TfPXUzkbJ8O+sZopncFQBohnN0Rd+8zfuRKQLak+Zoo+ySwX/TDoSccYeOE5CgqBQJfKs9+XYCqzM7W6kVWx8KKWAi2wdLTTRIW6yeDci5vRzpz+aN47DsYgHFNVys5hfWLiAmZxe4Sl/DlYTUbz/itk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noucimaR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172ACC19423;
	Tue, 31 Mar 2026 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946712;
	bh=1CXtYr5TJQ0SHgU+lZHYag5FFsCHDe5IkfVJGW01F6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noucimaRCA+1MOhN6xfoE43MsffxHfa60vrfDyAkUB656Xfb9MD0BAWxNqefSg9et
	 Twr/3HvRs01l/gjX8NReUpld0ApDoVcGHi3NpkrE7SUCuCLv2/pvJNisUWj/48N0uR
	 jcSMemZogyL+4ekaX0jJh6kb93F7fv1ekUUAdrqA/ZwaL0nigRifFgn6sgiDJEacXP
	 619bW7RN6GAoSw8QoxYG9TDOspEQ4sCQdk/a/bwE3K7gmc01y9/rop/Kl0EptoBrEP
	 laZJw8Dtxhc9t5to2QjKCFYaoR4bqp+xA+Vy6ZvyiHCwP75/S7DBN7W1G5J9hQZFp3
	 yC2Zh42YKd9cg==
Date: Tue, 31 Mar 2026 10:45:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: add Hawi interconnect provider
 driver
Message-ID: <20260331-sly-centipede-of-opportunity-590509@quoll>
References: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
 <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100976-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5556236675E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:40:01PM -0700, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/hawi.c   | 2021 ++++++++++++++++++++++++++++++++++++

Can you finally stop sending code based on downstream?

You just made same mistakes I have been fixing for more than 3 years
now.

NAK

Best regards,
Krzysztof


