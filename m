Return-Path: <linux-arm-msm+bounces-95651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCdhEpuWqWnYAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:43:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADE213B70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2C2A3051591
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B4F3A5E6D;
	Thu,  5 Mar 2026 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAXLPrD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQ+SSwT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276939F19D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721057; cv=none; b=WnAQadBFvBxxY+s9FHv8dASKMr7fCBamIMvBf29oAwT3lA35NZX8wWxfH4xYdv3bPRouFKI2jzH9i/pCV/ck9LLKr45tqDDPY/dFFxt3veXpbjapogvIZ80KuS+3/UIB5HWPJwk8ZOomvgIuYiOvdmHBscWxPOZr4rUukdEBDHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721057; c=relaxed/simple;
	bh=8TIpb1Vecd87DdarhQ45qjuuPLaThUggnFfuyV/O1a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMS8JytMNFYQpPoJBxKPNPaRdczf1S9gJcpsSGjP15udcEyuM2JME3L8bO+Wi4NKk3bme72TqTUFeBkegpFU3776hK3f6lxN0uoNbE8jDwZn3mfxHCrKNe8rc2mLtpzvyHnLewzF9bi7ZlI81f1f+jLMvGSOpra7zlQZrv+i+3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAXLPrD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQ+SSwT3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFnGu4171046
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=; b=GAXLPrD1frPdI5+x
	frD907lL5gWpKAxy7pDP9NgZupl5VWtMFNnBiwexg7hHSYe5qcnJO82li5g6kkVe
	JLZqEVZ5Z5GGk0AzJLPAODF+b6YZhGPN0YCDVuPxbvE5uP+/oBlZkgDnA72pzoC8
	Dgi2dyUrLJrk5uMrT3zWkQ1UhTzPYvnFW/3NhXJZ84BKHyxkq1PFR5YI97EXCvzI
	eUfmjSHVrCVl7Mg1Ty+lCy+B2a6HYn+8TFMt9Dkl7hRYeUT0iFnyZApmfxTkaxyM
	mEd3vwdEo1sfZkkKudDU/3UQoxWJffyKF2VSfLBJnC26SFu9SpyKnvL08aApmqSb
	+I8Y5g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb34dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:30:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899f474fae1so292096336d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721055; x=1773325855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
        b=DQ+SSwT3/VL0v5/WGhA235fXpHrRy/Rs2WwV5P2owghqJEKamyJDeWlulCHqMVzuT8
         QwjaM8jhSd7t2iJWcSkS8CB6vCzq8tarFnR+Mkp58WGg4erQ+zu/09Vx1AyCDSz89dDZ
         mPebiGWs/fdicfJjq559PiBvJHdJX9ct/DPaec3Gxu2w7to1cqwxWYH+e1IFdFFdHB/d
         9S586NQTlRRuI2jLeB1XUYyuMNTu/teA9uMGapRHSb645qveu8aIzGVqpA9CIK1w+qRM
         TJVcFx2iAoBVjaRVs0K5SDIJKdhVH/sy4NBU6FHvqI9lhjF9mGZ+ydDgTgEJHTihMLY3
         8aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721055; x=1773325855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
        b=P+Qzi8qN5iIy/tuLCI/rPlB/V6bPbHgLT6/sjXJiKPyNCiBuaKBJB7Lroa090jIhvL
         TudyLIDQK1+EpGTAbJAxSly4yKZqyYGz8BPvmi6m5ct1li+VJ4y6tmiYX/Mwp1ry3+fU
         xxmn1+CVi0Ko8NPEaRCKCMuCAsSudw5y118r9D20SV0cMWB49yn0skE2gBdO49kS6jGY
         kUBV96Jr81FOsO/I/WoVNKXTakUhTXnzxI36vZKv3bSmO0/idJ5kEQvOLA9WnQdw+Cve
         EzDYRxaDTaLdRQXkCaa+9LW+IpxFTHUj7pCOAAtE/8zCStdKOBfvk+79TWhCDfMpAu58
         kxWQ==
X-Gm-Message-State: AOJu0Yzh9o9tWLqN66LINF1ZAcrBJdx3DtWGsvWW03+i3OmOsPlhQK6h
	UKKYUnRzQVF+/zSmHfy4U/B1HnWTfnrJBALQOgGubmewj2WvuB6mg5MbO7+7h1dNRi0ld3U9RHJ
	N4zyYVD+riPPrTE4mh1K/yAlWVZ/1v0OFzkN6HmLdU5hCSEX08vQY7UhPsLgINS5XS3yv
