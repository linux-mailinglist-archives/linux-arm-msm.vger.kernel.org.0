Return-Path: <linux-arm-msm+bounces-102662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCpjCtDG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:45:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D79AC3D524E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21D1F305F68E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B7D3B52E0;
	Fri, 10 Apr 2026 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmD30h/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gd1zAwDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301BF3C9EFE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813830; cv=none; b=JBDSlERm8PWX6P30dmy9/AM2h554YdRunrwLgD5othYxwgurBujO8Tts1o7esIrTisl0NF09j6Fef6aXkuxJref6YQceTRJnwOVPYJTQcD+rVdxtTwJ9F+am9/6ZHb+nmuMxwZVzk4T0OCDG99/89mPaE0i14zQQ6gRXJUDrRZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813830; c=relaxed/simple;
	bh=iMwTEQlSLqdMIjLd0OShc7tEQJwDmpIpI7plmhl2Ppk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhgpCD49d7lD6LM7il5X9JE5PcJWz6JrlwIbncxAihhoh6Re9f0wAcHILvHDsPKnc6ROcYsjpF/XV5nVlwC/LZLc+NHS2+yfOIdBN7fCrPiWHJJt3KR9DLhyxIbmr3TaEfVmt9KpyjTLLHLxatNogV1YVF4POZFm1qLdrbEI8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmD30h/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gd1zAwDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6px9U1729915
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pwcDuwy8Yl7ve/abmXSW9gOfw1XWb9w/unRXTRsbdGM=; b=UmD30h/Y6Uh7FrSN
	w8HdVwdkqFzzjakEVeZduyvCv8A7PgOANcVWOszKVvKyh4v/1Fl4BihpiVJD8jjP
	tB80nkOZXwj6jgCu2D00HAeyB3oQLZwwA9f2esDH+1p11VmGv+a3sfYQW9R453DL
	kyBK9MyFDKB4MKLkwQd6AOtU8CVBFJj41zZCqudhQsa/I7wcmm/M72BQQtk6EvCU
	aJ3+Xjv9Wi0eSCE6KT5wajs47xoNs6fhyrLgsqSAGafSDMEQ2oGO2jm4jR8W4rPA
	3LSDdhOf5e+4qHp12W9KEqlRyTftJjWgNJu7k/Qp8txP6ZMcAcS8W2W5rc2iajSa
	ihVCqw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxknff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:37:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ac04b2fc4eso54803376d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813827; x=1776418627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwcDuwy8Yl7ve/abmXSW9gOfw1XWb9w/unRXTRsbdGM=;
        b=Gd1zAwDv9fqeZR6teuLY73iO5ile7veDVhWef/38q7UPv6xqWnJf+59gvnOeFGRrSc
         dSQRMVdek7V7JHAF5tZyaYcV9wfeKqqt1JhvkA+iUyb9TwEvyZidzP9LhFzWWQfZMXTk
         OiG2KqQdwxpc0/Zh6qQSqjSPjQEiqETqiVg5k+j+pbMgMJne+b5f7dVD85bUcUPvq8zF
         U9MqDeKiPFw2OvFzGAxhs/siCM/z4jH3bM2yTd63o9pHVAF4chOl6khbZCLjpAZLsm2s
         drZ2kOPLREAFW1UICQBEilizmHBBa+pVxUhjHpLxPx5Fwl2Puq0t6dL5XUB88t4VHnU5
         84hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813827; x=1776418627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pwcDuwy8Yl7ve/abmXSW9gOfw1XWb9w/unRXTRsbdGM=;
        b=QWYZAu+/cUIVvHtiSVHdJdXSOfHwyyEGx4FiQXdgmc0zyvQNF5Wv85B7Dan69A7ORQ
         Ksr+k9gXS1rina0xNysSMUaG5h6aL3Gb4R9K6+MlZEyxsLzbkCaNpg9eb20hkQL7c8oS
         xE5J5K06lxiLwv1KAN8DdIwBgbEDo0ijl3LYsJsh8gMk6vMZ54T4JdJvesfgaKJMqL1o
         4cEL1WwL0ACPuq1P8raWgzBWIUOdJ7NE8PdffORPi81ks5AzLuV9uVLKkm2iLiYcRUb7
         DMuWpRsiK4Ix80f656nJCJcY88wJias67I+h0T83/MioohYlsE6ACBKNsgBA35ODSy5U
         t91g==
X-Gm-Message-State: AOJu0YyumQcq5haauWA/5NtxfSCEXHHPceM9gqq2Kkvkqo3SVw4pVpc/
	Puhkc6yaWnOOoBkDT4xd5Wb27G0QynNgZ9G5avPxsNRbg6W6PbKMoXr4PqJjwKeIcg05uxJcY0T
	2jqgvGzKfH6hL+z+geYLYx7UQcCanVbo536LgLORFVn2t3PdeiPu+oqUzCtynEpA12gAcGGGZnt
	XD
