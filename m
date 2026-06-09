Return-Path: <linux-arm-msm+bounces-112103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wJT8JD3kJ2q94AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:00:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4765EA67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:00:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZgzeQM3H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hNAuLY3T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112103-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112103-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DE8E309D922
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F813EFD10;
	Tue,  9 Jun 2026 09:47:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EE23F23AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998436; cv=none; b=DLT/ydJzM/ojHvy02oZjE4+uZX1EFQb8iTkvSNYjhrIhXya8pGZLWlgIatbiXohkbh3p95fy55uIvlvLfXDlVra6MQeeLTJoK35XR/0hbHVwCHsa+vdPTC4SdPeR5vY+Koj64aEsRriMm4qeT/j9oL9Dwi3OJBaSmXeVIG9bfRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998436; c=relaxed/simple;
	bh=hFDmZxXei1KTLcixeb+NUk/Wwdocsh1JcTngaZx0hsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIdxj7dsjD9pBPsZdcMaMS47TIPL3HXYIdOQBqGrxkpEjGRhx2+9PAPcMR2P7FmdBMIVEto4sKptdTsaKPK7n/XATmMVVc6IaH8tq8VBnbRln4SpIS6+cTkWWwAoAAdEcnIR9gEX5dZKVUmOhU03ETpN4IHikJC8cttRnW4VBZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgzeQM3H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNAuLY3T; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfXb1958700
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sdy8wI2RH27j4YG85JCTBXzxHed9vdoH71Sb++hFk1Y=; b=ZgzeQM3HzTsjqyOd
	rOqOaMNP6DXU4a1f6C9+goRRq5bBacscyiuspgzTkvyCukq1LUOjPcmhbYLn7U5I
	kGw2uWpgT3BF/T9wvHuMicbOXNgfFtiMPoWDNSHFiY8gxvvQg8Q8F7UZ05Ljouku
	igAS9K8opG5DD07YJ49/5MoqPH3Ufih64usvdyJIg2fKnU06dgASQSiDzjmiM1yX
	rrGfTx+4ojjbZpOggYPkisd0jUJkOl/UVwDRvv1ZWPrc41JLoBU9sbkA5BZL8WVU
	2Bb88lqtVeFNDhrapIYqKo54EW9vmAUtvgxanSlzFPKmmihWKBc7JwcfF5pyQkYD
	BlfDrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8vht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9159c4b210aso1028384285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998433; x=1781603233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sdy8wI2RH27j4YG85JCTBXzxHed9vdoH71Sb++hFk1Y=;
        b=hNAuLY3TvgH0AubaoUJpYhXSuAryD4gnwBCuk3Sq3aOFUFez28tBxrbb6GqPrbtS4g
         jtF1RfUaW7a/S8DrZSdecfs+cJStWRggagnZvTJGqzJDSGOg/Qd/A7WpApc0xU58ik7O
         R+iZ2nKRNbbG5vuSBDgBZWnDoerLP5JFZD+9kkDyv61rYh8/BKX2EwSGF0AvdqsummrL
         h4bBDvcZ91caXLy4PlXc+c+IbED8Ox9pz2y8lzBrC5Eb1Pu8nxIsTN1ZZ5u/C4kk1AHk
         apnm7SXP67cvAUQOBNQzC3PNxMFbtoAxpbVWJiUwAV8WtipCWpgW+N5JGjmxWxkHZ+Fe
         jBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998433; x=1781603233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sdy8wI2RH27j4YG85JCTBXzxHed9vdoH71Sb++hFk1Y=;
        b=i3FuhHMQEvzPvFjXShE5+TQg86x70eAMrDP21FDGqlms70Fj9Y+Ft01IudeE3O4bzy
         OP1935CiRg+YL0+2/tJsuWvev2DXdCVEFwspivwC8f+Ej5UE8rKJ5WyNQXVxiyxBBSle
         1JKfYc0tkzQy+UozxZsrc2a/cXbRQHtllKJekQ9boMc1gaV2tSnWaYtRJBY+NQ4NR0WP
         sv9CQjVkrGz+UNn5u0gAyMZm5/UL4n8PSTsuGGjDRFGGnahOOiJuUvSCghSDIT0ysjnw
         JHCc+4EZmhnxRjI+f2I44yBufR8vbWHV0AE3HKU3UJiRlbyy1s0ZZc/cYSEM8+GJSp8x
         l/xg==
X-Gm-Message-State: AOJu0Yy6GWeqU3bBwvAuh7CPaJCeXzDswsYNj9nVENXI0sWKr77mk/9n
	eu1YuzKhqFIN/qkeHzX4IXl2s427ZucDdPKeixn1932o+2UG7L4qCEVktTyIWOTIrwwzUEFZOf+
	6wKWwxnSarNIQcQ5DyPzc7qT7XfHarBZcz/t+vlhx8eGXCJwL6mdxE4xC8zS6uj38v2B8
