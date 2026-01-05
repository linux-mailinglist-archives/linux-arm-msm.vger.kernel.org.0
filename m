Return-Path: <linux-arm-msm+bounces-87543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49474CF552E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F55B3030235
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83018342511;
	Mon,  5 Jan 2026 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMun4oJF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC1341ACC;
	Mon,  5 Jan 2026 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640597; cv=none; b=kETTFc2eQk+5DxJvDIkLl1k/qme1antTK6mKsOw+D/WR3jacvXMPl7kYlhY60E3dexlY92ba8MVTRiK593lHM/9aD+FKp8NFjO7LJGdiBsbE7XwhbWy0RALGvOxY2acp3ztuceY5MO5viiLa9Xq5adRPoVAaVg5LT95Y2cmc1/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640597; c=relaxed/simple;
	bh=aHi9Ar/BCu8LO0olnN7E9hJY194M8f/2qnXUMIgdZ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kb+NYairDtmeD8iftUl4wxrccJF6KF14XQWh8ZyeLvXN1N6nCTCx5HxNzhYq4nW9IyEyhcQiXzBg0qzI0QwxqlBXcH8QX1ZLO1n29BnTxDcvaFXCqUF2UwHlOJTFvRdiNLEHYwf6a1CW12wM90uoI0zAt65u180q9SE2EbBCUPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMun4oJF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457F8C19424;
	Mon,  5 Jan 2026 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640597;
	bh=aHi9Ar/BCu8LO0olnN7E9hJY194M8f/2qnXUMIgdZ0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IMun4oJFbz0L/L4kfVRXIhy1LqE1vRaYE0tOyiSFbHPBnnNG1OES7ctmld6uvMpkk
	 qZjeG3iDNea1R+a44yAa6/iNiSZgKy5Ps59n9Fng/52daY9hwhdyVCuExuQHM9cESL
	 1yXt2/aRVXTBYtaYCqMHM05SQ3UHB5n6lGWehhSg/sxYYjNr3bdA7N56ULtHdny6Ia
	 amvYKIGxYD8rqP0SMecWBaRSZ7UG6+/uSnrUROqe7booYVOcm/fYJlTPkYYFRtfuxo
	 ldJZ9oWB2Z8+hyuwhgmmr0HHz64RnTVxvyyMyijvJ3Sw3BmHeo4AhFVsHpYg8gP6Dg
	 o/Zf6fo+eV9jw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: add QCrypto node
Date: Mon,  5 Jan 2026 13:16:17 -0600
Message-ID: <176764058417.2961867.12477683092965187285.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224-enable-qualcomm-crypto-engine-for-lemans-v2-1-a707e3d38765@oss.qualcomm.com>
References: <20251224-enable-qualcomm-crypto-engine-for-lemans-v2-1-a707e3d38765@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Dec 2025 15:50:24 +0530, Abhinaba Rakshit wrote:
> Add Qualcomm Crypto Engine device node for LeMans platform.
> 
> QCE and Crypto DMA nodes patch was applied as part of the
> commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add QCrypto nodes"),
> however was partially reverted by commit 92979f12a201 ("arm64: dts: qcom:
> sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add QCrypto nodes"")
> due to compatible-string being miss-matched against schema.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: lemans: add QCrypto node
      commit: 173c43d0e4a435a95568d6b912d0d45c37d6d75f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

