Return-Path: <linux-arm-msm+bounces-84369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00263CA3CD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3480307CDC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C81344024;
	Thu,  4 Dec 2025 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jktIV0ql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlTIQFC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE5734164C
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854542; cv=none; b=Q0aquwgK5bPwoNE1JnN/6OEusVv/qrqQrhbWOoyvMl8hIwrCxdyV/j2LGJao5xhGttrH6OlnmxsvW7LzFDwG+m5Ek+BlZ2bPljSk+1PsrLft8s4JMHd0KkPuvco6XpdnvnodsO3PY5Rs/tS9bHtRaO2sCv3D9eYjHcoLro99vyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854542; c=relaxed/simple;
	bh=uOlMr4qsBLKCoyb4NO+v6kph6XJZa/vsIoUACNtE+ZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXsrkY6DPhhK6NbGpRbY56i6XmH7jKlJryIuQFK0Kh8etHou5xZRCdRyAaGLQVVVrqLdxxA0+cZkpUkIXUwoNHdT87jdnXQb4wj1ZkSxYAKh6y+nZMFQfqWuQ1WOqv2kLNWe7N8BYqxTpDj560tKkj+AStHvVr+OZjXpx8f274c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jktIV0ql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlTIQFC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4CwY9T1436062
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LS/IUkAfEAArbuQs7HfBsR
	lg6GO13UrdrNS/RdL/NJM=; b=jktIV0qlIFRDH1MWVpwbVRTvremKbbUkOKbRpL
	UbRqTu82DG4VuLUjPClMG+axccpSuYZ77MTlSVTrkJPu1U1YCFVFe87zwn3DgYPu
	mtR3vLvL1K659xRC5LXlYUipvFY7+Qr3Ip7E3ItXX5TE5vKDpD/l8AhiBW3JmYan
	Og+whoCI5GwSK9BnPvBLBig3a1SaYTFcpyNqKLsRXrKMbht0HMVOdnwvTkckxYpG
	Gz6PX0WzOUyxoF44UH5mAFHUQlyNyjo9bYNRNfXnmEIEYIYoRdUoCb1cIZPyzuYa
	HYI9cjCW8J0e31mHQQb26ra0eKUCnxKu88aZebgKlwnlPpBw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auascr20y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:22:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so1560723a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764854538; x=1765459338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LS/IUkAfEAArbuQs7HfBsRlg6GO13UrdrNS/RdL/NJM=;
        b=OlTIQFC69ItmurRzZeYF/8AMEail3FNNNTMol+2/TBCspvJLTtw07A3ejmA8zni21d
         E4KNURtAcvRkUfVVcRiX4VQqQkgu/caeqCw5fH6KgD/LH/pqqGyYNXhEIfM29X5Viwwd
         Ae12zO1qIDnTnYOe2bQQX2/zyb3r1MLUEAs6f5C0q990mm5x4Rhe2W79AmlOKqFQmWTF
         tlGHzklygCuWK43ZpytcjxiJqj2m9kCO5Saesaf+fv32H3cEFS3l+Ma/vBvftG7OG3jm
         5TfjBlYSmEEMCTYwN645I++U50IGtviaZ8AaXruP5Kh9h1imDpkbkoAeFEs/xuurQrh/
         ex5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854538; x=1765459338;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS/IUkAfEAArbuQs7HfBsRlg6GO13UrdrNS/RdL/NJM=;
        b=jVah//iP3QShIt8r+5JUAhnXPtuRD2d7sFzRX1/r8LP2qscOugqUTjTs2YBC4+NsEz
         FbSgWrerPszHH++PsiqnvkRguv/BRkARsJ+aIpGfW/oU51W6BtLZv5Bw3XBJYhmR2A5P
         cAIDOu+BN9fkOrZZ11U++cZpEOXXHFAsEmo7dEbAHxWDNZUFOGIduIyxXnySMLait8oT
         0G0+SvWCD8m1+7rkNRxSgqWAZqaTzyZCGeLFLbU8DLPoCC8KfgIBPdGfX13PiYGFY3P1
         ypVIcoCLBPR677lDEUxhc8+uXTfkujg3at5gUgdb61XEL4ljzDKyOM+/9+9AlQbJaxIu
         Nj+g==
X-Forwarded-Encrypted: i=1; AJvYcCVVdvjNsZtpbu68PRW91VHc1nmp4JleeARo9Z5uNqinvfIBehJfMrMz3icxz2fiiMc49r+1bVDksX76Ti5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzZqYmu3O2R79CwimuxkMzwlqK5qGksxzIdcqhD71yKSDT3cBgg
	WI8yfKR28e9ImTfzMpxyHUkKK64KFKWn/z8Clg8xysKkzn9C0H/3hT3DNSVOep1qpSyR8bj/FR2
	eIqjMgz0qfYwEFjvwFS+EtRzbQLNIC+QS7qtFAvkE1+iIEXFDTPIjpvS8i757ZYT1sd1m
