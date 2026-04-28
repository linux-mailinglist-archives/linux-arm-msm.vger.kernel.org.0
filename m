Return-Path: <linux-arm-msm+bounces-104874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Mw8MPJS8Gk7RwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:25:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6947E097
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7123303B7C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 06:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F76345CBC;
	Tue, 28 Apr 2026 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6o5jI20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C533F8C5;
	Tue, 28 Apr 2026 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357424; cv=none; b=KaPbsjtsH7wsh94q78/CYiQye8OznpDZjOW8NQ7InIFwNUB9uGWhht0jPCK7fcqo4xEMxdVDrBL1wk8WuaSwCgRQ8B6cSol/gBpBV0qipjzK18+Rcnl66GJyZnGZwfRfdPgDQzYS/9iNHV65kX0Q/7sf7UWXIU101Ele1NRY6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357424; c=relaxed/simple;
	bh=UZvg/yE8LIQ8RPyblTF9R9063/jm4KfLUiOFsofAWxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=damfz43PpZz3j0SngjSg+QxwEOOwY0tGaiDPPcsHp4nGnOSCTIMEvAZinqkvW7Flk2Kj7Dy9TUf/9G8AjaYYUBd/jcXc/rEHDFslOEgGESrZZ+Py5tE4Wm2SG2rh1OlxFWJ9GkdgS4NwAPphUaoh2RA+AZpWQCf2ZBS8YgmNuiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6o5jI20; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A662BC2BCAF;
	Tue, 28 Apr 2026 06:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777357424;
	bh=UZvg/yE8LIQ8RPyblTF9R9063/jm4KfLUiOFsofAWxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6o5jI20pgFjCSE0HckVSr3w7+cssiz0Egfd4cx22ZegutU6eKTlcznByt1XTQpYp
	 Hub1Ao4F0qqkiIeSsW+UoEqqyo67lxu7JjVI6wU66YZawJJsXhXyoYfJxVRhKFc8r+
	 5ih5g6KzMmYk81fM9H4y+8k8zessHh6v0zJOKgDzzqlVrHTGMszf6fEyg3FXGlroJm
	 mhii7xHhqoMPD1dtTeBccCNj+Ukh5uX/gW+lU/O1VBoYPGbux2dvWBR6A1MUk6mVz5
	 6W71old91Km/ZvMIMrATzMAPnuEWo+5U1qkJ9sHq0UuloqTCFOyLOduAr9sVyMsPPh
	 TQ3kOaCO58MJQ==
Date: Tue, 28 Apr 2026 08:23:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document
 Nord QMP UFS PHY
Message-ID: <20260428-portable-ultraviolet-swan-5f4759@quoll>
References: <20260427012732.231611-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427012732.231611-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 56A6947E097
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104874-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 09:27:32AM +0800, Shawn Guo wrote:
> Document QMP UFS PHY on Qualcomm Nord SoC which is compatible with
> 'qcom,sm8650-qmp-ufs-phy'.

Why are you naming compatibles not devices in the commit msgs? We never
used, never asked for it, there are basically no such commits. git log
can help here, for example  last commit from Abel looks reasonable
(although repeating "so use fallback" is redundant - it's obvious).

Best regards,
Krzysztof


