Return-Path: <linux-arm-msm+bounces-95653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHgaGGeXqWlKAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:47:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1F213C86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1484A319B8EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9C83A7F6E;
	Thu,  5 Mar 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+e8FkeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CR65GnYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230D3A785E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721059; cv=none; b=iNwYFE1LurNAOIl/+kmoHyX1wYYYr45RiwnTLvN1EKEmKTr+D5c2egXNpXIquVpYlfA038p/SUiKCEJ7UBMCJ0PsiCDN2LOM86/Lx+2nUWuKMcrZEYLDRgpo/HDM/xkeZwTwhADVNBQ8FHGPC7c40XsZj8QlQ7P5wwt/33F18Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721059; c=relaxed/simple;
	bh=OWRdOQlqAgZDHEFjFECShBR1RF+bUr9ZLUwiZwlLTKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+ikUygQt7/JDX94JSzlYqAg9iFlRe91/uoC6ocAoF2nx23Idj2wP7stxXtthwM96OmdV3rS6eIGYOC89v7j7UNntfYYbwpw+Je/FBUPYOIYkHWjIK0IxhhgiR+kDLoiBj1x8hAEph0vvlK4vbavvoJRUN1VnfqfMWYycY4lDeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+e8FkeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CR65GnYd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AUKVZ169345
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=; b=d+e8FkeJ4Y7l/fHE
	a8Mz499o/9gD4jHBziO8z5hLSXSHsthC8/PC/ELdFX5cuZfnJ/WNaY4v3MzdDGJI
	E7AWF41HW6qRlXudanQoaeEstRdy0zjzoVKMXBfTtIkGh9LqnrmgxFnkq+KA+wPb
	P9QNZCd48K7TshI1Rnhbzfk4Fx0V0Fqk7r3HZPKqXopQjYnTwJy4mGYQLoEmvn1a
	aqgDV/Jke3VRfEQIp+0QOM3M+IlMaATctBjN+RYrJBIKLVS9FmWsQvM1ikGQUSTT
	M39A2MFUe+nEnOuZ1G6/GZsb15SebGQO6eB/Qt2pYCz8ln1d81euPD3ZkxPE0I+j
	Llsm5Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84w8p6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:30:57 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94de7380eeeso89067605241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721056; x=1773325856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
        b=CR65GnYdNZiEB1wmtQiS6OF8NXszO8YOa+p4hshpP7v+18F8ny4PMfH7TvaByJJP84
         o0u3U3HfWkzzbRkOORhsUXv9mnTbrkYlfaLyWAbWsqa2Pr89B0c51SQ1Sir4UptBLQ+a
         0YWKPqqjNnlDBTmonaDdeTYILkYsjHo2WFq6xEMVrl6qY0jO3NsIi0EA/leBx0Sc2Tep
         kxX1w9+r+IOpHXEDBrmyClBNnJ7vsTVmqGgM68518hGT7rlFBIZCkVbRUWI68KlLP2Ku
         omuNar5TpxISWuHeLmYxTNSd11K4RCcOvKLLPDlphiw+Bi0+9L3F86RfZv4sN92ABZg4
         v0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721056; x=1773325856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
        b=Z9+q4gmNKdKcu/ZUUH3Mi+4qFsX46GVAr91XvK84JGP6YPYtP6Jnj/vAh+wyab28j8
         oSeb008IkR5+rvheUcU1uRxy8GnrcepQ1olUxoWylfjVOsMAukGREc5dTltEfHlSQNKx
         ooO/8c0qmyXZjQuQ5YlSQJSJMTIurZmD8YJEtCZzE7kaIXjeDT/bP2PmWTWNw20TJvQT
         3Amsh7HolTkaG8KAf0bnHYAnyJnIa7qIO8szLli/bEqefiTidGyvYL5umOavDmsWZxhm
         26xfy82XB45cIUMYE7vidFMqT4kK6GVnE+EmKHPu8WndSJDHZP4sfyR+g0DiMIGCNk3U
         eBdw==
X-Gm-Message-State: AOJu0YwUhR9nflmCE3XCQO1o07Tg1WnQ70E1ET33A1I6UTSdSV7WQYYJ
	qv4OArrHXx4JzD+SOiuzETDIaNLMY0oVnRKi2DaAKzbrPSmNYRRDLwiavtSm+iiSSh3hJCNPEis
	vRaSf24xR1fQDHc6QcNKxp68FJRjiSRrf+6N28VhU2pVgLZ63ZmSMJIVY9VJ6IW+u5Uva
