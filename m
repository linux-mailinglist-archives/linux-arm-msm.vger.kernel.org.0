Return-Path: <linux-arm-msm+bounces-81315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0681EC4F2BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 18:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7AA1434C622
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 17:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3C3377E82;
	Tue, 11 Nov 2025 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dq6SLOBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUd1ZFDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614D36C58C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762880643; cv=none; b=tXAJlVlYqnBKSxTvBVKaDNuC5zxvdYdqB1f4Bj/2iQ9fw42kh+KqyyDFXqxcbI21ulntlOAZQvmzl8XIwVp24ux8YOMiKqBvf+V8XGUJFp/wOzivEq4fvrdiLsPG2kekhs0cEvswD1D2KiZ8GcTdkcEdTQqITxdum4T9D5jOrbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762880643; c=relaxed/simple;
	bh=oY4T/ttoreMDsko7aua6FQ5sUjs/KwHa2EFAh1PvwqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NQtrbrpx+HXniaMvDYe0JPgl6UD5IXIddYsYkSLSEo0TgsmE7BiV3dyaV6oASzGYxU2tblFhfQfMEd5XV2Ps9+6TXWPPdla0nBvH2Sm1Atcnp23DjgL0dOEZYNkmwe62Q+foJ55TC86Mf4ZF/hbxfB14+f+hfqhIzAAYahZjetk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dq6SLOBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUd1ZFDK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABCm8c62540307
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 17:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sSqkmTvk/o1zV2BKESv8sOE2j4hMFGCUeKS
	AHs4JkiY=; b=Dq6SLOBZdEdcLxlp778Gm9OsA+XdoTRZlm4LGBRI3ScwkzOWkyj
	llkMN1k7DLNF3nrFkrRHAu/VE+Zkp3PG/aXLl+76QzCap4QKj6AomfuJuzckqnnV
	yk+XsiH9wkCeTUb/G3YjpTFhhAk5l36M0jNiR+5kX2VaXMnGfarfK6QTMHotdgWW
	UTAHlt4zs9ZXliM4dYG0fGVS2UJp6vj8e2+7N8AB9feoJpV1GNq9ds73I72THouP
	zKXLj9b+56E2UAdMrjv+SwiF0SmfGsVP+dSuqHX9+3m0kQDdJRBe2rib9QDmrHZu
	+yKrEVhn5pwczQbU0IoQWfhSe4TdaJUS9eQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac5fggs8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 17:03:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b99d6bd6cc9so3642564a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 09:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762880639; x=1763485439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sSqkmTvk/o1zV2BKESv8sOE2j4hMFGCUeKSAHs4JkiY=;
        b=UUd1ZFDKPJoMxOQ4cgyxqh4cEtssau2iAh25s/yuzQi2/OrS1n13rCuG6d0ZqgMDni
         QDX5Vl7BwXaRTQu3eG3trtEBKu1VcFSUybHSIYSmhNUhv1SCrDRfNUlZokV7TtIH1Gbl
         V1gS9azFCs+qd+wHtWxHS+osg8e0m0VL0ATUsWF9lk0Zq/TzAAI/jpyMck+JMpqDZ4Cw
         afcbixhirO5V0vRaLpu8+L57D7rsl+plmTb3/XgEFEwWHBHIHxHXFa9G6n/+wZpxy4I6
         nR+bP/Utbn212LeLhlM0m2Wu+g0698evql7Iuc1Ty2+JuMg344P7dZ9JGw72TiEl3A8r
         WQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762880639; x=1763485439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSqkmTvk/o1zV2BKESv8sOE2j4hMFGCUeKSAHs4JkiY=;
        b=XgiqTYi89AtCfnoJ6xuO420BzgjQOM2hvakeWIR8SowK4VPMwxdbdyiwqfOIfh0dGb
         DdIUW9NgC1gD1mZAaIwGLuA4gK8wCOStNB4DX2Il5a+sxHjiMsuOghSRyBGPOLbr9c/m
         xTRWsubwKue7PKx0B7f5Wn2pCK9F7cP3ah30JBTRHcjDyx4Vw0JMPnf6L+ykdGvEMHiJ
         ytHlyVkzCBR+J6GBhAB/AwWxfgKfwXYUceomuOZ1rCgTRkR7rlApkYnC6J3P4b/zCrNN
         WxiZamodDhy3fn2byGEMD0cbm7sAOTcUid4i3eqanW/Kl7+yDxGgcvgQW6E/YP0QjwNv
         nKkg==
