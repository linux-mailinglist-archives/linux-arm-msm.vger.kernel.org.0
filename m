Return-Path: <linux-arm-msm+bounces-106816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM+ADwV7AGqbJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:33:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0011E503EE7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D29C30234C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C05382289;
	Sun, 10 May 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEGCoaK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D67DDCD;
	Sun, 10 May 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416300; cv=none; b=JLJMBtqIQFWrNZ15cqRuumPhJDVBqFnWs0TviTXgqZmuuzz0IpSnq7amNhhQSdFub3Iy9ZRgaGb9wDF+cS7MDroQQs1ckinMUt1vHciVOtDeQWWOfd/NS4pKyvlal+uXfmJrsjE4VaK6Vgb9DAVJJu/XDhFxzhF8UW4YtHKQhSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416300; c=relaxed/simple;
	bh=QhiPJ7oNWRgIuuxn9VuTh0SkuqQDWzHNu7+WPzds+88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F2EQOp/UlfoEj86/XRQRFRbLm3An5tKIf/YJuCtIEd50503UJDY4+wmw7JlH9UAiwtfgN4pDQry53Omh3TEKZ/e7pfZOwolQwh7OjXbrSxeRrJxtF7QXSjDdITlmg9dZoq9BLqDDmyH5gyoTnCTu5rzqUzVJHpv7CAszKgQDayM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEGCoaK8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BAEC2BCF6;
	Sun, 10 May 2026 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416300;
	bh=QhiPJ7oNWRgIuuxn9VuTh0SkuqQDWzHNu7+WPzds+88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nEGCoaK8CBx9+6oIWFcahlJtSwNBdc6FjEkcjc3upSA+oZ/1wf/6G9O1PbZX8CzhF
	 vvWpBvR6XjVjSycBXZlPE7wS1ir9Hd5TZfAjs5CdxG2xhNtO+XFQh5hC9HtYA4Q/CP
	 /gPnUKX5JNFg3D/0tfPMod/+K+S1rNorYe+tFjg5mQyhjtRLicji2NIJs49q/9f6E6
	 OAsxAtUKG3HJhK5ARMPetK6qAMdjUuQo2RTmDsuPlYZ7CJN9ArLbxp45HfsSU7N/wY
	 TqPrW0gjVi8Ar0AD+9sFxNWb2S6B/4Y4qlSlnVSzqLFhGyQ4cHAC7MDLaZe+Se6tEk
	 qfk/J1qKShLMw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com>
References: <20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Eliza QMP PHY
Message-Id: <177841629697.434434.1495203271597382952.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 0011E503EE7
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
	TAGGED_FROM(0.00)[bounces-106816-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 04 May 2026 19:03:41 +0300, Abel Vesa wrote:
> Document the compatible for the USB QMP PHY found on the Qualcomm Eliza
> SoC.
> 
> It is fully compatible with the one found on Qualcomm SM8650, so add it
> with the SM8650 as fallback.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Eliza QMP PHY
      commit: d67a337d28a2d852ff539e983ad6790caf9c95f5

Best regards,
-- 
~Vinod



