Return-Path: <linux-arm-msm+bounces-89173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C4D23904
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67F5D305858B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1779935B15D;
	Thu, 15 Jan 2026 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWtbIack";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uobxdf9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CAC35FF44
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469295; cv=none; b=nsETC6vgBi6LRnWQLxZZ+OVL6Yei+HGHLZpctVcOye5jhwqK6hRKV93PJqGzB0wi8WRQ/wWCrW03behPIRSOWZN4sgvvSOCIVSuIM0noZJPI/clIyfcrUnM9CogxumgjdrrU02ekHcaltjL6Z2md/BM/Zc1d+KOtAXYbmZnilus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469295; c=relaxed/simple;
	bh=XTstPq5Ma7tapNvNp/osbBwQCwuKpAXVIymEHX8p1pE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J05CHacZeIQkPSe4SmgzXlS6ZDJJgD3UqWZhVgzg9I4IH8n0POG+CTOllp6MSFB6WKnRmCst/hpuwBrr3ZVw2BGPFE45sgqwCYfcNyPQDREe7NaN/8eR3HXsHEpxj/aP3XIOQcfIsy+v+7o8jWKzw4DlgQxYQuEQsG9fNPOO0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWtbIack; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uobxdf9/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6gFBh3419955
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FV3nONimYsR0PrhxI5KPJUKAwXWGm5Fx9h2
	vmS9IGy8=; b=cWtbIack/GPOswRmiz/IdCY4Ooq2WW+TUMInLIpoDDcH/s1bxxT
	zha1Ql0Fh3C2ZVHfgivUTuElxgxhUa95MhhNpCZy810ftY8Ko/r4Bg0NFwjyFljw
	AOCBoUqL3rvn03KTAd3Ex2y4T74H8fCre1JqPBKRc/DYLsBGa+647/Nww6RbGbB1
	iMpONPNwjRD3xlxd1BPvoLPpBANKvvItX0A0XPkjFQ+DXgUNRA9WMHNgFIjNEFID
	aEmVdx35X15dBKCQxSNwWO4PDEMEaLec3Sb2KMEBHN0nd6W3+A7I+7NX3ithsl3n
	4vPI8o5KI3h1uCvwml9hozATYke3QHI5w+Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89x5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890586c53e0so17905186d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469290; x=1769074090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FV3nONimYsR0PrhxI5KPJUKAwXWGm5Fx9h2vmS9IGy8=;
        b=Uobxdf9/UMvs4r/3XIQhxNcJUDp/jM6NLpyhmUatVNkJHNYGETDLOvhoBTci3EKqgI
         r8G5h1VG3CHs6hOU+hmA6zO384oavJe5IfJIBqODQcURzFsOjk3oTVAi7A5aRjctprX0
         ++uCiSrfwAAH/Z5NnmzCSc+1A3+4uWZUJ6RX+AG0leO26GEPXZHi1+T0m04s7SShn00k
         AHOL57By3j0wAyKlOoAoU9+G1GBRtG5qeqELn0IV7XYLkkQIjaNWzJHDqkfi34x1mBSa
         cuBIZ2nNqsDepJoxHWKtmn4x66Yw+hZ8WXC0mk3KMRG1jY61qTQ/bmM7gS1sHblDUar+
         k1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469290; x=1769074090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FV3nONimYsR0PrhxI5KPJUKAwXWGm5Fx9h2vmS9IGy8=;
        b=HSe9sDB1kSy/RdEt/NpxDsZv7LkpmGenIiql7T4fcxIxfwnwDTV45EO03pOSPr8Q5x
         P2UcZUubxS6yhbt1dxF9PAkzl9RHgAs/TKO6lgwMFuAsOiY3PkrS7G5UrqLpQ1fxX69m
         iFwLCB1Bcodad/oAMxHAJgzhCov4BOk6U0y6nu1OicUJlMzdW04qgzS4HE3Vq05RngmO
         gwW/RMG/b1UhNTeiHNUs0cFr86v20ALeZKvAGQrY0q4oYZbEesNg4U7ng7oJNXG0J/Kf
         MaB0N5OI8uBjEiZijI0OIhCFgvr4SFxeGjm6xLwUqujhu42f7vrv2cy+2c0WgcDE05Eq
         V/dw==
