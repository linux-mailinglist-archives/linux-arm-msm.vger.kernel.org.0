Return-Path: <linux-arm-msm+bounces-65695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4FB0A8A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45EA47A27C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE8F2E6D13;
	Fri, 18 Jul 2025 16:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBFccEd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F12EEDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856948; cv=none; b=WVCm+4lDzlHXSd4xN+/YrdvIkiL+gaLGpznjUw50fT++TWAEkqX/BU18C4RClh1Yuq3cWM1y6LWXu37j8Co7QnYVTwgt6PHZuh06Ku0vH56RooavLI3gUFqHvh3Jgi7CjKQnhAHX4JQblYVAJ6VVItMjKLDex5vY+++57LqzseQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856948; c=relaxed/simple;
	bh=GS8W5OKhX5k/3MQCghSpRV/kbVATVCRf5/YkEeA5moE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwO8tG/Yz9+7kjMTxdI7+5ppXQUVUBRTt1tX/qUUoRvUF1VNSF1YiDBRGZ1sOAoVNfYXIier0BuB8MQm+7LHeXZd4aPysGek9h5QOWjNYFW18izaDddRCNG2PYlcN0blntjzO9Z93JqpAXUTL1HW3kZHjZLhEuNfY4AVKPLS1GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBFccEd4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG8Sp5022222
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MegsDezoJ79tZFpGw1Q8AeYWxrjPn3HT2ydHvhFydU=; b=pBFccEd4Wx/lh3Bx
	0baDdpJrAVlSPbsVtEeTH7+PXy100+0rEt/+u1MKhY33ccl0/7NSMXBoGblR/ZPw
	S35ODjNp1M+nxORrVKJxGpY3U+LqsQtU7TPH1ICKHFPwHTszqrgU6QPX9J4COuXR
	7KVPc3CH98nvAWGAvY6lwzsGZ8gicCBIBNLLO3w0sERs/c3MEWkb7zqHIv3bosvE
	eD8qRavQ9U8Oeh5xuL3rCz0Q+95zR6o6faiMuXUR4lppSAoXZlqvdk0tgKkfBV5F
	o4rc6JSQcCOOzE9Hrq2zk33sG5KA7AsMSyQswbuLk3D4QPLtmdFUyU4XgDX/+oEj
	QX7vYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyca73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:42:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e269587d8eso394535685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856945; x=1753461745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MegsDezoJ79tZFpGw1Q8AeYWxrjPn3HT2ydHvhFydU=;
        b=Hp2YbbwuqhfEd5SGyfSJXG+iq5dYU61+8xl0CWZVcG440tXgjPjk+BsEe5IvBNoSzX
         uSAEHP9dAOzTL4FlqC37BS5G8sY0qHCXpCarxfwv0nbOIKAdmqPWC6L7k39jrA5wf1kB
         u4lFRxqnsgBJpzXClQsNZj1r88uXRW9nZ3wh+0+eqdXtAromk2CHKQ4DzLkzOuv6nK4E
         gZM+dnXBIMRhk+AIRtZWYrS88eTdvxj5HoVb8MCrdpBeU6PLkHw/+02sg7vt5QQZJdct
         kH8ahF+SJEb5sxoII1uGG4MUsiSt8iQ4JSPWfK0hdTHowYHZaIqGctAKqwiHAWyautPD
         FXnA==
X-Gm-Message-State: AOJu0YznrtfTeTEBFu8iI8GY+FIVTc9WV78BlzXeF0Ryb5x8YZhzvtSH
	evE2xENId2uUydzZq/q99FuHTjB28laRRFTmeMPoORbOiZA5c0L7OnGjswXz2Qe2kJi+DFswA/c
	OJshnnu0mduUT0o4zdsVMndIK6eJ+PHsKVSgQVwVz7SA469VCBvSZ8c2Y9mZgnesmH//srJMVoz
	Tu
X-Gm-Gg: ASbGncsd2aepR2rRnRI56m892+y7G8YuvN5T2I9Q2sJCEhFue8YadbsJeVL6OsGEBlp
	0THNRsWmLiGGeULBE0XR83sriQs4BxPv42RtHwMsBWPdr1y94m8955hbzZY6P3cfCad3goabPc6
	w4bsmG6+s+9eKrwqHzlGK4fmHqMHbXS2gxOZMZNjHhdBcBbhyZgKDi/XUqA5Xfyb/gRqQcWPxJP
	PPhUY/wKTGL1+VyA3T4XeYZEs3UR+7UT3Egfxk+Ux3hgQ2gVQ2s20ZbLcL/UzeWIyLTxzcnbiKP
	pbXujPJ52CfoumQlQSBRrGO7zYpoCLzSySIfBw9w3UZk1bWCCtnBsAdZug1gjNGm1x9b8rZaWMA
	QPT+AI/uVjJ8gGM8qolVR++qLFIh/8JQhl6YDi04uICKvIdQ0cG5C
