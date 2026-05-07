Return-Path: <linux-arm-msm+bounces-106525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB1dER35/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:42:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E64EECB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6C3D30BD16D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072804963CF;
	Thu,  7 May 2026 20:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKRSX2WZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FF54963C8;
	Thu,  7 May 2026 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186102; cv=none; b=Qeb1ylcK+9DOCbSkbwTL3FWZhzmV0qng3WT/VdpQ1ScXLOkiHMkcqVUZbqbpoAYZIAZWZ+Rflb7xEetkrLmMysLAZtWM3NQzHexbpDeMfyn3l2Tvv3GQ3UE9Ra7dDq7NNOFQ2cO5w5d619LbkgoCkLHIg5qeuXQm7MSOBzbFh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186102; c=relaxed/simple;
	bh=ueGuLxo82i5DDsYT+sB50+o01392wKz8Jx6tEzi9N3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AX82yIfNWq97Lp9M2yYsUuphGbPCHNAK0B0rz/3JRnfoaUPmlJVYlZSrojAEu1691KGxfOIwr5rSD4fw79MEZztTDZHPfy6VuNKUQfdpykMS1BPtWK6zBSnDkdPQnLWTYKPoGAlWVqFvEIyDoLbgYOcvLXdMpFmoVYMqeQ4T8n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKRSX2WZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D045FC2BCC7;
	Thu,  7 May 2026 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186102;
	bh=ueGuLxo82i5DDsYT+sB50+o01392wKz8Jx6tEzi9N3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKRSX2WZP3OczWsBT/RkaxSbXudTgkrVsc1jT/AfxdanqaDriTlsd83cMzguxB5bg
	 atjE7cgY1iQZBv/wNHIb4xlfB1prPNqsDR6taeLB1bfbGKqlbcwxE8oopA6UQIioUH
	 mz6bE/lYKSM983MuSl/P/MYhlsESSAuqG3YjVd0k+bo8vZ+qDbgzqeqUJKQmvFp74x
	 qh/KODeol8IfvA1deh4Wq2njnWLaO6al3Kxhljw4R/JfcwGY6WWBLODyFXRAjglZuC
	 7iAhcQmuZmQm03KZ3D/nh8iP41yCaE3WP6wEXhdRLHzwbVsFWnljIScNpGAXmdHOJc
	 A2RgF/8GKkZOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Add support for GXCLK for Milos
Date: Thu,  7 May 2026 15:34:23 -0500
Message-ID: <177818606022.73000.2660676757602882253.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E69E64EECB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106525-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Fri, 17 Apr 2026 09:07:43 +0200, Luca Weiss wrote:
> Similar to other new SoCs, Milos also contains the GXCLKCTL block that
> we need to control for GPU. Add support for it.
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: qcom: document the Milos GX clock controller
      commit: e628f6a6c33ac647bb904c35a674a0f664c99efe
[2/3] clk: qcom: Add support for GXCLK for Milos
      commit: 3df6b9dbd24e1610854c17a8ec4ac146481b8e42

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

