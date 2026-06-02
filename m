Return-Path: <linux-arm-msm+bounces-110788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EguEXmhHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:25:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB3862B6D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC1CB30B1392
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EAF3D666A;
	Tue,  2 Jun 2026 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P41Qh0UB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVkTJDM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBAF3D1CD4
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391549; cv=none; b=IlPfnHcaAA22gw+zL+oRLZ902e9zxmQpnwaYHrH7Ukfp0k0ilhf2hQd3iaR0YyTGdZH80+yFD1cun9xatyadx+VKfs8GGGyR6iIXGRXXBJcPP265wL+lFOSMwTxYI1PXeX85SMU34Ogu6JeIZJcAMeK1Zln1Edd2BXUg1vJIm+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391549; c=relaxed/simple;
	bh=rHOJ/Tfly+p+zzltozyn9wJCqcj0lLLdlbTm8fgeIJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=br2pNuZ7gd2KT5OViKJcRgC9z4SiZ3RN8Mdv9QOMkP3bP0FPSv1VyklGucYC4J6Y0dYg1hEyPCUtRP/T7UIvE/xUDJKlFW0bV9Os/pn5tjihw7IUGsOc1jK7vXRW2r5KPQKK7YAmZ3Eq10T9Dd7VnlCVIVo+ibQG+5OIENDuOhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P41Qh0UB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVkTJDM4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526MVen2767170
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrpKel4Av768jUzNR25shjZmFALdbmxo17UJsOuCq8E=; b=P41Qh0UBJwUMVqAH
	+WeQYemVTDFeIzz70XPe1rSvikEx0j/H2iFo6Ncy+IO0JtUewsvD7tNMbuDjd2D0
	gpd0IlJ8zQil0/eGAXTnpgDVz2Z+MQhUeAPCczBco/XY6N3W2Okskto2F3ZnCGLt
	hUfYM2XCv/x4HbOWeXOWlsb2xfd02x3145thAjy1dj3E6tQVsOFKhBRB/OAxHVX/
	j1l5qGd/7XSrWuIrAf/WVAaevTXfUysvc+dbei5zyPaqeXMZAnObYovvjFlBXfBj
	+ZQ2SOUHgZvrl9cTRcGTD2tJeOuDGgTt5013+LJzcA+QJctay9/qgDj6pggtqpQ4
	mSNiWg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0ptb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:12:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51771d41426so4633231cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391546; x=1780996346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrpKel4Av768jUzNR25shjZmFALdbmxo17UJsOuCq8E=;
        b=DVkTJDM4KGaRzbLOUIkOdL/ugYAp7TNLYiiRVjOpokDO3Uui3mbyoAbqyyW+ZxCEB/
         UPZaqh2tytYcXd7e9CSU3QxcaZtXuCg9TDRPeHPwh4U0+6fXsg9jIyuPb5gZbnWmNizI
         sILdPWFBhTDRYkBCTSsaio4jDPiKcMmOy9TW428WFctIEGJlzJAP7deRa6TB2pNEOGZt
         piMdjOXZ2ZGB0RTsVDgE6+TxFHny21xgFbbcwy7ushd7QeYoRQgH20BO8aD9WeqSXx8x
         +VG25ZGTP03hjpT3RypevC9xlLsov9s3aqoWzr1d6uSKkdLOQ6UfmiNzC4kdU4LrF1MG
         25GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391546; x=1780996346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PrpKel4Av768jUzNR25shjZmFALdbmxo17UJsOuCq8E=;
        b=jhy+C0nboFdGEBfcQwI6vooNQDFCpXqplnzLlAAEdyjD2VkwcPe8CxBhLX2uB9xSTU
         AKy3X1VQO7Wc5/Bw55ib6qCsVnUBHNOila3NwiNtIi+ebObLThYPaOQ+l4hFYsNdoSvd
         cEmMgR1zk1/UXCShS0tSE+6FkQDcz6XISB2Pv7bBt7zlXAaJ8kcW4aVrp8FJr4Po/jqX
         HQZmqNkm4//8Q1RPj09IIdoNbJxNnqRFXUhQHMD0DdzucZygohjZSgmvp9+6jVaRLO+H
         qdx71FY2vO3NWckAd0hgoRt0XgNQdowoYJ4IAwp3f9sJbyYACgeoE4ureL2QkCNtraiC
         JG3Q==
X-Gm-Message-State: AOJu0YxYoV9ZfRytzcJJoY28tMS0CqtIbSNKacptsy+DvLbu5BDeR7eX
	INxl/Jwzya70PGWGSoUUSNADjiIRoi9xKLMMKPnGnZUMDEIIe42jSBIuB9jyihTrmqUWthIJkDx
	ino403mu8oGzCqnLMMy5lTyk6qWeWRLDhN84I+Kr2C/wD1PbbdUOO01GbcOtYb5wrcqsb
