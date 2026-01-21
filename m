Return-Path: <linux-arm-msm+bounces-89959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKRRGamKcGnPYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:13:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B3253513
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95D5A7C5C6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDA847799F;
	Wed, 21 Jan 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pI5uaxgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E0366568;
	Wed, 21 Jan 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982882; cv=none; b=G7IIR8Zd4TQ7ZT5nc92dRDDTwRb4ZJtMCTaS6u8NQsSBrIJmu4Vaz0zhGd5x7lsN8ijhCF6qMicucFbgRo3k4CPIrZcQMXyPOiwj0byYtcx5TfHn88vsc8iF91wDqP0U7nAis4DpDwym/4lReGf01ssQTOLUQL9fdU87flzItdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982882; c=relaxed/simple;
	bh=GgPLMHH53guCx84Bqv2y51/6b4lxRlrm3sYN901D7XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljNiNTJdQl5Fr7R+BPTNKF4+3+/BqHscTHliIUniGMPI/oZmMZ5fz+cAZ2JLu2gCHmnIRT1Ue7ocNhntJrf+fQ3fABUmklzyZp8r6/IERHBQxh2JUORdAF17VfUIkhY7DuRq7egL17eId0bL1KnjYwj5rPpxf/aIA15vyvhTqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pI5uaxgO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E01EC116D0;
	Wed, 21 Jan 2026 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982880;
	bh=GgPLMHH53guCx84Bqv2y51/6b4lxRlrm3sYN901D7XA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pI5uaxgORzj5Q6PjAcsi9CYuR7tBR+ynsoT0Iw8VTDy9A3gcnDen9RZrQts9sJf2Q
	 0xQmhjCnPtIb2AoygLurmuG9sBc4i5RYHCbClcva/+N/U7iAn4qrs7w4KBZjZFKerA
	 HxalpvMIvlI9LXbLQw6yhF6lL5XfzZGo/Or1me59bNbeocTdE2zGeE2zk1YChzW/H5
	 /tEwuqStcakpRVJSU2y+pCK43CgvS12sAEuUgyEYTMQQZHh66wd5b282tEXA4+oix6
	 vf6an5bqBh7oKoLKp+iEpH0Y3ecbtbiW6ofAxJupGAwrwqmXNJ4ZIhidIXAN4fhYKm
	 CzJCpGBBV423w==
Date: Wed, 21 Jan 2026 09:07:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: arm: qcom: Add ECS LIVA QC710
Message-ID: <20260121-thundering-bug-of-pizza-a2c5da@quoll>
References: <20260120234029.419825-2-val@packett.cool>
 <20260120234029.419825-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120234029.419825-6-val@packett.cool>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89959-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,packett.cool:email]
X-Rspamd-Queue-Id: E9B3253513
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 08:30:08PM -0300, Val Packett wrote:
> Document the SC7180 (Snapdragon 7c) based ECS LIVA QC710 mini PC/devkit.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


