Return-Path: <linux-arm-msm+bounces-74776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76186B9CAD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D0F83A76EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F34296BDF;
	Wed, 24 Sep 2025 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4m4foyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1620C00E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757394; cv=none; b=l/NAUpD9rZv1KRHyoJ5uAPo50llHJU+vkGmco7US7RpcTgaYVbdAaHFoiblIEbqVlk9P/1Nrl5HX854BqKI1GRy4M3/VKRYT2AEJNbDP1OdwAvASW3bnUscVTqGYtrlVkx0aj7q3q1I9v6xikjaUDuAi2XdZ+1wQAXlicuXkrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757394; c=relaxed/simple;
	bh=F2qzhll4rnV6qp4p+iiemJejeTwjSJOcKtQj7uM8PY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gVALS6z4CgkoWCQv/QL4yJqRhfj8D4lWy8Vz5qwycd4wtd0kpfF57vNIKZ5lX+4AOvuDrnzclT6uUNpaP0Wc046/3Wz3Bcgf3nnY35+5tR7tGTlJhwBxpOdvAxxOSd/GQR153fc3cSfzjgq1ydhD1FmVEBz+Mkiz3yR09ZmOOYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4m4foyo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCcTVV027779
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OE90dQO3EfHsg8dQTQQGWw
	3g8iNVOW0A6GZ45GxtMpI=; b=f4m4foyoqc+G0fXpjRNgXvG8a0vFSVAwIiZgGu
	L4jgAWGFVxJ/iN1ANyv7hK6DmiVrLC6TJ/1qcI//ehARIVqgrbb+Ayq8Em8wxpL7
	6Ttm9AMGrMom7w7zNidCiYd0ifAopujmEHPPz/0F8AR49/76gwcqDnHs60/Khft2
	KeNXA//jSQQLGBRYRjIdcVMPM2cQ3Xxvi6DoskZrEsKK6crr72MWBep9bHyuF1ZF
	mmY7lmUfpQU/gnutlyYNMpQxsGu7AqKzHENbFT/VDUf8qsdBCcLDaQb8v0UXo4M1
	cUGejLpDhPdiZboLFUwpZUpm3PUk37fitU8Gu4PNREFDjyQg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxduw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77e76a04e42so934859b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757391; x=1759362191;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE90dQO3EfHsg8dQTQQGWw3g8iNVOW0A6GZ45GxtMpI=;
        b=GTgbdkjejQ47eCGnASBRD8Qph51SZZYO3e6d49MQlzptM1WHChsNommApogGKZMQEH
         zhaO2p9Op6tQkvoVnOCN6V/5JqVFj1TSUJL8E3Rev3nfdVFwowy2QA7YVRgcam5JUIfn
         hYdtCRH3R8i0WLRQ+Vw26qF9yjf+qFoGANHWGDKO4/JGDWuOsdtj8BgHc5lMkeOzvcg2
         2R4yVvG+LE5kTHZBDEuDna5OK2a6zuvVs1tJYgnnX06OH4HMk/8xAwm9+DmjmrfRdLfC
         xI8tL8JJsJqua231hbC9CbDIdWqMT590f1WOyiKlXfoz4RPkR/iJ3W1ospTp24u6rMnN
         074Q==
X-Gm-Message-State: AOJu0Yz5RQqwa9R+PL+TSvwVvk0CzxWD4DVyXMgfcVP2/2MbLDysucaS
	VDull7uIqWFucMSrfWhw5BIF+5Ev+HbSsvOhdQT79IgXJL4xUmRMrmhrof8buLlnGIt38gM/16c
	cyrAvu/2Kh1aRDXBVZpfN9ZGyCrOlXBlqmTgwoaC/CDq/h7DM7nMWTM/BasMUuStx0fmt
