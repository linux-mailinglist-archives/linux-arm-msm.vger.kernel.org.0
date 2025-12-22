Return-Path: <linux-arm-msm+bounces-86203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74326CD5989
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 926953094D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1A432E751;
	Mon, 22 Dec 2025 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqqol7of";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmwD4cBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2892F32E15B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399060; cv=none; b=pqAxxBaP2pYW/rtqDdTwqpaBUrY6y90wxDsxBCeKrInX9ycGJ+FzlMYbJIKvK18e5jpoQcSwAS+JnfRKbYkhVt0e0jG9oJ4RGejCFM5ey2jC3KCiGA+RZcXWsBEbZATAUm0qPGWLfI6tQtcuks+vHsm7Fo+FHI8bpqahIla9KpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399060; c=relaxed/simple;
	bh=NXJDjoQDfjMAtJWbdJHQqv+DovMI6Er/oiV5bd8UhVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gy1NqcFEKuKVJUgz2FVZ4gJsL3KeiYNw+8wcWzdT9oHuLqpvYUxXCuHk5hkvPx+eEsXM0/U0+G97JLMbfYHFqR5+KFwn/NEyopbJk9+CQMhdG8ZM9njKLKQf+pd3dw7iolo6cPl4s6eRv1StUg7rdDHucDfUIVVefruvPT07kyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqqol7of; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmwD4cBa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM83cX23812883
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4
	gV/dA3ig=; b=Sqqol7ofOMa1Bir8T0XN4p0JDMmS+Jd7hvvIlHgzjamkErhWdQZ
	WSkq1b7Fy6OPQMaRnLFhTEmkEsUc0vstin5WnIwLOtXykA1GwOh6HwMz7IayUYg5
	jaqV3nruUxYzYdrcdJSnFvMrrLAzRXK7W1Pd6/MoLAdyF/HxelEFEWUBXxVso+5U
	CHpZtyeebCHbmff7OxWsR5xDkDwJrnSzvZwgwSVb6699b2LX6veQQLdlizVBchHI
	6qN3aF7Slq6SGhfD/OsLQHqSHwTjgtpw9A9g4KURQ9z1oUqyQMnRTkG47qAk2X1s
	GACkwXn5PHD9sWAhkeTOnqO+E9gkuibV30w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4nb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so128342436d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399057; x=1767003857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4gV/dA3ig=;
        b=bmwD4cBa70Oe17fe6309jidjeRlalw/bwCbNds9o7CJBcX/JlRet/+abbQel53dD/D
         tipu610O44CdXqop1ZFI/6U7+Ip3SuiYSOrWd5h7L8TRyrYlC8unsWSwFLAJ+gPhGR3k
         asuDamiwHjMnVIba+9H6V0OHuuoPlF043U/glvViwX+LZllsR/cgpSnMMuQwHUxSBrb6
         BkvWyuvASQHb914S0iz2wCOMUJOV4+gjnewvn3XzLIIPSWWa4Ox3YiZf/5eHX70Cn5Fo
         8rNx/5uHlqLO4dM2fKtEew/rKQLAxWaQ9PV4hQvTsxdOFW71Se1T90rR/C4BOWGaU7NG
         mR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399057; x=1767003857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4gV/dA3ig=;
        b=cd3kpsHz73PI8GUUogFjs7br3SocS5U6jVnlYh2ztEbehIbaXhc5k7G9jzaGJYZ8uF
         VTvTBHHjAgoKeaxu+gGiBbhFvLVDPlb8hwYtDxfLXxUPHig9fiDRW3ZFOIfaMj5ofJuu
         l9poQaYbT6mJTf6OIAQQ+9xBTT3s2Qdcbz+4JlQr3dNq9NFl4IeLkpwO8tpHa45G08pP
         z6vltFRWU/3w0yY1r8T4NZXrGoCLd8xSpMdKugJWD9PPUHA5Ehn88Nzfn5rQ8Twe1XWA
         lhrotkiOy9t+hL7PVgr9bZJSs2wxZY9fao4qSeRt/8Cdnozlr4Ez7oFwj8nFvpabBAQU
         igGg==