X-Gm-Gg: ASbGnct0VePT3V6lC1zs5cNZknbPA+ySAXKbcbmDF/R1D60MvAzWTacpE/XbRTCibl+
	E3Pg3nHFL0HuBGSOxqBSCoSDWZofTM/sGHDg4eojzArE77KO/hpQdtG8MK33yFbcR47GbwyDlgR
	TzB9gpCIhZqppJ0rhEflFYcjh4dMC6xLIcgaCooyF0MUAIVUb4f3kf8tQ9kqgHv+dHpg5zFHJf8
	18b2ixBc/LmYSStpzPCnAvTBmqwbtETK4I/BjJ8+hVE8b8LYpHyHbIfYbUQRQOwqg5b1Gxsl5uz
	s9EAmXEEmqBN8hGzIRe2TMsQxEYxwYSaEMP03OJEo2Tys6cqnrMwlatqIKI524gdIEr4GtKKcBb
	6RaA/i/mWMeBQTAxKvKFMWUecBDFrJMeb2A==
X-Received: by 2002:a17:90b:4d92:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-349125be8ecmr7920407a91.7.1764854538353;
        Thu, 04 Dec 2025 05:22:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW1rjgANzwkBwo6WdaWtJrjXlAYMk6lSCrHRo9Z0EfqefF0ytJitWZ54wk59aBQ7IpfswFjA==
X-Received: by 2002:a17:90b:4d92:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-349125be8ecmr7920342a91.7.1764854537771;
        Thu, 04 Dec 2025 05:22:17 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:22:17 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v4 0/8] Support for Adreno 612 GPU - Respin
Date: Thu, 04 Dec 2025 18:51:52 +0530
Message-Id: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPCKMWkC/3XOy27CMBAF0F+JvK7R2Nh5sOp/VCz8GIOlkhBPi
 EAo/44xSK2g3Yx1Ld0zc2WEKSKxTXVlCedIcehzUB8Vc3vT75BHnzOTILUAofnoqM4PHWPPJUe
 vtAWPtutaljvHhCGei/e1feSE4ymz0+OTWUPI3XA4xGlT9XieeKElKHYv7CNNQ7qUe2ZRGs/Vz
 cvqWXDgYI1RKrTQgf4ciFbjyXzf9VUeBZzlDyLgDZEZMdI3TgUbaqz/Qda/EClfkXVGuqC8cm0
 TtPB/IMuy3ABcJFCVbAEAAA==
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=4216;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uOlMr4qsBLKCoyb4NO+v6kph6XJZa/vsIoUACNtE+ZI=;
 b=YI+hPZcQUl69FvrgLdsNeM8FfPYO0EXDqe89Kr4cv4yvEbR+t3dlQCJGWaKVbfPFYypyJiPVh
 KmzCc1GJUYeCKGQoyBiZ7kM82bOlamN8C3rEapdTy9P7gf8HTDNqy2K
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: _aCYcUwQFaNlL3jaux1m37sypPPiEoXj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX2ZseahZrtzqw
 3aS3AkLaIeq1ZucynZJ2E6J9lZzIPFh5Gzjf6Zf422zLwukHAvGU9C8fClQ4PjwaprjnrXKwWXu
 J380OVLLElPPJMTECQqApRhg0RKybHcUObanaVNr7uWgyeKFGr8OCby8Mvn13391aACj0qcjyY5
 lIOT8/azg3X4Fc/+gyPiqAyzKUJiO3KLk6FUDkUNwcsc5YX2lUu6zglSD1lUcLb1SO50klTXYQU
 qmLhkSjOUakbjTXsuCPi4oAJmELRXWxC4CPzLwIrBYpnlYCmt9eTLwsFH2CaevnwQKGq75Eherl
 Z26ZPWIlvzpC1yOq+qxY4JnJMrd0pDIjv0MQiWOzLjkXWGcUf/H7MB1pbLe14ECJCuuIQzbgxJE
 hkuyz7Mog4Fo8ny9DBDznbqWME8h4A==
X-Proofpoint-ORIG-GUID: _aCYcUwQFaNlL3jaux1m37sypPPiEoXj
X-Authority-Analysis: v=2.4 cv=b9q/I9Gx c=1 sm=1 tr=0 ts=69318b0b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nlYtN0jpdUqXxw8MpYQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Due to significant changes compared to the old series, all R-b tags have
been dropped. Please review with fresh eyes.

Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v4:
- Rebased on top of next-20251204 tag
- Added a new patch to simplify gpu dt schema (Krzysztof)
- Added a new patch for GPU cooling support (Gaurav)
- Updated the gpu/gmu register range in DT to be more accurate
- Remove 290Mhz corner for GPU as that is not present in downstream
- Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com

Changes in v3:
- Rebased on top of next-20251121 tag
- Drop a612 driver support patch as it got picked up
- Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
- Remove reg-names property for rgmu node (Krzysztof)
- Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
- Describe cx_mem and cx_dgc register ranges (Krzysztof)
- A new patch to retrieve gmu core reg resource by id
- Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251105
- Fix hwcg configuration (Dan)
- Reuse a few gmu-wrapper routines (Konrad)
- Split out rgmu dt schema (Krzysztof/Dmitry)
- Fixes for GPU dt binding doc (Krzysztof)
- Removed VDD_CX from rgmu dt node. Will post a separate series to
address the gpucc changes (Konrad)
- Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
- Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com

---
Akhil P Oommen (3):
      drm/msm/a6xx: Retrieve gmu core range by index
      dt-bindings: display/msm: gpu: Simplify conditional schema logic
      dt-bindings: display/msm: gpu: Document A612 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (3):
      dt-bindings: display/msm/rgmu: Document A612 RGMU
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |  86 +++++++++---
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 149 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
 6 files changed, 354 insertions(+), 30 deletions(-)
---
base-commit: 2bd3691a4219f5610afefaef1016c2ff95ca2ec9
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


