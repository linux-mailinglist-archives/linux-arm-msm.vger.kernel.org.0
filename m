Return-Path: <linux-arm-msm+bounces-70425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D71BB31926
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 15:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21F318837CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD17F2FE574;
	Fri, 22 Aug 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ux6oa44T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250502D3ED3
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868767; cv=none; b=BOEQv1RKOppxgY0l1nOcnFSlHCbT0meCfAsvCWaUacAUFJRN5wT/BjnvbOGLiqtediAR3ArNQdzijqPyxlfMLxaSjUpi1kyfHDOJ6as+XYGRj5zcWWdWSB0B1Se8PudCmDPGvxkT1uidGMcpCwJmIi2UxAw/+GmOw6ZXdHxje2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868767; c=relaxed/simple;
	bh=YNV1LrD2QFce9EN/XgBYwEMHh3mO+bzTVuJXLM3hZF0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ozj94x3joZQrS6Swsg4M6V5E0Nv+ENorspfTgL0/vOe27CPBuUK361LJWgCIeJ7SZ8pc9HHpnTaOgqI5kVamYmKE33IdqMY+niQOQH5nA4BUZ6sv8oRyIwhVog4cQGImRifNavPwZh5z/LDdhrBWSoDtXer5f72uZhgHs/nAh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ux6oa44T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8ULab024175
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 13:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=imXHhpz/Q9XQaF1cibhyG8kOwiQPGXABLuO
	t1hZHVgk=; b=Ux6oa44TR+QdlXmLcQPDkU/6p+PkIgsH83lG1eij0hgQEH5D9Uh
	r5W+AG5YyeOPRyqDses1aZRfB5ZxYdK83iw397OJzUav+72Sm6Rb5nS+2kytjk1N
	6cFWa1lWujNQ1nDadIngFUhL1mNowQPWkODcSyoS4IDnzC5PZUl4Q1vV15MejhNu
	eYoEPenCOXa7HHGmCEGMUe28/+84rXP5oXNHwNJr78Ht20rVjBXQg/ww7MKpKPdZ
	qFRECYZHQAF1duLfatKZOuqz/sS4lp3hKWUL3bq/fh8iAP3pfeUUOfjWjOvteKal
	QmKY5epFhfBGyEGMK7EnnM3O4/7qORKRLag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ahcwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 13:19:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32326e21dd6so3735243a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868764; x=1756473564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imXHhpz/Q9XQaF1cibhyG8kOwiQPGXABLuOt1hZHVgk=;
        b=fugqagrfY3RP8oLUNqMQs7/0/g2tgqEcaLsTXIQXChyCQEWAZx7mp0ITbHgTmqHiZc
         yB1B+sdpLlhv3jDIXQ5+lVZqGIAVsLWUQrfbvSXLhvmubGm4DJzt5EKnyVqaw0telgWR
         qO6m4qP34rtyHKdvP9yCAAUYOW7W3E/Dw++pfzt00KAxIiaRyq0Edq/h7YqpeJEarOxi
         0L7llI9H5S1jNJ5UWVq4pCMXKCDQnVrKTkq/Kh/A9wR+xlDUNNpEiyUwMXfqm2VdqUjt
         pm+9M+TxMlRD5Q+fSdL2gHY5muio7X04lbhsXHUNADDalRUEFJCazxliz0h6CtK6Lz3j
         akfg==
X-Gm-Message-State: AOJu0Ywl8oP4W3cQpTjsiOCvfV86XfFiaeIDnM4scbaeJtQ9TJsgTG3B
	HVWA1MKyAqbRHjH1GDVj3NrGaXbo6jADxLQ+ExuSPaOaKKJyKv035O16JKh//W2R9vQKVKxJO/w
	v4rs8Cp7b/ezewLIGuLmZ3ifTeRj+GF9Z3iJJdCWFEDinzudbExS4xBrgJ0hGNMsA2EyQncZvvr
	bo