X-Gm-Gg: ASbGncsxlAW1dUSFunPstqB8SN3iW74XafvxvJsYmeEW2m9hla0+V5gSQ9o3i8nvmkr
	Tqj7kdqxmPKNIDgT9KGj4d4DsXyjle7l3Hkfh+Vvs41Azb41z9BRcljG8nTaoUOrXhotPqDLOvR
	TWhGzOaV/5A5cBCu+vDzjk+XKjN7qUacbPtK7AZX6KPMPcUgaCKqYpzJvPXQsm5FtOP2fKbaNyB
	IlRnKqUo9ERh9E0jivO1T7kxs0y6usNfp+Xbw/umgVE3+/qm61vefsV6flQtk1e5Yvsr/d80D3E
	UCkvmi88zO8EGvWqOWKaa4JT8eh9mptsfhnj5T6NubAfxmfw7L82blkVciBN6QlhV96aVy6nDd3
	TVCIaw5TEtcvZyi8=
X-Received: by 2002:a05:6a20:12c5:b0:2c2:f61b:5ffd with SMTP id adf61e73a8af0-2e9a3aac3damr690797637.10.1758757390964;
        Wed, 24 Sep 2025 16:43:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdM4ijDgDGRv0rYQ1+JtfSlIAWMcIT/CoFmlBklSjquUqoOjfg/bMsMSIQAlO9tyRIZe25IA==
X-Received: by 2002:a05:6a20:12c5:b0:2c2:f61b:5ffd with SMTP id adf61e73a8af0-2e9a3aac3damr690775637.10.1758757390530;
        Wed, 24 Sep 2025 16:43:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2733fsm183430b3a.94.2025.09.24.16.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:43:10 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:43:06 -0700
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present
 on Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pmic-binding-v1-1-b9cce48b8460@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAmC1GgC/x3MwQrCMAyA4VcZORuYLRvEVxEPbZdtQRZLIiKMv
 bt1x+/w/zs4m7DDrdvB+CMuL224Xjooa9KFUaZmCH0YegoRn1qxblIwi06iC9JYKMaBaGaGllX
 jWb7n8v5ozskZsyUt63+0JX+zwXH8ALob7q97AAAA
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757389; l=1296;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=veyw1AffRHwKPZqeOLxkvoQHic8p84t5kQzNdVCN5bg=;
 b=pqB9lAf+wUUmxxd20vqrwB/ZnE0I7HxGq5hp/VrP2fLjSw04F5rzW+wbuau5E0nOG2rApbvIm
 IbrLWuCbZYdCHSJdwHRhT/G2j915pwIbZ78vPVHARa7sJxPVj64MWBr
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d48210 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=s4ALIw3xRCdf1ZLDqIgA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: PX-nl6pVF1wgxOLp_bWLbelrtk341DzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXxQkSM+PPr1dM
 ZzvxJ3Gx+bkblr2R0iHsU8gjgvvc/pRG1ejOrIzGaa3WxHHJfYIhPEef0X52CV6NEvyLF905AFJ
 vLaOaV9jVGYEs+3XWBDGkhOiYhEiIz/bxCDKpFeS0GIkOfut6vqFojFfkrUmP4yUbkEL9UovZN0
 jGGn29mRPa5Oidjqkog2x5Rsej15k1/7LH86FNFCinTcdUW5nUgPgvHMxlYvPKxrK2jl0DufvNe
 lvkeRiTgf6oDc4J2zgODmoY1wTwpxh7S6Qm9XgHx5QrkI/MDOUyJSH1I6kbpWl1irNfwTzlkOf/
 AJY8sjwnlIgOsH+ya5LjI8EmLDakPQRZBYYAYhwM2Ys/13y4zOLWuGT5P/TZKXzPST2x7rBIKD6
 7JZalaMM
X-Proofpoint-GUID: PX-nl6pVF1wgxOLp_bWLbelrtk341DzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Document compatibles for the pmh0101, pmh0104, pmh0110 and pmk8850
SPMI PMICs.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1..427023cb11c5 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -78,6 +78,9 @@ properties:
           - qcom,pmc8380
           - qcom,pmd8028
           - qcom,pmd9635
+          - qcom,pmh0101
+          - qcom,pmh0104
+          - qcom,pmh0110
           - qcom,pmi632
           - qcom,pmi8950
           - qcom,pmi8962
@@ -87,6 +90,7 @@ properties:
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550
+          - qcom,pmk8850
           - qcom,pmm8155au
           - qcom,pmm8654au
           - qcom,pmp8074

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250923-knp-pmic-binding-96c933599fee

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


