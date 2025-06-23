Return-Path: <linux-arm-msm+bounces-62085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F5AE4692
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B254480A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7256217A319;
	Mon, 23 Jun 2025 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0zf6cHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363E145355
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688053; cv=none; b=EesGCIY67GQ8Qd4mmd/OJe2gr7RPvOEXqn0EbTflkCeOPdNHfD0PnID8xlNHFgHsa9YOCHYh9mS8rSUbVhHoPnldwAa7tf4kcewk/LXlcxVnUinvSYuCiXUnl8g98C9LoF+1jtBZfqTOEmHdiKb68Fs6mTzjwh7waCTRlV9zIog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688053; c=relaxed/simple;
	bh=Rp6x6KxtK4aGFpq43ixsYLX8y1+s/PNcztPAPycm16U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hHTXl3cKBmgPesgkdSOsqXOkWq/qRv9PSk/TFytZBORYnCQdF1+HJsMfyY8CG1fVBAewBVNVHQF10AKBY0v1iNK2qVFoAsxkZS2rA4wMifPb7C6F4S9Sr9MlFLYNXxRWZTpOluqf1cIlApcoefJnkbxCMTYqEbm8rNyG6pIx3PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0zf6cHg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9dGmv011023
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bJuDNW+sOIaFWmexDpUOQY
	PnvJ+qO7KFFcDuPlTFSvg=; b=n0zf6cHgUqWyvZSX6hwY35G+LbOQnAVdV0ufkN
	/BTw8wrgP3ATupnsVy4EScZWUiPpMYNOQtw1QUh6DMWlX/pV6nCl0yJXFFL71xMa
	2WdP9z9FXY+g95e09Tuo9ecq7w0fPZFWnEIvWZ0qSDYj8C/7p7aNCDopm07nDVDC
	LKw4OC6mxmonhzJ3GLvJfEgL1GePXOI07E0EWxDic6zzmvjhEYgTyXbP43rJuhgR
	FU1PLczN/zCMVmuWpOa+Q0HsOjlJKQIhNZdSs7RvTKITfnmUCL0qv8XxVDXb0Yvf
	BIjbaKdyrJt6dRDGdaiFbNGqZ4HvZkiIorTBNQyyWxQLu0Zg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud0a33w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so5990422a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688050; x=1751292850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJuDNW+sOIaFWmexDpUOQYPnvJ+qO7KFFcDuPlTFSvg=;
        b=D4i7cqiqh9sRyv1oWCucpQI8M/fQsi7kCmJiEG2ZZEbk6UBkcLC2nnlXPJEJaiqPAe
         6vqMFGQOsX7ByssWyEnzwQjEGh4jkmd840JASa/tUKkOXpI6yV+PM7JzYnenr007nNWq
         MFGssh3y/qlD8XY3RdRZo3u6+4Q78eIBB9fbw4ezeqH874+L3B4bBu933l81xsxt+SqM
         z7P1/gKUJTRkgeTMZL5GoreUdG543jY5D0ckdP/9F3udqwjEMAOL3IUN91I67BsEqAnq
         eI1/VT8qLKAHZGbBYdZcVh2TmYH6qBozZsgpUabvsg2PpuV4zpJ+0Sn3IilunDFT2Bc8
         Dl/g==
X-Forwarded-Encrypted: i=1; AJvYcCUYcEWD5R09c8Y0iCYk0mU7jTYgluIPmknU6wcv5sydDV0KXmxWMxIAhOktWCNboWnCmj57YEozONF2ksWG@vger.kernel.org
X-Gm-Message-State: AOJu0YzYT97FSwCMaQdlN1LCK253KQfgwmNNnNUwKCTRkr9oGjUP2EEB
	TIvCLmrtGXCcmGDjYKRi6R5jYS5N87ZUziHNGCp0oJbKRtSr0VifZf99cerM/wgfdYxK8lER1dV
	uSREVoWFxUJzI/lP7GSPb+tF4EwO91g6VHmyxaa/0k60RXyCxTyFdFg9V3k4FNNLLtV0J
