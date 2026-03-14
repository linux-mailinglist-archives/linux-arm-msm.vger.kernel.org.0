Return-Path: <linux-arm-msm+bounces-97648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K5XDFK1tGmMsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:09:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB128B213
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C0ED3046A9C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA6C272E61;
	Sat, 14 Mar 2026 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+EiaUsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duIJGKob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028F269CE6
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450562; cv=none; b=GoaJEkt0wpf5jaZeRx5f9ScxQX3rJ/cQIV+rYx2uhLtI3WTIgANVYXuSWnTnXd51KT3TZLu8zzn3GynlWZMAyaOx3EXzRZG22cCaF+fII+RP3nap/Lidkt23ZOsUFkMQn6O9PdVHQ1nmqeUfg0xm0vWEyGcVngoXh2Ds0A6c3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450562; c=relaxed/simple;
	bh=eakQfjxoaFEzAgZTNF/SA8mAZboCLH9N80G+a7PTCxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moH+TUpgytQkwp4nYnbbtG9Bsqmm3moOGKUF/NZiOISprAv84Q8ydx0b4ghBTvXIGuQZHJd9wRrazYwFBM8MrOyrIQ6KCvUwhI/AyMbJeNrkk8OJTvfph/oOjn3nbDULVetxdqKQ3LlPezPlDWul2H7pfxBL89mEZDi3e1Jlxzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+EiaUsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duIJGKob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DI96vP2393503
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSS4Apq1RtX0e2b4UQIuC0SLm4KCkQ7NHbbPUFHwauU=; b=J+EiaUsbfX6EZPkI
	T4vJxXzK4XGT0gKuAL8NEGKsAQBAb5Y3vRrgqSe5UxzY6WoGiJOmiNxZA+7XO9c2
	ZFOvJssMw3h2Mw26FA7fqHNLIQH62Kx40N0BW1S6GRffxr/u3Ho56I5X+OICWV0K
	7sfjqU3Sv2c67KgHIFQi+b8G5tnxU35v7K1nNqbBXgIAoR4vczFTdi4jgM5U74D9
	G1SiQWDK6Mpr6laM1Gp/yafUz5wp7OLHYN3xXeegF/RVLrLHw0uZTP8URUI+1x4q
	ruqT5zUkigl+ndxmd850vV07fRI4WirIbtKviKQfs7xuV++eN3OeTcqfzqr6mhzJ
	Bq0NCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5mahdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b19111fso131469221cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450559; x=1774055359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSS4Apq1RtX0e2b4UQIuC0SLm4KCkQ7NHbbPUFHwauU=;
        b=duIJGKobcHmx1E1m9LaU1/d9jGVRPVBV772na7f3DvHCA2reoU1gFNeKffA9muMIVC
         3sAklHRJ+ay+sg/SoMW6KzCSKo1iAUch3h6EryP15MX8o4pVXXAxZurCI9pxUdd+LBTt
         mjGnM7Wo88avu3PcuKpMhg1y3KaXCCt8auPf2uZYFUzRT8OWko5Ua52ct6nF4GJTN0c4
         jQfG9bncYQWJzV+9fA1idd5vc7dD9Vb9YukbGiWBZuJUIrqtNMAyR8YkY5g0IpHGEoBS
         p48YFs5gYu20inDD6J1TRDTDdw1D93W3SDn/wtwXhHMqLlnUOiJET46aiWruV5ksK2ow
         wyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450559; x=1774055359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSS4Apq1RtX0e2b4UQIuC0SLm4KCkQ7NHbbPUFHwauU=;
        b=aDtRKjd5h07YaIqoX2n8v6/D0qeIN62ZsjW2CsbOV4/22reVOBZc2AvH0s+8iPN45o
         rm4cHeJFsZ+k15ECsxAGHqx+H2vavjnmhjZGYxQN+bZaqRvPPN9/MtATUh1v3Cr28WL8
         f1WyvxdVF4zqKiPIfCI24e5vC1AlLAoSzfdPDWW1eH5KwToBn8Gl/S4/guUJYbUydW98
         4GbPr7hT7dAif7Zln0I3tklJcWVGeXJVcJ2xYU3YMMx5RJ6/Rep0GRXuvApbtCywWSxg
         LoNSEnVCCuvII5HKYfZbkT/Fczjz1lHMxmWGt2mAATlZQi6lyhdQCHxQpdeCvYrRmFis
         FO2A==
X-Gm-Message-State: AOJu0YwmWZew05G3SsJFWKuQy1JlZdDTfmhdmCfRFY4+TFv1LvZ47NsX
	VwCXYFox7Gig8zV6WFHXLh8byjVXwmPxrNdyTvOI0KDYy9ayR8oDJldf5KTXagCCqMyYuo6bpTQ
	ytvq+jkilqR9ATS52czjLi4GFIr2qd0Pe6P1UJUMmw4UYjiurG9Cv3ZrkEu2aZRcBNJaf
