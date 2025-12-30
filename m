Return-Path: <linux-arm-msm+bounces-86961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76DCE9AC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89640301514F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A86286430;
	Tue, 30 Dec 2025 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J43SkAqB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aw3jt28H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9485724E4A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098047; cv=none; b=YP8tNCayY1HMKCBGaV6iDzBpqjHgjgHjLlrnqxEZydZmZ5wPTRF1Rn2ROKg38y/zIkm7uChYVgBWckd9+QYirAGT4rz4/wzniO21Zj5gt4vCU+ag56moZXMVUewTJniOj+YvArJLwxDKgQddHwawhGCUKvKx+X9F5NWna+Yo/r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098047; c=relaxed/simple;
	bh=FdqG9zrZ6rbteItBZ4Klh3Dym5joJY1hFv9zmxGAJeo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EiZ4I4j9ZJGHxhg6NdBDLOkOQDjt5ScOMbJlCA0HyJYrCRlkgtwDONHiJXYZ+WZP/OmzpoBAYeqz6mETpSLzOq5u392ZfQO79P3Vt3PRiOgYUXPauhxFR7eniGEJAHmkj6OvIFatAqVrU+nnkUzOLM5K54tpKK3Oa0zLIuhbPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J43SkAqB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aw3jt28H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB8nvW3971212
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e1EJpHuhHtgin191Z1rYYK
	gqk35MDf2jz1zjH1Q2Oqo=; b=J43SkAqBxQeiaPEKOBpDHwee5U953tHh555fky
	/aevh/9Iq3GzUKnwtMGj7QFlmsQj8MwTZ3Gq+vDplE2fjXhLuYHv1+nPUWQamcqP
	jN2jUVcWjbSBh7RJ1xHdLZqPsZouXbxAPjlJJMYAZTc5pRCKnvrV22h5LDDHIotI
	dv8AhZaRwiPcT5e2swN3YQI5mqr/qMNfP2gvlKiCQYtuqw/86Q3h0I9UA2MX3TbU
	d1cuplNJjw7r5k2vrF+Ncn1ioP0Pfrvmv7dBc+/oAdi2PNsA7EXfo7iRBkB1i59L
	fSijAU0I3Sh58Xwy9swp7hLlxP/Yp/TdguUFlvzqKIpYKugw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky05qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso329458935ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767098044; x=1767702844; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1EJpHuhHtgin191Z1rYYKgqk35MDf2jz1zjH1Q2Oqo=;
        b=aw3jt28HJ+tR0OWsvx/XdMyE0k/ksSwFnQTBeK4BcF135xLxxu+WWAi5u76t0xa5d4
         rTRd5ldSpwi1hofG3CvWxdxP18yNAMjZAy/u+BIVJQucCB05RxEBbMeCeeRlbfLtIeD3
         0EVM9B6AxnLWDtRHSyImYE7BciJzs9tLF1l9djDSX0eNLY2gD09DlXyJ2P/Yblu0eo4L
         asJOASqMU/Ko9+tASt9apRJLHrPOlm+9OXrauWOHUqGu7sDfscT0hZYDAufFKNv5zEIs
         ++GzzMkNnRRe66KgAJoPfTqfKE/ywJ9W+0QYD1vtHHOuXf5yhJs7pf8Y22pmGblTqQCt
         Y7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767098044; x=1767702844;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1EJpHuhHtgin191Z1rYYKgqk35MDf2jz1zjH1Q2Oqo=;
        b=JpTsiiZr/H2z6Lo0I+xPf4FrVjKoMsf/19Yjmk4AvfGBBlxuvFDc2xUoyvIi6X4zjH
         sQEpXmkVLhNVBDGBh6KeRYZGDgoJt7BMR8AnBz8+naANS5KRmz0m4kPYCmH5S6VQMQhS
         m8cGrL15xRSmCqNqNmPTfKFLrWrG2bDPVT2GicDW8HV2usRqGThaH9Hxdnb9BM3EOdvc
         30/1RKsqyOW1A7a61KwLE7r9+w/9WlX+noHAAU6c+GW/g6A7gKPoWox+zn0+ilEnCpa2
         NCen1mIYagnEkWPHeHmF2FJaEhS/lawemK7zzeV6iJ0lWqOGdQhWFH84lHOKwsbaScLz
         3lgw==
X-Forwarded-Encrypted: i=1; AJvYcCW94ETa4pU6Q7c81K07fJx3GSqKg6fIorAu5MTyu3javNYGVvpdAqpSSWEMKm7Ln++enh8smjHpJpX2Ifig@vger.kernel.org
X-Gm-Message-State: AOJu0YzVtngoyFGJ6JCVXAOuYe+lAEEo4hLcQ+VLI3H0Hlq5trQXMtaE
	1159+MsHNBC0hXctgXbvPWoSFO7aeQk60FgSNpDRVJH8QiPzLeAiQzw2t68CyuX86khgY2aUNFV
	acJqTdZkYO1EkDSGhncuI+6RDJGCYro1OOWOOJwAmwkwOFSg9a8x1rwD/PGnhqiBkwnex
