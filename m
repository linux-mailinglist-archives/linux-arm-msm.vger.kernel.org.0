Return-Path: <linux-arm-msm+bounces-66521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 153E3B10A18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9233189427E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E881F2D3235;
	Thu, 24 Jul 2025 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGkPFzjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EAB2D1F4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753359836; cv=none; b=a4Vlh6Re4RyzGbNcRlSksdLAiSzHA1iw2BnsgrUC4rOW2T5+RbdeyWERxRvLeuN+GvOpYy9G2q8VEuz7SnglmcpzjxxMKxxS2d66LjYFe4fzJQZL/zB1Luic+24MTfgfli0X+ka/53DmFdCdS7YYSw90BU9CgMY/rrD2897rSEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753359836; c=relaxed/simple;
	bh=/Uwc/zZkhPQQjTQmHwxW8tbPaiZKFK3b/RduRUcE5pA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DeX8+aBz/PoyWdwkQAXc5+GDYzBwWKYXQ2+LriE78ucMum6gfC5YPDgCFhCzl+dSK7smUiNKROWwjrg355UCkyyo8z11DpGOsK/YKdSH1MMP+OghZLxaBz8LCHzneauRNPqG46tr/wtH8w6lacmfwWnQDNu4QDzJErzhV5q6RdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGkPFzjL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9Xw15022990
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fa7B7F/ihIT2weJo5JWkNhZb5xr33osr1/iUGbdYqo=; b=VGkPFzjLWvCMua/Q
	o4ua9L17Z9jbKB5Msl/JgaGJdPG5Y1dyEUXu0d8dyY4vdVdjvixl8ydvdXKuzzHd
	HvRwDa0eN0DhsvME8NSJC5PXTaU+3li4/50cgthDi09GIgv3CL1e/T2C3NMPYzDF
	SPrtzs4pFqf+jBDLP2EMiVYG36FkzaLAqc3lI0001toFgEIBdFWhRQwVfS7eL2u+
	KtLvKWGqmLCsCKSrTpuD9kkQbeQeV0N1/AY38WPYKqcnIwScn4+2XO02Lk9w1o0t
	uGiXNhJgkuouT2hVDm0OKLhW04jZyZHxGJPxG40JKZk6I9uPLfdh/UXZUJBbT3Yb
	1Eup3w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kkb6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:23:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-707053d60c4so26643056d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359833; x=1753964633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fa7B7F/ihIT2weJo5JWkNhZb5xr33osr1/iUGbdYqo=;
        b=G7MXNl/10DdNtq/HzmLug2zHiAEXEmcau1vOjk5hGndz0yh7YxN67qALt6dSXBCJBk
         92i0A3iBPtk19UQMjhlyqBBkExjxxFO9Zt+2x6oCSgsdMpaTN6mVqEm1prHvcyumSZWw
         AZH93Oj3Z7gPRzQzjjTtMmLExUNn4rmxUynmWyFnKH4LLLdG5rmG2SVjbm180B7n4Eqd
         yTYdEO0yrrevNtVm3EIU2pMy+Dw9OaikO0SWyAnODY/c1azqopFShfJr6x2siad3/SLf
         1NY8Ply0I21/oEQ1Cojc0b69YcUObG3qrVoxUhhXmJvY6/eWaU8V4/jU1WhxeP98HJ1g
         6RiA==
X-Gm-Message-State: AOJu0YxhWtHm8jdHJobVOvY7xvBm7PP3zsmP25nTu9LyO1LVkOfy96gp
	DWMZae4FMbUZrJpXPbnZQC4NCg1V4p/nIHoBUV3sYwPNRZgjsLhvQcYwd3PIavBkWds3iTJJPu8
	/3MSLuNf7e3dGLEnQdkz+2IPRlk08F0zjuT3a8ogz5chJLZBBrbXVmGk37PVKShdAr+lW
X-Gm-Gg: ASbGncs4N3eP7s0kxbOszWlFiV8NQLXfPa66vbjfqYFTKrqNd0Ylx3AhoXbTa6zoqPT
	JLWOb3cCOy7DEmYjZdpXDn7x0zu5LEMXQ790jtcheWISPdvFSFe66gCg2sOgQlE1t2xZ91+Fs7F
	n+sBXeVv9TgWP8ov3SLIkV7K4CP/FHlNXWXjVLMhzD1dFX8Bg+OQfg/FZSqfhfKed9WaK5Tu5+V
	ZHKpyEawEd7gjGpOqFooq8pii5Hh/NpM1NGBVRsTSN7Bvdzql6+EssxajcPP6GDNuArUIzIEItM
	iQuWHBd1+FQOlVaMFfAQuePgP0uzkOccXCJNFuX4WXbyqzXuFKv1EqcIcihq5TN/bV/xD6PRyS0
	WcXI1VBlpa3leTUVANcVUP9zIsx9E258P15NsxWRXBVSYWiXpY/o3
