Return-Path: <linux-arm-msm+bounces-110094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O+0OCUcGGq+dQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:42:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E15F0CC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52FAC307A6D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1FE3C063A;
	Thu, 28 May 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXMXYWMb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gt9y+zfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F943C09F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964873; cv=none; b=eCoebGj5xdpthWYFQ8ssJYRMic2ZuGwl6BJezpeJWALYWBH8ZHsS1Tc/2vCSGcbgk3WfYQk2ChruQlR/VrJrWP1D0t4ipZngbLtz7daVi7Tf+86rHy3g9h+a2t8q7Or0Xab413tGrFcQ8f4JpKPuqo9yozS8ZHF1r30hxjFQ/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964873; c=relaxed/simple;
	bh=dqm2wxnPXKuUOtXFQoqNoFAR91dDq9Gi7fN2pM8QF+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fg40oyGojortKZMOvVASKBDMei54ssGMsh9Yqre8n0rWk2PtJ+yGBVZmNSjVvKe65ck42ZPzJ6mIeX/EW/7oyvfAm8pAiASdSGbLlzzTasx2c+zC43dU+e1U3UahEVNbD0X1PpKG3SYx7DNZ3WEHPIYuOnMuf3k8A3LTluTbWes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXMXYWMb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gt9y+zfh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vl2v298257
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCzF/BAbpM3MIYUV+Gka1e1dqq+2SdVn4ec2UIWEPrA=; b=aXMXYWMb4cYNpePg
	r4MEH69Op7w/ntZjp/FD9dJw1rAJO1D/wSnIn3EP3Frmf/rzNaVg0+dI1JC6HXDQ
	f2wrtFdbGLBatNGmGO/jDGXNn6xuLc0GyIwjv+BGIOBRSAi16yuf0oEgokiLWm+w
	+38+TvZ5gBZBqWUdN41qr4xPjDdG/nI6PkgzMpxwIRfE9+40Tx47atEsK3g8dhEU
	d91Q/lqQUbmpigDAwKq7WBMepYH4BQ1jjFV5qa0dYHcO7aYG3C3pX2iIbIH811uU
	K+KeOamN8jAV0kPNGl+Z9Bd0fxgLyAAEylp66AH+A8duVAauGJXW7vFFKnmESkJh
	0FSfpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajd3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914aa174c3aso1222979985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964870; x=1780569670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCzF/BAbpM3MIYUV+Gka1e1dqq+2SdVn4ec2UIWEPrA=;
        b=gt9y+zfhSmDFtnxlw/cgsfD1rzZwHHSihWL+4e1LGRHLWEAYuwFfJD5p9KuTlaWnDk
         xa/lbogK9ez5ODSPWLYF6kB2kpqZUnbJeWUXeWB47tmJJPEGkhbuZImFZLdzjB80Ddmh
         0zqu4eY/OpTqEylz5PsFp+9hwGJQbE9B+sg0VmeITf6WOn82Vd7gBIHKXO4eaDzo3U8Y
         q/XuIp2t/tIWZHAZHOJbGqNxSw91ycSkk/DMpJSU8a51LwUakAbQuogqZ9Ho4epeZnRp
         Jotl6Tobic7Mx8BmQkQ4ZEc3lyHqr+sj+LkUUixTLZ4R7poWnvDu+7vfDBVl72H/Nej4
         DTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964870; x=1780569670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCzF/BAbpM3MIYUV+Gka1e1dqq+2SdVn4ec2UIWEPrA=;
        b=KgQgFnRT3G4xeNHtD4GwM5tzgiEfABjTQXx/lsws4C3a7gHQp6huLtfahTVIAwtpAk
         rZfVCCCThEEhLnzo6z6lmE2YkLGuBZ32MCvEAg3IZs3/Ch1Rh3AfMw3GtB8cj04cM37x
         ZMFqlM34aTlQor+5ixWl++1yLXetnW/G3W0/weH1Fcx5Si/TverQ2B+IQhjmiUdcJg56
         +vIbp4XCnG64h3WKUkL7KNQANWloqFzvtvAX17DYhRqQBx0lKIyJ+1r1ONhGda2rnGwk
         CFNHMmZH4nqDS+y0YucD4GvF0/gBGJCciP4LKlAEPndwY/nTMdBwTvZJfUouU8rBKinq
         cwFw==
X-Gm-Message-State: AOJu0YyVBwd2fbi1RK6JJU3oy5sw9E7AIg585YMhK4uL6sBQ2GzQM++o
	X6Fob/h4g5Cwdi8V9uyJiF2cIdmPF4K6H2L+Mykk6SIU6F03D9mMOIL4eABzmGQDp8hA/0u3pCi
	mNcLFdBduegaWnLmb5gjf1lVm8EVlKBJnfCJzFdBPX7LlTDIRK3A/WI5oRTwk7MfJGmjB
