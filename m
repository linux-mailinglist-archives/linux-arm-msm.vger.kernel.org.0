Return-Path: <linux-arm-msm+bounces-95656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBiaCmyVqWnYAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:38:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B97722139B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C02463067960
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2853A9631;
	Thu,  5 Mar 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzyRhKtx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8GR8Y7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A093A9627
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721066; cv=none; b=D63jPu6YYP51sWa0vrjfWxxfmx8EMhTraTy4LrzPCC92U3+jN4Mpmxsy6aa0v7q4sPU4ZDSQqBNObt7Op9dfoKxk5vwn1epnHUE3i0vifLoTEa9g860EDOfy/MqDNj7eI+Hvdb2wmbE88mN9w1/LtpSHqWMUGPbHLq8wxvIr5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721066; c=relaxed/simple;
	bh=ryQ1Y0pu5UrSRA9AsDSGLsnSZCc23j7mQ1uFMjUERW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQMKICL/5csn+AxaHuWHkr7L5NIRKBLXnJnjV0JATRcLqUf4X709ZacdaCJIzH1AQWYDizGZ2HJ8086hI0LVvOGV8UrRADwK+DRC1siK3IScRknnqIV3/j2Dd+XlrbWkEGvTKkK3tZ2Bd2f+3WQSPi6V+wjjQVaOq+Sfm86LRXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzyRhKtx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8GR8Y7v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFpsi861653
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hA0YMMrWeRTI3WTeWLsPvkfJar0/KW3bNGEZxQ3XIL4=; b=LzyRhKtxGE1kumbe
	53/WcnHYKeqZlXoy0NckKVM5OTwtZInDZk0tQA0vxUnFbZVuVCF2GDizxm6WH+au
	rQrgphU5NlGPrHxCFFNvR1ho0F01IweDwrGobvmld7SGjmNqyz2GUgnW8uLkxhhi
	kP7hcCfw7B10P5uuLZyOdPuLmz8CP2SZ0jDX2iXuyyW75NJiPofUdcCiGUu2u1qv
	pcZRoMHafQ3GRJhP4x25dsinTnVARzDNIccUf1HxG49z4hMbKcKu3x31/HrpUX5p
	mkfDhGk3HNWXBk7MBQckhBEP1kDZeVHS/lJzHVcfPX70hQ16cgPKGa0XdMaBj9J9
	PXfOWQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wbkma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:31:04 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679dcff168dso67074517eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721064; x=1773325864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hA0YMMrWeRTI3WTeWLsPvkfJar0/KW3bNGEZxQ3XIL4=;
        b=Q8GR8Y7vKQlHWHww4VH1S37VkNynFVL65JDxoY+KCvfcBY3zsG5DT6g2Gor8DSNs4d
         4cshwrUy2jKnk+mayCpnGdKpYpqOKuEcyHeexM8qsIOT+RjKzRPt52cuw/FGJ0MHXp3B
         1SeIvLIea8SkorRzkquHrHAD+LVelAmFhVTm9qSP0edsLUjA+rZAAF8ExYVLm2SVjnXJ
         h/XAmhMOtTKVDhHW3gAg3A5O+O4+QhhWpAqXftCol17lvKoSvyzmHRAe5ttn+SwgCZQR
         niuelartjQxNh8pdzXqCRKvzBpXarXx6r2AMthDFFuPDjFWymUb2RJ8LcytbjRAaq92J
         i3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721064; x=1773325864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hA0YMMrWeRTI3WTeWLsPvkfJar0/KW3bNGEZxQ3XIL4=;
        b=xLnivS0KLvZ157wS6OY0AXnu2DsIFyTh4WiHPFHTEME4sUv86bjFTcXJMLZfXIfVgi
         Bp5jbx/hyWrYl2lGnuDzDTqPXdDzUubQdGD3o3WQ+LS1ydAgsWrZQ/2ZiqDH+siSDjWl
         k6uZvSRsaBDWm2Tg9A8W5B6pxvjv9npJnUGSE5q3XOUYLNSLmGffUVvBRpIm0SU50Fj9
         6q7l09qx4NeWPDRFBoacZ0PT2CB7ayFKs7RA/nbZ9ypAEBMmJc7LDUHM5KYa26sHiMz5
         8SQmX1zUdGJqxo3UOV0hktLIbKKa2RcHy6nioAWevcA5vUMJEgG0NQm1P4UE+1kiP4sB
         rczA==
X-Gm-Message-State: AOJu0YxLhtuhvyWHbNcZvsKGgTOquaEpTF2ZKpBOaV4bMqsH7+6XKy0i
	5Lz5VdCfdWxwLSOoEPLN29Q4iFWQfU+pZpBhJRuGrY/12bqcjLWkWnJ/fGYxeZbad5aWd0cpjmY
	3U9Ld/UQ1chZd02bC5Qr2B5dTkeL4Bl332uRiknHzJKsg2lp+0hcZ3pebhAz/i5UXS7xU