X-Gm-Gg: AeBDiesLZd1yq93QoNXZIigjOtOjbGpyfYp0EtmLpXVwmm5NqVWJkVaRxP7bsGouXoK
	NKKPEt5qzytISGtkHKC3WIEyrgZMe5Pb1TARo1DbP9jWyht6NhaxVMUz4khRlDw5ccZlXSSKbOr
	IfsXaNLQCL6GzQyduk1SUUp9g4EJFFdoA5kzk/gv59r6Q2qthdqGMEQH0DdG/1khuDZE+v65htj
	ff+SGb58zegbVMVMgN8WgAU0rgroYZ0v0e1cFNVE7o4F3x6upSsdN72m3kfu4RlZBfznsTEMNGP
	G5XgrJOYoaMuBFOjoP8ACeSDZiwzc3iR1rcLUvwTgYA+IXz4XTEJqSnrDcSeGZcToex52D+XmkQ
	zKL9vQMEALWQn+hKDseSPvYDiPbZwArnNDPqxuU2VNmLhlMr5dHYnIBO8hTPrIzeYC3wECR4NQC
	MGGyiGGy8=
X-Received: by 2002:ad4:5c83:0:b0:8a0:166a:4a0f with SMTP id 6a1803df08f44-8ac8623be8cmr32206746d6.48.1775813827401;
        Fri, 10 Apr 2026 02:37:07 -0700 (PDT)
X-Received: by 2002:ad4:5c83:0:b0:8a0:166a:4a0f with SMTP id 6a1803df08f44-8ac8623be8cmr32206386d6.48.1775813826909;
        Fri, 10 Apr 2026 02:37:06 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:37:06 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:14 +0800
Subject: [PATCH v4 39/39] drm/msm/dp: Add MST stream support for supported
 DP controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-39-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=5055;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=iMwTEQlSLqdMIjLd0OShc7tEQJwDmpIpI7plmhl2Ppk=;
 b=px7SlUcm5iFaAIhHhWYgr6H/gk/oToLLLHCVm9P87IRUEQz56O+VqMbU3shfdcsF1u9qPYrSP
 htEkTk0ua/rCYN1iG20pUn7fp1phB8aCIdFm0UxQ3k+ZRE5ZuYMKKey
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: StRcmN1a_D0VFpk11gAW-YIRfASCpuq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX8WIEVvcl0P4Q
 0e79oYcm0gg2BPXHSNk3mCf/ltqjrqsFA9bpJV4r5g2O3BmIFnV4ucD2EdWgYqpUyuIaYUC2Cdc
 KwAi+8o5WLwPrFEqRjQNYxTU5JzSRgPeAzdG07TxyUEgfxj8a5dIk+r+PLFh4OyXclCf5cDq/FX
 Hue61FkL5tRYl8x5vOgHfOWj45aMZeP1WeAOBTZROdnJqkP9d+V7PeIm+mrujzFFwsNi8xmeDIK
 KNWknurGrgwek8wYQ5XM1JoHt7oX86o/yZFoRG2+WdigO0nIdr6hXIyg2kJw0oiRmQvAyrfdjAs
 HmYuEe0En/RbndxQbyGb0I1BTgpRxfAuweyX3SU9SZnLrTrIVUTHeOf39aYV33BE9HzXYGYWJ8c
 NtSIJQ8Gepjy96HkntrgUKm2MpHIL/7ovomNm8+vVocZZgZQYzmC00FyDnrRC3cQChyhLzlYf+q
 SzeNJYd2NV+PSWSLbkw==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8c4c4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PGsfSfowbhEG1GcfnYsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: StRcmN1a_D0VFpk11gAW-YIRfASCpuq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102662-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D79AC3D524E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enables MST support for MSM DP controllers that support it, allowing each
controller to handle up to two or four DisplayPort streams. All necessary
MST support code was already implemented in the previous series of patches.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ca89e20b7563..f632b4f64ccc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -107,16 +107,21 @@ struct msm_dp_desc {
 };
 
 static const struct msm_dp_desc msm_dp_desc_glymur[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
-	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 2 },
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2 },
+	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true,
+	  .mst_streams = 2 },
 	{ .io_start = 0x0af6c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
 	{}
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 4},
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2},
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
@@ -133,38 +138,47 @@ static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
 };
 
 static const struct msm_dp_desc msm_dp_desc_sc7280[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 2 },
 	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 
 static const struct msm_dp_desc msm_dp_desc_sc8180x[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 2 },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{}
 };
 
 static const struct msm_dp_desc msm_dp_desc_sc8280xp[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 2},
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2},
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
-	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 2},
+	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2},
 	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
 	{}
 };
 
 static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 2 },
 	{}
 };
 
 static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 2},
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2},
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
 	{}

-- 
2.43.0