X-Gm-Gg: ATEYQzxmgzCeBnQf+WLn2Xo2ktrU2HZoge4PpGm3qzaH1ePjrKt6QV+OmF1z4L//J4s
	Ow6KxSuUfkzQL4KC++S+L/hdBSW4C44FuueJF8FgHWodZLtZ8bNlN6SPCBAg5Pbxd+PdHCsSMSK
	+i9ZIQ0Y/vkl8/khCshQ1xkChAsio6WH3uiq8LDdL75CGAW75KcWTecms6ZsX5AtloHDXtrfOQw
	Z6zzbtdScF4GVaZIO8UkYlKQVH0kK//CbfRhFVSeTc49EG41j8Fd9hxj5qTerJVQaJPjVJIMzH1
	OgE+Ear5bSJKa8rJ4kSUhbmb5sShNrjmTECskhrj/Y0+FGGzQVLFoJ8MsCl3ww7j0C9mQ7Aco9B
	FXEPOkR302tgjsrCgfaFqnOlGXtGj5Akay935MimWc/su29sBbKT2ZlwhCtpZBrswfL+z/TmHE7
	bPLBlyljMKq+ZXtKQusQPsS/Yo12JG5KEbkCA=
X-Received: by 2002:ac8:7c4e:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50957ea4b91mr74476821cf.50.1773450559579;
        Fri, 13 Mar 2026 18:09:19 -0700 (PDT)
X-Received: by 2002:ac8:7c4e:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50957ea4b91mr74476511cf.50.1773450559043;
        Fri, 13 Mar 2026 18:09:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:06 +0200
Subject: [PATCH v5 02/10] drm/msm/dp: Fix the ISR_* enum values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-2-0c8450737d64@oss.qualcomm.com>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ww/3qknDh3ls3uKJd9KJ6MipP3FzUf7GXLi0EYvbbNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLUzpMT48Ul1fCy2axFvUY6so32R8/lXIrhK+
 jiXWcynaeCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1MwAKCRCLPIo+Aiko
 1VvKB/98dmFO4H+csqmM6Uvyh0/4Gwx4eTwsJ+9HO8uwCsOwxLyR+B/6DgT275/B5fMKUad6hAZ
 5/whaKv1MgRYOZDPnEy43V0DhwOanfnjkEVUjKgcsZhPv8f4h2UsGpTH6nxhWxAik5EjpU2yv9g
 iE4E/1nGmLuOljEh+sSpBUL/BFQIoHolvVVepuWqbr+xjAF2DsFV8TcYd28IuAaNKI1VPyBeoQZ
 /EGA97xGYhTzHemOcmYzOiacD8ZkCXfh547h1IChZmQb36dETF74o6lhvonkQD4yd8zHi525957
 N2xIjxL18NL5J6O9dWgr15pqdDYBeRIlW1WtG2yhOc4BiRsE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: X-wsvrWsOSayxH2_PjhiFMnvb9RwChgC
X-Proofpoint-GUID: X-wsvrWsOSayxH2_PjhiFMnvb9RwChgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX9xIfDSQGHS0E
 84E5Ft37ZgZoigPA0I78W7pH4rQkS7bc+ErhGpryzdk61s29VIajeOdZgX1SeKqltgpmKqgk/mt
 nYHGqPUhDafVjrkw+hK9sWG9njixjd8Gdp3Ca5tUhnIFncJIoSzV/KvhJ4IooRtFaL3QXREq2Lt
 B0acZ6M0uw8wNRpM84k8Na1lq5+XiwYDrFxiiFhM6t6Gdc8x2lrA1b7VgFrbnBxSoVM2T9z1O7G
 Lw16BICM0fZYa9jxUCGgyHQARS5JD1RdD/0O92fO1FTU/wkOelTvHSarKG1SEBaRBSZdmPGytN/
 QrcUfqWb0cd2wf4TQEhfNS+oVHtgrtLsw3ZMbKJwek/yj0JMrIiC5xDI3jWJ0O2oM2GRn2yzAWq
 1mr6+cBCpvhtQWxHvKsvfljouR8JDOKEDOP92xjNcVuefPlSzhWdkDYAn1ql3LJUTu57jpol7mV
 YgjBYiFCzDor69kUGig==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b4b540 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=aneus3DpQx8xEqIVSrsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97648-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3AB128B213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jesszhan0024@gmail.com>

The ISR_HPD_* enum should represent values that can be read from the
REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
ISR_HPD_REPLUG_COUNT to map them correctly to register values.

While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 476848bf8cd1..5997cd28ba11 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -38,9 +38,9 @@ enum {
 	ISR_DISCONNECTED,
 	ISR_CONNECT_PENDING,
 	ISR_CONNECTED,
-	ISR_HPD_REPLUG_COUNT,
+	ISR_HPD_IO_GLITCH_COUNT,
 	ISR_IRQ_HPD_PULSE_COUNT,
-	ISR_HPD_LO_GLITH_COUNT,
+	ISR_HPD_REPLUG_COUNT,
 };
 
 /* event thread connection state */

-- 
2.47.3


