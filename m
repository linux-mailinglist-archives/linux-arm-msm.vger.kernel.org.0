Return-Path: <linux-arm-msm+bounces-57995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF2AB779D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B18247A32EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFCB297B76;
	Wed, 14 May 2025 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4VWOXiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C03297B6E;
	Wed, 14 May 2025 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256666; cv=none; b=Lj6zcXIjiaejebQqTSABl77ybodDD6ra4uk3Yum23v0o/e5AtqW6jDz1qIqu0NJudplPfedpPnP8wk1C6PghMZkmAKBWtQM6AfE0OWeJCegEQCZNerthGvYN5Z3yvAXrq17hHmN52FM1j+HlAgY6dGDSp6c14zm6UELWrN+dEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256666; c=relaxed/simple;
	bh=gkpN1kX9TMzbWx2V01Bxyovzoq5laiHXucD7H5FY0VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYAJoA/W25g5x/3dkd9nFwiP/1Hp3dLvaXBLaBDU+z6rO1po9F7i8Qihisr1Qt28nsaxzKhMLgl9pGYFQZ+A7DkPchuWBm/shX8iwkpg4iqy+Q7F8XMhO3phVAOgryw6XEuwlXGwF/kUWzQlwVxBQs99iNv8qUfe6Xg70W2Ydz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4VWOXiz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C19C4CEED;
	Wed, 14 May 2025 21:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256666;
	bh=gkpN1kX9TMzbWx2V01Bxyovzoq5laiHXucD7H5FY0VA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h4VWOXizFaFgE6f4VKvevxEFWtq4L98iktRvyE9zZ7UzLU6MPZnPOSYsuJQ7d75th
	 Sz6SteiJ+gB3z4c8ystw5EUv4Xku/YihokIpb/SRf0h11tpCHcPzQNRkQmW1K3XOcf
	 BxoN49rucmp52Op2P/s2nf5Al3mZl4LwvPNKYwycTMyqroX8dv/tASi8jfnYd2A6wa
	 5aV3lmSHCom1+QcPO+c3NyG0nmCv/UbnTYb/CoLcemE0OsOO7irWcEhiH0zdpNv1M9
	 l5W9X+pBzGzAkyQ3Np2denX3quvEJM7BM02q3tUELvNUuUdez9ImHYQcE9FzJyLUav
	 Kr0e0NBNF7qmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: (subset) [PATCH v4 0/4] HP EliteBook Ultra G1q support
Date: Wed, 14 May 2025 22:03:49 +0100
Message-ID: <174725663060.90041.14895025636416609919.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429144957.2088284-1-juerg.haefliger@canonical.com>
References: <20250416094236.312079-1-juerg.haefliger@canonical.com> <20250429144957.2088284-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Apr 2025 16:49:53 +0200, Juerg Haefliger wrote:
> Add support for the HP EliteBook Ultra G1q 14" AI laptop.
> 
> Based on HWINFO64 and APCI tables, it seems to be the same HW as the
> HP OmniBook X 14.
> 
> v3->v4:
>   - Bring the sound model back to the node
>   - Split the driver change into a separate commit
> v2->v3:
>   - Drop status properties from nodes in patch 3/3
>   - Add acked-by-krzk to patch 2/3
> v1->v2:
>   - Don't rename the X14 dts to dtsi and directly include the dts
>   - Add a label to the sound node and use that to override the model
>   - Reorder the dt doc patch before the dt usage
> 
> [...]

Applied, thanks!

[4/4] firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q
      commit: eb47bca4cc8ab06bd25385c87406e0f27ebdbf07

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

