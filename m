Return-Path: <linux-arm-msm+bounces-72647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C29B49A24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A25AC3A9A26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D7C2BE63F;
	Mon,  8 Sep 2025 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgJAKVmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84E26CE07
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757360410; cv=none; b=N6jj1+MCa/aqEelJYw3Et838TFboYzYuoAQ6olWinIG0V9IdQOqsrIx8An0iDw5OIzcH5uhQNLRxZvcAHrUnfBERRgIYR4rEAoOgmoq5dTLuXPNQlzxbVeDtjtYESqLmGdnOQx3eqwKsuGV3mTqRxSMSJ5ctWVLX1DlG3M3JaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757360410; c=relaxed/simple;
	bh=4UqvYbOo0ozDV/YFCMOiziYwPn3/KsWgI2LYvHpmupw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s3v00Ok0+gySeVUXoyx5/1QjQYDeeIh/p655p9lwXQiItd8BUXGF175mQdC4G0qdQInwjH4IIRbb7P1cBfcq/9hIww1QxVys2G1KJcnl5SXfy9g8mq66GM/9KAufOoRBwmuu952ayBeJQFESBIIEApFFa0ATKRSjApCfL2C53mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgJAKVmF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588J5khf015294
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TXIW4CE8LYawHSDmEPYejS
	9mxlDCMmxE1HIHyddZJyA=; b=ZgJAKVmFyhb22rOwYthN4+S7xeNSiDeVJ9sYDc
	0Yrvqls01S+Ry3cm43SdQ8JkLdeMBQwZovkYZ0okReV6BSQ/NnOZEQvem+PbBJOk
	KzSEJMiC9ocF5GF5qBa7vbVC4zCffyqu8ras+w6Lo9ClBNvVW5pIpHDSjfIEQd6X
	zCTbLiNBNQvXS76P9rU0aN8vHBItltk0mvseZ0100PoXUwNf1Vk42sA/77KxHysu
	GNGT/3jIM999/fpRCAPnV+I51ugXnIjc7aCDQOnD3Nc+2AM3gkHfOektmy5/d4u/
	67MsvvaOnWn7sHV29Z+Ri6U9jpkdPtzgfcah1JOuMr4iuHFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdtknr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:40:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24ca417fb41so56537585ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360407; x=1757965207;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXIW4CE8LYawHSDmEPYejS9mxlDCMmxE1HIHyddZJyA=;
        b=WcIknfuqQt+dxHCNm/aOR5BS3OYGmYX5ScZ0krDS10CVhNO3Y0tXwAf2VmXM/AfBAG
         f1r0yEO7RX5dVYQcyhkfPi6h+q4Uf0LRv1yVlPFpfCYQwVbiB8VuEqTR5I4Z9sKW09YG
         HxHb5ojdvOm7cP6o7TFsHGT3M3Lj3O+Sv0loUZ0xDyx1r0T0cw7mJJsUpwd/MpO/i/oK
         0BRPGhR2VbgNcclkGyaigX+FQcXrCDjPvixmbCRE9IQAdbABPzmfbQ3dtRJQmqozE6Q1
         ZTQ+bhFpoTQ/IYChpxWCR88uwPpHXx/5fCvHulzsUx1IXVQf2vVhUm9BVyAmwepy+bwr
         x5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWMEjRFAShsS+LNdHOySXFKEMQR1TQDMOcD7QNMK7G0rfJAmNctsHoyoMKz7imEAkIVJtXz8os8Pu28NlB7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94ILsb6Ky7r13gNb61u19mNmw/gOR3RA13mf06SUfqDUh7Ijg
	X2W31KEGHVyj1yDOBjQ3Nai0XDe6K1RPcSR5wQyBv/bViHD3en1r3oB05LwcV7whS8L6XsqB56j
	WoNG8L5A3x5RnppPhV5L6tzF3pXH0u/3uV2Rh+vABAEuCyuEpak09x7kBqNPGmkpQKTAV
X-Gm-Gg: ASbGncv1vjz8sZzcphRRxn2l9mmIcH/gVaXkF1LNCp1UiE7IpKDJ9CxeRhgZaLyCwK5
	KdW+1CsvY0O2G4wo7oSLPcpqX/JhRBBH/q5tQghUPsrvYLC7jTKrV6iiVSwouJ8HT/yjcKLzU3o
	fn04bDJGPtVeY6Btk9nzNjahk995R1PrBweFxPbIZnMZL+yemfzy/fEawVDUr1tjULUlbV0wE3E
	L2lSGXCo0xt3cmkcb/Pg68knoS3F531T/BjZc8HNKx0miHNZn4s1xNmPGJkYd46nKL4EWsQwSmT
	0dTDTOmYrWdzdPRvDCV3IPM1ts2moqE/UzrcGPy+l9kDsWknfwfv/7qUecqCToRR
X-Received: by 2002:a17:903:3d10:b0:258:2476:77c4 with SMTP id d9443c01a7336-2582476792emr35062485ad.49.1757360406957;
        Mon, 08 Sep 2025 12:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3I62Y0ox2cbIu1BL+fkNIJFm5SwRP6C1uf8ev/c1vxlfovckwXEI7NkLSZwAzUfOtHCNDfQ==
