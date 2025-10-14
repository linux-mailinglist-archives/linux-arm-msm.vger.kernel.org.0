Return-Path: <linux-arm-msm+bounces-77075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE3BD710E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 04:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2BD344F1E41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 02:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F583043D8;
	Tue, 14 Oct 2025 02:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAcJC8AI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE6E3043B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760408504; cv=none; b=ZLiWhdl9oyNbQagyGim8GqzGJdKZhjLSk7TZQhgITXgjJvdnnKBxAcbT/lzSueEzXqU4TzoS7Xn9JhyU4aGZ/wBAzhTRi2mrE9wUWZ0PJFyYmcmADVfchzayRs5eRUzwU2lwEC+sg5hhgdxqrJ2R0iaXrXDAVFYt1AxnDqNvXJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760408504; c=relaxed/simple;
	bh=7P/Mjb/RILrSyr86CTC8+aPwM0m8i+WFJ1L4pDQSCEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nwW29sR0qv68msTI32LjiNzrof6Fv1Z7B1DLbTsKQ0u1qzaJgrbQpFvDqdAuP8MB7zwk6+ObvfETKjZ6jYzml4smt7+FqeskVskfXiworYdUYx6y6jH+4mlrXNJTu6FQzbd4dbvX06FQpbHWep8ttsJ6zSnnHL0LsSht0VWsgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAcJC8AI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD74B005519
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D9Ft7XtSCuw
	tEHNJ8fyMK9A5/LjPjLdSBZAdJsVq9gY=; b=DAcJC8AIpKBLtcJSKkf+Z+snwjh
	iIVvqflE96867iaz+kXN+eTzkes+vLxOtxjNBF6P0rYIoPesIrsmEprFakdJDLoa
	0AgxDkMmzskGXEWdhcBk/v+mGpy3oLzei0/qwahxPfnyOhANzyQZH8wIsBoD+W/9
	M02/Egy9B0vZIZ2nt3uN087gPsEfzaUD2k5PwZATAMLozOzfRovaeKZmrlVGIfqE
	oirisjFKEZcnkMLt35IZ5bjCZCRT+xVW7Ie472uDYMZM7FpNExaw2usliNjwvQWt
	2Grs6clWhgPB+KDttGF3nDV8pqzeAlfhhUsIgY+x0YsGgrmc/6o9u/W3cQg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa86ukh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befc3aso10853375a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 19:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760408501; x=1761013301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9Ft7XtSCuwtEHNJ8fyMK9A5/LjPjLdSBZAdJsVq9gY=;
        b=KR0gn9q+9FL63BSJN/Z6NR74P7bVgDTQloMZ3+/LObBZ9CkyZDq6ctRJS/pf4V5AdP
         qx3zhOiiZa0COVI1KHKctQ6rYac2KKJFHev9488FJdtW4YdmdxGHwv87V+MIOvPtF3wE
         GcntTc/+MuMd2I+DzX6vON1g2w4BeFNi+PkzcG/TWTnZMisRUtJE+b+2WWQUzZvQRBJb
         kRRYIi4p/50FiZ6XaP1Iti4AFTq717io3eum6r5aPIfH8shl3uDKX5id9hSY2D597Raq
         HF+ZV+4WpONREURiOJ3C8C9zOLLxK/utEAM0BWcHXwgQVCKp0wB1lCCUbxQcVIHEpK29
         vNQQ==
X-Gm-Message-State: AOJu0YzmXGTaB476/SPg/FDPmoE1kh196cXPytEpO/mwt4OxHKPtX6Jb
	0jUifzfVZeSqFaEyfguWQA+QZUI60pFgCN8mnKsyOmXakk58pKjzb0ZsHSjRwo4PaWI2YeWlZU4
	0D/ChObPFIXB81JLciJCqDO4sBDCILp7++IXq2IZ6jLYWdkySQ9MFE00Vvb0tljuPFp4V
X-Gm-Gg: ASbGnctIMDgeyMRVn+CfhsSc8m+K7X3NFln0JO7q5ksZLbL1dnKcbqq982R3as9WSaV
	EMAgbw7bMQao2VQ07fjacxns+mlbuA88N183dnWCafCYGSTQmAycwPSquj832AmITCIEwOUXYDG
	6qjS2uf4PzFSSDHzI5WZ4BAM6WVp3T7+4m88bnCDpq7j+F0fXyzPHlAP4BTOPHtjMJqoLfxnI2j
	Ry8weQOXdXqw7dpoWZUjyK2j5THSi7o0vmqe+GPCWjD8saU4XDpnKcx1JRc06TZWuZ3lafy4MoF
	SIlNgIiRVoN3JJJkZEk4nzZZWN6jDeMzs9EJNDCIssqAUKpiMGKSrl7ZbRpa+BjKMzcdu5QXBY0
	wSw==
X-Received: by 2002:a17:90b:1652:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-33b513cd9damr30188448a91.31.1760408500796;
        Mon, 13 Oct 2025 19:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZaeDbQuCRtuJqKS6dnyGZ+CH6r1Kps2oEH5rhJK8P72l5hXvpds7qoUKbRUfaNCKF4WTfTw==
X-Received: by 2002:a17:90b:1652:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-33b513cd9damr30188416a91.31.1760408500320;
        Mon, 13 Oct 2025 19:21:40 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aab6c1sm14006978a91.13.2025.10.13.19.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 19:21:40 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
Date: Tue, 14 Oct 2025 07:51:21 +0530
Message-Id: <20251014022121.1850871-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
References: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oi5a2kbcdlVtbSurUjSnX9yeVxovcu93
X-Proofpoint-ORIG-GUID: oi5a2kbcdlVtbSurUjSnX9yeVxovcu93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXzQRfWcUBKC7E
 JpmJkESp99n527uqytPLjmqicw62MlI613cOqjK7wLLn4S1zbIAGp99ZeAv25vwkeXoG+Udhrnc
 zc4UNTltE2pxDt2qq6hqqWBjUX40b11J2rRwHNATs+b6s6IcsWJhf/F+YfDuQmTucm8iVWXqjBs
 e/MWz1ED7YT4oXgJ8A5VJ9zCvQL5kZcPFfQ8Jxk9hd1ytJUofKXjXNt6f6E2RUbVX3+OSml+r8q
 QGJL8C5rXIWAoBcwyUEQvMB9s5ZjvNs5dkV8tCUlX48vZV/u5GO4FxpUrx5M1CLMl8BeJcO+h4d
 0OITpc4/FT4nW/A/30m4QH8sDA1goyat4LAYuBrhXbOCIDoFkf73/rElbUEXc5KKNm/mcLeSsvO
 g8RVUHoVlZCrKBhGfJ83ANAofNoZng==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68edb3b6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=klVtoc-wQiETt9k0NaEA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

With W=1, the following error comes up:

Warning (graph_child_address): /soc@0/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

This could be since the controller is only HS capable and only one port
node is added.

Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Note: This patch has only been compile tested

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 56f787a8d821..f66764299290 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4926,15 +4926,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					usb_2_dwc3_hs: endpoint {
-					};
+			port {
+				usb_2_dwc3_hs: endpoint {
 				};
 			};
 		};
-- 
2.34.1


