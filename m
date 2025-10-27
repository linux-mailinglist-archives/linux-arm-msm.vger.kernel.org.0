Return-Path: <linux-arm-msm+bounces-78897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5CC0D831
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 88CE04F5434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B5730F816;
	Mon, 27 Oct 2025 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3qlIAqX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB96301716
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568035; cv=none; b=BgVhXL9dvNJPOh8AQw28Af91pWP0n338vtPZi6o0yxNGZmQZJG0zQUkShR8NLTQge3gaH8awca8NM6cY7JCiPGT03gBKE6Nz+jVjrL6tX7PYEERwW0KM+gN2Fo9XQbGniMsvCnglMljo/7zX5Olydd68At0t2bJ7FRjzWt8+viU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568035; c=relaxed/simple;
	bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3fl9YWRYuLg4F9lnR+TEB2pnfzwiZcWbM8Zo+jxMS2hhgdW9bkUVV2C4sxVdu3ruxkHJSFX6EsO2E+vUTM+jPuRK4PXoAU5VTZnVAy+DyxkSnKsUtEC6yRsSf2odxQI9dXvC5jPdPxOwG/8KC5KtNJl/3uWx/n/ank/dGLPRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3qlIAqX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R9FXEr1294976
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=; b=E3qlIAqX4CdOijlG
	WyHRe72oIGkvQQoY1ubihohQQjwqLzhEi+vbLlQk55xqsVGm+btVPyVnudlWnb6D
	LxMDVSEvWQHqDlqB/pf/jfFpkvMFLF51k/sDbHIfEhTMqvbzq6Oi9DlVw0JAW0LG
	4bs12z/O24p9h0Q9i0NRDeJKcWZu1xKn/jG9P4WFiLmXtQ/tyOWijPyIVeXty6WX
	/ErB1FLk1mVkQNKNmiQsJSv9GBPzYvibMcApRChONBKhtp6WIfmjjo8ycKin6vUT
	+4YTCLPyC/9UT6dDUDp9gZE9J/C9DMGuFMj88vR13l+/JP1TgkXHpJEg/OOjuZDM
	AfQBAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb4kn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf9548410so30765431cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568032; x=1762172832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=;
        b=o7BjeqpWyLb0vydr8gxDXxxxCdvepzeQmO6nSwljZ9RTlSbRBZSv5SjHhNVzF13THD
         O2GpeEtjv+y6z1ve7o2+decaR998iTQNYj7ZGutp1VYmGnrzqRLF1+YaagPWB8Q13g2g
         Qp3A0mcdN3xR7PNu1Y2+hpFOzCIRs2An3aJaj7JK3fUTlDUuFlctphScVg2/NPwrieW6
         XjMslqs2Oi83m9fHZKpD5MmX+v9KnvuUNf7uHFm/hPE/osdgovbCUisYgpxyNAcRkziM
         YEH0z7oXRb4ZjvI9MNp+BvdDKtgWF6KnkCaf+w+Wo/HpRjc+m1nmTnlEKllyrlIyVzhi
         UHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpNagPsFDZ4DOM7gLvmiq6nT0yGFlY06cs6MhEAo/3DQjOoUmmC0OYMbLlfA2yO1MzUAaaLXYeEhU4voId@vger.kernel.org
X-Gm-Message-State: AOJu0YxQC9VyN7cecWoEJDZNp9jHJjlitfu5sC7VTz4nTtC/ltFh857T
	pdlS2ObVwiH1/1AlOuHSPYSmp8A2IpoQ5wSS5KpKOo6GtpNK0X0ZBhxIqiohs5I6RJUD5olp5wI
	oS+9e0EqbELyxFQBmbJajq2ErBenZDgydPSxb1WoUnSUY54nt39DtkUCb6tuxROXqDlbM
