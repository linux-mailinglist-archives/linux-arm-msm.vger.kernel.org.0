Return-Path: <linux-arm-msm+bounces-88108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF672D04978
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66F0930911FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F66370814;
	Thu,  8 Jan 2026 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKDFg9o6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1+4mJz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC45695
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887392; cv=none; b=igxHkomDIOt6qP01XPg92DZO/8KoLWrAqPR6rZD62ahjR0RYUwh6287vtSkusoJJQkpYF26CCJA8/E/qUC4tvVbqATja/30cZs3WsQxXlJXILm16fm9kuGkwEtbmYjlDTcaMLD15Ouf/WAXgx6R+CCJ9LBSaHXfzfubHtptwjb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887392; c=relaxed/simple;
	bh=+rSt2Sl/psej65LSvQKfmIFh3M1Z/qO771VDL0LXWvM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yr9cjqOx22Wg4sNgTHZSrvhluhRGue1yy9KH9OPVD/2E8HGkCgl1WuTmA/KtIaj6mULtPGwO/GWC2lHhgNY9e51qaAAA9JlkuFyA3KpIai7gzA2PCAbdHBNe2dKJBPJa5Sk7QbFeAX7TykVmITzlqJCx1K67Wn8HmAw8vGtqYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKDFg9o6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1+4mJz7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089IJ9x4049966
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 15:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=p/HZ58zf29jYmVW+sORZChb4+DSCtmh3Yrr
	S5zE9Izw=; b=KKDFg9o6YeGRLsOU+atarVRRE9vL7XocNWH3NRcTG2gYlqnyUn9
	cqkc8NUquzoITiQ5GaG8TwJbsE3dR7mXGQJ1xMUUImtmZzPdml24TfSlwF+Uxy4B
	XAzriWC/H8O/pLKmobZAvhikJZKxGyPsOWpll3klob0ZeJVqB0k8d6VvFg3pVr0K
	4dXfw+qAH8ihUmZwRugnZ38BTpAQstoUQdaMnWMiArmiQSNmNyfAM+8Thg3z/jrY
	GPP7JECB93L0fUf5Hu5dYJktwzBj1LwFHRYoa0SqUdgO+jT4xc0JwdtwNNnIwCwk
	hYMLuZiuK/6uif5YH2TkRlg7hk7hDavmFvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8jk60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 15:49:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c1fa4a1c18so782173285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767887389; x=1768492189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/HZ58zf29jYmVW+sORZChb4+DSCtmh3YrrS5zE9Izw=;
        b=c1+4mJz7QpZ+Jf6CKF1btZW5USzcwcBEyBMBSjxkoI0AU1nUEEYDkjGgy/TgakmT0M
         vE/i301KxOIZgFe2abG0Ou+NenlcmN7oH8f0t1/aFOKfpq6hpfFLcGwAy/OdhuERABqO
         55Oqd7iyZqyhMAI5aaBA6WQ+08YACS07skPbuqQRrSzerkztJWHDIfmUNsvUWrJqUngy
         5ohWQbq0DFNaWu0ukEdV36G9H4YPJSO/SI+EIoI94Eo/Th/qiZgnJTd4qZxvbHiT9bLF
         Ie6uZPslyPY4+Ih7HzBe8dE+qmuYSJIQJRpxM7EHPL97kVsmFPjFB1vLa53SAeUCHoOS
         3m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887389; x=1768492189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/HZ58zf29jYmVW+sORZChb4+DSCtmh3YrrS5zE9Izw=;
        b=nnWoauYQBGilgCrrcuM0ZDvDBshFi1C9O2Bi3EAtk2RJqN6oEB/ADKDAypLK+tCN9l
         5EBZTXHNoO93S2YQDBV0JV4D/Dcy34VhhxPrnoa8PETSRXrUiQ2cbEFayjHPpsx54W+/
         d3MfU2VI1edKBpnxU9k8o/Wn6gEmdwEavImZRLNddRQlLizfCENwVfgz3AIM4qCdcQjm
         eXDXl0dtdF4cZbeLlYDJsfy2vicVkrzXHc32agMSFuzKTCR8uvds7/UkkvRpurlE8MLi
         yeySMoAxmaDn10Sd/i+p6wgP7jeYTRomTGuLLMrYrASIkMqxxlng1AlBF05lve9N+Inv
         VmzQ==
