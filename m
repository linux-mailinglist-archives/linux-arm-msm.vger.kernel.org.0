Return-Path: <linux-arm-msm+bounces-97715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O3uOi5xtmnUBgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 09:43:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAEA29042D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 09:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5125D302961D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 08:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20062571D7;
	Sun, 15 Mar 2026 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+oZHyQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C940DFD6;
	Sun, 15 Mar 2026 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773564201; cv=none; b=c6800Bqn4pJ78by7k3YeKKHfNp/Eh//GOMgtEzMN90kdy17YSdsxDtLdyOfunMmlqbQ3YE+CHswg0ion5RLdgm9gy+Els5wPkfiI27VZoIf1InIk0RSNpdL6OLkNDDMhhyVq7ts3xFE4KSGrGfJknH5/7zPGICEkHkRHKRxf3v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773564201; c=relaxed/simple;
	bh=i+oKNLQ8baeuxEMt1lGg1rQES9cmU7AYGTolhlC1+Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SG2/Oq7IbVcGJVZcGCRdablYe1lOrKnPWHc5vkgjlPDcYv219B0YytaIyzVK7TLeW4Nz4HRE/2LkHZmZ0Zat9UnjAAuoe35m9uJ+KE6XmIVxv5zp34eCPe+dwbocIDHXf72G2Q2a9IcMI0Q7iGJ2i2GyARY+pzKfPsQlOUR5Hk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+oZHyQW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78B8C4CEF7;
	Sun, 15 Mar 2026 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773564201;
	bh=i+oKNLQ8baeuxEMt1lGg1rQES9cmU7AYGTolhlC1+Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+oZHyQWR/1YROfOY0jmuW7oAFMpAZKnLjEJQ0QYZKmfPPrQS8yXD168AskUSKVjb
	 tbFXXdwLac9FCsh1R/zUQd1bZFtdTBa6YyLYrhx8THxXdqzFxeo5lNeAzG1Gdn+s0l
	 TTZGHHvrTYJEQpsMCIw98gf+cLxT8VVUVwRmAwertfBiDQW0OKp9TZbwjqMKgQv8Km
	 itwxIm7SoL+FOqI9Rvvu3dfzdxTND3NtjFbWKr3gMcgTYwh18ADmudBP/xzPyMQZ5I
	 zmt5nGcxdKCYAgtEFbXqKYQ+80nAAULUgRBsfxGaVUXyKOZff3febs4OGMF3+DyvtH
	 +G/lIGwT+Wrvw==
Date: Sun, 15 Mar 2026 09:43:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FCO-M1906F9
Message-ID: <20260315-misty-organic-dingo-50bfc9@quoll>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
 <20260314-panel-patches-v4-1-1ecbb2c0c3c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260314-panel-patches-v4-1-1ecbb2c0c3c8@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-97715-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AAEA29042D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 11:46:21PM +0200, Yedaya Katsman wrote:
> Add Samsung S6E8FCO DTS binding used with the M1906F9 6.09" 720x1560
> panel found in the Xiaomi Mi A3 smartphone.
>=20
> Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml        | 5=
 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


