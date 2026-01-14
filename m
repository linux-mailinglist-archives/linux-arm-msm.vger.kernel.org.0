Return-Path: <linux-arm-msm+bounces-89074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 783F6D214C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F9E13045393
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4960A36167D;
	Wed, 14 Jan 2026 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOpn3RCK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzWVe3xM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E857335540
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425486; cv=none; b=VFz9AacrwajEujJSuPh8F9yduyBh/VifCzKGBy4augkz8lNAk40mSj16uRYkLrHk0SYQiYoO+GligGE7iJotB9hWlWmU2ECZYrkGkPPbHrvi7VnUGMzsJo2SDKf8ewlgSaEEBH6zddNl2tAElIbJFnUFLiJAftPk3W/wG6Nc9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425486; c=relaxed/simple;
	bh=B96DTjA/Qkfjdv8J23q4DrvKTZtLIXFU6ouxOW8qoG8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LxwTTjrb8YSoNWc8pfMXE/yT3P5rzhVAThk6zvLiWaHimb6gPsGAbfDhSrST0OreZnaS39oFsA11XSNwPOHr1/ZQDzShi2PVPI2PcQEWvt43j/7uVjqMdU3adIjxzxC/U2YIaNvzsci0djHHdvEruoTqWdTz87qGgl89aQMFE/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOpn3RCK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzWVe3xM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHAFHa2552705
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gO19S1BttVvttNQrkJqOaoLa4T/6SpEQKjT
	PCRL92oU=; b=iOpn3RCKjp6r8+idZD1YxZuRZJg7DW2m4EC9U4tIc12h1HQQmLa
	AwoZx190JYij9TVqOMomaUHw5AVjTe0AjO6vv8YXD5jokQHuO/BM4wrxO5JqtKwp
	ly4P6Y0YfUl/Ngfr53xZncasBW5RauGeVXvqo9hYJKGNMNvYKQjdWI0sD3vTski/
	1SBZjVmEijGGYwqXkZQ59aEtlU6C2OdjuvFer1pzuhHpDxu6nxnV0gmPMzYPoQx1
	AXXSkUD+wkZuQ2p73Ywpem6LtwuaecOZcGFovvuhhti//hm63F44Q1TU3RJ6JBQ2
	NHtr2w+G+HBUZXKv/9KvSrRFkBFqSefaoug==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d32ccp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11b9786fb51so1241886c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425482; x=1769030282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gO19S1BttVvttNQrkJqOaoLa4T/6SpEQKjTPCRL92oU=;
        b=HzWVe3xMDc463PACwFn5uZBSs90QXxbYaUTGBez4+WmReO+ar/RORGGIAniyOBQi0x
         YW6jRdy14ATcgwuv3lg0/hWDv4b2WWTXP/npL8VmYAg5UHFZ5vBcnspvESatyHYu8iBf
         HQ3dVgyKyYGI1WWOizHp7u+sr3yF3Z/sj1HVzl4CXr+NmM04TN61EFAtSLlja97iHEYH
         81Bhu6tV0Pcwf+uS8ObfB46S/UhPohTLUfk6cVokj6C53GuBV0QCNCxV0j75OIxIBIaL
         tZbzUTeMgiZrG+csYvIXpeCpmGeixnasfi/zYy8P/qRe99w26ecVxUB0m+//8RUF8pjm
         f3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425482; x=1769030282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO19S1BttVvttNQrkJqOaoLa4T/6SpEQKjTPCRL92oU=;
        b=lExXCpJ7xckLQmFu0aGyDxuc9ugTIBocCPPRMRemPWHjLMskw93K5RBRcVvZmrwkT8
         ylpSwWw+wQ588v4nVI5nPPWZicqH2EY8xlrD9JwvBP0hFk3cvpHMggMsyy3BYmMhYINT
         lIGJ0oErTFfeg+jtfZmL4QnhuZCuOjKMXYXHcA6cx7eVn9CAYAh2wsDnfqgIz+5p/TAI
         0nhKnFjNiaTBrhes6gyJsbDMTE84dxSd4hNGW+VQSjhsVIC7aH3FH9Vu80LX8wzdLoor
         GqXJF/xR9jvR4/HFypgr522DuObi0blqpDMMIvtKRw577c/dmsSkCABsLcCm2kP859mO
         lo5A==
X-Gm-Message-State: AOJu0YxZff0dCOFaInHkgpG1Y9xGFE4JZxhTFNfLYYxhc0XIaxXgxajO
	KXiasun1+4euHlBSQuDcD9tQmnQVPoTWF1X2yOh3S9H0kv+EUnV/K92rcRepbUNtA9euJ0nn3ab
	dWBMC/lAiwOXZjsvBU3AYmVVajEeH83igse4YRkN97gJq19Rmrmues9eNA0KI0kMpPNyJMPCCmg
	NJ
