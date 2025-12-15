Return-Path: <linux-arm-msm+bounces-85198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A4CBCF97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D04B23009FAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FC529BDBD;
	Mon, 15 Dec 2025 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBRiIVkz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJ9w2OoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEF52E6CDF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765787992; cv=none; b=czOcT3gW+HHTp2I/ghHw3EChuAjPrPyiUqtNYxdm/q4AR1cwBl3837KQlh3OtPXYxnsHdWyntAeVbcFcEk+dgIELhaEPLydSmsPsL3DCmwK/WIuMzmKsDNlgKAwk9UdNho/oRESEDSE5Nw/vDDNvcnDaaTAco1LUTQBENtAYqPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765787992; c=relaxed/simple;
	bh=+1PGelHuUM+FLbba8YvWVZg3/Z781s6PiqEquT+2Fxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y9JhZBUVgK24VnlhHbJl0hzMWr2cjueV7YG1dn8kB3T1U3rOQEuYRQU9ydS2WwfvM1DC4XldYgj09wXtxOo7NiXO8rR09auaQ564v0vTdWLrALrn+Zqa1tJfIXYHOSV0GOlfH9Fn7s5nU999hAWjJ5VxvTOiAvjFjl1p47QQPvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBRiIVkz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJ9w2OoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF8dlkR2576879
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CC+4BFqt1YkGtgs5ir/xbhC6q4kVA/nflLU
	4A6y5ywk=; b=EBRiIVkzPuaggIMgkifTIMbjOhhq3XJHntqmyjhvxv8Eprnu2nB
	/UEN9qe/Kp0QJobig5cfhDHvY0ObVXZiJzNSO9jNtalPZkez3sKvLq6xCRnT+ZXu
	oQ7VamhuAvHdqg1NsltbxZZlDc6+ZOcBVay1VSw1MSgloO4/U+MgmAvxzUsT14xS
	bohuAcrEmCrG6S1BXJCyGP+cu4ZPrqjJ/RqS+LNyKB8vxhf4cOd5CrX+IQwmrXy+
	VsB3M5MF8Yn4KugLbDSB0NX/xidkjdYgQ3+dXSHBsJKCdkWB+C7WgtX2qi5jSxWO
	n73jVE5NR2o1ERbZo/E4/BXZvcf3UAsmBfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6ku0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:39:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b51db8ebd9so1165439085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765787988; x=1766392788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CC+4BFqt1YkGtgs5ir/xbhC6q4kVA/nflLU4A6y5ywk=;
        b=SJ9w2OoEznIiCAGrM9g+KVOSaLwpMli7zI0EJyJ/6G6EbVVD1TXx71Qk+ccHMYSYRI
         C3WMJYMKwJO8Ks/hwYLwwYzfnkPNpldyPO5S+0CsbWHa49O1chwGVEn/DxiN0QwC/Uer
         MJC1unak9xXx/+0oXXvXqEd1sYlEfGzH1BwrigAabh4JCCnAblrJNv3u/mpJSyf5pl8D
         gqYesXKZF2nwD0PPPAB4rHSfvG9UZ5n6VOm/KJULNFLELzUIi+i7wqxyCtC3i11JWTXh
         jOGeUjSBo8BSIwTb6HTvl0insvPqiRt1u3OlLJ6ZgBKXA06ZAvCb2v11V2074VmLURRc
         9czA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765787988; x=1766392788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC+4BFqt1YkGtgs5ir/xbhC6q4kVA/nflLU4A6y5ywk=;
        b=VV7nXYkcYfOTvXm7ZARud+1C2P/UfHOrCGuq1xhyzSbvlO5dMfv4fWHMyOxRnf4zNo
         n7bqjmzHSLjYal3suw75gyLY2eU384jceZ/ohbvv4Eg5nlnx2lPRgbHgq+AgSI+kyA2O
         t7t19F8DI1MyhT4evXMyHja+bSZKnRZm4TMsjTiOnafRXtL8exJs9AQB7iZPcc5oCSBU
         V8P2//GQ9zycfeV54CB5ytck0OLLBMu/b1k+FsYDDsGDwtD2OYGh5TSxqAxuzHy8CL71
         C85clo2ewzHlAMQPj2j3DhA9bBfkXZj0CjmA9UulU6ctqbXnoSvVwkiOEtqC24OjXYne
         C+CQ==
X-Gm-Message-State: AOJu0Yxz9YKwiCj9Do9KAoHaVIuSMj5JIFvmGvO48zZGkm8ua6v4TLQ3
	A9V00VbvUBpZQj4RZGyscB7gPANaI9GTl2MqXelTRl6sRU+s6QW8mqoPcueSxr0RqeBoRJc2Moy
	tuT+2b0j8mxyzPKfzqEkc+ynt65PcodNAXV1SSseP1MbpS9X+SiTFTxgIshy3CneluKtl
