Return-Path: <linux-arm-msm+bounces-57768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBDAB5E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1131746547E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639462C030C;
	Tue, 13 May 2025 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQLnxYbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F451E990E;
	Tue, 13 May 2025 20:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169237; cv=none; b=uM8X+NqjDU3mSGddlhfgVnc199b979yZ6ohsgbOUyH6MgSuHoFOJVUijTy0/7013zqmbeIJ0nVdm83FJHROh1Vbr0/EPdQwEt67GsfB9lFMr91seLaLZtKsGP8xJSMzqyaLuLAHlnmopZ3SiWnYFztZEFn5ESp6jVHKebpkRS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169237; c=relaxed/simple;
	bh=JaFSnOIXrGfm9/UeXhyaKMiVtfJNjZ7NDkVR2M+WpYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kb4zumVp7l1eEfjhbuLLlA4Lq+CMrv58PKfqrXZUdeIL0iDJHUqIMKeSVW69gWMaJp3q9N5hWZf4+vTWu5G6FyHO24nac2t4eq95vaybX11zoQMlcdu0zPBsuyhMsbsh3nsvHYiEHKRAtHl6yifdtL9YItPMjt7cAM2b8HPwjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQLnxYbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBCFC4CEEF;
	Tue, 13 May 2025 20:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169235;
	bh=JaFSnOIXrGfm9/UeXhyaKMiVtfJNjZ7NDkVR2M+WpYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OQLnxYbtuvrPBXMCpoZr3YwY6Z41QeUSlVBAoKMhJVQX3LFQz0t6CQ4Did8MLD/qF
	 OmtvZiEukozXrYgWa2c56KqGb2/7GlTzNRtCLKClDJclWvHGkRy4IrTa7pC3kZmf3K
	 0lY/zamjDUkS2AkKEzebYqAqlss/kuX4zbik//hwb/nkTljWDmS1RAtjpJxqCIymGq
	 wGIV2klsOMB5//VjXgyct/92/LrmtjsiEZRWenFj4HZGmalVtHE87NHe/3LO8/WA5N
	 Qr50JG+7Nb3l8lqzemTiTFnd9evQNqOjaGqZzIvDW53F4HZTYEelpEkN8pWjtF0jyF
	 EVBLpbEFxqsQQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinaba Rakshit <quic_arakshit@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] Enable Qualcomm Crypto Engine for QCS615
Date: Tue, 13 May 2025 21:46:44 +0100
Message-ID: <174716895382.39748.3928459424707589207.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318-enable-qce-for-qcs615-v2-0-c5e05fe22572@quicinc.com>
References: <20250318-enable-qce-for-qcs615-v2-0-c5e05fe22572@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 15:13:22 +0530, Abhinaba Rakshit wrote:
> Document QCS615 support for QCrypto driver and add QCE
> and Crypto BAM DMA nodes.
> 
> This patch series depends on the below patch series:
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/ - Reviewed
> 
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: qcs615: add QCrypto nodes
      commit: 4153eb38970a9f2328b01278c49b65fbdf84d4d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

