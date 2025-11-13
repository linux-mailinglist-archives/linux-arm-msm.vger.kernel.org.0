Return-Path: <linux-arm-msm+bounces-81712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A63BC59FEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08DFA4E3842
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4545D313296;
	Thu, 13 Nov 2025 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTHVYmX4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvvNx9/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5B3176ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763066456; cv=none; b=qtYl1Xya5WB/1Cp2fAiMB7z/pZIpU9N7Knqsz2YITQFS5+EjJgSvKWBQ+16J4DF0BSB5a3YFKdwRPQInDGel7JM9hkk+LxBv25DgxukVKxT3TKG2rNDHxWwhd96LV2FO7mbveJPnJFPXVn3Sv2Hqt2/tzqKX87ZHdktuD0OVGJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763066456; c=relaxed/simple;
	bh=tj7tl1xY75QhAePiZ/+a/AlI7VgVWoD4r4G5vQ12TvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rs5B3OLa5SDpWa6mxDqI0+t0qrqYV68N9LZxJQnyEymujKHd7yVmL6mqdCTDelM44Tf4MzSRk+NZGgcnDrgx+kD0hCbUw14gTSR3xrNlh7E+FkaC7y6wiVWFDRfOUVtfydx8c9A1LWM9hqVDYAgAIdeyZYpPbFxYgg+5numYfdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTHVYmX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvvNx9/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADH2Pi91007886
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=un1sbvC4EIJ4U5h2uAEeAY
	8i8VLppsg5RBzR6nEWK7s=; b=lTHVYmX4MIZIUUx/+AS+ENIcMw86Zs4P1N8w19
	pJi/0I9ziwFEpEqoR4hBcdhL91/7ypQ7G9RORfSj8Z/pANHgY8zcCQaEkb5yNVOB
	k9qMXlMn0VuVSzxPy/UWABQsK+AbXZ7EPRaEOAtQdQglxN4iYZIBG4cnab4y3O4x
	couksKNHZSIMaejjcg4r3oRvC+a+oZ/WturNENb2SVvEy34npeXdypXpgeLHuzwE
	sUKB88PEnyAF6nHvdkmO/ViVMNyIKQkVArruoSgS7owsVBEZf+JQrD+sAIUShpSw
	8CK8az/kMVYQ3CmbXAqlF1ENcq5brr3/hSUfABysYCcGq+FQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adkcnrn5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:40:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22c87f005so433686585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763066453; x=1763671253; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=un1sbvC4EIJ4U5h2uAEeAY8i8VLppsg5RBzR6nEWK7s=;
        b=XvvNx9/le4Ou2CGPcYtfjDUvMQU7KRVjGcKMeKUG9nx13mLb06qgR0PjvclVacDBaI
         7zDvUoqqJAIlCfCl50iT3HyORWiWBjOW3aWi5C+GamcN2TyDyOlwxRGjbpRIXm2olPmf
         h0Rg6p7cm6RqAP8lViF7AB9+EQXlcI5XCaq2YbYmb7mHi9LmPsGPHvz3OiQjB7TrpYE5
         dAZ6D9frlOxMxNYsU+0Y6h+Xf6AV5mFA06WhBFAta/ldtN60UAQlejZHJlGk5mXm3MhR
         IwUPBv/dQVtWMyAE2AjIb4kKmW/KQa5y61oNUC5MdWPDPwX2dKBOQ4Qbtkky0TNHxnSi
         2e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763066453; x=1763671253;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un1sbvC4EIJ4U5h2uAEeAY8i8VLppsg5RBzR6nEWK7s=;
        b=L05ef+UfFL6+Njvzk+ztwc8pPUWqFtQcRdI2j8z5qnO7TXl1vRN1895DIMfaF1Y13k
         RKSgYk2l++2ppuFA/8IXEzT5jvNs0xfmootvxRAQwgIOSUTrOMibIl0nJIWXwjzc4+aq
         OfOgusRNKK4GGhluJTiissIXP6b7Pqi2PmQ0DVZ4htD5LQFg8TkpKxgvkhf564kS0pfe
         ThXg9RjYl8x9CAVkfLjgd/WW3r3HWkvebr1xLwXcbLWKjCLYO0Bhvv7vowLuSxAD121P
         w6u+r95neD6D+Wg3z7nzBZAJqR+j39K+J3p+YtlXzvVKrGVq190jIQHt8ra6qnKYt7bZ
         H1FQ==
X-Gm-Message-State: AOJu0YxNagRo31UkxOFAMaqFLaYSFtSNkcDPcKu7HglJMAz64dezUKW1
	MkAE8v0zn99d1rIzeajFTBJR6AirrSoAYPxLNjloqfIy3hoO/bAtVxbg6y1EylL/pqUa6XX/TWx
	7c0y0RIptGHLEN+h9PUJqm+ef1wjVbS5DJ/eF9xmjUJqxLrKQmU7D4pNo6yBjgIHrizD7
