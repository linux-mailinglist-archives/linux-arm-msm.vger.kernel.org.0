Return-Path: <linux-arm-msm+bounces-51481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C5CA61B87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A71C3B4B0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508BB20C48F;
	Fri, 14 Mar 2025 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGrGRwmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F2185B72;
	Fri, 14 Mar 2025 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982501; cv=none; b=hsIJ3iNNDVJk50+tz4ij70zwvG7xofxbc5Z5Q/l0zrf64nCAn4EDp01gd8uAX2KumFuqiza8VS84EcVE+rxD6E7gDbTl6VUmaOG9bY397humgLCJ4n+oRuDaFPnCzaEPGf495N8SGnInVG4IYKt04aMnMCLsq02oAJBz4tcKITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982501; c=relaxed/simple;
	bh=bBNTB8osJ9SK9JnGEG+LVE7/crM5qaWUzUxr+Uf6jcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tDAmKPeN4pZ+xrnN9WyS74OddVWXBm5U45Ovy2Slwk3H9s+va7aoBjU41Ci2eSi/G9rziFKm8NquHj6PWZ2KYkUBSSk8/UWGhwBhzCf2NvgAHYzfOorno+gdRdIdzm1ZNboNV9g7Gyu9gJdZyZOnc4CUlCS53r0We+D7BM8asXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGrGRwmF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA03C4CEEC;
	Fri, 14 Mar 2025 20:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982501;
	bh=bBNTB8osJ9SK9JnGEG+LVE7/crM5qaWUzUxr+Uf6jcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OGrGRwmF2n3isebY6vMx/PQRUtfRQoUwvLvHWoOJ67HBsEDkV9jUPa42q6zUYwCf/
	 V4cv5P5sHwUr7XT4pAhb+aYEfAs97jhZM7gKBJcFh7+7R3YYTMY3CIjNDDwdRuC0j4
	 mLfQci3Msz57NK1x3lgLCrl96J4bEVIrxc58ZAMKFFlXITdoIu96cYAe8OydQkQG9t
	 6MvkyVkhHR2QcOdU3Y4YdQgBI/5wAQoJTVEP2BbiQhXLyoSiP0iF0ASSnTHPxJljnr
	 ZoSjnjA35sHLy8LM6GruBknYW1/DxNbkMFWDPrBPdsLEkbVI7R9u49Yc+3H+Z8lCV1
	 lHPaudKcxQVgg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: sm8750: CDSP
Date: Fri, 14 Mar 2025 15:00:55 -0500
Message-ID: <174198247863.1604753.9269538716048443720.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org>
References: <20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Feb 2025 17:23:48 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Based on Dmitry's feedback, move modem pieces to separate patchset, so
>   this can be easily merged.
> - Keep previous tags.
> - Link to v2: https://lore.kernel.org/r/20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org
> 
> Changes in v2:
> - Fix CDSP and MPSS PAS address space range.
> - Re-order nodes for correct placement.
> - Rb tags.
> - Link to v1: https://lore.kernel.org/r/20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8750: Add CDSP
      commit: 58471055ae76f639ba8cc2df3e1bc12fa4be2c02
[2/3] arm64: dts: qcom: sm8750-mtp: Enable CDSP
      commit: 070b7e0490b521999b95c9262ab9e1609c8ab4a1
[3/3] arm64: dts: qcom: sm8750-qrd: Enable CDSP
      commit: 0bbdfaa204ce673570e41fe71d4f571a82c7b04d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