X-Gm-Message-State: AOJu0YyuRvE2N1y8GEUh4vHn9iBRjOYOiVpxRkEViJbA5C6AbW5KccLR
	g8VhjR+BOPkRcp2zpQ+IAAR9X17nvN+DBE+Bu1/FUD3JKgz3k6ZJol+oEYxC2zC9Cc/7I9uM9ew
	0Ft7a9rGRKxYKagMgQ2CRV00vlUPWKO0Ewn8l7TWl76mJsZ4JXeq8l55s4HIZ1aTZXJhH84mu6Q
	PK
X-Gm-Gg: AY/fxX6BanuahZ6G5vgqyvUaRNLFgcBLooiPxdHzWe8NJGCfAvTBP8pA9lbAc6349se
	Q4quIDIbw4pM4ge68FI4Vgf80ZBiNLBXz1ltbzhVt6UpHETT+r/SRdoCeLdCCrGDcJ/yXox2dZj
	maQXHgERYnEYs0mOZjPgtK+3norYhTswASt2ZYm4gzvT7fd2RDLL4jR4qyl+x8s2wu9JzPNNiB3
	TNsGx7I1cBMyjb+vObTvw70aIwZGKteVJQef8c8ls+rVrQpcAHqe6L2doOwq3t4/OQAG1Q3WOFO
	kT1vBf4pq5OuYs4QQF0B6zmc1KvD0e61R28RH+AnFpoPojrydWngc9PziTPVm/f3WP6m8uCjlZ9
	aY3Osia4hUfwBNBmDrrWwNXiYJh+PEfRV4oKl8U8c4eKI+NLvz8BbR3Cw1fHQPKdFQg1c6J9pVs
	Br
X-Received: by 2002:a05:620a:1726:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c3893688f5mr902589185a.14.1767887389165;
        Thu, 08 Jan 2026 07:49:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkKN+dguBranu2hCCdsLEooGmpWyCithrBFwiR+qTHo/YTnl8hHNstMshKtfjqdEMgdEsg1g==
X-Received: by 2002:a05:620a:1726:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c3893688f5mr902586085a.14.1767887388737;
        Thu, 08 Jan 2026 07:49:48 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm8078121a12.17.2026.01.08.07.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:49:47 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/4] phy: qcom: Fix possible NULL-deref and runtime PM race conditions
Date: Thu,  8 Jan 2026 16:49:40 +0100
Message-Id: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695fd21e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=C7rGozDzmCPgz14KtV4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BEFxF2-g9wSnP10BkoW7JkKHnrryavOJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExNSBTYWx0ZWRfXwPje34oY/Tg2
 aOQcbFeCFVN0UIFpRE6z3KGxLW7AS64Q5oHIOi1MREdUn1NZOBOuZ7UXBemHy/HCTovzjCWc7U4
 oD1Nq8fuPtv6XBvkmbwp9ZmDk6FUkGrozG/Zc3hh7HO3f2hZEfW9psI/VsWe2i84uXDCTCJOESv
 sXliDPgSzxz1eNdEup66JicQELyGw+C4ZuTb0bWE89qm3pIMnlw2Eaoqap41A0JV2xfmu1ml7S9
 z7yTffWUa7ZAT9V6lOM01j87vX0OWY0mfYrsAPa6to9QfjaeI0k8s11KVQTOPzHCIwM3FWqN3Zr
 WweFV91JqUKqXjr9iLqOFYkU7SvzdPY7V/aEEyb4xDTf7FwSKuulqdgT0Lf5fdYux20dKDCS8/9
 ZyyJUFXIOXKo+FssLVHzHDydXfEPvw4sRCgcjziRgU2+C+VuBd5wyv0ckH7ae0rKv8WAFHdA9Zt
 YErHSLWyvtdCkB/7UAw==
X-Proofpoint-GUID: BEFxF2-g9wSnP10BkoW7JkKHnrryavOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080115

Address potential NULL pointer dereferences and race conditions related
to runtime PM in several Qualcomm PHY drivers. In all cases, enabling
runtime PM before the PHY instance is fully initialized can lead to
crashes during early runtime suspend callbacks.

- Attach driver data before enabling runtime PM.
- Introduce initialization flags where needed to avoid dereferencing
uninitialized pointers.
- Reorder pm_runtime_enable() and pm_runtime_forbid() calls to prevent
unnecessary suspend/resume cycles during driver probe.
- Use devres-managed PM runtime helpers for proper cleanup.

Loic Poulain (4):
  phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
  phy: qcom: qmp-usbc: Fix possible NULL-deref on early runtime suspend
  phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime
    suspend
  phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime
    suspend

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 10 ++++-----
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 21 ++++++++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 14 ++++++-------
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 15 ++++++-------
 4 files changed, 34 insertions(+), 26 deletions(-)

-- 
2.34.1


