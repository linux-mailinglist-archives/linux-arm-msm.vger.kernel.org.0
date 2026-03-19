Return-Path: <linux-arm-msm+bounces-98576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBnnFrZju2lujQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:47:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BFB2C51AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64EEE30B78E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6457238759A;
	Thu, 19 Mar 2026 02:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP7TPw5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4109D36BCD2;
	Thu, 19 Mar 2026 02:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888415; cv=none; b=ETycbJX5+D20ZtSmuQfY5Aw6Hul2isqb74ZlA1l3hL3EQMS81fHX53oZny2X30ijzVjlRvPJ4CCi29uW/t4n+y1sAeMiZ9fjc6UnHO3Sfw5gktl+KBfDUe6XCAy48GKUA+8twLnNNVbjfOA2MCOesdSjjyXsg5wT2R3DvMGNqrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888415; c=relaxed/simple;
	bh=HCHLwFhI9sa+PL0xV+I7XMBUQAK1e3oxnUPQvMuOkuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4jKHgElFB9K+ycieNwKgvUdxWB2H8wJlRDwOkimZuMAL5tHJy5JyI/WrACS7F9/t+PoWTaM6STo844LuMiQ1sSRjGeJRCHCM6eLG8p2CSzEIW3RDqvKmFtG/6f0gz3D5dNIm+CPzl5l907HyWeZQ9soc5jd2H4BmlYAOU7LTs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP7TPw5L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A841C2BC9E;
	Thu, 19 Mar 2026 02:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888414;
	bh=HCHLwFhI9sa+PL0xV+I7XMBUQAK1e3oxnUPQvMuOkuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dP7TPw5LaRsbWZeqPKXqovqgEt5mt8HaTA9UyGG2d9ofPbEF0DtV8FAPzZ6+tF4F2
	 HB+p9XmM7LZ0oTdVIYXOHmlGemOzCBtn4ayt2ESmQ3rjBLsU4OWQBdV1Jt0FdG0UJw
	 SoUjwzE4NQ2hQrT76+ziQS99ocdFN+6FaDaOZ1LkMbkuPisdDi0vTLhivFPRtKnCtq
	 NaogAQfpfc/wDNSGhxGL++eLsP6c8+K/fUDZxCQSQtqfGKeoZcsw4eJqDKsyG14QQw
	 eOTSlmnlgiLW2YtGZZneKvnNl476R1iggv4yUapc9ztAlm5uL74voMHyMfxqIhssMv
	 nTHKwlxdx9xdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add base support for Eliza SoC and its MTP board
Date: Wed, 18 Mar 2026 21:46:41 -0500
Message-ID: <177388840387.11529.565506063271673656.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com>
References: <20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-98576-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A5BFB2C51AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 12:19:31 +0200, Abel Vesa wrote:
> Qualcomm Eliza SoC comes in different flavors.
> 
> Full spec sheet for the mobile flavor is here:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/Snapdragon-7-Gen-4-Mobile-Platform-Product-Brief.pdf
> 
> and for the IoT flavor is here:
> https://docs.qualcomm.com/doc/87-93954-1/87-93954-1_REV_A_Qualcomm_Dragonwing_Q-7790_Processor_Product_Brief.pdf
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document Eliza SoC and its MTP board
      commit: ae2efe5bc02520ba6a069caf15daa81e8d2bb42b
[2/3] arm64: dts: qcom: Introduce Eliza Soc base dtsi
      commit: db7fe6963466c2b542e7613e2e398ff3a1141741
[3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board support
      commit: 5d5c76d5e6b3822b292da5d20bc3272f6b74547b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

