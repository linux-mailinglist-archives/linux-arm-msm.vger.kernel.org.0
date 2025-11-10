Return-Path: <linux-arm-msm+bounces-80938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB907C45702
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65321188FB9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E742FD1C6;
	Mon, 10 Nov 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMQeIyyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihQqJkIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BBA926
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762764624; cv=none; b=S4i6R0SW9ZL4V9krg7+iBmZEr0thhqERJPjkbCHAcXPtTiqB0EFSB9nrkKEfeVIMYEVjK7Bp8hPijUYz34HNFuR4iw2563QEOkxEDU9yaXcW7INLNm35Jk+yNqCTlGWtoPjYzmooFw+1RGgvjt3uYhuwzvcI2WQmRBu5VLMBmxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762764624; c=relaxed/simple;
	bh=IhbfKHlJWQhalv4pgjr+NZ6u+4DphMJWdXicn05Jm5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VFVK/lgeVIxb4DHpLuG2lTWmI+pTYdjq1e3EHsGxgRCqzHx2vbC6lXo8NtTN+8AGQt+JSCykoOXwQmL2snvRcQwxKiF4MU3GitTMRuUhkkGwn7RKjB/ldST0IEwcepCxhbbLE/F9qHB/BkTF0G/wBADKUUQgUTh2+oM+zFdc4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMQeIyyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihQqJkIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA37aRH2166660
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nauiFKY5347uNKFMjqIRfTHnnYyyhUF+2FE
	U6TjAE/I=; b=cMQeIyyPYY3UAGtBgMK5UQxEcV2xQyJB10TL6OdXOV0nlpImJr4
	eMnYLqGS2Qg21W+4zzx7NhFLUxNYj8HGvouWCriEhLAjOyjhMUIQGqqsrt3aG3i3
	theDxaB/6ThcHcID64mRf/qssWi0XBlPVx3xtW83LhZZ03rwGgLwzCIHmWJFDeSD
	dcBDAS2MPveNs7QcaPJV+N03GOpZZkP2jjLPX3iMyGVMrmyJW/hFH23cIlaXd5qB
	RnSJ400EbJeAKbWwsyWEv+vNx/nHU5SBk/FD2KhXZ5qW81b5lh8zJcfs9yWFOFvm
	O4i29A0DAog3lPxM8p/ibj1MZU9f6mFmjTw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab7vcrssh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297fc324999so4538785ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 00:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762764622; x=1763369422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nauiFKY5347uNKFMjqIRfTHnnYyyhUF+2FEU6TjAE/I=;
        b=ihQqJkIh79+8KnA22c3nmC/QegWt4jw3x/HF9vqcz/QahskTr7IClzloSEHNkwvmFG
         Kc06Bz3KfjpO8nyRtghI/cHFNmGTK9C0GRTXAspZOZwljY0wGm1F/2fxpxwSfXXGjZOk
         orXJwVua3I1GV20VBCu1Xho3lzO78oRiL7wyFHj0AxwjYiuLrYwMlDDeuiWf2HMmnEEe
         sR6zuxP4JQNiiWuJyFWfhYkUi9PpgpusU1yadbBzJxFX2RNIpBLSXsiv9YJ+xuM7+shm
         rQr5So/XzpyinsEZFnUZ1z/SThtOkgBNxjXXs6ZjYRanLUB9g1UMSrxa7QKFEaBr4Q3t
         MlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762764622; x=1763369422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nauiFKY5347uNKFMjqIRfTHnnYyyhUF+2FEU6TjAE/I=;
        b=wA8GXfvcgGhHs2tuOq5G7gNTlMpyUwZ4IBGllHUTIz3OI4Qygd+2FiI/+e27SCmhfc
         G6o8FkpFM/Z31VRyYFRNXmZZJKZPgtFwbsms+nfMzv/mQC3s/aEDb1e9W6sr7dVvhZl6
         Me3yN2hI/i1QVgiBrnPMm3yfiHl9cdCf7n2WptqGTMnLzyYaGOS4gdKwzaRx3akdxBZU
         nG6wnW53pbFV/U7YGcLA5N/P91GiOkNZDRGCIsSYUxdhCaXDb/63GYBd/OiUm2Zlg37R
         xRLL5J8l4nxqDw77CTB8H6l3b75U/ImNG8C8NPyhzNMa0kZ/QR1QcfBFpFAifMT+i8ro
         v69g==
