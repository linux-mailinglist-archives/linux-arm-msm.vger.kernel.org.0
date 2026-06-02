Return-Path: <linux-arm-msm+bounces-110782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOOfGi6hHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:23:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7DA62B670
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 810FB30451ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BF03CB8E9;
	Tue,  2 Jun 2026 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXY4wOTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGXdDWh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7C63D47C6
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391517; cv=none; b=kSHY2DKebXSBIzTptGVpJyts7lgnQUuyXRPFM9N+/AFbbPVYFY+zrKJNi2haPdU3AZDx+/qYkemgK+LIk+TVL0vF/bQF2ku/vSq1O8nUGHXamMTpwNhcBWis0kFfDe7elJSbQLLJD8wkTelXTOzR2ALWFm78fdWe5/w8r6rfDtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391517; c=relaxed/simple;
	bh=UaT/1/E05CYDg064KZ/+/vx3fX/KlDmWiJULn3OKuWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/WpuJ9d3+gvLef3oWlKPHCfarfwqhlMbrTZL+PgdlCmOAgu/YPXBZcBRqcOHroZ/HlM51Vor6iKE4SXaeL7ab5LI1a8FUAaGgW0UGk1/8gav5I/E9RJ51k6cvnIqmsfMDFM/sY+pKOPQ95B5HBwgmw6rm+tjzY4TwYh2ElfGfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXY4wOTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGXdDWh+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6528QnYV3430226
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NaE5h732hDoKExFZJ0IFYAnF1/2ly5i/KuKrn899XBU=; b=YXY4wOTKfWxUh3MX
	G0pk5pl33KEHGfFtIcs7sX1dFl0nMLvLEP6E+3buRHZq9vyzG77Jbyk0uFGI7Tcl
	IwbxIshdHa+FOWjJd2kzFUuWF/mRDuUPe5mbyZXYVM76i4fIrfufMecfRnJ5+v/h
	goUfoTUGk4qMCikDNlRzrw3RIDohZjD2vb6lwvubeCYZMLfUZ7wkMZ8SXAy/+I4T
	CZGIVj2wOfvpi7IcKH4DbmbIJe2zlvz8BabPrG7i2sLsSogBsoA7fBo9ETbs6E/N
	SR7bmAYiBBgjtsw5VqLuk5uK0lkZCFFPVG2GV68PmmGNKT1UNBBjkVW1MK8muRy7
	aVKi0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mhq3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:11:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176d949c58so7977591cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391515; x=1780996315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaE5h732hDoKExFZJ0IFYAnF1/2ly5i/KuKrn899XBU=;
        b=CGXdDWh+BJDjqBpfbcwLERKw3ckHAfKsFjw1AetiRc+YkDnm2qj/JAhbh3NqAyYyOZ
         ty+wFwGS+HeNnfiNVqb+qnxn1OkiBcT9QYCaDL1covTNzLtsyaE3NNVA+gNYRlzsSUq3
         qGK3RMkkDmvla7qNs8KB7b35bKuDsv4Ex0oVz8/4oHApy0Nh7GMP0a3VWz97NzhrvxPI
         2QH7ecEj8zLP6zpeyGxaO6ZxAJBgceHpXXUfp33jkHAoofA8pvw/3upkN7KpQ4ljkhcm
         HbWCIV/vSChjzjywLnIqI5zOi+xXLeydkF+EwGIWJtuhJPEpLH86Buxt7xousb5570dh
         1Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391515; x=1780996315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NaE5h732hDoKExFZJ0IFYAnF1/2ly5i/KuKrn899XBU=;
        b=VcgL7v89ymuYJznPuqBtjOkfsaqVHk6bRazLwcAGD8fvWUyRLJoUtC2dyd2TxcM0Dd
         rvRBd/HYURV8kkdy84/VKs1UhTgqAlxEStRe+gr8k/0U8LybTOp0GLdmqxFctQE2E3er
         61xZhsIQSbgEjwZEDLKbZb9ccxfKWHRsaipdmQnC8Eh2pL47Rm5nFmkw92xOat4EONnx
         zq0FgvXl1qdSIIyDZedZj698aeG772DR6A7zsSngohvujULgzLa+o8r1GTiLvhLkN1xx
         Z5GgHk98RfJ5kW66yVYEWIZDsLrZX2tZZCZM5ZfN8lcWxC00ipqD2NVB4gyc/rXgUHC7
         OIpg==
