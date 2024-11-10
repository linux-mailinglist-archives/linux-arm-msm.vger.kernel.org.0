Return-Path: <linux-arm-msm+bounces-37432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DB9C33FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 18:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4089928124B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C096CDAF;
	Sun, 10 Nov 2024 17:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qan964He"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8A2200A0
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731259892; cv=none; b=OdoftVgx0kYUfFg6oxyrLmaQInQ/EJ5gLwLLflnWg02if5T9U/CaB6OD5nF0lAMh1THVvrYMLsTnFFvKcvbiq8w9o3HMJTSiwQJO5xWSPGMG2Obl062c4FCF5GRfO6dj/1G9V5ZfnHqVPOv2l+7PHRcVpLLAvpj0BxsyxzneeBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731259892; c=relaxed/simple;
	bh=Vmdmtg+hk9uw5bKOQ3rjPE500KtSKYUR9oTuviBoIzQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dyiZrxYe8w5I8JsGMGTgbC+fa0m+ngxcJynw+xAnprfZfCOdqXnQi+QEX4eXHuyqGxjbsXevHbJasNlQTQ6r+Nd8mAnGk/YMx2tdPL2bmMEEX+04VQL30dd6ZX5zriVzYvIwGp84VvQhrKZWJs/37+ouK4qLJ60rxSkqgTWDX2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qan964He; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAGtKZK006756
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BfoGuWGqfZy5a5pujI4mI7
	lTKNP+ioKaRB/qKwK5Zlk=; b=Qan964HegQxHub/ll0dGdUf5CU2GCd4OFenytH
	tvpGFc9mNYsuPSaNXUi73Se1YggzjM1rWPGevsElAm9X41WKl5SiK2NSbl064iK/
	WaWAaXLqXPWvAyycoELwXZZLUuzYIFo/yfdiD4ofb+suMkHM9IW6FQMPXBVtfxf6
	qiv/zJa6N3I7bUbGwvOw6SlwxYtCiM8bfvvaqmwu+e7rlOrJe0TAEN4pG9c3/ppz
	EXfUDqCFILbPUg3Qf20QnTGVf/AgQs/vePGw2PPiuXFgny6yfWyiriZDC9k7P/RH
	neLOwibcRz70kGkWBLMFGtkxYzhhSMBQabE2MoI90XAzv79A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxr5tej5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:29 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3e27a1f6039so3629601b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 09:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731259888; x=1731864688;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfoGuWGqfZy5a5pujI4mI7lTKNP+ioKaRB/qKwK5Zlk=;
        b=lShtYnsrFtL6w3AX9MY3XTKsvN++xT4TVvuthUnkjbVqUoJKJJHVFOb96grJdyQnJz
         mbxG0tmF8l5m9sgRjTSz864+mxqKtWqPpewGEQXZnAmpxyECeBHm829Aosb63qZZyZGx
         YQbVXlltiQaC4Nl4aDmv7lSPhIj3kdZF7D1IQrkZMYOc+ifI21O3xyCZmW/9kTNpYBXM
         dJy7rJ/4pDY94086TWhbxs2DoKL3OuVHv47KeHBjvMa3+6cSt4BOobaFLbVPt45SGRMb
         fLPMDAXuwHVeNlXGhFigJSD6KD//kHve2fBLkNpYNsYsZTGWaFaJexPYmMfTj1jCBoAJ
         omsw==
X-Gm-Message-State: AOJu0YyOxGgX3XaadbNknQY52P4D3WdsKzqaeqc/dODwTSx0ZMsjnGHc
	zPAVLip1EvAOxZTfjAwborswvOjU5bQ9tKPJbyna9p71FPVbuH9NuWCA7vrlbFEaQbYv/G4QkTV
	gLSOcbCiGzfz/JpeRZhIlLe4iA8PNskmhAn2mIjzuzOCiKxaUpVk6JcG5lmDisqlP
X-Received: by 2002:a05:6808:1591:b0:3e5:cf3b:4fc5 with SMTP id 5614622812f47-3e794669a12mr8394398b6e.15.1731259888223;
        Sun, 10 Nov 2024 09:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlOzi65P7xi3H7DBVKQLZt4+WlNHkeZhiSyvM/O9y9uS7YPurRkCY66DUaoOZ6gSGpxTWaoA==
