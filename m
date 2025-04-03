Return-Path: <linux-arm-msm+bounces-53087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8A4A7A250
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E33F63B0102
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828B624BBF6;
	Thu,  3 Apr 2025 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+RYcbR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33CF1F8720
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681796; cv=none; b=jIoaOAgMnV0Ulu+Xl8qqfVn6xa+pxCPkK7PDfvmQWeptMOsPq4a+y/J3L2xKX3yNYcig6hUOzYSaMuXx+AyJUMJa9yxu9uvBj8gNs6FFwVjLycf48UEOC54e8cKd0RjbBj9106fzS3y0mHlVBNr2mNFNTMsgLNJiFWd2XNzu1I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681796; c=relaxed/simple;
	bh=oC1M00cCXgCNX7X9++RAaVFkOSUXmLVSWM5wcUXAa30=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kZPUKqiuW+YV2J6xbwqYhH0UX3K2YgDDI7zS8nEUc/FGtRfcKpVsNJdNGGojJ/gC6daLqomiUkTYfm6J9FCesW9y2wfj9eytGyb1lk+kCTkGlk2r4hpk4d6xoVwwdns+XN5z+dmECSjm7FEt0YwvHlX9wptlfvDo6ratQ1Z94+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+RYcbR4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s8nD013817
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 12:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DDVA9Do/PLB3lMagbE6I+HiWvtdoXJ1c2Zd
	dJk3Lyx8=; b=h+RYcbR4AHr/AKuv2p9apA8+sgE+8MqDlYab9JoVCTiqfA6lqVf
	o5XHBock0gP+g35PRWYvixCJm+7eXUlwtNdUxa46fsX10sOWcJjA2sH59DJwFOKG
	EwqkSWnrRY3x3Y/+6SV6uzW4ulKbNhIf45/LbmhoZePihPaM6dw6BaLi8K2JaviR
	Y6M3DJ2ZKayalp/wzN68HhT+ARXrBaKj35gpOCe4f+tOMTQr4bwn/iqHnoPKZunL
	DDur7ZUstV/tti9AwWf/8tL2JVZQGWjTaeMYEbDvRiT7oERX9i25wLEnHtj3QTPC
	Oq9psCyfUMLHOhiXAIElE9PR8gbTq2eRFxw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45spnp0mnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 12:03:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso874721a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 05:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681791; x=1744286591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDVA9Do/PLB3lMagbE6I+HiWvtdoXJ1c2ZddJk3Lyx8=;
        b=QqdJsVndZlhdPkjf2jkxaWI+5/QM0CNpmzH1vgbJf5FwySSbiJexlUQl15fSpVNDCL
         +PrIJJoPaE6Rrx3OKpUQ/lOFOGtwZeo11Wp6ahlU80yjRMcw2SHmVMVIlyvlI7PWA3N9
         fgUbgHtjwUIpquRicV7vppwU4HJzG6FtqYP2so2+cEGcI7Pzmsc7fEvs1Arok17ye9S4
         j3aMZk8AftYAlQs0FqyNo3BZp3i0F8fU/p3PEzU+kQ9LWiUU1bLJOB1TwMyIbhiODxGz
         ExSPdt0stqEDrAcCVZlAersyR+pDOiCPMYI5WZ0DKHqHx9WVxNtZfzKDjUQIiEvEvCX1
         uKMg==
X-Forwarded-Encrypted: i=1; AJvYcCWFdnzuz6DhNheolxXh6Ay21b8q3FbMl0totaieD00XhDZ/n9j3A0UYZJTogCRmDYaOQ12TuVPK2sEVhPv7@vger.kernel.org
X-Gm-Message-State: AOJu0YydohxavXBQd9hVpC9/P2pQkbMq9gw+60RSGWqsjInKoe+vc1Rs
	wenJlEZ9p9tUhDk+S+cKga8ETvCAFi4MN41XpSYYZWftVFz1ZEkit6tavJAi4DI55k0SykpqDjR
	2MQb3KiDKeT8Nh5x8hElKE2zgWur1MvnKgLEGn47cujlvz0ca+bIZJUD31oD2D876
X-Gm-Gg: ASbGncsMZmzQdz4nE47Isd+Qj3GMc5pFY4jpb63ujemz1LP09/YsYYEFud0FT2lE3Vj
	Y6jDVRbsFIQMRjGpLfAnosPaCYUINVnppPd2ECvfBuYN9HGg387dF+RqEYY6XliyV8nE9cQ2WHY
	SNZlExLMLAk2g/VDbj5FBHC4Wm1ustAmftXmvOcJUuJxMhcqD3ZJ39nf55gnAYvyzpJbkzMSlQu
	tc3W3DDWd+DMkku89vyNz+DCj/Nd5+A+Zq0UJ6YFJ9hVhFYxXFmrOZ6HDsLaW821O8pZnd7JAi9
	iIWlbd/rU6aPzetdsdWiEBDXBLvSlqY3Cvny6O7cvyLQvwQjDrocHRbCKBp/vFBIzanhbayjyD1
	7ZKfZrkYyw+g9UE7hXbSMdI3BrNdWO2kX3lPsQCY=
X-Received: by 2002:a17:90b:510a:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-30531f7c897mr29054297a91.3.1743681791246;
        Thu, 03 Apr 2025 05:03:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8ZDPyuYrzBkkV5yqtn6oP6UerprW1PvapmMx7mPIQ95bGIBcxDK1It6/5dH+D9GBvZ9euBw==
X-Received: by 2002:a17:90b:510a:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-30531f7c897mr29054256a91.3.1743681790823;
        Thu, 03 Apr 2025 05:03:10 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:10 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 0/8] Add new driver for WCSS secure PIL loading
Date: Thu,  3 Apr 2025 17:32:56 +0530
Message-Id: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3Q9yHrV66YvbNLwbZfw3Ip5SByootWVp
X-Authority-Analysis: v=2.4 cv=N/gpF39B c=1 sm=1 tr=0 ts=67ee7900 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=T6R8vjGxMvjp0dNr_V0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: 3Q9yHrV66YvbNLwbZfw3Ip5SByootWVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030050

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
        - added changes to scm call to pass metadata size as equired for
          IPQ5332.

changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof

Gokul Sriram Palanisamy (3):
  soc: qcom: smem: introduce qcom_smem_get_machid()
  remoteproc: qcom: add support for Q6 device-tree loading
  arm64: dts: qcom: ipq5424: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bringup q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,wcss-sec-pil.yaml         | 146 +++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  71 ++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  87 ++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  61 +-
 drivers/firmware/qcom/qcom_scm.c              |  17 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 526 ++++++++++++++++++
 drivers/soc/qcom/smem.c                       |  26 +
 include/linux/remoteproc.h                    |   2 +
 include/linux/soc/qcom/smem.h                 |   1 +
 12 files changed, 951 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

-- 
2.34.1


