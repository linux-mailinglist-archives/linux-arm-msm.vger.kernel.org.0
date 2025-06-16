Return-Path: <linux-arm-msm+bounces-61377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF9ADA8D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BB5E3AA1D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 07:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347B31F4706;
	Mon, 16 Jun 2025 07:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRERF8be"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25CF1F4168
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057471; cv=none; b=R0S46oF4w0gilsOSXppDN0YRXk2ondsZvQad5rm866QvLiV7AEZrlQ3usngOPGN7M/NZkgA8FVbvdOpvlHfK7cjUT7xAQaadVXylGz25PXofOWUB1jheVpowcgkraG0LaotAvAeJpwofQHXlJym7lbcV+pYK4EGGC9aOVKc+3PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057471; c=relaxed/simple;
	bh=ZOHcPPpzGdQk38BOw07YMrFF1gqKRMRweuVFt0is6wU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EvaJeFbTi8Ny03li5BdTn5xflHCDFJ9IA2F0eJaYZPxDc7PvfwWQGPeWxHVHSwEukVqIUuFHp44eCbPAgyOBwRGd9PzZ9luHNRe5gA+6EvVKB4wkpktVqpdFi6UfRx58nXHRezWt1IvtoVVVeKHpG/K2xGHCVwedggEdM89Ai8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRERF8be; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMjIpa032348
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fw+aggTOrJ5
	+RA9xTss/gBLVYENBQWUKwq4P64eQhiA=; b=dRERF8bemiA/1JgCtH+ZiA/wW79
	E/AG1zEeS6yg5Q79TYXZ10SHciZCEHGFuJc5THXCTtaNlBz0+TZ3K2s3hEnsQ+e0
	0Rn3klNw7Nt8AOzRybm1x7LLm1GUUWzUZp3pm3t4H8VPoMEhVYloy5rdN2WNi70J
	jns24+AQTHF+frdUZSLa2cqm/GQbkNU17FitEhd/6rotD5zK8AMhGugFnkm5mwye
	K9PLSo4TxMSHYNi5g+i8nVWppbD+irSKo36qKLGjlNTawo11qg60sCn3aoGwY3cw
	Pd8BFNvmUn8MEBZsc5DhZKNVoGWEJ2PYDIz5rEmwDASUfSq2F0H4Wn7fTOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfbewe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234b133b428so30084105ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057468; x=1750662268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw+aggTOrJ5+RA9xTss/gBLVYENBQWUKwq4P64eQhiA=;
        b=PR1xrsFmQd1nyc/inSLpq3Oejb0CExLYNB4014Mci/YFiyrlP5mvwRd2BwSD0mj0VW
         ZuCHhohsjI1OA4I7VjdpT1VeoPt7+ZQymfq1uOeMxB5kZ70Rk/JRcmgekP8vsjaEKN/W
         abjYATLmzlufcGYLGZ2TXrN0uSP0lmIqX65Fu/JTLFKiaq167JZ0tu1ieP+x/CwxxUqI
         VQNhEtlhvaYR9aHX42whfLAsMPPqM0s+rbuq/YRe+174quziOv24qp2OxXi5L2U78lvx
         B2eUF1hdHyrcWOidOVTnFPjCYPbmJ70ZUVlI59ueek8BUkCTfabahdA9PLBDS39D6orG
         o7PA==
X-Gm-Message-State: AOJu0YxwvbbX4n6DGQru4rGS+rKuVA/n78xoKEw7ZsJDRiP58AfPa/or
	sRw02cAAJnPheTImXTzs+WRU883BGxD0Yzp9JfV5Ca+rKsNyKmHl6DT8rZwsuJ+yZKRPx0124Zz
	S3AKd1R8W10rzFjILXscGBMMJ4uwtc6/KODX/99LLe30CsBNorQLN1BsaKtVF5wACaRvV
X-Gm-Gg: ASbGncsfeSJH2DTFoUMOWOolwBbenYiw0huiaILMiABWP2lxlETNaAp3U+6Z94DMf8q
	7AY6/nQ4w4DXajOKgcvwkz2GDmUSOsiNkGcU4udqXdYBu0t3uXIz8Ctuy8bT1IV+A3H8Fy1M3UF
	dhQZy5mLIdd7S5bIN+58wcQYai9FgjI+b+ovGBLjGZv/l4n4q+JbyU+IUJ5eXpy5ttQ18RH5VIl
	/11zcUFebkYLs4xC0mGCxzd77zafGU5ex2jS0KqEW+w21WEb6pWgtdCB1umLYk3F8Un2kad+wTm
	MfZhjixoAhXsO8+SaZv8lRhI+G3Ld22Rbqjvxt1H/vxS4S7bSCRE0cwYoEM=
X-Received: by 2002:a17:903:1246:b0:235:dd54:bce1 with SMTP id d9443c01a7336-2366afe7d67mr124587235ad.15.1750057467875;
        Mon, 16 Jun 2025 00:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEREkHMHAsNS40cb688dZG2Myg4m+4JQIZzJuIqapIgsh/RzDVfI7d5uem+4qxgPSxV2cxdsw==
X-Received: by 2002:a17:903:1246:b0:235:dd54:bce1 with SMTP id d9443c01a7336-2366afe7d67mr124586935ad.15.1750057467493;
        Mon, 16 Jun 2025 00:04:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19e3sm54435825ad.82.2025.06.16.00.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:04:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sa8775p: Add gpr node
Date: Mon, 16 Jun 2025 12:34:04 +0530
Message-Id: <20250616070405.4113564-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0NSBTYWx0ZWRfX8fkcRvxjVsDF
 XH5JEnd3xd2yo3uSAxSsH2UKS8F3qWwCjw8ql+otzew+HPYzMK7MdquRM+//we7rrP2blFBsClp
 I0Y0WKXTFkxCTw2GqEz5v2zeO5LEuOs++Xy2ULqVMrRLwZHzjbaKeHnaeO/lX5cxpeKs/AmcgYK
 i6juNIEMPgLtFpE1BwRWPwPuHT31XS9trLqr91xlwRAjqV+f/9kpE4iEv+RN7VI0TfDfKQYMWFd
 1aDiVwjG7A8MzD7l9ZsNhCrV2nTg09agabTYD/Foq/m1q8drUHilxNymQJ6vv+zhybig0ZEAMg2
 Zf2+Ync9iiP8ILdyXb7q1oV73aCs3IWZMKa+/30n9Lba9MpjbMHNhaeUBH3stycoIVPMxs5PTcu
 VGhL4nA7W8A5gR7teKTePN/ooV4GKG1P/1zCTpOApMCcw5Rwrb84OUqos5VsNLeQkq2a4sl7
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=684fc1fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=UhVUwdw8r1UmGneQsTgA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: j9VtoScjTrHoEY5D31pQ4ykgfuQpyQ-t
X-Proofpoint-ORIG-GUID: j9VtoScjTrHoEY5D31pQ4ykgfuQpyQ-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160045

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index acc7b735be35..07ca6dd4f759 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -6284,6 +6285,45 @@ compute-cb@5 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x3001 0x0>;
+						};
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 	};
-- 
2.34.1


