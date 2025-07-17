Return-Path: <linux-arm-msm+bounces-65359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5114EB083FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4958D7A1357
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4964921E0AF;
	Thu, 17 Jul 2025 04:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbntm4fn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C01B21E08A;
	Thu, 17 Jul 2025 04:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726693; cv=none; b=lrHGvfGkVwnFRVBHjItzvd7vKGEHBPQVW9WNCS7cM1AkB+lPzZ4b7UX527SF/vNnfifpFAVuXEqrmOSEef8jyqISBb17xtNvxPCoeexftXW2UvoyzA8WaIdEv+3FGxoUcHcjYdFtI5GHp00H0aVJ/XArI+OTr4Ech3bzX9A80xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726693; c=relaxed/simple;
	bh=gkvKsxCE9vYwl89WQnYkjbibgd6wwagwBS60YSM87Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RFKnagr/Rczy7u8Jdk166zVj6LC7dWXyGDUaBepyr02EeKu2Aqz8bAnNIb84z8uPBSeicVS0z9xloYD5sMHZzBn9CB5PR55FsY2K/9wzyiyyBXqRQd1nm2HQ95RqFnNEvZb2tZMnXw8kfd2toKPCl2VQm68yPcty49ZoNBU9wBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbntm4fn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2E0C4CEF9;
	Thu, 17 Jul 2025 04:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726692;
	bh=gkvKsxCE9vYwl89WQnYkjbibgd6wwagwBS60YSM87Jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sbntm4fnJ2JrbttH8+ZANq9Z2ZXzLzpAuki1ccDzIjCuiZafwAqLas1hGVkxIStwz
	 31r309C3JPtJqjOV1ofa/MMpj4XMudrxtaEkSSwH9LrAgV2vOyXtQUCwToPjLw7Of6
	 0rA9grg5O6y4R7X2dkyKH/LJSwnh4AqDZN1Sjgj5fC3NTvHfTdkKqzP6IiU219rIXw
	 koU0DE65L5CU/iZCqkbVSLFxqGkai3ZlJXQrY9A8Ma2Hwc7y+Q8ZAQqhaZzuW3s5zl
	 rOWb8PMEtFs/krNmFPHkBWN69G3Q6InMC7qul2pYk07DdGhAA935Gt3vouekkdb0Kf
	 agmOUNa4rpVOg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Add RPMh and TCSR clock support for Milos (SM7635)
Date: Wed, 16 Jul 2025 23:31:05 -0500
Message-ID: <175272667153.130869.16754797596854470063.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Jul 2025 11:56:36 +0200, Luca Weiss wrote:
> Add support in the RPMh and TCSR clock drivers for the Milos SoC.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: qcom: Document the Milos RPMH Clock Controller
      commit: 136e6393a5462502dc78c661fcf09f360c6f5d6b
[2/4] clk: qcom: rpmh: Add support for RPMH clocks on Milos
      commit: 4901838d2be20e00711f3b2b612acd1c7c754a88
[3/4] dt-bindings: clock: qcom: document the Milos TCSR Clock Controller
      commit: 5009024ad7c670066204c3153b177de20ea9d93b
[4/4] clk: qcom: tcsrcc-sm8650: Add support for Milos SoC
      commit: 7181c64fdd3e10e731568b2f44c3805173bd7b9c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