X-Gm-Message-State: AOJu0YzpODhltmOyEXi8ecGsnkzYjFtDoreHEm4KsfvmquZp/MsEsbhd
	0wTdKZrfrOfs7jBLfBo777FLf3fZS3iQYXGzPTFOKyakytknQQV1pCSgy1Rs5rre1K2NRGcp8Iz
	2lBJ+cclW8Hz6ss284ouX5g6k9DHvvZcYBSN0pgushdQiZTI5eWuQe+tqv2yHHZsgD6Z9
X-Gm-Gg: Acq92OEDQIgX+PUQ9OwGs/XsPaqSc+grrX1ve1UleakAn2n8bR4N4Ow7LEPJY+wikaN
	jvBAg/4ZAcTAnWKKNwWIgLXxNXUohoKYIASsImXgOo5aLf12Z8LwQK7lcNxIRTiJbMGsfiYJICz
	VkN5WF+6jdegKwXg+e7aEUWi3ey5BEIJqhp8sslx9bInnEr3vpe9outTO724uOgQUuDKhNqhUzR
	XHqWoQymaGBJ1hxU2gnQuD/qZcK0CpP8nn27rpQ2IAiyo+Z6fSXAuOdlzFlmSsn3BQC9WVnBa5X
	7W0eV7fiqP4cw4axHRupxp2V5LN03la7tZ+2FhyDt0BfRFiDp6Qs/Rm71aK0d2NXm3k8WprWOmR
	eOd4SSB8d2jQsGIdF5SNIc+84lJkZ8rKAl2WC44sEDXdGsilIgAVwd39DdzODlB1wh0GMMVwBVR
	n8fWwxSQ/3YdnsDC9xvA==
X-Received: by 2002:a05:622a:5c16:b0:516:d955:ea6 with SMTP id d75a77b69052e-5173a67b6d9mr228737021cf.14.1780391514670;
        Tue, 02 Jun 2026 02:11:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5c16:b0:516:d955:ea6 with SMTP id d75a77b69052e-5173a67b6d9mr228736671cf.14.1780391514240;
        Tue, 02 Jun 2026 02:11:54 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:19 +0800
Subject: [PATCH v6 07/15] drm/msm/dp: move the pixel clock control to its
 own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-7-2c17ff40a9b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=4116;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=UaT/1/E05CYDg064KZ/+/vx3fX/KlDmWiJULn3OKuWU=;
 b=pXXnr4sV6x3w0BqHmYpCW0puPOY9afsmy+fiq1U7KJCeiclrWdmD+o0hAUYlVFWTfxehgqSSl
 7HVICWYZPaEDMXk262IaFXRvQb44qsL3sPNCBIBMB/VVmzEtnAYNNbL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfX53GBp42gTKzx
 njRqC3K4bz6BGlHp8i6zcrsTPC2MR7xS/GIzRmDs1rKBOszbpF/bBdSKWVRMQTHrzUq/T8eBgvk
 IU6hCfmaSsUilAkRK+dJOoyoV2SdK8QxlNzc5lLWu4RNaiIaD08wMy0XT1wfQ8fAeGHe+22+pbr
 kfzWSiAWnq9953kq/DCsk29CH6Nz96CxBXiYuPeLVYDmO7kXiSYEGGGWpP9krHbeM86WANhJjnP
 oxo6LnFihl8UW4NNt4Nroef28dupB4Kw06omHSNo1vpux0NhWvWqKDpUQ4ZoZ2HkxjZ2gb3t69r
 GMeC6td7u4Ti1xM/lipb0WxNEogXzWqvUJVuQHSKB+jszXh/MbJqQWDpLikwqT3HSmNOKtLkhJJ
 wA/T4TSaFrRMxujpIg+Wy5UT+ho/8M8i2ajsTpOA87TsrB0KWshG2EdOhn7hJfPSYGg6/TrkkWU
 jZFAiV3OD/YUMgypjiA==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1e9e5b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FjMX0bmgnFGAle5WrLgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yuCo0UgsUvJCHuNx5QO_Kk9itMf01pMa
X-Proofpoint-GUID: yuCo0UgsUvJCHuNx5QO_Kk9itMf01pMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: DC7DA62B670
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110782-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
index 1c2eccec6ec6..ac0a2c387f03 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2171,6 +2171,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
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
@@ -2196,22 +2232,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
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
 
@@ -2514,26 +2535,13 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
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
@@ -2572,7 +2580,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
-end:
 	return ret;
 }
 
@@ -2620,11 +2627,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
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