X-Gm-Gg: ASbGncspoczVBcnjgUiGlFe7im5l503lu8MRyGtC/Rx7b+zKcS0hB59X40SST39Cnsy
	Qm6vwVJlI6WPv6G/dyCilk5BYjlP7nPE6To0q52g4DzLiyJpYuciDkvINtfOj6nWzRiVA0tYosM
	KRj0ILmkaJ5Lle5jJnXCZMOGk9XK+e5T3FXVBHS0rHcZCngR2+OUNvr8a4zRnASX2at20ZY/jqc
	Rnsnx9hk/rbW52nLEBXcoQ0l7U1gilJBn+qlap5zF2VCICD0KplwfseOHwbiApcSgYM+KefKprz
	O3Jym0R0wjYbF4foBKf1lCoxBbRvfjq4+jeucNjcioYjSBqqVzz3neEWOQouMWFgp4ajZ4i/rjE
	TT0a/A5+K9IoTf0RZ2IFPzTm6gHY8ksIxMWxckVib26C//YTDFqsOrE8WXX4sAcrDknUG5Oh9H5
	AR/W+gCDPBUiUB
X-Received: by 2002:a05:622a:284:b0:4e8:b764:3671 with SMTP id d75a77b69052e-4e8b7643b49mr360819541cf.67.1761568032023;
        Mon, 27 Oct 2025 05:27:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMxrM3TrFI1JombnbI4cIGQsFF+5c+IJtmQs1lSjDpkeewUSHV+vo0vRHjtgNtPaw+JhE+lA==
X-Received: by 2002:a05:622a:284:b0:4e8:b764:3671 with SMTP id d75a77b69052e-4e8b7643b49mr360819181cf.67.1761568031555;
        Mon, 27 Oct 2025 05:27:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83cb5sm2253474e87.102.2025.10.27.05.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:27:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:27:03 +0200
Subject: [PATCH v5 5/6] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-iris-sc7280-v5-5-5eeab5670e4b@oss.qualcomm.com>
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo/2UVgfApeHAT4N+V4LHyg7x0l5ESrcN4q1iNv
 VZjO8eLSkKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaP9lFQAKCRCLPIo+Aiko
 1dnBB/4mFowTmni7YzNGNs8otxTB1Zs/ROflmeobxYaKyqK+l2Kg1tP6AELhhyKlWuXjnzh/Pgg
 LNa7ViPYELKbLnCevoxHaxizYIAs6mGzhUT0qHaOgg0pnJ6p73mfvwOCHkF7v1UgikW3+esI22i
 ko+wu0/njrQL2ulTpeMlTaUbg1C4ZcL9kQ6APeH9TnbR/a4qF+KpU/cL+R0cxfWZVNMGfE53xVO
 GusNrdlDRQuaYtB5fdlhAZMgCa2DQUPT4/EZMpbV9jx4cipCc18MOmmpdI7jUkLvgYEWvoJfsD8
 jUhNHCFIG0bF2sQ+qP/Y29DqCmXaXmb66Pq3CvM8FuDCrFkr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: wexKKwV2fT_tcW1qHC_3oaZrVxybPzMl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfX39W+lbFgSGee
 LVvrr6oj3kzadMY93g7t0gOgHfFuiDzJleQrrYDrC9kGcFvj7r3F4Dj3jm/o7T2C+NFaglcDz4E
 QQySeQdHDe4CjC1QyzSZDUyGEVimtKayycWVwkeSelm3IEVG3Wn6D0B3pUt528rLw3vJgWA8bKi
 61bxoRlm8v1zdPSuaHbIWJ8DFcecjb+8nBwBX8iROW0wRxaZGgQfZ2Imd3vg3AVxkOdGcqa6jnR
 pJo1ZIAiAK0MDCwhdhzWGqejQ18Tmg8OBtoUcUISTCep2A2GwuBAQABJcxXqr7JFJJHOxfLNu7A
 lix+gXi7rWChV4kgcjG+wjdeK5+AJUE7RhHCptpwD4uRMpsYpskjBHh5WPBr03RSVT8YA0+8bIg
 +d9THs4XHiY8sTr6eouLZ6lg7/Jklg==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68ff6521 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wexKKwV2fT_tcW1qHC_3oaZrVxybPzMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270116

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


