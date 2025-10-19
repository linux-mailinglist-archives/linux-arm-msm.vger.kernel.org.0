Return-Path: <linux-arm-msm+bounces-77893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8978BEE018
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 09:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C04E401FC2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 07:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38F223D7D2;
	Sun, 19 Oct 2025 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zuso0Hl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4545C23BF9C
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860631; cv=none; b=tmknjKB1GGYLWuj29/ro+Ke65+YVtpmPfUYO7KRueF9/ZhlTTvFbOjfiSjUFB1Q4pMcKcMAflzUL1BTikpPe+DfFvn7BCX6vhT8Jo6HIIyOrUcBV9VmTeXfryOHniLSwdiH0VYWJe3vOrhXolZLweCVUzdg6yp7HeyUHZOiVfGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860631; c=relaxed/simple;
	bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HajtxjJbGZKZEEpzPgzga6tibN6V2sV7IgxCCJuHDkjYIBPbs8PTAUolsUwXl4NrCABL0JDnM2eYLdqj7bwSxV6MzqXnWhTYshAtFKDgh1JmRRDQVopfwpLp0bivxwpr0eyTDdfmTKm4oLVPsilpg58nNhjfRJ59Tzb0JSxhz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zuso0Hl0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J7BlKi004615
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=; b=Zuso0Hl0+p3CeeOa
	W3DSELNAjdeJRbiiHI6/YJtUwBlf/wog2BEU2x9o5T3LLi74OdQc/QlbNUrdcy0A
	OMDpovdQsvosiZ92YqYQw8EOj3Yi9b7IBlE4zZWeNVSLGEWz9VrScrpYPKlvHs+e
	3plz2yZx5Wo5sqY8cC0AZ6H3awDjSIlbbUm6lRK+YMQm2JtEl24AzBKzSebYs7lR
	TuhLdgLPH1hk/nlvgeMfosVrhXU79VYKTFdF0ifthVLDmI1pKT6hmJyf+3TNJ1Y0
	pPkttr+yp++JR6OWwMampIKdCt9NBQf+/9w3BfwOTctbAJLlPEVxvsBTpOdzhrs7
	avYwkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v4699wsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88ec911196aso1295884085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 00:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860628; x=1761465428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=;
        b=KQxFGkhghZRG8tQmLTpzipZVWeG7asgW7k3HdCWmYm0e8gvn0ZDu9dNGEo5eU4W9Te
         CFru4UoV9ulNd5Sa366rBJHlSGIojJBv8KxqHJuPsB77hKOUhyg7iBwwfwXguHIBL4TJ
         gMIzBucpKunOkIzAHPQ+WTnb7A/UBOmxqFoDwq+zekZfKZf0fDihy84fug/3v+GMqt3/
         dxzj1GTEjamAUlPsf7FVYinxhB2t8x+nUezTE2Qr01JYYod+c5CfZnx5nKDu0h9abDww
         pyvl/umVqjrRhSxotd4SlIopclMEwiHyKb3eSJJBF05/oISTJkJZyAToSc/UbdQd1QPZ
         dXrg==
X-Forwarded-Encrypted: i=1; AJvYcCUR6gImIbZ1vlCRxo97ZN8OjGpA/aVjgS9DEnTpR+9gIXzB2Hv5i0zL8vaWpUEdmFzCUXJDNZo2+JH36uxW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn8PefZRCZI6uBpKLHXBj6fQ07Iw8Rlb7TcscSfTFbVMHyfIJm
	iP1KngcnCJFzNnCaeng0lkjKfIMtP+LOwjqlAIOW5qcTdCqS61yNanJ56wvIbfKysRl+YOaHiuN
	t9E8M9IIS/dfXKnqqKUIjeZvj6n7CAxqKNq+IT1yAQhZSMg79SAnxam3wY/C/eABpJl5z
