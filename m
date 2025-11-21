Return-Path: <linux-arm-msm+bounces-82885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A466C7ACCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1E05F380E7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 16:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2492F3254B7;
	Fri, 21 Nov 2025 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRuZPeDW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ElrI+kdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C121771C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741642; cv=none; b=UmsnvCw5VsQSxrsCgj3pAyNfyR+toKUl5muvoYbk9tFCaQCNw7TxXBubVduL/g2ninzeffT2knfbyLRhlWgztkBEnuDWKCW5821foEbUe9GsdIPnmgh+V5iSVOXajEP6a2amLusxI7dGLKPhv+Ty15xmwBf/z2kJ7Ihz/mFPGUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741642; c=relaxed/simple;
	bh=/xT8Ov+PsfKN/aMoRfE7m/iFLH+BeOD3az/2eEWxojg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Exl6YwtpE/7VwGPVn5LEcyOfCzdtGq+OKgDMCSg1EBicz5CDw/v9HKQ/g3PbJV+bfINBLdjPqzZVDdGlogPMKy3R5aeIHjerJHxIB6ZdbUkrafl3qeQ5/BUYNMHWB+hg7Y3AFDNyFRJ/M1mCohKLeVBJRnjEUp+EIk9MP7qpXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRuZPeDW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ElrI+kdd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9SYsC3541425
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=afYW2INdmx0JO0YDXbe8P+
	qVkx8T/BiOKX7PKMV+FlU=; b=lRuZPeDWUJ9a2vTkf/f5nypgjyEQdVYyNBWC17
	4JHmrePO/cwm8OeL1/JEKUPEpC2xZhlGxQInj7NF9MxYIsomR5r46wDJqrgqZbC1
	ZiM6wQLik/7KBJW/RKkj50eOqDuKQEAlfJBHAZly5Qxjw/tqoifLK8GnG1QwJ7w3
	LJSuuffYC2zCagdZktIlNhqSYk/fwiuhZj3w4G2urElK8fcx+jo85u/i8uu1komo
	yr1d60ToyaM5q+q0QIKVBPSkehWYq1C+hN3not/br2a3cZrVgW5dLl/IYXZVE+kS
	/uSedRuXXtMw3hMQ08iy+Fbs+B0VqHmEqfCFpxA0+eNVOM3A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng017uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:00 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55995c43832so3966007e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763741639; x=1764346439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afYW2INdmx0JO0YDXbe8P+qVkx8T/BiOKX7PKMV+FlU=;
        b=ElrI+kddOcvZp4aQKoXAS37kADtHMuemXaJpzQQb6YrbCagUBzDazv1DCC98tFRXTa
         5+ZhI+Ij6yhmcxSqSnX53m04oalS9FSWSfY3Puu/r7FPe5MhO4pf0rGTZnWLNApsu/Mt
         1EaoZKaE/f3ELkGF9ROhyg++4q2g3bHSYQILjj+2ZqXB5jxTzEgS/RvnEgv2Go1hrSzv
         7aFesTXmi6xOo+cZLZZdRWCac++a/I9rsEVQnWcP3fcziE0HKIJpP7FQOggsjoI95fbZ
         VawXuEmve4REZyQ0GaZWS/DauHJDNZ5b3yvWtZA0xNwDoJ9ZTOhZAfWylnlov3Wl6t4Y
         IrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741639; x=1764346439;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afYW2INdmx0JO0YDXbe8P+qVkx8T/BiOKX7PKMV+FlU=;
        b=UbIKaZMt83xdRPKjcNBXLbVjVHBAX57zamYL6cwCs42C4rJOh4g2nTnzRgeiHSGnbM
         U6XtBVT90V1VIS8UX5fo4sHeqbLRCTbsxO6sR2siNNMheuswGbnwmEETjS8t/N5F1Jj+
         qhXPUpgQI2nKBYJbAkGbeBFxUSWZgednZkrCvqakYtvPxtwC7GUfYcyIZXgdgcdHxlVb
         3mrH6uZZDN+/jjTff/PcFbusuI5gYZYZDL22gI0pGAmShVcpgQqD+UOf/c204mpfQqq8
         c0cDpMobL7XPCfvaBST2EoI4BfFNnBDZlpio3eGnQ1PRkilETJbUZjxjEhLWJ/1VUUnj
         TwUA==
X-Gm-Message-State: AOJu0Yx/bV8c+OGpiemgewseglyiDzlA878s0VCRh3r6YMSfCLoCDz6T
	x+S3HQLsIwbVsHN3BpUpvZpxDcexmroxLtYZ9TWprMp1KkMUPtczQwH7KkwfLICzPeSElhUGC7s
	BSE8z9/zYdLGQcRjH7lofT8/D0PVaf6GsmIQptf4Olg9th72qg9/j9SXeFNgasMAYyNyj
