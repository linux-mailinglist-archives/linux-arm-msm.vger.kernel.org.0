Return-Path: <linux-arm-msm+bounces-102653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L40HcHG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:45:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 011873D5239
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E3AB303FFE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC153BB9E6;
	Fri, 10 Apr 2026 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJufMGb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7PFXzF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40C33C4566
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813785; cv=none; b=L/wDp51MRmixc4Jy4UgkSvUlli4BoyXN+oX7OEcBkXkWdye7YPn6k3gtW3g6woXV0K1Y7ELt1JkdX7GB3ICa6Of2nixXQTLmZw9wldFNsX6N9SqPwYMVZLSxgYEgk6gNaYmjoB6mw+BY0E/AH6SxYOTOkPUjITydeAK+O3tGkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813785; c=relaxed/simple;
	bh=jIMHQdxIECA28aYzGtEXv4+czHb36kgu+8tE7E52fLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lx2MLz+b2hmEWwI5bm+LbYUqhLHMfVHAjimXKErXx6rE2kPRMYu9C6Oo6iKYZkI/JJXL5IwIPpJ3pAOhz4LwZbs2zGcYg8ZfMnVNKtDLaGAkABcpyFFx8f8JVG6adE8De4qgra+1rR7uCdiqAG8HwaJKLs/l0qNYdveFM1HzgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJufMGb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7PFXzF0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A69rDP2866425
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InbQY1tkNpz7LPlGE2uWAafYcXfhGCbw+NsHxeqXBug=; b=kJufMGb32nAtOSwz
	5/hURrCPuQRiMBnpdaQUdSEgHH1bWFT/8zKVM9UatIr4zWXN5NfRCu2ByYBp6Pgb
	PofHeZfz0TT/r450wPz7Q5QgXY2iLlywIVYOiLLWNlGsNcT2c3cf1hFA7rohmzMg
	4QnnRMLHzyeLRELd04BfAFk4ro5B3Mldg8ZVBhi7exXPKzHiEHpCNNr2kd1ePk5t
	VbglxgAOzdPPrOs1W+vLm+Q32ZbXLHVLFGM6+sf41shdqXE3/o3ihOnjMUIdetlg
	GZsvDYSG3xv2UShWZkIa4urkb/y9BtGeHR2/Ph2P3xu8ZwIk5wAbBuxjYcRmR5kf
	O4RSJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decaykt6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a31df1907cso51966926d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813783; x=1776418583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InbQY1tkNpz7LPlGE2uWAafYcXfhGCbw+NsHxeqXBug=;
        b=W7PFXzF0b3PcH/mayD5wXVm1YaPdn2w0uXKSPOdKJR4bbgbpZZKXMWbk0hFO715Qjt
         ixI96z18P4/A+zFogrZsX6RCRSSH40VX3DCNeGJOFKPdC6PigGcarfoIoaOFxXAssu1w
         PAwWeV25zhkMnixP/UhBVRjRvCcRP9zAPdkYIkdOTkkM7OEus7k781UfHsF1DSt6qiPJ
         RmSa1K2trLHHvGc5CRaEhaB07pXADTzuR1fGpqU9jQlXSa+rxDFLjBpzJzTOsAJh8aex
         XnffgS7CyLyrjrbbYr9ZP1p2Tfi+8SpKChsdVeC++WiZTSx5pM30WK8cPIGyLHZe73/P
         jqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813783; x=1776418583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=InbQY1tkNpz7LPlGE2uWAafYcXfhGCbw+NsHxeqXBug=;
        b=qmqdO/12f0xKw5PstB7xVuJgnmwJWedDw669+yP1S8ppO4azv8/JY0ebmdiYmmS4tX
         zBLCK79yvOUcUJMwJX/vvHesFOmih0MnOhuGqLcd26p5iPPEV4MFeEQDhvx2/ttSI41I
         A36RHa/W8VUFv6P6UI/UmYB3/77Y1DojXI2G3Qf7k1YCrID3k5tw2nKYLl8Ovy1IZRVx
         abuZZKD6V4fYCgCM1x0ybgEXBrT7ItTjhEThTCN0mxyukCVDLa/rMfuXeonM0SXpKgah
         iY6yjeylo4RCYZe7452xk1NeqfWNFL2w1xy/J+1idSYMb79tG9+b0N3geBUFjgmPWRHh
         vWTg==
