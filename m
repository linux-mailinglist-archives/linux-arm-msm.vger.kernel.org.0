Return-Path: <linux-arm-msm+bounces-22507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 133DB905B54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B5F61F21D2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5274DA13;
	Wed, 12 Jun 2024 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="TLNXl63S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="WlcMd5Nr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04545A0FE;
	Wed, 12 Jun 2024 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217849; cv=none; b=KQRDWr3q6Rd+fR7N+aWWCyPgu8eI+jPVC+hP4qF/Cvox8dwjhSmTDwwM53Z4J1GnH0/g9QdR61dfftmuhOt4Vp3i/nMyLO+QoBlKiLMDjIM1jP/B8BhcPmJOuNWwr4DMPxGrNVpFMkcJ5R8RAEOb3xbTv88VHx72kMwvU4Y5rMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217849; c=relaxed/simple;
	bh=HnCSolQGaagleb9kvZw9J5DWokIhJ5jmBWw8ExaE9rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHXZdmhT2tAtHHmRgs4objgVfIGcCMtjE0YbjdshPfjOrp3rW1GsYGjBNIvrUXqWQsMBhqQ96pOaRHZCs/GvWhxbSpWgG/YqVmEt9elZOcduwm7vGj0ktErb8aycS5z+zhzp4yEeg1pCOgva8W4GcSlO8tiFI85BK05ntClKxk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=TLNXl63S; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=WlcMd5Nr; arc=none smtp.client-ip=79.137.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=CEVnOCs2hSB6ab4esQW2X4lItVZ6fQ9H/RCZ0rpXcws=;
	t=1718217847;x=1718307847; 
	b=TLNXl63Sy9maT1SElpCADJHWIJE0/4qbxUd1VwpAngZl6Lm6AyzCPaGhDEqK4unhRnCSAkXLlD1KA+RPhiBlt9nqw2W88w/VqqAvLiU2JDo11M7iyVmxNSeBTJQpAmBslF5+FtS/sEGGk2D9aoya2ssUokbBFyG0sx1Tk3eDqwY=;
Received: from [10.12.4.3] (port=51504 helo=smtp17.i.mail.ru)
	by fallback13.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sHSww-0044EJ-Vr; Wed, 12 Jun 2024 21:43:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=CEVnOCs2hSB6ab4esQW2X4lItVZ6fQ9H/RCZ0rpXcws=; t=1718217838; x=1718307838; 
	b=WlcMd5Nri+cQdffgnBKedwD5ZhaRUeUmtBCYwvhkGu9vI0mmthP1U+Y9Cts6HMNXrAnsKc/uaru
	5bnNCHgjcVaCNk1k88t0E/+Ekpu89kzPWQJQIdP8/y7IzxFx5SYuioTxwhU9ERjCpTm+WyAD10dG2
	8gMUnCCuoYzhGmc/Wjw=;
Received: by smtp17.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sHSwh-0000000D0R6-2wKS; Wed, 12 Jun 2024 21:43:45 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_rmccann@quicinc.com,
	konrad.dybcio@linaro.org,
	neil.armstrong@linaro.org,
	jonathan@marek.ca,
	swboyd@chromium.org,
	quic_khsieh@quicinc.com,
	quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 0/4] Add MDSS and DPU support for QCOM SM7150 SoC
Date: Wed, 12 Jun 2024 21:43:32 +0300
Message-ID: <20240612184336.11794-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA28F1BD06D4CF66E6FBB893C35490C21C00894C459B0CD1B9E0A1FDF6F10A4B8583E6F0B08ED3DBBEF96DB77A3BD4E63F57EC9FF7D4E61EAD8472923344694FB0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE775E4C393EFDC22A2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376F978168E59B07A5EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36E4683DFBEAB3A01CC032503CFA2597D338758AAFAE1D69BCA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7BEE62E5629C982429FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C332941D3B652364A4117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFFB176FB4559E527BBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6860B3362B5333A1D76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249957A4DEDD2346B42E827F84554CEF50127C277FBC8AE2E8B974A882099E279BDAAAE862A0553A39223F8577A6DFFEA7C789C969B8F27C422C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A50D478F6E60EA37335002B1117B3ED69663492A9E997FF94D1E49B01306B5E3AD823CB91A9FED034534781492E4B8EEADB30A456A8F293845C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1AB1EEBD33F20E9A0FB9B50CAC78E4F56DAA9F478E8F1324DC4E578C19C6D0CB8D4FFD5EE536539904A26A3878DC1330EC977B22DB5FCADCEB33B4587FF888A380EB2E67E8563E6454A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojP/c/PTD82AkY4uCJ69Pflw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981441996D2511AD5D1E693A2F4CD4B1000CD8E2D3270CE1AFCADBEB03443A6C7512C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4D68C2164A06637339A6B427C69645519DFB0ECE356930585049FFFDB7839CE9E30D7A70BAF70B54927357A8EBCD2D7066C7DD6BC84EAFBF2DBB084CF3D339018
X-7FA49CB5: 0D63561A33F958A5F88290440FED19DC8777A33E631FCCCA8BD9635A319F7AC08941B15DA834481FA18204E546F3947CB8F3A0C5C9CEECCBF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006373CB30CAF732C8CD6389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C37183D792A4EAFA8935872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojP/c/PTD82Amy2cvW78uKcw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This series adds MDSS and DPU support for SM7150.

Changes in v2:
- Drop clock controller headers and use invented clocks instead in
patches 1 and 2 (Dmitry and Rob)
- Link to v1:
https://lore.kernel.org/all/20240611223743.113223-1-danila@jiaxyga.com/

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ryan McCann <quic_rmccann@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (4):
  dt-bindings: display/msm: Add SM7150 MDSS
  drm/msm: mdss: Add SM7150 support
  dt-bindings: display/msm: Add SM7150 DPU
  drm/msm/dpu: Add SM7150 support

 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 143 ++++++
 .../display/msm/qcom,sm7150-mdss.yaml         | 458 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 349 +++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   8 +
 7 files changed, 961 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

-- 
2.45.2


