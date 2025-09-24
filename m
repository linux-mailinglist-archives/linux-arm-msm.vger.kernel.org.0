Return-Path: <linux-arm-msm+bounces-74738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860DB9C906
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 902A11BC09FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762942BD5AF;
	Wed, 24 Sep 2025 23:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERR71+PS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC6298CA6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756549; cv=none; b=LYrj2PPTMs+DHijRMXv1MaqYWN9BIP7bNetcgzG5x2xyLJobVImyvZSqAvBfYH+UOV0YR+LGfpa9U4r1nMGlTp9HM6WoyjhAcvqr7/M4clqpSqCOfMVoxC84Kr8pwAf0LGtMvKb8Z/vE8FiPpTfGqXCoSaYsgWgujgcpwI/chE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756549; c=relaxed/simple;
	bh=jWd78DT0Fr8BpiI3OytKO/eCMLUF09XL9ggxo61EL4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LW6/o5818NWmHT4xeNtT5T6sjMZphSVe2avqUEnvBnZU72HSOVhMkHX4QVXhJx+leNZIlFNzLGtVPOSzJaiOYFuXh/5H+goe2m7nDlmletHxwS/wGDr74X5QLuF523QZjAbDxtaT8KBXKsOBYm8isDC+gdAvHEvkqy5ejA/GY8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERR71+PS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD7Pax019934
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8pW0sZS/QufsY4Bkw7D4M7tAZ8fJtgfaJSDVfDSVr74=; b=ERR71+PSYocz9mPK
	Bj6PQQMyF98CuJxkrPJ1Pc+k2wMNbxkum2EIBqoowSjaL8+koG3HJ88uvST+X5MB
	c1DP4Wf2Ha9i+uUKLaCbBfgY6qPewYPOnJ9pLIkckP0xPMLQqaH9XX5m7NYOblwx
	9o+2e+ZUqUPUBEYSAicVG5NLU4DfcQ82XQkd7/Udu1bF6UGGQPi7iavrPC8owJW7
	QICJPQceWasjXk42wsLu38MxX/0VHotvCm0aLU78a9/JXpyZNFHwmbEhrwevfmFV
	bKjldap3TvXpzUpZwRlXc2snM393yLzBbMsrC3F5Zu33wJ0ZivUkwf+dLMVsA9k1
	4rNuQg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy8gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b55436fff66so223457a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756546; x=1759361346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pW0sZS/QufsY4Bkw7D4M7tAZ8fJtgfaJSDVfDSVr74=;
        b=hyM5ZS0Ic7eGadK9DLviYnN4jLv7KzgcF3YWRMkhhXo2YD6IkcLiDQ3rq/6q+qp288
         7RawNVtChQBbiX/bf9KC+EBtEWAYCA58ilSsGUunovg6dE2uGiGJSK0iQqx6jZfD+YC8
         j+PCpFKcex0KLUzp7dwYIEVCC6V3CIsj0Yz7DKz6LeI5M7JNnKIAVX1ZuHufi1ySjHSx
         3gwuK6tJ4Jx0uTBP14ywismvuzmjST6HC994hFYJyJn3THedroo+4NxRJEdlkik3fM/V
         WmI7hqBgcN9M/ZBifoE8gKm/q1ibkoSmg3VhgYsEfVQtpzpWDdLw6Yd8SyLpBvUUsmrg
         VFCg==
X-Gm-Message-State: AOJu0Yz6gcD4zRpPCV+er9AyRO3hF0wOYX22OXMbER0PWs1QQePkbYZ8
	+Srh3qZSBL7qSkKc+MIgOwUJn0mlzur/XB3jf+KzmXagWEl6049YFV/5Hy90EPVN9Khoa3M6b37
	nuElJj8+GjVlzB/N377qPaExOuAx51qrJdmrpcDBNY3/pRq8FFeG4Mi1OUSUV2PNmg0N3
X-Gm-Gg: ASbGncscJ6ETqh3wnlY68j+Gvg0jFaHFSEfu1EUf5kMO/Ru389EnF3wIDn+hTn53ACq
	nGmIycmphqPiWEtQQ44mQxZLvOaz5VeRCVQjqEJilV5T8mtXJlEaRWoog2OvhvnIjGMEoApUobC
	hIlm5uSCIQLd2W5dFmFovVK+jv4a7rVcxdyBHMpgc1SsH4Xugv5CbmSV+5I6RxRjtzWkeKBjWCL
	mR7h7Ad6GCdh0ozpezc0snhUyKNtzvWjYViZoJlWMCj+p+mg1yDWmDYLZK2tczjImV4bjzkm5+h
	vFINRnA6WbNM79/yuydfjEx10B9o1vk4s9qEHiannDQrSpKeVs4Jvjn/LgoL9ECAML9ZKGRAOq8
	mDTo39F7AdtfK+zA=
X-Received: by 2002:a17:903:334c:b0:27d:6f49:feb8 with SMTP id d9443c01a7336-27ed49d2f57mr11599715ad.16.1758756546157;
        Wed, 24 Sep 2025 16:29:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxjctrlKrupwMa7wpsVyrsKMoSCGPHZ4ZD641kuuwi66f9z3YNEOdmo3Cj0DuJRXVNnpmF+Q==
X-Received: by 2002:a17:903:334c:b0:27d:6f49:feb8 with SMTP id d9443c01a7336-27ed49d2f57mr11599475ad.16.1758756545741;
        Wed, 24 Sep 2025 16:29:05 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cdfafsm4292825ad.30.2025.09.24.16.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:29:05 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:29:00 -0700
Subject: [PATCH 1/2] dt-bindings: ufs: qcom: Document the Kaanapali UFS
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-ufs-v1-1-42e0955a1f7c@oss.qualcomm.com>
References: <20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756543; l=1012;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=pm/rXrJyIy7XydqwV6FEZ9WPS3qV2+bd7t1bjxFXOAk=;
 b=JwWRgROgUEpSUj6UpssTKoS/1MyfEY7uBpbjqPNCyj68/xra0OlfcuEiDWPV6Of9aGUgY/84b
 +4p9VK5nutBArNoK4nJDG5akkvvsxan9LprulGdCmzNS4GrVxuFbmao
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: nHUdLUBPAiySvtY9PMbtL4AAKtHo8xJc
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d47ec3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dkR0I6OD3irOzcp_LXMA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: nHUdLUBPAiySvtY9PMbtL4AAKtHo8xJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX81WLXiBoo8WV
 I20WHdkzZ19W1oxlWUMbSTevB8LVSohs4N7lemN/6BARLIrOA4VQX3Lm7b//40RXj4qCuS9NybK
 5pdCOEYcsmA5Lo6BMvxAf7MqOnTK53yYqXNazuaLv/zzBslIFxZcB3H1pSkR6zP5M2fF0i/a51z
 kzX7440W6Mvjy3xKL6AG8pH09YWck1pdT7cytJ1zzVmVV9Se90wfK/TDjqHMWIeUMRD/W57khgh
 SGm8sDdArlxZ/yru96rAc01lMlsOezNgWFFPueh4yMW+xL5MbBbMYtGDyI3s3Nwbpznk57K6qGW
 xkXjMxF0k4MGuKCRTzvSfZhB/aWDa1dRUlQs9zSxoB0M2sPL4IKdKJVN1mIqYzYqbPc00o0nQM1
 OtG7y3lp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Document the UFS Controller on the Kaanapali Platform.

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index aaa0bbb5bfe1..cea84ab2204f 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
   required:
@@ -24,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
       - const: qcom,ufshc

-- 
2.25.1


