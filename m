Return-Path: <linux-arm-msm+bounces-78723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED6C05AD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 12:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4741A65F42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06E231352E;
	Fri, 24 Oct 2025 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V41pqSPV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C613112DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303036; cv=none; b=GfzFE4amqVXTuI0L3+Km6yU1bNl45vY+EqQ6UOsY7XOJEy1n/wsUeNVas06b8JLEBxwgdjMrFxyQKMJIDlKT7YW/HDfIfDIBqV2nDMCXIJyvyW7OXJtt04tRVhuHpDteV4A8zeFrrC1M8RisR/36mbNYs1lPU4A4D3M/J+pKLPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303036; c=relaxed/simple;
	bh=qu/qZ84NtOyTE2o65+l21YiQTuV5u82Zwl1GWs6QyCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xeb6jl/3gbjVDR1MP+MkJl+WJpWUwSR27GtZk7wNcPrM44vh8T+3JcTLKeSmju/aYiNrcZ/xTzpg7/dMe8DePib8hdh+8NYO/XvFhAj81l6zZmoJepEIO9HdxKIjWZbTKiepDlRH/8mEabM88rNRJ+GH5FqIdy4XGTe6WZmQ3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V41pqSPV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FVcu014995
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i/X+r8xYyGm
	fOqiALmId+62Iz9MHQaRcdFd88kOBYm4=; b=V41pqSPVKaXoXjtMlp0T1cYq4xz
	VXb5tk5ZvtqRmtMiHZ3hxVm9/+anfq+CS2hDGqmKfkYDctWuNVYdDYdaMNHj5mtG
	sEr95BZgVStmw6TQaQtBrPO5kp79QnHmtRfF6fHjRX9Xe6KOGGmwka4Go/1CefEC
	EGS1bSq0as+ZOOXsEP58OyVgW+b+LKYKu7gvWsLmGcyykWpIfYEzgb7kV+CCw9mg
	vU+g39laIzGrvDgZ2023l1kTiqHMrMwC9JtbDy+4Yg2wHO+ktfQaU4gn5oAmDT7+
	OxIkdEfwAGSqSjB15WnupD5l1SeswbGVcGApC/mVcpfc/OEVKx9GmwO8rLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pv040-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290ab8f5af6so12968105ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761303033; x=1761907833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/X+r8xYyGmfOqiALmId+62Iz9MHQaRcdFd88kOBYm4=;
        b=S0r+1SA0oxAHuA9eaJXlzBlDyJGvTKfKLFgRM/IGQwUj7kuLRCdHcs3vfoEnCAkEu2
         symd5i6NUg9HwTVFo15P4APX9cegJ55RThWsPclvNC+IxCqgfzgTeq9F+lMv6XlDEi0U
         FWkFkVlv8/Ip83TvjxNApI0XdD9jPwxV8qUVhb6uqpmFEf+8PKC0mcDTxhP1u1h8st/+
         k3qSFGvD1RkolrVk9FxYGnmhGKqmEB3xQVPV9t9R+D6lXFF9qqGzRsfv2Wtnj+4BnN0y
         Kt8EZUwNM9KXZUXCe3cq+tJ7d/RGKoV6b9OOBH5+moTD/bj0wSBm9Nl6GIyV3MZLebiw
         B1pA==
X-Gm-Message-State: AOJu0YyBTetBsoQUxmJilDGM1zx4dSSnsaXmrNW/taWYREPTA89V+QsX
	qHmUiuNKstCUhuFEw9CjI0WhJkm1kdxvgy+RyZVlMFVB81506u4LG2nDssV7VZaGBiK0PfjLsL/
	OHeUfMWkQ4U7BBPLOdPiSKrtmxyyo4ggTJXcnQnhgWvCW+CfwnUFR1aePIkeCkIkFM4bg
X-Gm-Gg: ASbGncsCyMeXWqKOwej5+3447QznOrpo6Hkdopi0+5vtX9AQrvTFU7z+lQ4+ewrjpzx
	xp63FwaAuogLaTK4Sk5M6c/glXYWymhAhnyMe9barXikrxFISC7vlpfYEWKdxyVL2AsTBoeE2ME
	h8GiaanbN8H71L2le378GHAi/zp5iiv+1W4i5m7A/nKvVhY7POEcwxmGb8rB0+ICNRdOryHAFDU
	KlSxCCPVwTyNk6dAkUIswU7vZ9LU1uCDVVwXBUR9qIZBbZXlIt0YwUEjOxHqqFA4yFeGFYkjls8
	6FG9Hvb/Jqu+rke/l6Tsep8eENFiZxK/+DqvGY2GhJlRkVKdnT5lgeBFQkU1hl6HttHJuF3hIqG
	Ta5UlW37+Y6DFEwyO1EJgZhcKdzWs3xIStFtx
X-Received: by 2002:a17:902:c942:b0:290:ad79:c613 with SMTP id d9443c01a7336-2948ba3eba5mr25935325ad.47.1761303032567;
        Fri, 24 Oct 2025 03:50:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtXYlwjMr6Gvf1ckzMeyuRRuHXM2bM6pczkChDOcs3/EJcn5nHuQCPbO1tRPn0r707vCS2zg==
X-Received: by 2002:a17:902:c942:b0:290:ad79:c613 with SMTP id d9443c01a7336-2948ba3eba5mr25935035ad.47.1761303032135;
        Fri, 24 Oct 2025 03:50:32 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm51236775ad.103.2025.10.24.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:50:31 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB controller
Date: Fri, 24 Oct 2025 16:20:18 +0530
Message-Id: <20251024105019.2220832-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
References: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX3N4twsOyTlFr
 6IJxdu3jK+CgKGw9xhubrrt/ZHOHUWiCAZ2me4SswjXlKstxeWL83zdc1b36+NUAi/a1mqRGirt
 FmoLmBpVGGHTAa2z9Z/AVo/P/cmZtsjM2YdtaF9HL1OQYgMfmc5a9uxfp3mU48y/4auoH1dYNVK
 mkeuZZtwDr6hUhx+h6kwqJZ/gslBhdBhIGMN2T7Otx/Sy7KjvJnLn1WJXZX5ouMYBlOCYWFFVMe
 sGWw5C4E0b0wEUKAgJ+xLHrnHAmcfh/ng017/calZ1/8wlQOKeyFMpKTUbXDlp86b5YiYU7ZFvE
 8CWyJq97JEbWR7HK8kHH+UGHniunlby5j8e3BCNdz6otH58DBB7xbBjX6chS2cYXtsWCRN2od2j
 WTvrJ7YZbu0Xl31Im99YPIAVLt6hIA==
X-Proofpoint-GUID: 66-xUpTt6p5PSeAyxfUv6aAD0xW_3Hu4
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fb59f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=iNHPuiuMtRvPBLkl12UA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 66-xUpTt6p5PSeAyxfUv6aAD0xW_3Hu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

The PIPE clock is provided by the USB3 PHY, which is predictably not
connected to the HS-only controller. Add "qcom,select-utmi-as-pipe-clk"
quirk to  HS only USB controller to disable pipe clock requirement.

Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 633b7402ae84..087465f028f5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4949,6 +4949,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
+			qcom,select-utmi-as-pipe-clk;
 			wakeup-source;
 
 			status = "disabled";
-- 
2.34.1


