Return-Path: <linux-arm-msm+bounces-90080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODNrFd46cWnKfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:45:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAD5D85B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEC24706E5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5562FFFA5;
	Wed, 21 Jan 2026 19:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKXOgrQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82CC3D6481;
	Wed, 21 Jan 2026 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025374; cv=none; b=MJodFUoS6tv8Ytr3XzIQEeHt1MGCl2dPsIE+lkit6bHWx8OAr9CD4/s4AnpSnhxhmSLX2IhatRvCS2bfCHG+qHMrudpmppD2s50psmIOgUv2wt2Scbhyieh85wH+eiopI98GkcdkIJUE05qMBB0gZREtyTe1ReNHDW9iHCduStE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025374; c=relaxed/simple;
	bh=5wF6KC7lKFrHsyvXzQeBOOQvE0RwI6swHUCZuVPrOI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mX00vyE9F94DJyuKDsoy6a8AOrb4c1yiPKo55RXIYpJhwCT5eEd41XRNkyRRB/vEac4XgtGcNy7GUOT17Vl+EQXkwJSaP1R5JqQti59EGD2i2iU1jCYBMPvka70FK8ernAAJ+W7MMpqFkG7DLRCHSgoVHDJ9DV31XqNpvyG/Of0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKXOgrQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F308C16AAE;
	Wed, 21 Jan 2026 19:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025374;
	bh=5wF6KC7lKFrHsyvXzQeBOOQvE0RwI6swHUCZuVPrOI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WKXOgrQOc8b0zTRI6YhQyvzOPgOBzWL1tszF1M/PoQ7hYebIggwlj4lPCTR5GbVfi
	 yJQZwCyMNxvDuKclxz7XWXGolIEPFCBHRXwnmmUzFU65eisF3T0w+Vt99+cw2cSRlk
	 Vq6mKyOWBbAmItHgIzdgY8ST4c55ZV5JckJXDZh9BgFjdEC3cUWSVN/9Zhva508LG/
	 Q1i5J+wBWNM5zg+EnusUBGn2llawymvzGE3TD1jxROnboavV+XFbZiTCS2MzpARMH6
	 i7XhY8fqDWKHPUBtVwttDNXIDP8zjUzXMWp1q6R/muoDFpGZjd9TAzRw8GX7PYddyq
	 kRVCB6mhk6mrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: oneplus-enchilada: Specify i2c4 clock frequency
Date: Wed, 21 Jan 2026 13:56:04 -0600
Message-ID: <176902536620.1171053.17901044612421280423.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130-enchilada-i2c-freq-v1-1-2932480a0261@ixit.cz>
References: <20251130-enchilada-i2c-freq-v1-1-2932480a0261@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-90080-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: C0BAD5D85B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 30 Nov 2025 00:22:39 +0100, David Heidelberg wrote:
> Per the binding, omitting the clock frequency from a Geni I2C controller
> node defaults the bus to 100 kHz. But at least in Linux, a friendly info
> print highlights the lack of explicitly defined frequency in the
> DeviceTree.
> 
> Specify the frequency, to give it an explicit value, and to silence the
> log print in Linux.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: oneplus-enchilada: Specify i2c4 clock frequency
      commit: 1ef28ee5c51f21bc3ff493dfdc175827bbabf195

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

