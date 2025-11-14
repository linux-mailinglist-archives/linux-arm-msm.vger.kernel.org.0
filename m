Return-Path: <linux-arm-msm+bounces-81781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D0C5B6F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 06:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A483F34FC30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 05:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461A02D8774;
	Fri, 14 Nov 2025 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIIVqjNG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAYSWo2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D072D8385
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763099820; cv=none; b=uOQS6l9sAluTo+X1WlpntszYrVG9xXJsJ+ybSMTbk2OEoicLzfQhzum9i4GJCGuayyB1M+VKXjAm0Gj2jKHyp5nmCpFXLsGRxGO5L3tpdlgi/OhS523wE7DKYhoVj3Kn1FJ9iQT2MtpSaWrhW4+VGnE2FPce2zfT1YRA0Idwdp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763099820; c=relaxed/simple;
	bh=NYENYPsMqW8kDzMQMeJHnVJFMHwo3NmspIflUb+d5HY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g4wW6XnO2CdZqAp7JCPjRiv83dEWgV7VytTrfNTJzfPhdfN3gsTZ9rK9WbLPTmoMr1AJp1/UEAlUvCq2KGf3lsVAU/8UMq7Rn0gHm7CpRFC2zVRYERIKNhRwyryS11ww+l9mbByO6uKl+YObc8akG/giYhicBtnNwWPGowhPNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIIVqjNG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAYSWo2E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMbDhp1495186
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gvtEwgzFNq1q5fCeDy7wWOVTOsFfl5fc+cO
	An6hsGQI=; b=WIIVqjNGt2qOeaH/W4bhgbB66/6ItJgoV0xfF6HKKQX30bd+/LG
	lLPGp240vKsdN4s4N7l6R1vr8dOHWO353JGP1uAboBp/3FUqaFmjG9MVaEUAkm8M
	X5j8pecPo8VOZ6RCX5eOoiN0fUhn8Q8hJKM5W/i4lsjL+wjLPdwMFFi0WSorJBNH
	EnuoPMonKVf44+78lL8jZA4vnJE+OuzSfRSu8p0lg5XkDGTKAjBIsJNVlctUfY/T
	goGQdgqUzLbMtHfpQQthT6GPzRlsTboHVb6B3PUO2lTfecNrWnHcVgUlTe24LKhD
	9gNth6amx9wrbVobp8cdgJece0ojEnWcdaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hs09j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:56:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dde580c8so48510375ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 21:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763099817; x=1763704617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvtEwgzFNq1q5fCeDy7wWOVTOsFfl5fc+cOAn6hsGQI=;
        b=ZAYSWo2Eesw4QhATQI8saR6BlIQgMIIId1/8ZsHYupqETg2jKqzGMnplJhAJ5O4c8z
         FEzmF16khOtRsiD92UX4/YUT+lfMaykU/pU5nUXk7sibHfoJMFeQ4Gj4iyRRwC3afRtr
         lTlHoKLMYA7M3DqAg0h018PoTPHv6Hdb1A96ZNnvXtxuWuSls1UJc02kGTj16B1Kqocc
         UIN+37C8v95VncwQ1xWzp3PDGG0ihRsXwNJ8HFTW4CdqG8AcpjXiav/dZiGQiJMAjjEE
         9R62sjOJhkergSQZugr7crWXJpgPYIBGUtELlXHZIittEAfT/XzqC9UNetfF0sWdiCxQ
         fgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763099817; x=1763704617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvtEwgzFNq1q5fCeDy7wWOVTOsFfl5fc+cOAn6hsGQI=;
        b=Ly16ERSbdkuA8x05Kky++kHpsRkp0iIBTKXkvkpp1LSF2vMBKNIywrsGc0BihtKqIw
         fT0Q8dqGMzaqlG6cGtd8+tw6Q5pkq3y3mGiVM3sKuC5I65hsa93hHp8jOhxYoduCtIHC
         jwClQE/2Oi7F0juKFD11q8MN0QkcFfoEp87ZE6luskO3C1L69JFEZp+qSHeUnag1VIKr
         7zYR7pKNijHsajqldQdEzKerKOPECSeO5+xNOLn8wPxBAjK0NRo4KphNuNdshFbp9bw9
         Z4ROg7Yx5Vgfu9LtmVmauEX1ItDt6YFlyK6qEH+gS5yNRzewRqYqufYhU4S+BYM6XpWF
         6FAw==