X-Gm-Message-State: AOJu0YxixT+yvMermHGikvPIjCCiOAIl8NezisOOlHQ7YxX9KMN7tDMq
	QPY3UBLn0oU3y/NUW6ce+M6oHwn8T09jFeFP9WIgE2opO3PZSniJ+UcQUg5a7XlR0kZQDhpkX/3
	jyrWaZKsC/W7+JOZLF+W3+pCn0LyvD0NvbyNqIEc0ABOhw2I/hSxDu2plqVoee3bG06L9
X-Gm-Gg: AY/fxX54710pFJgoplNCoEYdh7x/vBkuAQ9MMeVLzRHfDu4tq1RdYysGE/JHLdUVM17
	8vczORSfTa5tWBPl7+q/Ri0WNqIgnWtoZrYpNzWR5GOvXUSd7QRyaeeRIaMf12KdUTJY11lUjUT
	x0RtLSRf5yAhQd81HHxGXchTnlBBZVnrvjq7vkMuXz6fMfBukPUnNbgSlbD5Ts5RGsnW7+RkGxG
	3P0OmyYKW0Kq4J2qpaMgRBHKEBFlg65I0JYAXhJbWnho4aurJkzB/jrbSfEn67EOLw5g06RZhmt
	K29VO5VTn3j9ybm0P7s8VFeA0PH95fyvUXiCbJK84ouPBuKAa9FR5p0Z7z5dT4vNHJXntSsmdhj
	2Kx3MfAs2lUydl8mt5gukpfl09ZWUVx9M38bl5PRInfPjC5klZlicK6I3Aq/YWwq+A88=
X-Received: by 2002:ac8:5745:0:b0:4f1:e97a:db01 with SMTP id d75a77b69052e-4f4abdbc47dmr162929621cf.78.1766399057171;
        Mon, 22 Dec 2025 02:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrsfs8pegLciKMntDLwPh4gHdtWkKuNF7kiUQEp7MKj3Ke2R+dIpQ0ybat95iqy/IK1BOirQ==
X-Received: by 2002:ac8:5745:0:b0:4f1:e97a:db01 with SMTP id d75a77b69052e-4f4abdbc47dmr162929431cf.78.1766399056776;
        Mon, 22 Dec 2025 02:24:16 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:24:16 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v4 00/11] drm/msm: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:49 +0800
Message-Id: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX9wC/XN1pPfSx
 mgBJqCev+sVWXzvzMmr320tKgZ3bZkZi+gUqzD53RskKOSlUtaQnC9Wf374SpvzF3DjsVmXvmuu
 fpjZe75nX27cUtkSKXRWPGR5YnMwB9QC1dtNrqV7iURucGI63WMTskRXE4nZ5UTCWffoqYgJhLG
 Ch4dA8IwVdHo1pJWOMN5NTNdh4btgBS6JlaVANfrF7/rCbcy/JSrhUZYLoq+/ckAGNSzyCJh3tj
 8JJ8o9P99Ug6xw6wNmhdOvS4AnktL9XCA2xZmseBdigdKq8T9OCWXj5IxvfpMk/Mj0KPKU2N7H+
 ydFNUZaB4Hr4n7mvYwURpI3tEw/llY7KfSCtSw9/unDuHrJWVogd2JTzSI+wPlnFgcCOjW6UkMi
 W7Ri5UWhTCox6jE4Uv3iHdHE5T8CjTKxnCBvRNV7SYav69lIBz4KlxkwCDulWMR2ODAh24kcrOM
 OzlNhnKYLbhCYMzQUqQ==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69491c52 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=peVRiwUDOWJauV5v_QkA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: CuMYsOSVvZjAiUP0588zi8G3y3OnLr8d
X-Proofpoint-GUID: CuMYsOSVvZjAiUP0588zi8G3y3OnLr8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094

From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>

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

[PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v4:
- fix qcom,kaanapali-mdss.yaml compile error
- reorganize SSPP patch order
- fix Dmitry ohter comment
- rebase on top of msm-next
- Link to v3: https://lore.kernel.org/all/20251215083854.577-1-yuanjie.yang@oss.qualcomm.com/

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
  drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support
  drm/msm/dpu: Add support for Kaanapali DPU

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 123 +++--
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
 22 files changed, 1474 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c


base-commit: 06aa394d58c11406569bcbd4a69b81290edf3f63
-- 
2.34.1


