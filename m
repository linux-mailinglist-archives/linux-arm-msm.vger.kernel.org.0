Return-Path: <linux-arm-msm+bounces-109496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH0SCoTUEmqz4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:35:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2445C1F58
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B089A30293EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C98C28C035;
	Sun, 24 May 2026 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBi4Y3T/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdMIwsuc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C053002DD
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618827; cv=none; b=AJMJBCrjACUDOWdSB1TxAGBDdGOafAEhqz5++MOcVj+29NTUF9oSxgkkduvDPFWE8c9TLVgCduaXfigQy3LPapfvnENc87A619B8z1FbQsdOY5JgnHPY3yl0RpxBGkJliKpIHkM6efn5JdSGyB+uVORKBgmx4zJu4gigoP2mg3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618827; c=relaxed/simple;
	bh=VlJ+1/FBc9duVlUYHWO2wc4pbzUsDLnVU4RINA0C4eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLaOwzfl++bjVlYWHKZjP3wZ3+XGIchkwMZE1qos6oi7ES8vGVpxyGY88LfkNxs66tX0L1ggk/CS5zzzh8p11tzqmBPOpFu4MXJ5hzk3Jd4PDyOuxFpM4bOtfhdM2ut9obK96r2XpJJ/I/rNL5XA/Ac0n7jSR8Q10i3S8t3QyWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBi4Y3T/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdMIwsuc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O1SKxp2018533
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWB2ji/NIriYCqvzWJu07blT4Tg15A2umoRQFrcHfrg=; b=CBi4Y3T/NLLQTavM
	fTGD0lZf9binU8TuKK1jQOH049BfyDqPnYsasX08KQlZQrk8GSLYgfd6KDU1SAwi
	DQ6c/wnYkl9RZcYBw5IWt0iAU/d8DvovB2BkLJbsYFVM5yimdwaV6a+PdIO7S4Ay
	0N5zu5nG6/xnND72zcjeGJfQ2CO0qN7P1eaKhG9CLGe6TmgyTr0nT0t87kSdyjpj
	jNdvt8zl88becJJHV4st77qyPmbBtPzwU8qdEHR759vxRzrUsFO90WAb6WXhjm+R
	GtVBwYhFNwCgrWlmkcnQl4365/OVLVS9mqLstnQTaSB21bfrXhQbWKA+x0rhKNFH
	FuBLgQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386k3wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so12717761241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618824; x=1780223624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWB2ji/NIriYCqvzWJu07blT4Tg15A2umoRQFrcHfrg=;
        b=SdMIwsucK6h4QUq5SNm5X8ycb4/ta/e8l5xIGYlKYfXV0YgKtSorUcZOhohnZbVjxJ
         cCJosnPEd5L51HG8aqKGrY9NHHnpPdlyCEeD/ISvO1izKw+ANwyDKCiTgVMPFKAVXyxU
         j9qoq5jxaYkO1amISxXvPN0pgXtcRQOynPyPu35/i/prk7tkWVhHjLYwhC6hZBOUX47a
         bxsLlX8jHOBth2KtFGWECjemPQ3sveXV4w6g2GCWAadGEG2obxr59Gr61Ewikl3FOW2D
         vob8VQJHETB+UnXoqw6TRGBikRcL7xM0pdH5rCiyT/RQu/adiAzvC9jm7rEzXJwNrg7F
         EiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618824; x=1780223624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jWB2ji/NIriYCqvzWJu07blT4Tg15A2umoRQFrcHfrg=;
        b=rpfHjMBxftIJPa1E3ujAtPUHyt11Vy2yNiXb2DIYk3L0mAaJEaPqqtZgC90xEPZucV
         fuFIjizm51kRR50MDMlDChrzCZYRUDRBqW0fZfT/qAx+A7D2q8k7sVKRMHDMTB/CclOf
         Iks4oMrPJRTwyOdPzRuFD7qtBnKCkdpe+SMbTTUOBQAxHM1F1NbMBRIRwnIkTA28MeS+
         M+7hYqVJih37aKAsxNlxBEBeP5b/MpUj9F18AAs4ko13xZqgPIgITf2dVqcqMtYQAYJv
         sjstPwtukR1AZTTDdLx4CWrmSmzNAUD11i5mgHBhRhRMJAtGiithbooNmfUTqcUs1mZx
         MukA==
X-Gm-Message-State: AOJu0YxTSiDGOSGzxVZzQfmtZg+dL6xJT73ROaQ8NPe1YQeBvNUG83pf
	Zk+9dqGtqS8u+fcbWWC7QfILzpI9fJgNPsFOcXRDQA5D1XELyPpa/N5iuPiOUDa2/xYmHyqg42N
	i4yGXVvk1P+L2IRbObfEfwlXL6uHCf36AJq9NCObzMFZA1QI2LSUfd/fVEQJVnFxT/1UZ
X-Gm-Gg: Acq92OGPfOcpcW6xBupt/GaRLuDcCiYOCNfVJhusfMghjPFshM77aZWegg5Cd5FYTmT
	cO8B9ZrLDwMogL+V0B/2AEK7WzzkMospCAYB3LF4f1oPn8ZYw23JFAzmHcESU9cNpTHwSr1NAhT
	erzleamvkUOhsH9f+Bm44/BrfDDP4g9cyFZy1GFKmbrUTFLy/lt8LFw98ZgDTRTqI8K1ElfABpy
	xa0Z1DO1b+zIVx3IJtwYCdplWcgXuTaKA3U0FSAaplHMtSiJOJZpA8pnDwQ0PFwzPVwOlsJYmXR
	+lcnLDvoIbMuQvYV3SJ0YjpEOVVmG8NcdMnUwxqcq3NuqRR+xrLL+MnI1DwNer5StcJhLFjs6Sv
	6Eld5BYAwUbjA1ewBFYh9CEk9FaAkGzxzobNXE0Sr2WUz1Zax0/ysT/jhG+bte+0JJDUyHkTiXn
	k4xcErPx5N9Ck/oecxNW5wFE7AJKw0PewYe3s=
