Return-Path: <linux-arm-msm+bounces-84050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E2C9A9DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 09:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB973A618C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 08:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E3E306B3B;
	Tue,  2 Dec 2025 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fF7XxUC4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3kVpp3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C79305E24
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663039; cv=none; b=gnBnutMBchmI02cUayHq7rFYgC9dR/jwbHaiEdtPnc+5B6rqR2wG18PVvt0NVSL1vnejU/53i9y1XfELtVPtUzIUPAkPD4LDo+0N0j8VkoMkIw5SUxSSr4DwNUf9jkhcdSn36W17pYZeBchRMwwN1gExlbvErG9FiAvqS6FlPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663039; c=relaxed/simple;
	bh=afkrlJcGzXfiyxwW4hhRJzVZEArw0rOKDLWwDZq0lLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CG6jc3W3ttZJQl4Ei5MVLH+aG/8ulUg3MjRVpCe5AlP/eQ7KxNCzy/+tWuizk5jm3c7KqFd9hp39OzKLJveaUtmLOppwQNYvOpoeP1+FW9baro0VhhtegnX23tLW9c/4+zPY6pZB4+FZYrZJKYXkz1Il/HayJp3z1DIcH1fZUcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fF7XxUC4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3kVpp3U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B26WZJo1741790
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 08:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jgAVu5YMA5u
	VQJOZAGCxsP4u2zBciF10Dqry9moop+w=; b=fF7XxUC4ev8NtHZbRXi9e9XkA9x
	vzICf9wlYnKVTKj+5zpjcyStmeo5YUT4e9IKyRWBFYTVhCytwYRj0YLcU18WjD3S
	3T3xMl0di2X2tvwhTQMaCA6UBwOyaDqPB5khKQoJn0njmYyYAg7CEymhs33qPyny
	VHECzFqvIuaiQiCEi7wuqgy9oPIXnlBzqZUEXCOhBkT/kicK7DrZwyql7eloLjtF
	b7z/sHr/7GCFPQuMc0GGT3EsKaxglNhm/GwdBq0VE9Ja9hqHz7WAOH8vfkefpiLl
	gvhNC5zhIhW51Xh5sA7GPtAWTnO+AoA0FK1W48uukqVL89Epa+SuZupLtIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ashtksv2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:10:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3437062e4eeso1185094a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 00:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764663036; x=1765267836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgAVu5YMA5uVQJOZAGCxsP4u2zBciF10Dqry9moop+w=;
        b=Y3kVpp3UTxbzcbUJ2dGVydzeklsQ/wnJzsNGA/4wRZgsAwCHBbQwLRHHI5sd/DJv66
         WnEcLRzztVXvYLvAdgB0WiboHLDJjW0y9NSBCL6eu33RT7U7JBMkR6a9KuSOX07ZZ+6q
         PshIsGvCzMi6ZFJDie6LzjIJN/JB7nkwTZJSXMyVWzRHcvMVDuRVNqpfL676I4dCOFSf
         VSFSTa3rQcEFHqacxVuPVgK0U0TVF6RutV1e/1SFQL/W1im8HdhX01wZlHXfRWZoqJL1
         5fYmYRAoaNDVM+H91px0Fn8wYtJBp4/A/FxHY90rvghURSXoEQExv/jXy/odTESvUiFC
         VPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663036; x=1765267836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgAVu5YMA5uVQJOZAGCxsP4u2zBciF10Dqry9moop+w=;
        b=TwmPlmJ8rl5wo7EgBOAxST85kUAq0Umud3u8TMerbJvoQGi7HvpGYdNXUJUBndfHN2
         hAo0iFNhHp8OEvYGZYAni5+ihKYyUESCo9MHH6EuOvncK3c33Jf0eHsrH41aTkFVU38N
         y/55rl1OSMOMdM+v/z95MW82Rkbx4I52OhImNsRy+rUZRXR2JuUwzxbbOhIF169koDrd
         V6B2QhExnvyYFboYNDAByI/ZUrqsuFhoQz6m0SOwFnw6whGGCaHGcDbr47ZJgVoPyu10
         kZEmzkOinkdP7vVPeN/tE9uxQZTR/JgCcbdy0UYiOID+cU1TSjNiVYZ0LRyHoYU4l412
         WO4g==
