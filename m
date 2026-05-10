Return-Path: <linux-arm-msm+bounces-106815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePrHAe96AGqbJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF74503ED1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E003A301C6C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001AA381B02;
	Sun, 10 May 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rskRqXyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D7DDCD;
	Sun, 10 May 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416296; cv=none; b=iEwmyPZMZe5mj3/5/Wgp2smc6G5n3DtwFkCbToz5ITSJhpETijwV/J/0JT4HkMSLcDDJUylfSjumBz57pUOisW2zyykhXxvL8x/OcCIUIytG4TUutwPqpZ6WPDgKSC1s4uka7sjvVWgHCvR28BVqR1Tql8/26DNIsApojfBrX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416296; c=relaxed/simple;
	bh=85ViDbyhtlLOHmHGANQF012puC/WIzPubMcUz9Q38lI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rx758i31ew9UTlkmZVyLgpzgFXfNyMS0y4B1rzlZS9mwf7y8LDsV3xBZ5H1a01ShzuoLH3y8rwcjFHtJXFeZT8rNaexE5sKtvMsjG98+KtsBWcXO/UnZp1dckJ8WTlTH/EszGgRXX1y/o+2Texnb4u22qrBosdYnVhEI8fOBlqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rskRqXyk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A50C2BCC9;
	Sun, 10 May 2026 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416296;
	bh=85ViDbyhtlLOHmHGANQF012puC/WIzPubMcUz9Q38lI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rskRqXykLAOUOLUky/WlD42tRwjncgM1hKZ3d+g9O02qJsXePD6A6P9jPyWyog6nX
	 M4aDToaA/hEzLDXjkINomAN9hGdm9vW5x1g5WOI0g4dZgdSVqmosIWP24jdwAOaUPd
	 Zg/xrC7m6VSO9V6S2vztfzrAif+3JcSVucXoFvxppiOlczoNzjTPUg5zrArDNqmIgm
	 PMVX9f4LL4mJccXPOTKJgRsCkB9LiSTUe6cG1UnmwO3pPcPsdTZ+qsI47yYBYWEGCC
	 YHyQ+SZ2VY+uECQn5A6l2cW/mVCbz3BIcuPEMBrscv/MefT7NHFZYZtEuE38NvEGt8
	 mkF7y3itZ5lhg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com>
References: <20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,snps-eusb2: Document the
 Eliza Synopsys eUSB2 PHY
Message-Id: <177841629280.434434.9813590038989489430.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 8DF74503ED1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106815-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 04 May 2026 19:06:46 +0300, Abel Vesa wrote:
> The Synopsys eUSB2 PHY found on the Eliza SoC is fully compatible with the
> one found the SM8550.
> 
> So document it by adding the compatible to the list that has the SM8550
> one as fallback.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom,snps-eusb2: Document the Eliza Synopsys eUSB2 PHY
      commit: 78a6a90a5c4ac29d06fc8119885b80f919950d00

Best regards,
-- 
~Vinod