X-Gm-Gg: ASbGncsZgS3mPxCZEJW7K/ouFsgxIz1OBIqsc/IdBGt9ql0kjI/lKJcxY2gJW9EDu7C
	b4PbQeXP1EbGrcxZIO+1mMCJfyASsMecydCAn6mbmxWHMH0QMfYFcNYxNAH6bGIDhVvH2jw1lj8
	IdvZA6oHDmgpWHeuE3C/OhGxBUCflkDg3AcTAFtpKW1nNWn/Z8Evbp9FgKHnKgbqe1YGQPlR9fl
	90ivlipDzSpwnV9ppgoO1A3uMHTdqXwEsSMWAxzvm7cwhbP8PSXwlWCGttL9hSlf3NZKQnwBKUA
	t9HPwktf9CV5TwtnKT7WV9HAYdfHRPML
X-Received: by 2002:a17:90b:3d10:b0:312:1b53:5e9f with SMTP id 98e67ed59e1d1-3159d8d80f9mr20426465a91.24.1750688050089;
        Mon, 23 Jun 2025 07:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9J7ED3U9fTLEsv4tSvQ6M5GTXVIyg9vk4m45JNqQJMWlwWEhhOz4sDmwr32GURMlMnchErQ==
X-Received: by 2002:a17:90b:3d10:b0:312:1b53:5e9f with SMTP id 98e67ed59e1d1-3159d8d80f9mr20426392a91.24.1750688049594;
        Mon, 23 Jun 2025 07:14:09 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Support for Adreno X1-45 GPU
Date: Mon, 23 Jun 2025 19:42:05 +0530
Message-Id: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZgWWgC/3XOzWrDMAwH8FcJPs9BsvPh9NT3GDv4Q1kNa9zaq
 ekoefc56Q4pbBfBX0g/6cESRU+JHaoHi5R98mEqoXmrmD3p6ZO4dyUzAaKFDiS/44VrF2kKXOD
 gtBhdY3XDysIl0ujvG/b+8cyRrrdizs8mMzoRt+F89vOhyl2NHY8W2Tp88mkO8Xt7JOM2/Xuz3
 9/MyIFrRVrBKA0qcwwp1deb/lrZupRNy2InIL4Ioggt9M0AvSFj3D+C3AkCXgS5Cp0clIVeWWz
 /EJZl+QGBoqXIXAEAAA==
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=2002;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Rp6x6KxtK4aGFpq43ixsYLX8y1+s/PNcztPAPycm16U=;
 b=yvWYMl8LTmjh2jAlMPFUt8F6zsyk5RJJACb/bjP/3PKp2regoKw8/xBSRUgguHhfRnFJvEpUx
 +vyFBQMYNQ8DwPNqtHOWOD77DxcUrX1e+sk1sWuRAJ1KuMtyhLhozQ1
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: BFUNVqUupYlhsmK-u2S1q5Fhea7EVihd
X-Proofpoint-ORIG-GUID: BFUNVqUupYlhsmK-u2S1q5Fhea7EVihd
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=68596133 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX+0xdFxrxtgq0
 lT2veRjtPCsfATp/P+wYb7a1tPQWH79GgXgv72Qrsr6/moz4x9OpnBT5di97WPh4xlx6H8RVrPk
 Oqjk3a+IXAvjZMHeLg5Dyxt3UQ0QLMcXR8EcCmfW0jMf+e2mGA8k5qvR3R5I0GSZYG8dXyQZmR5
 Ryr0ViR8c3bSqdbwt70H8Pr/kNPK7Px7v54WOW89kq+qGRyNT6p9rmgQZ7RwhmggAzxPZ2jHIJG
 ylBEcoE2avngbNeEd/26spx2j3T1dWnIcvTw4F9NpHaSIArPh8MESS+uSUrU5NM5vaJARuaeMco
 0vGBbpdzXNlJZ60Iwvx5BIsWK8HFUvogRVceCU/40eAF7wp8np+pfU2mVZdVIeqfL8cCcFDr5SO
 AuU3fDUxhjWgFufqOcgscD0sBz9cTRz4JsgITEYl4Q0mwU5O5aNxQYdfACxX+CxRflHg6ZTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230084

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

I think Bjorn can pick the DT patch and Rob Clark can pick up the rest.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v4:
- Reorder the new entry in defconfig (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com

Changes in v3:
- Rebased on v6.16-rc1
- Fixed speedbin table in drm/msm
- Corrected the regex for the adreno opp node (Krzysztof)
- Replace underscore with hyphen in DT node names (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com

Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100 GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  39 +++++++
 6 files changed, 170 insertions(+), 3 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


