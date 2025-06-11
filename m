Return-Path: <linux-arm-msm+bounces-60894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB35AD4905
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 04:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A07561899CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 02:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24951B392B;
	Wed, 11 Jun 2025 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXx9v6tP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D33D2253F3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610721; cv=none; b=L+p0XPU7N2ywsoKrBlsbkHXsoczgrT9/Yj54FYd0npOVC5Vo1fr0tZCbw7RcFRyT8sD5F1xV3kye848gulShu8xiulH3b/YHPFiCQHzjpfDtFpVT9fPMahFLjIFiMr9OkXLWpJrlDEBG/q34Qk6EIHPfOJkCqRHVCbW/F02HvQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610721; c=relaxed/simple;
	bh=CAZ/SIZXGULw26SKxotaF4nRCv62GltcOelZ3heoC6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=It5fEPkJ9pm3OBPwUik7s5jeFRIA3++o+y7weAucka68L49uT27vl2dYS9xBjDp4r/7v3mLtj/eNnveXr/FUFDRJH0GhNzJF2Tp8heL9kTyfSW0dLgrI4aA6neFcJUvuGDzfa/redJg7rjEuO6+JwkzudsnxPmRiXmHXIOvCwsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXx9v6tP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPt6d028783
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PnvbGOLWjgVd2ibog5YycE
	QyE3LZR9r4haxSXY7ibqM=; b=bXx9v6tPlZxdLY9glWmE7kcis92aVz7dD86rBe
	zsKEKr2hKonY3rV/EuSsOlpip7gBmy5fLX2XKpE+Fd/twECK/7+7ZlHy1n9hWrAm
	euxruVB2zGhaq2DQmChIlzkRFwAcWe5Pa7bFGt5jotlamHb8XvxSKXRQ5YctWNgp
	TyeEraKAK9xHNsgo1vlVDRb6WljKw5Su4ZgoG2HbrRurH03keKZSFW9P7r+V0lNg
	1mGkKUXsBmW6TMG54ASe1q/5r/8IxqIlCdGbHD1AobtEjMyLlPvuRx/OJs8fVfLY
	umUDKGWp739oduQv4MM9rp8L873EfFiqlkk4oPBBabk9iSbQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhae8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:38 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-60f3ceb14bbso4622015eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610718; x=1750215518;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnvbGOLWjgVd2ibog5YycEQyE3LZR9r4haxSXY7ibqM=;
        b=OGn/8os97HhPqg6rGDFVJ8FjYrUtsPtfl3QJ3B4Svt8FzmgMlV5ZXEkfT121XclmTY
         As1p8rq94x6ffejaJi+a6TT1CU0VdIUhqOIcVUe4qnnhs42anrBRJSfuP2CsnuVjYhov
         ZZXVER+KeDX9DfEea1HAgn69yrXiIbWWL8Q1AFV1nAphQqQTrXpLiPN2lVwDLAIZPLb4
         OGqDx2QaWwziuCWxp3byraBH2T9kJqm46UutFcaAv/uAB/WTuXWV36fW6u7egixr4NRL
         lVU90gGT7KZ89UGUtyPA8xAvdRRNpz9Bm7XquDsry8xg3ZCZYSKrQDf6cBSnaNKx1ANY
         Xrhw==
X-Gm-Message-State: AOJu0YxWG38pxb9H/AzBpuG2za8pore79ukqOdIVBu5KHJky0V5RIkCG
	C94fjj3sdwW1rxnJe90BL1yfDY4Th/e2lIH0klKuFdEgo9xnRF13aWK/qa/RhV/cugggsvhLlEh
	3jJHGs2MsRqNq2F9lmf/CqFTPpZirKQV5SYHfGkHzWCHVdJllhNXYPM0MU56pAOevj58MyRNOQR
	LqaLQ=
X-Gm-Gg: ASbGnct0wcVjty8NvcFPrUyMUBThrHY3u90rUR22URJZ3pXcbS0vPEk5z/GGawRNY82
	7n8F7YeSfmB2ejiUHaLWLPIf0O74Q+h0JZKzTGD6KbPT/K5ux80JeaJ11gS0WkH4ad+ckDgd/66
	/gcF1vmIP8IdS05f6QCYS680ABC+vdpxHbujzilm9F3GXxWmEsGazGqWYq5ES9ZdgKIaANDyxht
	VKiQ3ejbd+vnPVDYdpuDLHGpeFh54QTLrUUKRzK/IGOvNwBkV2VtG5TFuxpt7DVu02HGxj3l+h+
	EOQt71bUuDqIRRgSqG09MZB8Re8xecA0PT93ieYOFxAqDNZqXamr1Zs8RL88sxWcCyWZy4vPONL
	V1nsXWDUmsKg4I4eHV+imUw==
