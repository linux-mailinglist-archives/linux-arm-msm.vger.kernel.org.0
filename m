Return-Path: <linux-arm-msm+bounces-101838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OrqJ0MV0mnmTAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 09:54:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 053B739DB7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 09:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8132930078D8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 07:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E111736AB49;
	Sun,  5 Apr 2026 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uN1EOdZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE07E33A716;
	Sun,  5 Apr 2026 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775375680; cv=none; b=l2GHzp/hbTzeriy/rfTgaFRNBGuzGdYq4jUsutey59KEtGF6fpcVAanVdxl+PEMMQBfohuGOSA2afk0U+cEHGQXZTXy/WMs9u3rB4wRNrAcdacrt8oXocZ9801lew6ajfVKSSPtbzmeOKBJ/ykU8tHQKMvHosWfkQGHdAk+7BJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775375680; c=relaxed/simple;
	bh=/jTPoYwaAR92pVxKd0HN8Q8eXw62MmgYEwjDtz3SUT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MK5PkX/PmPTHta6VrYK2dCg3b2rN0ggbuv9OxnfoyLEou/Fy3bjgX3D4pJfyEUHzv1gkRXNS1MlIzCSKsEVN6AA4EsFyPsa/CqZ5hLoWhZL/aLq3+sISaASM2cac/18OqyxMEwzYyL+7nA3Of33EReAvPSXYIisH2DTlC6cTCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uN1EOdZJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47DDC116C6;
	Sun,  5 Apr 2026 07:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775375680;
	bh=/jTPoYwaAR92pVxKd0HN8Q8eXw62MmgYEwjDtz3SUT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uN1EOdZJoUZ6EN4FuzTsExx9Nu43nun29BKDUyvmzbCYBi1Tn/e8ASNAMba75Ixdf
	 Z4ddR62O22pSumcJ1oF8nFYwThFxuDDQXAkIPOJMGG5cWTQGhjpNjZGXaVKOauyFpL
	 ewm57vlIjhUva75h63xdI7J2sVkQgzrLIPfPz6mkqi/sG2pJFU14Zzhrw9OwyWYUwu
	 wK4cCm2oFd6ylBr3y28RKlwNY6rujxYdTaA//FNgqDgTcDzY3uAD10V5744hFmdUIT
	 cPwEqxkxGG3SL50eAuX/DQPTJPv0VnduhFCBQ537heJY5mVOnD5cML/9mRHMZcD0Nj
	 wSMlxUuLhgmoQ==
Date: Sun, 5 Apr 2026 09:54:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: sram: qcom,imem: Add the Milos
 compatible
Message-ID: <20260405-rampant-green-harrier-eaf680@quoll>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-1-4244ebb47017@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-milos-imem-v1-1-4244ebb47017@fairphone.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101838-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: 053B739DB7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 05:00:23PM +0200, Luca Weiss wrote:
> Add compatible for Milos SoC IMEM.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> index c63026904061..38488e28a6b4 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> @@ -19,6 +19,7 @@ properties:
>        - enum:
>            - qcom,apq8064-imem
>            - qcom,ipq5424-imem
> +          - qcom,milos-imem

Wasn't this imem binding supposed to stop growing and switch to a
different style?

Best regards,
Krzysztof


