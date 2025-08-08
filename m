Return-Path: <linux-arm-msm+bounces-68090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29580B1E4C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9BA4726147
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24D4270ED4;
	Fri,  8 Aug 2025 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRt7yuXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268926E711
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642984; cv=none; b=VupVr8q1S2Ja0rzuDLrOS8gkarb0XeJqZXNnprzjo78wZTs5gjK92EmDVrVtNHosGddCOdzAH0jlpdyrlNdqXBA1xxd97s9/oxILUNdq6CZWN+yc2F0Kz+u5tAXE1sDg1RB0zn/0IK6/om18l/TbGd9kc2/EHTEA3Ut07us1mqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642984; c=relaxed/simple;
	bh=xLcisQUmX1kKWJaAAGMAi99CaZ3yNW/4jd6IUN4d/Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b03+jlISc+tX+L+5YOArhu/TTsBYvlIRA062O2seq6wEPGhTifA7KkQO4HrIaWCDdwqM/vwGSuwP7tfY0PaZD+ZMwjuH7OfmY0txZqdzBsqL3FsgX9NXaw2ru9rJgUgkFomIMBDP/nuaIYplxxefS9Qis78OcZcbK1+Q10f9dDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRt7yuXw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5788HoON006399
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XAMShpBw6gl
	5ZzER3GWo8lF+QTIMlJwqOkE02a/mRys=; b=YRt7yuXw82QzPl4IJvpIKdkofL7
	z3CM42yL42QspFG0Kgrp8nKnudsAJtAsxSVMhkKaJogyZPt0fGqb0RPNeUbKGBL2
	Tvqavjv7WQRWn7CXOOZeBx1Cd+twKEjVkzh0ULcj+AkLjZECCJYEZes3XketblQl
	BjgcwBJqdMzsDWtrm6rINxFEb7MdpMjtw6/dcZfEYDYSfYm1BO1sOyEg2RKzxokw
	8nqWGyDrpywoqw+D0nG6RHrUwLCPixu6paX9ubQr3HTSld+TuGcV8Q5Ukknzt7Lw
	W760uqySBQ/KyH/STYnBBEovvM6C2aQdaQP8fyRQzwn1/Lw6gSmg7ObpiJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkr2qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:49:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b08a2b3e83so52080321cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642980; x=1755247780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAMShpBw6gl5ZzER3GWo8lF+QTIMlJwqOkE02a/mRys=;
        b=vSruxsmyIi7YgBDfFfTkjyw2vZdD8KA/b3hbTLq+EzSK7y4bIeJLdsfIx3G98ZEiOA
         3O2fXQ2aCIWmNynAN1vePm3VqwOPak2udp+UtmvBfk4CmhBul52s5rVqb+aV877g2VNX
         yffBsRoAclHd2bRawkVPh31HjF02qvYASl/FstW87TA/1s1qaPwzhW0TsnMrjtOzjLzx
         S0peuSDT2JdQzyDUMb4GPlkEHbTmjyz3zJTgqD8qAHX6OMYxNnHqlymi+G8e7OXxPQg7
         Ddo4BtydpWuHSNnM+5okJ4matkiLIOVMlYIarfh7tvis0jzW5jOFUu1RsKPUAEMySZsL
         1MKQ==
X-Gm-Message-State: AOJu0YxjGywgNPzfU/OZWSeV76ZlVUP8iiUEABKMU2sVeNbU3p2jeBFb
	sd9x5BCQIIxF6j02/bMe/M47760WrzVia70V2EgeoCnyK/8GsSbPB3xeZ1/0IEUpA0BEBnmf9MJ
	ZobX8Y5G9ASojA7P6t0zNPQLDhFC+pFeM6hgovLPlQAbu+RxWKDQ4qchJm21Z1KdtcVeh
X-Gm-Gg: ASbGnctn9EmYSaAmaRB68hroQg3fciWE9zJdxEXA6y+g6thI6ZLKmU3l5PBrkwO3h1G
	JG+ynEHhh5d5wRp79DHcmQGxqEXsqULshdLoLwxx5mnlSeRtS/7bXwzhb2A0Xc7PG6i1RUXvehV
	RFCJYPSBYlj0kKbwA31W+IZX0ympblYb5BVZHuFSpB87pH2hFw9U34W8mM8JE+5oP5bx/xrObiT
	H8Mo6impoRuYCr5/iEtaHUdnrJy2uabeBH0/f6aXU2+Sej97VLDMzS/D5XePtWS1M197IZFj6hM
	RMuiWqwTJBJfYmKqdYTJFsDM414B5PchF1SBOs7bGQu4C3gN3Wf2XqthVhCRv2ttLbtR6fEVWvd
	2t8MNBTlcxloX
X-Received: by 2002:ac8:5f09:0:b0:4b0:8ac3:a38b with SMTP id d75a77b69052e-4b0aedd84d1mr38143601cf.29.1754642980406;
        Fri, 08 Aug 2025 01:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE1yvscZAyrj30Um8VSEKm9PRcWAu6Pq/VWK93bOJfUynOJWNM5xox1ieq0bSmcUwi4Zfucg==
X-Received: by 2002:ac8:5f09:0:b0:4b0:8ac3:a38b with SMTP id d75a77b69052e-4b0aedd84d1mr38143201cf.29.1754642979951;
        Fri, 08 Aug 2025 01:49:39 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm122904295e9.2.2025.08.08.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:39 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 8/8] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Fri,  8 Aug 2025 10:49:23 +0200
Message-Id: <20250808084923.1402617-9-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfX00gq0qFzIUR+
 yi5XW8S5yVZUgdTP3Lw/856Qz7O24F7OXNjBFv6AKehTtif4M0RQz0Q6bnJqYJ2BZJOe8mGVi35
 dOrZ526KWfmD2WPQ6CuL7DCoA/hpDDbgPTqBNRXa3eo/v8oHi+QAWGkWGE9US9/BuXE4X+a7zta
 0115ozAi8WcJ2GKHi6YZies0eBy8HhIhCPP1qI+s7Ao4szjDrAU+kMpPcaLuEr+0IVFs34QbiOS
 sVs4EAQAz2+En7dQjEB5wfYRtxZ6duYtrfEGCFQlCpedCEhlOsocs2x5QMBeZwULSzIJ3dW+Dhy
 khx+DCXrVKJu3Uy9XkeOJWvHw+DXiTOX8w8WbAACXi82KmkwW0clWjzwgwx4O4DjtItlDTseUod
 I70FC0E1
X-Proofpoint-GUID: dcn31hXUAGEhDy2_RUVkOpWuY5sLh8j7
X-Proofpoint-ORIG-GUID: dcn31hXUAGEhDy2_RUVkOpWuY5sLh8j7
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=6895ba25 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qms5JgQ9tnEuTiNUcoUA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..e92d0d6ad1b8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -698,6 +698,10 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;
-- 
2.34.1


