Return-Path: <linux-arm-msm+bounces-65472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61107B08D7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97FA2164263
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4572D77E1;
	Thu, 17 Jul 2025 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoqYh6A8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E7D2D46B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756703; cv=none; b=ixzrpEYMPk4FsEqL/FZK28qKVK+6xKQk1NTPjHzwtg4w3TQEQyH4k4r9509qeyj6Qa20t3WiLhA1QdmYlweJ9QdVSSyd/j5Jk41TpDAi5WddvQEl8FWQnA/aX3JZmti1N8lsxSpPwwIyTTbua059hOUFtCwrEe83xo26+rmIdvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756703; c=relaxed/simple;
	bh=8fCws8CMRb56c2oRzF5lDcVyb6GSeZNulXhw/17eeuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sz863z1uZutZt2Pdb8rDOz0ejscKdh3pDUeqLpVx58joyCOP+b5OR7GWxohbarVWAGKBPfi6kbzk+eCETPGJ8i9mv0iKRfqJcTi/50nJV7u8iXh+tUubEI5Jt5gqTiujUK3LocKamlVqUdxLXUk2TfJoWm7SrS1+ULCVKPkNgM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoqYh6A8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCEgbV008701
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5dmjx6DoFfD+EgytGx5MlRtogq65KCgsAvgpzSUdgR8=; b=DoqYh6A86OWqgsT+
	F/BMenk5LmUxSNUYWNhrhv08LDJ+Wc9lsrjm7ss/uJ/ekLdCWimiJ/67L/YOykye
	WYcDHRgFu3j4fh7S9xvX8ekUjqdEAmCfq7oFHiaLGOQOYSzdAs9rmn6c3ymZD8na
	Te//eN4BAoA+o+KACrMcY16OIgEDsnLZeY80wmWYyYPtk1kwQK94KcU5/A2DjR71
	2j90e01QJSxOe+aPqh+b+cNPpp9oODBOZcTbTedbijarqPb8LUsX1nvqzVltXHTY
	h+ZJFtQGi/T+zVB8Fi1EPZTTX7hHSgakZDUZgRwLLRwaL2CpGbztTah1r2INiQDz
	sGsjgA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb7pbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7dabc82916cso156091885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756700; x=1753361500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dmjx6DoFfD+EgytGx5MlRtogq65KCgsAvgpzSUdgR8=;
        b=ft3kD7TLgeY/ZQmUBsgn4YK2E19yY2uj66AzlwlshaDHhszOeajhH2DzZ2sox8cL0U
         YUSq2BF+uqaB/wyKAzBaVm1It3K1PKGf2+DZVefoMKPvxFUQZk7I9/Su9ruRLyvqK+jO
         BElpyKMF6LfF4DeJ3d3hZyKa2G/8LwYWFwcvxSbiRcBb9tZGFF3MWJdT3aWjKqN4kcGp
         hoiixtJ+4h9dpBGfU96EKWZ9qIkp0rEUb7YDd0bOhUY2k+xAKdK0BOyn57MPyrbdkoTo
         wEQAx66ml/NM/aYw+jdlrI11jhlIz+HLZyexddlKsi/UbX2jnPABY4qveMVQQy+nG1Gu
         ITew==
X-Gm-Message-State: AOJu0Yzabyj5ymjkUOI2vK9GQQ5YNClj0PTOpjZIrqKlY74N/ENNncEw
	03qSGXFYi0FFDtso9ZM1Um0AkCpsOt4+U340CIWY5l7LWeBO1bUmHMbyH8DTsYb3wMlDyBNtbAF
	la3T/ydTBRfaUHCUUpxxIf/tm/5CbxHpz9+eV6oxujKUQq00V5yigQbs92Wioa1mu4bk2Bl0SOn
	H/
X-Gm-Gg: ASbGnctmFE7lfl5Vkq8tcrVt4zZPa1bbzH3EPVwlMZxVyKZU1TvEbWaQwWdfw1zliSN
	xY45+EGKYsN7mq8d6A6EAhEhQ8saj4cnX35+RRu3L8ed8Ei15DaVHAj7Icyqa0cx5Nhs3NaAght
	sZWks+cDcICGPaxJVBPHxIOQCet3OVx8UYa1L83hCEnm2LDLKDmVaY+Irbt6a3G+ua7FBSZ2ppx
	xbnwAaufHiHhpEXtnBEYKD7QWu9arPdSpRZ7l+6U65dBkmrElTPwWV2svOwteEaaKPIcudBqItP
	Y5d91uusNhPXJPBTk/XiLRSPIDzv+811bS9TxEPynkK3Tdc/htdloXlO1WVnIgJpuSUAbS9Pg6H
	uiY05o9+QnsrwNYacPEvE1sHoOywrYgGT3PxXK+hJUjTDD5nwQ3AZ
X-Received: by 2002:a05:620a:19a1:b0:7e3:4ad9:4885 with SMTP id af79cd13be357-7e34ad94aafmr461233285a.38.1752756699943;
        Thu, 17 Jul 2025 05:51:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtWM46nbZv8/M/cXE3tfo3WZXNY1lQapLohcThkRMOjCJzW0sAKWFycICUqtnA3jrA5dm8Cw==
