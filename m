Return-Path: <linux-arm-msm+bounces-78659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1BAC0423B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7DE34E21F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 02:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB4C25F7A7;
	Fri, 24 Oct 2025 02:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elW3qesz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1CD1A3160;
	Fri, 24 Oct 2025 02:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761273454; cv=none; b=QXZNcG/cY5D0Cl0VxZ0XT1eusHFYYloevX8tNXI6AxHehGP19v6qZNwukbAvD0A6S1PGLGAATNMgcslkW0Ptv+LCWbMaD6hqsnM+rkBjLICb5jiorQab+jr2HbDnqKWdNNB0M5Y3UZ+dEzsRHWd7s6sArnowtvDd9GzWA5CfXZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761273454; c=relaxed/simple;
	bh=uZjpX7eEylnBxXLeJcvzkIc0XRRr53UVrAvXYMD25Z0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MzO1BwoetpyjTdEqVMLM7lhoOtCRZJqVgl8pyns7kZbuYHjoeEEeXCgBX02QZqdp9XE0Ed+lyxWBUE9vVKqX6wsi6sLMuIlgUunNns0g99/XategDIQBqKN4FN6KsXcrkt7fsvpyhLL/eeK6xDbE57PRqXOXhYF37vd3gXah91s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elW3qesz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEYcL5014615;
	Fri, 24 Oct 2025 02:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qMay1OP7RyA09QWk+caCw4PfbMbNqe4CX00
	oZCI6SPo=; b=elW3qeszOPrGmbgH/wlf8Js0J7c89cRJq5p8Gvcli94mf0c6baW
	kBm+yAVfThVZTMktvlroUEH4p1i5CZ0Ek+3IEKPXEZQt9+Gnsi3hXdwp7qFtrmCR
	61bzMXZuY4FzEo1z7+mErVW71ZtSD2CGK1Roq5LQGjDyMi0iglnlxCGBZ7uX9b8b
	dktp9Hf0D0+0C7yPa1TPN6ZQVG7nt1e3I1n5F6eZFAKynzbBAgvXpuLOSJXUkdm5
	U+X5iXKItxwUThVhM/ql+2MEDvqzEEWOyKGf527At8+b68WZoe/tcbSy9mM25xL5
	ecXj0clPk7vR3t90SiVDU3EFOmxkSTgOKuQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0rgst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:29 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59O2bQbX010704;
	Fri, 24 Oct 2025 02:37:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49v3ymn6ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:26 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59O2bQ4H010699;
	Fri, 24 Oct 2025 02:37:26 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 59O2bP6V010692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:26 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 8582A2222C; Fri, 24 Oct 2025 10:37:24 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1 0/2] arm64: dts: qcom: Add audio support for QCS615 Talos EVK
Date: Fri, 24 Oct 2025 10:37:18 +0800
Message-Id: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX2FVg33AR5dQ+
 G0/rHdXZL3KptqOHl4aAfTLivxP33rfAoFWYtNkFWzJjah5bfw21aci+tWrWJ8NGr8UT4x+52gP
 5c//IS0bD2mwc6NQ5gX9/Sd+IBeQP7N1u+C2b1QjGP276PhmpxZ3AJAejTYvdLnOQgJllXBLtk/
 Xu1BwRsLk+aZYrYrYCfjKBiPqFXtTYsXmWhCAz/Cr8PFpRh1oywRLQG+2D0Yz0XRKBpex3t/ee5
 ovxFefAjvtLUpcMDtBjc8UvuxLigVpXzzvE2LczPfvsl5pFGv/HRM/m9EXXfzEJ14GcFVYMUYaj
 DX0rz1Oe5SQHZO0ryh+RgDQfgxb+9ikhH2r/XPSxQRHNnOHx0edP9hOGURVkTrWRaVJ4FzD/Oqb
 GBhHb+SlDCi8osZDWpSlWFeSQR4phw==
X-Proofpoint-ORIG-GUID: T68KNjdg5ZrlEvSstljVO3nvbBi868dc
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fae669 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=M0uNroV0W_B0iyDjotoA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: T68KNjdg5ZrlEvSstljVO3nvbBi868dc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

This series adds initial audio support for the QCS615-based Talos EVK
platform. It introduces the GPR (Generic Pack Router) node in the SoC
device tree and enables a sound card node with the DA7212 codec on the
Talos EVK board.

With these changes, playback through headphones and capture from the
headset microphone have been tested and verified to work.

Le Qi (2):
  arm64: dts: qcom: sm6150: Add gpr node
  arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec

 arch/arm64/boot/dts/qcom/sm6150.dtsi        | 36 ++++++++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 78 +++++++++++++++++++++
 2 files changed, 114 insertions(+)


Base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
Depends-on: <20251009090619.1097388-2-le.qi@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20251009090619.1097388-2-le.qi@oss.qualcomm.com
Depends-on: <20251014120223.1914790-1-tessolveupstream@gmail.com>
Link: https://lore.kernel.org/r/20251014120223.1914790-1-tessolveupstream@gmail.com
Depends-on: <53ef53b423uespn7xspqfxnnvqvhzb5b22a4oaimf6g2qy7ruo@273oegazxbaz>
Link: https://lore.kernel.org/r/53ef53b423uespn7xspqfxnnvqvhzb5b22a4oaimf6g2qy7ruo@273oegazxbaz
-- 
2.34.1


