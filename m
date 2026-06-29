Return-Path: <linux-arm-msm+bounces-115144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E/+KJiyAQmq28gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:24:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA06DBFF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:24:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cfRGgAUA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QQzWqcTc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115144-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115144-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86E51301861E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067F241169A;
	Mon, 29 Jun 2026 14:16:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34FB3783AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742591; cv=none; b=t2g7BqrA0P6t+x3QPJUZY/h07U8ihalu2HcP+qT3TEqRrnCmSGnoQy/aCMjzkavVPtr5Qkr/cqDuiz/bnfpEF9sUWwWjEWBkHtwdRlgkbOLT4Y2sTJRT7WgKtQtST/5I6mpVEb8Kgk9UERvsdW/ix5ziZVDdYIcg4XuGv6scY0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742591; c=relaxed/simple;
	bh=rC8ECe/8MsOC2KoqDzUqIDvobwaJs83BIF8BeX2nSpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rF/PQQtBk/RS0FuJGcxiudmuBbGHM6gjifCMdquEAlK54aykZSA1RY71XLapXoRKgaXSJGOU8i1xAXo7fCpbMB3BqMpIboT2SZ3y+SwfAI/C4qjHBxFhN3hNU9daORHBE5GX0A5E46CVZ4rxJ14sciBAKsUGUR9oKz0C4RePYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfRGgAUA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQzWqcTc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATRbO2592780
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKiaT5xx/5Rjyv5AnTtLaGoahc8vP2Fk5ORlipxINwY=; b=cfRGgAUAfp8TyRGB
	5zdChheuri6aZYZ5vYNmAUA79QSkHQn20SunMoRn1AyGLDmjIMlVPRvJ2Adkp4mL
	dAjN1rRqj5TiMWG+igCDKLxTf761iiX4AHm268gQSnxFawwCvy+Th6OA2FFq3CJ2
	palbmk9nTiHpxd/4LR3GYmHwbQDuoHzMRyOn0HWNWoEWmnW7pUQgo9CdzEQynlf5
	N2nxdr7aDvAh8G1a1z2uN7h+gETjQEquwY46iO+MP8DuetSTg2PGZ13iBoVhGM53
	AwHvqcV+8+wzNECLtP8Cy09xEOHd6KAJ6RGeDQwGeUKaw5f5uIBDQ2I+owdVY3kK
	ioGUEQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vj1pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692aed16feso2688563241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742589; x=1783347389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKiaT5xx/5Rjyv5AnTtLaGoahc8vP2Fk5ORlipxINwY=;
        b=QQzWqcTcAU+vP9qj3U+0ZbKLolkbr4wvtiIEBXFaSMrDZvwX3bcWxguWTYRUEUhtCI
         NvMfyEhzJvERbU22tKQqZYbR6+yZTGfqEk43f77YtzpIPFxhD5VSA9zDQWl0c9OeQ1/X
         xWFVAw4iCuJpd/UorlajRROuRslwvHyDULrKWiv7j7LszVe9L6sPKiVltB4oM+GOUPbJ
         r/+w9Q0Mz+jAiuSv2hEFVKJqKTGfiugbu7bTgvfFRsEN6lkygfmO8z/lmNbjI5omXkEL
         zPurzbFOEVPjGC/1deyYjIvxfNuP4F9/wpgAFv1pJ9Jp7J+yYuR1RaGqIaJv/O8XL99j
         g1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742589; x=1783347389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KKiaT5xx/5Rjyv5AnTtLaGoahc8vP2Fk5ORlipxINwY=;
        b=chPrBG/URb/VbnYF1AmoU/rM6KDyAKM7Hq+YhhA7JNrwwCyZfEyGq+xawO+4TUBxhC
         QiTQ1nMzpwqX99bEdCTU0qx1TZ9SWJQT7U1PDPeK5OzkDbQmCJ3Z49+A2oCK4ed8vZ+Z
         rRVs1gNpd6rOId5m9AgOccOVKvJHlMB9EO5rwIQTm0TvA6lzk1PlC5mfowaZCJpH+VL/
         gpxYlJwwfhxTegeDfae2yva9mkDeeXMH01ra0bNUjkfoTTnYU24qh/9vsjHC8tLvsZAJ
         num29e+mR/IkVRAq89h9wnHUF4Vdmv8lBmqD2QLORJJoo7BiR88R82nk6zweo6gXu4Q6
         v2Zw==
X-Gm-Message-State: AOJu0YznSoJQXucEdbGejttSIGLqIN16+C/kiBZDW3F8hAShQDKxS72P
	cr7UhqQjBCmCPvs4hIokekRBWFdo/5jf2nmiOUqszCte7aILrGHJmgIAxJ4qay9oN0P7FzMeGiK
	Z1/fITks5Gacc+ZQ69iZzUMGnT6b+3GO31aIBkwy0XtbTyQcib98KDmmCajA1TN0rLvLk
