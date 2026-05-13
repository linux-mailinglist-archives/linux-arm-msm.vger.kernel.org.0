Return-Path: <linux-arm-msm+bounces-107496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMCECVz5BGqNRAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:21:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12D53B626
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A6F13047759
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E8B38F658;
	Wed, 13 May 2026 22:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foHy/YLN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3858638F64E;
	Wed, 13 May 2026 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778710839; cv=none; b=AQiCllTgKZFZhITimblWnRj/xJbPDmW59J/+HAtU/iSKQEsZBFctxwYAy/eO3ad7+Zn2yhiPpuEe4Znh4BGElzGN/yKyf1+z//NwcJalNtonhubAvfhZnPD47piW4GG7Df5UcXULYn1qiUrYyYfPMR3p7VWE58R11pZvdwFqV+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778710839; c=relaxed/simple;
	bh=pofwpBvhx7QxWA5OOoSTblEq/FMPXaqokvwjXkTXxa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJR4HCdz593GvOmAxV6xYZYRIKhhQB2ApIaJo5D0kiZgq4t+ipXZtS+MWILUG+NYw7Fq6LLYuVGwmRhJKRrF4TztUV8+bcGkVvG+g8vgEh8y6tl2Y8CmQ206EehBotZreXMYoQZzQQQd/X+r+17kLuszXwtFYJwIWAwMxIZfA80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foHy/YLN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC06DC19425;
	Wed, 13 May 2026 22:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778710837;
	bh=pofwpBvhx7QxWA5OOoSTblEq/FMPXaqokvwjXkTXxa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foHy/YLNXuxuYGq4hlmw1bZoyt15rDuQoiHIH42tfmBIhaTKv3caUvdVeRdAuk4tg
	 nI83Y5tcJktDPph1a2r0qlgNJREU7eOx0X7nyMgQm1CXSniRqYuq1pGbR3Uap0Hnp/
	 kP1qK39wEjYV0SGLqNs2tEtzq+ZlX1dP/W9Mr4i1Ful5YusrO24JrbDBlbFnC+kAqN
	 58X8fsr/bZjenmK7jQ2+/B5KIPvHnjSBx2jLEJ0fO/II9WBhbHerbEgsca8711EEGQ
	 lLDfZ0zq8Yacq1nlRAtB7LFHpZkzHDTe6xC53Y21xBqGO8WBK2G4o48u8EpbETVqD2
	 uT2115LDjxWoQ==
Date: Wed, 13 May 2026 17:20:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: William Bright <william.bright@imd-tec.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add IMDT
Message-ID: <177871083365.2029064.7527788282135458599.robh@kernel.org>
References: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
 <20260507-imdt-qcs8550-sbc-rfc-v3-1-47d3d3372b33@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-imdt-qcs8550-sbc-rfc-v3-1-47d3d3372b33@imd-tec.com>
X-Rspamd-Queue-Id: CD12D53B626
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107496-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,imd-tec.com:email]
X-Rspamd-Action: no action


On Thu, 07 May 2026 09:36:40 +0100, William Bright wrote:
> Add IMDT (IMD Technologies Ltd) to the vendor prefixes list.
> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