X-Gm-Gg: AY/fxX4j/WZINXpLBgHh/M6Wgwpnj/o+8HIJufo38K8q8AwIzNqOGcsULpIkJYHa1xs
	AQm3ytN/fPAIZexwajFMrGXptnb3pJ1V7ptOa8+1SVl+uoOy24P9CsZxzpUquaNKfWxUsXKwVTL
	RW2m8gUAO+FqU9HuhQyoDObxMASflpFwVx/Bv1mMJ5woBo/9Xtg++gp9IrIh+xqklH66l66XEZZ
	IjKTVEBDP3gg4aDJugjl7LRa92Fc9xVTFKlGg8BDrcgTg2cHP5y/GA1DwMHilVRoCv1B8ipym53
	o0pK2uUVU+Wwtw5zcrPl5IiAMVbpJmjjwlosL6TvKo21t8O4IsfERA1HWWHfN/KzaXzfqrF3rWh
	imk6+Z2vXHAlBkb2vvFlDpNzMbqhxOkScfIahyuqZehT1dGwwe9E1jx+KVuvU/safQ/U=
X-Received: by 2002:a05:622a:a14:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f1d05aba1bmr142311511cf.51.1765787988223;
        Mon, 15 Dec 2025 00:39:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRWniEvfTeo2vJj07fDM5X+bNNfh2o4WM994jeA7CX5unkq7AjKhoLCsggahjmZTPow3hazA==
X-Received: by 2002:a05:622a:a14:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f1d05aba1bmr142311411cf.51.1765787987786;
        Mon, 15 Dec 2025 00:39:47 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:39:47 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 00/11] drm/msm: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:43 +0800
Message-Id: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693fc955 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fD7pSEWciPXgxqq5vjEA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 8TRKxpyNq19rifw_U6aEM-hO-731NgNd
X-Proofpoint-GUID: 8TRKxpyNq19rifw_U6aEM-hO-731NgNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX9HkfgE6kPbW2
 Zkns6SG5Y6Zu7581Ipn0N9dFkxFwrXKSyJ2q3B7teuwaify/TLfFESPDMY0grZO5jdckgy83ePz
 O/ubjk2shB0COMsB47DMZlHZr7szkenjmdK1Abj4g97lZWp5LEnSGN5JUiIWB277s2g4n8lgJ2l
 lTE+wgHMzCHjUmsLnqXAnYXOaVfJxq33pMokcuKi/PijHG9TiwsCrLsmTjSWCSRHY3GhCfcTBjq
 S4K1F/QZc7PPutqn/DcgnjCmh8PVz9bdeEF2KGYh4PSNFpbIAff20zFC8vFI+4YYzNWRXtIMXiU
 zRqJjPNHKH2o5+4rMRlyYso0pGgKIMh4UjGIDpQL5RoJQTTWyVynESLvu4MCAHTnUyvLqhspeJ9
 5c200Xm1nj+OEnMxSLCMo2oN0UKUsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
- DSI PHY/DSI base address have some changes.
- DPU 13.0:
  - SSPP layout has a great change.
  - interrupt INTF layout has some changes.

This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
in addition to the driver changes.

We have already tested the display functionality using the Kaanapali-mtp
device on the Kaanapali branch of kernel-qcom repository.
Test command: "modetest -r -v"
kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali

[PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v3:
- split SSPP refactor patch
- add devicetree email list
- fix Dmitry comment
- rebase on top of msm-next
- Link to v2: https://lore.kernel.org/all/20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- Drop panel patch
- adjust patch order (bindings then drivers)
- add dpu_hw_ssppv13.c to complete kaanapali SSPP function
- fix bindings example dts compile error
- fix other comment
- rebase on top of msm-next
- Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/

---

Yuanjie Yang (11):
  dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
  dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
  dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
  dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
  drm/msm/mdss: Add support for Kaanapali
  drm/msm/dsi/phy: Add support for Kaanapali
  drm/msm/dsi: Add support for Kaanapali
  drm/msm/dpu: Add interrupt registers for DPU 13.0.0
  drm/msm/dpu: Add support for Kaanapali DPU
  drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  16 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 160 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  56 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
 drivers/gpu/drm/msm/msm_mdss.c                |  10 +-
 22 files changed, 1494 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c


base-commit: 06aa394d58c11406569bcbd4a69b81290edf3f63
-- 
2.34.1


