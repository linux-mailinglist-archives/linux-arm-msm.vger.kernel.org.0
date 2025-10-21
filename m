Return-Path: <linux-arm-msm+bounces-78139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFBBF5D83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E1DD04E6255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A7C2EE262;
	Tue, 21 Oct 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXJfatr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748A2D8DA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043210; cv=none; b=bml4QT1AakOIRmPHoV0hiQtNOCDTv7o3Q4WNjbJjORZvEW0sgztIEFyEjlBUwV+34q40/ZY1oA7ShjVA0zs20Ylb+/v3lNyS+Tu/6YFoCZ0kLibk+aaBT+JIWBHggLTw0xoGfC72gVI2HWTmOyOC/d5mrnEKeSWmKS+rbzqetdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043210; c=relaxed/simple;
	bh=0U8hAB45yH8EGsTy3EJNkB+JbnjcAFL7FugSc4yQ26c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMOvcraLI46rkkeH9dthGdfKjdV7aiE7wu2FZTwsoG2MiMqV88UEebKMp+W4xz7J89D6hbqL/jreLQEOSI7Xwr0/3+mr2By4F8EsLfJVG0G7Z2Td5hZkClJG6fcqPEx7Q0iqmgOn7IaOv9aiSdfT02q9Ee/hBHQ8cdLc2cN3RwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXJfatr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8BUlU025019
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EbXFKjfP9YV4IPAFXNS5yLFyAT4bZfexbjP
	y0N72g9w=; b=SXJfatr3apnPlPBnqM8wKB0PoiyDlgDFs09jgJ2elDGlV/PTeqB
	vK8qBrm+1bPX0AdzYNCMXzPU4KXl9UVQQiwm+n9OxutRPfwWidOdDKIY8a65ckhZ
	7a+iyrVy3QmixHEpg1+WeyB57BeJNQXgiNTXbXdrkjM4Ho0cVSToBaf84vutvTfa
	l2h/rou3aeRxnBTv7Tf/hDkvt2FfrNhg4nqk+Ebm0g69XI5hJcqcbV1zDXW2HLG8
	HYm9EgrmGKB5o7AEYPF3lj0jRP+vdCXnWPs8goDGHwMBL0nVR3UtgKPY7fEuS1U0
	JEMB9SmF2ZlqGHzwHsHg/cQwyop2wX9voEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws2rj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88e7bfe5ba7so2062036385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 03:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043206; x=1761648006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbXFKjfP9YV4IPAFXNS5yLFyAT4bZfexbjPy0N72g9w=;
        b=HSjwHVkAm9nyGL3HKN5nuxtb1+a+9wbzZqaKod1GDzEF6YaaWUvoJQ8prWURX0Tua7
         nczL4VoyXfkkgCBSaLBLo4Fb6mCBICBAlBsjttllga7KL0hwGjjX1zOZSY9O6LSTenCr
         yOwK4d5veThU2OX3var1Cu79SSYLa6gYgEQ2rlcm5yJAUcglG8WwyfL1ybG8uBesn3Lq
         Sr+rSVWX3j62C9bx/uN2WCtDCTTyAYn9VC+J2p8GZWeSfhwcuLff4+fVUQso05JVhWAA
         8rBlD9d61NFrEPzdDk5HXaFQ9sRcRR/NMVA4aQSlR2rIV+jtMnlYLpspzRY3rBcVy/Ze
         OPtw==
X-Forwarded-Encrypted: i=1; AJvYcCVRAV3OW6W+rfxOf5NRq5GqE4er7lim8w99I5X4OME57yMvG3hX/OGdH12wKeJKW82qsRyQ4cAtVtZ2UCqj@vger.kernel.org
X-Gm-Message-State: AOJu0YwZbqk7hD5cJtaHPi/YlDHDf03h4VZokGozODu1GbaH/19w4+6R
	nB3/G3+5/IKBroGF5IWYNBIqDuzLi312f9kbssdrE203JvmrPfrKM9H1rbXpHspsU5RadLnZg8D
	8gRiYQc1joMLmZzMtPc1eNUFADkMONCmSm3wsMJMXTiwaAji7dwLMw442NXOJCO+fIhJf