X-Gm-Message-State: AOJu0YzocahpDARmMReDFDRNvOuame04oY1UfSjwdN7TYPd5mfuhBoKW
	dvpmcHYJS0vRq1LhyAguYeKQTW2VRSOYVUVgSgnQh7DmkPSoIAfdUbn2Stb6UIJ7kSIdvid7upF
	CSHmNdQsPj/gtUGrI9RzkSim76Kjl7cvTLN+uqVxbU4lbBUp2F+xuxaeKXaVkMBjdG+g=
X-Gm-Gg: ASbGncufVb0hhswRpNpQ52ovm6QO8OXkv+VC5hKjUijMWNvLFwhAmYL4ZSmvDPwb5AK
	T5+xE4RB2L/FrJr8Or5gb7WqvvsgrEas1rbU4PyJ8O4sW2mHT3C0ei0BomtEBKtivl5WZuMvNDf
	prFCkIHAnR8Mv1ONSgj6tSnprlKJ8lBFtasP/C/iu0GADoAGE9RLZSePAO7raGSHff7QJgNEFcY
	hbGtNMDaBijRbcTL/n3lKb49y7dnuTfxpQKNXR2R1XpxO4JryIt2tCM6GhZ63sxFi7YrsAyK+jg
	bsWKJwUQpdC0zp26awbgFzayP1eu2jJ33LlqAd3RJfqSyGSAXHBd41MUVhD5xI0RfZbSbtrwd0y
	hWGHcu2iS/dZSEm7ZFivTsLaQmcfh1w==
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr54606475ad.7.1762764622100;
        Mon, 10 Nov 2025 00:50:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG37pdwCjNlIgB1OO4HGZKFF6Bf3VVYGkGr8yEAut5arveKWY/cDKq0txxG/5U07H51uluGSg==
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr54606165ad.7.1762764621654;
        Mon, 10 Nov 2025 00:50:21 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f94fsm138691365ad.40.2025.11.10.00.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:50:21 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V4 0/3] Add SD Card support for sm8750 SoC and boards
Date: Mon, 10 Nov 2025 14:20:10 +0530
Message-Id: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA3NyBTYWx0ZWRfX57AyWKvAz1uJ
 KRae/BtAT1DIv0clYsSf0M4rcRqv6sFuBt6qjh1IXYVi5Z1rTYMQqJC3d5/jpfXNeR1j2r7rXP/
 pN8smQszpbVWYrxLvOBNbXZ4lO0mn/W7vPujzj7JdUozcHPBRUOl5MjmpQfWO2GytMF7OMCT10K
 uXWlXoursHPfMTEZJE/mDRloRMUt+wGLTfoxeeJiVIHaCRI2+bxfEXGawCuY+232VEPapGChq+m
 eB1tEuZ5entYHtph2t4SKbbzcJhBdrC6UMCTti/bTeO38d1wB1NM4WNFi1uW1NnVAKVRlH0MRRN
 md+sV6Fobm4gz+cJo7bHzuS9keghKJiZKdJKiy5docaZhFw9tIrdFxR/qUeq07Vs7tYyNgs2nK0
 0Z3dMzaBUsgaRUwrFMcoY5QbjpJo/w==
X-Proofpoint-GUID: Ff_RgsUdFNIzlAEOpL3Vw3V-ItnmfOYm
X-Authority-Analysis: v=2.4 cv=E8HAZKdl c=1 sm=1 tr=0 ts=6911a74e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rfq7y1KLf-xer_pzc54A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Ff_RgsUdFNIzlAEOpL3Vw3V-ItnmfOYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100077

Add SD Card support for sm8750 SoC, including MTP and QRD boards.

- Changed from v3
    - As suggested by Krzysztof Kozlowski refactor the code to follow
      DTS coding style and use hex everywhere in reg.

- Changed from v2
    - As suggested by Abel Vesa move the GPIO configuration for SD card
      detection (specifically the pin settings for gpio55) from the
      SoC-level device tree (sm8750.dtsi) to the board-specific device
      tree files.

- Changed from v1
    - As suggested by Konrad Dybcio the patch into separate commits per
      board and did formatting improvements (e.g. aligning < symbols,
      placing each item on a new line).
    - Addressed Konrad Dybcio comment to use SVS_L1 for opp-202000000.

Sarthak Garg (3):
  arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
  arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
  arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 23 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 54 +++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

-- 
2.34.1


