Return-Path: <linux-arm-msm+bounces-57260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D070EAAFBF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2DA37B817E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B58B22D78F;
	Thu,  8 May 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwVQMrkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA922D9E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712016; cv=none; b=C1ZBktziPod4IS+ZgAnOrJZTTvKH8CxrBA0hpTonlMrLx/34juMiIP1a3tb3zLZG5aV6YWhObckb+YrnHQ/nS2A1yvZ2RXHcj+m+gyUfClRdQM9Z155IwNtmv/C5EcJxe3Gg2eLy7+NiMvWmvxUTjpWSCoU8Y/UiIEKmSH8s9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712016; c=relaxed/simple;
	bh=00UIv3EZjfp+e19Qr1XiCLjcZ87sY1P79LJK46Z757o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mdQDdryOE+wLJYgyR4rPdY7sMoilF0+n8KvBlYR3rvJt5hfq8JlDl+66CQpHBts0ynhtowhfPvysLFzw/dHe99GfwJy//1goK3ML0BwgFyDTFq6O1q6sSa3Hvbamyxh9NaffvCDSyqVUoVymsc+XZbkHg7wAaWPigVnHRkeK4Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwVQMrkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DaDkY009212
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ria+LRyG0hX
	Dtj4N4iCruKkzRBUm5VLACf/+IbNd4TY=; b=BwVQMrkKiNsph28DX9QKzvUrspU
	/ZTJziXwCwQXhtbweglQ5xcPgl4vFRG6vXOpIlFy0HosBmw7NcsSYpIeEPbwejCG
	f12f2W3rT+kAdFt9xBkhBKFyzZCz3O77VDUyrY4KFIEwvv42j9xu83TPYueFnaSv
	UAozKH/R6XQ7eOCqut3tLNGuxKQ8vjOZV8uA0QtawpAPPZLo2Iy54TU87qx7xZyK
	FUnL9R2wRoihLmqaUyGPAKDezT1ERa4SX6AcibplTXzbBK7DAtEJnk5rzWL3R9oU
	vPjb96hLXj9Sw0H1IhMz7SVH17oUSV7kPyE1kBBYbhemaum6Dqp9u26bAsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpesf2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:46:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e68e50f80so7999605ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712012; x=1747316812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ria+LRyG0hXDtj4N4iCruKkzRBUm5VLACf/+IbNd4TY=;
        b=kiat5d4EDLhHIvNWwsH6g4Gqy90ZzBDC/Mc+h6zJ7HWWUXI/6d85oCjp4147zr7rvI
         WGa1PFUoWQ/bkpNMWk5WdH0LvGNDoqZo5bawJxYSshU99bHVe/7R6N11ji8kP3kG0Y6Q
         uKYYcFm7EdVnV0Y/H0iAl20TbtmNcfrZ98yQMBfu+NLRzkGE8Z9OanNmJcQCHSqUOtPm
         D8JeAGhfIs4XAffn266mNziSuBJPn+GkyYc1CmYqlEo+XPzIrWRZXo0n5Tm1Au8+va2q
         /7WOWCvbAtQJO3YjkqFwhEJMpkQkE7YbrEY2jNbKehltwjPNVOg6nNWElSr2IBX+/agk
         V6qw==
X-Gm-Message-State: AOJu0YwPLRvpOhVNj/8o8b6JeDhGsBEBqjUoAUHwafRg1cF6IJFgWln5
	Du7NDuyKo2xUFDOehajB3u2mZx6RLdAn9i3hpHtiFv0by691GxJjrkVdnOLrz9SEQ3fNCpkqsU4
	VsXWRGIRB5hDsbIPvmQCIH21NfVGYKvQJinO9COhoaqGJ9ZNiEhe7GxUKkJxy4F6RN09UuAed
X-Gm-Gg: ASbGncuFS/MBAqm4AfJT1aqjE2B0tVyoejk0WFPr24qvo/evxHNZJ9vnjT+ZPj4/KBj
	KX1bTnslRVXJyGiCHeRfXuxERI+lbVMU8qNko1DvYPVWQzgBcsqDkwVrZvwgI/azPVDOhrqsdqo
	UxcQFg0yB9c5axBgvvb6Gr6h2CqAzn0e9uaIzLNtoaQg/xAZvDP7jMXAhk/svHLr58/Ccoo1XAu
	bJYKp0Ec7KF4lZSh99v5HRek08W9QBrcUgQtaN/oW0arNQ6FKUR0wSdSn+vAiWo6NpSc36XxdVt
	dS2PaLCsqytvc7szPgMFmzAhFyVX+/o/+BBcf2M=
X-Received: by 2002:a17:902:e890:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22e8560d03cmr40451175ad.6.1746712011976;
        Thu, 08 May 2025 06:46:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrRn+7wTjv8yheir8mwT9EEJRVfj2QZD+8KvMvdxJ/YMsQjewJtkW+KGPFMQztegPOr48xCg==
X-Received: by 2002:a17:902:e890:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22e8560d03cmr40450845ad.6.1746712011622;
        Thu, 08 May 2025 06:46:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eb56dsm112250715ad.23.2025.05.08.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:46:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: arm: qcom,ids: add SoC ID for SM8750
Date: Thu,  8 May 2025 19:16:35 +0530
Message-Id: <20250508134635.1627031-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExNyBTYWx0ZWRfX6evde2LpUmUE
 0QSyg9uH2XDiZN3NohDpH52rplky72BlSQ300mXLPUrWX7UpYcOnaiVDSCSFwEwP4j88UJmkpTS
 nr0WFarRouZ2m6XB6t4RiHu2nGhlNAAEd3w05tmhCMt1oygHIBnby8wm3ijmxLKUj6Y/7U9yOxz
 yzzsdKcmXV46pjNsFkqwVzMdfjbDlImssvocznVlk587Sf/OwhiJq2Kv2yGPCT8UShjG75pNp5y
 uylh0jzgGelcikxv4WEwGvairQmtKbJ2Eg1AVuwA3Jfc++p9tj+yXHIRyQvrwHcnhsRD0rovMLh
 m/dNqp2KbWamv7X5ixU/gwf4ZPDhAvIqPZuNbDUXNju65d6ptzHo80sVglGjOth3KcjtSrYREQ2
 L5Ne17G5Tkg4GSwR5XVB6keDHgImunN2QZN5QkVwZ43bKaag2YUtSgR2zNHmE1Q+/Zkz69RF
X-Proofpoint-ORIG-GUID: hHLAFkTx771d2swqTncDSChEhU46r3So
X-Proofpoint-GUID: hHLAFkTx771d2swqTncDSChEhU46r3So
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681cb5cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nBpc0M3TKDbq6_S52-cA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=948 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080117

Add the unique ID for Qualcomm SM8750 SoC.
This value is used to differentiate the SoC across qcom targets.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Fixed the checkpatch warning.

 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1b3e0176dcb7..897b8135dc12 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -277,6 +277,7 @@
 #define QCOM_ID_IPQ5302			595
 #define QCOM_ID_QCS8550			603
 #define QCOM_ID_QCM8550			604
+#define QCOM_ID_SM8750			618
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
-- 
2.34.1


