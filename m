Return-Path: <linux-arm-msm+bounces-99036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAgaN/8Iv2nMqgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 22:09:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 922522E7491
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 22:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9317B3018418
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 21:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ED036AB7C;
	Sat, 21 Mar 2026 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHYOj6jV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108312D662F;
	Sat, 21 Mar 2026 21:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774127356; cv=none; b=qFLNa2g57g+L8f/2l+Yk56k5z/zRpHpO5MGust9Cc+15TmjHgYyfSgZP4eJH/RPB8pEmv1eIKD+UpwAUnRf8ay+qCUBrVsEVAeN27xhokbFeOUGQuoccYbKcJ5YGgfdPcOsLf1ccdCUlv6HQO+uc0QWRAvporSkN+IgZdOw8koU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774127356; c=relaxed/simple;
	bh=ZKtofwLXB8u9hnzzE7i2NDTd6cfrMEOT41otDtZl9bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzSQSbKYaUGKc1T1LJRYeJmo5RaV5jcKK4adfbw1UcPPHK0kV/OOD07aMCjoBuaOfbpVNG7hk92e1z1wttk15W0rW5I7YAu95X1+mZrsmBY96PGXbXof4yHnpA0YAgMAwgqEYSxCKWESZnLbhpBzvgxmq9j9AnXbW6No+iqEPKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHYOj6jV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26175C19421;
	Sat, 21 Mar 2026 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774127355;
	bh=ZKtofwLXB8u9hnzzE7i2NDTd6cfrMEOT41otDtZl9bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHYOj6jVoN/FbTyr8/OtjlbtCfVVYIjqLY99pDRX508fwzT5a9+0hozoNS622OyYv
	 g+AF/KMuqJAA7N/afHio0FL0GBIm+QSpdJdH13WA9eZ0nIGaHCpj5bYcv3h4dcgbq3
	 S4r0VfQKkqrF7RKPc5z157OGGfmRS+mdhLoiA+FQC0DHZoZaavCPWLyLD0nMZ8q5y1
	 +AiF9gCKbc/+1aQjWELPeiRIgtoSUmK2gImqQTVe0T3a6DUp4jG6DjVUtKl7ugnYHw
	 8V4iNWycIRlRv6IByowPzI6Taq+9JtcB0G0G5p0eHM/3Zmd2PpyIlTArePMZuh9sIl
	 3fhynfSXVY7RA==
Date: Sat, 21 Mar 2026 22:09:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add the Nothing Phone (3a)
Message-ID: <20260321-humongous-discreet-quokka-d6fbad@quoll>
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-2-4b902901cb49@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260321-asteroids-v1-2-4b902901cb49@pm.me>
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
	TAGGED_FROM(0.00)[bounces-99036-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 922522E7491
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 05:00:40PM +0000, Alexander Koskovich wrote:
> Document the Milos-based Nothing Phone (3a) smartphone.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


