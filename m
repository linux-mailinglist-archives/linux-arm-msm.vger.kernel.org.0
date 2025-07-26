Return-Path: <linux-arm-msm+bounces-66748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB9B128B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 05:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1A0B4E0351
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 03:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39521F130B;
	Sat, 26 Jul 2025 03:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALdxhURe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A091F0984
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753500724; cv=none; b=JWhtyd885I84mMa3Dtv7By0EgpiiQdD3DTr+o78oFXZspDb4FdXr8jbuzhWaBlaTxe2We5nhhdZjF842zFZtiyI7a2QFXZeAseeJvkLs+yYwakCgXZn9IdyvuujUMc6PDLb3hEIhJPdbmiG6TxIw8S5P8UcvW13cPrrbGndTkXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753500724; c=relaxed/simple;
	bh=M4WbQ7Lx0tAfr3s+O6w1ZfGyU5NQN8GiffcDbPf5R90=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OmbEzsADmjC38J9WjMiQSesnKC2ikr4PwFXrMlDAtrO0f+5kzOqnLRf1uZawbQQB0aAqa1V1rLRiZXEyCYCZOTJeBD8LWAYzuwCOWGITJrjjLmZ8hyAiUjovlg5rYZ4g/9tIF+izZTN7wfde1JSo4sGkx0Wr4gqYLw/RFLsJ6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALdxhURe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3W2jI019049
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e/UB9WUrnNaNs+rw95cnjb
	YSPraDRFw09hfhrfmmSsI=; b=ALdxhURe5udMV9br72I5k+BQTkw3RJMlhKiK5d
	DgkA00nwt2TJzuoDwQPDKFRJxY2Sfq4QR70JnNEs8sPzw5poQU4cXNSiuIWL6Gr4
	mdUTFHQMduARzjbMVDWCOyWyCwXeHaSSFz7FYNYrBIBq6nPqGF72wRMxBoD/7Zbk
	pMTipL6LevQyCvaszJyrH51QggHQecvv/JgVLUD9+AUNvNHOE5Pf0jfgpNWEmGZC
	obEFJ/fmDrBQNxlGbTB2/Wj3nEuY5RS9B5jCUX90Qj+82E2Ec9led+gtRLaKX4zq
	ZMoiz3r+BGzMQfBDyOt+I1ietDf6FjvoX2A9oQ1WGfzaM5CA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484bjq1rfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7494999de28so4135820b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 20:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753500703; x=1754105503;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/UB9WUrnNaNs+rw95cnjbYSPraDRFw09hfhrfmmSsI=;
        b=pVzIfp4UQYu1hvnr43Gte+BgSFScVE3895D1fItMRXoiQgwIjhKqp1vLs+f/yZQua9
         pt6MGacfsxuuyZjw/1n4V3jv/WfVXog/UpVi5KBEEDLIiooYQFDek0LQ7ad0KQK8+XT9
         x63a8Ak4c1sOFcc/wOCZY8bX8rp24aRX500ZFbF7h0XEnis4oPBjwbBZ9feFLYYiCUI0
         YKbwnU3eHYFfK5X/NvUXpi1QD7NKRL56YcxsT+1i3i8jlnu5efXYyomRUi3P3lLOgerP
         2K2GSehZUW9Yru4zT63Ssu2CCT/IbTENm4mshBbnNfpct0T388CA2Fb+RqrvjMad8tQ0
         Swpw==
X-Gm-Message-State: AOJu0YxXGgm1qxBELDivANmdHx5kGLTRMNUMH/kb37vHKLRU+Ze64n8w
	gXbDG+5LEvm5fm2T417E0faMvQ8VYEsLQR4CDIl0LbaW2mmL0NUsVPy0pxQbYCENpXtDtzF4YvY
	8Tj/zzQvIhkvVI2K6iVeNpPUAmb/gNVEH6Kx6pcU3X01FbSbmBLv3E1Rlor9sJP0AZys0
X-Gm-Gg: ASbGncsS5mhtSzbgYmo5Lff69NWKHdv/xJ5qwPcF5lEBBVZ4WtcNQnfNKNELm1nZbqF
	uuLvxpMjD/KSQwc6qnvLhRq6N1TIMBYQYCWfOod8puQyqK1JiQsX2/mcbq2EltKuZjvc/kEVgMR
	61qW/P09bwted3cK6hPx8I/Yjbxn+DlebLyayrWPGOvJYfxmaizj1qkZ2VcpKSyWG2khAxZswhM
	9/sxiVYSzyyXv8OrTAcelXjU87FhUmnz9J1sPOYeOsfSMgpTDOCOgnTHTDFvp+anj+SkXuB0VOb
	KaFDtgWrxl12+v5t+ItQZuWrRd4Ram+8lnFmCKNUcZrXf00mGKw0FNX65/czx5hq+HZTYMvOv9+
	bS/06HiVPDjxr5vXxTQPWHUVsoSgyL4UpHQ==
X-Received: by 2002:a05:6a21:328e:b0:232:7628:9959 with SMTP id adf61e73a8af0-23d6ffe8e2cmr7248099637.8.1753500702669;
        Fri, 25 Jul 2025 20:31:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQZ2ZymW3QZpjcbQ5da4dY5WLrtwYP3x2anwIcfoXcU/4HEyr7xOrUvy9+avIJM5SPLY9yZg==