X-Gm-Message-State: AOJu0YzSt9GcXX+fXAQsP5Y3NTdYTHW20yZaU5cEUwUnlygTukipM8Qn
	sz8EMR+eS4bFyvu5rAgdE2vxE5ba6yA+PSx5pDFqey/A0HZavJPrxRt+qethFbS19TwYMbONY5E
	Unt/ZR4YXZVO5aIFqW8bUoeLe0Qvn+QNQHQYPNfRrFPizRvQDfdgHIaOtK2mCQt027ADBO4vUmy
	w4
X-Gm-Gg: AeBDieuy/ur3rKr+AtfkOUn2IZHg0eo5/oYTUFifWkTvCvehOCQ0Uoa7FPQNot6qwGH
	GlABcuKpqr9b6P03bg01B0BAjq+OHWXYrnxGemDLKMnhzG51wC/A3GYTSEs2q8ncD2r74A33fhK
	6/X4FSZBW04NUvdXzZxzlA+9OpD55E/QpUVhQQY+S1EAtwP65ch4UfN2NQlA79XWW63qCBILpr3
	82o3CT+eV9MO5xTfO0Bowwdg+RYssT7nPvwL7Ps98xfPhwBtAohw7lCbrzYuV8C5IfU0vTYoomU
	NbI+TiMvLKfKa9hEWRuqqMSj7ufcBswfE8QGYPStzytXOsvpztY5YWv5LhQ+Qgp2B0tIEyCkGhK
	iaJEbiO/USIJCO26aaX0AmYkzIBzd6wzKPEO/Oakvfk9bE4+uwWzOFSnrh3MIZgr250uvXLhDdX
	aLDSUVxpo=
X-Received: by 2002:a05:6214:3a89:b0:899:ea4f:12f6 with SMTP id 6a1803df08f44-8ac86285cfdmr31567306d6.35.1775813783003;
        Fri, 10 Apr 2026 02:36:23 -0700 (PDT)
X-Received: by 2002:a05:6214:3a89:b0:899:ea4f:12f6 with SMTP id 6a1803df08f44-8ac86285cfdmr31566926d6.35.1775813782540;
        Fri, 10 Apr 2026 02:36:22 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:22 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:05 +0800
Subject: [PATCH v4 30/39] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-30-b20518dea8de@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=2242;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=HNW6+4ELYah4hoMWWjK4ifF1ZFGIAFGBz4FjvX3SfX4=;
 b=RyKQ2XP3zT8/QWCbbMypHlSFYRjXW/EA7xCX2jtB+ehOrBxDk5zacjDPCR8HoRVeERcjV1bpX
 teuIZx+8xt9DQke7CzHoNE3/AVpCaZeyO9t+32DAZ/Q3AShDVKG9Szt
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8c498 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6cFZRJIsygQ8aEszaMkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX5E0eJvGwqZP/
 SXaO3lgVP2Agf9HWwog2YF0qJLz59Uak/S5lYTy/emDPqOscf4b39wjqhH5jCD/lhOvlMGl+Hwd
 m1sY1od40ET2lGoQAx9zLDP4RcHiF9cT7py0eEokw88srVaQMoVfxohz0AhxIPRaiGOCXmiCUow
 Z/z4vaX2Zn8XAJKe5poa/sWzxbeqg3myaxF2HIKMC63t+2CIUf3LLkpKcvO5HqIr1e0LSQ+NupM
 5Mf1UDY66O2GUr/98j2UOtcrkSQ85GEYP9aVhWTf5sU4sXqTAhT7I6zHqmk88LvaAheG/blIhaj
 9koIqcHNobxNxi/5ARDtfTsgl46bw7IJ4DophcWeJPrQg2bGWmSVjKdxDJyeX2WsvIryZk6XSzk
 gWPnLcujXL37g8IptYaV6dCBERwWjJhiVv1WGnXk8QR/XZqMiHzBMivmS6lPmkoIHsAfG11ZnA/
 cOUWl4F9sjHvkleHS3w==
X-Proofpoint-GUID: a75o8skMieb_OwR9o9TJJIRVjxPupMd3
X-Proofpoint-ORIG-GUID: a75o8skMieb_OwR9o9TJJIRVjxPupMd3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102653-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 011873D5239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index abf26951819a..1f26283b2dee 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -571,6 +571,30 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[0]);
+
+	if (IS_ERR(dp->panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	/* FIXME: move out of panel */
+	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
+	memcpy(&dp_panel->link_info, &dp->panel->link_info,
+	       sizeof(dp->panel->link_info));
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 2548f67cd441..5f3ef295d710 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -59,4 +59,5 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0


