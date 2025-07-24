Return-Path: <linux-arm-msm+bounces-66604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2044B10F41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 17:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 097617B1623
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB402EA758;
	Thu, 24 Jul 2025 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mea3kXsu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363AC2E041A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372624; cv=none; b=fiqwI/k4UewbuHj7PSg1cIbpDnmFVcRhwEHQ0LsLgRZ5VhpVql7jqasV+BhGLpS88+XQta8yu2WEoSLXdYYvHq2dtxjltzeNazcL1LLSg0QtAuyGlFrUqKEkNnu7Nu6LyxaQKQ0riWwmct16c3M3qRpFMNYVz1juaBHGSlhUK5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372624; c=relaxed/simple;
	bh=QUF20TEbvg5FnS+B3mFsBfe9lLi8WAEgPd7pDJJeuP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D4/uefciGkvCmkeeVTFqnxlUbuVXZpGPlD6asKwg+GfKW4qBMl9FQULDI5Ds5cmQaQVuiCsmYtw8+a6WQIBnfR5jOEAG6ApyxAJrKGbeEdM8TLRDwyvnNc4UdUPwcNzoGtDwCD0P8Hij+zZXj7Yoo6RFDTnWJGWOWqle2Ut0imk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mea3kXsu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9slxb007119
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qr7A9PQNxrHiZR7GDwUr0PvXzP9qInDp+hj
	8sDBe6cw=; b=mea3kXsuOJ/v1eN4aiSwNqkB7cNhLX/i9iN2M6UtAq0Gs0xvxKb
	znb/FZoX3dSW7EIBmhM0E/EOC8iPJRSnod33hKj1mR6qX1Vp9ShTXqqxn1Xn54F0
	Kv/24q8WGoDEDZZoCeSWkaj4ZuJua+8VoxKuIdazkjJJSus5uBQrOcNvG5MD7Bry
	QQeyI1Mp+r0uVRgVAlK4Gy5MkIgZeMqTvOroJCDJTOO8D7XKOtXc8kX2pRxhUL1l
	v+KSxWT2OdUbGrV5dVXU9vawXM0pqExu8xj0kJPP4XXRqe5KuqtUqeCzaLQLx6Xv
	A1kQZpyi+LtJUH3cOQCGSnCr1OlWv2jJhlg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qhaww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso2064914b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372619; x=1753977419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qr7A9PQNxrHiZR7GDwUr0PvXzP9qInDp+hj8sDBe6cw=;
        b=pwrA2pQKKPS2T6nOmvXdVKdtfBnDeM9+UMnWaUXl3Np0OBTP3MVcRVlENrYLk9lJkX
         S7LvU0s2WAZPYW0QgzIgXZU/FtVhM6G9HVNK77IyAcOOZeJfJ+2jBwYsgyQq7yfCUUY1
         oz7Plhinz+JhxdCNVP+k7NZksXarg+AYJxm62xaooi1ziSmZUVeFJJekqewhDl55pIQ2
         Vsb9Tg1N3dyvvjJ4Lt6dI0xIGqvzpavuslzpJhJNxqK+lfT1kLw1X3gPArpcfPJz1BZl
         tenP/fePf60yhg5D0BbCmfxfWHl5EjGTb8RjeHH//BgWdeXJNdA9Ufo9Vzu8az16AfXO
         8BDg==
X-Gm-Message-State: AOJu0YzMu/OieII4i1UDiXUxLma+0mQCS9uDtUHOkSqTxbRiZnT6Fgr5
	qpfOtNjJi93JjU3tjqLGncWBbcYHBkDi/LZe21gdvp7/1VWpGPVAX6/eRcHIAl1ZRnZ+emyJs+x
	pCT322M05c501otQ1ZEK8iElDsDfF7R7A6YMk+/elkOeI0tHkNpol0bNfkMJyMCMuBKwc
