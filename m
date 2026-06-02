Return-Path: <linux-arm-msm+bounces-110786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJRJF2ahHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:24:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46562B6C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B21273174733
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159C83D1AB5;
	Tue,  2 Jun 2026 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNRyBhCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPZR9EH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019BB37F72C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391542; cv=none; b=plmxHgNPvK6nMgXXYJGKQch2s/LSIKKLidNUMlDnlvPwYMrs3Rnyx3AnMV8frQdXzw5OuzvNKuwpIxLWz83J7C/1dGeNw856s9jWe5eTrtvoAC3igpVxaGt3KZT/Jwom4rWEkeei4TvqO+Gn2aoYuqa8HCKtyZ3ODZngAdk8yQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391542; c=relaxed/simple;
	bh=7y/nuSMlRJXRRb/ms/qQ1O6YqSZDBnwjUaF6ovcvrkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5hCSRgTbuVST2BcoKGVafFCzGRrw2S8khL/1O1dCkYdzXQ9WTzDvvYNr5gSOD9PSg+yUMw++h5pnUVCcFAjkCaIQaiYlDlQSvkjz0hfyzP+GOee1kOSG038WMnx1mgCiV5VuoUK3aL5X0k6pbgSv8Cp9vLmtlidQ4xCN0cfYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNRyBhCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPZR9EH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65262InF2687950
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pP/YEN94t1y4drOH5CzH4TOHLceSrZCrc4auNY99UvY=; b=KNRyBhCcoQIcRgf/
	bgTKaLmkKeNVAz/EMC848Wawi0l9agrXxpDz9G7i/sifTAmf+ybTGJyAIkSOSxID
	bL+pvBzgchsLgM+WZzzEyLB6cxNkfv3MuIgHcqThcBaDM6JAT+/qWCEgqqVUcMYk
	Ou71Wby4zlbTi6H9N8I82BCRf5qxbCzUZUPcVXUn/iE2n5n2yun/sdqCSrijKKeo
	C249KjHkdyYbycGG2Q3/ul3DlDH9i3QgxwnJP+IjTB4XFX3iITo07bdZltP7Wpif
	6RR5nqvnwQ4GuVCywJdu2Agg5O4geo1EfrHevqX6oKvFHUFm1d+OthcftEGW7Kxb
	/QN0Xg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsja8rms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:12:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175aa1a54bso37103951cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391536; x=1780996336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pP/YEN94t1y4drOH5CzH4TOHLceSrZCrc4auNY99UvY=;
        b=KPZR9EH4SF3VwUcSNhW6xkaaJR97EVR6h1TFO5HlkJqly4GWKJnB9fADSPopYTr3U2
         SHlde7tvT+cx2jQTRwbESSdjeo/xcrHbMSIsQ3IGddvERnXRvBmYCJykg65DwQPjW54p
         bN2pBSo5bZH4A1yxqx2O/ZgHv0g8lYZj2P4KGIWsGfFgZFGjsSseD16zRcjw2XMoAxsQ
         9wrSOENFvvhuwn13thxBD/wBvjT0mz/LmS2o2ygbQpvqy2UwKtUAbDQXABp5D1rPn7Na
         FF4DQS1XhEMdmpcafL+Y5yLHqsF+R1dKEeZn0InLzkPgZnqVOI+LdOSrEiGhmxXxgAIA
         VP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391536; x=1780996336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pP/YEN94t1y4drOH5CzH4TOHLceSrZCrc4auNY99UvY=;
        b=n/d9LNYs5otzS4J3FvVGpu0fp+dr6ycxbAPih1gE12rNscs1lhJOiMBsG735pMl2DR
         4DwQZygC5nr3RxKUZX4QuqSXo/lP6v1xCgVGeEIsd/oiAQk4SdaqsIfcDY/PlIWa2SIp
         XVoWcNJlv+g2CwyqTBx26Gd76WMCfFjGPkY3/w57bVyWsKDAUDuRHvkgQTwFWUYUEJyq
         yzBqWyCYKi2VLX4mX4aV7jWnYU8PGYeNa3nEkHZACVTgKVHvapYZaMLLh1yG6qWlLHuf
         5ZvAM5TwHKQaPZxz5+S6zm5Qxw8Oude3RaAjDARKfEv7UbLssjFjn1sRPmrW61qTUXnD
         1z6g==
X-Gm-Message-State: AOJu0YwEihYde2xH4wYU525yKIF+MxqHrck1d1l9zOnqATRhNFPn3fnY
	T5R/SZxCCRqpyujWxBp5XqHAPP2AHfEHdTExBq3AxxdQJN86JF7iOumor8k4fzFXb2zqN4qjG9j
	NLJPkljegPNEmmeYulWj8q3M7mhs2olEJp9UK+P3EtV+1Le3QheTZ3PohQVaZ4nfJgmc1
