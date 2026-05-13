Return-Path: <linux-arm-msm+bounces-107499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FN4AQ7/BGrxRAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:45:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE09353B999
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69E693028F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172BA37CD45;
	Wed, 13 May 2026 22:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cs9Ei1Yc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7C19CD03;
	Wed, 13 May 2026 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712330; cv=none; b=lO59qO3acjz5zjXE6PzHpOGHK7nrlRxvyHePM6HH8mluqaO0p58TQrxr0BVi4iAbd9njVP0d1KmKBwxAqe0IOsl2Dlo+2d15/x20HS3nToew4q7qWBWUGV+q77CCtkLLHwpUOrsmc293V5F5ULk0T9m51UUe4u8ljBPntiJWTRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712330; c=relaxed/simple;
	bh=PFcef5ZVfmE5jraV+3O2xGVpthKxWMM60NlRYlTSrSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcmF9NI4kG6B//AEPFdV/76XG1tYycUq9fiiBDI5bUYw+tq7NXbYsGc/A6z8w5+uKdXCtdsLjdW6mrPhNfFVFT++228JSqFDGtHetQnGosE0n3xsTH6B/Dg2Pnq84Lm7N4qHXVo/MZD6hlMODFGj+Hv+q0a8hssAQzY1tDUZ5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cs9Ei1Yc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C52C19425;
	Wed, 13 May 2026 22:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778712329;
	bh=PFcef5ZVfmE5jraV+3O2xGVpthKxWMM60NlRYlTSrSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cs9Ei1YclCl4T5zxE/1uCVIkjx0PI6V9TmJvAZxqgGiF0Ic8tnN8+z4ObgCnbK0g5
	 Z07OIsFF8xVgHnifzA2wDQa+5udJ/wT7tOemlzDNvWYhbG1KHcACyMAWhu0bOJ1nK6
	 vIYycEsjicxMV79pA3nwnr9wWdSa1P31nkZs3NhEp9T0q1y/d0D3TK/ty8qMQUyRJS
	 xG8yv80oTtcGTAaVMd/pUHlrj2PoW0FBQLf5kSm3r5IEz63UQzuAv8oywjoFFqwOys
	 dXrjyeK+g1RLz8SGo0YIjJ6qDiO1eyv/J0vqL/FLNQvWEVKnql7U9AKt45ug2M1sL2
	 q7TFiMx/1mBcA==
Date: Wed, 13 May 2026 17:45:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: nvmem: qcom,qfprom: Add Shikra compatible
Message-ID: <177871232532.2234507.2166992150616647804.robh@kernel.org>
References: <20260508-shikra-qfprom-binding-v2-1-a75174c8a580@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra-qfprom-binding-v2-1-a75174c8a580@oss.qualcomm.com>
X-Rspamd-Queue-Id: BE09353B999
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107499-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Fri, 08 May 2026 00:30:32 +0530, Komal Bajaj wrote:
> Document compatible string for the QFPROM on Qualcomm Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
> Add the QFPROM compatible string for the Qualcomm Shikra SoC to the
> qcom,qfprom binding document.
> ---
> Changes in v2:
> - Improve commit description: "Shikra platform" -> "Qualcomm Shikra SoC"
> - Link to v1: https://lore.kernel.org/r/20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


