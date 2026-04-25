Return-Path: <linux-arm-msm+bounces-104509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Xd3vMr6X7GkOaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:30:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23506465E79
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74E68300C58C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 10:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91B3358375;
	Sat, 25 Apr 2026 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf9xkQ6Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4099197A7D;
	Sat, 25 Apr 2026 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777113019; cv=none; b=fif8zCxcV6kwtMU3NbQ4uTZpgy//vQPKDHG8jievfUu8KVwRXXywsjWv+y7u9LBZmtUCqhk+m1AMs4dMi+iZ1U60vCg56yTgOdAphnFFcEcMuW85I168mrL8uz/zev0HxMTN8Mwytlb8LQZBUY9TiLhSFDpp7SB41XTkGwJgxGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777113019; c=relaxed/simple;
	bh=9W5XQ9Y5FnZ1fV0MTfPITY0G+g8luMutrskj6zjzmUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUsONfRbbOibBZo4L2fw7I+o7Qvqvnxyp4SKcMN3xoPiPYicA3qxoUcApp17A0yy2i0I7JIyk0XHQ4RP1F4M/jE5z02mP0upAaP01rOevlNxtFZUnzYEZ+eXvrDwRmhVP8+zhiMTHq1NB1nol0aFnGhkMxyiHE6FF6MP8yTt6gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf9xkQ6Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C5BC2BCB0;
	Sat, 25 Apr 2026 10:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777113019;
	bh=9W5XQ9Y5FnZ1fV0MTfPITY0G+g8luMutrskj6zjzmUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kf9xkQ6ZfWoZnl2xRqQ1+0kpKaUs+TrzltAoI1+jWzy4KFfWQqejw1ecPmDObirlq
	 9xLrxCaKgNoKNaT9QU+1aYcBisxgJofb/DCH8EqdMUAYQ1qEiNqdP2rBut8YA3zvnG
	 wEUfhsVDf2rdocKV8H4WPc36++z2KwGJvE5M5pDpjhsOHjuC5SGgSek6U5t6l6C06F
	 dp3TjjtKje/lh7f/mOlZiF5HRTtyE6AuKTnUaVVYMDOVgKG74arYaVc5MG3NYCJwJ0
	 KI4JsHTRfpnl+tMaaCP8K4vN4r9KRyUz08nBiMI5joSJWQGtIXNYSQsM2OZhCoY85A
	 XVyv+v+W3E5tw==
Date: Sat, 25 Apr 2026 12:30:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robh@kernel.org, neil.armstrong@linaro.org, gregkh@linuxfoundation.org, 
	dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, 
	wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Hawi QMP PHY
Message-ID: <20260425-vigorous-olivine-tortoise-ed9fd0@quoll>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
 <20260425070002.348733-2-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260425070002.348733-2-ronak.raheja@oss.qualcomm.com>
X-Rspamd-Queue-Id: 23506465E79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104509-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 11:59:59PM -0700, Ronak Raheja wrote:
> Document the Hawi compatible string for the QMP combo PHY.

Not compatible with Kaanapali and/or SM8750? That's quite obvious
question thus commit msg should briefly answer to it.

Best regards,
Krzysztof