X-Gm-Gg: ATEYQzwXxEtLyN6FEDLtXNTftBGMwJWPcXLpWFFJuJS/qA/BB4a2Nx5hE8xQWwC/V+E
	4kgwLz6N9bWL7m6hYIWjHvZdrDoklDwA5O4JP7sftiQTdfm1sueVNVn+qMjs5acR5heZHCC/HpB
	Q7zu292B+bDJU9/L0p/M0hF5xZUyTmzUi3Qc0IZcQuREpNMqWp+lbNhgivMLlscNLWiVsflch+S
	Jx0ZhSEF/UxXKNNGniHPTHwXEWoWP18uNeZ9DnN4bryANfwHGARb3RXIe92Mb33foAMFR8emGVo
	RZ7WGtBo9HOJPYfkDD6OBIA1fgGNSK9J4H0w2EXj7RVJW7QfUnRhpG3dw07Sp/Tm1TTCu+Lisa3
	a+wJ/qoy8cM3ZyqqC/QcmXjHqyMU+Hwfs6NOqWzb/haPALddKrAdR6Zw66mY2aY1cy67zs2x87t
	uAAn7ns0yJ27w6TfU7aOBIsLcpOjB1ZC6l6lc=
X-Received: by 2002:a05:6820:f00b:b0:67a:2e3:2236 with SMTP id 006d021491bc7-67b17700617mr3432245eaf.23.1772721063861;
        Thu, 05 Mar 2026 06:31:03 -0800 (PST)
X-Received: by 2002:a05:6820:f00b:b0:67a:2e3:2236 with SMTP id 006d021491bc7-67b17700617mr3432231eaf.23.1772721063474;
        Thu, 05 Mar 2026 06:31:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:31:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:50 +0200
Subject: [PATCH v4 8/9] drm/msm/dp: Add sink_count to debug logs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-8-39c9d1fef321@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fiq6vHHLOBAD6Z/SIX1bFh0DDbKNiDPpLSiB5DaPkUs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOZbZlxeWdGne2srEmPPStsGpSKCc0T2LuT7
 bUf8mTP6dmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmQAKCRCLPIo+Aiko
 1VLkCACEcsY6owVA3haEIzVFQ6Jyh1RAU/1aWnOWCnzrqIFQxJUnCx1iPVXPwc2vYuq1X6du9uG
 Vff+VdXFteq7wmA4j4M2hOdGVdZ7P5MpTpDQPYwbScDEDpdbxJhwJ0/4b0ykSpW4FTui8bzmLJH
 QtjwtnuQMLNL8KDgNomhcOBMl8JKmOrITHk1XxWzXodRjQ5qt8ivsz35+MP6Nw9L28oNB3bVfce
 3lClwyL8TNNMtQAac2oJ6L8uuag3vUB2ee74ZUDzUcP+JwvGfBIR3LX/qvpngOQhLU1zbK2Mu0N
 /LO5FbkYOLPIJfJbw1FoIXrZmK7GfGq74rKwvwQwqZca1mRF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: TaePNj-XEpMNhIxc7z_5lJAdkhDNSSOn
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a993a8 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=D6o9UKO1UCu5gje6phcA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX7GJesVZkaipu
 0wO6/QjM4xEQkLrqUWyEnwXsDrccKgV+fnxkG6UzoPHjxhpvut9B8dFvZE9LTURGCxgXMPANri8
 HfUNgRMm71LY5rESw1lecVPVK16BlPGGRVoJSDmZoWq0d0NlNcQnvuglD+QSKhTEcI6qRw2rRVo
 v+RG8t6Q+rm8zz/KFsb+EFfe2BFjH8U3UXUoFACFPssul40g0fwL85Z2LA8uVmhqpj+IL8XKPHG
 sg+1zEL1lYmbWPlU50YeeFiNErBslAfLzld9PlZrKKbKaEOAMv5ptAqP8MI8iAL/B8p60p2duvt
 Ox3zcBtW8vJd60nD2YYZEDvjG8C8z9WXtSNik/2/tTWVw65zi7MfHogHYTJMSQwhMDE78/ig14q
 KaG3z2BFLIAONB/GAciObEXlSuYTqRsZ8frPOKu/WOUe+i8sis+urpzTjGsRW101uqceuYjSGSh
 v9U3WA6d7k2YJv+WLkw==
X-Proofpoint-ORIG-GUID: TaePNj-XEpMNhIxc7z_5lJAdkhDNSSOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: B97722139B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95656-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

Add sink count to the debug logs for [un]plug and HPD IRQ handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
[DB: dropped link_ready handling]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e3b43d73b67a..a1fb9c62bb0e 100644
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


