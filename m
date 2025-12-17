Return-Path: <linux-arm-msm+bounces-85437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F77CC61CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 06:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 492D43048DAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 05:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3A22BEC2B;
	Wed, 17 Dec 2025 05:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8cENI7C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvMtoDs8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24E2BE029
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765951021; cv=none; b=unSaw5yQHh+M+sBNwDUUQSeOnGyR0IfjPs4vZzt1j05z88qZBodsIK7WDSUPUnwzuimkQz667ueNLCv413LJo0OTP+G+LuqRATtuv33ajtaxDxJ57HMdxT9qoeTJBnOEhj8wH4t12CpvG/rLzvEAcCBDZCLjdnA21YHDXI+63O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765951021; c=relaxed/simple;
	bh=49QKdd1rResSr9+WFm4h96lUzpViWpr1EClIelvNMcU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LzLyvLjORiQowyFiuOjebAdHl7AHcZVJAs5Rg/ghWprSnET3pIwaWSHBuhGNwTxco9FNGCA51A734B8/eLHgn/f9nQho25fOxn0bSiELGIaG+T1ZYsNwvhsigtpGMMruafdLgkb2q0Y6g+zrFFFuTaoYgC5S0P3sjVPcRyJgCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8cENI7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvMtoDs8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FKpW1215364
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wktoM/xMI/lMCMybEQF3gQP542uMbszimgG
	mHfoSnPQ=; b=f8cENI7CvewKfgt0m5y4dkKZAQISGpaSoCiFZ9K6139FGXOE3wv
	rxDcq6odLCRSodQRzlijdHCVbTpkuk7VY0jRexl+r5lZu77H4qjXuh/emAlOwmtH
	zguZpAmiNf33U9M/7nJeuyJC6KbOyLwkCacbXI4soGg+OTWh6a3hUw/xo/ojIloB
	r3XYc6EeeqzAiwXl71RUQRjPgToAU2zqN+IUeMXMtiZIqFmshKCPtJVrKU0lll9T
	6PKcgHBvGqJ/r97tGfcJbDU3cw7kvWkFze7175wXOwyknpSPcKV3pZx2jishTIHY
	yxpjukvvEHSGdmHnehANoIDbt2G8hd9odFg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g20m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:56:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-349a2f509acso10113422a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 21:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765951017; x=1766555817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wktoM/xMI/lMCMybEQF3gQP542uMbszimgGmHfoSnPQ=;
        b=CvMtoDs8XjdwDlYox7fyBydE83OGYXQReoDrVwS1AXcPHAfKHC5baFgw21vz2R06ew
         XvFygAOt5XXvW2vExqjFBrbvioXhhhPlX1JmPOq29CgptrhXroOzpBuPHL8wHOEQCaVx
         xUjet6nnyONItc2jtHZVM2AktrZnIXlUFTUoAPn7mvXrFtPzDAyaaIiv8ls7lnR4aA4K
         be9o+gaViS53K+OMJ3oU7OVUvrn2bZSwulM4TpT2Fc7n7UTfGBYvk23izGbA/g3MUQiU
         hPhBiBE881Bf55g/jtL9XMIZCNCM7h3H5Lc94EiSZjkJmLfMGfzihXjA5lYYRXR6qFJs
         dNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765951017; x=1766555817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wktoM/xMI/lMCMybEQF3gQP542uMbszimgGmHfoSnPQ=;
        b=EVqC7nG0LcGPpNYipOFeBEjbyCkjF/7/IKvvBozqgto5Hp1v7gvxmHLFjG8Tbm3IrT
         yRi97IIF7YuHt0CHbvOV0P2tCwkXt5eEg+5DhLEL160uMjgIr93EbhcqJq8e2yrydeeo
         gm9KvwzYaG882A4mCF5vQ2VicyhIuqgwxHdHYVNp1Z/q1bGt9fnNctBzXmO8p4f67bQJ
         Y0YQNiwFctuQtGvUF6tXvzKKzlDTfnvCx3a1h7H8v2viyROW0fLC8rLMsIIYsG3RQdDz
         8l8p9ixZDDmJ/Z/mCdfTi09mqOilww0YeVVqbbxmjY40u40M/Su7cP5QNdWFkd9TpbKz
         ZN5Q==
X-Gm-Message-State: AOJu0YzbwSzziNwDzpjoeS2i6i/v1cZghnYMu42mrvLwGLSynQM3ih/9
	9sK2RVnWuzdWMaK/EVJtazVVI4xxcKPAjKMfcJbguaM2gGtRXweGzL0FQjDm54YX5Jga4lts+rz
	pWu9zC10Un/lThrakkExFbpH6bimPqM8hLfkrxld62Gqklt+NlSVbzgRRioaazQZXvqxy
