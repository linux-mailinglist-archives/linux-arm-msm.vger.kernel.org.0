Return-Path: <linux-arm-msm+bounces-61892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D14AE1EBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 17:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 835A9163A60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 15:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ED328BAA8;
	Fri, 20 Jun 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogiSpvq2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A0283CBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433412; cv=none; b=s+EhEWs4ztNdPXtkn0hetkmVYKJjk/kwUEljlEVcCPNtAMWme7vMdoftq1BQOIyMd+pJOytUaiDL0vuchwmAKgqHaOoUf5AeX4H2AUrzDMRgYL0p+XgZUrFWXDm3SUPKqMfDNnWNLoW6Eo3+mlRjnZ5YqkDzCrLNuqB0GmrTe0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433412; c=relaxed/simple;
	bh=qrK+g8uFS5jCwIrF/y9iS780oV3CUwyCR8EUvUcUI+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aettNxDxFF9xxVflXtGkVpawfUpCdJCHJI+XQIXswdLIy0dAg1wWjiW85weKwoeRJMg+EHqY7kMnhOpY67/1qfL2D7qC5Ea4yTWRVonVxd7F78acnx0bOEXvO/94Ne28XfC9U3JqV494gr2fLfhaHLL0wD6Wv9ohCpoeFhbah+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogiSpvq2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFSW9e031161
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 15:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k3p0MRfoHu8fKYagWl8N6v
	dVSrVlA4Y1hENWlSrKnmw=; b=ogiSpvq2mMpWnKLDqbijnoc0NQt+alAJXELG9a
	ib2iGkRHOBcTLrVhiLbeNGdqRjyfnNSX4LByoZQKSre9N6AozsGruNtYBmUyD9cE
	Uzm1ssVtZQHoAkdXafom5LZbJlYC22aG7ARIM4q4gf/G0bTelfTOncRf87aNrkuI
	+oEy6MAOohcZvRjhJDjptdAh7Zkzgs3Nz7pN+kICRXPs7MAJ8r1LiaaiC17EtbZK
	O3V45XlJxbbpVI9ILxnBlQelSpT1fnhC/sY0KijWASWTdyDZrS7hk8lJEE4KWcBy
	Vgd5ULYSJ2SCfOa0SsQCPfLXFo2xrTQ9loYLFzOlolRICBQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daacr04b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 15:30:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748e1e474f8so2697290b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 08:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750433409; x=1751038209;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3p0MRfoHu8fKYagWl8N6vdVSrVlA4Y1hENWlSrKnmw=;
        b=MkArnH4iEO3zly5byhfEsuA+r7AK96wTcmbNQ2PPbrglPxJY+MsJ8PaA+9h/jti9eG
         dKU/zQBQYU81W9SEMhNfaLx4tYWCZBCEehEbospjt7/N/cFp21qI7LkDlPjQT3/SjfmE
         SHa2BtvC1r3XaVX2KmBaPpIIakFsJ8XOgr1cpcPnobB4BexqWvqux9+WH5A36HpC6MBW
         Ra9nifgpiehcwUfEDvZVJiC15oPOtXAbelJM2aP0Lmim9piFtt7C/l+WPZjIW4DXlpm5
         6UWbd+PvPzXa3CoqssiEcbPKWaErtaHNrCEcZDU3Xaaxi5hzJNZu67Ty2lIQ9uOLmb/R
         1qZw==
X-Gm-Message-State: AOJu0YyWiMQsC9m3A9ZnzbVbLtEb7rlRQVvwP95IBUuZuGR9by7yCwKC
	yopkXq+FOsiH0k68J5/ciFfAOFFOYY5aiSxKSZRc9ivf1DGlG63JoZ1woDIRWOmcxRcD8CnPH3W
	WiucCMhKz1pkOkpRNKLLxGu21IJiFbnNZUbX0QznZSwOTsG1S3C7cYFzdfRiC6eaKXWMw
X-Gm-Gg: ASbGncscPRIZSsTqRNYTfOacT0HfE3WsHm+1dxR8nkbpKM+4HOPn0bFyfCXG5CxAVWe
	7TKsXAEX0Zb6ZYPIGYCvAAOtZSlfuAv70Fb+JB4hEGlCLS5FttpnvJ8EdBdavaaHaK8mJZy4esU
	UaLRqUjOg/POJ5LftxWkibFEigbcf5ioCdiLxMDOAif6khm6fPIlrrB+ksE1ZWfQNjA4kR8bet4
	NK9yKNHTJstS3xOeq32nPkUqhp7NttQaCx7tUmBrSkbP4GEkOrF7RI3HEgrNJZnLwsTw0g63Wdq
	FbnfSOG65WluLTiMy0/mY0PU9UTCdivuRhPpl9I0k9kk50OFlqWQ
X-Received: by 2002:a05:6a00:4b01:b0:748:de24:1ade with SMTP id d2e1a72fcca58-7490d68fcb4mr4606342b3a.7.1750433408778;
        Fri, 20 Jun 2025 08:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvtqPX33TWfpQenQzjTpOFa9WMicPOtPgim4QK/sA+F9VvyomGXqrpXFCcbArQzYyMIUA7+w==
