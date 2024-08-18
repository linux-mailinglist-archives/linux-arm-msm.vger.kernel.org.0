Return-Path: <linux-arm-msm+bounces-28909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD03955F21
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D031F21A40
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A5E1547F2;
	Sun, 18 Aug 2024 20:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="hrMRI4LL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="VDs1d88W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback25.i.mail.ru (fallback25.i.mail.ru [79.137.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D17154423;
	Sun, 18 Aug 2024 20:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724014554; cv=none; b=ntUw0JCONNYCxTDSw/lI1AyS2eZar5bWj/uG4AQr6frblsliW7svCT5E5tjHI+dtZCDtsswRuVgUSD5uLWMBqXOQ4dFWbCBKBDILlpF6sk5/ZfpqP6wp9T/j7jS9E4ojh1a953aH+3rr/U2jfFbzyxAxCH9sA5PncIUPMm1jG88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724014554; c=relaxed/simple;
	bh=tTdFHoxZuAbgz7MHvPQ1o9l2BC3hm9XAPQ98bO+HCN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSg5ct2SOcSRsYMH6/mwG5JoBz9OOWaOACOIXjOrE2TW3vD4kEbInZH6bKvIhSBF/0mI+7F0AjbM0o4YcBbYDO9sGPLl75+yAWtWbuHiK/9oBg8uygGMfRDkqzPc3nOIopJCWuzzpooM7DQDIIdQFXmrll3Szh7Q4xy+lhvrls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=hrMRI4LL; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=VDs1d88W; arc=none smtp.client-ip=79.137.243.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=A7uvD8AF2FDUD1QgZH5ZUBKuzjELM80j8D2qoZjC3Lc=;
	t=1724014552;x=1724104552; 
	b=hrMRI4LLH9MNHrcuW5/BaMaP1323LdaWubkhy9fNVb5JnECu1Ic9x91579y7h5jnWe2oco55YoVGzEKRZu4bVW8Xe3VaSiNWr6OsnCs1pE08mAA9XcEnYCqMKHIhnHce76pWCNDlRqheycYlBkYqkh/JZfjBRLj8VNwfxvjEvi4=;
Received: from [10.12.4.5] (port=50730 helo=smtp31.i.mail.ru)
	by fallback25.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sfmky-0034V7-DO; Sun, 18 Aug 2024 23:44:08 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=A7uvD8AF2FDUD1QgZH5ZUBKuzjELM80j8D2qoZjC3Lc=; t=1724013848; x=1724103848; 
	b=VDs1d88W2JZy5xR9sjYnjit7m1c4DsGKqv/KBMeEVfc3jaXMa+43daTP8xdyihX5W0J+1xFyomL
	Q8ATS1YbTw8AR3behoP+CAUVUpnsnUW0KW6j16yh8pc0aO1kuHN/ux2Uy5tyKZ+XoBG78nhpoQoAY
	sae6ju6fM+wQ0Co7Og0=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmki-0000000Cqfx-1eZp; Sun, 18 Aug 2024 23:43:53 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	vladimir.zapolskiy@linaro.org,
	quic_jkona@quicinc.com,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	quic_tdas@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 00/10] Add SM8475 clock controller drivers
Date: Sun, 18 Aug 2024 23:43:38 +0300
Message-ID: <20240818204348.197788-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E29560722C55467F34015AC91CD8757DC5182A05F538085040129483B61A626E680578E6996F3834138C95056E207ADE88323C04D0FE7BBCAF680F0B1BC0C28F32
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F65C230EDDCD559EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371A00CE7BDCE207EB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86B0F03A732225C2FCD7AC5B2B1C5E9D23E2A6A748C6C510ACC7F00164DA146DAFE8445B8C89999728AA50765F7900637F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E603D20A273AEC4F389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637FAE005EDC5B7C141D81D268191BDAD3DBD4B6F7A4D31EC0BE2F48590F00D11D6D81D268191BDAD3D78DA827A17800CE783B01AA35CFCE167EC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE754F43A495B1ACFC12EB15956EA79C166176DF2183F8FC7C0E4A630A5B664A4FF725E5C173C3A84C3E0287E8A3902ECA435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5E6A0B4D34F9E53E45002B1117B3ED696A4FC99E7960AFEA68D59E407A97E9958823CB91A9FED034534781492E4B8EEADEF0AF71940E62277C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1721EE5919657B2107E49D155A48E3DF0155FEAC082ED1FFC4527FD7CC6A938890F5B3B6BD0F620EABF86C07854D94731DF8F2DF7C1639BDF37AA835A6091A5EA03E30DA0E527728F59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmZnygqGR+4EBQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554F125AE33D5AC58CD45B21AE4556A4CE83F55CC812C41996622C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B401572549E177C9B7D4324AF0E71CFA343F751287A77CD6E5049FFFDB7839CE9E4D3E270CF25C1BA80873DC5BED6B1A9D9FC64667B4C6259975A981F4F1156516
X-7FA49CB5: 0D63561A33F958A57A9249618E8EAC967BFD76808CA7DD092C53890999B87B9A8941B15DA834481FA18204E546F3947C22AFBD43305DE81BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637D076D7F97406DE69389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3375ACB23F92DE42535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmYm4iywY615gQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This series adds support for SM8475 to SM8450 clock controller drivers.
Was tested on Nothing Phone (2) aka nothing-pong.

Based on this downstream commit:
https://git.codelinaro.org/clo/la/kernel/msm-5.10/-/commit/b051ec6bdc4b4884905002b2e75753e6f1238d20

Changes in v2:
 - Add prefix to SM8475-specific clocks (Patches 1, 2 - Krzysztof).
 - Define new PLL configs instead of fixing existing ones (Patches 4, 6,
9, 10 - Dmitry).
 - Drop symlinks to headers (Patches 1, 3, 5, 7, 9 - Krzysztof &
Vladimir).
 - Use SM8475 as a prefix at the beginning of structure names for greater
clarity (Patches 2, 4, 6, 9, 10).
 - Link to v1:
https://lore.kernel.org/all/20240731175919.20333-1-danila@jiaxyga.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux@mainlining.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (10):
  dt-bindings: clock: qcom,gcc-sm8450: Add SM8475 GCC bindings
  clk: qcom: gcc-sm8450: Add SM8475 support
  dt-bindings: clock: qcom,sm8450-dispcc: Add SM8475 DISPCC bindings
  clk: qcom: dispcc-sm8450: Add SM8475 support
  dt-bindings: clock: qcom,sm8450-gpucc: Add SM8475 GPUCC bindings
  clk: qcom: gpucc-sm8450: Add SM8475 support
  dt-bindings: clock: qcom,sm8450-videocc: Add SM8475 VIDEOCC bindings
  clk: qcom: videocc-sm8450: Add SM8475 support
  dt-bindings: clock: qcom,sm8450-camcc: Add SM8475 CAMCC bindings
  clk: qcom: camcc-sm8450: Add SM8475 support

 .../bindings/clock/qcom,gcc-sm8450.yaml       |   4 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml     |   1 +
 .../bindings/clock/qcom,sm8450-dispcc.yaml    |   1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml     |   1 +
 .../bindings/clock/qcom,sm8450-videocc.yaml   |   1 +
 drivers/clk/qcom/Kconfig                      |  12 +-
 drivers/clk/qcom/camcc-sm8450.c               | 294 +++++++++++++++++-
 drivers/clk/qcom/dispcc-sm8450.c              |  66 +++-
 drivers/clk/qcom/gcc-sm8450.c                 | 181 ++++++++++-
 drivers/clk/qcom/gpucc-sm8450.c               |  50 ++-
 drivers/clk/qcom/videocc-sm8450.c             |  48 ++-
 include/dt-bindings/clock/qcom,gcc-sm8450.h   |   3 +
 12 files changed, 634 insertions(+), 28 deletions(-)

-- 
2.46.0


