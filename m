Return-Path: <linux-arm-msm+bounces-97650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YINTN3S1tGm4sAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:10:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5943C28B282
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 882F730880FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056D3272E7C;
	Sat, 14 Mar 2026 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLKoeO8f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoIRop24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F12727E2
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450568; cv=none; b=hBLy3AmrymcGNwluMpfUQClBqhUbGuQDRpa9gql5v2Iz40EMQqa6cvWmh6m01ofm6Vgh92202410L2zEY7RJE5jujkG/mrhP50A3KSv6JHmvpy7r//nSthi+VfCCyH92ePI8rholOA3iVN2NTTn0BnT2h7UNZ9NghbB0PYofb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450568; c=relaxed/simple;
	bh=okgHbNzqiXYxc/6yXGiXxswgZJigmkKqeXcAutwbh2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDO/un+fitfRWluX3rjPJP6OVb5dHXC59ZyluS4KGVP1r9vS8+GFeTUYySzutBy99LRumFWjc9cKf52nHZHcO0zj7UO5c1xzbWqlxsGvF6+/gzZDLDevs2kOM1YuJ2DxMKP+Jx4EleWmKF+ykGz0hhjI2koDxW8SugZKGNmt1m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLKoeO8f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoIRop24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DJ8DZI529547
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqAtWAY9FAqIvdzkP+oLI4lRLzY7loPC33zOvhTcaJU=; b=SLKoeO8f4dgOy7mS
	MoRr53rOuDkxR68sbQug8F1nNRaBWSUd6mIqQKNdotob1iuY/7ff5uaT/AzkQwe2
	dT3Rj6p5zJ3B2v00PjCto4DYiL6Q+DQZBe90nnwPWAbyZP2x9TF4ThkHW38/Hd1g
	IlUNs/ghBR3w2mk986widj0baNj1gH8Pi6/YSvjZXgEHjTAwx4p46Hr2BumgLVx5
	cyx7pWhrfnh9sUEur4SMUIw95iVbosHqZ3yRd07Q+4+CKa3KgJqNGDjCco+hpmXj
	EbXINVfrOuBBynmGt8d1DXvXbG1XHeFELKzdOJcM1dyPVhlmBR9u+cgMWvinNr9L
	zZJDfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84th81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso2731774485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450566; x=1774055366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqAtWAY9FAqIvdzkP+oLI4lRLzY7loPC33zOvhTcaJU=;
        b=AoIRop24O78vVLOLB+Nfe/K8WlkN4uVDKNtvCOnshIOnYOg53Lb77c8tRozRO09H82
         MnxmUVU1tRvsu0+3nL6o5Mx3tipiiRQZJ6xciDXfJ2BN9mSzKtlHJkxOEak30Xa9rYyD
         6feEjD/NdzkTp1wZ+w0w69Ma1vsv8ENUUoeGqM9stf/gZzcdWAbvGo5cus7JnqZxc9s9
         mKk1ldpWG3zTkjRuh3Bp9D5eX0PlVCX7x2it+aIwyIIQyaw9n+DYA32gS0Ltvi58AJhx
         2yBShKeq/v7tnr863PSgt4B4EMnx61lukkilKnV0DV+C/UpH7n29Knsqwipf1+xpb3hj
         oWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450566; x=1774055366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqAtWAY9FAqIvdzkP+oLI4lRLzY7loPC33zOvhTcaJU=;
        b=N5mxGAFF4OUKktYNXGN5htpQkmy/Nffk1AmoaHCDNwCWsHUNo3wBj9rqXdpX4fLl9g
         9Efk6r9jEtC4IDcXWr+wN55nIjo6gZNB4skAH12pMzdLMvyHUpt7dbAa6SSwoj7emVs0
         41Q3nRSJdk67KNYiMYr/LU8amH8FbLRJFtl+ZXdZvC8d1gdywHQeum/Ru812NLhVFic4
         7jyFfZtmA9puG0b6kl7CcU2xXmPeibZPEWTAFUzD1BHEYMaxRkgWOgxVfq49IZNdQvQU
         pozZudZUflnv3lfa+c0f+Uz3rr/aVy6vEA+sHWVa9KiI1mW+Zw3c4VauoOnGgRm+VULi
         Gifw==
X-Gm-Message-State: AOJu0Yz2oizA8Escha0UsSLRDlzpAUy8fXpSeKo81lQZoEsUqK/W1Vms
	1SvAeRb3e4RJt2Uk8x7aitqjete/SV8c+OWh6QojBIvTtnYrlPjYZpxh21lgvXUg2D2YPgITlXX
	8XxzKfAfjRAMk+Q4aX/MseArZR/A0SN30V/Amll2GTUPGBo0zH9hR3EK56TzAwrzlkiwy
