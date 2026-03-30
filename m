Return-Path: <linux-arm-msm+bounces-100854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGxgMoifymmg+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:06:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5935E5FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D0B300D719
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCC63D6CDD;
	Mon, 30 Mar 2026 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVbxPUy+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06D3D6698;
	Mon, 30 Mar 2026 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886537; cv=none; b=pGh83Dpxz6zdc2m8h2t6Hmf/jwzqg8rKb7BMzKUU4IvRNGKViHNu/CPhfbOV86Vy/W8IHRtKTY6AVQzEZ4MHNM4vtHw1iQPRVfPB+44ddLUcVk3zyIagJWEgMTCahUX4N3LpsLfpL+hvxXlWc/r8XfvI3sPlChdP/8k8O8F1Sso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886537; c=relaxed/simple;
	bh=GlSiu9vnD5xVU3rLY+DmcoRndhWKp5vb5kW7kxkFU4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qp7ezoUM8LDZw3a7gE0dyO+X2nSIVddwwm0HIHsL4K45QmZeLDqD1+FGWSqN6oJZYaTBl8p7CtE5/8UdCV7d9e8nk6HftcYSLakYFILOPL3HH+o004uiqEpPPFYkpX7CZC6AJVh6nOuW7d8jAm/jEQfLATL6J6tw0woau9N1U6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVbxPUy+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6387EC4CEF7;
	Mon, 30 Mar 2026 16:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886537;
	bh=GlSiu9vnD5xVU3rLY+DmcoRndhWKp5vb5kW7kxkFU4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVbxPUy+xFffddR1BC/jCvFau4K8BjAV40UMvUbxLsGK2gsni3SpfP0jYyyZ5B3XC
	 Jki7eQitC7lHXYtkO3vrQ7AYVaPKo0L7i2D5p9tSCZhIT+34raGeoSvi/6mhS+iBYu
	 FepCrE0siRHgDttj7VtAHLaEVOlBAsBWVXmR8NU2f5cN8FJauhIqlbK8hUPVgIs3UP
	 1oSSDgzL6l+nxtKG2e+sToUPlXe4V5x77mODCNFPCBdT1i4r9B2wh/xjUflVwoxTaE
	 BiiFpiuhFXCWYVIRwcq8ISvEy2d20Yum6JmNcgx2VkHSuS1UF7VdZBf3QmbEn3zKjH
	 76GNGHcLXuGcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sm8550-hdk: add support for the Display Card overlay
Date: Mon, 30 Mar 2026 11:01:35 -0500
Message-ID: <177488647785.633011.16629060421078089420.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311001238.4191034-1-vladimir.zapolskiy@linaro.org>
References: <20260311001238.4191034-1-vladimir.zapolskiy@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100854-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40B5935E5FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 02:12:38 +0200, Vladimir Zapolskiy wrote:
> The SM8550-HDK board may be connected to a Display Card external PCB,
> which is identical to the already supported SM8650-HDK Display Card,
> it provides a VTDR6130 display with Goodix Berlin Touch controller, see
> also commit bc90f56a1699 ("arm64: dts: sm8650-hdk: add support for the
> Display Card overlay") for additional details.
> 
> Two overlays are added to support SM8550-HDK plus Display Card and
> SM8550-HDK plus Display Card plus Rear Camera Card setups.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: sm8550-hdk: add support for the Display Card overlay
      commit: 40c15162c873a481cb0e57f8aaa743a4bc66432f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

