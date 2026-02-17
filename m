Return-Path: <linux-arm-msm+bounces-93075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HFTC4cglGmKAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:02:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DB14981A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCB8E301DEDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193462DA74C;
	Tue, 17 Feb 2026 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pem8E6wN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A062D59FA;
	Tue, 17 Feb 2026 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315329; cv=none; b=FGZsDKf1cXfP8ctVnWwiZXGh97of/C0yuviVLo1FrPPz7idSOg7nB/t5Lvp2UkMy/+lg3Ld/z+wp7AeVjRknkeaqVRzL6pmxIQehrqQ05VCdgB5nI/JK3A0EdnEdU1Y1GH6zX8+QzGIhOCxdGj6A39sInhtwHUZJy3115hxxJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315329; c=relaxed/simple;
	bh=piCE6cuomV6VfiLxZMq2fXWm8uGAZhJHAMlPanqKC5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1BePsXTQyri3wQwFtBfvlm0OPNusYB/1lqybYqFHpcq7IK0szmxfkXO8BGY18EYawwpJCveVbeXOwe/eatQmu0dSdLY3Q7nbAtWxcCtv209+3Vnrl+lTWOhvIzp+sPMkExARFNukEzk2syBWmy9KpyM5KnhfTgI1AAVwWCTVSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pem8E6wN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03303C4CEF7;
	Tue, 17 Feb 2026 08:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771315328;
	bh=piCE6cuomV6VfiLxZMq2fXWm8uGAZhJHAMlPanqKC5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pem8E6wNH9nkwNcDbhldXK3+vN32sMQZpf2ZAnVcMUZMcas8/aK+O7cygD6H41CPQ
	 sKPs4Ux+WHENLZx9h1QtdfcaNcFuWVxDWcrHECbJqGht59yNAAhO1TfrzB421F0qBB
	 fW+kPTpukK4suXB25Ul48crtKWPLP4WgGp+FQmHgf/m+pdLvAewWKJESsNXBcWeGcA
	 nsry86QtKmMJ+VkgVmeVBnh219W9JQqWLI2GbjQryRyEa1U/K7yVs9c/S5ham2KW9B
	 S5/U9pQjP1cZDriNj2MlDZLzWoK/x7E2Ee2e2ECAO3FVGhGsGdZBxNwu5M51acSlU7
	 P2KTkyzI+s1Pg==
Date: Tue, 17 Feb 2026 09:02:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, yifei@zhan.science
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: qcom: document
 google,bonito-tianma board
Message-ID: <20260217-handsome-sloppy-degu-5e14ad@quoll>
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217000854.131242-2-mailingradian@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93075-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C45DB14981A
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 07:08:49PM -0500, Richard Acayan wrote:
> The Pixel 3a XL is code-named by Google as "bonito". The
> google,bonito-tianma compatible represents a variant of the Pixel 3a XL
> board with a Tianma/Novatek NT37700F panel. Document the google,bonito
> board compatible and the google,bonito-tianma variant in the bindings.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


