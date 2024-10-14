Return-Path: <linux-arm-msm+bounces-34371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77599D7BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 21:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8593280DC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 19:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC67D1C2DB0;
	Mon, 14 Oct 2024 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Z0/a4r0N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="rHxbBuA+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback17.i.mail.ru (fallback17.i.mail.ru [79.137.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7046E1487DF;
	Mon, 14 Oct 2024 19:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728935331; cv=none; b=pbY94Wy0bJPgNP8ZjoQkDRtWWTMYhy+dnQsZmmEhNBskXUt49pJdonRCTYCEbIGqFGOSbM5Fb0Wb0FgAO1ydq/sd5XP+7M+vVZ+jalK63YAY218VNcAnJAx3XtkUSPwFLJyzCBfxJ6NXZ/6crkuOL524R6u6HfBiq3dFnYZGjas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728935331; c=relaxed/simple;
	bh=SUiA+Pki5jzFN6skEI3gCgv41ueDwSlniqwPotKD+ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YytuGZZNn7YX0wIgsRCNXqaOI+5H6JKLayrjojDON3IZUq/5tiqpqdyGZ/TfAi6QkqGz1tilh9Dms9hn5/V9aDz2zo/5jpGzFD6Z8LObCrKi8WBlYRKLcDImg/Mcydzqla6KzoWeOxuak/J665G0BYpaBIOvJUfMFPegbleczyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Z0/a4r0N; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=rHxbBuA+; arc=none smtp.client-ip=79.137.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=07xMARsZGPRhrUVPQudWGLHuFOKRC1dfPzPoAnTL2mw=;
	t=1728935329;x=1729025329; 
	b=Z0/a4r0NI3ndIpgoro0Ivim2jri1Fx0sG71grMRjuR0AltuAWQ9tbzZ+5otuXQNAg9Bc8ERGR6UcLm57n68cSmB7Z/zKi4LpegdofqGUeB+u8TmvLrFLq5mDpAX2toTmeyG0vMyBWaNSB+YECQ8od9cXxzoZwuQiHpd1Ku3JnEI=;
Received: from [10.113.15.113] (port=41046 helo=smtp57.i.mail.ru)
	by fallback17.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1t0R3e-007HY4-Kd; Mon, 14 Oct 2024 22:48:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=07xMARsZGPRhrUVPQudWGLHuFOKRC1dfPzPoAnTL2mw=; t=1728935326; x=1729025326; 
	b=rHxbBuA+Me5BPRX9C43m18XJTnQKPZ1RdOubWh98a7LdOYvmiX+TyhAr/bWeiJFbzmnM5cmQ//J
	Yf9WXSRGV25iwn3I/JDuDxz8/3/nE+KO/Urd85u50RoplM5B5jJkHFAfdhFg+c5lxZMuKzuS9Mshv
	dZrlq+aqpy9YMQigPyw=;
Received: by exim-smtp-57f79c7799-kvcm4 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t0R3O-00000000HNn-0F2c; Mon, 14 Oct 2024 22:48:30 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	fekz115@gmail.com
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>,
	linux@mainlining.org
Subject: [RESEND PATCH v2 0/1] Add Qualcomm Adreno 642L speedbin and update SC7280 OPPs
Date: Mon, 14 Oct 2024 22:48:24 +0300
Message-ID: <20241014194825.44406-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93347B6B2CAA5CFEE642B8753852C12B9C1761D26FA01738E182A05F538085040B631421925FF8B7E3DE06ABAFEAF67058CC61F5CE925349013C45BCBF80DB7AAA0EB5089CA368F65
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BF27F4FA2823CCF0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063727599E9BE65898D58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83569A72C5AE7328DBFC19002AFE200B06B7FCDF1BF67849DCC7F00164DA146DAFE8445B8C89999728AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8B355ED1E20F5346AF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C498E0EA6A736E147040F9FF01DFDA4A84AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C365E5F4F3329D3E42BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE97D2AE7161E217F1DD303D21008E298D5E8D9A59859A8B6E5E764EB5D94DBD475ECD9A6C639B01B78DA827A17800CE72128E1227B50B07D731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5B2E3ABE09E3A4C5C5002B1117B3ED696F7AEDAFA90234EE9C89B063BDC7FAC35823CB91A9FED034534781492E4B8EEAD09F854029C6BD0DAC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34C5CF6F4B28551E3F1D347B0D6D47664EA0AEB19005033159AEBC069184FD7541B97D3A347517C5D11D7E09C32AA3244C9C1B2D6CD170D4CA77DD89D51EBB77425305571D258E2AC3EA455F16B58544A2AA5FFCF869EFAFDF5DA084F8E80FEBD322CFFF16B4474ECB4573B60270F1EB7C214C2BC1176D5C25
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLPWNB68Sl1Lht+9rz7o4iA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949810EB9BC1412517BD595D4C5B18C328FC003047FA2C9067E5562FB2668C6B138E02C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4E23526250136A413FCC71D50D2AC2E688485A44A3A0B51EA049FFFDB7839CE9E3928B87FA8A99B44AAF419E3B3FFFFD2465D6A07EC887B22DA374F5EC7F6B9B8
X-7FA49CB5: 0D63561A33F958A55B8C886038E73EF2C21C06CD19F60ECACD6252D0BB76E26E8941B15DA834481FA18204E546F3947CB620D0E522F59CA3F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637B605B699A6668BB6389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3A8421AA044726D3235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLPWNB68Sl1KH7/oizGnq+Q==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This patch series adds support for the A642L GPU speedbin (0x81) to the
Adreno driver and updates the device tree for the SC7280 platform to
include this new speedbin. The A642L is used in the Qualcomm Snapdragon
SM7325 SoCs family, which is identical to the SC7280, just as the SM7125 is
identical to the SC7180. Therefore, the SM7325 will use the SC7280 device
tree.

The second version of the submitted SM7325 patches can be found at the
following link:
https://lore.kernel.org/all/20240808184048.63030-1-danila@jiaxyga.com/

Reason for RESEND: To ensure the patch does not get lost.
- Drop patch 1, as it was applied in the previous merge window for v6.12.
- Link to v2:
https://lore.kernel.org/all/20240731184550.34411-1-danila@jiaxyga.com/

Changes in v2:
- Add Konrad's R-b tag to patches no. 1 and 2 (Konrad)
- Fix subject prefix for patch no. 1 (Bjorn)
- Link to v1:
https://lore.kernel.org/all/20240722184314.36510-1-danila@jiaxyga.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Eugene Lepshy <fekz115@gmail.com>
Cc: cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux@mainlining.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Eugene Lepshy (1):
  arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.0


