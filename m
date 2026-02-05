Return-Path: <linux-arm-msm+bounces-91929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBNsAYKYhGmh3gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:17:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53800F3255
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FA5D301546F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 13:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127833D6476;
	Thu,  5 Feb 2026 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I63klihP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A23A0B0E;
	Thu,  5 Feb 2026 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297297; cv=none; b=AuREdRoMcJd3Xbqc2Ymc4B30o0ZueRR9RGd32jb5XznX6iKDNrrewd8o+/FECNm3NgeyjxWZ3A+MIbXdkYpS29iQJ9FSTW7MciEEPEzER+EDl+pfeP0zsKEq4YpH3CjN/0/U96JhrmOpjHMU7FEDmK5p+hvBB+iQarxhVlnYBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297297; c=relaxed/simple;
	bh=3htvrWmrvSHq4FuACoqH6sKFfh358sHMAnUwVycKdOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wkcl/mUf1TAFMiYLHDT20LpZppVPs6r67noQCGoXfuhmNrlOS2pA33YaPPE/L5j4+oPoT6EYSUwva0fzPEux5qgjhQzQjTE0ZS3DniPICMO2YCxwdYI2OfuQmPgFqA7JhbHJh4qidT3SGPBB3vcQtBy5vqrJcCqtwNfk4JlIoeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I63klihP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EF0C4CEF7;
	Thu,  5 Feb 2026 13:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770297296;
	bh=3htvrWmrvSHq4FuACoqH6sKFfh358sHMAnUwVycKdOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I63klihPCmWsNlnLOg36ty9odqou8Gr2zf+I/KeqB5S5fX7g0E8CvHDlOv8cP0NMb
	 GZ9oUadCs1quLS+4vMS4Rh5UuBSLd78VVMV9a3fac3jMUn9HQ2zDCzIhnw0PO0MD/B
	 mJtYmpATWAa+ys/d390T40AEDnA63yx/3Hp8/6w7zeFEGnYYZ9zy2mJisUAWcvx5MH
	 tgbOns9m+3/KxGqAgeUqtNACbeuVoYkLb6FpbFQqfhssH6irOPrFTJVJeWImRFXngl
	 eSGwOARLl2dlhVMUSHeeA5K1jR3xVthZox/UzWUINN9vZ2rxOAE1G5Z2uBgHlAjOiw
	 UPnfpKnm/ifxA==
Date: Thu, 5 Feb 2026 14:14:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: input: awinic,aw86927: Add Awinic
 AW86938
Message-ID: <20260205-astonishing-aloof-basilisk-5c2acb@quoll>
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-1-b51ee086aaf5@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-aw86938-driver-v2-1-b51ee086aaf5@fairphone.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91929-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fairphone.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: 53800F3255
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:51:13PM +0100, Griffin Kroah-Hartman wrote:
> Add bindings for the Awinic AW86938 haptic chip which can be found in
> smartphones. These two chips require a similar devicetree configuration,
> but have a register layout that's not 100% compatible.

That would be fine if I did not look at your driver which clearly
suggest there is detection mechanism. Reliable detection by
vendor/programming interface means devices are fully compatible, so
fallback.


Best regards,
Krzysztof


