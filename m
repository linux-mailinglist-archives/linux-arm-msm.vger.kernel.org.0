Return-Path: <linux-arm-msm+bounces-54605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AA6A91399
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 08:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5D33A7EE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 06:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFB91F3FE3;
	Thu, 17 Apr 2025 06:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLUoC/Zc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EC31EB5CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870374; cv=none; b=kMtlHymanjOBFpDannRf9969o8eF1pWlOp9Oy1AP8qZMqUDr0LhytycY4iBlAGwMOfjDpbqRGK3t9W0UPh39gUtmGif364E32tHxIy14hct44UR3PkJrlZMHJC6aHPzcZdsG4OalM+YXaE5tjKQ0LjZP8snVLc4Very3J5ccg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870374; c=relaxed/simple;
	bh=cgtO14Bpvt6Wb55LWPr7WF1fABYqx6pYYyQ6s4+ktgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IefrA3NZw+m19W5XNw8qEjR3dGIjFlzOOU1dO1W6yJOdtENuLg1QhT+Y3jLfjjBCNYE2Sp1ngIY9SgCGnix4/Vor46ctF2iyb/zm00C8WARraUSeb5LDL+Cf70XqSqtaL8q8BdNeL5Vd5WJHJaCGjIsduDf0IZ/oeoVRw8SVR5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLUoC/Zc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l76f003033
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qmgG5UzNxXN5PBPdTRUaB2bKva2zzhOulRy
	r2SSIuUM=; b=XLUoC/ZcbgRR9TVEuzdrK5YdoC3rXF/UZ2HWVyXAr6K+K1Zs8Tj
	UmQ2ZAIKbHGjM090gVErYXfJHEmjUqdvyHE4KAQNME23vZLcdjrvgj2ZTBQlz3G4
	eCso8W4FpqnVvmra3oVYIqrw+r/bK0WYGhR25dGcl/+KLui88kXg3RximTh6uDxn
	zqLvRveF5krBcgaIeqgN2rhSVsYvDMLsZGRpkGO9D83Dl+LSpZOCZL5/Xp5EnC6w
	VtCrLfbmbka9yBbNQ5YqEguSuNSMBOf/giGGQoTz1jciCSY2dr0Dz6VWl/u89/xG
	iHa3OWD8AIKmzJ6zdCU+MW9WfoicLBI+PBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk5r9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:12:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-229170fbe74so5197435ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870371; x=1745475171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmgG5UzNxXN5PBPdTRUaB2bKva2zzhOulRyr2SSIuUM=;
        b=K+psb05sccMNzp0KiviSBaUrQZdH5nUnoczc8yKYLHkfYnh0iVwWJAS6J5+FfgcFo1
         UA+ltQpZijypI3toydrC19ql8sd4GUCb+09PIPyIorPLRD3gQV+fAcnl66wqUFUsuwea
         StidsyyYCZHaE6h/eae0kNSOUTGnyeMoWL9GiezxVoMypSbldp8CiPieAJ1drqcdcRNN
         Gn4/i6T8/R+zXa3JAT5iS+nktDQDnU4i0SUlOa4uxDOjgrGWHHsW2obQpb6VRjY+SjY+
         aTeG+LS2OXXtkxwnu22dBANGt6e9rb4eEygoipuaUPEvKdoypCmgeoaOfW8ZE0mT64pc
         NoqA==
X-Forwarded-Encrypted: i=1; AJvYcCWk70WUhE75pM6pPiglDplupmckeJjByxbOojF7KIdmiuua1zE7IYna2S1P02eRLMxkhtX7Q9ouPAafn9Gf@vger.kernel.org
X-Gm-Message-State: AOJu0YweKZBeZVeGSKfjvSpMHxPwBozPyhO6LW5T0bwOFs+4D+BFgDNN
	lmNU5IPeYKQ8/Uma83NAWAmk4DhNLsKp24l3HKb1fC5/6VW1SO2HAoVkTaPFpEkXlTxrtIjzrc/
	CXfulP/JYtvY4E1o8vlcAvTl8hQGQpjWsaHtMwrMMGQGoP7a4KL6K0p0hRiwxNssH
X-Gm-Gg: ASbGncvsHPy/5RYWH+2Q3LM7GiCX+G0mN9lyherE+Ix/d/JQmaAJsGYrdb9pIzBF0DL
	C1Ckvf/3qZPfgsvz9HGPMvG9CvU0SRC4G8YqpvMyvO5cIu8uQj+JfoWs5Z5yoGxsSOwRQBuzCO7
	5LznKLZWpu/6pyHEXHTpI0QTsLMqh+kqT4ildeILpGkpoQL92OemH1UfWBp6TQiq//5Eg/sZ5pW
	Bbn13VIaZkPCN2JC9hNx6Lx7XbM0jMseZ0bZwLAEkB2+GBUBup39BD5cqfY4BBhQDSMGPJfxctg
	5wKyduvrPPu7XI9ugx7iVH3AQ70UjtM0tPZO9lSobYrTq59ARHSjmizkPryjuL/WTx2/f3f2Vsj
	6jQEtrwsTKNWBL1VDQfAIldCCf1x/Lbsq3nE=
X-Received: by 2002:a17:902:e542:b0:224:249f:9734 with SMTP id d9443c01a7336-22c358c5261mr71251075ad.4.1744870370908;
        Wed, 16 Apr 2025 23:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCQAlvcNuZzfshnIDcwN9Wn+dmeRTS2l91t+hdzoOVBIq0mrD0PPxzu2ly2DtwXNhUB0CVBQ==
X-Received: by 2002:a17:902:e542:b0:224:249f:9734 with SMTP id d9443c01a7336-22c358c5261mr71250745ad.4.1744870370439;
        Wed, 16 Apr 2025 23:12:50 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm25159725ad.191.2025.04.16.23.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:12:50 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V5 0/6] Add new driver for WCSS secure PIL loading
Date: Thu, 17 Apr 2025 11:42:39 +0530
Message-Id: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68009be3 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=iXkry-JSjlV61FjWxUcA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: L6kuvuM2-bqq6WdL8faa3XW8KFJFQwmF
X-Proofpoint-ORIG-GUID: L6kuvuM2-bqq6WdL8faa3XW8KFJFQwmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046

This series depends on Sricharan's tmel-qmp mailbox driver series v4 [1].

- Secure PIL is signed, split firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check

changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts 

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.

changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof

Gokul Sriram Palanisamy (1):
  arm64: dts: qcom: ipq5424: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bringup q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 ++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  82 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 ++-
 drivers/firmware/qcom/qcom_scm.c              |  17 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 399 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 769 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

-- 
2.34.1


