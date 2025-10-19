Return-Path: <linux-arm-msm+bounces-77907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF0BEE41D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 13:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D8454E8C41
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 11:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE662E6CC2;
	Sun, 19 Oct 2025 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQX4nssT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A340F2E371A
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760875005; cv=none; b=U83FKz84yiZJ9GDpHkSsDASAZr90u9ls4xpRzthg0d7qJzF5Nco2I8uToSPmVLfSJ5LSpDlDPrp1xWgZx4NVz2lY23PTZNW2JmbHk/jJMwmUosziYw1OV2b6Xa360Qg/JtWZhrAJ+C/tKN8HAH/bdaI+GbiyPIcTsfnpUn85OW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760875005; c=relaxed/simple;
	bh=YlZ0ROP5gJyeqaSTmWX1xfZV7ZJUSRqclRMBwrURXks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RxvDhA2eN2c2CG29IS3PBGhXZaw0Ub6lsazPqXh/gr7wYHqR/UFYoC4VQLAVW4R3m0efzQVZ9s4TWiTQQg7qevHa89Foq5qCR+9e5NHTfAwLqoHYsoyyX4iwf11pVZdW0M7GXH23vvqTk7p2PI/XLBpSRsT4TvYnkeVWaUSar14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQX4nssT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J8Pqcw022238
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qUL97SYJ6g5PgkNTlGLntC7OPdptYf5BU9K
	KW6069wQ=; b=HQX4nssTBFjgy4XrNtQPzhjeta3qag2pfWU4Yn1I8MIJdMwt8Tf
	4lFk+4tbNKKr9XjXBLFpccgsjDpg4jmmZ2Iz2OJDbiTD5PXYYTEdYBp4umlcjj97
	1r6hkmOreAfAasxgRosaZdl2q3iuksSpRwUj5xGWaJXejV3DYsQfXwPaUtiwzAHH
	jAY7A/hziBNxjEBxgPrebF4c7ZZaOAwQt+qSlihwB/ZK3Bw42208In2NI3Y2oNNy
	FnL8hVgp5oaChhL7g0ROu6c9IKO3kxPSPCLsTsYdiFYO2+aJosN3JC1lYsLfmNF5
	emwVa5GxmymWbL6VT93VWYYCJiGbhlgKVWg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27htcvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:56:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6a33319cb6so2352726a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 04:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760875001; x=1761479801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUL97SYJ6g5PgkNTlGLntC7OPdptYf5BU9KKW6069wQ=;
        b=vgeZiRZom63q8Pn12uoz0GKbeYOSeeh7i51lokxxGEbNxr8Nl0F/pw3yvE+ztwPmU0
         bPklYcxvAq2nZPMxNGg0R2XlRLpMhy9F8neTybIQeVZwfZiKbHgsfuaNSUgyawwAhHx5
         32HWhKzDUUYGk0gEwDEN4t6lwmR4l/F7R1X2QPLSti69gcGx8HzphjoZWomab//Qtf5b
         w0hW7EuueRmacDohd8IMUup9FP2lu4SkzxvlOAdGuYk+A8MAAscRVB0GR8tn0MHmdsV0
         Sw2yUz73z0Af0NXiSuk4srfGFLn99FxmRV9nO0hHSu6B82Ztxb9OLM1WIoicDQkJw4Xc
         AkTw==
X-Gm-Message-State: AOJu0YxrOfUK/rCP+jJdGNw2OdidmjdtFVG4bFeRAmMENQsdlwm7cZ6D
	x+1YUMhpZLI55qoIYuwu3sLwgsWHgBTcb5P5UNOuNhJo6U05sIjTN8x9Qc+hZ34QJHi4XYXUF55
	MW1KBWTFUcF+1wjWEXOt9vTYU+pSdouUNpEpejw0V3jKEzYgyOJqXPMiQnVs0jddbogiT
X-Gm-Gg: ASbGncv+4Q0QA1dsZpjecA0skhyOXgq0PWf2n38oDxki9B0R6hDvQvsi2jrY9fDi0cq
	sBPimvCuVt191EZfKR1cx6+d0cR+SeTOPHwzG5KJK3Cwc+9wm9GrFDHZvKcuR2u3nOWDu6oDLMV
	EvempgucpNvFFfTuCqhuPzdjBVkZEFi9b9TvVmKMua4p+t/KlbIf2pXAZexxBnovaWvBk8Bxcu3
	EzpCfEB6ts9t44WaorrAijtfTXbD7TXcuVSnp/YH9tlixZ0rrrGPt+ATdBSeauFgIbPuLhf7B5W
	vcMtCOv4v6FDt3Jf4eT07tbvOoWjinriNoFqefiG7JCEux1UNdczMkiPm/ikXrOHpdIQj6cepAq
	x0HhHy36XlleyQnW2FVj+EiqJ42dsxqgaQpJU
X-Received: by 2002:a05:6a21:3391:b0:334:a82b:97bf with SMTP id adf61e73a8af0-334a8644619mr13330675637.54.1760875001138;
        Sun, 19 Oct 2025 04:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKOi1ONCU8C3sWPP+vbxnfjGdeVLuUrxOpyg5H2azthwS1hFEUAi/DGOLztXP2tszOin5isA==
X-Received: by 2002:a05:6a21:3391:b0:334:a82b:97bf with SMTP id adf61e73a8af0-334a8644619mr13330652637.54.1760875000707;
        Sun, 19 Oct 2025 04:56:40 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm4970822a12.10.2025.10.19.04.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:56:40 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
Date: Sun, 19 Oct 2025 17:26:30 +0530
Message-Id: <20251019115630.2222720-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX/OfvhbOCuH/Q
 R9Abxeuf5/Smd6of9uWdG+/4qlFUJm8CAOVwSMXMAUiQurU1m+hSphRP++VimAk0XCQWSKbWpx1
 yDBJ9UGzb3b2VYKR8vZOYdt0bmW0NDgHvj/X8Phz1mplkV2uKsaZgfuR9InQkapg49WKUAgCTiI
 2fX8XpDrrcils/uMZ6tBCzwybaOdz95BltrbLu8iowRdnUQtq8KRQbGfATE8CH+O+uY5n+tityO
 bgATl79Uy01MHttxeMohxFhI0yRubGY/YIlir/GauXLwxMiu6iP/LTgrb1LWJKUkmUFCW3w+vFM
 VN/e/wwxzQiv3EH8X298kVhhrMmDNBQVbXLved2hy67SSFLiv32em727h+eJSF6/1RoSEGGCOQs
 yX+7EIIat8Y4HhAkgKsWuEQtNNYfoQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f4d1fa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mzrBCZWHuliTEfAr3rUA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: zZtDnBYxbkX-8XzPw7qe-P0ABh9SCsu3
X-Proofpoint-ORIG-GUID: zZtDnBYxbkX-8XzPw7qe-P0ABh9SCsu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

With W=1, the following error comes up:

Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

This could be since the controller is only HS capable and only one port
node is added.

Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Note:
This patch has only been compile tested.

Link to v1:
https://lore.kernel.org/all/20251014022121.1850871-3-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
In v1, the fix was done after flattening the USB controller nodes [1].
Since there is a system suspend issue reported on that patch, the
flattening patch will be sent later after its fixed. For now, sending the
fix for the compile warning.

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..6beef835c33a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4939,15 +4939,8 @@ usb_2_dwc3: usb@a200000 {
 
 				dma-coherent;
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						usb_2_dwc3_hs: endpoint {
-						};
+				port {
+					usb_2_dwc3_hs: endpoint {
 					};
 				};
 			};
-- 
2.34.1


