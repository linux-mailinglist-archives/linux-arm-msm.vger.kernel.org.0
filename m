Return-Path: <linux-arm-msm+bounces-96559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDixJKzgr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:13:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 277BC248104
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E22E30E95ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28B4451049;
	Tue, 10 Mar 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONxucfAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F056450918;
	Tue, 10 Mar 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133342; cv=none; b=UGX3I8D24G0WlSafY35kiCthD8yxtboMkdxrloRNhXaO1eTiYkC2eOkOAZ/QqH6zQIsMoEEPK4tn9p8ig4vK+JfvS8kdLuv1VkWv5DZ9K+T8/fMA2nUItKxZMwRJtNcfaA3Bfzfnz9jwFhAyBYQDwoR4trcDeN2QSDv4kNSkcN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133342; c=relaxed/simple;
	bh=QU7pP5sv8fduFIgpY3Kg0k6K7kurWKjWWBs/jrNTLm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnhjJ5v3mYmR+H/AJvKq9DEWcvQsOeTnaqgCtugXQAgstUHokislJinSOJdg5ki1W9RkkL1i8CRg7pznAgHxiVw7IGZyhHl0H55JlChSoecYryqxZ02RaDWgTSNZE0uElXSDKWQAJqn5vMLgaUCTBKUBhlwoyPhtNYSIjys7OTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONxucfAW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC633C19423;
	Tue, 10 Mar 2026 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133342;
	bh=QU7pP5sv8fduFIgpY3Kg0k6K7kurWKjWWBs/jrNTLm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONxucfAWIzCQLRilEpvjNWSZpQERWgQWlyv6whtir4D1TvFT9frGMJedmZ5n7SvKD
	 4MU2+DXZXii+cXMVC3mBVwoO9574QA8LApqQh1jv1KQ6iviAovT6F2J1cnBL53iXXt
	 oj3KuirnSg0cCRa7NbO4er5lEuErPqG2QC+W6xLmn0bQFZB8tUK6VKQ4NhVTqbgtVU
	 6WGbSvDHnrJOS6IJVbstzZZRSVKpI5YYekkaouyzahgwqh0q8dG2jhV0FfPEhiXJrP
	 QW3eNGn8p7WJHsGtxDIuU4dZdV+1rkztkRGWwFoDbDyDsgxXGQAz8Uk+ZSV6Z04Feu
	 J8KOd5NRQK+bQ==
Date: Tue, 10 Mar 2026 10:02:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add ASUS ROG Phone 3
Message-ID: <20260310-reindeer-of-pastoral-enrichment-2c9fb5@quoll>
References: <20260309-sm8250-asus-obiwan-v2-0-edf7d07b32af@pm.me>
 <20260309-sm8250-asus-obiwan-v2-1-edf7d07b32af@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-sm8250-asus-obiwan-v2-1-edf7d07b32af@pm.me>
X-Rspamd-Queue-Id: 277BC248104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96559-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:email,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 02:46:00AM +0000, Alexander Koskovich wrote:
> Add compatible string for the ASUS ROG Phone 3 (SM8250).
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