X-Gm-Gg: Acq92OHap6Uh7GI4gxXsB3w8UOdKuav4gbOzsIRvOK83TW7TOEIJNqG2YJO79iQtve3
	mOGU5BjqIGOqLTx+iTh7MM2V+uwuMCxDw6KLSrsveLlc6xzjuzsfgRAG3ygKSCqZrOoy9A+McwW
	VSJ3rACdOz0kFig9GezAlc8qDxrGjiVqwJU33Z1BVlch7Gl2mLK42xZkaGFcpH7zQYYiuVZ0kYt
	odaY5olZ+s+r5Kv1sWGrh4VNfx3jvdV5Eps1Bhf9MHo/vgkw00UmLQR2vv6s79oq4pVP4VzSujc
	/FlC6S5b2bmbL2ljH3ewC/pXowHjLoo5N/kE8DFK4OZRaw7A1bYMpISRJ+Hd9NyeycjGlaPlgTw
	gVCzhlT0TwiAyQjKrcp2vt0XaTqyv5wQKgyUsQxqUG115OO49q9pVkLCFYEivuuvZ41wxKha0kS
	qbw3S/dh7JpMwbgitTVg==
X-Received: by 2002:a05:622a:8f1b:b0:516:e10f:b1fa with SMTP id d75a77b69052e-5173a6336d6mr167602111cf.2.1780391535936;
        Tue, 02 Jun 2026 02:12:15 -0700 (PDT)
X-Received: by 2002:a05:622a:8f1b:b0:516:e10f:b1fa with SMTP id d75a77b69052e-5173a6336d6mr167601781cf.2.1780391535411;
        Tue, 02 Jun 2026 02:12:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:12:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:23 +0800
Subject: [PATCH v6 11/15] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-11-2c17ff40a9b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=3896;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=yXTeHtGoeumB61qfMSu4s70qnNcHeimTgjHJ10HGZIA=;
 b=4CiVna5IhAqn8eXmUh3DDUaDP1YSx7SFCAhVi5jOL0G9RpUkR379l+6FAU2Wnz2Ze+wWoQ0vU
 oJ7UZfFNxEeCLAoXayag36/4ZK5b23E3cJHFhZz6xUdkZWKSSTVkwHu
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfXwAPcxq3rx91z
 X39yQrVjcSZDAZDfxv8rzFbIaOeYb2F3zFNCCNzDpQxj0o/tN+qt39HKyXqOp9PQjV3GM3PYfLA
 h/+eZiztbHu/ZvVWjnP1nkm4jbZl/Sr6E8EJhVKeKYGka6q95ZLPnGUB9xtBh7PobSYff4SdP6M
 5R5tdnEZmt987xKNQLvWF6R8YoejoaXidDjn/y0ROWuuoIdb+lrGNeE+otEJ/SHzCfZFHawHom4
 dsFLnU+7qGRtbVRW06ubvjAzM0DgUPhjOGL3dBpjahufvY0Sm9+Wr3ZTmHuzs9fBCoEz4WwEFO1
 e576BzCueFWY521TDtHIDyQ73mpyxi24nb0q9/UgKCGhCHQ+zHMJYk+8oAZ0ooyO474b7IHaG4G
 988c/3kcTfvhZ7QzwTc1TjzCpSc1Ka4+AOXC4VtDNVTRyCeGu4F6KW40+BXGugStDAKDr7g4+TJ
 yvx3IQ3n7ukhQqjHbPw==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1e9e70 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2kxiPxfbkJi5fZIrDGYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WabFLzTzkcWiBCPuzfENwIYP7o3ltBVD
X-Proofpoint-ORIG-GUID: WabFLzTzkcWiBCPuzfENwIYP7o3ltBVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: CF46562B6C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110786-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

Split dp_ctrl_off() into stream and link parts so that for MST
cases we can control the link and pixel parts separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++--
 drivers/gpu/drm/msm/dp/dp_display.c |  7 ++++---
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 902a6f5d181d..c88929d1fbab 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2212,7 +2212,7 @@ static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned l
 	return ret;
 }
 
-static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
@@ -2241,7 +2241,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl, panel);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
 	if (ret) {
@@ -2635,8 +2636,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_init(phy);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2650,7 +2651,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
-	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 00b430392a52..5902cf7e746a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -22,8 +22,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 230e14615a23..8f472633da82 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -725,15 +725,16 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
-		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_display_host_phy_exit(dp);
 	}
 

-- 
2.43.0


