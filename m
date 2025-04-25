Return-Path: <linux-arm-msm+bounces-55707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4470A9CFF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35B0CA002BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C6921D3CD;
	Fri, 25 Apr 2025 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7QGIM+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98F521B9D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603248; cv=none; b=HshoPCJanJphuw+t6544CsRkRWt+Lm+9jyc7abCOpXqDAeJ0YDHmvc5zHYkkYFXso6QuQdNrq+3ufdE8kslcekd8TrLyqiy9+vftmCZwvVO1W0esT5wLj+dKkXCMi9QDfjQYUlmakpb+ZiUgcbetQAFs8S2g9HRny7QRPvypnrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603248; c=relaxed/simple;
	bh=euC9lx8IKVS/A4UdhCZ5+fvdurao8cR4qkRb3bHColg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxrnEvFlABA64vpZYqc1o6WXt8uy3pEKcGNcPggJLE3APKWX50m2gySt4Y954KjWPjXdHF9lAwNV1QhWsS7BUKdsFaBlVjO1nFR8YjDsFg6l4XYxQr2N5uXge5MrcGP7qTjAUPCppNlA+ixSruVB6rGjtwOBgTKe1W7765Lyc+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7QGIM+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJvVc011486
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=; b=j7QGIM+hkbkOZMxv
	i5eO48NUR/jzm3EdeCb24hpjzmsTbl9KoYgSEI/jv/aJvqTYc51nMumFjdtcgU2x
	Yd8wMd4vIMn75KtzgApMshVnDTfqGA3a3w6eNJmUyms9vP71jJLMr0sMfwlJ3oby
	EbHqj7l4dlnfeu5j76/0yykjoUG7FI72lN0jBP2NRsIbK9T3HfI2YEXvYj3/2gxT
	gUMvEpt4+4K3X8LEGWrL4xh2XHNxLjtlGReD8eu0Q2auDiTKj/mN5dldHL4DgmXB
	9qreJM//zy7bva/1NZDLwzky6Cm4XTBZDGPxbNVcFgqaMOK7ZlXPaGxOzdO8cRYu
	JsEcBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3stgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so507427885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603245; x=1746208045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=;
        b=oLnyfEqpCPxGIfahecu86J6elbVfL+02t6gP4g4GsQ02EgS9Cwu4L6/XEvjsP/ABza
         Ey2K+9S2BrVobjX1Q3hBLASwEa9A/UWdnHcuwS2EkpruRQLvuPNnwO6WCde5vDhmThxU
         fAQZPNHNxwfUB0lo6Bts4kxNDND3r2eEAnKG0GHM0c65qiWlIaBmKinTzEj544Lec2iA
         b7kVqVUNmWEkuZH5Dtn7AbK+wBIURiXWC2DrZ/r1mFfbTmf6lRjuvioIkRkzBzkS4wpy
         BDeSBPBCCQDWQbs0cYUyciLGPoZ0xyPBq4+zMU3d6KK+xY5PVB2YfcPuxO+xreQRZFCy
         4tuw==
X-Gm-Message-State: AOJu0YyJVwSkJEzzVdCC7VaCTl6wtYzOieQWewU0J0AR3Tx/tZWcTjd9
	H+Vyl6RPKA7xVZ6SAis1MBr2/aaGsvAR7ktl1kaKoEBE2OT8IARBw1W8KMq4EwIntqI8yzmZXVQ
	tj04gzemTYanHBgzpj4ScKS6ium8HmyeoevXlpZKHSFK9Ct27T4KQVaj4/+1VvEe9
X-Gm-Gg: ASbGncvGtTk+GoSYY2uvPFjqfIGbA+6xOY4aU1MPDzi+TUXR5VrTW9tNhlQZjI0H8FZ
	XYc2YyEVBRFfU+rL7i1gTO0R+6FO4X0eJvl3yL4kdjn+6rXBt8ot6GXEgAoGi07jz1Yu0GNCkS1
	SrFOO4E+9gYNyCru4svxYJVtzsU7gBQusQF2oHRu8F1A0FulfKe09yJoQaNOye9+a4DDVpGdyjV
	5vcWQoA6GFXXk/4qnaMhSbEDOQQgY6eoemKmmMyFXE6ac/P2WvtiBnDCDgwChMSIM43DzSsyZCt
	IWfwcdev4KBUYll8oquFz63975PUx9Ddnl+rmC0Jlc6mdSdr7GEW5ovKnswz6vjyNmuIpihT33B
	qudzFQeazStkMPR/6ZlyFeZug