X-Forwarded-Encrypted: i=1; AJvYcCV98oBZFvjt0Q1LW1yawt7NhAKu1FmoXvtu7/uZnHjSktj5kRVVfbWzH8X84Cl22oN9xydZHXEsRLo6/Sgz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/aFPyc0ud5JXBsRC/SCn276/kFpO6w/YVbQEyXnEA27hoie8F
	wyMOl5OYOB6g+RmREmxxZ2H7C1tpfzPFdIGXuj4UZCjBbBfjYYxPzECFXFbyx9dGhG37/eUQDL/
	Kg3veUJE66niEVJBvb2dB4IhwyEByS93FVyoAqcr2YDpinKNZt1Ku2UELkIaBRenRuG6b
X-Gm-Gg: ASbGncs7MG4ytP/dz0rQNCinBdtYszmUKMusMLKL5uTCkWUPNWSB/VymtgPDDeFDn2J
	BYfZZD1YFmGgFPumD+hG8jNzHU0bkQY66gwfocBootSj5iWfWr48VLIZQ0esqh9QyU12iXGZo+1
	YyE9LIHJlW0B4N2yBXG04rs0Xy9orRl/Dchb9084fmiI+Pr+FhQG04JpnzEsUzPVlW3n4zMCuUZ
	LrPklo50Tg48pTPgustdkc/+mvmBLUSmTFFZNGExmcoJceTjnLdHLlnw0QSzej5dCWnvgcrkBcy
	UMOgrAtzdOxotFG1NuKroNXrdDb4Tl9dizKpsKaAt1kwcRRmvxAgEIHviGNqFuUlTqcGN4eH76V
	3bn0Q75+EqCztTC1fL0L0i8tzYDZSS2XPbGEeoK/Vj+M8erOJco51B5svvvtYIjtwY8iJHQE=
X-Received: by 2002:a17:902:ebd2:b0:295:7f1d:b034 with SMTP id d9443c01a7336-2986a6b851dmr18732335ad.4.1763099816767;
        Thu, 13 Nov 2025 21:56:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJJqlIQXHaRJWZaTTa06jfV7aJTXh3fkos3M8ZJPFn3B216IgOm0I6AYwA6IWRJT4/ptLT/A==
X-Received: by 2002:a17:902:ebd2:b0:295:7f1d:b034 with SMTP id d9443c01a7336-2986a6b851dmr18732005ad.4.1763099816280;
        Thu, 13 Nov 2025 21:56:56 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc375fe4da5sm3677837a12.26.2025.11.13.21.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 21:56:56 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, ekansh.gupta@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: kodiak: Add memory region for audiopd
Date: Fri, 14 Nov 2025 13:56:39 +0800
Message-Id: <20251114055639.1050-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Cm3Q_8q1FPmv1EiyBUCt3V6pwYmxE9uT
X-Proofpoint-ORIG-GUID: Cm3Q_8q1FPmv1EiyBUCt3V6pwYmxE9uT
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916c4a9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=44lrlEWlgvpwheegUTsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA0NSBTYWx0ZWRfX/pRZ7D6fjsb9
 ohySkd28uPjMTSD6SYY0VWbpW2orPRuwBs3g2iO1ueroCQqB2R17lSFjzbc918qFQTkGsMCPGcj
 Z1Sngw6idor+QgVyrKuItUvHClAm3Rafx53hecyVgeqVGH4f+oyIPfFKfhHiKJaNzI5glu9pArx
 JrGh27YkAbnga2uABi6ifXelw2ouW3rqD3iBFerRuujnXGSjDPBP7xJAv0rOL5l9tvNw9sdMIIc
 W0f6SCRoAJQGI8D9rVKwCOz4mjFvBnYnIrcYDoosqiA3YvmsTIEe2zClUO2P2r6Kn8D5JGc0jlR
 ikEwPc3+vl4QyiIl2x4qga3h0F2MI/HZJXLT4+eUDMTaklsXZSZ5fWvaaE2ZC43B5asBkrMDvCV
 HKqXW5fc51jG/GNl7qcVuv9L7sNhSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140045

Add reserved memory region for audio PD dynamic loading and remote
heap requirement. Also add LPASS and ADSP_HEAP VMIDs.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 3ef61af2ed8a..0cda9af98dd2 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -190,6 +190,11 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
+			reg = <0x0 0x9cb80000 0x0 0x800000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -4139,6 +4144,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+							  QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.43.0


