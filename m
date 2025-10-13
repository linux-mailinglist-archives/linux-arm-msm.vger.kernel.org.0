Return-Path: <linux-arm-msm+bounces-76915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B945BD12F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 04:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B6D73B25E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200982F28F6;
	Mon, 13 Oct 2025 02:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8G3awOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5BD2EDD78
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321354; cv=none; b=YZ2Q6DVUyB0dxmLg5dElXMFBD9F19vN9GEzFWtr5VxBMrugNSHbIFHvMcBlYdgcJFN3ZmhXPEb+R5jqLVWPsxcnc5vdvAwX5FVKrMntyJblQC6Um3hAIvr+p3Nhkl1y4drL1AZ0VqlL9i5MZ4fWV81pzNNysJuYdMwm8n4W4bOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321354; c=relaxed/simple;
	bh=wbVaP1lpyBvdUoAnAqQoSQ3X0Ci5SY+Yd6B95zwrfnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAdMsmuCx3N4jqviyWZMvyku7dW3ft/7tZ4vQ2Z34su8QnHZo0lzyN8qDMx9ephh0OPEAENKEe2QPdzm+2R1PWJHpfiNhexuMAmwrIkpEqSsY/RbKrokqoIC7PXxvqOLI2I6eKw0igpjKbKfgOGnLHZWmeA87+KBK0lmFjj5SAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8G3awOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D0erMu017009
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zdk3MYWDo75fxIgwdOMJLGKZRJXuA9oW4IWL2hMM1tU=; b=A8G3awOLJrpeZ5tV
	WoexDgt2tnE5eTi40iGbt5CGit31P3LrRT/jCzdPZowoXyy5JUe/KEi8hXGIEJfb
	HCymTdTdhPpFl0+YHddMyjffg2XDimCInsyhWQNY7IzK1U3cUbxB9gIs174UpxKA
	SBUZLZfPQiTK2tHImoBC5fTd4dQvv8IKfcqD2bzWkASOQLlXhbgVDyESy4c9mliB
	JaCutKJ6KqCktv9XM6o1d6Eq3uIu75LFn3lTb/w+D0a5vXpHJwKrtyXA5pLyBocV
	8ry6E4aqGq42zn09Vhn8Gjn8EPLlzNpg2F1oGAUeANLnyS7th7MDZ2a6koOLiOUo
	OmY1cA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8ty73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-803339f345bso302953116d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 19:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321350; x=1760926150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdk3MYWDo75fxIgwdOMJLGKZRJXuA9oW4IWL2hMM1tU=;
        b=hN622GPoc9bXp4KKS9pHvq+MlIsHSQqz1akRD5dLiRAM0lsLiSpUUPH+CHZZXHPnGj
         x3o4UdZ2FWxxfTRO0uQjhHOqc6F12QuOcz5heUbsj8zXzf01nzW9tpZBjd8R1xfPCmY0
         gOuvatGhSC4Km5QmCcSHiWcBcl6U21DyAxgvqOOf+gSycLru/B0NXiS//OEoiR6SNiyY
         zA7M4abTpmBG659rCp9UzKaweqFn00Xq1rv4inAjVr5pxbnRHi/ewiBVtoO3QF9mnnlz
         xiOdZqYI2O3o1q+6WbAtcNK4zU9grjOQ7CyFbUKpYLhWoSXY7HutZYpdeXMRWNRTlWiy
         QE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtKCCZXLi92FVQ9hGO8E5ET2Xx622kQFJdmJEiYZZystYyJ/Hw39x/KGpF+uQ+Rgw1ciqGUW9659wiPPwi@vger.kernel.org
X-Gm-Message-State: AOJu0YzX48qz8b3F444PsUhHm9TdUpt8vo1rA2BcuLzMFVYgEIN92PRq
	ynJk4wPJjIqX7eqHfnmH96XsqeI24K9xldHvE5154EPsrGk6XnoeIluZQSIrkDG1bTYPX9Lr183
	Z/U+XDNWCLiWci/si3eWOGRJ5U+HJUF/obO6qGem/MIMX7jUDf4q63yDlUdV0cyE2/VWB
