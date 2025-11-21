Return-Path: <linux-arm-msm+bounces-82791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEDBC78447
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DE174EA6D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ED1347BB6;
	Fri, 21 Nov 2025 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0t6Qf1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAppkn8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDF346FA1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763718865; cv=none; b=ZsMrQyFpBv8iR/0iOTWXKB0FgwrUN01yULYE7QdAJFkxQg1fTQJ/8kEPH0nrTfkumPp77NRHFjKOYE5rwktt8DLX8wGnKXgh5MPXYbeuIe7m6vzLLdjN75hePFhZ4oD3cavMrKDNaV2MLIH/SYycZ8Jkb3DsZ4ceEPqUIxDHTKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763718865; c=relaxed/simple;
	bh=CJA8eucpGStwl4l8S1HUJR8qccOcDbCYVXtkRV+AZkU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ccg1L+ssI10xTkf+bMMaS4odsYJCsXI85dl5GcTkm43oaBEqhkL13yE/zfJ9mPAdQZi2t0+US5+guRR6OmhC6uwy3JM5bEjTeWaTkWVDQ/P7iT5zBAROW1h55xTeCPsOZgTzU3HqcpNu2wXDNpy0FCB2B9kIpI8z7L8tuhCIf3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0t6Qf1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAppkn8L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8YpX63139454
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8TxHOCRv0KBg/rEOL+4ctZ
	Mh8O9piFnOKZdvt7ie7sw=; b=G0t6Qf1Cz+/K005dDHjvPBSCfBb1j7BJBkIZa4
	ZTJG7Uqlj1/vXprHvvJY7jrXb6CPd3EoG9GOJm1Rd7whlFzTca+nUfd1V+1C9Ymv
	7e9AQx3gQKtDdnAsCtKcxg2j07829wuEMv7gPt+l3FU4bD65Q1p8fseZ12J8neOL
	myBRSwA09i3OTw/7CWuajSdyDstCijU9YrsXN22cC8FKJehAvSzLmaqjGznjUgUZ
	zWt0wIBanOJp8EJ42aMR2cqsEvW35APm9FcLB8eIglWPYzSt9sj4rB3iv6ml7wBu
	NjQD6pybIBm4HXo0b3lwsun5NDgYqvIw4L6RbeGFZWaEkr3A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppgdmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29809acd049so39670405ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763718862; x=1764323662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8TxHOCRv0KBg/rEOL+4ctZMh8O9piFnOKZdvt7ie7sw=;
        b=NAppkn8LvE9iNWLeZRV1lnoZLH6oJyRtDXRzJf3IiNGdKKvX/w2ZGl3k/v3rIajT2f
         3x/crzzbtV1gvzvY3iYg/HCbJO+zoYLkND+Cr7L28zLMxm+5MzzQ/xAvpi8X0VYoU3Bk
         DvdcZooC3ArTJr7YsNtmSDRlVQaJvAG3Tu8ROxRpYUC1HBGNvRMKEtR0CAJjqCxP2hEU
         6MIjcF3Y0MVjJPpgAZJUuBhMI7ZSSDlem681Z+ZMFYOLcmFzYSOuu2jcrLrX0EXkqVlu
         fSLQVHjID20TRfoNSWh4OmPh3OUm86ZXZ9YY4kD2k/o1GutWrS4bwMYDHnHC1nb7+SNd
         YhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763718862; x=1764323662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TxHOCRv0KBg/rEOL+4ctZMh8O9piFnOKZdvt7ie7sw=;
        b=ECaqA99k7XfAfmLXYVEccYlTYufY/QP8/dJyyNFn96gARgLT+rgebS/AoycwTOZR0s
         4ftQvuBQJd5C9cl9qev463sMmFwQnTfSudgdik6d8Mxow5DrsLF3ez+YjJlsyFAPh+LQ
         rtDpu/99jxYwFMbJP5bcRy+m+6wmOg/79FnIB7MQsjPPTzSjuItDSJsPUOKhfp29FBKj
         3upWgbB3shosWTDM/NlPnVPcjYSLnD05gZiUkyxuGp9r0l4QdqHCC7/SBiUG6CLoCvMY
         s0gyCaHgJiGV2qQ4XwfgeLP0RjTrnPdJUmrcmc6OO6c9FG6SMJOJZpLyi1Xm4h0uDGZv
         nLJA==
X-Gm-Message-State: AOJu0Yx671e8+Zw+z9Gy7gP+i7Tgul50yXBfMgKKSIklBcbk+qA7Jj+0
	dqDF9zFNfEUTahKwdmr7gWpVejuGXOX4y+RkdruWX54pliDgkZPiJg1K0t+UGmbifeatSfQ3xQe
	vkmxMEchrZdA2wQCO8djUSz1/9TIKLPD1FZoMJcy/jToz22bzHdbcEbKv2feM3ykvdmtM