X-Gm-Gg: ATEYQzwQlZqhKgj9mOvWmsk/Q4o5nQm7LSWaEWlaQxHzP0XmCloEkJF7lwDDVd/RgT8
	GHcWdUJDoJUWrA3evKRlLOrqPXbvascHkHsWnEDAAYt5+3k5in24YItJw/ySEcnurhTvKo+a/oY
	MDGEr8LA4QfnXCEuclAIjztOOB4vkKwpyGxJg6KPLEPVKc7TqXXhbjJ77ZGa8jn1bv4ee9EAu5r
	B7Fe61dfkHRdjRpypeai1fSn/Mqo6MUhQIqla+piA28f5cYyWaf5Pa/Bqlx3LlZwnxz46nj2kMn
	JsvKAUtQdqG7JLVEGGwYNhmiw4S/GmZeupgtyPYvRo5ziAEDsehMt3GMq9cXCvdwHb6BxcsatTw
	GSB1vMgZhUeFX5ZTBl3bMZxWGFE1rVY71OMlguGiiGyTSHWMFuYMRf5gDnmFSCumCnF18jZ29t6
	BZl3FHDG7XVC68CwVFw98WAvCROYzglPO1RS4=
X-Received: by 2002:a05:620a:25cc:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cd63409339mr278189085a.8.1772721054530;
        Thu, 05 Mar 2026 06:30:54 -0800 (PST)
X-Received: by 2002:a05:620a:25cc:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cd63409339mr278166185a.8.1772721052543;
        Thu, 05 Mar 2026 06:30:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:30:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:43 +0200
Subject: [PATCH v4 1/9] drm/msm/dp: fix HPD state status bit shift value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-1-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hzwfWK5+EPLPBOMgkg/4Azem10iuzkilPWoxif3rO60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYlpTbWo3CEyOsGYWNlPaqDWWExo3CkIsuF
 0D84zyAIS2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1Ua2CACOHrZcU20ETV8sAZ3SKCn35AIhtfhY1woMLphDSsS4bQFmltLTHXaKWBu/2yA4gRW29gJ
 3NNse0O4xCty8GG6VNZvNHkgE4FahLW/ENcwEii/TSDuZCQTTcKmX0BMYgrAXJi19hpNwP7t0m3
 TpZEhkFKgrF/yPtD42PqXsjgbymMmqp0OtC5JTpWAuVRzikl+fA+rO3rppSVU9bXf1YfO2ROqgm
 dQI4tedzx/EA9X+PsFVa1rtwc4Cq1jj19gJ+QLdO3f2tMOrAckzTVjAZecec/U4zVSysay0Olmi
 vTwCPjAyEksRF04Oqvr1K95P/kqXQmUbYlfkwYMX65TzZxco
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX78F5He8Qk7AM
 FLpnkzgr6+nli97oi/16uSCTvT4e6V+ARKXsNM/2TliJCeYI7fqdUdxMoZlBGcJSf6zvVAh9qac
 x9qmFrJCyJzTG0woWAk/XcoIGV/Acg5NtAJO9MYN9ecZh32bur1IodT0vJuf1aO9Igb1GmhbBLl
 298/UriSmFSTLN+Aou8g93HWbZXgThWnLh7SdHmapXU4+6LXpCpK3hVHVt7nIIM1EZOQOvM1UKa
 luNzkGhGS16YkbdK9/ZZ1obAzaaKij4taTGeVG481EJBn02L7SRQ4pkkJUs0+Lf393PzA0hYRjL
 v20sRaNjlPq2sx7x9ncJSHMBYtRazry0RiLFo7mGQ/5+ix2LrEfUhnjImcaP/Zx2zHeRzuN3HzB
 XbhGkpDBEI/uq6/ViUXIwAObDBlM58t+f5H80OAmWd1xAMsEiZOeLN/kWjULPtVIE/SjIW3+8pQ
 7ClbmuNIsTyy8GR0kQw==
X-Proofpoint-GUID: ai4QJ-V9CGISTXu2Sk1XYfLk9qccU5HK
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a9939f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=IBRk8GtBIsankUNt0b0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ai4QJ-V9CGISTXu2Sk1XYfLk9qccU5HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: 4AADE213B70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95651-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The HPD state status is the 3 most significant bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..3689642b7fc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -68,8 +68,8 @@
 #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
-#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.47.3


