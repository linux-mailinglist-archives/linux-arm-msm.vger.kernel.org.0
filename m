Return-Path: <linux-arm-msm+bounces-95723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPtCNPKLqml0TQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:10:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C521CE11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5E9D300CFE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F2437186C;
	Fri,  6 Mar 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJWxEhbP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C3377ECD;
	Fri,  6 Mar 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784623; cv=none; b=uxeO/kdlkNlLtbSUkIdn+itafnPhRBREy/dbacspi1k4TEzQ9wFsaCLWoxVnHb/sOTDKrlYXQiVKNTjmuoQGZ12sGsTFoVfPCXWKkpKHGtMS/M2ePR1A9z+hNva8QiIlm4jvYlmEq4sA5mURJq5ExAj5taWcH9jSnvpG1VRgQZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784623; c=relaxed/simple;
	bh=8oeKci9lZ43gNpYbbcIUx8piLV22DLOROu/z0IK/Tdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrDt1o35Up9rl0CvsQ577RjHMojGwEHHf6ny2JLRAj42/UGL+pDlXoijlByJm+HOPfkXDs9e+nL1OAqNYBxWLE4HH8vdyoOcZKCJ6G/A5gJYP33G+9AbhXW2KC0sP9eCdj+/XKidY/1zcUo285+BnO9F3fv7l+jFJgoLsYezJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJWxEhbP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4209FC4CEF7;
	Fri,  6 Mar 2026 08:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784622;
	bh=8oeKci9lZ43gNpYbbcIUx8piLV22DLOROu/z0IK/Tdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJWxEhbP/75mwy+rJUvacHy5gPt2xNGZnU54KbHq1yZBYxJQNEX41KK3CUNP3jMfp
	 EwwN8rzdSrGyv49UR3m0SuaiefA+jt/W++Ked3LTfJViqi6yx7DYUmEjq7nzdNictB
	 U+3g0+my0tkv8p+bZ7qyIH/CWRLidh/1W5jaTeuQg9ou1cmJnXqLHvTQfXfACpC9YZ
	 sW2Q03SHJRA9LueaRHKzy+b3tGOtXV/jtM+4688viyj2ek+meT3TGvVduPoOh5+kOK
	 CxgDwJWFGIftVQlnOXGlAw+XuslMEWtr1d+kQDZeyfDTApP1XmrgLwq6ht1ey3MSTx
	 ULEhhG7GPEBhw==
Date: Fri, 6 Mar 2026 09:10:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
	Katsuhiro Suzuki <katsuhiro@katsuster.net>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH 1/6] ASoC: dt-bindings: es8316: Document
 everest,jack-detect-inverted property
Message-ID: <20260306-demonic-capable-spider-acf312@quoll>
References: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
 <20260305-rubikpi-next-20260304-v1-1-327595a4528a@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-rubikpi-next-20260304-v1-1-327595a4528a@thundersoft.com>
X-Rspamd-Queue-Id: 521C521CE11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com,vger.kernel.org,debian.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:47:42PM +0800, Hongyang Zhao wrote:
> The es8316 codec driver already supports the everest,jack-detect-inverted

... since commit foobar ...

> property to invert the jack detection logic, but it was not documented in
> the devicetree binding. Add the missing property documentation.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


