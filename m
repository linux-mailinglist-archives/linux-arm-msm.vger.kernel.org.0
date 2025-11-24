Return-Path: <linux-arm-msm+bounces-83020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC6C7F9B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 192593420F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47D22F6199;
	Mon, 24 Nov 2025 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFS7pZLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dg3VjkK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5912F6180
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976368; cv=none; b=trFAq+ZFEqTIFlfffgL2C4aqjJMHLp00lZuDnqQEhY2ExnkXSahttO7utVw6372xteH6kTnbKcNlGAVvdf0/RDL6SXciYfEAg2n1547GY5+hRghf/507z0Eh6NzbRS4AwimQw6h/glO6kstZNw6S+VI3y8KyMH5iF8OGC/lVbFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976368; c=relaxed/simple;
	bh=KIt7cKlQquEmvY5GS2dgaXPwRrPEqcNU02JL+ydYRg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZOgy77k/wCzwI7N77Pgu0v5Q5za1ju9vFOtbEqcQAKj/Watomk5fWpM7fJqf59bKAyR3kaaz/EqdxPDseWejlrmaAuQd7sQgXpN1VDcKhvmF/YRxXqB/Y0a6Ir1l3XHun04N2GAMr39nvaLnPMw+MWQOAnCY8AxYBZEzuLOS8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFS7pZLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dg3VjkK7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8Al7K2553990
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fc72aMPe1pxy+zOo3oPtGgyEEAaW+XipnNwxwb3E7WA=; b=TFS7pZLfhWi9m4OP
	qPxPiDC9CM9hvurraN+kFg8sAnyfZk4J2SbXDfBiT/qy34PCPt1UkahJUD9JwPo2
	jBKSBLAp41Rdl86s8TW3i6yLNeP0zDKk4ueAlv7jwqHjm1rb/pH+xb+3R5ShlM/s
	mDYX7YEo5bmEncV4siUd3yfm8dqTpsCvoF1c42fZ1fmPib1dBSWSU2BuME2JIcdh
	y7zi43DiTB+OqY7/WfOWp4+5Ew7BrbhPDnl6O9WaweYfVgfq80/3S7c9JHeSV6sE
	pn/OsIcogRGgDTt1BSo5/cKyAblOOq2nMSZXPXDw4t19rkyuGuoUvqR7AJle3JeW
	0WoE2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdvd24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f3710070so102075185ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763976364; x=1764581164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fc72aMPe1pxy+zOo3oPtGgyEEAaW+XipnNwxwb3E7WA=;
        b=dg3VjkK7dDKq5fvEa7+3w9EFW+iaBECIXmTWj3J0vrM7zrkst6lN68XSTYSWRMFjcs
         jqaOjqVpYxqHmJ3tXVXAT/M5MZ5Bp+M+4AxRw/1kYYpkm4YqAjat3DkfNCojKgQWi3W6
         nNXrYKRCS7WSQ5z07jEfY2+qFaIuSHsakAOGeengjxtvFh3mAorWYVIC0ijDNyXGZF7G
         QKxPFTesJrTDDvLEvxH1wCBC2NaUh04H7eOzc3Ci16B8/XHIHGo+XzyYBQVZRnZxokEV
         ZAaEwtcscMstXqR4mVohrL3+/9Kw4jrNfTns9LSrmUoh4nsxs/7qEQfegU9MEDxjRwDi
         tV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976364; x=1764581164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fc72aMPe1pxy+zOo3oPtGgyEEAaW+XipnNwxwb3E7WA=;
        b=PYNNcSNz4uyrUgFm4ksmD6ZPVyZXWfWJlSbWcsoSpReLL68dQWJBisKjNKqrTdER8Z
         WH1sSDB30oTObq4L9Ck/6z4o8R2tVfFRvUr+JrQ550jOCAsG9oLd1fmNmJk5ywQUGetV
         igJ4Yn1S/o8y4TysRmHQkzAWsajxWWySULHZ9XxHVqMYY7B9g1TzmulfKreBx0qAl0S5
         spsdYXZK/JTzvxXJbBoo1xr4Bq6af+DBTtS1SjXuW3KU51xcbiC93lnh950EnGA1jQGG
         5BkDsnlTPkzIQtffC43gKnfh/ff6OyMgsW0gUN1oYriqHi5+gEZePC2fPEVlRRjDtYcx
         4VvA==
