Return-Path: <linux-arm-msm+bounces-64673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC695B028BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AA8A565433
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57F621FF2B;
	Sat, 12 Jul 2025 00:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6CEWo6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3745915746F
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281931; cv=none; b=taBoov4ppTzzcUHwn9mxv/ZHfumbdGDDerXQxb+YJEGjYp5ce3i7w+CGJHl8qFF/NgBsVyleQkOZGlQQSIw2cOvOXZKaalEa/1FXO9BoIR+SGzxQ761YMgG4CkjATjzXt33L+jCpxRERrSsiqORL+2RG7TtD/CMR+cYPwF9Vckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281931; c=relaxed/simple;
	bh=rUc4Sgw5rxOU20loNM6AdBhsgLGh23bqcztnvCfOjeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GX++0GMLnUasXqu6lNGftMQwNvia2nsq0bLjd+eltp2IMp/Q2Hp7JbrJOowtYTnAFFvWg6R1nXVRZwJp0lIWbB+fkthHWB4NIfq9RHv8NfnmFB70Skzl35bpkzVzlrRD5kzrFLpWz7MPTqrqkOmWGaC81cSVV9dmphBhRAXeEHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6CEWo6o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C00HJ2000664
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bszOuNEzmYEHHlgQlK1KYpB1RHEkBL6gk1zou4Kczfs=; b=d6CEWo6oMn75QCMA
	eP9iMW8OF9R10iyrHRSm+vVx8ns2eAJKJUYPNkDazLyslYaVpGIWnqLZmFdnFInZ
	x/4uVBEdBEgZU3z65jW3hRxycwrZiqdZ0RK0Esa4p4VMb4qep+I4fs+nXpV9N+Da
	iyw6udVBLUSreh8QnJju4oUBb7hv5rnwUMEqSMj3NqLGb7K6zX85ywdNxWaKi/tW
	FNK5c4U0pbb4yurc/i+eDewmHRA3mqwxpxfem97o2eMEqQYk1veR1nxuE4Mz/4YW
	5OsxdcocS02p3rUhpVAFV1hOXDH5u+bOG6w1GfXiti87uGzFWs8v9DvDx3fknyP8
	UDcgxw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbet994-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso2413370a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281928; x=1752886728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bszOuNEzmYEHHlgQlK1KYpB1RHEkBL6gk1zou4Kczfs=;
        b=W6tFpydzjAQpneqK1/IflECD9wl220KihZDuEPhp5fmGMN+E9vXMRqlpzZv+xNLZGo
         yMO0ndAbZFwXtOhZaZFSoi1li/9m74nOGbDyWUWavPk54u7+kOsU1CDRnmQy4mHtQTD/
         XnP5R/Fc2DuAkZMXf8NXR8BFkNNQzAOaifZe3DTaPshtCrPwUny5Rge0y0I0SawiQGLI
         MRNum19B9xni6Ij7vWwuzPiPHg06eRAEFLqKN/TMH5ArkzvDFTdEkxY42lsvCr4vExLD
         kXZSB2jhG8LCKfGxGHlr/lShtZciL2VbD1z5qbjMO62AbtQuWl+dTC6mY6bJ+ZFlvcni
         V6Pg==
X-Gm-Message-State: AOJu0YzUL8F1dYdoFOkhwimNsb9cpUTlO4qGayMjPH86taJtYfwPQZ7J
	y3TUN8/YEozFoiM3AQt+YyjeSUNUiep5tp01NGIonD7Rv9hcfGW247SMkIKJhgjclmodypfjpR3
	avNLuOjL/W3tkPe3mMVTz/V67xnJ73SiiqRXpiyZWa9LKlJvtZefGtAh/vyUO/MHD2SLQl9j0kz
	pB
X-Gm-Gg: ASbGncs26RZV5kq68V5x7cU7bC7KELn0vp1zmEMysXeNy0DFeHyRKzj7OSjjcvwrsjt
	+Dy+0EOBERtAetg0P8jRjORDDSEsXW/lil8LLAvAKdco+rtQTVDCIlbIm0vNyjd+qTasHG/kp+C
	aFgJ4+nv9qBCHnO+55Uj4KaF8Mnals/mFhez60BSW6b689A2aDFCd9IlTRkmXJapkMyTfND7Ena
	JI50ujNqrEr5tMUhlhx4uuMROu2CPbLOkIffNr3BMYKFZ0dWlicJDy8hIPu2miYIzUael1pczvW
	4PkvZashDJiB86/Aks7i+MTKXhYAfNkJOnsEErJ/7Cdcgr+Jh8BvlLZSxgDQHHufU1edntSFjtS
	5zPDLVNs8xAhrGmaA37tvRqMs
X-Received: by 2002:a17:90b:3a46:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-31c50d5dd27mr5480914a91.7.1752281928540;
        Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPp232VKZu5fw0vh7/xwi5GtN1guTWNchaqd+MF6vNbgX0pVciWwweX1gqU38GAdEKUujB/Q==
X-Received: by 2002:a17:90b:3a46:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-31c50d5dd27mr5480891a91.7.1752281928124;
        Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:19 -0700
Subject: [PATCH 14/19] drm/msm/dp: Drop ST_CONNECTED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-14-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=883;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=rUc4Sgw5rxOU20loNM6AdBhsgLGh23bqcztnvCfOjeo=;
 b=ofz4DmMAv5I6W/4k9XAX02jtlY82ln0uuSdJIP6n0rJn+5lWf3v5ties60153vfPtnsCPGq3S
 QElekPUwvEHBF8kimc20I7HFgbTWwwOGAq8QBTFIY7ozh/OADyjlT5v
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX3AtnBARBi2kJ
 2meh2SZrAT79AJLLMw+aJXo4Vs6hNmWxNyPOCJAFeZV/wEkTK/Y79iczX8DZyumJdfGFyALm2n7
 gcgnaFr9sndClB87YHa6YN0b9g+7zpiFGsDD96BBgATnHC9j+PtdmrLzhtsvjDhzyG7KVHHowDT
 jwL4TderK4edrRR/7CozugIj4HjlaJ2NCxvV0qNzdWsfRlooCZFdVgQfQg43P4WomX5R69kndxT
 lIGO4GwWmZo0E7doP4dk+KA47G26om93IddTR1oa76ieZa9i/TG2lj3eMMNkPQj8KJnifV8yUMJ
 MlNRgf0q3bARTTX9f+c9yNaF0qxFYXC44M5evfQTqZNKy7jzii4+s7pV0feTOqECHQJzsshdJgc
 LBbeqsGVieW/KnpzEER2D/LmDPHwjIUWHqF+tSXGIV+ao/FM+7f1pGbp91PaWMFPWskHwp6B
X-Proofpoint-GUID: Z3ardnTXHweQ82XFgVxi2DX1NDP2UwrI
X-Proofpoint-ORIG-GUID: Z3ardnTXHweQ82XFgVxi2DX1NDP2UwrI
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6871b349 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=k23i9R_ERYQwGrdfUk8A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=960 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005

Drop the now-unused ST_CONNECTED state

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dac5078a849d..c7ad61e96b37 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -45,7 +45,6 @@ enum {
 
 /* event thread connection state */
 enum {
-	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
 
@@ -1594,9 +1593,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		msm_dp_display_disable(msm_dp_display);
 	}
 
-	/* completed connection */
-	msm_dp_display->hpd_state = ST_CONNECTED;
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 	mutex_unlock(&msm_dp_display->event_mutex);
 }

-- 
2.50.1


