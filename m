Return-Path: <linux-arm-msm+bounces-88122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F071FD04F38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59E2B3051680
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 17:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8E9296BA5;
	Thu,  8 Jan 2026 17:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLh3nfGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcjvgTVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3E28C006
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 17:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891961; cv=none; b=US2XUsSb5YW1k3La3VKRphCmbhER9FInKC7rl5+QguGfctENJgrJVUTZb83TIOuPju4ARGrDCrI5+FUU4vL6P2H/Y9vpyEOhOG+wDQD1uVE8gMm9/0UxkavpzLSeL5QFmllh6CYOH5GxR1Qp9pEu1pHWao6xUHgnwxLLvFqFJrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891961; c=relaxed/simple;
	bh=auxVtD5eJox3nwV8AvyyNZXSmGFl20GvmUH1Rk25HHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G1jgS9nwtNu5x9rX+HXD2ua838FT6vARmUE80wo0X+uW6bnxzXVNsbwwIc7gmfb8X3yQZiAow6b5m+WIQjVo/ADnZlgCNJQv7doGZTnN2l9hMzrTfteqrh8oWzppRGve4w7W97vxPdwxWkp+3rd59lSMsjIWmb7m62tp1DYus44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLh3nfGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcjvgTVw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608FR1Vw1258456
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 17:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oXtaa8lSRtD
	pg64WUKXPHUqHxomSPoDZGQ1io+HIie4=; b=CLh3nfGKvpTFVwAcloYTdGh0ZLy
	FQMIqRrFv30Ir+wwAptCAK60GIfNXQGOBneaXbpmvk8UhFgKVggmiueIPl1pew+/
	aGJCpDwHL4i5dcdke6mhzG8BYjqikN9zFQcgcbmui5fEUt2XGW3mrdMmAGvD6mBL
	C7+PndL3ulfcIZw/P2PFoUX/ddES7pZyrFdfz7x8LPNJl+M9U+nZViqdsHn5WZiB
	wTS+Owg5nBEfCxPrguwLBhgVm6JRBzvBXvsafdfMzQjiBwXXRzdZVE7tZtb5tk6z
	cPHu2X2muskkF9QfpNg9/VzF2svzgBD7pBuIZJStxbPt8QOqmZdVug5EAig==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj86gssra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 17:05:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5634817781dso1546926e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767891957; x=1768496757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXtaa8lSRtDpg64WUKXPHUqHxomSPoDZGQ1io+HIie4=;
        b=UcjvgTVwPLrl86R/euR2hgc5Iw8MaryMlJRnbISNe/z3nYIIR9WMfMA/Ov4Iz8jnyK
         arKgqI/ABlCI7ODSaX9P8ZGmBCXYwK/5+/Ci4oMvuB23irYQDuASQ4mEJaBPol5z+HIF
         xgHBoz5QN+PfMuOQUpm2U6zsy5DNLU10CQmzH2hlxaURGOixDeYI9ndgH9jHIPnT2gc8
         y5T3+Z+AKOIYIN5nsRpcbG6u7821wG09dx3lu0z4qq01SIOp12mlPq6W4nvWNYuPcljM
         /Ofo6FW4SwyFiVdHN74iFUc+db6PQ0AqTwlmluDSu089Ule6OTjLRbth97WObcBjNlZo
         LGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891957; x=1768496757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXtaa8lSRtDpg64WUKXPHUqHxomSPoDZGQ1io+HIie4=;
        b=dsDTo6qZugfarEoXSl/Gvmg7J0KFVXBwGWwNOQT9NYafwwCX7GEZdShHWOvh4zNqHV
         Kwlyx6d19KoAtazHBAOiyHm34bgeMlI1mfy0vQDFSLC2A0C9S/zitGmLeXJh1UoYeKbj
         9hlj2gFKQky30e9y00lCTryC2rbnGRxMAwr/OHsnVQ1xHlQ0Lka2cZJNszBxcAFPJm4P
         jAGAbhFbQFco6xlqSa4MvMwiwHomqULgY7pZUacb/spjwgsalZLeVU+4nZu27wfSCPHr
         Y2fELVDx7062SUe+Mj6YFgCcOvM4NqLwzdhGdNaQdcUtI2q5ED1PdlYE+cNQ0pAJCQ5y
         /l1w==