X-Gm-Gg: AY/fxX6QbPwRdRxbaIJc6yVdLJFBDg2GH5XLHKw4n6hBfBUHBam586zBLOVw/LVrWgO
	icvi7v9KIg1JDUEEvCxxFp7own0X5dqWQgMyPExAV4kKaWKEDiTIJFxNct0mMDF2Ms5kJ7i1NFf
	Lh11zH9c2KsHA0HR38r/k1WdexA8uabnZFs8UYBQBNstYKDqMJUvF2S8aSAYMqLt9RUZPYameN2
	bf7OG0jGP9qQ4vDSSqlIMk9SEgdxwb9EwWZVNI6xIrqD+jAiXghT92rBtUTQ0siRGaXSoStBX2p
	GZKG5UGDuk2G1njl4zN0ynYbmi8+oqBXFZn2RxOqmFo+PHs9bA09tKoIsdgMYV+bMX4mstN3jyQ
	z0sNqYdp7N8BuvKZs+sziOwmxBVp5DfMiwdkSMocec2H/Bqsc9Mf5RoOtkv7VVjtqxb+iXonJ
X-Received: by 2002:a05:701b:2706:b0:119:e56b:9590 with SMTP id a92af1059eb24-12337704afbmr3993585c88.21.1768425481772;
        Wed, 14 Jan 2026 13:18:01 -0800 (PST)
X-Received: by 2002:a05:701b:2706:b0:119:e56b:9590 with SMTP id a92af1059eb24-12337704afbmr3993558c88.21.1768425481148;
        Wed, 14 Jan 2026 13:18:01 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:00 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 0/4] soc: qcom: pmic_glink: Add support for battery management running on SOCCP
Date: Wed, 14 Jan 2026 13:17:55 -0800
Message-Id: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yGGUnD1o-3GfMrg5mTw8sa6nLRaaCD8c
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968080b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qMsUIMY-mLJ0Ph_xJfoA:9
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: yGGUnD1o-3GfMrg5mTw8sa6nLRaaCD8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfXybfMfQvxiby4
 W5Afpa+KXFoBjbwkajJUnbNrWIDYGnud7Y9XBpL5wieTFFPpY2aWX7i5rBONiwaDyYLyrY0PLvE
 zFRmtNHkl73gByhf2nroR5LLrOLZqb00mDi0ufFICSSpef1rNWXHIwzsRNGGwJ7b+nMLq5FwvPw
 w9YROrxIsEzmx6E+Qw8DzbXdvAoxwZrSYHV9dxd+ECD98C9B6ZF6eWVRG3zwfAMx5jymbroCB9m
 tZlr6IyK2SFREMiqnm6YoiTy40GhtaggJAstUBb8UbzhRf40/Xsj+3rkdShy6cRWsqRD5ymN30M
 fhsCkA+nfb3OXIkBDufvHUXHybt7837p5vueJMM1+5v7zvfeziBbKHDKEv+ICxzOAg+p0KvdaXI
 lH6zO66psyfdT9ri2DUIOh1ZYVELbdvzxA8Ay9zj5g16IiBDjmlY4TZ8frsJRVV1wR4zuA2pzDx
 NnOLKg2PemVC45yIfAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140174

System On Chip Control Processor (SOCCP) is a subsystem that can have
battery management firmware running on it to support Type-C/PD and
battery charging. Add support for devices, such as Kaanpali and Glymur, 
which are running battery management on SOCCP.

While at it, also update the compatible string for X1E80100 so that it no
longer has fallback on SM8550. 

Changes since v3:
  - Added "dt-bindings: soc: qcom: qcom,pmic-glink: Update X1E80100 compatible string"
    and "usb: typec: ucsi: ucsi_glink: Add support for X1E80100" to series 
  - Corrected bindings dependencies
  - Renamed pmic_glink_data structs
  - Link: https://lore.kernel.org/all/20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com/
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

Anjelique Melendez (4):
  dt-bindings: soc: qcom: qcom,pmic-glink: Update X1E80100 compatible
    string
  dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur
    compatibles
  usb: typec: ucsi: ucsi_glink: Add support for X1E80100 compatible
    string
  soc: qcom: pmic_glink: Add charger PDR service path and service name
    to client data

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  7 ++
 drivers/soc/qcom/pmic_glink.c                 | 66 ++++++++++++-------
 drivers/usb/typec/ucsi/ucsi_glink.c           |  1 +
 3 files changed, 50 insertions(+), 24 deletions(-)

-- 
2.34.1