X-Gm-Gg: ASbGncvabpBbdwlaOV9AQJV70a1Tp+RpgSmPliWRHhCwNCroTMGeSBGhjOrP2QZ8ASS
	QMpyqmD5yCK37ednYHk7XLeBJBfReGJvUAbGG/SpOsOH0p4xo5utFbv1zYDnZYIebJmcjGxWTtb
	/RE/9dwogFAmteupfMdRzw/JwBGfVPEB+iekUR2TrxoiLWoPO6kHBxD/7PvadUgO4FXLdjaT80E
	B61Vy/b3FxWlDrovnJgdllP/kcids59oEGv5YLphv9N3gtZJd8zgvU2QTPzqxPQAuTqHNq9QKO6
	l3UusuF+CHYAXnWbdFGkTWlZPQJG8QMb+8GT6dRmrAESd+49rdqneI0xDExGZSCpnf0m61wvsi0
	DUSIdTrekbHDmHqA9xAORU/yPnvpNcxx13VrG/2hcq/CNw6giQ4yuWWszTsBREB/nlKOmVPZ5TY
	G3NUvJUoU62EDsx1EHDEJDoNcPDHoTIw==
X-Received: by 2002:a17:903:f8b:b0:295:6d30:e26f with SMTP id d9443c01a7336-29b6becfe11mr23154075ad.22.1763718862182;
        Fri, 21 Nov 2025 01:54:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF485JhcOpZ9MGDZjtNjyNrcPSIvekQQC5Qsui0mjhTXx3ht4s+O1eHFgiRIFoQgDXdtMEg6Q==
X-Received: by 2002:a17:903:f8b:b0:295:6d30:e26f with SMTP id d9443c01a7336-29b6becfe11mr23153785ad.22.1763718861673;
        Fri, 21 Nov 2025 01:54:21 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm50557985ad.42.2025.11.21.01.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:54:21 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH 0/4] soc: qcom: llcc: Add support for Glymur SoC
Date: Fri, 21 Nov 2025 15:23:51 +0530
Message-Id: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK82IGkC/x3M0QpAMBSA4VfRubbaFsKrSJrj4NSMNkTy7pbL7
 +L/HwjkmQLUyQOeTg68ugiVJoCzcRMJHqJBS50rqSsx2Xs5fGctYkfO9JYWcrsoTKk0ynLMUEG
 MN08jX/+4ad/3A//BGUxoAAAA
X-Change-ID: 20251029-glymur_llcc_enablement-6a812c08f4c1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763718858; l=1080;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=CJA8eucpGStwl4l8S1HUJR8qccOcDbCYVXtkRV+AZkU=;
 b=gCgda93/NjVFJtBvaBHzZC7R7hXsm4vy5gEAhno2JlmfVRpDQBzDUqGbmSknooKDs+FlY6b/X
 L5Qd9PQcHYTAhG8SSj/5VgwpmtTwE5nxJT9aD9RHGiQwZ39ioj486SL
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: QeekswxUJPpjKbEOT_4GQJySXmL2YB30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3NCBTYWx0ZWRfX3+sSwwWtw/xf
 pTkTDRnF30ilBoa7itm4n3uX2YKcESaP5WfsmCBEXn7b3HN3mzFGl3VlQDDBvDZ9uu9/Ts93SEM
 KhKZlmAGtntstGXA9Z+FwEi8+pr5uc1qmNc/aYNPyt2BI226snJM5E0VXEpJvbLbsWAGOFxlVbw
 hIq2u770aYr1If+MRHiGj1gMJwhzqhTzyoJPtecZKUZ9Z9pcdzxLMZ+BSvKBwJPaFam/2K/DbSP
 3qcFsnBN+J+QgiCNN2FHsmW/TGIGWOQzz9SaNhvX+3KelqmagGoL+G4cFbIr6LACon/TERIYeBf
 Ux9zUm0vXiz97dG2Gmt/dU24thUf77dyr8ypCABq5BN4ULmb/BcXml1/yFu1LlXBpO91rVPGK2F
 RpDtKTq/XeXPikPkPNJhUwD7qz/s2w==
X-Proofpoint-GUID: QeekswxUJPpjKbEOT_4GQJySXmL2YB30
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=692036ce cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u9pP4I1MeIOFcQvFjyIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210074

Glymur SoC uses the Last Level Cache Controller (LLCC) as its 
system cache controller, update the device-tree bindings and 
SCT configuration data in the LLCC driver.

Enabled additional use case IDs defined in
include/linux/soc/qcom/llcc-qcom.h:

OOBM_NS
OOBM_S
VIDSC_VSP1
PCIE_TCU

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Pankaj Patil (4):
      dt-bindings: cache: qcom,llcc: Document Glymur LLCC block
      soc: qcom: llcc: Enable additional usecase id for Glymur
      soc: qcom: llcc: Fix usecase id macro alignment
      soc: qcom: llcc-qcom: Add support for Glymur

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  43 +++++
 drivers/soc/qcom/llcc-qcom.c                       | 207 +++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 | 152 +++++++--------
 3 files changed, 328 insertions(+), 74 deletions(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251029-glymur_llcc_enablement-6a812c08f4c1

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