X-Gm-Gg: ATEYQzws1Ntk8W0JxehVkVnBx+FIWnLofzjDby0FFVL7ZzxMNZakSqUcoq+mmYBqbpb
	erBkJDJC5rnJIhN0viLfV+1z6ZGBLKZjQcJGtkZCVn494dBjMoqGj6HHrgj1/JrOUplzWMUnZlJ
	STeaRPji6YICsBKhPX9dnaq6nqfK7CoOz26FIzOBniuS9WGFDpuhwgvxtpTknV2ZBbyYwjssdNr
	h/TC9co+tRk98ijIMrw0pptbnYsCaVLG17h2Lc0pwyDb/J4v8+11Sgvg8ybTq5Ki5v1EDcfU60v
	miUQVu3MGJ9n97rzN17Yax4WZjljr0RO7XgWLjUozgQXv+k3IdhTAgG/Zp7pYpVyYlENRuSQVvf
	fh83GewcXxAmWyZESOwi1aPJ3IRg006qUPhe8qtIEi9n3hAFsH3w+FY/4teWy2ucTZPPtZcLPSD
	SAafnkagAkJWjxwyvmKk2XbvJmnUBrr29saYI=
X-Received: by 2002:a05:6102:a4a:b0:5ff:24b4:8992 with SMTP id ada2fe7eead31-5ffaac15453mr2837160137.4.1772721056326;
        Thu, 05 Mar 2026 06:30:56 -0800 (PST)
X-Received: by 2002:a05:6102:a4a:b0:5ff:24b4:8992 with SMTP id ada2fe7eead31-5ffaac15453mr2837098137.4.1772721055666;
        Thu, 05 Mar 2026 06:30:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:30:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:45 +0200
Subject: [PATCH v4 3/9] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-3-39c9d1fef321@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fflo70A3oSMP6LkHXNPuDEYg6XV8ot0GBkcmgzq2Sd4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOY4EH5tOhJuNNlBqaGXMfWD0qmfHcWOb8Md
 OAljlFsck2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1e3yB/9nmGw5lKskzi+7opE88tsBJ84JNH2uon89P31MsY0o31gm0avvv1hfvFUXX81kgUc/oSb
 6LcX61PL5oNi0P6+CAoFWXb0iil+kzezIZm+jg0L/P5sOtoM0rNbyJqBkfBpxsUCdL7Td4WKCOp
 bhbpOmRinO25ahqKRWhbTLSnEAZScQ9jtTXHjAQvllfkR3j7xuHei6aGxVDGfEd6hVyjiRRn8TZ
 yxlOy76d2Tp/4bjjSzwso/BSkXfQF2JhAM034ZytvqRf/GPyn8SwBhMdVPxfBplYYSfs47nd5yq
 56f9yujtCWga1EMW+Bs7dqBRoMb+Uomq0PcoqC0cSrmAvidy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -bPG6gtv4Dx6B-QI8NC4LnrX_QQQT4Vd
X-Proofpoint-GUID: -bPG6gtv4Dx6B-QI8NC4LnrX_QQQT4Vd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX02gRatqAvZH9
 lKThOrByyVggORuL/P6yZle86jqRDsvmbZdB5iVycSEpoJJcFXdZaLzBrOojEmsGY+HrUUQtspW
 Xg32teml/2MeJ8zZPOLdXtQ/s8FiWNe8H9D0p3LDXkpUE54dIXQy8byT0dFvQeNpsO+nvQ0cEHg
 5f9ME7xoOd6ziPU1dVeomvBDVHuHUGhCCKq5nW9NSExSfHv3Ceh2pLdhoZo8Tz0auqGhtA3X9yO
 vmNUiWZM2y+ogwuzMAr9XGhR57xlTd0HIK9JtuC6NWJGvXfPep5OFYUEul3t77KTHd6erfMBlvi
 XkHlOcKDkQ2QcxjWb3Opez8J+3Lf4faTddo3C7kIK4V6zpRB38nc8pc/oY+74vPzwMGAjfMYgNb
 LbxAjDbb5FB/Oq6/8Kf5Kmaz994MZkPrsmcnBQqHYHlgF86PdImepgsqMZEzwRFub2dXFA8VzD4
 AHPeksbszvd5KCWjPEA==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69a993a1 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jcEwYMPARZwhhGfK5pwA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: ACC1F213C86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95653-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

Instead of relying on the link_ready flag to specify if DP is connected,
read the DPCD bits and get the sink count to accurately detect if DP is
connected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5997cd28ba11..a05144de3b93 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
 	return 0;
 }
 
+/**
+ * msm_dp_bridge_detect - callback to determine if connector is connected
+ * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
+ * Returns: Bridge's 'is connected' status
+ */
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *priv;
+	int ret = 0;
+	int status = connector_status_disconnected;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
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
index fd6443d2b6ce..e4622c85fb66 100644
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
index 9eb3431dd93a..6c0426803d78 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.47.3


