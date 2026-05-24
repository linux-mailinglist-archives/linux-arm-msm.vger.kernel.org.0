Return-Path: <linux-arm-msm+bounces-109501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OUBGj/VEmqz4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:38:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E135F5C2038
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ED9E3040966
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA283911B8;
	Sun, 24 May 2026 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJePeVtl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSSQ/tid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3983911D5
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618837; cv=none; b=gho47ge6CkxmNZEdQkwgeMW0uaUOLVDmbPKCZe7tP8X2qAWyoava9/6032OMyNB/aNfrOX5qQiGTJYMSNn7nLC6jh695jear84gcyj05ZHiED5Bp9DhXqnC2LC8hnZfdfaEg3MrMQbSkuW4rvxhClEz5G+w9wmTeKFmAE1brnP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618837; c=relaxed/simple;
	bh=4llMbrlgApFIlR+Hc0In89bnvKzWU3FERCtTV4y9HD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k60wCha2jI3WZKOWSk3uPYSsa2H/vtZAcUybMtf1edDNMJyYtQr+M+CdRr4IOJ6GLQwZlFZ82Q2Rygti7hf6qPLkQhIOBQM9f8EJQ4lMppur3H4ThegHB8Ge4Lmoyr/3OwprDseH+D4klad6SozwCKWFex6uF2ftKZYGtNy4zKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJePeVtl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSSQ/tid; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O0dJa73341575
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDgNJal3WXOXjG3gtCnualVwCHXb/rJSUqjbf1sfrX8=; b=nJePeVtl5lp5EcK1
	+l9jZFE8OE8tU0lteK2FfwEiFX03jNKPf0XKH9jWxDZwpYPO+FkujRR0oeAPlpcq
	yLV2Fzsa2f44bhPUqv9sG2eqH5+a9QJFRqBqWgd3aXHTghgrUsXOzVuwq2XWHQ/8
	S/R5U96g4ogI/rHwYtdCNukOQReuoPHCxpcMTAQ7sq52B/fu6VDJxQaIU6Dq0ooA
	sBp/Qn9FkfTN1IHyiN7NwH7HLe8pvxkZAeFtMbshFmi+QObVV0tfmP7ZZ+i7syCY
	wl/TDqOeGcxdOUxmOs2Lzj878kVSRI7m5VHRCGm7RCdkoN7JGLVAZ4py1jJR8IOd
	SqtnMA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asty6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:53 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95ce07ddc14so12029786241.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618832; x=1780223632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDgNJal3WXOXjG3gtCnualVwCHXb/rJSUqjbf1sfrX8=;
        b=MSSQ/tidjcxLNlafoKKz1idF9s3AdrliwFc6mYdTIPfLAZBM+7s+bYgDn6E+yw5tfg
         Zyr1i2nHpHy4BDOkMSAibPvzMiPMCXofl4FqYArg8i0R2QUqvetHjEAVrEJq8s32rWST
         fgKIWqe5sbVw6aN25ADC5N1KTZ+P7b273uZFxehooRTa/NsMn8vM2ynstjXBhzw9zV1S
         +GvLC7TFmSZqejbCBteyUUosZ/LxlT+Va/+RqmyxvVk9KgYwGaLGJW84D2KksUyyIUlA
         rTcDh/SIulIYU0VF/uoWM1AKJuq1Mju5xGafB7cDA8rAqPdy/KKC/NsvoUbnuox29UI7
         5vJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618832; x=1780223632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDgNJal3WXOXjG3gtCnualVwCHXb/rJSUqjbf1sfrX8=;
        b=ohYNs6Tw2j+ExoefwPJwj+FbKD1FurnZzPnF6j40qEXhUwUKnLFDCY99iAyDJxTGib
         +btoyqdVFexjRMrfKC9Db5D9O8nfL+cGg+HVRUyuruclLh+NWJhtBz7mkN9LQI1ZaSPA
         m/A67B+eyZoavlkqq6h1GvszjJ8Tali4Hve1lGQzwPyC3Fs68VFCqKZmsqHAHiyRJZTv
         rhhDaipIWAi2zrLx1+5SKB066MzFyiP/kSsNwbY+lEVcnPTj0N1R+d5hMtw86c0LTOlh
         7UpnE4KgZl9N1ORSbRd0dYc0c+zeG0EB0vp/dUdFAwpqN0FuDBAZCTW/SKtAguDBt9Ih
         zOgw==
X-Gm-Message-State: AOJu0YxG7dyvPpQb2XCBHrLt4/8EOV+3g9jL9cd8Klx5ftEJ0hJMxqCt
	wZbUWc53u4zHGWKQMzD/3IANzrB+/ijGVAQ8kF9IR7cYKpBqDbEcwUuesEWvygYCBY0XqPIpgJB
	wHPfOJ3AJrEUnRJkMEv/D8/Opqwexc9wLRp95YxV7+DCle60ewMplRH8A1cI7fsQp+yF7