X-Gm-Gg: AfdE7ckTJ9jpSlLqbzNtesDSGWeNcGRM3ljcjufoJgp/0XxeVtM9hC4E02i3g8M3xrB
	MhzhdqodejlXTwuwXnDVM7eUsz/Nc/j/erbcbni4Egk9DTnzC2Ba53hE+u3iqF3bIGJxuMWq8Ou
	oETg1ozwN+M9HPj2LsO5CamoBwyI48nRYZyGTUVy3J88bKFUoRFoMYdY+IVoBg0Vc/T4x81g2Jd
	o7Lvx6Fr7m1rGwI8ZWxgPuvBgW6D41vDHCicOGsJ8xZ1PdbKhIilqi5McBMH7sIq/s4pp7qELvj
	/nlRiYIqSd0S2P94mb75Wpt0XhkVzgxTsC9yGffpwc7sa/eKCFQ7M4cIlfDaCH2e/6nDKZ0c0v3
	MLl/XIe9sQKodY93ROWI3cObQ74mPgiIJ1ds1J+b4wx+hTCAUS0mwyTjp+LKwQCm+Q2+FBA==
X-Received: by 2002:a05:6102:9d3:b0:737:783d:1912 with SMTP id ada2fe7eead31-737783d1bc9mr3304778137.12.1782742589027;
        Mon, 29 Jun 2026 07:16:29 -0700 (PDT)
X-Received: by 2002:a05:6102:9d3:b0:737:783d:1912 with SMTP id ada2fe7eead31-737783d1bc9mr3304489137.12.1782742586562;
        Mon, 29 Jun 2026 07:16:26 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 16/25] drm/msm/dp: add msm_dp_display_get_panel() to initialize DP panel
Date: Mon, 29 Jun 2026 22:14:37 +0800
Message-ID: <20260629-msm-dp-mst-v5-16-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=2339; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=cRES0c0OGAe+Wq5TijiVC3vsN9LDNpp2DEfSA/mpQKY=; b=arKuHVPqm5eA3L5paw1TwrwN8uIZnY3e8pB52q2qrkpMOOAvN7es+uYpYWWqugJ/7BI/mope1 lAb8WvzTnvMCm+B6qi8tnPyqwNVeBc9l+iSVedt5PO3t3w2TgcGLGaO
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oU4FAe2yL3EkdHoqaSXWrHD1S8qRT-zC
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a427e3d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6cFZRJIsygQ8aEszaMkA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX6+jx8J5TkkjN
 RLaN89I/DZY3zBWrZDNOAZCjpsdI0S3B7UgtOzENuQjNxVE2MCezxOWOvbPL7CyTSm5gBU9ELf+
 QShUa6F+h/GRj/D+M3VrhMBOIz4vhgQ=
X-Proofpoint-ORIG-GUID: oU4FAe2yL3EkdHoqaSXWrHD1S8qRT-zC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX6rZVm/KZCvrn
 BxlrYYu7FCWikv4W4CjSBAOoI6ztFftcgZy4zHmxE5lPAPLo/IHYylpRaYYTTe5PdnsKmqdNthK
 TdmOj22njzuGqMziahYtqEW4UMXiCd9iM4HGfx/dNwjPst5W8c3jwI3ZGOHjZMyKNbsVP33b5OT
 f+PGi2AftLsdQUa45YfoupVlntGCsCxjtEX5tf8vEvuSCJVAkKN/U0afIGCysbwM/4GoeuTXmAD
 6+Bbiy4v9w7mOeWv4qVTOrBM7dl7qEkdf/xHYR41F0NbpVDCiLFE4ggcTEMKHLSc3JU3H53oEBd
 xYd0I2xMHHCMWb30jl+iOcFka2CmPynyAIvPEbzP3VU/XjfOGNGPDRARN3BRh+B8WtxO4toB0V+
 MGORlTEV9ULXAauJ3zdIXpWciOrhumd2PFBHq55568imWxFG4LxSNxgMuqwPUfKjWH1elduFiFC
 l4ixf1XEeYhMGzYE/Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115144-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BEA06DBFF0

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API msm_dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c3be656f10ee..2a74302bcb7c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -565,6 +565,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (stream_id >= DP_STREAM_MAX || stream_id >= dp->max_stream) {
+		DRM_ERROR("invalid stream_id %d\n", stream_id);
+		return NULL;
+	}
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[stream_id]);
+
+	if (IS_ERR(dp_panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	dp_panel->stream_id = stream_id;
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 75dc40261723..676213a48089 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -58,4 +58,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0