X-Gm-Gg: ASbGncuLMJf/16H2F22ICfbVWtiZngZ0R4jyCzfjG2gD/vuRnCKgukhQpGr42eB0kyu
	M2XdUe7J6lTWe5tg/CbjQZPRO/QOTFiRFJBnxios7NtPg4ko9Zv9AdNkCwlDa+x9HJMz3D5YWu8
	ZOFVtKThrfqBcmKeC3Bfs85yBMce7Tcy8zdVnOl7U6YHjo4WI1ueZzq8Aih6BTJgvxY41hevQlL
	wo1HoJ+0r1yxS3NjDDg1Gg4DivIhaQdiR0eHzDlTc1hb0DcPpsdf84PD5xUk+W+4lAZpOBpooVU
	MMFPBDkidkf3846uwPZ7IvFwKXoTPCAhpE2SyOZViGdXiYdtAppDxHBs9N73a/N4wj3o6ziUMOm
	ra7hONQYA0u26
X-Received: by 2002:ac8:5a11:0:b0:4e8:b55f:af22 with SMTP id d75a77b69052e-4e8b55fb2d4mr121141831cf.53.1761043206571;
        Tue, 21 Oct 2025 03:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK7ENmoHQ2RT/4VjoSrYVZ4wOzzLy46jV66xunwwgH1MxVbYZONvkuQCmOMnkT2v/D3Mvg2Q==
X-Received: by 2002:ac8:5a11:0:b0:4e8:b55f:af22 with SMTP id d75a77b69052e-4e8b55fb2d4mr121141551cf.53.1761043206041;
        Tue, 21 Oct 2025 03:40:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm20087938f8f.32.2025.10.21.03.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:40:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/4] ASoC: qcom: sdw: fix memory leak
Date: Tue, 21 Oct 2025 11:39:58 +0100
Message-ID: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX9UICrH9tYXmp
 ksg1u3DbgEKsu3kPrR9t5TPhu2bJK6WW1CkEzo3DyLk9qn65gVee5XccVyYvp5OxmNh4pypSKuz
 K45CFSMo0h5PSTl7MaNOa1MDUSnVJS9YTg1rQunOsgI6bJE3IIQ+Yp1+ehPWHGbC3lGqIIibuyJ
 oQGqzJtFCcU6raGT4H4rDO9EnAMftvYE8l6kBynR9E/9hWVTzf76m4ppcGpZOCb6l7ChrKLd/rj
 qEl3/o+wtXb2mM+lPmV3/vZ0CgmlZzqj8c/UK7gzUu7VcMS0L/p9JEwazi1tXw7P+5OLs9oN+NL
 0WwfvmlatnKibuifj9e9v0BvyW/WJlst76+vjbWu0jsd4B9tk1J/Aap2teOBft/nPs0Hy5IcT2w
 RIdnAkKrB3VKHG7E43nQbhRULlIdRA==
X-Proofpoint-GUID: l_gf49jpc3Bkm0wfLAN2iLKW4wSDykuJ
X-Proofpoint-ORIG-GUID: l_gf49jpc3Bkm0wfLAN2iLKW4wSDykuJ
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f76307 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Tmn-ty_kyiCvGlHJeRgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

For some reason we endedup allocating sdw_stream_runtime for every cpu dai,
this has two issues.
    1. we never set snd_soc_dai_set_stream for non soundwire dai, which
       means there is no way that we can free this, resulting in memory leak
    2. startup and shutdown callbacks can be called without
       hw_params callback called. This combination results in memory leak
    because machine driver sruntime array pointer is only set in hw_params
    callback.
    
All the machine drivers have these memory leaks, so cleanup the mess and
make them use common helpers from sdw.c

This patch series fix the issue, and while we are at it, it also remove
some redundant code from machine drivers.

Thanks,
Srini

Changes since v1:
	- added missing dais for sdm845
	- moved all the machine drivers (sdm845 and sc7280) to use
	  common helpers to avoid memory leaks.

Srinivas Kandagatla (4):
  ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
  ASoC: qcom: sdw: remove redundant code
  ASoC: qcom: sdm845: make use of common helpers
  ASoC: qcom: sc7280: make use of common helpers

 sound/soc/qcom/sc7280.c   |  67 +-------------------
 sound/soc/qcom/sc8280xp.c |  33 +---------
 sound/soc/qcom/sdm845.c   |  53 +---------------
 sound/soc/qcom/sdw.c      | 127 ++++++++++++++++++++++----------------
 sound/soc/qcom/sdw.h      |   7 +--
 sound/soc/qcom/sm8250.c   |  33 +---------
 sound/soc/qcom/x1e80100.c |  33 +---------
 7 files changed, 92 insertions(+), 261 deletions(-)

-- 
2.51.0


