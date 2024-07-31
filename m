Return-Path: <linux-arm-msm+bounces-27563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEE194353F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC69F1F26A7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6464D3D96A;
	Wed, 31 Jul 2024 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="gs5C8Ku+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="L7F5vT10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4FE4642D;
	Wed, 31 Jul 2024 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448793; cv=none; b=kFX/y2akwYCF64U1BgtydxFPtE4M/C/fWq6oSlMFcLcCy7LQVMxJNFulqdN+GA7MV+x6DNPzeUWXWLtcR1ShHLc+DiyV1bD5Ws16perKgufx1jRQxWcFNJmgpmtgPqokXraZCcJl0LG7aWrje+FO/GE0iIh4iFptFOdw7wenF6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448793; c=relaxed/simple;
	bh=YoXR31od0fpaO2XPi0As8ouYTDqiINfZ/6RytFHmRus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdAuswsJxhfnVZIYsWZJuoZV9/SeRiK5kgyNrpwveKyytpbCv56WTeq/28T/I0gmIqz1RgizhWN4gb+erq1As3scoLljRMFhiBP1/m47qxxIPs+FJIibT7bNwo6eVzuosnG9ZfB4D//WXvc+x8ZZZYCVNbttsLauFbh/X7d0NFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=gs5C8Ku+; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=L7F5vT10; arc=none smtp.client-ip=79.137.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=XArOVvWHd4ovw47AEPzIf9uGg7Dha+ZTSthwU9FAr8s=;
	t=1722448791;x=1722538791; 
	b=gs5C8Ku+jqMkC7hJbxKU/vYSHQ8okdxo+PHw63RWvBp8rsa2vQBU/Mrq//KRqkH71Wxa3J7iJ8VI1TV+HfZS3Of2U2RkdM2hM4Y+mjOQm73Vm5SAHVQq6HaP6magKkqShXDvYAR9ywanXHw/zI1PWk6NtOXs0LGqgRtdXmtWEBc=;
Received: from [10.12.4.26] (port=58866 helo=smtp50.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDby-00DtvD-Rm; Wed, 31 Jul 2024 20:59:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=XArOVvWHd4ovw47AEPzIf9uGg7Dha+ZTSthwU9FAr8s=; t=1722448782; x=1722538782; 
	b=L7F5vT10JwOvCfNoXtlS5a86hs45JE2puZ103TqUl4hLziJKpKvebwfYcE9RpyWbqjz7fQ/g+Th
	SPRefPjqLvaA/d5HfClKRZRCESopSjkwUgWbJE0WHwKzNpvyXBoJVFuJcFKM5eJhJeWrrMbF7cmpJ
	t8veco74mpepTweka9A=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDbg-00000000IYY-0yd9; Wed, 31 Jul 2024 20:59:25 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
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
Subject: [PATCH 00/10] Add SM8475 clock controller drivers
Date: Wed, 31 Jul 2024 20:59:09 +0300
Message-ID: <20240731175919.20333-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9AD89A2A5D4CA22889590FF70BABBF935182A05F538085040B4C556D6B8AE623B3DE06ABAFEAF67055F7CF7B5A1A82DFFF806485F292FBEEB8221C18B3D1622A4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE721B3E54BB37EA0B4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B997C8222C70C3D98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B0817466CEDDF39C995830582C796B18DFACB2F68C90E58FCC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80A9EC8C3488E7643F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C89DDFE3E282F3DD16136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3C30C415A873EAD8ABA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE478A468B35FE7671DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE73A6989AD488FD87D731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A566F3E928FDE2D1605002B1117B3ED696994E360FDDF5CAC6559C6C5561145D6F823CB91A9FED034534781492E4B8EEAD3B90412627F530F9A71A35648BE338CE9510FB958DCE06DB58C12E6D310A6D53A16EC4B4EECACEB3
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF34404677D5FBD32D6D4C78B4DA8164B4623B31984599B98D52E248BFA664CFD249BEE304256398FC1D9D8FAF50ED830B7A837B6F257E476EC126D84212B092F601038C3EF9E16C9A983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXhulaolFLGdpkGYMDDGQfqT
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A1EDE2FBCE1621770A891A0123D5A2206E699730EFD8861CD42C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CD5E897E0FC6E12404049FFFDB7839CE9E45E89A588AFC07058B618491CC7F3905C6A894A15F5D51C0CAEB7A96BA42A091
X-7FA49CB5: 0D63561A33F958A587CD5281A4328B6C82F5E73483B273062B05C315126DFD9F8941B15DA834481FA18204E546F3947C79510EF6E7F6D4B2F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637ACE5033AB9416A8F389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3777F8C72A04D893B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3urlPYivLNJIw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This series adds support for SM8475 to SM8450 clock controller drivers.
Was tested on Nothing Phone (2) aka nothing-pong.

Based on this downstream commit:
https://git.codelinaro.org/clo/la/kernel/msm-5.10/-/commit/b051ec6bdc4b4884905002b2e75753e6f1238d20

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
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

 .../bindings/clock/qcom,gcc-sm8450.yaml       |   8 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml     |   2 +
 .../bindings/clock/qcom,sm8450-dispcc.yaml    |   5 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml     |   3 +
 .../bindings/clock/qcom,sm8450-videocc.yaml   |   2 +
 drivers/clk/qcom/Kconfig                      |  12 +-
 drivers/clk/qcom/camcc-sm8450.c               | 231 +++++++++++++++++-
 drivers/clk/qcom/dispcc-sm8450.c              |  49 +++-
 drivers/clk/qcom/gcc-sm8450.c                 | 182 +++++++++++++-
 drivers/clk/qcom/gpucc-sm8450.c               |  25 +-
 drivers/clk/qcom/videocc-sm8450.c             |  31 ++-
 include/dt-bindings/clock/qcom,gcc-sm8450.h   |   2 +
 include/dt-bindings/clock/qcom,sm8475-camcc.h |   1 +
 .../dt-bindings/clock/qcom,sm8475-dispcc.h    |   1 +
 include/dt-bindings/clock/qcom,sm8475-gcc.h   |   1 +
 include/dt-bindings/clock/qcom,sm8475-gpucc.h |   1 +
 .../dt-bindings/clock/qcom,sm8475-videocc.h   |   1 +
 include/dt-bindings/reset/qcom,sm8475-gpucc.h |   1 +
 18 files changed, 532 insertions(+), 26 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-camcc.h
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-dispcc.h
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-gcc.h
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-gpucc.h
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-videocc.h
 create mode 120000 include/dt-bindings/reset/qcom,sm8475-gpucc.h

-- 
2.45.2