X-Gm-Gg: ASbGncummer2uyT/CM9pWDdfYNBxEYjV15LBMLVMj06tTgJC17ZfJArjs217uyOCvsd
	b5aRpugQV7M2eq078o5ddIi0ZMJLjQERmNlpoCBi4V1o5qrCnm7YPgIYi1KTMbOOvhtC2NPO04y
	7MYRrsFkaYkGd8ng2QlpBfMe7We2WHNANtJUZcLtCPcZd1BH1lgNh0/rd8dHrkdUtO1za18cs0y
	is7AO8ASkIaTsXjtjL3NwA7EdgGRI99Yuv2654nyQc1YUH8ehCl24ZCBQxyt8O0z8ZDhFOqnMVL
	DZbjGS+jSErF6prK4hIGq7hpSAkaF1t6ifl1+QGl1WMML8V/Dud9BQetdGoZixZLWc6tbs8Jhzc
	8QD/tV4ay4PEbHJhpmgNSYRGqw7OfoFrvWSTZac7oq9uqHvDIkHDCm5qI4YvS/EARREaGrE3n+7
	5JLNtz2Ucbkqs=
X-Received: by 2002:ac8:580a:0:b0:4e8:beac:1151 with SMTP id d75a77b69052e-4e8beac14c7mr6065701cf.58.1760860628114;
        Sun, 19 Oct 2025 00:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDctdAhTGoH2UVH4SIDDcoeLsFaivxMV8gksU2P+0NHGGMP1let3HDtxEPPUwme+DeMzOSFQ==
X-Received: by 2002:ac8:580a:0:b0:4e8:beac:1151 with SMTP id d75a77b69052e-4e8beac14c7mr6065531cf.58.1760860627615;
        Sun, 19 Oct 2025 00:57:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf4cesm1357027e87.30.2025.10.19.00.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 00:57:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 19 Oct 2025 10:56:52 +0300
Subject: [PATCH v4 5/6] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-iris-sc7280-v4-5-ee6dcee6e741@oss.qualcomm.com>
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo9JnECS8dwDhbb6wsBiT73LflWqJdL+MdmheXt
 gM9pKy93qaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaPSZxAAKCRCLPIo+Aiko
 1ZLYB/9dd3i8u8x3HW0QEmpoIkw1Ko/osxFOOmA+2TF/8rLI4a33AczPjU0+Bsj7lelv0QM2JXh
 iWuIVG67FB5hWZYHyEPz3uekZCBVe+a0BaCeZeC1/w+OmE6AdiLo+NITUXHio3fXR/FP0WOX7lV
 6V8XxQuActxxASDQv9Al+M2v5KmjrUkP8E81/mZthVbB2/o6hY/Q1S3bXBRylqlRhQKxnNH+CAp
 g2zyfg1IqpjmpmP3nXoPxuCmqRw/E/z4mXvPBwaRjwkhLXFi3EPD3OR+wXXa4RzoBtlruaVo8xl
 Y6+fSnFOVtiYy3VCw6zeaz0agOmvXTGoklLQJxW+6LqYHUR6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nOHzR6s09QBUS-fBybmwDBtihkU59QTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfXxozgULTwPYPZ
 SG4d61vAq4EoEKYBVfPLlrE5+C01DH0a7GuMRnL8jH0sotMFHGlj0OmFz7LRKlCS8dbc5/JUEev
 hw95Tq+biqeWY3aIcHkqmhl3nu+NsLrcA/O80IBNIUicXVZWvT6pb2z8k9FmAU3fYCUMQTmYd7n
 5w6dXQDJI+24Ae81yjXE1kzFPlpeph7RRBaStrIGkoz3PXBfgpSJFURxKlMojEFxNItYCv0ShjP
 +MKdJ9QNdPX/SEMpwfU8iCGD/kPGrHoOE5v47J665MVlLykbWvXSDoJDgos+5pSpKWEnb1leJrs
 9eWZ2kT3y0Obg0IPoEDCVnQdvqcmJ1WHJD4q8AD9E40RddOBmRWsX5vX/wM0RNA2qXlfnzfMQNL
 HJiGqNmQae1DnSpgX7LHIUiWBDb0Lw==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f499d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nOHzR6s09QBUS-fBybmwDBtihkU59QTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c

-- 
2.47.3