X-Received: by 2002:ad4:5cef:0:b0:704:a0be:87e9 with SMTP id 6a1803df08f44-70700711556mr93527136d6.27.1753359833167;
        Thu, 24 Jul 2025 05:23:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU7Va3XtsiGXNCtQMIZbUsmTz0HlJZfkSSDIQOMK/GUPCGVH20FwaQuVO4LmH+YOiBA75gDA==
X-Received: by 2002:ad4:5cef:0:b0:704:a0be:87e9 with SMTP id 6a1803df08f44-70700711556mr93526636d6.27.1753359832597;
        Thu, 24 Jul 2025 05:23:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c83978sm327389e87.126.2025.07.24.05.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 05:23:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 15:23:43 +0300
Subject: [PATCH 5/5] arm64: dts: qcom: sc7180-acer-aspire1: drop deprecated
 DP supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-move-edp-endpoints-v1-5-6ca569812838@oss.qualcomm.com>
References: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
In-Reply-To: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/Uwc/zZkhPQQjTQmHwxW8tbPaiZKFK3b/RduRUcE5pA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBogiXQ1jb18xu/Fj5JWf6JNHbkput8cQRevi24j
 DgzIJpHtMiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIIl0AAKCRCLPIo+Aiko
 1e0+B/9Fuyzpo+FU5Zb+PoVDgfp1J2Zahoj96Kk1jU/yK+37jrAMp5I+mnGFQDL7DUL6wmh4Egq
 7oyo4dIEU0t0kaey9h8vIZWSD+KNw15wDIRjtjXzIutve5n8OV+N1V72WyzE3+1KQwIYgqt3kQM
 00g5Eahr4KrI7vOEaEdEwZkUtidRrB2uoSrk6liGxqexVYKDPVNRLZGcG2LwoDOViE2iZch2XRo
 3vRRi0cOzmrDfxR2PwWl7bamT6CiVRAoLFyZh3X9QjgAeIZL1QmOdQgi52/hVTKDil//73o3KzA
 E3uZxbftvFntGbI1QI/RZYd2qSx2wOcYwwGdyt5RlYf2M8y6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5MyBTYWx0ZWRfXwteUxmL8J09X
 nx6cFmYRcUFHpEzl/2RBkbHW3X71Tg/7945PvK0k+B6RGhaHijXAw1VaZIOBs1GqqyDV2uXGDJB
 La1jF21XaJ+f4NIbD1BiBcTbdW1cSViQGs+a5wbLnki+yt9kNlEgHxGAPoh3APUpWED8oYQS2AO
 HjRxFP+b+zx6QTqexwbhzA4FqeQY2UWkxEc5vhjC1Vml3H3Ns8hfg3wiOlxvf9KzBH5zepmH1dn
 5e6w8CUKxwcTe4HFZcBn36do+lqAZFLxf1WoW/T8p24VqPlI3FR8IULLbWC1z0p1gtIGjryAPPm
 LTuIP7QccCyS6yZ4+rnQto458a1kNGfWglTDQ6AUunJ8fIO9zcIOPvMtM2A33yqW90ZlO3VwY+y
 viKRsDJS7wcoTHPZD1CNYPON5eEOVT5ZgjC9S4UDqUNdUAEl99OflUSqLK/KDn9Ufj8TMFDL
X-Proofpoint-ORIG-GUID: etpug8RsgtdWRcw56sAms4ztMU6hBiuq
X-Proofpoint-GUID: etpug8RsgtdWRcw56sAms4ztMU6hBiuq
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=688225da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=b1PHIvHk7SdLWIRam4QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=757 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240093

DP supplies were migrated to the corresponding DP PHY. Drop them from
the DP controller node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index a70396f250f0cc7509128bd49b3c69e0e78cffc4..ad342d8b7508c543984f166300bea04b6d7de88f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -438,9 +438,6 @@ &mdss {
 };
 
 &mdss_dp {
-	vdda-1p2-supply = <&vreg_l3c_1p2>;
-	vdda-0p9-supply = <&vreg_l4a_0p8>;
-
 	status = "okay";
 };
 

-- 
2.39.5