X-Gm-Gg: Acq92OFj+jjExmD4RTgmei4+o+LyArgPFTA8dG5zv/56TrApYI/8StIdj374L15eRfW
	zwUaGDXzaFihD37HhML/xjH3cEo+BiFfJJucIoOVaUZnNGRnwGIvDf235j5/AMKrMGnYTZEbJwI
	YywsYE+Rwq0H0jBHKDchWEdV6X41b4jovE3PJWIG2i38xk1Zl85zZcGs2YS18honuYkCe7O6cHL
	jn3aHISXNhIkoF2F6hDEFdXDaUIyz0+tZnhhC+AjvxD45Lt/kwE5fg2yYf+ZuYTYZgi6mc3M5y7
	bOQyKXrGc6Y131mq1fAZ89gU6K098jShpImNHEpj9wPAi22oyKJbW3kx8mpvphiaNke0yFkTG5y
	lB87OSGKUCvQndpOXBfdXvt+cmAdr5iasAZqRtGLPlsBJ9AGH1AiUDVbsSMnivnjDscQFOZQYFr
	UsVzia7Fdvi//YLizfQA==
X-Received: by 2002:a05:620a:199b:b0:8d7:c82f:ff7b with SMTP id af79cd13be357-915ad31433amr2072750085a.35.1780998433131;
        Tue, 09 Jun 2026 02:47:13 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:8d7:c82f:ff7b with SMTP id af79cd13be357-915ad31433amr2072746985a.35.1780998432672;
        Tue, 09 Jun 2026 02:47:12 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:12 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:29 +0800
Subject: [PATCH v7 07/15] drm/msm/dp: move the pixel clock control to its
 own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-7-ea04113e8233@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998393; l=4059;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=hFDmZxXei1KTLcixeb+NUk/Wwdocsh1JcTngaZx0hsQ=;
 b=JF48Z/GJSbnZ7/9+9I+TvqmWJrqHdn5mcqHwbMOXjLHOFIsqSag9uEeFiV5Mcq1y32OnonaE3
 XFvYmgDpZ5vC2HwI3jlo6NflCi50HfmIDN3dAw2GdOph3ifQF1DsfH3
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 8dk0TqpiEIFoKmSrE6g14I2nBAxphugW
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e121 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FjMX0bmgnFGAle5WrLgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8dk0TqpiEIFoKmSrE6g14I2nBAxphugW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfXziotklnLEf8N
 gkCm78TrSgOW5eoEzB3SHEtUEfWvu7bLM+DYkKh06BrDFFWztiD0s9mg/OT1uCiLERad61Ve2F9
 CILf+223wlzYGLM5tm+YT2kCGe4xzR7v+2Jw/Nsv/qG7lzuUpxLEmBnvp9yJa0BO6MownSLjyFQ
 VGHDXe/aa8Bz8z9OBGIlh/Tvssjv1X/eQRS7rCE81NnvtN9YOnPY8iDV4C4js4iOOQ9PTQmyKx5
 KYoyT8GpXtOwa9yuHawgfhvx31RHuBR9xLsTmruySxMmsvSPAHNi8o7Lizyr6n35vJF4UmZrat4
 eMcMD6lc67JT15xp5ZKVLAgAD88+sKqtJBQ46BNS90QI4lou/Px4sl/tmN4Ln9NBxiBcbSznBJ8
 tvvYtAvy0GJBWQf9NuyU4wBqJSr3aAJpA8BkvsvV6qQpiLyb4KNhL39UnKdfuJumWiFI/FkzFiL
 WkfmlXlQrzqeWT8PfRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112103-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8AD4765EA67

Enable/Disable of DP pixel clock happens in multiple code paths
leading to code duplication. Move it into individual helpers so that
the helpers can be called wherever necessary.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 80 ++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1c2eccec6ec6..a2c44088e6a6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2171,6 +2171,41 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	return success;
 }
 
+static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
+{
+	int ret;
+
+	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
+	if (ret) {
+		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
+		return ret;
+	}
+
+	if (WARN_ON_ONCE(ctrl->stream_clks_on))
+		return 0;
+
+	ret = clk_prepare_enable(ctrl->pixel_clk);
+	if (ret) {
+		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		return ret;
+	}
+	ctrl->stream_clks_on = true;
+
+	return ret;
+}
+
+static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (ctrl->stream_clks_on) {
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
+	}
+}
+
 static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret;
@@ -2196,22 +2231,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	}
 
 	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
-	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
-		return ret;
-	}
-
-	if (ctrl->stream_clks_on) {
-		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
-	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
-		if (ret) {
-			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-			return ret;
-		}
-		ctrl->stream_clks_on = true;
-	}
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
 
 	msm_dp_ctrl_send_phy_test_pattern(ctrl);
 
@@ -2514,26 +2534,13 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
-			goto end;
+			return ret;
 		}
 	}
 
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
-	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
-		goto end;
-	}
-
-	if (ctrl->stream_clks_on) {
-		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
-	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
-		if (ret) {
-			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-			goto end;
-		}
-		ctrl->stream_clks_on = true;
-	}
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	if (ret)
+		return ret;
 
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
 		msm_dp_ctrl_link_retrain(ctrl);
@@ -2572,7 +2579,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
-end:
 	return ret;
 }
 
@@ -2620,11 +2626,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
+	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 

-- 
2.43.0