X-Gm-Gg: ASbGncsH33GEcniFjs98/8rbZIWnc/2Xiuh4nb5NNJ7ZPMtmMBcejjyZhEflXoqTJGL
	6OkbtyE9BfDIaGSZDwM+vd1iOupcCjiGs/vExJj4fIZLwp0Ab7+lzCeH6fgRZoxjMyrdNcX/b6C
	oUJWNSsbDNKF6spbO6uHdAq0pEql6ht5IW5DuWtKghvD2NSMWGpqEgILCXuuzXwezikzOvI2Zhv
	OZGw8JcS+FHJi1Zfuje5Bq1pm6bRNr92AdbtkgMW1xdHGY+HhoG/1vqUwQ5j6bwHO8Y5CBulW+t
	mzi5fp7BPoRPpvIWhXmc7qkUScAXy6gr5DMLpkc9q7xB+UTokzaTl2pZfRyfRc+/VKnMVNOYmdo
	Ht4elY8rFkK1tqzPzhBPJCLAaweX+ztycPRy2IyQcYu5TnhAz6V9fd5KDm6pM5gZVIfZlMKPytI
	LiLeb2h/isqAv/
X-Received: by 2002:a05:620a:468e:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8b2c31c782bmr99107285a.74.1763066452626;
        Thu, 13 Nov 2025 12:40:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJcep4EHFroUI4le9fG2p8XxLEpE63t3UsRzTaVzkNUFIpdtbATFPMKQRz+CrN9TDqDI3V8g==
X-Received: by 2002:a05:620a:468e:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8b2c31c782bmr99103485a.74.1763066452109;
        Thu, 13 Nov 2025 12:40:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040567dsm607217e87.86.2025.11.13.12.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:40:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 22:40:50 +0200
Subject: [PATCH] drm/msm/a2xx: stop over-complaining about the legacy
 firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-a200-warn-once-v1-1-c28bdc8e36e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFFCFmkC/x3MQQqAIBBA0avErBtwNCm6SrRQm2o2GgoVRHdPW
 r7F/w8UzsIFxuaBzKcUSbGC2gbC7uLGKEs1aKUtERl0Wim8XI6YYmC0du36QGYI3kONjsyr3P9
 wmt/3AxdqlE9gAAAA
X-Change-ID: 20251113-a200-warn-once-55f47c138cbb
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tj7tl1xY75QhAePiZ/+a/AlI7VgVWoD4r4G5vQ12TvE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFkJSdvuNwFeOIk5OMolNUdG/dAJrrYoH2YqeC
 q5pIr7R0weJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRZCUgAKCRCLPIo+Aiko
 1dcQB/9L+DF++n7lQF+HQ177fs6ET7FY2o9xrczoEC5Y8wtn8ZJaLVnxYRLzaSUkoJb/4pdkL10
 DZIdKuCGMiyCAlfAZYDhdeY+O0dh3J44hVCij4UliwOvFoO2ohxBqgG/CldOHC2RH4S6uspnXN/
 EK3/Jpqj++7yibambHKiBA2PsI8cOK0LMCmHvrRpeCKoJokXM0OiA4mk2TveKPxv/OfhJk9abA1
 TnXorBTXRQVDjtjjDyh2bIK6KYHOYNxCKln5Z/fIO6gSzs8WvWKAO74KWSpAI9tsOxbekdGGSjY
 u9YhibJjAHKiJRNfeUPIfeEABal9rqv4cx14z1Aml1CvsCpJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pogvRadCs3C6F0CLicDIYJ0r_Cd1aRFT
X-Authority-Analysis: v=2.4 cv=F6lat6hN c=1 sm=1 tr=0 ts=69164255 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5wgBRnbEGa8ryjaxEzAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE2MSBTYWx0ZWRfX/Uc4hGrozRWS
 1dUd2dEkol0eJ+wRr4U9DI7V4bLfe1KhEagLPk17FNOKrERA/xeXZj5PnAQzp7p6I2bgzqwjgx1
 iStSDlvOHB5xlfFY4okcqZilxlfirLbym3YEej2GO+5bVhQ3fZ9vpNRkHS4Pe0nihpDQnbx4iSm
 Z4yU6lhCJqpSmjuo+j1agOChIt+ikeLCSMvId6vNLt97gugxZ4gzLEV18HFWhelI6+rOHdn4COn
 sRkK0jb42DlGqUlJ/3rioXsZbT58rYOUp2QZh8brwRxq0114sGDowiGpV9tejgWAbyCz3bdz+vc
 z7wrp6vv4VR3QOFIUm1j2jdPChsvQl+mb/jfVTxBZTmh4BtDwLIyxe6inh0uq+ilainW+NrO9AD
 I5wac5fm+Cj5bqNFAY3x/2hFgUDukA==
X-Proofpoint-ORIG-GUID: pogvRadCs3C6F0CLicDIYJ0r_Cd1aRFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130161

If the rootfs have a legacy A200 firmware, currently the driver will
complain each time the hw is reinited (which can happen a lot). E.g.
with GL testsuite the hw is reinited after each test, spamming the
console.

Make sure that the message is printed only once: when we detect the
firmware that doesn't support protection.

Fixes: 302295070d3c ("drm/msm/a2xx: support loading legacy (iMX) firmware")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index ec38db45d8a366e75acddbacd4810d7b7a80926f..963c0f669ee50d4568b521e2e8548e04d606d9ca 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -234,7 +234,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	 * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
 	 * Older firmware files, which lack protection support, have 0 instead.
 	 */
-	if (ptr[1] == 0) {
+	if (ptr[1] == 0 && !a2xx_gpu->protection_disabled) {
 		dev_warn(gpu->dev->dev,
 			 "Legacy firmware detected, disabling protection support\n");
 		a2xx_gpu->protection_disabled = true;

---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251113-a200-warn-once-55f47c138cbb

Best regards,
-- 
With best wishes
Dmitry


