Return-Path: <linux-arm-msm+bounces-78290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D305BFAF1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0DAB1894ADB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9EB30FC06;
	Wed, 22 Oct 2025 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZNZOoHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E4430E83E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761122474; cv=none; b=qXJPae0Jm+oYo5iLu9kNey5UBL7hcbovjY2uhM2bi52X+HEK07Bc4I7Mxc/O/t/7UF1R5GsbD8gXEqpIDoz37UVgA7vdzeVjzqlayH+R/4S7E52HTwApKaVCmQiFV/S1EbC1fWPzGMsTh6cXd7rTR+5kQ58qq/AK02mi3DEaBrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761122474; c=relaxed/simple;
	bh=9BgvtBVuYVEHbYuUn9h0z13dBPpwUOv1H4ZyhEvT1a4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tOXSP+Hwnor7VxDJwE15KEQAbtgIOqRV+IW/dN+6bBko4I1TmMVt87EknvHTBpsYhI/1T4OG8UDUsl70tKy77oaWrfhGwb2PTKbXJO0RJPRTGCmn3UpSnTwxEbYz1qUnatJ0Q3JcLVKGUtG+5rMOz3Z7G1evjESnCtrIhCBOGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZNZOoHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M49Rt6025592
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rcpnIe2kQH6
	oAlRh1j5LimFvmkLzzm7Un7fgpZ7DvBk=; b=jZNZOoHj498Zlp0ZrBGag+CChZY
	LbAVnLtR890JgX2sNrXyxnd7npCQ8xYDpWE7iBHCOkGdeUx5QEzVdHp4w9UHx28d
	GcwN33i7dJY8UnkFez55r4SSicapJbc4AKNkWyMVACaS7jUsYGV3IMRvb1KIzgXV
	UDrpb/heqlbbeI0T1rJAvO3s1c3VPwZZRzYYQtmSIHI/mIaKnO0LX2XTu4kvOEN3
	TtzRVet75XkK7irDyX/ZCxZ/Outhl0ZIhk4cLiSleDYGsXcPX/Eu8AutLHItldF7
	sPgJnHa9Vir5OtjB0Z6eqFbKUOqdffGbbvk7IV0cGRGxEJYTOGMqCqoGesA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w83yyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33dadf7c5c0so908159a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 01:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122470; x=1761727270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcpnIe2kQH6oAlRh1j5LimFvmkLzzm7Un7fgpZ7DvBk=;
        b=FoCrvD/QqEZdddlv78t4BFDlA0GalE7YQ0yZnEf505FGlTIo/HgATuEMg/ZcxToPo3
         c9OpIenBt/E03u5uAeKgbDyVGWVKRHlTm7csaHvEzeP6VPkH4CqsSOZWqJRlks6Z6h8V
         o4nyT9QIMBkxGXKjUkjNtvWgXjWcuUGEQjcMFMM/v8h4Vkq0I0aSJvsDWQc16xi+2gKr
         mT2chBT6y2hlE4CtMMOW3a15RC93035e/f1I4ZuobVc6UmwahjlwfQrB5o32juTulsup
         7isMn6YR2zjTFGG77cLHsAJM76cwwotTpIeCsidXTao+pjmL93goLAa75ATI9qfxZzV5
         CjQQ==
X-Gm-Message-State: AOJu0YybARc/Q7m4RwlD/xpJmwkHf5n9sq5YvqfrQvR+HJF4Tpcm6kOE
	WBbGW9zQlwwdlhf14NWivk6M9Y5+5pDztHtDQKoTJZK36xdoOia9ep7lyf/8hoLXuNLqI8fykRU
	wU+5+fkGrKxH0YNPj9VsEUthET1VeEhtJp2pSfcWbDx7+gnOpZxNxXYvVb02HikJtCbXr
X-Gm-Gg: ASbGncssuNwmfmWt6KwmId1Q5+ZYfCpctikicjiTYfyHWBpxGutciyIFOf4eze8nS6t
	/vQhNTwu/TNWLzr5l/cf0XDoGF6cBrbW6CW1Ekwg2ccVO13VOqOlOUtwA0IaPNoZp9Vme7JXAmX
	HDLJAYQEkTBkQnfnic+ogKIUacU+M6gElJI5/dXiqtM78n4FzUzJadqaMWTDF1QfXqQppVZ3ZPr
	hmYjpue9t5Z1MWbCNtgfUByTX6MJV5e/kWVM0dzAaRbXlycvgddqlH96mso+15WXxgEsKc2QLx/
	CepHO7Grvi5s0pQrYvSEqGU6fe7RrSgcZWypq15ufzWLTl2casP+lYMfZ/AMtGqICPS+WvWvcpb
	MuZyo6w2lQHd8ZpKcF2p9OZGxQtWKlysgC0Uj
X-Received: by 2002:a17:90b:1f88:b0:32e:11cc:d17a with SMTP id 98e67ed59e1d1-33e905ddd23mr885290a91.4.1761122470316;
        Wed, 22 Oct 2025 01:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYgk7dPlHO1B8hexkjytvuREV5Mqakcse5L2rTllD23cI/RCXl9woZIjksBiokxdnCxS/O0w==
X-Received: by 2002:a17:90b:1f88:b0:32e:11cc:d17a with SMTP id 98e67ed59e1d1-33e905ddd23mr885264a91.4.1761122469843;
        Wed, 22 Oct 2025 01:41:09 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a25e9be9f3sm3740317b3a.71.2025.10.22.01.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:41:09 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v8 2/3] arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
Date: Wed, 22 Oct 2025 14:10:51 +0530
Message-Id: <20251022084052.218043-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com>
References: <20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX2e87qGiOWqov
 GvBnTx+x9+KouZ7X8/KppMHy/3l5K/vw5OO3Stx3xVOWENn3Am6Ye6sZg8W3o1VXeX/XPxnEfE/
 dm3ZpkIyBkk8I5qXuxsQbnHuUhvgUBv6CVPzskkMyPfzQOZezyezBpIWLDq4KS86wE8z4k09RSl
 9IbvRiSrPOkyHtg/smWqUYiIJ4YGwRLvVE08Fcu58Zl0YwHDx0oe5tEb6K+T5kHuo0nBDKLcvGq
 L+G+rOgCytfY6W9aUDbXRMFVon4luBJySMINaDrVotXQ/qJM8CMWeIbSEqSIhl6jvHMYbcss5lo
 4LtwInysPfpA5fV10v69UmBnw7eqjsh5b4fe0M2s9HowjedlSX5FGt6+bmQIrDMu2I7I4O+GMGU
 fIOLdCYvaduFEp3kh2To3zZj5XePUQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f898a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Tsvuh88POXG944tnl6EA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: si5p62Z_5AGS06e1cPxYOt9PtjX03u0R
X-Proofpoint-ORIG-GUID: si5p62Z_5AGS06e1cPxYOt9PtjX03u0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
[Konrad: Suggestion to flatten DT]
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3bbb53b7c71f..1b526d96fba8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1200,3 +1200,25 @@ &ufs_mem_hc {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};
-- 
2.34.1


