Return-Path: <linux-arm-msm+bounces-76854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA9BD079A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 18:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BA584ED185
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 16:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAA52EC568;
	Sun, 12 Oct 2025 16:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9m59G7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D182EC0BC
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286238; cv=none; b=loxSswkOq5jbZstDJe0VgIq8JanzIcMOl6szilxOsX6yNMcGb6tmyiw3Dkk0WuevmRp+wBhehMM9lbTVLP24wfxmAt+ZTdoXQEiY6TrJd6odINAEZTUhp0mgXeaEbtd5RlTMH/KrG2BzzY7HVzA9NjLwJSxqVJhlhmfTOH0aoN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286238; c=relaxed/simple;
	bh=wbVaP1lpyBvdUoAnAqQoSQ3X0Ci5SY+Yd6B95zwrfnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRpbVeaQC7d+po4UZVxNPZW6S9rHd3CnPeCzTHlgqMMMHQ2ALsNRsPpjtbzXk1Kjm/CYtR8touj/k3vksknyVCB1mQuby/eeHwu9SG7aAavSy0r5TLQH13JoeiXZ7itGP5Q9sXa4I/SDhvOJ0UE0m1rbZG4tyO+zr+z4+3XTx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9m59G7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59C8mdJ3016076
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zdk3MYWDo75fxIgwdOMJLGKZRJXuA9oW4IWL2hMM1tU=; b=Z9m59G7qzaJ8io8K
	vVPeHct/cnIkybqd/zhMZTGNQTv3Z9lAEL8nsZf2k17KRFzeKrWAMJKOSFdLkWg4
	tGcDNwhWd5/4EjRCWY1yuNOHMXG8OjxRQLbmfLIr7bDAtyIzLwhGEw7kWUzCaI2U
	3VnPVn0pPlMNyu+0WmzYqKJPd+LLtzf30rfrtKllCpi6+HOv7JzdhSfUr/LklHDb
	mW4oV0ITFS5cRCLq/yLkgjbZQ8UFNHZyqXY7w909HpZO8API1utDEujOHfiL6xn+
	niiOnu6buW5u6COrRpIyZLNsPv/xze/qTHU7i0bGqvvddzak60M80s7iUH+j3Lte
	xv0QDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bt73v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85a0492b5feso3161369285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 09:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286227; x=1760891027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdk3MYWDo75fxIgwdOMJLGKZRJXuA9oW4IWL2hMM1tU=;
        b=L1QAtofIkZVkbKJAc29mToW6n35Ys2f/KKqQBVtgcOfTVFcfrEhC80g44hjM1mWxeu
         KV+rm+nBHF5tKV/3J4ZKO67p2McxF32MTvzkJfs42b00JpM/+usJd4bt85HeEXIjXhj8
         uQKkrsSAKImCC59LA7NhxGQeEpeUlGIX8sjCzBA4o6qUxImb1Ko3ZFEt06KMsHumwS4i
         YnAnkVDo/31bcQtC1myFKK0LoxjLjBwXQxiOrXKMQECDAtfZP0E7ZLHA6u+YrQYvx0BR
         TiYd06u7cPvaGNRJkNntSP3bR925DsR9XmnccApI/eq/yDq00/bs7du8oY1n59854gjR
         UolA==
X-Forwarded-Encrypted: i=1; AJvYcCWAQci5TaH++lTkBQkQSTvcb5kNXcNLzUVZFoo/MrsBGUs2E2Jp5AbVN36HdTZz+EBzt5hck7eq4OlqsUJi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4eb3Kyjo++x4epC5TZ4JK7osolrdUOR6IYxCc3dLBU11kCbUg
	qeTDMK7MWCi5qt1a/GYUugn22c/Di9Mr3eSNX8StJO9hRc7bbRqKBWYpKh6q31buHr6TYlcAKq4
	lUJDhExATtKsgLl+cDsK54j2NIItb3WcpkPy87AE93waQMVZiv2AIsDDH2vwb56OF6/ze4bTdWN
	wb