X-Gm-Gg: Acq92OGhvzLf4usJxmLeDpkZfTcGJ1hIlqsn2AMVF2d62FgZnzCKRUUGYgTQsHtaRqz
	6u1ZN8q8a6sCDc1NUf+o8iaRDz3z+WZ9FZ8EPdJqxKu6e5zYbP+kXDvs4fA7IB5IXOdsJPBGV4s
	K6plzNdf6l17pkOPpjv8bpemFjFIkJgyM4xJvOCSGzgr6JkOsr0ZcYHvvJAQv1UQq7EXc1K2jG3
	BQNWUJHddX3xSLzXsy0KkPjuczNRq2Olsp1dt6lM54rBgZ0VZ2hnYbu2emRb7cZjj+4U/agff1d
	Otw4GI0iMSHrD3fWtSPbz8g0zuYY2zVnGLJzqQWex2a7Q6NwbRqiUfGIjeDfQRPNCpxaxQ1lFFZ
	k6/jTQr074STfhlDiFNkdQCp+Svwz9bH9BE1O2Rb9440PDmCbA4MFWE0uwgDbO8Hvlwc5n2w2SR
	3Aec0+uGkcFxupy161TQ==
X-Received: by 2002:a05:622a:418a:b0:516:c8ec:5f67 with SMTP id d75a77b69052e-5173a84a3f1mr198592541cf.56.1780391545608;
        Tue, 02 Jun 2026 02:12:25 -0700 (PDT)
X-Received: by 2002:a05:622a:418a:b0:516:c8ec:5f67 with SMTP id d75a77b69052e-5173a84a3f1mr198592131cf.56.1780391545156;
        Tue, 02 Jun 2026 02:12:25 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:12:24 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:25 +0800
Subject: [PATCH v6 13/15] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-13-2c17ff40a9b2@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
In-Reply-To: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=8509;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=js7Ds0kDP3MA2PA3qJwTal/QoxqVBRyKdoKt/vuLT7c=;
 b=ZIKUZVz4daNTz0P7bthYlY4nnsEdqpv9D4FX1PiLsqSkdPb+Ap4IAbCOx2h0GKWct4PCbB+Eg
 gACCsLNcWNdCcbNqO9aJtUKjhurRfJLyZAEGoCcgEQSArxbs8jLgRgi
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: _v4FCXbY88gHFwXDDqX3JMtgHW9OzpFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfXwaUKYR0xeNtb
 nmlz3FagLlGYR4PMlTdzh4Gs+60cDpGHyyzQBV6cJbNnn2/pc+Dt48TidiuIFF7XBqjBgWhLqqE
 Os1Rpg62PuSy/ZODBoWkIaouwJ0XjO79O3zdZ2cHfau3EqObwJ/o+k+qu//26n4mFNw3wroE4XH
 Rzcg5RGZWvP4FqlWY6jOtDpQYQ2UAYko49w6rtoCh0FODja5Q1rOEOkD97OcW5JQRu4C5LKTW1o
 ljOOMY1Q8AHpxvHSK6uVxJlmkU6AXgdA4NBKzjonvkCoVK4jXtFyrolPGpmfaw7XTJ2XfsdqaNI
 2WijDzNLo+h1VBv6Ea26RO4lCBRyAHC5EsRqsZf6eebuFaT2baaQivVnVGsA1HuAZROHFXI1WH8
 pXaJcVYxbLXUcFtD+zcURGTO7VYGV1wmBT+WMx9lfpURtuvpOf1ie7A6N4XVxyyY8Kf0b0Ah/bc
 KZijUgngPwhAMQgxzSQ==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1e9e7a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LmD7BKvqrCyCckpIDn8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _v4FCXbY88gHFwXDDqX3JMtgHW9OzpFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: 9BB3862B6D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_bridge helpers take drm_bridge as an input and extract the
dp_display object to be used in the dp_display module. Rather than
doing it in a roundabout way, directly pass the dp_display object
to these helpers so that the MST bridge can also re-use the same
helpers.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 39 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  9 ---------
 4 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 63e5b191f95c..2d5ef087648c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -738,24 +738,21 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
- * @bridge: Pointer to drm bridge structure
+ * @dp: Pointer to dp display structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode)
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
-	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
 
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
@@ -1406,11 +1403,9 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_commit *state)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
+				  struct drm_atomic_commit *state)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 	int rc = 0;
@@ -1419,7 +1414,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	crtc = drm_atomic_get_new_crtc_for_encoder(state,
-						   drm_bridge->encoder);
+						   msm_dp_display->bridge->encoder);
 	if (!crtc)
 		return;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
@@ -1449,11 +1444,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1470,11 +1462,8 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_commit *state)
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 0b65e16c790d..5116f7bbbd02 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -33,5 +33,12 @@ void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
+				  struct drm_atomic_commit *state);
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6ac5bac903d9..6b8923d9dff4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -49,6 +49,43 @@ static void msm_dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry
 	msm_dp_display_debugfs_init(dp, root, false);
 }
 
+static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+					struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_enable(dp, state);
+}
+
+static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+					 struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_disable(dp);
+}
+
+static void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+					      struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_post_disable(dp);
+}
+
+static enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *drm_bridge,
+						     const struct drm_display_info *info,
+						     const struct drm_display_mode *mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	return msm_dp_display_mode_valid(dp, info, mode);
+}
+
 static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
@@ -115,7 +152,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_bridge_atomic_enable(drm_bridge, state);
+	msm_dp_display_atomic_enable(dp, state);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 4bd788ea05d5..da412c788503 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -27,15 +27,6 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 					       struct drm_connector *connector);
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_commit *state);
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.43.0