X-Received: by 2002:a05:6a21:328e:b0:232:7628:9959 with SMTP id adf61e73a8af0-23d6ffe8e2cmr7248073637.8.1753500702242;
        Fri, 25 Jul 2025 20:31:42 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881f5a1sm724917b3a.23.2025.07.25.20.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 20:31:41 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Enable WiFi/BT node for qcs615 ride board
Date: Sat, 26 Jul 2025 11:31:29 +0800
Message-Id: <20250726-615-v6-0-42b8150bcdd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABNMhGgC/3WQzWrDMBCEX8XoXBlp9bNSKKXvUXqQ5XUjqOPGS
 kyTkHevbPeQ0uQimGW/mVldWKYxUWab6sJGmlJOw64I+1SxuA27D+KpLZqBACNQaG6l4SAjGCk
 deelZ2fwaqUvfi8vb+6pH2h+L2WEdsp5yDovZpnr+9VLCG6tEba0XWnPJz+l0pPo8x74OOdf7Y
 /iMQ9/X5XmZc5qQic+TdNhUrrXROKUgYnBNKJ5d7AJa51xjo8K2ieStUmxutE35MIyn5cxJLpX
 +XDTJkh+9l9pr3RGqfwUWmwnuoFDQ8hktWhFNAPkAVXdQxQUvXZ0moVF08ADVtyiuqC6oDNChb
 qXFFh+g5gYFWFFTUG0RCQWBCXQHvV6vP4G3Q+AbAgAA
X-Change-ID: 20250704-615-21c25118e919
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753500699; l=1874;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=M4WbQ7Lx0tAfr3s+O6w1ZfGyU5NQN8GiffcDbPf5R90=;
 b=tdggoYpjrL07xP6Wpk6vpBoUdJOyh2+eUfpqEtfgiPdhGtSQ8LS4GUFbunPVSulkndY3akJMS
 YkDULV0UIx5BoUdTfsNJCwSNSM/nDQowvL8Ss18H14dykjNxnO2c2Dx
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-ORIG-GUID: htu0lxD2n5zDN2MR51bVDpoy6L288Qf2
X-Proofpoint-GUID: htu0lxD2n5zDN2MR51bVDpoy6L288Qf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDAyNyBTYWx0ZWRfXySFvxlCXkUAC
 vxDvN47YZisPpwMZkPbtA/4XXQyU2ktkoewUIXesBiUkXjcsbDNhPFL46V9TyFOPxRtOaIDjyEx
 0psRlqKvOyRvRciG6F0hVwXBzI9ohOP8uxDEyqDeP0i4dPDwTA0jrJ9UvE1xog+KxM4cPBnqLqr
 EiQ5nwo57FG0nyQ1OLhJB8qhqG1A3MzvuPsmG5D7UCVcUTr8fN7bBkjq8W0spmHYAQKX9strYIe
 KYzdwXy7P9hye4sQ7mDnRX+lIk6PtGqoji30jm3csVX0hv6ADLUfuyJfCmtRoQYc1j12EWFp4z0
 95795Z/TSZFG6WLjxh89RFVcU4ugJCmPTXsCslR/hM2xkBC8wRTag2IAq00Hl0dort6eUbvnGg+
 t0j+619OYeXX0K0ixVOAylIlITIwmzwRueC1zyqzCJOwmY5nbeCaI3GTGx/qYDP19h4cQwxq
X-Authority-Analysis: v=2.4 cv=KLlaDEFo c=1 sm=1 tr=0 ts=68844c32 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=TmzUbGvDyKMaPb01JRcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260027

This patch series depends on:
- PCIe
https://lore.kernel.org/all/20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com/

Changes in v6:
- Fix regulator pattern.
- Link to v5: https://lore.kernel.org/r/20250722-615-v5-0-4677e70e25ae@oss.qualcomm.com

Changes in v5:
- Fix DT format.
- Link to v4: https://lore.kernel.org/r/20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com

Changes in v4:
- Fix node placement issue.
- Link to v3: https://lore.kernel.org/r/20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com

Changes in v3:
- Formatting: adjust layout based on reviewer feedback.
- Fix DT checking warnings.
- Link to v2:
  https://lore.kernel.org/r/20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com

Changes in V2:
- Correct the version metadata of the previous patch.
- Separate the modifications to the DTS and DTSI files into different
  commits.
- Formatting: adjust layout based on reviewer feedback.
- Updated the email address.
- Link to v1:
  https://lore.kernel.org/all/20241203060318.1750927-1-quic_yuzha@quicinc.com/

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
---
Yu Zhang(Yuriy) (2):
      arm64: dts: qcom: qcs615: add a PCIe port for WLAN
      arm64: dts: qcom: qcs615-ride: Enable WiFi/BT nodes

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     |   9 +++
 2 files changed, 144 insertions(+)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250704-615-21c25118e919
prerequisite-message-id: <20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com>
prerequisite-patch-id: 37d5ab98a6918dba98ef8fd7e6c91ab98aace170
prerequisite-patch-id: 1693faa1e23bbb0a37d4fb9cbe13e5dd43148ce8
prerequisite-patch-id: efa688b2ddd5744df7aef40182787ee4ceb90c98

Best regards,
-- 
Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>