X-Gm-Gg: ASbGncs+xS2u+uI7VGKKHrlACDIUeRXl+HyM91l12+Qlncq9HcpbgzAXQefpeLKuaFu
	ZJhIslj+036SuXs4945hPzb3A4ovwc7Lcjx12O03mJPdwR8duQQ27QXLDHPrrMBUnfgK7wVN9tD
	VvBhJIehz6XGPIU7eSqee921zyEsLh/u0oTj9Dplkex+P/LOYiELxI9vIk+kZsnFFfp0OIpwseA
	bVP8E+5C8ZPUQqc8p/psxlXVkpOjd5bGXzmUOzXIjjGi5IIH0MqbehbFP0zQIEjG3ORbVu5i+8T
	y2fJOUM02wOkekpw9IGYINjiiaTdwK18OGbyXvyjvNxp1J9r+mXrpXSbFbV3R/bpZQ/JojpXVcd
	3
X-Received: by 2002:a05:6a20:12c6:b0:238:e4d8:2bba with SMTP id adf61e73a8af0-23d4913b9d8mr13041370637.35.1753372618781;
        Thu, 24 Jul 2025 08:56:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD1FmFQQ9CRMiZyxPjL9yZQTW9Zc1Ud29qAqsHHY5goVdN+TXdgLfi+rYDIe45NT/+izd+vA==
X-Received: by 2002:a05:6a20:12c6:b0:238:e4d8:2bba with SMTP id adf61e73a8af0-23d4913b9d8mr13041318637.35.1753372618328;
        Thu, 24 Jul 2025 08:56:58 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b05e8498sm1988516b3a.98.2025.07.24.08.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 08:56:58 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v3 0/2] Enable audio on qcs9075-evk board
Date: Thu, 24 Jul 2025 21:26:30 +0530
Message-Id: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyMSBTYWx0ZWRfX9dZzEnBxOcGj
 aKpSHVHB7dJcXgTaPop20h9Z8qI26ZGcfZdEb7Pcqu6GI5pyPiQvhHxnl415qQdxBI8ClrAVmAJ
 TfA6Y13Zo2gaYZy2MRPlXx2xu86ECvA0TSinrSOOtK7I1O4vcNQrjMnt+TKwiUmqQxi5mcXXf5y
 EZ85sp25nZ4bLcurMutD17R+U/q+Yce23JKB2HAeq7uBzaeHGrp8r4qR/NELUezD5TjSnAMPhpL
 V3SEcOBvN0zr2TpyWotif75qRXB2QomYMFhxDugyR5VJKDdyOp1aZNIwOmyS2/1c1VG0WpteDB0
 to7LO/7BBMA48UX8lSl3XQwVI0sWida6E0iRO/JRpEzLurjL0wZLaqyO8f60VNUwb9Z/HulP1Kz
 Wg/8sTmTWV2WxSQt1L9JGuby8SZogiqWp4/F4AK03UYww9r/rjRx2oFJ+2D0ehw+FG43n82k
X-Proofpoint-ORIG-GUID: IfUbAzgEbaojxzcL-WrlelbGygE75oWj
X-Proofpoint-GUID: IfUbAzgEbaojxzcL-WrlelbGygE75oWj
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688257cc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=YkB-U3mbqUf8DnNMcaUA:9 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=941 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240121

Enable audio support on qcs9075-evk board.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker amplifier is connected via HS0 and I2S
microphones utilize the HS2 interface.

DT-Binding link for sound compatible:
https://lore.kernel.org/linux-sound/20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com/

---
This patch series depends on patch series:
https://lore.kernel.org/linux-arm-msm/20250530092850.631831-1-quic_wasimn@quicinc.com/
---

changes in [v3]:
	- Updated link-name from HS0 MI2S to HS1 MI2S and sorted nodes in order.
	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Updated commit message as suggested by Dmitry Baryshkov.
	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (2):
  arm64: dts: qcom: sa8775p: Add gpr node
  arm64: dts: qcom: qcs9075-evk: Add sound card

 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 54 +++++++++++++++++++
 2 files changed, 106 insertions(+)


base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
prerequisite-patch-id: 6d9fd3e0257f120cff342c287774454aad2be2e8
prerequisite-patch-id: 736cbcd47d5e7cfcc53fcaa7da920eac757ce487
prerequisite-patch-id: 4eddce6daeaa125f14380586c759f8cb8997c601
prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
prerequisite-patch-id: 65730290d31f18e66e2ba0dfdeb1844d7442c272
-- 
2.34.1