X-Received: by 2002:a05:6a00:4b01:b0:748:de24:1ade with SMTP id d2e1a72fcca58-7490d68fcb4mr4606165b3a.7.1750433406860;
        Fri, 20 Jun 2025 08:30:06 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b0a3sm2355439b3a.21.2025.06.20.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:30:06 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 20:59:57 +0530
Subject: [PATCH v2] arm64: dts: qcom: sm8550: Correct the min/max voltages
 for vreg_l6n_3p3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHR+VWgC/4WOwQqDMBBEf0Vy7koSTbA99T9KkRBXDRhjNzYUi
 v/epafeysDAu7yZt8hIAbO4VG9BWEIOaWXQp0r42a0TQhiYhZbaSKsl5NgZI8EnIvQ7FMKpX+z
 aN1sDJS3glJUWje2UaQVbNsIxvL4LtzvzSCnCPhO6H69s/3l3x1eKAk7nB6mcPTtvrynn+vF0i
 08x1lziOD5jxwAS0wAAAA==
X-Change-ID: 20250620-sm8550-correct-vreg_l6n_3p3-vol-a1606e568154
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750433403; l=4199;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=qrK+g8uFS5jCwIrF/y9iS780oV3CUwyCR8EUvUcUI+8=;
 b=AfLuW9ZkJur9w01GFT58VZKkRD3x6PuQcPNsSvEshOAwPO3QDpIBTcvAyiDUG20txPVfOPPES
 5uhxaCrAM33BpqILyLdSxZueNtmXJEKLBTZ1Rf86api4UF6g1mPzP/K
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: 2vGuv5qSNLcAYzYaOK1uOJ4qB1UUOL4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMCBTYWx0ZWRfXxhda5cp7Ri6E
 8A1ZQjpfoHg2tO/JbuC6K4vaUDsosAujjL74z3paSpVqXe3c++qa4Pfa5W2dpxV7IPwpNEvbqYJ
 CRjXXXQN1XRtaVCNfITkcL3CuC+5gkrEjd4YT+Tkq8WzYh1WqqIpoRM0E+816lFR/UODkWuJ7LY
 buFIVAB9kJdsgkBE4C150g5VAWtBJvyrLSsF0nKg3A/oMnDNpYLpxEuFk5ovVOi4ONuGQ/d46LX
 US2d+rjz3S3lA33CGegCOo40x2sauJe/rLshpf2pjS+5I08k2Dd4RsHWJFxg58MieBH3FO14AnT
 pQRodOIQtyfn7BJQ6PE9jemVpakgIahe/nkXQoZd3T/Ww/L09gQ61It06FwG9XSL3P27UOWZzBr
 CmW6bsZR3ZNymqyykIKWZHMUkkhJSAdJSpDys0UbXNXuOJ/glB1VJHZn0MjmAeJrBSva63li
X-Authority-Analysis: v=2.4 cv=VITdn8PX c=1 sm=1 tr=0 ts=68557e81 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cQPDRwz26RPGzTApmioA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2vGuv5qSNLcAYzYaOK1uOJ4qB1UUOL4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200110

Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
configured at 3304000uV in different sm8550 board files. However this
is not a valid voltage value for 'pmic5_pldo502ln' type voltage
regulators.

Check below the max value(3200mV) in the regulator summary for min/max
used as 2800mV/3304mV in DT:-

logs:

[    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV

regulator summary:

regulator     use open bypass  opmode   voltage current  min     max
---------------------------------------------------------------------
..
vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
..

Correct the min/max value to 3200000uV, as that is the closest valid
value to 3.3V and Hardware team has also confirmed that its good to
support the consumers(camera sensors) of this regulator.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Changes from v1:
- Updated voltage settings with min = max = 3.2v, which is the closest
  valid value to 3.3v, as suggested by Bjorn Anderrson.
- Reverted the phandle name change(name unchanged now)
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..4d13d9bdd53194d655957f147f9d78cb4cc9abbd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -859,8 +859,8 @@ vreg_l5n_1p8: ldo5 {
 
 		vreg_l6n_3p3: ldo6 {
 			regulator-name = "vreg_l6n_3p3";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5648ab60ba4c4bfaf5baa289969898277ee57cef..e207bb38d82cf7a0ab896e76d5a184a44b4a3f71 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -626,8 +626,8 @@ vreg_l5n_1p8: ldo5 {
 
 		vreg_l6n_3p3: ldo6 {
 			regulator-name = "vreg_l6n_3p3";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 3a6cb279130489168f8d20a6e27808647debdb41..5c6f73291da185d39d8bd7cf505727d87271bf30 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -702,8 +702,8 @@ vreg_l5n_1p8: ldo5 {
 
 		vreg_l6n_3p3: ldo6 {
 			regulator-name = "vreg_l6n_3p3";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 7d29a57a2b540708fa88fb59e821406f400a3174..b4ef40ae2cd956d2c0a1e46d6428aaa6e5d9c4ee 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -487,8 +487,8 @@ vreg_l5n_1p8: ldo5 {
 
 		vreg_l6n_3p3: ldo6 {
 			regulator-name = "vreg_l6n_3p3";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250620-sm8550-correct-vreg_l6n_3p3-vol-a1606e568154

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