X-Gm-Message-State: AOJu0YwGo23T+Ij2xqLfDDnS7NS0HnLbpFxnKdbl6G8OCBdsRVHoL7ee
	fzhWC009yJEScekPcJwE+USP65U4O5MEMrJB8gmkgFH2RIoJxBvxgmmu9Sr2Y8r2wdCButwYu+w
	oh5s+SySrx9y9jA3xPH4jx73jsXW2uoLqhX7ZOCrS7eboxg+KwJcVD81UI5zbUQftTxk=
X-Gm-Gg: ASbGncvGGpQBZwF7zH/KshaeqW9sboUqnNPebtVlWGv6om5d99P2UjPVrcGVkH9gyZJ
	4a4pjeNdrGIBg9n7Ft8XW5fSktYWHeNyGxmbaWrUhsyUjv0JIQueA3TTDONILmZhoMdI0+Q5prd
	w+xGwCbr0azdEi0lr5lr+cG/H/yrhT7pwU26Ao5QRF9DYulfQw23yK9kQfGVL3ViH3JLQZ00RB5
	YM3dAC5AX6iLoW8VOCGp+LXXEKTUFxPalATfiDEc+vkaOoxpb+g6iwe9us8vpIW0asPKw7OO0kD
	xAECn+HOndhW4pc+Sl3fKCCSQuL3kxQGjUShssPsovvk6KNySC5mf29qjN/UyVjYRNGJEuCYUT3
	PVYMuPRx32KRgSr0ehIA+gJNydHyR+dJc/0Hb0r1C
X-Received: by 2002:a17:90b:4a4b:b0:341:88c1:6a89 with SMTP id 98e67ed59e1d1-34736a9777emr24433037a91.2.1764663036162;
        Tue, 02 Dec 2025 00:10:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6zLFtvtE3AkrvsjEx6z4cOWCIHVwS07V58gcp8Esk16EZwouo3Kw04pzXhol4BqzyiVU3Yg==
X-Received: by 2002:a17:90b:4a4b:b0:341:88c1:6a89 with SMTP id 98e67ed59e1d1-34736a9777emr24433024a91.2.1764663035629;
        Tue, 02 Dec 2025 00:10:35 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b1cbdc0sm15419794a91.2.2025.12.02.00.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:10:35 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 2/3] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
Date: Tue,  2 Dec 2025 13:40:16 +0530
Message-Id: <20251202081017.2234677-3-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
References: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GmTXp5yWfZvhzcEJbga1PabLYDjHEsWt
X-Proofpoint-ORIG-GUID: GmTXp5yWfZvhzcEJbga1PabLYDjHEsWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA2NCBTYWx0ZWRfX9b0pXpK015TZ
 6sMtzDATu0sJRhDkM5ZcznEPCmg4MZt+rsMgiDp1qs8/KpWZYysjbOyiOzL4fmp4QELKdRl4bhT
 FmFvw5BCqTFwEKSu29jPNuIfDI3UqgrPGC0d9PoS8BUMeaEAK/cHFX4xKC5y7V8daFT7Wh+yCDg
 omypHcIm32Ld5h0HwyS/Q1XqfGLWqb439wzLuhmgPR6LJ7cjK3yKa+fVgY+Ru+WTreE8OBWCw4S
 U624XuaMXhOS2sh9F1jhvLutDn1WzTb47/NHr5AtMj6d1FnRzxl2aaaBjhPSW2BYYIp0Cvq1FZO
 3TcLVc6OC9BxunMv24Xwkg8ikg+ZN+KfwG+yYGuqsPnvyq2TpO8anZUxoUvDqi8RLgUJI6wPXd6
 xcTMHYl61OIECMa8a8fYxEKyE026jw==
X-Authority-Analysis: v=2.4 cv=DL2CIiNb c=1 sm=1 tr=0 ts=692e9efd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kg-vC1Fqsk3HpgLVStQA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020064

Enable SD Card host controller for sm8750 mtp board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c8cb521b4c26..bfde752f6365 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1075,6 +1075,22 @@ &remoteproc_mpss {
 	status = "fail";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
@@ -1194,6 +1210,13 @@ sw-ctrl-pins {
 		};
 	};
 
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";
-- 
2.34.1