X-Gm-Gg: ASbGncs1imhTfWw8yfiDN5umUFsoHo4hDBo8Czy86scKknpW+Kyz/l0Vg2CRY6SOSBY
	Dy3UHHWFW3FY7W3ogaCeSHAbCg7y9hShGXNwoxIUcDE0Dg7H7CmZq4RyUJYNZZWOBxJur4Vi92W
	dcrMzOGnr6u4SClzTUFdCD/m63PoUuhvRYvJn4YErtjLbb6p8IykD4K0n5j+bdfnPoEQVMt/GJH
	NACGfhuGVXu8sjQWm92ktKgZxCfiYKlgQh/pEN5UevBhR1wT5v90BHR/ZgIPtZqXRvFm33XiMdN
	hnACP53A4m2fN9I10wWRUcJvgYXC++4Xl67VwtNa6/yqbPb1eqr2GlTyh44rr33S5FaiORdYLCD
	qoY9HB+OGaRAxOuGuYQj4+ZUGm97bshpx3egOmbn0F5NZyfe6LAS9
X-Received: by 2002:a05:622a:1341:b0:4b7:a308:b5b9 with SMTP id d75a77b69052e-4e6ead76899mr269865201cf.46.1760286227082;
        Sun, 12 Oct 2025 09:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZGDGwXcAJdBLHhlMucpkDABkvYlwnDKAhf0zQvF8JrxPpKUF6XtsrKMmZucxWkSK6izIzcg==
X-Received: by 2002:a05:622a:1341:b0:4b7:a308:b5b9 with SMTP id d75a77b69052e-4e6ead76899mr269864691cf.46.1760286226358;
        Sun, 12 Oct 2025 09:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:33 +0300
Subject: [PATCH v2 6/8] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-6-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo69YErcPp7M+PY9ZwW4nUC3BdbqrQ9iiCVFAnY
 HcOOnZUQhCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOvWBAAKCRCLPIo+Aiko
 1dPhB/9ZLwZkjd610uZ3E3iD6QYmbp4taWwj+TpZX3g/a+mSgumXyMxTTJH3Kd4Zp+9o/66M9ps
 wwaPD7r9Vd7672fTlakmq1t5JeTpr8dfDF56ofVS9dYox4ZFFN/06JwinHG8poGDtcT+Q9AZ6xg
 DusCgJv2UoXrfzwjqvlU3HhyQgtTwdbxZVeIFAyOgEAYNOGf+IGJDf+3f5XdtrdZxCE7r00v74q
 JrMKLuy/tDewGGya6gfGlmYiHB5q8v8ER1aBEFWg2MJmBFyPzb4AZ87+BQixUhEREy2d6UvIEEo
 IyiH7aD7mWRb7kvL3T4JSmo/rc7ozDxALpxcznCwq27hfARZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zL-62KkOi44dcGp3bKGfJOhzW8JJFlQy
X-Proofpoint-ORIG-GUID: zL-62KkOi44dcGp3bKGfJOhzW8JJFlQy
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ebd614 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX178XK2LgKjRp
 CBj42cYtgkPp7QtQas66MYCXw0qbtBWmutEkL6WwnYN+KpAVYbdKAO/EIoY2x4qV+IAC5IKzinl
 Mz45Qcv1Ly0I27mYyW65wTOYYXwky0ULaFOzkBxZxlLI4yI4T6mD2o02lTbawU1EEuT/QpTzlok
 tToRED16U6MG27wUIixZnjSiwflxC/T5xWYt8s7N6S1te1LuMDwXCAHWIVbbE34tXXZM/ZPD43x
 Hxvn9PUrbYR6enFfJolhR68UNxVk7ZDLWe/R495hjJxaJo91eAcsKJk8z2EqJS2DiXa2SzVhJz/
 L5ZQB3j5kugLRhcxeKKxXKj9h5oFPi79NafY+O6gnhKBFdY8wQU73lPFsM1jZQP/vIgbyLGsLBg
 FbRhFHwdRU4kfw71Az31EdeGLM9riQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

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


