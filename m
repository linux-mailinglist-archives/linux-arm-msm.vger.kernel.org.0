Return-Path: <linux-arm-msm+bounces-56769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45362AA906D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 257FC189154E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5FB1FBEAC;
	Mon,  5 May 2025 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+QW7ixq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F42417AE1D
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746439152; cv=none; b=FYkqkgbrxVx/M+g4M2gx2kjTj9x2QcbOEx4m03FhkBsbgWG8Tn06AvShUEtQmT9wsiVTNq+RhPHojMbqc+GEZPV/rhEFD9wG5GQn1ZrRAbkaxretEWzBxt0Wjh58WhuraG8XIdtAk02I9jNLi1rzk97oWh6f3mdyrUDNRnZuf4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746439152; c=relaxed/simple;
	bh=EpTgtXBx6RlAgy0dPCnR885Z0kSSu1ufdWaninmCbc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jT8BN1Fjg6AuXksNAZbOE030v5JzzE9AUocFhPpLdekGBNGfB4HlO/1hTKbyJTTHKrCpOXrB0AimIRCHwSqYsRFx8eLp5uSj0dZWAJNoApYRLzlgR8+ek2fvFaCBsFXzzUoHZh4qxBQO6QTDlQ+E7twv6KsLGkvoHavQTRH6b7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+QW7ixq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NVtsm010106
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 09:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eHT7qDsNgvG+6R4akd+due
	X/xA19TpqgzBOgKaZriFY=; b=k+QW7ixqvshVPaGVJhu4EZTmghmIthvptYdDw5
	IPMoV/3W3DV5uO7V62QK4QPsEGIAKunbGxdJ9wooFLbwA5gfoP2sRIuiosxlYspF
	He4PByLEcVyT7dwBc950MJbQXUipivcFJTaw9pf39xDkgcA+1FbWcHhC5wIWSBAs
	4YjD6NvsM8P8JcFIx50d0ImGg3wFgsE7I3Y4zoGRCdgyCKPwPTjk99SmPMyeO24X
	iFdw9IBqhjwIiqVsD+w3F7G/RjlWXHuyNKFxswlhuIkLkfjVwXUYaGbahjI5+kyi
	2SDreu9sdQX32SIlFTMwhji8yg0Zq2U7pQU0QwplrIwWr5FA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n3kj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 09:59:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-224192ff68bso34630025ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 02:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746439148; x=1747043948;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHT7qDsNgvG+6R4akd+dueX/xA19TpqgzBOgKaZriFY=;
        b=hhCXQ8/kdqAdXMfiYui0oR1d67rPey8FQe4N/aRSA3iqhAqHLTwdjcxyy1gsrP2TIf
         2dVoO+NhKkJe5pV93gGo0keL1fv4kw8HTojyshBsKf2hvtta/IRYBvYRH+ogZLNIO+my
         KrhM2FByPFYS5V/NgXjfpHIVO8pigCSjtTWVaExwl9T8Ack0ygRA+vXnV6cUr0eC6E4i
         IBcdJDPKiqPQfCvY7ntkMkZDMkl3yT9fKcrmLKGAuL+teFelMF/c69rJcrhEULAnUufx
         MK251zA2MNVe6xbVYzYsosgC1N/rOqgxbBH06KUpm/GeJvM2fJkLfic90eV6we6yJY5I
         k8ew==
X-Gm-Message-State: AOJu0Yy0MpbUPFAegtnKrkt/qzBF4ppC5h6Fs0gZQDIHTJrCki2CrdhA
	JBSaBTJKpVWraxKr+I3UDslFLTAkOF3VaFWVa0/bxqOvR1IR1weHkZdf2y4ByCxvAU2dlJOl72T
	qaoFCF5JVtc/a01CLu7CAQciu86YEIuMIti4BPa2sJtNoxsCPtrFC0xQgHprKAwZD
