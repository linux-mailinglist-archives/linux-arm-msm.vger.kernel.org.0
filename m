Return-Path: <linux-arm-msm+bounces-44275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6CA0507C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 246481618C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E681AC42B;
	Wed,  8 Jan 2025 02:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtRYqq6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03791ABEA1;
	Wed,  8 Jan 2025 02:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302406; cv=none; b=MUE/GTnXCuUNWmo7zr0dNrnE/ZyXm9ADex65eMuLdE6djkCfpLyEdAKFR/rhqBfiZE2Uh+hrpyILBIF135I/2vHndAS2TmZV9QlqU1Vu4qAn9V/KoqwoYFaykp98D2FdkvopBxt44f2sjiLB4uY8Us5UJUqdeTq60mXaz1wFkUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302406; c=relaxed/simple;
	bh=gO2qYoM/cMMUqbPfQAIw6gGOoH+1B/4vdXQ86L583wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ol1poKypq0tKAfwTdr9kGfdaChDrBUaBJg6nWy6RswvaqTM5Aqh8M9FiZAy57+tRvKEWyz4FeEGddrZnjpiE/N4LY04e7nC95hsAJWTI/c8a9agvKJSiLx4UIB0+a0F7KkkFBo57A5LjmOS022XZ/z/kiguT11KSSnzP6+3v+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtRYqq6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9492FC4CEE1;
	Wed,  8 Jan 2025 02:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736302406;
	bh=gO2qYoM/cMMUqbPfQAIw6gGOoH+1B/4vdXQ86L583wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LtRYqq6WhukJF+uBw6xilppLOjbIKmKO+VJLSgEJm7Gz762vpvYzi9z79RwX84uVJ
	 5jjygZ/+hS1nj8TXGkjiE43UfzIX7dSANsEesmZvalgeaCxJ+ynW2iFbHvOkugRZiF
	 iQkwifzSx+Nde5kCEbFxOzHcFNQxhZ4HbWbpBxzxM29hZYRjlVmObEAtXV2ihiUh9n
	 pAHirV2OW+E/0K2pjWnTHPIl9LXfbF7++ZdL9JtlkMod6HoW40C/3ZzjoupyUnGTSf
	 RpB0sJARqMjHgMvkEqTvsPO3nR8OMxQCYP8Z66GFA32zS+E/LLBdeaJWdVYDyb0qUc
	 rfauGcCjDXD1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: Add coresight node for SM8650
Date: Tue,  7 Jan 2025 20:13:17 -0600
Message-ID: <173630239535.95965.17802549499867943782.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
References: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jan 2025 16:48:26 +0800, Yuanfang Zhang wrote:
> Add coresight components: Funnel, ETE and ETF for SM8650.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Add coresight node for SM8650
      commit: 256e6937e48a14cc5ea02ce9e4e0fbb4463c4464

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

