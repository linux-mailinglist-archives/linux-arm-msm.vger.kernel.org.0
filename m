Return-Path: <linux-arm-msm+bounces-98482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIwUC4CxumkVawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:06:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B522B2BCA07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1604D31F951D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8CF3DE431;
	Wed, 18 Mar 2026 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ot3logi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57978387350;
	Wed, 18 Mar 2026 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841854; cv=none; b=BImm2LmPUD5BPX7ITARi7k9k+st4rzHId/VocCkTbRzLidZ/loU7EGYhBc6s6anSuzIXM7x7YmFeJwN8SE9cnUtkCypSPdzMa9Z/YEkkdGwVfDk8Wjw3JTqGOdNU1tAvu081cAn2CSGwwCj1JdJkFI67+v2P9n3EzVpPeKIK3+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841854; c=relaxed/simple;
	bh=/xr+hU9WcMqIaoVcYW6LuBk8GXXzKZ1qP8B0p3wJ7aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lRxYnSeTtjbAS6v3PqBbX61Ng2Oa22+oLeScbPYj0bFwesRdlQrCOnI6bFNkC0as4AetWtdKFQiRjVg8xWr9dKFbXtxic2ShzqLFOoNgpBMlx8uN8VKe9Rm4vEGxngo2gK/pE1Jrc/lVZbKXlKby4XJQE+FzdBKOh1egKHNGB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ot3logi1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F02FC2BCB0;
	Wed, 18 Mar 2026 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841854;
	bh=/xr+hU9WcMqIaoVcYW6LuBk8GXXzKZ1qP8B0p3wJ7aA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ot3logi1Jqf5ILP/MFQLFHWfUcnrI+aGog/U8bDkNT7SEc6cEL7O8BC0oKxRZBZut
	 qbl4VpttYZcokgo8Hu6/78domYlcru398yonIiSA6xF7wfwcdbUHyxFZ9TDtr8zcuj
	 37ggcJRYdTWTiHJZFKAMrahPDU5tcJBMJvw/t3vsD4asuKnSf7e4K+wCeuOvxh9wP1
	 7i4oyTV3ByUjxc8r5baSaS/3xgUqtSaoZ1JeXLEbwKlltC9njnMafqDW0lw2XW+q5d
	 FZk7r1T3kXiAlRdFhee0mM0SQ1DsUr+O2xQMii95SLClbPQy30Z3SYbtPm1OzJu473
	 yvUZftajpwPbg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos: Sort pinctrl subnodes by pins
Date: Wed, 18 Mar 2026 08:50:13 -0500
Message-ID: <177384182907.14526.2831113630246949410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213-milos-pinctrl-sort-v1-1-799bae597074@fairphone.com>
References: <20260213-milos-pinctrl-sort-v1-1-799bae597074@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98482-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B522B2BCA07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Feb 2026 15:03:19 +0100, Luca Weiss wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> milos.dtsi so that future additions can be added at the right places.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: milos: Sort pinctrl subnodes by pins
      commit: 41626e8fef2e58bdfee4e3cb5b13c27f5b2b3abf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