X-Gm-Gg: ASbGnctwoF6y7jWoeLVjha1BimdtznHjcc5goakve7kwYvq0Xqw0PuFVmQa2grgrD/W
	iKQNy3Sly+bjjEnC3s/4oGiPieBq8uqJKvHrjla+36qCBUhPz4M1Wxq3TARQbWA71KFrUlVDi0f
	t/jC2Okb2WYpjF85onBqXo9vKZ5y+QtEx2Y1UQZOujTwh/QNbxkn+cKcfw+OTUz8DFVPFerycXF
	/UA6NE4XaANawkvqFQs13wkq5FfSV2DajWgRs3MIDRLNF7tG7APgZHoDxKIZ0HBUps37g0uljzL
	DeH6GO0eMrhLlwkftdbN9y9VjB28QA8gjL1obXJ/PwVKNWWEzvI2Z6KYC4SZCooEg2GAr3R4QXz
	e
X-Received: by 2002:a17:90a:e7cd:b0:31e:d2a5:c08d with SMTP id 98e67ed59e1d1-32518b80c05mr4395424a91.33.1755868764404;
        Fri, 22 Aug 2025 06:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErq5+QQLhrxzfeOYSCSWDZYPvzVemM5r5mVKVuqDABlcj5ugI37RBZfS3JE3k6YLPbh8Rv6A==
X-Received: by 2002:a17:90a:e7cd:b0:31e:d2a5:c08d with SMTP id 98e67ed59e1d1-32518b80c05mr4395379a91.33.1755868763952;
        Fri, 22 Aug 2025 06:19:23 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703d2b7301sm405621b3a.93.2025.08.22.06.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:19:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v4 0/2] Enable audio on lemans-evk board
Date: Fri, 22 Aug 2025 18:49:00 +0530
Message-Id: <20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EFRfz0KGyXTzJGt0t4K9pPmUN78kEhAi
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a86e5d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7hm8zFFwfbrGz74eRGgA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EFRfz0KGyXTzJGt0t4K9pPmUN78kEhAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5ytiKmLDsX39
 lOb3wBIWAX75WZKAVerbtsM38FiAGGiF9CpXsUeXey/DrKZhIUJUZ1XqLmFJReTneYixswCn1wc
 g33atgjBRz3jjBxEqNFtkaMbQu3vjwK9+WB82umrFvedsaOCdFsAniDTeF/QJbmPLkCwG5x7lMt
 0JWUlFtIVsfe4Pkp68lwLvo4mg5WxUUqW01MVykE+x2Lhx5CeDR2/o8lguQ8VIxFg0pSGAb1U7U
 KSyylRuNQUS/stGTQWjdEpBAizltOjHU/YjGsVassqxIkUT40wYoTLzUAVFyTzuD+7+b/OqgDl5
 SR2jViOHeF0jcRCR1zWDGU1Tg0XRrgQ8vIhY/EDZtWeCeratM6mYht5W2ivcEjOjge5Qf9T0bWm
 jQpo39OJlIbA3ANjujJNcFQ5BcmB0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Enable audio support on lemans-evk board.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker amplifier is connected via HS0 and I2S
microphones utilize the HS2 interface.

DT-Binding link for sound compatible:
https://lore.kernel.org/linux-sound/20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v4]:
	- Nodes sorted in the proper order reported by Konrad Dybcio.
	- Since the base SoC device tree Renamed from sa8775p.dtsi to lemans.dtsi, and
	  the board-specific device tree from qcs9075-iq-9075-evk.dts to lemans-evk.dts,
	  moved audio support device tree nodes to the new lemans device tree.
	  Renamed device tree reference Link: https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/
	- Link to V3 : https://lore.kernel.org/linux-arm-msm/20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v3]:
	- Updated link-name from HS0 MI2S to HS1 MI2S and sorted nodes in order.
	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Updated commit message as suggested by Dmitry Baryshkov.
	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (2):
  arm64: dts: qcom: lemans: Add gpr node
  arm64: dts: qcom: lemans-evk: Add sound card

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 54 +++++++++++++++++++++++++
 2 files changed, 106 insertions(+)


base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
-- 
2.34.1


