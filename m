Return-Path: <linux-arm-msm+bounces-22752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9A909424
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DEDA28404C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D571850B3;
	Fri, 14 Jun 2024 22:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="bIH8UA5+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="DJFbO/G9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38455146A8E;
	Fri, 14 Jun 2024 22:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718404097; cv=none; b=LE5xJRNt3Gw/81U0Iegt4vPv5kUlBE3DUdO2CaWXMqy/bhjKCf92+M+WIqf6Cb5o61Hx6Swqhm9xzCWlTJ164Awjt4nCTI61HkATI1oZ0qms2RDbiAWV1JmmYJn+vp10oTuCiPnT8zOsZ7hIjHLdRNi++Qky6j7QzuqPGZSmuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718404097; c=relaxed/simple;
	bh=WhXNeVVMREgw/nAHO/ZdBsGt2lxZHEv1NWSOPF27Zbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGCZ5a24qb4Lqu3NzfRVgXUIvs8f1haxyukU37JuGDWVWIqZFIWzTwsAXhF42/fz9QMeQEp6z0RFDJi49AoUakrlRg+IpkajlBO4zJ2KJPRKCVBE7iCUUtmrhhh7eJk1tA9yQI/U/7nbmFHHFdz3mpTLEHnsBovm5ldFyjSFuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=bIH8UA5+; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=DJFbO/G9; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=qBrlhxoyGYIX/FkKuLeT+dLsA3at60og0PQxkArnBHM=;
	t=1718404095;x=1718494095; 
	b=bIH8UA5+dfqlyQmcy0DhaFA5ob28biHsV7U11jH1hzTft/1LWeTmxLF73u+fqodEhKnow/m7sM5z/fwQOQ10JdevESH/6KalA0Q5wwrSGkNvjdWNpxkqQGnR1zdzNmibVR3wyThLXhGalg45iNiQoIesEsWEGwZk5ryww+doIeU=;
Received: from [10.12.4.28] (port=60672 helo=smtp52.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sIEx4-001fFu-2s; Sat, 15 Jun 2024 00:59:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=qBrlhxoyGYIX/FkKuLeT+dLsA3at60og0PQxkArnBHM=; t=1718402358; x=1718492358; 
	b=DJFbO/G9QBQHhNYp4AqCpCowZEJve7W+r3ZJ/kAAzZxNf2QQq0ySkhI0Ezoqr6Chy2UIRjM1uXG
	C3KYbGArZdLHvN7yWLAdNfFFIzYZnAqHHXLs6z8IZTP8EkJgFSXXlnqiyy9Zq7RzsDvGanEJf5mtD
	L0iZaiBuLFNqMA+CVWo=;
Received: by smtp52.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sIEwo-0000000DQt7-0fot; Sat, 15 Jun 2024 00:59:03 +0300
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
Subject: [PATCH v3 0/4] Add MDSS and DPU support for QCOM SM7150 SoC
Date: Sat, 15 Jun 2024 00:58:51 +0300
Message-ID: <20240614215855.82093-1-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA28F1BD06D4CF66E6FBB893C35490C21C00894C459B0CD1B9024E8280270506ADBC1E996D91BF8BA8AAA09460975C62D331FC8F41566DE7970DE140DF427568CF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3589DC202DD7369EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063790B55F3E386DB9B28638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F6DB21DE365137F61367D1A1BD11C48D4C07A2124609FAABCC7F00164DA146DAFE8445B8C89999728AA50765F79006377C70927E34808485389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80839144E5BB460BAF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C1DAA61796BF5227BAD7EC71F1DB884274AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3963AE2AFEF160AEBBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE73A6989AD488FD87D731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A572D8628D918D88495002B1117B3ED696B42F0537A5B1057819AC5B239BAD4335823CB91A9FED034534781492E4B8EEADA2D5570B22232E1EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6E3AC12C8FBE4226D3D85F98EC02C61921434E08D67B9B54F9C1DFCF8833E9C28D4FFD5EE5365399BC11D93875BCBCACFF90F3712A80EF730A7495B692C6454FA784DBFDB1348CF354A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXim4nADFW8Ww8wzEdE2OTTm
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981941D1884D218BFB88BD48BD36611AD346B43D4AF59BF160B4C1DA9628851132B2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4D68C2164A06637339A6B427C6964551956E27A177BC28D17049FFFDB7839CE9E7B7906BE19DCB9BA99D405E206373BCF41FA189A36131C36603D6575471E07DA
X-7FA49CB5: 0D63561A33F958A5517F9886D5F99E352D9D1BA84A3ED7FACE7BAE2148EA70B38941B15DA834481FA18204E546F3947C91CDFF9D8A70DC94F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E6C0ADD64A1FD931389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C393E899A2A207F19735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojF87fI4pLnoBfPQ+yjMaBKA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This series adds MDSS and DPU support for SM7150.

Changes in v3:
- Swap DPU and MDSS patches (Krzysztof)
- Add an explanation of the abbreviation DPU in patch 1 (Krzysztof)
- Switch qseed3_1_4 on qseed3_2_4 in patch 2 (Dmitry)
- Drop LM_4 and LM_5 in patch 2 (Dmitry)
- Add Krzysztof's R-b tag to patch 1 and patch 3
- Add Dmitry's R-b tag to patch 4
- Link to v2:
https://lore.kernel.org/all/20240612184336.11794-1-danila@jiaxyga.com/

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
  dt-bindings: display/msm: Add SM7150 DPU
  drm/msm/dpu: Add SM7150 support
  dt-bindings: display/msm: Add SM7150 MDSS
  drm/msm: mdss: Add SM7150 support

 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 143 ++++++
 .../display/msm/qcom,sm7150-mdss.yaml         | 458 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 335 +++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   8 +
 7 files changed, 947 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

-- 
2.45.2


