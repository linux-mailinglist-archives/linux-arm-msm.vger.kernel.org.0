Return-Path: <linux-arm-msm+bounces-102067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG9dDJ+s1GnNwQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 09:05:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8AE3AA9E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 09:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF07C3006826
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 07:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98A538F638;
	Tue,  7 Apr 2026 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMjJ41fX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633124DD15;
	Tue,  7 Apr 2026 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545495; cv=none; b=CR8RyyeRgT+tCOaSB3dD8O+vRtLxAI8umddNUL7fS4+UzUqwNFDWL8zmeCfOSAya1+5W/74AMg5wCWeJZpmhBfkZ993QBkOnq0zU6MrzGc2C++Sh317MWCRvATanKHZceWcgFlDSQwNQ2+QOQ7WG0tj1akhzfxaD1Xl0l3qOj3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545495; c=relaxed/simple;
	bh=1E3mW74pLjjtq0bTl03zOtsPzX4+v84/2cQR0JqMVv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnWbItynpvt68Ue3Mm2ji/5odeVEY5Yj+e4vHvEPxiHornXvmHvXhThYnjiwkmUxS9iYFCoSooy0gQpKotMcX7RrbQmNAO4fHFn+s0oxW1tHFVe2oYPfQDIxQqddNXncreQHRn8Nu9PitZpqqUekw4fmmc4Lga6CiyeuhrV5nws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMjJ41fX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5ADC116C6;
	Tue,  7 Apr 2026 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545495;
	bh=1E3mW74pLjjtq0bTl03zOtsPzX4+v84/2cQR0JqMVv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMjJ41fXIzImZ2L2+CsgZ9pP8XhmQfFXwxUvWEigRhdoZnsF7mWPvKnhy9L1tpmnP
	 7gMJ2HwmvpQJ8SM/jF8MF8JBjHiFgJ0m9lkYnGEsH84BNUJa0OPEfKga1vGliuWhFn
	 zaRDiQX+NOixk9Y7halpKlPRoaVhBvjh/DyNgsP4gdMKMsnngVib+7D8YtxvfOyfvL
	 Y3T7UayOBvzf0iLRHxcTFL7iSud/0xsp4p1myaYEaR19SDOmXNMLnAJdMgJfq5NGQz
	 6bjROML7eT11QzCjeK6zLEu5BKBF87n/dssYfCHZ0qt8zOmVLD2avZ1WQdz8yQyqBq
	 8kxQGGCB0q6BA==
Date: Tue, 7 Apr 2026 09:04:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Joel Selvaraj <joelselvaraj.oss@gmail.com>, Jens Reidel <adrian@travitia.xyz>, 
	Arnaud Ferraris <aferraris@debian.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco F1
 Tianma variant
Message-ID: <20260407-furry-cream-monkey-25be9a@quoll>
References: <20260405-beryllium-compat-string-v2-0-91149be07835@ixit.cz>
 <20260405-beryllium-compat-string-v2-1-91149be07835@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260405-beryllium-compat-string-v2-1-91149be07835@ixit.cz>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz,debian.org,hotmail.it,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,ixit.cz:email]
X-Rspamd-Queue-Id: 2C8AE3AA9E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 12:54:55PM +0200, David Heidelberg wrote:
> Document the panel-specific compatible string for the Tianma variant
> of the Xiaomi Poco F1:
> 
>   - "xiaomi,beryllium-tianma"
> 
> and require the generic fallback compatible:
> 
>   - "xiaomi,beryllium"
> 
> Update the binding to clarify that all panel variants must list the
> variant-specific compatible first, followed by the generic device
> compatible, in accordance with DT matching rules.
> 
> The previous binding documentation did not describe the Tianma variant
> and did not clearly specify the required fallback compatible, which
> resulted in inconsistent DTS implementations.
> 
> No functional differences are currently exposed between Tianma and EBBG
> variants at the binding level; both rely on the same generic device
> compatibility for software support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