X-Gm-Gg: AY/fxX4XgQirOVZcOgjCg2wCHz/Dx9KqyOnF2w40iohmgjBVPxqqhHl4m3gl2UBfkq0
	LwJZbkodspCsn6nUcUTcbzLkBPuBQub97pQ7prRKkgbjSm4w/7qZTRwgcBxDes8aB6RdJ09nYmE
	CVBmCpb1B57XQ7oFBDKzDMuB0R43gQSIxl1lOZ3hM87XUSL4Ix3Hz6edjGd58f6u2QXtLOH57ud
	vKsBkFVCKXt696tV4QZoXFan9N+nwSN4ut0dFUCkkDSwpwaVEt6z9AKjve9Qe1o5pnPpoa9O+Yh
	Tn9K1D1e625tD+b5EMWWs7x2LwTHg8ZseltrWPYorD0hKktpnWsQD3ATVhIY4nvKwgenHxw3WU3
	CNiWZefNU66uJIjv7JKUv4zp6I3WWwCBJHfMZmcSpItylViFImoVrarxcQt+VJ/vcTjLMNpWJ
X-Received: by 2002:a05:7022:a87:b0:11d:f441:6c9b with SMTP id a92af1059eb24-11f354974ccmr13891941c88.22.1765951017153;
        Tue, 16 Dec 2025 21:56:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE86JKR3HSRG+wrsvzfypzUySpyzBqWIZI2zF8hSLZq63HINvcPRtYlCrkAwESq77a4fBMKDg==
X-Received: by 2002:a05:7022:a87:b0:11d:f441:6c9b with SMTP id a92af1059eb24-11f354974ccmr13891920c88.22.1765951016588;
        Tue, 16 Dec 2025 21:56:56 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30497fsm60166484c88.15.2025.12.16.21.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 21:56:56 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] soc: qcom: pmic_glink: Add support for battery management running on SOCCP
Date: Tue, 16 Dec 2025 21:56:53 -0800
Message-Id: <20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M_mUCrfPId3U0_0CKX8yTpkrN4jxH6gc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA0NSBTYWx0ZWRfX5+dsa5QU7FRY
 /SDiTBXDqr3IsBbduteCe+p4ZFlJxdDtlEqyjtOeqfEHR9+sGg9bY1viGUYRPKTMBQm32n8nLKp
 ETbKj+tTERsASuiOBmK3QqoR5QUzb/UdvxdVMWdQb1TwD+qerNdKrZL5BMXReruD1YMURyPR7eb
 zi61p+tVZjG0w/QQBBfUsmSev7jOjYYoRLm8sWADoIx8tXs9heOlT6bQSZPLMh076RFhOfC2zuN
 vRMhQHoz2yjD9EhKHzvuORxHDngHh9mxWT21KtZG7AQMkFIrsXFo/0LLoRg8e/rhvwQWYCLN1yc
 hB5qCHBmdIC+hC1mAnSiOGtWXpzVqSCikr6fxuKkIRQpNItg7whpOCF+ZNUYgJrYLbNbuKVaUfR
 W1Rk1su/MuZPJyfADqtTpDXF8zSs7A==
X-Proofpoint-GUID: M_mUCrfPId3U0_0CKX8yTpkrN4jxH6gc
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=6942462a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qMsUIMY-mLJ0Ph_xJfoA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170045

System On Chip Control Processor (SOCCP) is a subsystem that can have
battery management firmware running on it to support Type-C/PD and
battery charging. Add support for devices, such as Kaanpali and Glymur, 
which are running battery management on SOCCP.

Changes since v2:
  - Updated bindings dependencies
  - Removed qcom,glymur-pmic-glink compatible string from pmic_glink driver list
  - Link: https://lore.kernel.org/all/20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com/
Changes since V1:
  - Corrected bindings dependencies 
  - Renamed pmic_glink_data variables
  - Dropped "soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels"
    since it was applied from its original series: https://lore.kernel.org/all/176157405464.8818.5887965202916918883.b4-ty@kernel.org/
  - Link: https://lore.kernel.org/all/20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (2):
  dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur
    compatibles
  soc: qcom: pmic_glink: Add charger PDR service path and service name
    to client data

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  8 +++
 drivers/soc/qcom/pmic_glink.c                 | 65 ++++++++++++-------
 2 files changed, 49 insertions(+), 24 deletions(-)

-- 
2.34.1


