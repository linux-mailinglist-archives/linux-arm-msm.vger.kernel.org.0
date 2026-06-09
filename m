Return-Path: <linux-arm-msm+bounces-112108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wShsEcPkJ2rz4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:02:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE065EACE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:02:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OBv5PezH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AuCucTr8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112108-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112108-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B73B0311C8BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2BF3ED5AC;
	Tue,  9 Jun 2026 09:47:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EC73F65F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998461; cv=none; b=EsD66//1AxwMYp1FjxegPaQD7Kp8CKI+1QF9GDSIr8Phh65JmUBRBipinODHZo2TXLKdGnV0vIdyE9qLn2LFaU5NLn+GTCFp2hSzfNxm0rTUkpX23SlY8TIf4wT2e1Pe4gg3+bEP6kQQOKNHAGmHy/OtJyA/ViXdhp5EBgqgztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998461; c=relaxed/simple;
	bh=4TJKG8RTz4R+dv3UNXgRl/mjeEf45SUuZJzked/IkbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8itmUFvSFDFzApe7JkplaHQhx0Y4QZ0Dkuq7NCcgD5DYDe7ehXIaCZfpgr1nH4L/miRDTNnDmin9CBDvyWybLG/t4zhS2n7LgOy/mXzU9fj6d4aFSpKnApP/47p/kSvKo3wURWHO7mXDUHtIFbrPL4UvB27BB+GLlitQkwR98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBv5PezH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AuCucTr8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985YVO007036
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=; b=OBv5PezHWAs57cz1
	XWIp5N/xDSpiOHk7MJe1QJ4I4YJFx6ESrzTDWcofMItbt8yA8GQCAaRD2OllUsmJ
	NweKn2wbg/MEhMz/PD8Q0lLNGti2RDjGHdim6YXP3jQeMa9Zp3gvZwIxJX4fH7Xh
	IEIWGdi0u3MpOrvhi4/qVqkS2JII+CSuT9XSvnkxscFEBREfrwhXIBnRAQLaTr0w
	xIms7xyUu+imkg68mWNn8bAeo7M9DvW0/wqpaHRBDxxDtmcqV9YHpooclJcdXtZ1
	jQMBzcQRbJWMPWZbpPbc8zhze2VEBT1e6edjLQvIawnUyM27u92D9FW8UHSycK03
	F/Yfrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0srdn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91574ad6871so602257985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998458; x=1781603258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=;
        b=AuCucTr83B2scdkIVwVvx6IXqvvfRqwBROFTbvmFCrgi4DGgBHa1zkEF45oRCyXldB
         WRFti6KInUzhPWA0QI5YYzUfIiKsSsHjWbTmyiFqnRz9nVaukJpd6baCHlGbQvsp+R+y
         Mn4F/cgYiAA7uqtHQBUD9buILyQKT5cJ4EHFmyH/xlTuwM2HgnqFcuDp+If9/QU8fKHx
         cZGOmA0t0KWojX6wCcCRUaoTepNJzhISZ8WpCVmeCtC0nIb+S8nlyp/U019RRxcjlo3N
         ZMRvORom9qSEe/15Wvovd6oHuvS0oYY2X1OhuJ/bxXpwTb6ML/IozkVtePdL4gzfsssD
         IwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998458; x=1781603258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=;
        b=hD4PugOXqcPGxQDmNRDK159LqDahh6iZG2fiOyb63n9E8QSLU/m7YtVJVaIDxY/psm
         JHx+H910n8zq5e1AmQJs8KFknuGLufKfi6Femc1fxP2eqjFg8Cq/ZDsf2RZAdhwUy/bs
         XuOkL3DLhGQYwJYX6hJcWLWXSfFTo7NyotoDRwXSf112wBGpMW/geA+OktHlBS0m+VrD
         eULv9tD1G2GQek+Xj+1T2o3ukvRGSiOu5BybgyLZBV6MaQzAwDTw7nW+VbSW2v9w2nYV
         sskzLKAPybxQyUUJA7ZDy6zmOUmRgyQ5E+gyB3k1jPXc05PZRZS9klUJq7M6OHSgTmSu
         nn7A==
X-Gm-Message-State: AOJu0Yzt2RfjUpNRAW5EV4ed4XMBTf2vNMFG1vscnBv9RFiXi+RTHE1Y
	OOJsF7w7gEiOss1rcpY4gw9T++qLkhcnh4h2QgZY0nlaHJamW7fI9WjXvLu+WJO8m7ZgquBH7yi
	wzMu0inJgF/K3xbgQn25oifRDdSAJlNTpfs4di74YnQHI5KO49ZMDegaHRwuDcaMlNUHQ