X-Received: by 2002:a05:6870:d38d:b0:2e9:a15f:6c3b with SMTP id 586e51a60fabf-2ea96c4f2cfmr1052592fac.10.1749610718050;
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOYMDwQ9+qWoO9sZAHQjuHpCm3eIJ+fGXAaOH2eDXzRmpmRSfdlsETZJ1wyfXaLwgJC/19HQ==
X-Received: by 2002:a05:6870:d38d:b0:2e9:a15f:6c3b with SMTP id 586e51a60fabf-2ea96c4f2cfmr1052580fac.10.1749610717755;
        Tue, 10 Jun 2025 19:58:37 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:37 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] soc: qcom: mdt_loader: Validation and cleanup fixes
Date: Tue, 10 Jun 2025 21:58:27 -0500
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPwSGgC/4WNQQ6CMBBFr0K6dkgZKYgr72FYjHQqTYBii42Gc
 HcriWs3k7z/89+sIrC3HMQ5W4XnaIN1UwI8ZKLrabozWJ1YoEQlK1nCqBcYHGn2EGmwmpa0AJo
 0GPviAKo7YlUbdSsaI5Jl9rwXSXJtE/c2LM6/94ex+KY/t/rrjgVIwIYRuaYTmvLiQsgfTxo6N
 455OqLdtu0DDAXoCtUAAAA=
X-Change-ID: 20250604-mdt-loader-validation-and-fixes-5c3267f5b19f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=CAZ/SIZXGULw26SKxotaF4nRCv62GltcOelZ3heoC6w=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDceVmktbeGo5Ss9Evwmm1BekycHe1ROSgLC
 GrysKoq1f2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcX3KhAA2hs1VdO/LFQzQLgsU3BG2hssf1iW48bhD0XhM74
 IU6pit9HUYEyrJhBT03PnZ3rxy7BomH9Y06pQ9s47EyHojwnho5oRRD6MjH3sse/Jp7ZL75ibFA
 lnOot35mzN+uQBaahtcZGP3vGslKuXeTHXfC3p5qr2phduPdcCZPUOu98Vewwdr/x9dLl9TordW
 2OrJtV6PQ1t0CF6vqvu5dS7PUplOpXecrTuA6IdeQJaE//Yz9GmAkydb4ffTqhFJOIlvWbSZJX1
 bbR5gRxM8S7r//057iUYJvXLUh+ZDvW+kWi3HIaI3e9S+y4X8eW8XqUXT8d+ybE6Q7HVy+fPE9O
 UxkOjefBvt1rTI13KrsZqocXKyCZQmUQjrC7JkNemrH6F5tNplv7RhjP+Iz4qLyjATOaVVThNIK
 vJYJNurNvvayYQf1NqOiWJHYrbraKDahVw1aSiqGtWr6Awz2CCl7hDdwwkhnA2GS0b9lNSfKAo8
 FopzqFannBwB48Hpf1GskAbCKO8JuNi13RStomgJu1mkN3jaWbcX4KLe/WFBrJftMM4NMBkS+Q+
 tPu39VGwBNK1J9uWJly/V7OBCqCVLRjxs23SA3Vsj4DMVyAiD7Knu5M8ApyKEbM36MWdi3qTL9Z
 dvQrgqdEXWHUa+DcEb+GF/mLULonX5NypihJvV0yeOs4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6848f0de cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=OVvt1KTugGfhVnbKlbwA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: z7I83f_HUlsvY-523FUBSsnje4wyQA5N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX0TJBA1nJH8vS
 pPVLiYPH2vsTPrbUceuIoteSUBcvG+2863jU5cfvgX/ps3RAd1gL8Uz37LROVoZkO2i32Np67fY
 V6FZq880LGTMIGI0c6/T3SCz2G3Lxf3uVl8bBorS7K5zJgIksfQh5u5jFZsj/n23L68yYjoE+WW
 AAAUoe4s2iUcPeeSi8O1oBTmhHK+7tnmVEATF3onW9UWBr9N82DgWl0NBukC/plQZKT+Uq7kniq
 dRz4OkVV/ly35IRKrf30wuejTfE0TZD6JqkV85fstAawqKhwnhuc13Qg0Qa+7XFAHf7DV9csRRK
 BCInTylVUEXe3ynxg2yB8pJX6k4vJu7N1RHhqW2KU5wHblhhelutSToe7b7lrD8h2Vl+UFwSkUf
 lIva7X+r12UIcw3Li0YJRJOz/68ovNgtj6kFG+9o2IoNbEsdkif1Jw7oRolCQeaUg3GWDbHM
X-Proofpoint-GUID: z7I83f_HUlsvY-523FUBSsnje4wyQA5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110025

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Validate e_phentsize and and e_shentsize as well

---
Bjorn Andersson (3):
      soc: qcom: mdt_loader: Ensure we don't read past the ELF header
      soc: qcom: mdt_loader: Rename mdt_phdr_valid()
      soc: qcom: mdt_loader: Actually use the e_phoff

 drivers/soc/qcom/mdt_loader.c | 63 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 10 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250604-mdt-loader-validation-and-fixes-5c3267f5b19f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