X-Received: by 2002:a05:620a:460a:b0:7c5:50cc:51b3 with SMTP id af79cd13be357-7c96072d7e3mr483414985a.33.1745603245181;
        Fri, 25 Apr 2025 10:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtWO3ZUcxDc/2klMeYlZoJrKhUFUwBPFBESBgrjTBIhVNl7tUqNE3ZLJF8IgE2UQDL/2QyLQ==
X-Received: by 2002:a05:620a:460a:b0:7c5:50cc:51b3 with SMTP id af79cd13be357-7c96072d7e3mr483411885a.33.1745603244862;
        Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:09 +0300
Subject: [PATCH v3 09/11] ARM: dts: qcom: apq8064: use new compatible for
 SFPB device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-9-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=euC9lx8IKVS/A4UdhCZ5+fvdurao8cR4qkRb3bHColg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbUyp12J3iMaDl11OPJ5HVt9azxGa85+/2j
 8p1wI4mC0OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1ZfKB/9/byvswDJiseb44Tt3uF9K4YrTdBCHtg254tQgElwLWqcU9hk5NvRAi8z2vKudgCBgBNx
 cg74FHwlrFHkxx5ai1CJfnMFWEYVz2tbHYNxCZQ5PhfYHRup7l8aHp4IGdjZ8aojWMM4EODrP7V
 MAGHgvmSpYadXcoIEzRRtaLw1S4b/64wDrdFchuqxFxRL3UL4d+74lgm+DUw4eIeAzN7AcYm1DR
 fpPb30O8zULpjxiuiXjmO7x7Xyghp/A7h+RbNE4KD1gjjUk7P1vegKFj1R6h9foCyujXQBjoP8x
 910Qvr8H9SqLd5sRuomxDw4y6g/FckzUURkLnhiHeVLUVVyR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5ZcJSXewkoOgtGdcKbHWl3RRtqeH8WJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX6+Lgp5Fa5rXn VjnAXqk+HQ+MrdZkjnWBxnv4PwSNjA0YcrzOlV9NMV5lgmw9oAnYOEqd/13Wwu5IWH9AGCydSMV Sr8rBZWzcXDQ2mtPaPcBGCjAS14rz/B3JLF4XsXD83rou6CpSvqD+iTgO3HeTxJCrnqW/PyvbV1
 l/XmdYDCChRLgs7zewaW8cIrM6sBcjifoDVi0FN9cb9Ji9y4tGqlHr141Fcw7bscCIMI4XdC39g 54gNzYSSP9q3L4eZ2Gffy8zCDT8WLNNKzTKXv2YslBM1KGzfLBlb4KLNCEs11tQrzUrjf54+zs9 t+PhM4nNdSgId3xCXkXh08oqjWkyO0hkshyFj1u/0jBoFD90XZx+WHyKc0tvn+gviKPaGYO7t5c
 RF++8p9gl6qfabHPvLI11AmbHv4CG6ZdHD91/ylTX0FaTtjChyYz9d1Pr0bseMmj2KLIoNCO
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bcaae cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vGl9qbW8TQSvOBFUlmcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5ZcJSXewkoOgtGdcKbHWl3RRtqeH8WJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=741 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

Use new SoC-specific compatible for the SFPB device node in addition to
the "syscon" compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 41f8dcde20819b3134c38dcb3e45b9e5cc24920f..a5aad4f145dd368aabed44cf520ffc037018b37e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -1086,7 +1086,7 @@ opp-27000000 {
 		};
 
 		mmss_sfpb: syscon@5700000 {
-			compatible = "syscon";
+			compatible = "qcom,apq8064-mmss-sfpb", "syscon";
 			reg = <0x5700000 0x70>;
 		};
 

-- 
2.39.5


