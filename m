Return-Path: <linux-arm-msm+bounces-100853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AA0EhWjymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:21:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5077435EAFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C353C302C9B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C50E3D34A2;
	Mon, 30 Mar 2026 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RumY1rSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D643D1CCC;
	Mon, 30 Mar 2026 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886536; cv=none; b=IJXPD5GKMBACZbaIc+YqJAwcgiRfgWiwn+XFYxKU5vhLZmgCXK5or3Cwg9aUuQjh2rus4XpPET8ciBCo1hCouW/Lk8gypliLYspkWi0bRQbf5uePXZu20pfMNRr5CuU4BPfXYQArtfyk3Hfx8FIgBlpncYtD0/DOPmPDNLyaxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886536; c=relaxed/simple;
	bh=rP04EDSFzfbxyG7JJYP57XxGa6ccK5M6xzlfDZXHnjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXOQDf/opo4VK6HD8Vt3Dti8cY+rk5tL2LfzFWTxhJAYA38LW0XY26qB5EWi+AfCtq3RtVyrBqT58+U18ziNKfPbjqumzGMAIzCuc/EQZOWFOyphRBYwEF6u0koQC/6HgarX313st3UXZvcv8gP9Ea1pDOCSoZ7Q3LDZ9WtQC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RumY1rSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C73C2BCB4;
	Mon, 30 Mar 2026 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886536;
	bh=rP04EDSFzfbxyG7JJYP57XxGa6ccK5M6xzlfDZXHnjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RumY1rSd1oB8rOgBdViL3j+G7U+jobTaRB40U2NoBbiTtSFZxtL3EzbjXAPZK6/ZK
	 /ECeda2Cfy91Oqv9K0ED9LWZYwcepAyS5om613iORCFoGUCvwmCfhyOtYT+9MLCaPB
	 aI3GbXKYNps0CaqIL+Z93PsFLVFubtF+ux2Qvy7srsMfvaKbauCa8HZRN2S8TCZzkT
	 7AO/fZdaaGhanD41+3SwRKdVvydaEwa8ukhKmukb7cVhScIUjEZhT+tVXTZZqeldgM
	 TSyO3qURJD2NpkhzAqNJyJAbyZjHpX1uUad56Q7tTcXXNGnLtbY6jXHAbiWoTq6Fjc
	 78Ih5eBJb9gvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tobias Heider <tobias.heider@canonical.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: cleanup remaining zap-shaders
Date: Mon, 30 Mar 2026 11:01:34 -0500
Message-ID: <177488647762.633011.4436482950757265411.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
References: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100853-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5077435EAFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 28 Mar 2026 16:49:20 +0100, Tobias Heider wrote:
> In commit 2377626fd216 ("arm64: dts: qcom: add gpu_zap_shader label")
> most of the Hamoa DTs were converted to use the gpu_zap_shader label
> instead of patching &gpu directly.
> 
> This fixes the remaining ones that were added after the
> original fix landed. While there we can also remove the redundant
> memory-region property that is already defined in the original
> node.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: fix remaining gpu_zap_shader labels
      commit: 79772ce80eb9615b69b00e77135bbfc6e4b6f158
[2/2] arm64: dts: qcom: drop redundant zap-shader memory-region
      commit: c7c8ed27b71272fad8049d34257cf8ce3e37b097

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