X-Received: by 2002:a05:6102:17c2:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-673ce1a740dmr599304137.18.1779618824191;
        Sun, 24 May 2026 03:33:44 -0700 (PDT)
X-Received: by 2002:a05:6102:17c2:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-673ce1a740dmr599285137.18.1779618823652;
        Sun, 24 May 2026 03:33:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 24 May 2026 13:33:31 +0300
Subject: [PATCH v6 03/10] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-hpd-refactor-v6-3-cf3ab488dd7b@oss.qualcomm.com>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4687;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LfFUlOISMVD+0rSYX6TFT5QzTXuP4QCzs8WLa+Upwss=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP8b1jf8vWsVak8pEAzirBQ6nFhtNhTuagcJ
 2cmHoxsOKWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/AAKCRCLPIo+Aiko
 1TUrCACeoH68ha64/v9DyUk/onMpYPA0TMR46wrUUHV0iskEalybwo/KUI4o8EEmULyjEx4Arwg
 AUIFJ3s9eTW2BCsaIy25dhLt0H4iGLqiVLZGLEuvPqVG+vxgZu1/EOt/xF/cpN5D1xEBV5ca18K
 MePZgpqOEqJ6xN+TRzzbam6U23BqvFfTM/KHytunDZRQ1mCHIhxl8Ev2y4ZmcY9h2zpXjLlyPe4
 W53JiCw6/Ukwr/uB8Mvu0hDKjOACbqmj5pREIy69UdNqhwNzdUJIgsSSV+42zrwv4+Fs89/2Kj0
 a/5YqNwiwJJZ4TJ5sydzkaiVl1kRtbXKCXa3UbxvJddTyiZU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Tyx1qJglrAk0M-c358SM7yQra1FhKwR_
X-Proofpoint-GUID: Tyx1qJglrAk0M-c358SM7yQra1FhKwR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfX19WCs22XLit9
 rQKGt/Af1DTut7geOBb5I5bCFxQAH2ME4P9Dw4CL3fiIHJkBVFeyejx44/xKdagUUeBXKnMNDGy
 ELAuynPwBIaECjZvr3LA8j3/6C0FsoQ6lxKKNAt4HA9Z9xjS+mYdwmDACTe6nUqI5kbLz++YR9k
 oxFX9ta9LOj3agaaMGQ8wY9uqxUcb8zbO4JA2/dUBix0TIWm6k/mDAMFaJFLrhDbELwMnLsPuV+
 H0dPkQ3zxxDCvXJUPv8ikBSwE4rCbRoGHm4IudY3k/dLTf8Sg1ndpLAe7TzSFCt1/SSSopJqD9R
 UYPSC0EoerYPB9BzqrRAESbIVSOsiJEwyTcj++jR9GnzhCS9NVRFmDdZ8h1ZAy//hkgVPHRU0fC
 YaPOxVt6OkZObg1GQi/na8DQMV57BZP9gFEpnGExzA5tOSx06b6BJNfiAUhUiSkVCtyN4OvuYoJ
 3YTTnqjy7wp3oZwoAsA==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a12d408 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jcEwYMPARZwhhGfK5pwA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109496-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D2445C1F58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Instead of relying on the link_ready flag to specify if DP is connected,
read the DPCD bits and get the sink count to accurately detect if DP is
connected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 63 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 20 ------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 3 files changed, 65 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1dd168acbbc3..97c4752005c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1152,6 +1152,69 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
 	return 0;
 }
 
+/**
+ * msm_dp_bridge_detect - callback to determine if connector is connected
+ *
+ * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
+ *
+ * Returns: where there is a display connected to the DPTX (returning
+ * disconnected for branch devices without DP Sinks being connected).
+ */
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	int status = connector_status_disconnected;
+	struct msm_dp_display_private *priv;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
+	int ret;
+
+	dp = to_dp_bridge(bridge)->msm_dp_display;
+
+	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	if (!dp->link_ready)
+		return status;
+
+	msm_dp_aux_enable_xfers(priv->aux, true);
+
+	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
+	if (ret) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		return status;
+	}
+
+	ret = msm_dp_aux_is_link_connected(priv->aux);
+	if (dp->internal_hpd && !ret)
+		goto end;
+
+	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
+	if (ret)
+		goto end;
+
+	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
+	if (ret)
+		goto end;
+
+	status = connector_status_connected;
+	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
+		int sink_count = drm_dp_read_sink_count(priv->aux);
+
+		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
+
+		if (sink_count <= 0)
+			status = connector_status_disconnected;
+	}
+
+end:
+	pm_runtime_put_sync(&dp->pdev->dev);
+	return status;
+}
+
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 349175457566..991a3ca1e6bd 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,26 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-/**
- * msm_dp_bridge_detect - callback to determine if connector is connected
- * @bridge: Pointer to drm bridge structure
- * @connector: Pointer to drm connector structure
- * Returns: Bridge's 'is connected' status
- */
-static enum drm_connector_status
-msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
-
-	return (dp->link_ready) ? connector_status_connected :
-					connector_status_disconnected;
-}
-
 static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 			    struct drm_bridge_state *bridge_state,
 			    struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index ec76448e71ae..041aa026ae2e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_commit *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.47.3


