Return-Path: <linux-arm-msm+bounces-102632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD6mADbF2GkuiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:39:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 656233D508C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE493040951
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047E73B3C08;
	Fri, 10 Apr 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y237kTFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGUrCcyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F01D36405F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813680; cv=none; b=Chc4/jGI1yHICqjC79v9NPKJApeAtq9XLIZn2UaiIMWN8p9W7/L8NIfOZUEIFtAR785iZnv6HHuJW+mQ6FM6eyzwc5aOdWyk0kNJPheLpijwFtYCB4dAmVuwQXpYJ4ZjO8vqPwTa3sBgaoEiJNeuOpH+G9wS5LWxja/yUWtb6I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813680; c=relaxed/simple;
	bh=+lkvt5m+Hb5xdmmgv2phzN6d2NFliDsKsZRJmDLnNmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdEm3/NXEYh+MlAIqrWjOlz8Zcaot1zyGVqVmWLkl+FnI9e5UXmMqrJb6b4X5/QgPvxCNuUUQKzVllDQrpqCvIS+rRNmROZWN80OLbCvXnCzlrSXruEz2pZWWOidAXa4PSwEn7M5TzKPwKhvdGH85uqaJyNDtGITJCM+v1aW7YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y237kTFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGUrCcyZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5tmfG2866413
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGsWvVRgr+MK8OtdKIfzmiQoRUkubmuDR7D5+VwCXPg=; b=Y237kTFnCzUYzZRG
	qTMr1d0BOKZP7bDGK+/C50SiLl/MQQS7c3NUKQvjl9ngzCqV+aSx6+mmifjM+dw1
	gRZ01CJmk64vcTX1yV4aNlXmLie4wMDHA11ReUIMCEA+9qVjhWPbL6wJUTV71Vhz
	XCZEdgMMippYNx55ypKEFk0Twa1/QQdoPwa10gp1wanPcts5HcbOUREgx4a/RaDb
	ygaIMCv3Gfpj/W67ckW+kO9QczMenHnyOEd/0atPhP+5+U2kGZ6s+Kfr5tm7zfax
	6vljAq+hQvvoyuVmok3E0/Ir2ov8nkbc1DRotIV837Ui2hN3qHmdCyHM644z+yJs
	JvqE4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decaykswe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ce375c788so40976026d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813678; x=1776418478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGsWvVRgr+MK8OtdKIfzmiQoRUkubmuDR7D5+VwCXPg=;
        b=SGUrCcyZ4JmfEVsqu7GITsOQVAsMVzK1dGc9shhpuzFfcN6YLy3S29ycE3IkrCz8cb
         oFSPGSk1ideXmDYsrBZ/EhUg7CbLzLG63fCvBXonkEHVYGgGXlJCzWbYNU2fXDl1Urcl
         m54YI23VJvnLwe7ctfTZ/u0orhPIAfhsHiP4HHPFFwdEUHN8mCfHlDvkjGRZ1D7b+2/X
         OAIjNHPgbtu4dtLSvqI+A2ky+dOGllKvT2wVzcKZflEOOmKuF8FDllsUfxAC/VJ6/Y++
         CbZpmXCO3S8RhRObU3TKnu/zeRks4G16nwh2ux9W/5pwBSXLQZL5g3+5pFydtzkY/VCL
         yQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813678; x=1776418478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gGsWvVRgr+MK8OtdKIfzmiQoRUkubmuDR7D5+VwCXPg=;
        b=hm1/ibrB2XNy0V43UCuoyixdYsmPQFF4lns93ohsluwfYmCtzM23w6TSC5gA6XfaNM
         3OlTV4k+USjSQmdsgu/lDOLyfDz1IDtD4knErtvR/zm4tzQ7QMXKOwjL7ATvaeUIhgXp
         aLCfi/7N9szCFSdBpzUFGAw8FlOmZubipl73z9DnXazu9LDdj0zOpCvVK71NSC+XhFEh
         2ViJs1xAmRiQK01S28UZvlI0P5GSZiVJmWuHxuED6Bej0ciaTaCeNmmmHOXNEH35OxOF
         Vl2/UK8LmZiYpKfFVzl5aa3pbbWaAoOEftF8vHJKJ7lqAHBgA9+f1iMdidCM6EGA6spw
         ZbWQ==