X-Forwarded-Encrypted: i=1; AJvYcCUy71UvQ1aPm2o0Wr+J8IqMhe1bjUwPlz7jzvQmXMvkMBCVKzwcFAX0/ybVyVesXNqLWHO9FJ1vMWtprdkL@vger.kernel.org
X-Gm-Message-State: AOJu0YzShV6G8Zevgnd6RmqpL5w3CuTaCmYzM89g8yxAV0M6/iTB7kVV
	T0DFCQZCatq+uCKqW6nvtYiMi5YiV9Lufgb9Lu3UKQRPWaefdweD1le2MLfO40rKM3Euqq710V7
	+f+ZVM6IH5zzc2fNCao4WVCzbPG6sV9W82OagohyEd7ywL+Rv/IkDg+op4mwIEf/Njm5Z
X-Gm-Gg: ASbGncuxc+RX/KYkLOrah5E10Nyl4C/PJD3OSzSV9SIgJwm5B+KU5e7eZyFoG3m5LfM
	G2pNCpLCSrr70pKEOIUisGggPmjEBGVnzqwSZ/dFKxHvhkgLURaCGBNQC8lkZReB8NsI2zzp2Kv
	TIemlt5P5o82Uokpan1XtunVLnACXH+dkHsfchngmj7zg3QW+3vvk5DGay04ZCxXPy0hQzSMNpK
	0OR25ij7pvsG4EKuGLEyYAKkDZq92l+LPvu7UMvAivwfilzj7wMeYgiK5151jlswKtg3btgWFGS
	+MjOwjN/3b2zemozbN3ktDAsFmLKwxd2W6RCcG2qY2i3Rd03l+4KNfSWCrtfGt93TJyQ9MBP2b8
	jnim1TO6AtwnNTRlJpKsPRd8kRO+Bd/6Dgng=
X-Received: by 2002:a17:902:e78b:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-2984ed2b619mr438815ad.12.1762880638456;
        Tue, 11 Nov 2025 09:03:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWdsUBA6eSuHxYDMbD8ULmG3xXxYMXzsqpX6BMtcUFNBsubisaSrMVPigEbV83zZrnBZT5qA==
X-Received: by 2002:a17:902:e78b:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-2984ed2b619mr438335ad.12.1762880637855;
        Tue, 11 Nov 2025 09:03:57 -0800 (PST)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcea690sm2262405ad.99.2025.11.11.09.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 09:03:57 -0800 (PST)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@linaro.org
Cc: mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP OPP table
Date: Tue, 11 Nov 2025 22:33:50 +0530
Message-Id: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Np4DWl1smP3A9JNexYU-5l-ve_vM6W6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEzOCBTYWx0ZWRfX7zgBy3aknkp3
 KRLwXyqeXjFoOmhPdy3KI5XayUB8P7P6By+0ogSmSHh1pJ43B3HjZDkD4c2fkWc6OswoZwvU0Yu
 aluW9fMau0ot95mPJXJ84e+sSFZg85Fr0j425mRamAP8x1zX05PUYcGqV4I/ydtS1LDx96mZWV1
 DQEw5G6AFDqk0bAYdui8gNz/KeNo4n0bGV/012zzSEtODzWf6NlrbsDT5MwEzP6087WiVPmZ2cg
 rJ7aKb9x5o22ymbL8/q0p9Cwt16qfhyupzIccJV54oXLNjneL+/PXqI/95UISMFnFzFQJ3cRCSV
 F3UZKI9hP7TmSBUWLyHyqIQQux3+wPY/VAu2wf0YDRZ02pVhKZ3yQ+77FpeDZMXz/0LdHZn4jjX
 tJT//9BYubj2QG8EJEASyaC20Izo+w==
X-Authority-Analysis: v=2.4 cv=B5u0EetM c=1 sm=1 tr=0 ts=69136c7f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=B_wteF72wSsg3gi9yGIA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Np4DWl1smP3A9JNexYU-5l-ve_vM6W6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_03,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110138

QUP devices are currently marked with opp-shared in their OPP table,
causing the kernel to treat them as part of a shared OPP domain. This
leads to the qcom_geni_serial driver failing to probe with error
-EBUSY (-16).

Remove the opp-shared property to ensure the OPP framework treats the
QUP OPP table as device-specific, allowing the serial driver to probe
successfully

Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eb6f69be4a82..ed89d2d509d5 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -536,7 +536,6 @@ cdsp_smp2p_in: slave-kernel {
 
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
-		opp-shared;
 
 		opp-75000000 {
 			opp-hz = /bits/ 64 <75000000>;
-- 
2.34.1