X-Gm-Gg: ASbGncvYKWfxb1JvjeUlZ3sofJIZnZ6l4MpOP1AQxompnLTlhziCrkjoZLGGJfPZ9ko
	VszejtDX7sQTGkkYyL9K4lMawwwM4r5TeakhJXqrhCrtu+k+ZOpjdT5FR9Un+Bfdj/9KJkUpU8m
	A1+00Jnbfhh2R+xdGv+YNovDqScvlJ1WmrFce8VtQToIjxF6oKUaskinchGatjdx9g7ky4W1O9b
	pUcrOgOArDt/RLYhpYtAiYb/jj52ZudMAt+VVZRt9ZJwmySiNcdWKrxlTVm/tOP1Yodi/vUXFdI
	Gjuag4SecXtWzm7Sj6QOvg9TZTUh8L/K74g6Z9sNJX9h8D/Jx/HmZMa4vOs5VE62p0MDLY856HU
	x1tsVyxRcEJ7zgJNfBmQQmgoHbtCK/uaYR6PTCGRjrGmh5ZjMKaXwsfGuZgkjQnyG8bExQdLF3B
	8NwJovdtohwjonIOfC67jdmtg=
X-Received: by 2002:a05:6122:1685:b0:55b:f45:1874 with SMTP id 71dfb90a1353d-55b8d778213mr1011014e0c.11.1763741639410;
        Fri, 21 Nov 2025 08:13:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOgQYgFCe0VTPrWrOvY7YoNuHe7aWXw+hMMWvQWaJGu2ivgw5iptTZurs7oQHBUhuuPUJHCg==
X-Received: by 2002:a05:6122:1685:b0:55b:f45:1874 with SMTP id 71dfb90a1353d-55b8d778213mr1010992e0c.11.1763741638981;
        Fri, 21 Nov 2025 08:13:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:13:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
Date: Fri, 21 Nov 2025 18:13:02 +0200
Message-Id: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6PIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3UQjI1NdQ0szAyODVFMzo2QjJaDSgqLUtMwKsDHRsbW1ALCrRy9
 WAAAA
X-Change-ID: 20251121-a225-196020e562c2
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/xT8Ov+PsfKN/aMoRfE7m/iFLH+BeOD3az/2eEWxojg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/DBDeEhn/1rqubM/o28dUkUWKP++pZgF6en
 M110JsyFpSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPwwAKCRCLPIo+Aiko
 1YZWB/9GxSpE+Ah2/9n4UCa0U6MA4eakXfIrjPqMUe4/V/y1dJLbmcc3KPe6vwbVBq1gmY1dhmX
 GLW5Qsh1sJbJI7wrKzLJoOlVGRKLjzEfCuYoKBQtVyqrUMqcgJkpBnUxTonUr9MjvDaTkHbMBjb
 ktg3AJ2cZ0+QorM/XIhtDrvdG8Wtr7+AN93123LAm1RPT5mJsxKYOvgbJyA6ksmIgBP7Wdv8C54
 cmWFLsKTOJYahp5jLc3N7cqojW8MgX604bdwzSV3+DtWTqh6GK/T/EOZEQwUa5tBunesVqyxe+O
 5l90x5HzWPztgaILGrs9wTqVKEV+JMQSxf9MVYCaY0wIpQFX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: O6MpX2Sab9WcMinSPx-3eVbcZNgOFazC
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=69208fc8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AiwHhODu2twfVB833LQA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: O6MpX2Sab9WcMinSPx-3eVbcZNgOFazC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfX4SlMUWvHAKZL
 VLWqUD0Lm8V4h+G4czgsiK9rBY6aca36pXNEhdEEDbwr2u9Ra5xIsn02itUB8DblCmZ/D0shBOJ
 KFXPeeWahBzQ/JXJxKdid4GKTdTkcfxP26x2jeGiBT3+VdfkARGDLrN59bgcAl4WG2hinHfTzee
 wdFqIALwAcNMZGp//XJJRAXGNPFd/AS57eTSLmbyGdcqII09z1w+ZVf6bJ2cBOUxqDxKWl4nlBL
 lZgC+KGb4MYG3cuc9pD7eRabgk1OncYWMqehrzqgaGNv/+fo/sAitNeSP9VxwTLYAWJNyNLpcQy
 MkaZXmawhD8sAr4NFOM+PptKaF71P/HeCrOsiqU1GDngukaLZHpte67ZI51NzSdW1q2qHn9ogWw
 0ukoQLym1p6ZCuz9TfnTyOt8+tOgKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119

Add two remaining bits necessary to enable Adreno A225 support.
Note, this wasn't tested on the actual hardware and is purely based on
the old KGSL driver from msm-3.0. For example, running on MSM8960 might
require adjusting PM_OVERRIDE[12] registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/a2xx: fix pixel shader start on A225
      drm/msm/a2xx: add A225 entry to catalog

 drivers/gpu/drm/msm/adreno/a2xx_catalog.c | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  5 ++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251121-a225-196020e562c2

Best regards,
-- 
With best wishes
Dmitry