X-Gm-Message-State: AOJu0YzrHWK83cu6+74WxlWtzee/6x+ZaihJIeqUJtjCdF7dFyK5WCQJ
	iILc3QSq0DH/MISDKIXy4mFVBXNvNp1WhWBt3rhfBI/MWHzmo+gQSdaBlAfUE+2jyoXnbJMx1Fk
	I7bP4nlmZHk+aPvt8+9V0yo5N+5gxuarP/YS04vhDb0B6DU4FbBQflMXQyUqWchGw0nAueT33Jv
	Xtw2M/OQ==
X-Gm-Gg: AeBDiescmQB9Dr1IhM4+ornyWWPAXH+k3Sos2WVabIIsuKCgmE2OmBqC95/gucBcAVD
	oUGJTx9o8DdQSBbCCXNnXwpoVxs9hXX+siWrkYCPwhUrowOxgg7nEkUJzaJdygBm2I4eFYO0KcG
	jtyg0RDj1um2DH9jma+gofaTvcTznBSSrYy+DXt0RYJ50irO+HcnqWK/nWr4NAKG5Jpo+OTt73R
	B/ZH9uv+oNxgmA9zq4Ziq4AXvU1SHy3B85DczGhoaugPnTgMUFZpRCUuekjNUN0I53YwXHQkxIu
	9yrxsNbmmApdysWG4X9DjIrwVm4p7MAprzpVgbl18F8epTRYNWebD4OAIFfK/pON855hIV0TpE7
	FWHAs2zuafNEkMJHQM0mxO2xRzpqARZrcgdnIzhjqVbPuopgFBN6XsQ5IgJK+4MI8zeX9RSQ+58
	uO0YvtRBU=
X-Received: by 2002:a05:6214:4905:b0:89a:1364:1027 with SMTP id 6a1803df08f44-8ac8617efafmr31642756d6.14.1775813677758;
        Fri, 10 Apr 2026 02:34:37 -0700 (PDT)
X-Received: by 2002:a05:6214:4905:b0:89a:1364:1027 with SMTP id 6a1803df08f44-8ac8617efafmr31642426d6.14.1775813677303;
        Fri, 10 Apr 2026 02:34:37 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:44 +0800
Subject: [PATCH v4 09/39] drm/msm/dp: move the pixel clock control to its
 own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-9-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=3984;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=+lkvt5m+Hb5xdmmgv2phzN6d2NFliDsKsZRJmDLnNmo=;
 b=uoz5NciDlgeR427IPXgZxqP5AFeCFPhwgdTXSj472MjZBjCWJ16V88FUuUZA9+rj8ZCpZRafr
 Mtra9kjJEHnBT5iRu82ZlNSeym8IAUxt+mg97N4I9HT3xj4DmyrdqMe
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8c42e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FjMX0bmgnFGAle5WrLgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfX3DilyoEdBJv6
 y8fnXyEIqq8TntSfGyreBqOPM4OiuB6kF7imwxOqF0QZzytWMUeGMCfNwpzgnqzLdPI1c46bcIX
 KUVVPMWQ0JMKeorOm9Q+N6whUDoeJf+AXxJaqWlE54O6l9TmL4bknFoZxK10wA2BkQK7QHFZvDc
 fcklMrrED53oC2Te3CPzKpvLu2VZ/yWc0ZC3RuFvaOUsWSIVIec90TuniAY7SFNfUv6QM8dTCJE
 a9cwXlW3VmSr5Td4IAT7bxHiNEgh1Ks35HZpvSMiztwG6Hn6fSbjq8qRw7itaduzl/P33C3ipGS
 nvYqaUKtQzEPL8aEntbLyZCyiwlBmLCD4CxQOpPo3cz4TBRV/MHs4ouHurjSCzjLThY1cRRGU0F
 caojyZze6/cITM2rn/ZRuD1WWtOAGjP3/C2FFOr/86ndF14dghohJmfr354FZoJKaFZCvqqn/Rt
 USmzkYWhtgFHViPm+pw==
X-Proofpoint-GUID: bVV33Djs7kvzspgKlpxRqJNtAOSaXq16
X-Proofpoint-ORIG-GUID: bVV33Djs7kvzspgKlpxRqJNtAOSaXq16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102632-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 656233D508C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable/Disable of DP pixel clock happens in multiple code paths
leading to code duplication. Move it into individual helpers so that
the helpers can be called wherever necessary.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 79 +++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d0eed8c7df45..fa62f8f91189 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2176,6 +2176,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
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
@@ -2201,22 +2237,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
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
 
@@ -2545,22 +2566,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
 
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
 
 	/*
 	 * Set up transfer unit values and set controller state to send
@@ -2593,7 +2601,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
-end:
 	return ret;
 }
 
@@ -2627,11 +2634,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
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