X-Gm-Gg: Acq92OHzNWvJvyoleBlvQKNeFTrW+j8PXLYM01aNaDOau6pYN4q8CrdbQn2s7ShjH+4
	cVg4gLI9bCtPWqhbHAhEriklJFCwnxlHDEtj2qoB3BVCaKgY9Uqz+O+mWap/lKYOXXjpGNDb1IE
	gMGVAzC6O6oklgEpfy2TNs0pU66A5rzWICff0pCEOGyPFkYnYblbgeOGWuO/OxNrXL52SxvQFyz
	j42l6HJg6dFYiQp95XKtbPH4BZxWToP1024zdDjJid6LWfpQOppEuZmGEby+/1cgEYOyQRGVbGB
	041wWdU+q4IjSwAtP+ZW156TLZ3Bw6wnKSv/NfyYnigKMJqYjE1i2uFGFev6qASDmZBNdVo5yqY
	KaSb1LkBj+HoVJ8QEKSs6aIHBg+uMTtm7emzquKaDP/15iuSExWOzRsirCmFxwZTYs1foipimlL
	r+LuHu0MG42zI6RP2J6Q==
X-Received: by 2002:a05:620a:410d:b0:915:5930:94f1 with SMTP id af79cd13be357-915a9df2c2bmr3231750085a.47.1780998458153;
        Tue, 09 Jun 2026 02:47:38 -0700 (PDT)
X-Received: by 2002:a05:620a:410d:b0:915:5930:94f1 with SMTP id af79cd13be357-915a9df2c2bmr3231748085a.47.1780998457753;
        Tue, 09 Jun 2026 02:47:37 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:34 +0800
Subject: [PATCH v7 12/15] drm/msm/dp: simplify link and clock disable
 sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-12-ea04113e8233@oss.qualcomm.com>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
In-Reply-To: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998393; l=1745;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=4TJKG8RTz4R+dv3UNXgRl/mjeEf45SUuZJzked/IkbU=;
 b=67mFLZcs9VBQqLt7xo15/S6j1IHHHZ3K34SenEqCrc5lvTHl07V13t6VKL+1o2FuYFBz0V8t7
 2Dn5yBchox7BFFHn6ITXS4bw1TUlLoC5CURYvnEyvl8tl4vePoZanFU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX9VyxJG6iEQOa
 16JbeinG8qV/S++lZKncZHgKhrYmTMy0/c64WLoH5zumHV/SZkQK+bpWhfoBHAaRbbNXO7cwtuW
 dWuUltgaSJZrQr6bMMqvJoFXg2ZOCiA+gvvrxIzLQO4b0mUZkN+k8V7ZGaCg3nbUxEbAY7/h/mg
 CK5ytOppdOxv/2ZiG4O5fHFATReJBsBFnt0NrKJ84uvwoGjBtOf/Ip733LcJ4CkIJK1uxRlrvCh
 DlXKSFg5Bfe3HxAvHzhDXXwIWS816QxeWUAlkJbSGDFi5o2mv91WoXunCyFBJcvroKBZN1UjDhU
 mnU4KFraFhgkLETwo/bflr5GkrNvWZ8tluHhIaxFSmlE6c+8DfR5t5c2qq2d8Tf5G1m1XeENANg
 SjWRwwypGFQ2gAwrJDzta0marLQZWgoKBLwt/H3BlscwG5UUFoiZ/VeNwBuQA5SqALNmk/btcBH
 TYNOtb2iLsVBkb0T0yw==
X-Proofpoint-ORIG-GUID: DlfRt390qInOD32QeoFbsJ9E7AYAplxa
X-Proofpoint-GUID: DlfRt390qInOD32QeoFbsJ9E7AYAplxa
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27e13b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=W1j8KJVysGQzs9t885kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112108-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: A4DE065EACE

Move the common disable steps out of the sink_count check to make the
flow easier to follow.

No functional change intended.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8f472633da82..63e5b191f95c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -716,27 +716,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 	msm_dp_panel_disable_vsc_sdp(dp->panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
-		/* set dongle to D3 (power off) mode */
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	if (dp->link->sink_count == 0)
+		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+	else
 		msm_dp_display_host_phy_exit(dp);
-	}
 
 	msm_dp_display->power_on = false;
 

-- 
2.43.0


