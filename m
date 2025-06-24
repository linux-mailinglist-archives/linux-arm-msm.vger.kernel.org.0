Return-Path: <linux-arm-msm+bounces-62199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10021AE62A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B385169A97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 10:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BCA218ABA;
	Tue, 24 Jun 2025 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJC9YcOI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D505F286D42
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761416; cv=none; b=dRHvzF2jZn2zXPiwyn5P++IUjOfugg9AhfXYVmy1SZ3+ixAoNWYNG/cvvQGYpO/h/GAyE40BFxwCFtuOgpnNynQvV+8LvXPuCqZoJ8t92qM9N2JDo4SIMUzJJ8/u18HYVGsgWhn7YH6+1/7FtWOp4y/dgsxTFpBJ0nQe7ne4ICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761416; c=relaxed/simple;
	bh=FWxibcNeoUrwd5pY9mHTYhwEDhN6YSBaZ2tj26tMzMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I1rI+7zw+8dCmzlP7fbwlEKwOEYHgufd6ZjgQiSL6swibjmBB8Ayp7UCFXUM07FADb3He/D8RrsnLmt3dGtTtP/fNrNJBlEJwcudIZm/iHMJF91cSwCIAzARzqZ5WVuSApoCpJEAijwroH6AZLeR3RLf+6I0cOjjKXgbyjlsOh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJC9YcOI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6ExRY007242
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 10:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EukidgrEuMOj47GtkCmNs/
	Aethas1AU3JO0SAf+anLM=; b=hJC9YcOI0l4bJ3N5ngxsAypV1LOYq+HIpC5tBa
	W4chmcU24zLgk3cTeMzpbxNs4Dd3e2U6NiswS7fz4xVgq1yiDQq0kiuaHCEbLhIy
	XCuIBVnNJwcYs33qae+oE1DrHLa36+4ZaXhX3zmiw+QQLcB/SpbUbQXCF7XkllrE
	2iJrdIu5jIQrPBRahvaFSrgSVhzHvu16VV0sgt83yWsL4TBhOQpD2Fn//WyM9Jtv
	4Ib8UvfJ1ziJIM7JeLrL0dt5mOKkQuD34321PezuGJA2IG8wvCPn/7GfeUlplKNd
	0t6aoHWuN0ub3K4ACIyMP/tFU/A2oVkPDfxdTSInAShAcR9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec266042-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 10:36:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74880a02689so325936b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 03:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761413; x=1751366213;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EukidgrEuMOj47GtkCmNs/Aethas1AU3JO0SAf+anLM=;
        b=BHadgWMVqjMRyFuL//YgpANdmkTGDPdNnxhTD8MjLZ7aa6fu5lqwbUlmjyPW/xBSB+
         l+XmkYLyYEFCLle2njooSroNg5mw/f5p0UaBFi2Eyxdl99G0mmdR08IM4T+GOMh+DgS6
         lnf8T166XJ0CqgLwlzhskbqP/Qj9pBIxjWf7NdLRu8NAUvvx5lo5eufc4f3KVt3BR0/n
         mdSvudTodKaEGDB8xt7oDTi7gSsSFcT9RiBEp8yTlaACEwqi3m5zFdhp9UIAIbtNEsjW
         Z40eagSYQv5+S6CINtvAIaJLNY9M/MrPbjgn9uTh4tfVksJDzuOinMIa+GgQlL7uhobP
         UgtA==
X-Gm-Message-State: AOJu0YxaJE0HbHi95BTHTK7G6mJMVh1pxtMXYQCjxklx9VxkOxiwd7Qm
	RfS6lk5zeoZVzUcpNI8MQcY1JJS7Hg9zNAaYibvEKF7OQB5lLIBNOokqNXHLY897xYwo8nWkiSr
	iWq3VWOm++C/BxDsgyzN8e81IolYmXk7wJq1myMjw6Pd7S7PYanyx9+3oHs43QDfyNw0i
