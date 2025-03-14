Return-Path: <linux-arm-msm+bounces-51497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5AAA61BC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B0234601F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540C621519F;
	Fri, 14 Mar 2025 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmCTow+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1A21518D;
	Fri, 14 Mar 2025 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982519; cv=none; b=TRbAvgOThe+QP9DDgsNxPh0kvJn/IHrIjMXXUPunw5uQTs3oiA77lVsA2cI57WIBB6mPE+gUMk/GFyCHbINfwX9Ct1XbJLW7OpudC/ILSypAg/Bpy4LBUybCEUSizJtMcFztMQg0nfRli0ayusPecywhLsq6XwAByVfj0a+V5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982519; c=relaxed/simple;
	bh=A9V0VS8Cr0Q0yklfmaDADu6APo8cQyUHgG87FTbpc9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQlNn5H6lkN9XBBkMR/CBLUlkETDGROEflXgCbKnTVKQFa+KBMvHZCDYas5z4kZShUybqN2/RqjkHF9tPqYK5Cqv6ZPYpjL/oIThexv+qEk7uK+nbllcI8VpKY7DA+lC6T2y2X9ZSeDdL5m94tTM9UvokXKvIGDGwOnS2slWDAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmCTow+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DE5C4CEEC;
	Fri, 14 Mar 2025 20:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982518;
	bh=A9V0VS8Cr0Q0yklfmaDADu6APo8cQyUHgG87FTbpc9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MmCTow+NrHPEDZWEK+zs2sCvyv7sx5bsP3cI3N7oPDeurHZwl2kLaa4DRqKVrH2qh
	 k1hWdq0vyTFxLi4G/u8yRz3sYYTHAvxUtT22fc3ZoIwWu/Uvst35NPl8rL2/bzoIWW
	 o1EYgN/K9VxxWRrnDK5BV10tX152f+MnoVKYx13mG1PwO2ecWvQnZfplIwS0j99OoB
	 ZtYL/TdZ/SsBqLAsHJVCwIQLpC7qIZZ1h2OgctZ0FJrIMoZOO0Cq0r/esN5G23h1Lf
	 GHN990lyMyLI1KBjENLeuc7sT7canNTDilFtQcpTRP/NCaBX9QY2WaiLl0estNulh6
	 I08Epf/Wz4lrg==
From: Bjorn Andersson <andersson@kernel.org>
To: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>
Subject: Re: (subset) [PATCH 0/6] arm64: dts: qcom: sm8750: Introduce crypto support for SM8750
Date: Fri, 14 Mar 2025 15:01:11 -0500
Message-ID: <174198247865.1604753.12834678540752631538.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jan 2025 13:16:20 -0800, Melody Olvera wrote:
> Document and describe the crypto engines and random number generators
> on the SM8750 SoC.
> 
> 

Applied, thanks!

[2/6] arm64: dts: qcom: sm8750: Add QCrypto nodes
      commit: eeb0f3e4ea67cb1c2dd7cacfef218bfa0ae56970
[4/6] arm64: dts: qcom: sm8750: Add TRNG nodes
      commit: 9f9dcac2f85e6a0641a4a4f7f3b2c35a984ed4cc
[6/6] arm64: dts: qcom: sm8750: Add ICE nodes
      commit: b1dac789c650a20a54d5089b23fbb800fb289b8b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