X-Gm-Message-State: AOJu0YwvctQaMMqBUpnfFNGxapb61Hdd9NmnqkbhsMlUPvZI3hhH5yrI
	SvEJ3Oh+klsvdQBRT1Or+vrF02BYhra7jnrEKJtL4y3eO/vtmXvr/cowwb9ENU9yaL8eNAeCFwQ
	inulwV8ZyiQbHULaqnJB0ZoulFKQfUy1HCI0XhHrQQHQwjo9Rbmziveh/vR1cSj/wD+oH
X-Gm-Gg: ASbGncuu3N4PZ/EPN3g6h7aaXMdIOoH+loQtswWzcfFeeYfhfFJzpFqSugqG2DM21zi
	KIE7ixgtzvTfsijj9G91DaNO9ZGycNe+cfVn+0pMj2PgN/SIdozlC3kpS1spmQ8dDZxQBcYF6bc
	AEYISgjDrCvf0s70YPhPHStUARMj8AqwZsO0jeF4FGJCrbE+LY46qQhLzj3G97ftOR6lt8SgNkR
	Ar+XGRZHPloX4CsyTRU0sbzh77IATvjTdsr5De6/b/fOvlc9ST4D0ph/fYxqZQ3IkPoOgPVwfDE
	WQIhJvTomKPiE4abA8FpflPUF8eer5oMiXzC2IfuqOvaSgC+1Hn98zcTmCttzNPKWoZkfSXNWFr
	ucUqrd3Q/PHjL2bj2smjmrHG6P0upPfz8URttiiY=
X-Received: by 2002:a17:903:3846:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29b6c6cf858mr142118195ad.54.1763976364463;
        Mon, 24 Nov 2025 01:26:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbgvv8hzybcga9wXoqKjj6h2p4mJQqNVWnriumOikqTQS2SJlOkP51W9klkaoWO62j7hIudA==
X-Received: by 2002:a17:903:3846:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29b6c6cf858mr142117855ad.54.1763976363980;
        Mon, 24 Nov 2025 01:26:03 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b1c2sm128444675ad.81.2025.11.24.01.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:26:03 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:55:18 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: lemans-evk: add additional SerDes
 PHY regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-sgmiieth_serdes_regulator-v1-2-73ae8f9cbe2a@oss.qualcomm.com>
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976350; l=741;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=KIt7cKlQquEmvY5GS2dgaXPwRrPEqcNU02JL+ydYRg0=;
 b=yP1lab+7XgMxoStk7b6HB0mteD3ztBJY357LBXaWxzb7WSzWw/ckisd8NHgcsqyT+79YU2QIT
 W/AQ+vidgArCEsew6C95kx9zrErnbgpHYml4BteIhRVx5Xwud0NP1q9
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=692424ad cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pcfEnxZvWeWI-8Hz2sgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bOPsA44eaaAyumR2YQnKMUypntjEEnPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4MiBTYWx0ZWRfX7oKOtbRLugvq
 mI1yk7jP9JXeDSX0f2nNhcD2EI2oYG3hj9WaXfcxGvDEZ8P29Wg53Qbvm3ioK8L8Tx64gORpEb5
 wBnIk1aSAgRLTCdoVsW+pJnECrQk/PsdrpyS61W2phY2ny0Di8gmSEGHYqaPWlQBUnOT4GL0WHU
 upVMK8Ls3I0uZjMlwD9BhsWs/qtAZHGYuT/WAmX+O/DGfwH0UyyRMPQ8dqypSRqy6emOnVlXBOd
 Atg0EgBniElZEwfejpUO48JaQ/0JlJBdm2YsAsK3mJhkkXd0VBskO/jxq6YOF7XZpl0Eb7XkX5E
 wYFESsRCKmd5ViYJmQ/0mBsyHa3IjB2ZAeD4fs7qfl9j7pKw4VS3d0qO3kZtTWLjE3Zmo99Gb7g
 PZzUqFi3YF1IrdfZTt/bD5ezl+DpHA==
X-Proofpoint-GUID: bOPsA44eaaAyumR2YQnKMUypntjEEnPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240082

Add the additional 0.9V regulator for the Qualcomm SerDes PHY.

Fixes: 71ee90ed1756 ("arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2f080f501140fd1c68b72d797fd00..7e5069101f093d077eed867f8431ba0d01797f4e 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -675,6 +675,7 @@ &sdhc {
 
 &serdes0 {
 	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
 
 	status = "okay";
 };

-- 
2.34.1


