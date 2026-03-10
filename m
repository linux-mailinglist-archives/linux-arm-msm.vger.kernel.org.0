Return-Path: <linux-arm-msm+bounces-96537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ1NNc3Qr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:05:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F4C246ECA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C07DF312FF38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444303ECBF0;
	Tue, 10 Mar 2026 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDgeF1yi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7C3ECBE0;
	Tue, 10 Mar 2026 08:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129758; cv=none; b=F3weNjnPBZIgX0KtznObrhkzkSRx6AlhDSp01C/LhqN4qvPyG3KsFXEdfLeAVd4hCQQGtgpvZoiGXSsIoz1himxbxn+/5JJSrF53a2o2bPUZ1jjvvGIYBvIL0SwqDLCwMzZPM+JMlFGb7XkmffLVcXgs5zCwabYkgnxtk7TiwwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129758; c=relaxed/simple;
	bh=/CuTZQ5ggMu+T6BsDi8Tphk/vQuf/81laWj5ijjpx/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBs+hgc9fEYfGGbzsQvA9TMxw9UoVsiqIxNVOh5wnS0m/kPTajwd5lddWbCQtZ90KBETD3QbacfgF5C7cGtlQyfWvT0Zwo+taLkOl+EJssKKNz9aQOfMxYplYQiP+i8dPs2107pqzI8+lFuWDOsOaUhCsbygquRk5yef3DOV/Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDgeF1yi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A281C2BC86;
	Tue, 10 Mar 2026 08:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773129757;
	bh=/CuTZQ5ggMu+T6BsDi8Tphk/vQuf/81laWj5ijjpx/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDgeF1yikyFBz/YeVEzlgcp5sSWrQCnuj7vz9DYXA9YaPmo/uUcLzgyz3Z7ZbK27R
	 78gtlGAYs47dS3batB7Tmp+Pb+3r+jTAz9GliRAwdYh1ZMAb52JTMpHq1Dn0Huix5q
	 y4AkGjcYgd/3i6EXgVlOWggj2VrjxFnLFWbQyDMPQLtkqpGic5IWclVcEs84v7fk5K
	 bjNbCFdnCgOoUoOgCZblldHazGzd/5nK3fVspljwryl7Bl6e94y/eshyaCbPNV3AE1
	 temV11zfiEL8SftgwDUsDU1v4nDP1ISjWUnkfXJzLl36d7ZjsXVQqjyu5VmPIDETMj
	 cQr2wiWrSYskw==
Date: Tue, 10 Mar 2026 09:02:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: thermal: lmh: Add SDM670 compatible
Message-ID: <20260310-loud-quetzal-of-realization-61cf18@quoll>
References: <20260310002037.1863-1-mailingradian@gmail.com>
 <20260310002037.1863-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310002037.1863-3-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 36F4C246ECA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96537-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:20:36PM -0400, Richard Acayan wrote:
> Document the SDM670 LMh.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


