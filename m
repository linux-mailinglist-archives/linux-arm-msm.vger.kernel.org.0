Return-Path: <linux-arm-msm+bounces-19226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288D18BC3A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 22:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F1EBB209A4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 20:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5187174F;
	Sun,  5 May 2024 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="DWJdEZL/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="g7Et7crJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback2.i.mail.ru (fallback2.i.mail.ru [79.137.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4053F6F06A;
	Sun,  5 May 2024 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714940426; cv=none; b=Rx5E1QnQdIOyGz6/bZ3qfcNS4ddy6xczFIADPHly4UBs75CsZ3Aes2HeU1lQJAVX3hLBduEMVBk4Qs0zCzoRR7ehXASHdgJqUyHHYIi1OjXKYyUxn+gz+dtFqgIN8qSR6VSbGfcNJ2yho8835AOYdGZqb0uVh1eTkSf54rtTqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714940426; c=relaxed/simple;
	bh=9kojEBDkEFmp/3cOpXAtoZO7iIW4Sh564cu3CG1egrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9ZsQioMf/6/wADsW7nCoJZccMH9t/UBFGR6Z5IuucZJVP9LLlduITkZnULkZAKp2ST54fmFXUUvvkRAPRjQnJpIH6+lPO8h0dVyzGuz9H6Nn1GH2hI2QMrdSfinz8ThpzXP32VvCbXvEW0IMgjlgMGON2au8zBFEGXcXmHNu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=DWJdEZL/; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=g7Et7crJ; arc=none smtp.client-ip=79.137.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=0lm9xN67YOvpj8DUKFhs0PFuKrzn5O9OR4QnrEoIT7k=;
	t=1714940424;x=1715030424; 
	b=DWJdEZL/3ytYZZ/TH19yIz7viDp0YqD7q53J3FICIM5wkRHVMPzo5JZLp9ZXc/rgFcwSfB2ZNKZMz0FaQ+M1a2XBYRGXKHQgB73V5mVfpXcwwQTGc83VLPDko2GFaONSH7oQtRaWpeEaF3nWJe3wYzkFCdauLvX5FpBAN7AfXDM=;
Received: from [10.12.4.31] (port=51750 helo=smtp56.i.mail.ru)
	by fallback2.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1s3iCH-009Loh-9N; Sun, 05 May 2024 23:10:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=0lm9xN67YOvpj8DUKFhs0PFuKrzn5O9OR4QnrEoIT7k=; t=1714939857; x=1715029857; 
	b=g7Et7crJLRUCxOdRdlWlCNvdyOxOEJ/2AVX7hz9PN1LyL6hEqGjMtUEGboRiZQZy7zVmAXC2GhX
	IezYfHZc/GC7+KO9azFf7TTJ5JgCqKkiWZ+9xOlBkA1B4gWSjtjS0u5SkM2SQS0EvncALq/EmFy3Q
	Bw/dpUCZvik5CKtQZ+M=;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1s3iC1-00000009RwX-2YeB; Sun, 05 May 2024 23:10:42 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	david@mainlining.org,
	adrian@travitia.xyz
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v3 0/8] Add dispcc, videocc and camcc for SM7150.
Date: Sun,  5 May 2024 23:10:30 +0300
Message-ID: <20240505201038.276047-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9C1015E4FDF5377802B004185DE14697DED15E1829FF4FEE7182A05F5380850404FF0DDB376DF59D95D1BE6A8D71B10A532D81D92453C9FD9BE7375619A971F14F8A48EF99929F69E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE706EA9E10470DC775EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637629A2DB6D7098C1B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D870DDACD1941D63FC965C51F0EA95FD597E4C16357525505FCC7F00164DA146DAFE8445B8C89999728AA50765F790063793270F7220657A0A389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC878444BBB7636F62AF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C1DAA61796BF5227B03F1AB874ED890284AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C37822E5BB35ABBEB1BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF53FA85A707D24CADE827F84554CEF50127C277FBC8AE2E8B03FB6F9198DE190422CA9DD8327EE4930A3850AC1BE2E73580CB4917E5AABA03C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A55E1922DFDEFBAA6E5002B1117B3ED6961B1BB675B6023924406406D89DD9EB8A823CB91A9FED034534781492E4B8EEAD4ADCFBF7921B375DC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5F59A5F5E337D129E0CEA1994C11EDFB147B1EED332DA0B24A9CB450A9FDC5182A6269F78606922F643425263F8C9A4E08EB7A18FE9C627FED97F980A7132E10BCC7182EE00AE844146D90F64BF3396102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXhtfmhBlCrOLNwmtwLnT8bO
X-Mailru-Sender: 9EB879F2C80682A09F26F806C739498105F947809758DEDFAA70CB78A12CDBB5C4AA04E62F1B9FE97BCB5A232CBF60632C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B476D451B6D5EC614469136B98AF0AE0B016188F7145FDFD7268F3CF0E9FE49B69A0D2E209AB8FF7E29A333EF79B47085043DF9FB27CF97B41BAEE9196DF9D54F9
X-7FA49CB5: 0D63561A33F958A575A7236DFAE4EB97891C4B20848EEDD0B74F37DA25EFF4E98941B15DA834481FA18204E546F3947C8361DED9BCED162DF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006379EB2EF34E05990D4389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C325AE611EB865B371089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDEjiLKIJgIdpw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This series adds dispcc, videocc and camcc support for SM7150. This series
also introduces various fixes for sm7150-gcc.

David Wronek and Jens Reidel were added as maintainers. These people will
be able to test new features at any time or make fixes if necessary.

Changes in v3:
- Split patch 1 into two patches (patch 1 and patch 2) (Konrad)
- Drop CLK_GET_RATE_NOCACHE from dispcc (Konrad)
- Fix DisplayPort clocks (based on a series of patches from Dmitry Baryshkov):
https://lore.kernel.org/all/20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org/
- Fix typo in cover-letter-v2
- Link to v2:
https://lore.kernel.org/all/20240321202814.59835-1-danila@jiaxyga.com/

Changes in v2:
- Drop patch 1 from v1 
- Add Rob's R-b tag to patches no. 3, 5 and 7
- Switch disp_cc/dispcc, cam_cc/camcc and video_cc/videocc
- Make clk_init_data const for dispcc (For some reason this was missed in
the first version)
- Add gdsc cxcs for videocc
- Fix topology around titan_top power domain for camcc
- Drop the CAMCC_ prefix from camcc gdsc names
- Add flags for camcc gdscs
- Link to v1:
https://lore.kernel.org/all/20240220165240.154716-1-danila@jiaxyga.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: David Wronek <david@mainlining.org>
To: Jens Reidel <adrian@travitia.xyz>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

 .../bindings/clock/qcom,sm7150-camcc.yaml     |   60 +
 .../bindings/clock/qcom,sm7150-dispcc.yaml    |   75 +
 .../bindings/clock/qcom,sm7150-videocc.yaml   |   58 +
 drivers/clk/qcom/Kconfig                      |   29 +
 drivers/clk/qcom/Makefile                     |    3 +
 drivers/clk/qcom/camcc-sm7150.c               | 2061 +++++++++++++++++
 drivers/clk/qcom/dispcc-sm7150.c              | 1006 ++++++++
 drivers/clk/qcom/gcc-sm7150.c                 |  392 ++--
 drivers/clk/qcom/videocc-sm7150.c             |  357 +++
 include/dt-bindings/clock/qcom,sm7150-camcc.h |  113 +
 .../dt-bindings/clock/qcom,sm7150-dispcc.h    |   59 +
 .../dt-bindings/clock/qcom,sm7150-videocc.h   |   28 +
 12 files changed, 4045 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-videocc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm7150.c
 create mode 100644 drivers/clk/qcom/dispcc-sm7150.c
 create mode 100644 drivers/clk/qcom/videocc-sm7150.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-videocc.h

-- 
2.44.0


