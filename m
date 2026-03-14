Return-Path: <linux-arm-msm+bounces-97654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKtmNcS1tGm4sAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:11:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776E28B2C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37B5E30C1914
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCDA299927;
	Sat, 14 Mar 2026 01:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osqP+Xe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UslkXfmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430EA2C234E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450583; cv=none; b=rPvDBqhFCRuh4fcWwLGjhpLT1kFxacUY9WKEsmijJNzAVaeGd5KBnxyH6gQu7WLIM1Ej0+uYM1LFVLSraL8yS//xQt5b2zE30xxgeF4FF8xw0MAyM0Ttyr38zcOP7HQgaJXgNkZo2oIHbSZLnKGOyhHPyfrb3UE1bUxs++vtgD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450583; c=relaxed/simple;
	bh=JxtJ94lgIwpIjxw4xKgw7pX72pK9Km/T+eifeOoDyuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDYFjaRVRZInL/IdO9OcnIr5KhEm2l2rwaXqItsq+5hJSHgNn1K2hHvrEi2KqvT2avTu6eYR2zLQAe/x4Qa/ea1OwRFiPsEFWd+3I/QeXWoeYpnH/PemE4hNKz9EIWZxjk8JrAKPih0q9WgdYc0oOdB4d08syjYqM6fGMPjGpTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osqP+Xe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UslkXfmP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DG5tpr481675
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2O9Vp9tLne1oeKIvhX+ujqUzU0muXQjI6Vz4oFspS0A=; b=osqP+Xe2XRAjbM8n
	Thtz17APc0SdPv+xXHGm/ro0GDteP3Fo2Vl5n/pYOzkDyRMTtEa7USuQhaCTyEnq
	2SweVqB/vzEd/qqs4OyLq3s7Kg9wkcSbdqB4Rzt6qLf9ukWS9Z9q5VvegXFX4wJV
	tHxtpmHMhDqenEpgbGfpmLaNheEq5e/Q2lN3P7wbvehD+59Ejyl82P+NitV2ex0K
	bI0hdSE2x3ScwfPz/rXoqibIKZGqmmyImMoSSOuubunnBtX0vMfn4uK097//hYkb
	1wHCRvq5B7toV2tqv5fy3sD7yXR8K8vvo+DQZuVAddgx+vpG4BIkz6eVte6q17Zw
	tpwjEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7txgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd767c51efso348928985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450580; x=1774055380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2O9Vp9tLne1oeKIvhX+ujqUzU0muXQjI6Vz4oFspS0A=;
        b=UslkXfmPtNHrShxQQm4ZcGnv9Eosdn/f62Zmegp3jo6zCkebPP990tssgVPohbKyAe
         XTLJU6L9usbFEqfApZIQW9oZQMLEVvk7RW8dOULoDiwSFfeUtM1F4gRgbnsvCheRKEgi
         NMuC5txVlf4XP/TbzM87fIslLDmEd4N2lNbrSyIgqxu/NBTSSS/EMGwmMDAD9WKXDSjE
         K9UXqI3+4uCiQJ/pWmbhSnllBygr8sad1P7X/tU3iVgL+OQ03VwOtDhjkbxUSmqwt79r
         szhuLm55lSJfX/YZj/zO4zTtjS6JzQa6WtEPUW3w5eMjiz0HvtF9dfuMFxntcPZbkg/4
         rclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450580; x=1774055380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2O9Vp9tLne1oeKIvhX+ujqUzU0muXQjI6Vz4oFspS0A=;
        b=NczkLVm6OVceAq+G8VPJyGtc1JyF2DXDhun9GsBJSzR1CboMIRsJMfxcQPtnkCD4CY
         DKoOtBny5HYmdsCjK6kKEXrG62zwEImXY5cbiGD7vJxdKt1WXA47g4Df/lPCPjbZirww
         pYvMQF3jhuuwPok+HaszKyeyHyCe97tX26z9juoap1JUCF3q1Ff369RTSAHyZQYW/iRI
         ut6Vd3dc2Hnr5Y2GRFfWCZO3DyvCH8Y3dENEf8R88hrs8h0Pl/YAc74bZjy9FELn8iS3
         qLv6JCvXVsDjMKdb7lqb8aIlKtvB7Ktwk9yT+KJUphToEeeawtVwMqXI7jDK/xwb38P2
         kiIg==
X-Gm-Message-State: AOJu0YwTmHZoYtr+P4y3dML6V1S88TBB17wyDkpUdSSsHrlJDpE/7pze
	AFqEsoNNiF6k0kXjQqzThUCaYL5KBtEhxkavPkTjRAQSY4IxWooAVtX1QrJasLVBXHWy1+mZqMy
	qVfF9h3dz7Uam44L9b8rXKLj22XiH1cfBnBS3Y3OFZndDC/rAKjiAMUkveqOFyOblCnnOPv+1yj
	/L