X-Received: by 2002:a05:620a:19a1:b0:7e3:4ad9:4885 with SMTP id af79cd13be357-7e34ad94aafmr461228985a.38.1752756699407;
        Thu, 17 Jul 2025 05:51:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d08fesm3032872e87.126.2025.07.17.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:51:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 15:48:16 +0300
Subject: [PATCH 1/4] arm64: dts: qcom: sa8775p: fix RPMh power domain
 indices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-fix-rpmhpd-abi-v1-1-4c82e25e3280@oss.qualcomm.com>
References: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
In-Reply-To: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3137;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8fCws8CMRb56c2oRzF5lDcVyb6GSeZNulXhw/17eeuU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoePHYNdvG92c1C0SfA+Uu8M31YZBxd84hLXKI+
 E5Wh5Oe15uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHjx2AAKCRCLPIo+Aiko
 1aM/CACe3a+BwmWFyI8/TiCJ1eTaLw/+/Av9al0JiC1R6qDfGX0AzgmTHNFKGcFZWPLvqglSUhF
 jLhsB2sqvMZY2u4b1q8bbKeeBQ24B9t0WTSdKjW1Rz/hEWtKoL5Uic3BO0SgmMmFKrWeAGrY/5s
 RFasXcpMZtCiyHHx/q+M25qwulI2MMoeiHT+MMwjyymBGA+waW1Bd9j6MtxMGnYXqopzq22HUYi
 hxy2jj7B42a9qxLiSoWV9r4U9a7puNhUSfpIoEhJy7DtmFu9H25YkTfoIMJtrW376O/W+ZzBAfN
 0MBQtlYZ5O4XOMwb852ymrSSIWkKuJkOosGd6nzKWhYRnwt6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: rDv9Z126vFFN_HvuMYJnLam_D_N37zDY
X-Proofpoint-ORIG-GUID: rDv9Z126vFFN_HvuMYJnLam_D_N37zDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMyBTYWx0ZWRfX7IZNQM6tFxsq
 /bg9tp3SQ1bv5R5Il6MkEboHkpCvLLAcAcHLWQhRXZRekH0abfI8o4uwmfCBCme7Gy98hJYme3g
 e8+/rpvyKRmWYdIs86nwbFgAeyN4RqIwdiXgKlKy9tYXkml3WIequm2sBZLFCnHsBF2q7TqwkTN
 4w+E1fqPDC/+d3n9ygJdbYyJP/1hdIiVV9Mtp30h9/DLtuF4YyJGEqda6VcI2htlqOp1+5AK0Fg
 ePrJHc4vO47yMpbRbkv/GuCvJLg9sbojjMT7neVm0CrEVZx+yvrHMt8WpsvlKKRhhRyu4CIJXRZ
 xp0pNXq2NA0P1smuccXBae6NAam9y7QnvGA+w+tl1LeiWbB4BF8ALHwAWQZ8Dp264r7Shp+A721
 ihD/omwyBHvogOTDyF2u002MUkQbMQmqnhbuRVPN/822NeNikCBaauPRxICODyooBy/dyoB6
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6878f1dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bLvTzZXTTUYhi_MxgGAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=834
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170113

On SA8775P power domains device doesn't use unufied (RPMHPD_foo) ABI,
but it uses SoC-specific indices (SA8775P_foo). Consequently, all DSP on
that platform are referencing random PDs instead of the expected ones.

Correct indices used for that platform.

Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f57d7894dc1eacb6a809caa427c6c4..214e2c0e74ef53e8bc57acb8ee88901ef1006298 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -17,7 +17,6 @@
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
-#include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -6055,8 +6054,8 @@ remoteproc_gpdsp0: remoteproc@20c00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>;
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>;
 			power-domain-names = "cx", "mxc";
 
 			interconnects = <&gpdsp_anoc MASTER_DSP0 0
@@ -6098,8 +6097,8 @@ remoteproc_gpdsp1: remoteproc@21c00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>;
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>;
 			power-domain-names = "cx", "mxc";
 
 			interconnects = <&gpdsp_anoc MASTER_DSP1 0
@@ -6239,9 +6238,9 @@ remoteproc_cdsp0: remoteproc@26300000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>,
-					<&rpmhpd RPMHPD_NSP0>;
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>,
+					<&rpmhpd SA8775P_NSP0>;
 			power-domain-names = "cx", "mxc", "nsp";
 
 			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
@@ -6371,9 +6370,9 @@ remoteproc_cdsp1: remoteproc@2a300000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>,
-					<&rpmhpd RPMHPD_NSP1>;
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>,
+					<&rpmhpd SA8775P_NSP1>;
 			power-domain-names = "cx", "mxc", "nsp";
 
 			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
@@ -6527,8 +6526,8 @@ remoteproc_adsp: remoteproc@30000000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_LCX>,
-					<&rpmhpd RPMHPD_LMX>;
+			power-domains = <&rpmhpd SA8775P_LCX>,
+					<&rpmhpd SA8775P_LMX>;
 			power-domain-names = "lcx", "lmx";
 
 			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;

-- 
2.39.5