X-Gm-Gg: ASbGncv+MmneRR8K+BULRurko1owWP2nqA/KSHsOlgEBHPiz3NGiSuwdpHQ7HBPmewU
	eT4HLCWOoYUyv0FnQuJ4W50WLPqBj76gISAfysHLdqMZ9TjJh1NSh16OadxfRHnP78qXyW9rR9P
	Te4HkwPD476dt0Fkm71ZqhCO/ZJVwMl+nf70InNx7IQkr4IFEtN3XFshoac8b8Viw1pH/kHlDpY
	/2bl2XgaAwplLrc32gb5l8r6VXENySlL/uReF1XML6s8J3zGJKVa7wpK9LZ8yJLmPtEHi0cPKWV
	AlaivdEUFDKpWGP2ZMKbQ3o+hpBvCBYvZyOYtFwZ2xjrvuHg05LiZJJhZ3DXHIeoDgxGhVyd7s0
	epkVHOF1TdM99+mzU11h9Vzl1WRmCVSVm7l+OqRqAcThq8fE=
X-Received: by 2002:a17:903:2013:b0:223:fb3a:8647 with SMTP id d9443c01a7336-22e18c390a4mr94964935ad.41.1746439147978;
        Mon, 05 May 2025 02:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkTKHq7ayRsAFVb77jjAyGhEnyopmqWN4059dMKSLYS6kyiwKuLUniLbs+PgPx3MUf41umOg==
X-Received: by 2002:a17:903:2013:b0:223:fb3a:8647 with SMTP id d9443c01a7336-22e18c390a4mr94964655ad.41.1746439147609;
        Mon, 05 May 2025 02:59:07 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059064ba3sm6524625b3a.130.2025.05.05.02.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:59:06 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 05 May 2025 15:29:02 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5424: fix MSI base vector interrupt
 number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-msi-vector-v1-1-559b0e224b2d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOWLGGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDINTNLc7ULUtNLskv0k0zSElOMTIyMjZOsVQCaigoSk3LrAAbFh1bWws
 ABv/EIFwAAAA=
X-Change-ID: 20250505-msi-vector-f0dcd22233d9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>,
        stable@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746439143; l=1189;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=OWgPLrSOsLj7bhXbTza3TATvz2EeFkP8y/S6sglo7cA=;
 b=C4RMvaIVPbc1OR76Rkn4sDLgXVDzfHP/yrG/GHN1eovfjvP+3za3gxZ14R5hJo6Ev96Gqpp2w
 wyL1GwwcMNwByot5mL8wrT9ixrg7nESV3CYlS5fjoXOp1NG+E7HmcJc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5NCBTYWx0ZWRfX8Gwwo7Vn8zA9
 /MPoaaak5ILaT2swDSi40SuLoBelFSz/BehtK7cFeE9kC45Vgei8OpBPLlEOKzoF1oEqRnQaRam
 t7uAWVEnv18+udKKdkwpOG5Bay34tTLSBH/KYYl30BWcQS11ixwyzZJdAuGxwNFWfJSCsgK4g8C
 S85hDVj2iQ9bSCjLIfShDCZccuJeuKyII2oTD26KEr49LDqnMbHIo4BYV6xfg347UIS7LiCPUjo
 FKEN75CEc3LnmG7AyDAfHBx8ei/1d76TQvjBuVChppkDuoRaThZFNkwO6ONq9A+mPD1mhTGMXht
 P8X7Youu+XWXNgvlBy2CJVMjhLpKVgCj4MwTsEE8AXBz7KAPWrmzF2BwypmOaspwerRO1+6j6Wj
 f2zFL/aVGM+74TPpQxqCzetEZ0asJaFEaaxZAtJOSgPS7cQCJmdBzYiAKEA5UhabyQnKWjdd
X-Proofpoint-GUID: htQC_QKEnQemt9k_kKh6TzA6dJUwJ9za
X-Proofpoint-ORIG-GUID: htQC_QKEnQemt9k_kKh6TzA6dJUwJ9za
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=68188bed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wQDUD7ZtUzV8iaVDUq4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=655 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050094

From: Vignesh Viswanathan <quic_viswanat@quicinc.com>

As per the hardware design, MSI interrupt starts from 704. Fix the same.

Cc: stable@vger.kernel.org
Fixes: 1a91d2a6021e ("arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support")
Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1bb0a57c593f121f387ec917f42419..7a2e5c89b26ad8010f158be6f052b307e8a32fb5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -371,7 +371,7 @@ intc: interrupt-controller@f200000 {
 			#redistributor-regions = <1>;
 			redistributor-stride = <0x0 0x20000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-			mbi-ranges = <672 128>;
+			mbi-ranges = <704 128>;
 			msi-controller;
 		};
 

---
base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
change-id: 20250505-msi-vector-f0dcd22233d9

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