X-Gm-Gg: ATEYQzze6jpGXDpzEC1a/WKpJr6Evm4PjGV3MU1kNvWEBCi+ENxdc9YxXemLkbHMWrb
	j4gguuYz+KYt1zq+fKHaD7eEVLgaxL7Nt+mecOALvKDzPcYbZ55BSzMuz6Zs111aFUlepaaZBg+
	WgE8Xw7pfWMF+OyWC8hRQV/5jnQrWU8ZkFJpvyaEBMhVlXrJ50Mq9D5q6p9uausjPDqWwfXRJKt
	gfHINcTRnMDceGnb4ASX/Rq6pIM96ewkrrzFAinA8/vSRhRt2qKwkJuHGC6glprPACQbPDh40DI
	qgbKP/nbmoQKurTt4NtVeTW3iRR4Ji1IB6AxzTEELmuR1RkXaW3ibR2GaLcaa78w/9pJFYcYWeX
	t2ilf3GysDMbBX30Qu7Qv5FFyOuXWNaG3R1Obj5ETsIQ0Wh/6IK4qNvVSTmVfrntfvErIJgVsJy
	tLgV8gLjBy2v/K8dJp138Fy6MHeYxoiQg1hNc=
X-Received: by 2002:a05:620a:4623:b0:8cd:8d50:169a with SMTP id af79cd13be357-8cdb5b8a3bfmr755062585a.54.1773450565936;
        Fri, 13 Mar 2026 18:09:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:8cd:8d50:169a with SMTP id af79cd13be357-8cdb5b8a3bfmr755060685a.54.1773450565543;
        Fri, 13 Mar 2026 18:09:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:08 +0200
Subject: [PATCH v5 04/10] drm/msm/dp: Move link training to atomic_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-4-0c8450737d64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JI7bZYAZgZZoG3QbCYkVN62ORKAZ93CC/pbTrYikaXc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLUzvSvRU0YMLXy9h7xpFPKQwsTjACPD3ArMl
 C4jgvcRQx2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1MwAKCRCLPIo+Aiko
 1Y4xB/9UaFY1JNob4h3aSk0mKkF9ebTmHHwh/OdSZS8sAQZv0mNBREBQpLU/Qe/X6aH9RJhGqo7
 xpVmr3AT8g3gVQO8sryfGijOJXexdwMrqYAnc4u4OWC2Y70ilj+eIMVhq9E3KHXf9G2owxZRwng
 WUSOUYGhi1QYeg/2wmS8CTSAW9nU9CDaovmwgM9nLEvaZJYF0I/9etpKLH+RjkGnBP7HTUkpG8i
 +N1qeLI7owHTltmhNxW/zrnFXFIWy6bKODuSN6KM29LLYMqhalSycosziNdcsjo1+dpafBi505u
 Dms6iPoG09CtOlgBQC4JqqlSVYSTTddTa9QT/9ZgqCbYSAai
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b4b546 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=IoBVowuyLm_M3JZO-XQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfXzSUYpx8sa267
 +sxABtdbidJ43dqByabSuno/73NXSF7fSTiOjeBB9loKu6Q5ButyhD0Xwtc073HeIC/uqErOMuO
 zrHdTXTSdObpRJ22r+4DIt868Cv76XV3zhMVOID6RrCTKL5/4C3fDK05FIG5KERoUwpAEoGeCGf
 hdKeevQILl0/pDy84rNXJQbntmpTwqfaZONf9jDiDSdpHz9AfXBpWk3ZnRAwygTMDvVywu9rsiR
 STZdNvOs3pcTYVjSrH1685q4UJd55STiExHqRup1P0VjJlrPruwLMef7Td+lSKjehHKvaFwG693
 AMwAMgu9+FaZV82nJ4fsHFF4VayUD8oOZw8QMOgfu0EO3WzVKBmmgL9rEzWfHF/pbs3kavK8MHC
 tEQKxlZv0UAVZLIiBABsEnj226ltqvcYd1bhOvMbePmo97QRyfDLETKbHR07btaYBwE3RJ7bxLx
 JY+ioOgz/fsxlzwjlIw==
X-Proofpoint-ORIG-GUID: OZMKAYoLoY3CRUTZa6S-X8ryb1X6xq6i
X-Proofpoint-GUID: OZMKAYoLoY3CRUTZa6S-X8ryb1X6xq6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
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
	TAGGED_FROM(0.00)[bounces-97650-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 5943C28B282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jesszhan0024@gmail.com>

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a05144de3b93..e7b1ed5491c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1695,6 +1690,11 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc)
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+	// TODO: schedule drm_connector_set_link_status_property()
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);

-- 
2.47.3