X-Received: by 2002:a05:620a:1357:b0:7e3:3e32:e620 with SMTP id af79cd13be357-7e34d9ab6c0mr981680985a.36.1752855236354;
        Fri, 18 Jul 2025 09:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEETTxoYHaMo2UupceBlHL0TBQW5LinpfSukvtJjEUlWPT/+Pekf+q78KOdNgHFAAMem1ZIkA==
X-Received: by 2002:a05:620a:1357:b0:7e3:3e32:e620 with SMTP id af79cd13be357-7e34d9ab6c0mr981675285a.36.1752855235755;
        Fri, 18 Jul 2025 09:13:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1ab7sm2388131fa.50.2025.07.18.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:13:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:13:44 +0300
Subject: [PATCH 6/8] ARM: dts: qcom: dts: switch to RPMPD_* indices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-rework-rpmhpd-rpmpd-v1-6-eedca108e540@oss.qualcomm.com>
References: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
In-Reply-To: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GS8W5OKhX5k/3MQCghSpRV/kbVATVCRf5/YkEeA5moE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoenK3f9gT0zERUZec9/hsBUQ1qPK6ZuGLIOve3
 S3naw0SXUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpytwAKCRCLPIo+Aiko
 1djfB/sFx/Qa/dlaCqhOszPGddW0LxXnXaDbnVtsqUwKL5xI0ckxf/GOxTrGWqrY6/FILTdFH5h
 oTXojXp6+aH0hpFTkkuE8VbllnDMSMfyL1nd5e+JfiPCrVdyDhmCh4C0CtkJlY+Hhj9algdfCIw
 VeuKF8rlqI4NqBXqaVrxfshNf9ZJQNNjMnS65dw+gk43Hi5gyHSvW84+Fq+IO9glI5JGyGxuv+o
 aj/WTob6RDLb7elEQY3tjCnqRaRjPbbjMI+JsAc8SPC2whki3e0chNnC7+ylne/j7Wg28LsE5gY
 zCWfNlRACRkqr/apeWH7J0kXYp14+E7m5d0DguYjMEq/myqE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMSBTYWx0ZWRfXxFzMyvcm/VT0
 tVmmUbu7GgdBvhjUeW28aqRALk0uN03q+60nUB9cEIv0VfaxL1PhT6GsSshVT8tdwnultP99vop
 /BwFXTee2837gk/xFqaKWuJONoFgrHabp/BlGtkEBRGjc75IuBrCCCXvWqgf7uYzV9IZ2Ha3UAx
 Rs18hZaGf2W50qr57ilizHUfJsux3GRcG+qWtfZ0F4vONXFwPs5HHuQeDZUskRAVbOnZ3FO6Of/
 A9//gbGedjSiRUjhPO32VPCuTsGzOkkVTOTRvEncGQtknSmSYnhENJn2imX7CjZpT+eqVJ1q99r
 Z9LlplECa0zD9S6HuRqyhQgEdslxE2lJsg1Gh39HtxpBzEJ8zPueOib9TSiqFNV36hDjJzq81Z0
 5258CkSNIWr8ck5H7CvDZJ51g09tQlWvluF798ZxKCXA9Xb8CyyagfCQ1t7gAlqozIzQWrm+
X-Proofpoint-GUID: LrXhqhSYM_zwxDhpdR4OcHG8uNld3faK
X-Proofpoint-ORIG-GUID: LrXhqhSYM_zwxDhpdR4OcHG8uNld3faK
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a7972 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=AJhAjMZ01lUAXvDxW_0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=934 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180131

Use generic RPMPD_* defines for power domain instead of using
platform-specific defines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 51a7a3fb36d88eeb8dbccefbab672aceb1e46428..bcf14a3b13a1b4b3455ef4069df2f3d9c5c7f9ff 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -959,7 +959,7 @@ modem: remoteproc@fc880000 {
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";
 
-			power-domains = <&rpmpd MSM8226_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			power-domain-names = "cx";
 
 			qcom,ext-bhs-reg = <&tcsr_regs_1 0x194>;
@@ -1372,7 +1372,7 @@ adsp: remoteproc@fe200000 {
 					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
-			power-domains = <&rpmpd MSM8226_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			power-domain-names = "cx";
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;

-- 
2.39.5


