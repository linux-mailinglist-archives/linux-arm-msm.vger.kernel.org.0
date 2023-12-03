Return-Path: <linux-arm-msm+bounces-3086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B198020B2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA694B20ADA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126C023A5;
	Sun,  3 Dec 2023 04:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSGYE2lT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E702423A0;
	Sun,  3 Dec 2023 04:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD57C433CB;
	Sun,  3 Dec 2023 04:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579102;
	bh=mSFcpxgFtaT67VtAi3ZJBJECaLDzlAVHXScB3GicCTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TSGYE2lTh+6Iskz1gv5L8Cb3Ls6t+ykrqkzct8dHQx51/DAQPWaiR8smpYnSqK5Lg
	 Yoj77MPsCwQ488kY+uUM450SujZ/gl84vTe7IhpglbZKt5C83FqK+Bk/9So077jUxx
	 0Hida6oJdz09c+kaxXkUsKVd58jB+nTMi4Ccxt3E76tUy7UQwWhnRWxwlObxsmEx4G
	 mATaGkP7Ft0xPSZOkTvku/F2afRRnn5qzZs5k5CUVs5mgykYzniSEzXPNpqG3f+Kt6
	 rXkPja4VniLrzE2d4QZbKjegF1hTv1t2NDMSkSwcQvEBata6d5m8kiso7MuFqA23Ck
	 WTQBWbZw0gXAw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Add DDR sleep stats
Date: Sat,  2 Dec 2023 20:54:33 -0800
Message-ID: <170157925821.1717511.425797126957735781.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org>
References: <20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Nov 2023 15:58:20 +0100, Konrad Dybcio wrote:
> RPMh LPM stats are quite extensive, but we can extract even more data by
> poking the AOSS QMP. This series adds DDR stats using this approach,
> setting it up on 8280 as an example.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sc8280xp: Add QMP handle to RPMh stats
      commit: bcaa71f13cc7160f2d5f9a401e9c58215612f79e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