X-Gm-Gg: ASbGncuGxiEV1vM24m/IGaW9nI+Wj63qRUYwmTglMSzZGPO3YF2mVbAQHYB1C7uttEX
	xth7GZ5sC8kCx8g7e/RXnMYaC2goQq757ZlHQRzk/7X/U0e/btB94fIri5zxTyUvLmBSmE4ZRsa
	wKQ6oLkLp9h+aRJTg3HbXkG07w/TmMFwGXdH4Yetbji42i65XDF23J3AqvBrPgqYqPUthfmt7wB
	FPvUl+T94MeZix0BqpaHUmkEHUIVTOeMi+9OdtLk9mziT5zbio6CDaB2nVknd3eRMgylJ1bn+oi
	3saRyicfzYFTGjst2JZO/Lg41yb0zIv/QtHoajHFSYV+FYOcG2iRw30JqKKm2qGPdRzVttRJIao
	NtCXfne1MzvHGTjTEmAmio07l4gKbyYOI3QIWSHujvjIyzG3gn4f+
X-Received: by 2002:ac8:5d0e:0:b0:4e5:4531:2a4e with SMTP id d75a77b69052e-4e6ead7c558mr259927581cf.78.1760321350431;
        Sun, 12 Oct 2025 19:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtDwhTw3wFDerFdKWqV9V4ypofI8gQE0PqdpTVBNF3CPN31e1q51G61ezYb3csieopyoRCg==
X-Received: by 2002:ac8:5d0e:0:b0:4e5:4531:2a4e with SMTP id d75a77b69052e-4e6ead7c558mr259927361cf.78.1760321350051;
        Sun, 12 Oct 2025 19:09:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:09:00 +0300
Subject: [PATCH v3 6/8] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-6-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wbVaP1lpyBvdUoAnAqQoSQ3X0Ci5SY+Yd6B95zwrfnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F85pdysF02W4HqhSIvGSDCIJ7GrLbDMZVFsc
 dv4gTglv9iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1cRWCACwpvVooIFThA50z6RkSDlGk5bW6Iqs+IuB0eI3woWhV7hRWW/PJ3X8v0V/1KF5sUn8VP1
 9nIRRUhzLBBiX3KQRN5W3yXXK0odowR3+EHWcWkywXgxw+LDC2MCqIoEaao1eVeWq6GEIHioHUp
 cKcmhm9dhAjwIMfhByfudrN4sbyfKyKolTbhw8m/slzG/myvffVax548hQ2lOsA8wM9sskaS4Uf
 ysTgkdfyGJvoSBl29Ku3hs/1XTh18jYrkT7sOhWObdT2DKStN21kilNoj2PFNsqRukpF29z9iq/
 LxXLQdHysdYupMj9Qb2hGhZZpipeOdM+qvJ5Dik7tPq0OU1j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: dHfTsJLFvQO2tae-KBbzC_j9xOPfoN7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0SCNWda5O+vs
 QUajss15Qk608UZ9nqt9Ms1mWIL23WAEU0jhRHFN9Y/z1UHFIVmOaxNJ2G/HL2O5LRNFAusggJ+
 Jb9Qmx5Pa3jUWPwFln8ktFe0DDIAXpZBU8Tm7hYPWEKBuFQZgk5WdhzhWQ6i5hr53b3KNeiYa/H
 6GVq++dHPZp5XmWxhFEBGhH7Ib9cnw9c2NtfouWAQenvee1PPy6dO+/RcGwpjlZN3fhTbkW4ypn
 aAXzinzboFVJ3s7lIQe2vUU/rCp7TuG57zMFL2jOK/5Cg4h5diXlbCyROCBdMMaci0HZ3e14Gfq
 8tZV/U5nBu0jkhGB2ZH8/GvBwGMCK6ITbBNGvtf9hJvajhE0Gn16j7XFqNV5kAB20lJVZ5/ojQq
 twjaXXKJdMZZE6WhcwfWTflTMFIqVw==
X-Proofpoint-GUID: dHfTsJLFvQO2tae-KBbzC_j9xOPfoN7W
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ec5f47 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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