X-Gm-Gg: AY/fxX4eRp+Gw++lz3tb7tYZ3v5Z1QKWNF1SaloM8dGWtVSeIk0S6Q1bVYJI3OUwPGr
	npSoBQ+7deouxOiF2/Ukasn83D5rLe8rL80akg/Tmm+Cmee5YhuZ1EggcEDX3M8SrGkKmSYPmti
	/x2oKtVJchG3keDSsxFDP5spLqgy9op7TDgI/Fz14fh0lbgzNX3zXbFqIX7QnJfRt0CNyY2tS0i
	4yidrbJLc+i2dkSVENbkpZToXEsVuFoY1xmg8bGZp2xRVjw/Sgih3IdJQmXc9qOn26Vklqlmg6K
	oClI9/QWjT48J8d1qCJ1FU9ac0F8rzKMVm/FbZ1aH0yLy7/RSKfduOpL1bndizNDJ3CHbSt7XnG
	QFV4o/PP+xMh1g1Zv4IgINwny197mWjivSg==
X-Received: by 2002:a17:903:19c8:b0:29e:e925:1abb with SMTP id d9443c01a7336-2a2f2428bffmr302949855ad.27.1767098043872;
        Tue, 30 Dec 2025 04:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENyF+WPIkSCef75cAbbFwXBGFHVz0cB9iQySZ5v8vKBfyeFO1nsdl5NeVeEPctYc/krqYECw==
X-Received: by 2002:a17:903:19c8:b0:29e:e925:1abb with SMTP id d9443c01a7336-2a2f2428bffmr302949455ad.27.1767098043327;
        Tue, 30 Dec 2025 04:34:03 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:34:02 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v9 0/4] DRM/MSM: Support for Adreno 663 GPU
Date: Tue, 30 Dec 2025 18:03:24 +0530
Message-Id: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTGU2kC/2WOQQ6DIBBFr2JYdwygIHXVezQuRotKUkVBTBvj3
 Yu67GaSP5n/3mzEa2e0J2WyEadX440dY7jfEtL0OHYazCtmwinP6Z0VgFJm0E0BfJgm6xaoWV6
 IRnElqSSxNjndms+JfFYx98Yv1n1Pw6qO7QETjFHxD1sVUJAcC0QUgunsYb1P54Dvxg5DGgep9
 kvi9Bziu8tlIjV6DceRWcoE3SBzaK0DmXIaK/sPgvJdxOkAAAA=
X-Change-ID: 20240917-a663-gpu-support-b1475c828606
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=3289;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FdqG9zrZ6rbteItBZ4Klh3Dym5joJY1hFv9zmxGAJeo=;
 b=ijannswjECqxNrfPcXOhcEvxUr3Qf/PjtIcNRbeD7PQbwVOFwoEbGGc730H3mXsXqOqrtLt3q
 mTxS/TWG605AUYn7iYLDZ4XxexXiYan9oIJXRiD2DyJmWTfvZtinyM5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX08DZqjJpP0rE
 uSkX7s6I3OpQVwUk7bCMevinJK5u8jhAq2glujUr4cqRqzoOGCrwdp8bMroYFUf96Y44msZWu/1
 O0J4q6h7OWsl1Yn0ZEEZz56qluT10kZaejUqMDbR7U4rH3jfUX/p0z/LbKYvyYO4vLMOThheau3
 OUA3/ltlPAALdxL/IUHVVjL21ZQ3HtZFjd/ao7kN8vHGfhVDDQ0+X14PboUE5WimnNn1S+KnC7A
 4o1ILvRUzmxDzilL4azkFOeDahiUz6eNIw+n50DAAEccvR6OSju9uy9YVgDmdZpaGW/YHWyV5i3
 SlIVxiqKjc78k/Kw47IcJeG2wq3JuTZ9eLvyhQCpMiRIWLOa2TKTOw0+R24zF/7eI5N16ULWlHW
 Jbv+LpEULOgBN4FHo2bk6NaSAPNYCfOU6/OoHCou3L2HgO00/sKP2eS/NNvNg3I2iFXX57Qji3H
 ddO8pJMkFCOn3wwc59g==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6953c6bc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=XWgRTdVboDXnaEeUzZ0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DwD4ZMZOnj3_UKwDmJO0lojaFuJ1D3DH
X-Proofpoint-ORIG-GUID: DwD4ZMZOnj3_UKwDmJO0lojaFuJ1D3DH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300113

This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
chipsets. The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
        1. gmu/zap firmwares
        2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2.

Bjorn, only DT patches are pending in this series. And all of them are ready
to pick up right away.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v9:
- Rebased on top of Bjorn's arm64-for-6.20 tree (Dec/30 tip)
- Link to v8: https://lore.kernel.org/r/20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com

Changes in v8:
- Corrected patch#1 subject (Dmitry)
- Dropped the patch for qfrom binding doc as it is already picked up.
- Link to v7: https://lore.kernel.org/r/20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com

Changes in v7:
- Rebased on next-20251105
- Dropped drm-msm speedbin patch which is already picked up
- Picked up trailers
- Link to v6: https://lore.kernel.org/r/20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com

Changes in v6:
- Keep the efuse's reg range 4K aligned (Konrad)
- Update GMU's opp table to bump frequency to 500Mhz (Konrad)
- Link to v5: https://lore.kernel.org/r/20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com

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
Akhil P Oommen (2):
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: lemans: Add GPU cooling

Puranam V G Tejaswi (1):
      arm64: dts: qcom: lemans: Add gpu and gmu nodes

 arch/arm64/boot/dts/qcom/lemans-evk.dts          |   8 ++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi |   8 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 174 ++++++++++++++++++++++-
 3 files changed, 184 insertions(+), 6 deletions(-)
---
base-commit: 0e31dcfefd21ed76ff1b2d05647cd34336ab9772
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