X-Forwarded-Encrypted: i=1; AJvYcCW61Rs6NnHLhcfabzSrw2MbwRw+u3dYuIPZLsAz8kEyx4kDph6ob8u+MYOWUpHW3jt4NyZX3AWjFsKnQR+U@vger.kernel.org
X-Gm-Message-State: AOJu0YxShG7Oy1Q1pen9kXKwiX8y9GTDh799omJjdQF/Qmh2OlQephr2
	t8dWX13fpALKzr3mr4AdoYKq/e89RQukTG3JJZyl4XR1mVWNL9pNZ7MaIzdi7xPODvYXgDJX25U
	otQLsJp4VGOZ+UGieREVvaT+aXYsVXxVPfJDC8qtLtayqKAHS0RiOQkShnfbWkTPU4TDq
X-Gm-Gg: AY/fxX5KHNq9eCZvIMPZ1ZIS6WUzm3Qffv6F+9JT2FeYxhiWkxYmxXvXzJlul85oPWa
	it5XuDkHUHV1FuAAPt/HUxC4mlHKRIyswu4C8ypMk1RGhh3arPd9/mGypzkUV/LoJgpA+BXn5nO
	tN0eEk92lf809U0ptzQraPgVsx4bjVQsfkx38PInXekfDBkFPgPMbH7lr81fJv1WZg3bQScXvw0
	qtc/BWAKyn1xFa6I77w9HRUbW1Xgnozw4JsMyUFamVNMpliljJxAGXX4gvFtbzWD7UxbsDHjy9o
	lVpillbM8bgEMR8jpIty/oXrD/itGixcmua8DhV7tJxZcxJlpjRNWgY3jgbyo3+qFmgnqQEO/fB
	95cVzDH37YzH08Ktt0vW9n4Z057+QrIiFQKVPhliVQ+OXR15PT0UQjs56e0cT5eRp5/PQWe3HHv
	vD
X-Received: by 2002:a05:6122:208a:b0:55b:305b:4e45 with SMTP id 71dfb90a1353d-56347fddcbemr2294729e0c.17.1767891956812;
        Thu, 08 Jan 2026 09:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFryKTqX+VIKJZcVqmhSuDk5berk+HeToYMW6qymtmzRU0Q6B3iv78NM24/sjQMr3jxQN4Gnw==
X-Received: by 2002:a05:6122:208a:b0:55b:305b:4e45 with SMTP id 71dfb90a1353d-56347fddcbemr2294656e0c.17.1767891956073;
        Thu, 08 Jan 2026 09:05:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2cffb3sm856373466b.31.2026.01.08.09.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 09:05:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 1/3] arm64: dts: qcom: qcm2290: Add pin configuration for mclks
Date: Thu,  8 Jan 2026 18:05:48 +0100
Message-Id: <20260108170550.359968-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
References: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZNjaWH7b c=1 sm=1 tr=0 ts=695fe3f5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=mFalZiSrbaSKzsF1NWIA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: wm00tsvfDTIuc5CIixFDeQTDvepM9ftL
X-Proofpoint-GUID: wm00tsvfDTIuc5CIixFDeQTDvepM9ftL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyNiBTYWx0ZWRfXw7rvJTKrBiMW
 9pLWmrSwsLZai1skiRTdzvEG0Z2+8PGNDoBTE39qXn7U3HkHqgxTYM4SKwJ/3fPuHAfzbPgGJGz
 O/x7uYIdh0U+tTEKTog3fGdQcyrvjvU+i0ckz0wxmOrSzYafMeHYgZ3RIBkDC3x1NOB7BYdPl/C
 ZeiEx3jmgKApifE4YRN0iHtzFzTWIiUWJ4ZeDoPpwfFl6PjhO0UmQMfLOFYApYp6mVhU+iOebd6
 W7jdCGxnKQopCIpmXR6yNgqjoLCXeWEi0VkwYwqechK47RSugHgIhjeicZ+YQpFXV9Qaq+Fdy5n
 PBoqQBO48w3JAYaPnguwvgy2DaFosn/BbU7nttSwgFuS6I9r5WEuoDnBzGJr4L6uPtQUVPSz76i
 USXarfOW1VIjp5AWLuk+zHvnnMOAYzvfU/aCN4crhUiVbLf6QxHPdl7p/WyLxdstClqBfcR7uBs
 nYj052OxeLmI7MbzRng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080126

Add pinctrl configuration for the four available camera master clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 992a157c571f..7815ece261ea 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -604,6 +604,34 @@ cci1_default: cci1-default-state {
 				bias-disable;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio20";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio21";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio27";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
-- 
2.34.1