X-Gm-Gg: ATEYQzzzOMr+cTiom0krD52YEAtmlgnmxgih4PAORcqcra4z4VqLU0S33gQyH5Q8BRC
	yDynojPkFSgf8V4Ck3g01YP4DFSCc8L8zaWrwImN2CddLyuUCL48xBroTFWGs6cM+G1wf9dtg6w
	LqbAiCnPsN1//t8Yu8vkJSnKxS+fDVO3x9tjmD2bhQeYjG+k804eqifk9WqufLZklfxIloK1QOF
	o26uSbW82KVoaYjjhBpZrtiodoq8crE5DAzVyG9CzHSC0iphww9vVsPDwKZxA8+XH9fcgILtLSt
	XurI6gmYNVxe9aHY0dwxGpNAUuQK+45F4Ta3E9YgjzwQKF1ku25InOV76Iv4i6qFcVGdLEEfMzF
	G7HNa+bJ2RSdLE2WFkLp7OkC7mG4XgULcw7BY5f8YvZ1YSXLyzRSqPqAQtLr8ezAgxGjBuM5Bya
	ot0T1kr3cS2UNGLwrJ7+D2mQzURHvmPX3FOlI=
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr716441685a.41.1773450580315;
        Fri, 13 Mar 2026 18:09:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr716439585a.41.1773450579768;
        Fri, 13 Mar 2026 18:09:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:12 +0200
Subject: [PATCH v5 08/10] drm/msm/dp: Add sink_count to debug logs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-8-0c8450737d64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uIWeA/ok0gWyJD8sfFcM8MT443ZdrZtcJRL3n//W9TI=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGm0tTSh6w8lGRerJ/v8G09Zdpb2EhrbiZfwUUFII0M7doIz5
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJptLU0AAoJEIs8ij4CKSjVFZMIALIx
 Wa8lM8Exb5QxLX7rdXHrHj9HIzuJmN45QgiEaO3JoNAnv9wNdFZ0s6cWV0TOOB0BVPbNtWexB6f
 gNd4DJJYbjF7ptAQuKF9zwyGhxVq66PhJyvdflMNzyu0vMJzaXM8DCF/NfTBhAtvow8oKp9Lxwo
 hQEXYSsd4knhqSo5GxkB7PJDEjVBLKitM0DY4nMG27+u+NuG/e6yCETOSLZc1WMct/d/NbvCdv6
 2EETqNn+LtVuCdyCMdH69EyXS4xnMQQWrctI6vl+kJxDWdZPhTIhoJz2MqRAJeEpYC4M79dSN5v
 U+QHwBF1y2ZUhQuhnro8XC3JLRGcq5pUvbZkfqU=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1elyyc6hO3tNpeDcfm-OGDSGhRZaFgrI
X-Proofpoint-GUID: 1elyyc6hO3tNpeDcfm-OGDSGhRZaFgrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX+stH9CCopc4q
 2MOBb5y7EOC0Uj1jjH1lM0GmJo4qXorDzUPm8AV0g9RovyiZHgeNrYshd+E3w1E+um5Hh/bTHHA
 hyuyF1kEMJXcVCHlQozyk/pOaNvvN59dxhYGfCsv+PiR4kdj1i/vcyTHcBFfzwaCebT8rPZ41DJ
 aYeVFEgdipjHgnFhVyDzb25yxGKvYno4rKKsYLkd8lN5o5I/BhXjUbHWZnAVH9GVecgwGdCO62S
 BxErvDD1CuwpdOFpKr49dvpUtGKRgSSzY59UD/LjLU3cLMMp2uRlZ8TqGH5uB5BcHzQNozyb0EG
 NVJeH9Fxu5fo/aO74hfnEMTA8XW+0pdsa9oLfYVdzaeq0hgZMyTLfNA33H5ESoFTbHalRmYiyb2
 hYPSPTBpZXiheUHKK6QtvJMGczzmYIH25iMgexuGGL2UcMWF12696jia3P+mYHwep3AZROKldaJ
 YSHk6p41xCxsdI15Ujw==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b4b555 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=D6o9UKO1UCu5gje6phcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97654-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 9776E28B2C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jesszhan0024@gmail.com>

Add sink count to the debug logs for [un]plug and HPD IRQ handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
[DB: dropped link_ready handling]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d61a8ddd30a8..b4deeea0ec59 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -388,8 +388,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	if (dp->msm_dp_display.link_ready)
 		return 0;
@@ -411,8 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -440,8 +442,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	if (!dp->msm_dp_display.link_ready)
 		return 0;
@@ -465,8 +468,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -479,8 +483,9 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	int rc = 0;
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
@@ -493,8 +498,9 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 			rc = msm_dp_display_handle_irq_hpd(dp);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	return rc;
 }

-- 
2.47.3


