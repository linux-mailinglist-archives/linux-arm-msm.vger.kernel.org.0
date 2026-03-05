Return-Path: <linux-arm-msm+bounces-95515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIZLIl0vqWmO2wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:23:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775E20C91D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89EDC3014FD5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F45C26E706;
	Thu,  5 Mar 2026 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S01QHd21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6561BF33;
	Thu,  5 Mar 2026 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772695385; cv=none; b=tiHtk2OhlvvYTuCQtkl+MjsPBYQg+WxmHu9Mg3iWFgMuuVAh2F7ZvPmDOVzQxBlM6s4XQ7//LAP9ikEbjN1WKpor5i75MJNML60sHLJGKjgRjr9NmfyNtHUfY7GEJFxRO7AbN0JzGNJUWdxlXel2pDaTF+35K2ZH6HbONPNPoqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772695385; c=relaxed/simple;
	bh=1ZZCSsE6odyfb2JuW9pbHt08dU+Ste48wn4Sc5jnvck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myJFiHyLjvXFZRI0TFkkoo5ZV8aVKQEQ0Ir86D5QfLwWLzSSMgHO1D8VguoXOlWo9eK9Mr60pTlCUfNfghm/pUfJ89yHFq6s/qO8yQp3/u+jXaIG8D7kl9HEoWdixPLVx6M+vKAF7wAou9AhtM7EwUTPcq/ZhxnBQzQ0oJGvWh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S01QHd21; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF57C116C6;
	Thu,  5 Mar 2026 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772695384;
	bh=1ZZCSsE6odyfb2JuW9pbHt08dU+Ste48wn4Sc5jnvck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S01QHd21WQcvPVbPR9gc4fVyNDHlj0tsdxHEyXMpad8qKf79J7DZx7oijGa7Rl4zS
	 +N6X0OQ+/dindGi0tyIzMrpLrDOyjogbGzTUFN8xX/G8WgFbSsKyBA4amaB0Xla9TS
	 8aSPMBtsXD2djAGKxoYn05OzO2uYlsqyeml9uhzzQuUcrCRDwywQZUG7Qlv8AeHpUa
	 ZGw5i0JAYyG3nr/LSgQd3d33DJfjyxRcY59PQu3JYEuBuPhtcWrQMj16wlmdrBM1dC
	 BSJeGOWYDFYgEzvoU8FnSNtFSyNs5W9B596l8yIxy+zlMhcnbVoHtOk4zH8NJFG0R+
	 Sqg4i9M5LFBGA==
Date: Thu, 5 Mar 2026 08:23:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srini@kernel.org
Subject: Re: [PATCH v3 08/14] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
Message-ID: <20260305-glittering-devout-llama-fcfe75@quoll>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260304130712.222246-9-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304130712.222246-9-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2775E20C91D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95515-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:07:06PM +0000, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Qualcomm platforms support the Senary MI2S interface for audio playback
> and capture. Add a new definitions for the Senary MI2S RX and TX ports,
> which are required for boards that utilize the Senary MI2S interface
> for audio routing.
> 

This should be squashed. Adding IDs in multiple patches is pointless -
it's one logical change. Plus patch is so trivial and obvious that even
preserving authorship cannot be used as an argument.

Best regards,
Krzysztof