X-Received: by 2002:a05:6808:1591:b0:3e5:cf3b:4fc5 with SMTP id 5614622812f47-3e794669a12mr8394387b6e.15.1731259887914;
        Sun, 10 Nov 2024 09:31:27 -0800 (PST)
Received: from [192.168.86.60] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e78cb53843sm1718506b6e.0.2024.11.10.09.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 09:31:27 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/2] drm/msm/adreno: Setup SMMU aparture
Date: Sun, 10 Nov 2024 09:33:39 -0800
Message-Id: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPuMGcC/32NwQ6CMBBEf4Xs2ZK2gIonjRePHrwZDmtZpIml2
 AWiIfy7DR/gZZI3k5mZgSlYYjgkMwSaLFvfRdCbBEyL3ZOErSODljpXUmqBdaDOC3ZuFNhjGMZ
 AoqFdXaAyj32WQ6z2gRr7WWfvcD3dzheoot1aHnz4rmeTWsP/u5MSUlCJ28yUxlBTHD1z+h7xZ
 bxzaRSolmX5AY2NMPHGAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vmdmtg+hk9uw5bKOQ3rjPE500KtSKYUR9oTuviBoIzQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnMO55x0I+eKkTr1RDsmXHn7vLUtSOtoH/M69Re
 inY60N/+hOJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZzDueRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUWQBAA1HkfERObZWNLHmLRFtC9pnJiooFMnDQHX2hv3s8
 5nLxyDAgHelNapb5y8Gt48GHR3QJYXREROrOAC73BgGnqW+v9Ri/z0Ag4dYM3MjUYSQzOC3m/xT
 iyZgamqJ/Q7kTmrpyX/r/RYLMtXpP5lg0ZEo7kPCS6x8QE2LjCjGIxpXqfOPT8wE5GrrpkpH/po
 C1TbDIxMzxSeFR5SsmVWOBU7MfY+s+T0frf1cao581kXfr5Ey8dJWQw/dL1wrJBObu4/PQx6F7Q
 dMQMGFPiG2swFoj8iDW6t2EQCb+1RazlC+yn18sisAu2/g/D9Xvl3qyZgjIgD7bpwt9iy8JKE7E
 9OEeqQaav2VYSkyu+UGp8tYF7VCCBUOef0O6Gifh9KPIbVU7G59HFA4XpI3uafphU/c6L9yHqmo
 5EWXvPM+/ubjUuYdcAcYECp1a5DmxnSXo/XcJrcEpawllXSqUli4b+ejSjuqMD1ZkQ5M0a8Kfye
 WpIlezPYNLQidIML9u3vJ7QL+9aSqdFOTtKlOsRlATjrdJkSEBmZcizwTtQYGrJqI6cCcc7ZuXW
 22bwW7WAJXdk31UTJqauZgjmnsr46Uh4mguUWvC7dSfyyFQMO3HmuLZE+akqF28rJhZs6EINh9t
 7TgTWcka63ICQjbmGN9MVwJga7w3MnFpHfetXkNBHq3w=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: 5DqlGXQsddLTTJiPR7MqCMEaRt__oQOH
X-Proofpoint-GUID: 5DqlGXQsddLTTJiPR7MqCMEaRt__oQOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411100155

Support for per-page tables requires the SMMU aparture to be setup, on
some targets this is done statically in firmware, on others it's
expected to be requested in runtime by the driver, through a SCM call.

Marking the series as RFT, as this has been tested on a few different
modern platforms, but only with Qualcomm presence in EL2.

I did receive Tested-by from Konrad and Jessica, not picking these up,
as I change the firmware call pattern in this version by introducing a
"is_available" check.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Added a check to see if the SCM call is available, to avoid possibly
  error prints.
- Link to v1: https://lore.kernel.org/r/20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com

---
Bjorn Andersson (2):
      firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
      drm/msm/adreno: Setup SMMU aparture for per-process page table

 drivers/firmware/qcom/qcom_scm.c        | 26 ++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h        |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
 include/linux/firmware/qcom/qcom_scm.h  |  2 ++
 4 files changed, 40 insertions(+)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241002-adreno-smmu-aparture-fe7d5a1cb834

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