X-Gm-Gg: Acq92OGX8mNaasdG5rmfDPh/130uWshRUrEi6GRev9+8lxoM0pQXifpmXHU9cPg//CE
	c80CtRWV3P9AmmgFU7+TqYwt4YAhA2iVQ7ehDvrU9n+haKgzgncQ8ubmJ1Jeuvbhd+oaQhQcSnp
	roNDgVv2s7fnQrfL/vlyIGnh7BQ8blLt2wrumEIpw8qSbDrCnHFy/vMluOzht7/2PRRsApp6zOk
	r3T2C9U13jeoEn1OoJRUdhhU7syPlU1Sh7sJIxykJcfzLfhPdUbiDAD+ap0Yz0CifwHO+swikRy
	XcaBm/s2eaGbYqFTtNlr5KyUZdf/XW956wvqK4X34gV7BEIsLCdSuWQcoS3amx363lrbyeQUbPD
	9hHTwCZ6icUFjX0rvgtnT93FE1bNi3o4dlE4S9+WRUMu7bBMEDksFqRMQNFkhnBTkzCSi7IeD34
	K6VNXrcAVUwkOcA0v/lKXqCbTjhzZd/3ir/Ck=
X-Received: by 2002:a05:6102:2acf:b0:660:cba2:b6a5 with SMTP id ada2fe7eead31-67c7b9af5afmr5183809137.7.1779618832526;
        Sun, 24 May 2026 03:33:52 -0700 (PDT)
X-Received: by 2002:a05:6102:2acf:b0:660:cba2:b6a5 with SMTP id ada2fe7eead31-67c7b9af5afmr5183797137.7.1779618832144;
        Sun, 24 May 2026 03:33:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 24 May 2026 13:33:36 +0300
Subject: [PATCH v6 08/10] drm/msm/dp: Add sink_count to debug logs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-hpd-refactor-v6-8-cf3ab488dd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3448;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PPASzQobCBYdb9dmAmZWGNYYaeV5Anue8MN6gudi0n8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP9VIdNVQybDZfFejeH8aD/nykS731k0+PtY
 PPkI7hBIn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/QAKCRCLPIo+Aiko
 1W7LB/wJ0X1mFHNE5Aa8udZzN774lvkGCtFHmzn0/lqay1eqC807JcY8C5QC3erM1r/R6Rhft9G
 JZYBnGQ1IbI76o33dfqiVFzFuS1CyLO2+fAqSWruvyJP7nqK8PDIcEv4mkWAgTLIvTvxFBg2w5I
 9eAYT5JtObbTkZnyFNC0PeI7ikPaKWDwWs2UcXyA5RjEd4xrgyyORG1A66FyVKZRJcksTUrhHid
 UqaQsfq0df2kodpQzB5ddzhnTs4ToMT0EPE2znSx5Db9CON2laJggzolSm2db1ZCxsBtSdfWAdf
 ThL6aihfKYqwe5Mf1WbI1FyPz9GoPyipL4BaFifbqu7niN4A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfX03VZi5Eaei9k
 n5QkQLuZZ6ER2VbuHCHvSV10cSUKC7t6Whb2r8e1a5yuTqpHTCYGtd82+eoibG1NcuN2p1+MKgH
 I2TUGb7aNG0lqHAXjmQB+HKasM0L0rvpok21AQuuT2ploehKHP1sd59iBanPgYjZZvdJweGrIHL
 TOOL/189pwAQo7Q8o+SgyJFpO8upESeWtn7nyjkw4O4Q9oeC1MyzXiVnMlwZtk8GwiWtW7FgjX1
 c3+OEZ/DvuDN6NRU9VxT8iAgpvf2/S82HO5CtJMwR17yKWMq56Y1plm23+kkhsKHIRgw/c+m85X
 SxvQxBLo+1rnCSLVGDa0hv6g7PZ66JTukdDCjW5lQN8H6maenG3/idAm7hcwTvuTC6akgO+Jxy2
 aCUKt980FYqhoNJ50GUQbCvNyCYaZv+tIIkOlRHtPPhttEgdwZmz2GIx5mF8/Jycc0w7USTflU0
 XEBb4r4y7lRKcT0+y/g==
X-Proofpoint-ORIG-GUID: FNlSrHUIrCf_MRKoyjxSW_qrNy9Prvl_
X-Proofpoint-GUID: FNlSrHUIrCf_MRKoyjxSW_qrNy9Prvl_
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a12d411 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=D6o9UKO1UCu5gje6phcA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109501-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: E135F5C2038
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Add sink count to the debug logs for [un]plug and HPD IRQ handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
[DB: dropped link_ready handling]
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cdf8e618838a..fc41ac38556d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -389,8 +389,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	if (dp->msm_dp_display.link_ready)
 		return 0;
@@ -412,8 +413,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -441,8 +443,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	if (!dp->msm_dp_display.link_ready)
 		return 0;
@@ -466,8 +469,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -480,8 +484,9 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	int rc = 0;
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
@@ -494,8 +499,9 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
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