X-Gm-Message-State: AOJu0YyENemTzFXfjRhcEw1muy4N3vm/uCrpaMzn/Lmtk5YlOJihQz0o
	vsqy2YAUmXesaPvI6cozX0rOVNKUudYXoRS2I3m7tsoWvPR8i/KFvKKsxrrrEQNXwg0fg4K2bzF
	oN1Td4UofiyxMPHCS2s4/kDskTZPHYvgQnHuU5iWWTJzIaUfSKft8T76vn/q89zaTT6jcU4g5at
	iI
X-Gm-Gg: AY/fxX67eHoFvzZituhlAJBmT0i8BJDHdvUV5wYyfaOpKOriEoSy/rpd5m7sdwoS9uj
	gT07hkpcmdEwe1Pfyhq9Nz9gS6oXvvMA8h3NOOV10QFYOf490Zi2c6F5PUauZQeiuw2RON+WYbC
	Bl3kOLUy7naPnXmmnZRn+tmyb50qGSxz/iBPV3VUgdvmmtXlhYwcDq3d91OtfhyY5JPUCLSBf+v
	0lm+EdeVwI1fiHpsfopHAH9XBAWdGzlncE/sga+PLwBRtM5Y9JLx+WWYLPj/HoaQsAm2IKB2uMo
	XZgk+VbLjo53+6N1w8zwrkUpGDs2YX7XwQIzG3s/i/pDSWT+hY+LLWUSuCwrA2N8+q0JGTtS9IJ
	QvvCymC18s65/pUgASHXyfgcJY5jbOpLBnobOzHJSHTUP6rwczaAMPpqviYBiSVHS0xA=
X-Received: by 2002:ad4:5baa:0:b0:87c:2967:fd32 with SMTP id 6a1803df08f44-89274387480mr77132446d6.22.1768469290191;
        Thu, 15 Jan 2026 01:28:10 -0800 (PST)
X-Received: by 2002:ad4:5baa:0:b0:87c:2967:fd32 with SMTP id 6a1803df08f44-89274387480mr77132276d6.22.1768469289733;
        Thu, 15 Jan 2026 01:28:09 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:28:09 -0800 (PST)
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
Subject: [PATCH v6 00/12] drm/msm: Add support for Kaanapali
Date: Thu, 15 Jan 2026 17:27:37 +0800
Message-Id: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: npuSRumrSMGjBHEm229LY7zuww_nsBzB
X-Proofpoint-ORIG-GUID: npuSRumrSMGjBHEm229LY7zuww_nsBzB
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968b32b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oHaaim5x4gMG4YHD5WcA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX55jR036/aS0S
 9lM6HvoaIT6LnOLVRoEYIShGW+wcmoEozI2zWjJvdVE4lT/WeHNa5Vb9kINrU+WsJCd+aV9dSnX
 H2AV0OUk3bHibNlUUvIZzjVoWRq9dpcULXFq0HFvXldvNAja/XFarvU7EicDT9cUh9eobZOr1Xz
 yxvgYZvcuNj/GqJXTJYVqV5v3NxJWN4LeSIRulwCU2Gm0oYdNkKteicLHDRdIOfvAxtgQXCNTkF
 3p9ItiJK+MMhWoVveYVCxWB09BqWvua+u6glK6mbK8PzblWksV7rEcLwzn6H+iGdf/ybe1f+KOP
 3Jnu0sO/x/2VNYLk9NyiDM1oTSJxbdWAJq740RIeJKzmTgb1Ww77sGT+TtItfRugLLVgTFO+NZr
 ZENuFj/cB8PUSq4J5q9++Xn7R5QPCpYGEF+nEVkuSNGKsdJd/EkfCTGvGlyIvM0Kx2astX0IMBk
 BO2Pf1cmzn/eWbOybJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065

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

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v6:
- rebase on linux-next tag: next-20260115
- rebase and fix merge conflict "dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY"
- rename _dpu_hw_setup_qos_lut_v13 to dpu_hw_setup_qos_lut_v13 and put it to dpu_hw_util.c
- fix wrong indentation in dpu_hw_sspp_init_v13
- Link to v5: https://lore.kernel.org/all/20260108085659.790-1-yuanjie.yang@oss.qualcomm.com/

Changes in v5:
- move sspp v13 related change from refactor patch to sspp v13 patch
- move sspp ubwc change to dpu_hw_sspp_setup_format
- split wb change into a patch
- Link to v4: https://lore.kernel.org/all/20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com/

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
Yuanjie Yang (12):
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
  drm/msm/dpu: Add Kaanapali WB support
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 124 +++--
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
 22 files changed, 1475 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

-- 
2.34.1


