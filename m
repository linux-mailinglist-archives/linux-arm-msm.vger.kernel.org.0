Return-Path: <linux-arm-msm+bounces-96150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNyxA/N9rmlfFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:59:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E07023525C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1070300E158
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 07:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BED36AB49;
	Mon,  9 Mar 2026 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsBect3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1653364949;
	Mon,  9 Mar 2026 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043179; cv=none; b=TxXqciFsRpF57jvwpxFkO2p3Rxe6PlHXBiQivSSWb0HfaZx5I6+2bBgYotbnak54J3REANivVm83fGRpfSBYcB+y9g0urHguP9w7RsQVPAXvtZI96mZnbc6PX8iazJOHCtZ1p4KXV3rRADib/Sy5saW21kEZK6alemapm7X0IFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043179; c=relaxed/simple;
	bh=AmQ1nS2zyc0sUJ2uhGJZX9J80wtUBl8yKWD2iPmS5AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9seVdUEcaXJ6D+mtCJsdyNMP0fEd33hv7g3gX+UEBsMY1+3eQ9kwRHUfEPBUk+cunoPmaBXSSkpHhGeVR/mZv1/Nok+C5jFH6Y3P+gADcEi5MkSbm+RCi4X0hZHgYFEEdQjU/BvCJ/TsiwU9iWwT20YV8O2Y1AjVRlCHnKrVVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsBect3j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10508C2BCAF;
	Mon,  9 Mar 2026 07:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043179;
	bh=AmQ1nS2zyc0sUJ2uhGJZX9J80wtUBl8yKWD2iPmS5AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsBect3jA1jne9A+CjbtjgLjNo5MPmLQ4LbgFT79yqUIT0pYJ5b9YeTFFArMcJFre
	 LuiGcWhtV6JIlzRmJdN2+1BtVEHVsIulM5ErM6luktOVDMlE2edYskcIOsBBvofjD0
	 f1vDHNsCEtHm0i67cctxC+gMr0mhvz68dUwK0iCCVxjcEjFJhMIZkmSWG2wMWjQSD6
	 4Dx8LSJyKHH152xY0nKcF/IVkmo3W+E3MubXGcxOUYSHLWH1cr5MT4qFLTizVoJnFO
	 1YggIM2UdPTa6fdSwtGawUPjr27R7/K3aevruVaDlpCGPkDDamUioSjmPgONqN3xAQ
	 ZEnQeGQspIG+Q==
Date: Mon, 9 Mar 2026 08:59:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add ASUS ROG Phone 3
Message-ID: <20260309-rapid-kittiwake-of-justice-ea5be9@quoll>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
 <20260308-sm8250-asus-obiwan-v1-1-3c72941eb796@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260308-sm8250-asus-obiwan-v1-1-3c72941eb796@pm.me>
X-Rspamd-Queue-Id: 7E07023525C
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
	TAGGED_FROM(0.00)[bounces-96150-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 08:40:33PM +0000, Alexander Koskovich wrote:
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


