Return-Path: <linux-arm-msm+bounces-65315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF649B07E2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 21:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D89AA44E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 19:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B602BE037;
	Wed, 16 Jul 2025 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcG8aATh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BF02BDC27;
	Wed, 16 Jul 2025 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694863; cv=none; b=qTWNr5LIpxPGdTfnzUXpaDkU8wWiW0hs4t8AMDhrQ/SekhAQepk1hqsq0InZED5t9vPDxJ7tl/WL4S7ugPeuuJVTJxB7938g61J56iz695WaDdhb99G8cIzCyxoAwpRwjVZJbrxvd+SXaRcv96J/7ddwU1EjRsAaN6wg1poqoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694863; c=relaxed/simple;
	bh=iwMEsMVK8DKT1IO9vur1/F32yF/AxmRr15RDJvyyqF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sPddX1q3rGhjKVqbydkt8+xej87AktxFQDLfx86x1/oENXba6gqYCqSjU84XfaaUq8U8F3WBUDH8AlZ2RXvm6ZMLsA7zvbk1iYrvb8RTTnBWWbNCmmLEjPfd1tUY4hLZI3Fn7prTWa5SxBwW7mwYOJRGIeUjCuXHyPqzMftojVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcG8aATh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9323BC4CEF8;
	Wed, 16 Jul 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752694862;
	bh=iwMEsMVK8DKT1IO9vur1/F32yF/AxmRr15RDJvyyqF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcG8aATh5ATlenr+sPXAjeUXBs8BGd/Mx32IUNiRVYab6FZbQB1ML7mJ7xlPOj0cI
	 Isbz7CuaXxbeDfdSKQ9HRzClNgupk0lII8/qCDQShTAXk6mgVzh+p3rS+TYExRKGJq
	 nDa11IymaMTRU0AmRTtOCAZDESdrNUbiLkikrh7j6udpVrS+8ZEyqTiWiyVNz7qsCs
	 HgdYjrn/3nsrT+CBj7q1qrGRXoQLaclrY9Ikq7r0f7RPA9kVRdg26MXqPPMqcD/gmE
	 rrLgjsz/91W2g7zdszGlGnw4Sh2WocYceRqst7b6bAQHG1h6GYHi+ikBBx8KtqnBax
	 sa7fY7yPH688A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sar2130p: correct display controller device
Date: Wed, 16 Jul 2025 14:40:51 -0500
Message-ID: <175269485295.105136.4017202972666491272.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Jun 2025 20:49:50 +0300, Dmitry Baryshkov wrote:
> I didn't notice that Bjorn has picked up v1 of the SAR2130P display
> patchset instead of v5. Correct several mistakes that were fixed between
> those two versions.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sar2130p: use TAG_ALWAYS for MDSS's mdp0-mem path
      commit: 8d99dfc9c83c5a4b6f16f190dda7b6ed132530a1
[2/3] arm64: dts: qcom: sar2130p: correct VBIF region size for MDSS
      commit: 6f49c8ab9137ceb5bbeed2a2fe9ab18c18ca025b
[3/3] arm64: dts: qcom: sar2130p: use defines for DSI PHY clocks
      commit: 05bb4e8ef9ffc3c3b0ba19bc3d74f72e334a6d40

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

