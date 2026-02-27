Return-Path: <linux-arm-msm+bounces-94473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAbAGUK6oWlhwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:37:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA12E1B9EF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B518431ADE91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9976E43E4B6;
	Fri, 27 Feb 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8z21p6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF243D4F4;
	Fri, 27 Feb 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206181; cv=none; b=bxv1SgyKyK18wfks/D7Xim1qqBWPgh24vm7wxnZUcFXYzZC4FWuIz9s+YsPky6fKwSn0Qb+7pNLzcOxPuvT+jZ0e1Gy1wFFIst/AHVy6LdnuVKXDpzQg8Vsctx2pQmIPWiiBQjhs0pAUKCJxo53Mft6IybmIVAvZ+gfZ73qiQf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206181; c=relaxed/simple;
	bh=tphxylQLpsLQejlI1TA+c65Oj0EMFn8rsKnBDVlgyZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Yx/7VdvCzELrlGGh7d1UamOPjdurDZ5g9a0lBKT4r3nNuGclzvsKiDupPYmwL+KUcYCrXvA5Z8BaWoZeDxQqYUoo0Tvhm6hAzm2dbh64wr01oq/6YvgTvoU+71eISWlL32pRDoH5nyWs/VuYylzhrQy7YrOX6uS6W6E33OHZys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8z21p6b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E132FC19423;
	Fri, 27 Feb 2026 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206181;
	bh=tphxylQLpsLQejlI1TA+c65Oj0EMFn8rsKnBDVlgyZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K8z21p6bG6mAPr0IfbUHmCRuFYfGZ+ObE9c7v5CAM8pg0UghLWHZoQHmfjCKqyB++
	 lSmpCyd1JuUM2j5K/R7lY68D7FlswDoBpnDCDn5YJnwb8qNReaE+P4oCv9LNCl76ty
	 wQKmJaUjeYS4WDSflgeRNVx1Pivdf1YYaln99ELUu/scFKMJdNb1AS9VLEfEClCGot
	 fO9kQg2e5yvSy4K5BlYF5Do2yo2fiXh27jpSpIkn6I0f3InFHbEBqBy28QDaRKfM8U
	 0DHnKU3uazwumAXKnxJNiPvS/cGPj8WCi+A4ZNrczZ51gsaSF5DNKLoSgaTd9CbFVr
	 0gjff2dpRnOQQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-bindings-phy-ufs-v3-1-2b0c0f00bcb6@oss.qualcomm.com>
References: <20260223-eliza-bindings-phy-ufs-v3-1-2b0c0f00bcb6@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 document the Eliza QMP UFS PHY
Message-Id: <177220617754.330302.8800181516621926196.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:59:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94473-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA12E1B9EF6
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 10:19:38 +0200, Abel Vesa wrote:
> Document the QMP UFS PHY compatible for the Eliza Platform. It is fully
> compatible with the PHY implemented in SM8650, so use the SM8650
> compatible as fallback.
> 
> While at it, move the QCS8300 one so that it is sorted correctly by
> fallback compatible.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document the Eliza QMP UFS PHY
      commit: caf08514bbee0736c31d8d4f406e3415cdf726bb

Best regards,
-- 
~Vinod



