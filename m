Return-Path: <linux-arm-msm+bounces-100538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DMGB/rDx2lAcAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 13:05:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A134E501
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 13:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 379393033E5B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69497371D0C;
	Sat, 28 Mar 2026 12:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIOybRmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A221A457;
	Sat, 28 Mar 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699506; cv=none; b=iv+Y8UzPyUh90p2umndvEkOJvzv+ltD8DIdlK82HBxQhoDxgW+S8ZEZH3Lmo3YJdUZUfWhWAMO8hE0x61UNqqI8kqlU6eRCJxnczZJLLxDBNloLmkEnsDDWm9T5y5zzSg2ee1jrwfFJrTiekv1H6l91zgkSi7sc6h/tIN2fjFrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699506; c=relaxed/simple;
	bh=iEyN33zGewc1XgxgB8M5s8QhjAal00jdoinGDPErVIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qno7cgHShNUA6KssPCkxEYhRrXBPEcy01vGFA6i6LphywZRfEtQqR42LbYcTSGovFWqGI0KAgxHX9KWlqr20VD03Oyei1rxntfT7Y4XCwT+oCY+oNUJZ1jL+xhs2809PvgYdcNF8v9apwCIn/yQUdAu6lp8Yek8i3qb9K4ePIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIOybRmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54D5C4CEF7;
	Sat, 28 Mar 2026 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774699505;
	bh=iEyN33zGewc1XgxgB8M5s8QhjAal00jdoinGDPErVIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIOybRmPqc96WQ8IxxFLC3eHKhUHPTYyTIUa3mNXJAkS2YkdXna7fQ1F9OYeLCY3B
	 C4P1wyNTprfbllsGsihVr3Jxd0mmV5J74/aqzt4xSCiKpf1ZnaUg3BuTjHo26al1qD
	 lApLQonO+DLVcbmisHKBIEulCAcSRbfCe6Sd6wS9bQTmOw8+FL2dohPEc4ThzK0UCW
	 4vcL71XpvclwlwuBmsH3jVbdedv2+oVNCZo3XjtyCEUaxKaYfRzaffCB5Cdr/FIPqR
	 74edaQmmfIKtWVfFFCVuXS0MscQgNfZtf3VTrXpbxtw4Ssy9KE1RwsmdGVlFwIM03C
	 DBLFnEGBWRErA==
Date: Sat, 28 Mar 2026 13:05:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Message-ID: <20260328-nondescript-bipedal-cow-39d00f@quoll>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-1-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-1-06edff9c4509@protonmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100538-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[protonmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: D13A134E501
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:30:47PM +0100, Cristian Cozzolino wrote:
> Document Novatek NT35532-based DSI display panel.
> Since it's not possible to identify panel vendor nor id, add a suitable
> compatible (matching the device's user, which makes use of this DDIC)
> and set "novatek,nt35532" as fallback.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