X-Gm-Gg: Acq92OH2n3RJD/u6g00lFJQr5i97ZBLAkLkDeeBrlF8PLtLuGWizvrIuxOI6XrUCYdn
	SYDubqEWV6UMfZb4MnQaH0k6J/I01Nmq/Q7tXhIIUf6RwL2hTQAGYv9JP3ZYu6kgQtRJ111r7/K
	tj6MleX/IMXiupoZ0I1yhtK0O7BJM367CLqEa9/FLBLEfKMULaNDjaLbjAxRgcx7aip8JnXfxWF
	h8h/WdTlNkgx3qTyvKneZLc1V64oRAV+KRGmXST9YSHuiRr++bB94qQzforhWMtCxqu4UdPpIJY
	znH/Anujqme/cO/QDl4hLNTuSJlK21hmv2DIRnlonETDJbUMtUwGhA+tDs/QEfTtuDms7F2Py5+
	5AgWFUmtrKTdfQ7nnkLyfGEuN1FhsF1AcNcSWXujkA+VClG8AhzMW4QQEIyT5l3Em2z4XWIHvjY
	eRyxAVvk4WiHn3mmtP5A==
X-Received: by 2002:a05:620a:2985:b0:913:e5bb:3dce with SMTP id af79cd13be357-914b4a19222mr3865545685a.55.1779964869638;
        Thu, 28 May 2026 03:41:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:913:e5bb:3dce with SMTP id af79cd13be357-914b4a19222mr3865541885a.55.1779964869091;
        Thu, 28 May 2026 03:41:09 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:41:08 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:28 +0800
Subject: [PATCH v5 07/15] drm/msm/dp: move the pixel clock control to its
 own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-7-a9221c1f1f3b@oss.qualcomm.com>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
In-Reply-To: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=4116;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=dqm2wxnPXKuUOtXFQoqNoFAR91dDq9Gi7fN2pM8QF+U=;
 b=C7XW/755Gv6aBYMrZBo3qAA5Ghpemv8GPlk8myph1CMqgy1gXzmDw1wibAqkiIWl3kz47dTDT
 4HaBYYTjj7OBDyKALicnx2HTf0y3nxefpr1zNZ0udDcPnmAANgjCLv3
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: cajes4Rm_SdtjcMou1RSWqL7orCNUnpI
X-Proofpoint-ORIG-GUID: cajes4Rm_SdtjcMou1RSWqL7orCNUnpI
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a181bc6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FjMX0bmgnFGAle5WrLgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwNiBTYWx0ZWRfX37Grd1AyxSKT
 h5u6a8mbdGNUoP9lDCy50t9uW7uT9t1o+NVN3Dn90IA3b8SE6VAPGfli06iwWo7GjhkFAR1SF+9
 IyQfzNgzjf3QJBcbBtSKVcXeR6Y3Xnjhm+Xpppdnj4iiw3VqqW+ixqy+aa/CGsOHOAGM/2et9eF
 C3edhjgRMWvKLrb9gkvcTyBcTWVXPvZBKoLv0OpPmh35D4sJ46sKyyHDNxbS7mylEvwY8CjWwGw
 0btP4GUuDde+Fs8Px5zigvfcZnUswTKG665OtRgRGQQ9OcNJmhViV3lOf+8ouNusdA72yrVPEnf
 idS6UG9qHoReKEV3ZvrF36QkJcDCV27INpkSj7BGvdcso2KkXdUGl30MF1r3n9aAq4e8h/SD1OV
 WYtz3CKtGxRunPisheOYlylnhSYxwdVGxA4NEWboRkfh8kU2MPmVUj9gZISMzfN5Pz8T19MI9nl
 spSxemtf7fOciGZwgjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110094-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A3E15F0CC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable/Disable of DP pixel clock happens in multiple code paths
leading to code duplication. Move it into individual helpers so that
the helpers can be called wherever necessary.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 81 +++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b22b3a0df313..d502ddbc4bdf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2172,6 +2172,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
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
+	if (ctrl->stream_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
+	} else {
+		ret = clk_prepare_enable(ctrl->pixel_clk);
+		if (ret) {
+			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+			return ret;
+		}
+		ctrl->stream_clks_on = true;
+	}
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
@@ -2197,22 +2233,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
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
 
@@ -2515,26 +2536,13 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
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
@@ -2573,7 +2581,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
-end:
 	return ret;
 }
 
@@ -2621,11 +2628,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
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