X-Gm-Gg: ASbGnct5WJZ+9uUsh2ELQK0yMOPxrQ5Qeg7Gl0e7ffDrAMDrOAbRV3mM0bGYOTBoj8A
	+muRQYd1WavrkMj3ub2jjG6uBS83mXDUr/ETi3gVP0i7JT1h2ATIFtClVpxt2nTrwDxi+HSpv0j
	gwPCUEgbWHKp+xHm+zJ5CR0TYQMUrBY28Oky6GVk4oz/7aEhl71xp6GnTCuyBKqIBdY6OdRU0F7
	SHibLvy1tq9LkgTzTNwJvavIgu267lyYjVVK1vNn33oCFAM+b3rrVTHWOPNosGoqzTSZ6mbv5az
	M2bjHVwdSInPUjKomDOVAUFEdhIzyyT6E34/f7jzD1dwQIVRnlG7oi9f7763BhZc8qBpVvZANK1
	vWMHeVSAk46Nal1g2dTa68y6K/uiwLwpEuiNx4bxttK2SFzTEpgRSLjqGpQ==
X-Received: by 2002:a05:6a00:23c7:b0:748:de24:1ad4 with SMTP id d2e1a72fcca58-7490da9d641mr20898134b3a.17.1750761413067;
        Tue, 24 Jun 2025 03:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0EPM60iHqu/wX+54c+M7UsbyOIw/F4FG2R9p17WZCLqPcF5YSQi7vCK+MDFvlHOW0xwJzvg==
X-Received: by 2002:a05:6a00:23c7:b0:748:de24:1ad4 with SMTP id d2e1a72fcca58-7490da9d641mr20898100b3a.17.1750761412679;
        Tue, 24 Jun 2025 03:36:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e21466sm1472393b3a.49.2025.06.24.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 16:06:47 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL5/WmgC/x2MQQqAIBAAvxJ7bsFEK/pKdKhcaw9aaEQg/b2l4
 zDMFMiUmDIMVYFEN2c+okBTV7Duc9wI2QmDVtqqVhucL4+JpLrJYaCAS2/Wzhm7iAXJzkSen38
 5Tu/7AU4dT7JiAAAA
X-Change-ID: 20250624-atf-reserved-mem-b84c7d45b624
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750761409; l=1349;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=JjAbPqvQATV3mxxNHKLMuXo+KgMzphIdVgAZtBEoIiU=;
 b=BDqkqAbbEG18WuRAkb/fatoDzzoX4vVU9i7N0SWURagr2F/UXiqBnqisYaMdnGxKe8tmpHitv
 Kg1hXLhFsxaCKW0IN5rJ3V+Ffi7ECyFamAnmf2Y1hraBAEE/ScTr62l
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfX/lbvtxmaTI00
 6RBRMYWhw2x9Cu9n9SiZmOLYIhGCK8nxMVMN48Rc+32cd6ieH3v4H4zMk+huQRB2VfOrLGA0eTe
 DJ9RokFxD4jJmJW4EKoIu3HOpt8lq62xHJqNOJ0M8Ta8LgT7VuRt6MWQ34IlVhy1zqRni8pdadf
 2U0WJvJycwJS++mzGdsnyGStiEfjgKHpfcZTq8LmXwQkVlnzuQJe1ifcFb0ChHbS4HILzKVnWLc
 x6/4Ql3NKAzTNdg5k5xKj2bMEDgfCD9kMXVmi5AlaYeUseSUdAhzhURQQxpnuKDUg5W25kHfNbb
 aA1Bm3dJSzYV3TIdzJiKwdwDITNRHnxqBCXmxLecOx+juMjJ1rkvbggL4a0RqMh+m4Swb9WBAgd
 fclgNWUA/yst6y6hl3cKrf0mGKwIgtvhhFZTCIj9DE8ZBY6xQkQI2gZAwY+f3r7QaL0KvPE2
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685a7fc5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LHHpOU43DGDhQHPplI0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JnxkVtLnulucnP_fuPPueiomwIAnDS6C
X-Proofpoint-ORIG-GUID: JnxkVtLnulucnP_fuPPueiomwIAnDS6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=683 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240090

From: Vignesh Viswanathan <quic_viswanat@quicinc.com>

IPQ5424 supports both TZ and TF-A as secure software options and various
DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
location, but in the 256MB DDR configuration TF-A is loaded at a different
region.

So, add the reserved memory node for TF-A and keep it disabled by default.
During bootup, U-Boot will detect which secure software is running and
enable or disable the node accordingly.

Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25d79051adddef604c55f5b01e6e8b..d7264f7e2423510ca1f33bd208becc33bf231094 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -150,6 +150,12 @@ smem@8a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		tfa@8a832000 {
+			reg = <0x0 0x8a832000 0x0 0x7d000>;
+			no-map;
+			status = "disabled";
+		};
 	};
 
 	soc@0 {

---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250624-atf-reserved-mem-b84c7d45b624

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