X-Received: by 2002:a17:903:3d10:b0:258:2476:77c4 with SMTP id d9443c01a7336-2582476792emr35062145ad.49.1757360406497;
        Mon, 08 Sep 2025 12:40:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:40:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/6] DRM/MSM: Support for Adreno 663 GPU
Date: Tue, 09 Sep 2025 01:09:35 +0530
Message-Id: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgwv2gC/23R22rEIBAG4FcJXtfgjMYcWMq+R+mFUbMrNIfVJ
 D0s++41CVsKyeWI8/3yeyfBemcDqZI78XZ2wfVdHLKXhOir6i6WOhNnggwFKyGnSkpOL8NEwzQ
 MvR9pDSLPdIGFZJLEtcHbxn2t5Nt7nK8ujL3/XhNmWE6fWLHHZqCMYtZYxRtupDDn2+S063Sq+
 5Ys3Ix/BDDEAwIjwQujeIFcyDLfE/wfwdkBwSNRmwZMqa1kCHtCPImMFYevEJEoc4OyrhGEsOc
 +hPQ2qY9ItJvz2NryNurBjVtlpFbB0uWSG6tklmns3GtYmm1tCGr9kSo5bdGMAzAAngoGJeYU6
 KcKrk079eP8LvI1Zj5+AXLB0wzzAQAA
X-Change-ID: 20240917-a663-gpu-support-b1475c828606
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=4370;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4UqvYbOo0ozDV/YFCMOiziYwPn3/KsWgI2LYvHpmupw=;
 b=6UupagRBc3X3EiNbsn33g8Z8cblahJQTDZ+nEM0bW6eyy5xmBiDLP9BRh9J7h26NjLOHYEZ7c
 tH021bkr5QtCtOtMfzQfny+WGvfqenhlESUO8KrufSntO9Pgcw5bhx7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: qVCXlx-ac_FrWtdcR_x4iu_RHgtM_4Ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX4JC2JGXl1ars
 MAQr6gKWVbTzyC1rQ16HT4+VBnm9+gXbv9vo9l7QR9tdSr8ldamO9gmo1IyxY57KXkvDZS3WODL
 2tYJ+DJCss1SeV/TCBlqe/lE0XKqFJkdurECPtFEjViIRpjkPHwt0ywRfO2pmkvadIxbrkMyrRy
 uT8v2Lw7nUcMF+xJvLIT65w33WV1ScIJrUoXadI1kG6c9pwc4lsEV1Z9ipmALeQ+SgHa3hb166Q
 ihNWA1ljGlhAuXXlNxct7jE4X468l5xs2ZEqdbmlbG+NE0DHvAOLMpm69vIkyVGVMrr0PxN9p2/
 +bx/6gN+CkQzk9Z0JX9SEurK4njJ94IY5Uj9WzJE4mgZIR26sHKZ9lxD6rhrI0G9BOvZpFKJPZ+
 cS2T5JFe
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf3118 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=jTv6lf4Jh5MpNzVl0_IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: qVCXlx-ac_FrWtdcR_x4iu_RHgtM_4Ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
chipsets. The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2. This series is rebased on top of
v6.17-rc1.

Due to the renaming of the Leman's devicetree files [1], this v4
revision had to wait for quite sometime.

Patch#1 is for Rob Clark, Patch#2 for Srinivas and the rest are for Bjorn to pick up.

[1] https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-Akhil

---
Changes in v5:
- Remove unnecessary labels in the gpu cooling patch (Konrad)
- Update the RPMH corner for 530 Mhz
- Wire up the gpu speedbin node to the gpu
- Link to v4: https://lore.kernel.org/r/20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com

Changes in v4:
- Rebased on top of another series which renames DT files
- Enabled GPU on IoT boards as per the latest definition
- Picked up SKU detection support
- Added GPU passive cooling support
- Link to v3: https://lore.kernel.org/r/20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com

Changes in v3:
- Rebased on the latest msm-next tip
- Added R-b tags from Dmitry
- Dropped patch #1 and #2 from v2 revision since they are already
picked up in msm-next
- Link to v2: https://lore.kernel.org/r/20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com

Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Akhil P Oommen (4):
      drm/msm/adreno: Add speedbins for A663 GPU
      dt-bindings: nvmem: qfprom: Add sa8775p compatible
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: lemans: Add GPU cooling

Puranam V G Tejaswi (1):
      arm64: dts: qcom: sa8775p: Add gpu and gmu nodes

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |   1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |   8 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   8 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 174 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   5 +
 5 files changed, 190 insertions(+), 6 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20240917-a663-gpu-support-b1475c828606
prerequisite-message-id: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
prerequisite-patch-id: 765475c5f1418d986e661a213cfb33ee6ffb9548
prerequisite-patch-id: 03c6d1a5b0ae9095845828fc5cbb701b00f41131
prerequisite-patch-id: f7b8a288cf4ef309b4027f0b617b7435c17d6b1f
prerequisite-patch-id: aacfb31f99b75b2f5bf2f44bbd9abf8db0f66b1d
prerequisite-patch-id: dc442a0932abeb5139daa547a1b1f4282fa9a6fa
prerequisite-patch-id: e8a728d629b4bdd22bc1ef21f3d593e17a8d3b44
prerequisite-patch-id: 067fe8f5151b3fea9cbc37192e559a123abcdb71
prerequisite-patch-id: 62150f33bd304fc34b8fbb4aab953c6c4bb8a566

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


