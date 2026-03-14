Return-Path: <linux-arm-msm+bounces-97655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIqpIN61tGm4sAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:11:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB728B2DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E8E730CD1E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771592D47F4;
	Sat, 14 Mar 2026 01:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUC8pgl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQAvzxl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9CE2E62B7
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450587; cv=none; b=hrEs5pYDtK7Zt41tETegvfEmqgFOsbuBAvhIUWzSvYDX9qUIziEKw+JbNjnaqR0QjFg98VFl9Su01u1MYXoyxM9eqyV6w2Hw19w4dUNelxXZGm5OKxSoQUgB6eg7k9r3Mk6TayZP3ID9l0PvUE2wY49jcKw/Blb0vUP/RZ29+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450587; c=relaxed/simple;
	bh=MDe7U9RsDHXV+2bJl632vfxF4W9rCCfL29yWTM6+O4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxclFSbaKFLqwM66F1xs/eq2gArrpKGQO2tbfytnqoS9GNQ7CZBJUALCFfmqd3+QMkJ653dQGzLOFbg43OpDTdqLfJ2+XuA8h6B+hzRl4giV9/GP8mTKUYKB7co/wWdZBPKqbk0Loyixnot25tzvNu7H6Z6SZNXa7lfEi7gHiOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUC8pgl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQAvzxl6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E0K5QV2108413
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UrDrn2pfKZTOmcACEWoN/bHKLN3H9Y3BpTX9LllKAY=; b=JUC8pgl4FCzZ7KRs
	nw87nrW3tkrEMfv7lc+oUnPQ0qzlwdJ7nFBtSyqvlRqk4gApfDmFJs+XQh0Oy4qf
	eoGyNm/DMZWESe7QsSp6IgPNIKp+WVilqxb+hSQzMR4Y8XN79TqVSVZ2269QBs/T
	ly237lzgPgAvgBnGQJmDXjRa4qAhe0IdFxSj6y5+ntSIzXHgD/1dkiFHLdlOUyE4
	C1UwYGXQ4wBwJGkoMXpec3LjkK7pFQ32hdWcQsvTOTw+jYek016ETCNp4n1H2qrQ
	8qnj9rl1aYJRdt3gZh5i9bXyYVEi14EpHUVt43wGi4GiGISqfOB5ixrEuKV+2VqL
	RuVncQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvw1p83n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so2128420785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450584; x=1774055384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UrDrn2pfKZTOmcACEWoN/bHKLN3H9Y3BpTX9LllKAY=;
        b=IQAvzxl6cN51y/LBjO0g9kY7lnCAlRd+Sh9sQTqn3aWAx+yUXcKC+FFyz/ityi9rZc
         qDFqZP490hNgwZNe5Qu2BJBUVMewY4YInMXnywyMLe1lwLtuRELLAGnTDhLfYBKzjtm4
         BLOPIkJYyOQNb/LC0etquTxOeQjWQD8nsLH62a7SM9mLMO6woZeA4daQcKKQxsQifTmy
         KK4zgCf0RUHjvseByrMa6YhJ19WRsN/bopl8QX8qJp6yAFLVqRIEauFY0DWHRerwRgeP
         fUYf+urthOglCJZZ7cY1t9AWxST9otylq/zvrU/TmqC6DKpadtX9JOcKbVK9cSkSjw5n
         qphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450584; x=1774055384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2UrDrn2pfKZTOmcACEWoN/bHKLN3H9Y3BpTX9LllKAY=;
        b=jkzT3dUebEfSQd60kbVSyVOz/zXArKL10tRDgz89I7I5str9jVuy9tuNw2xWApYFr0
         0If2U6SspWyovXPUAi5u9DY9o4CIrXlpEE0d1USydub16rA4RdmB9XnCp1g4svY9WYbp
         J5clwdJlQHHSk6BtjOz2+ieCBoHU2VXU0G9oVh4ooCZ+4iA5TUTLpXZelLMMfMwy+SC2
         filJWyQ35O6d9D1ePma7jeLq/PB/osBgbrL9eRLnBTHoj4KZEUHUWY0Wu90KtZSWvdkP
         Gs2UL12hx8mN9MIIXt7xmgxeJ9QUXUassQRVo0tsLMPdCI+2oS1Sgcmwn+oHy5uWpwJt
         ETKw==
X-Gm-Message-State: AOJu0YzjUP+FPXw7wtedIBgxJyzpF6cLvALIrgFcTOWaqPOJ2MFPhYsE
	yFJRTC9L4yCUXFVJq38MrSUo5KUt5tifeBdwcb7BHQ21imf0uoyvvvzCb39dYT5mmDV5rXfdKoY
	sLa8a3eJy4M5A4hXF/B9S8RUJ6Ts/2pnkScZEFLVu+yxCDx6kuXT9U6GPvjul/f9+q1St
X-Gm-Gg: ATEYQzyKxcA3UXxOn1Sumi7eUW1UAbl/4W8bdSeGiJEYe6R+s7JvpSuePmT/40zfEah
	thxanevwZqiSyLAL/+HZ1btUF36AaOpl3y0k9TsovHTgN91Sa5gpQo/MdKculUESSGefMNu1WSX
	lDnyISUpYDizt9v6wPmONvGBEVuOGpE0T78W72tiybYxwFzZUvloaXlDO0w02u5NS9X2/uZzlap
	zFdDgBABrcvWtr6LnvBrWJvgz0OJI/Sd5a8ykoByWKprZJBkN1fxUfBrhRkRqUrdyMYoRMYOpt3
	FAcNgneyX9mXZteyjGw3FQRf8mo5FdzCbA8K1lRlX0Ra9T8sUQK75uuDkzFTWedtQln0xpx21vz
	OMLMkpkD5ncvn39Y63RtIooQ/lX0nklldd4rc2A4BAIWE/kcNwgN6IFkR6HMET6R9uvObbF5FR2
	Z07B7DSz8Zcx1ZHEFICiDywPa0CKd7PhTzwkw=
X-Received: by 2002:a05:620a:1711:b0:8cd:9584:632a with SMTP id af79cd13be357-8cdaa8ab027mr1119963985a.41.1773450584119;
        Fri, 13 Mar 2026 18:09:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:8cd:9584:632a with SMTP id af79cd13be357-8cdaa8ab027mr1119961685a.41.1773450583636;
        Fri, 13 Mar 2026 18:09:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:13 +0200
Subject: [PATCH v5 09/10] drm/msm/dp: turn link_ready into plugged
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-9-0c8450737d64@oss.qualcomm.com>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11248;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MDe7U9RsDHXV+2bJl632vfxF4W9rCCfL29yWTM6+O4w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLU0RN/GdnZPPip1huXxiqgajf+0Hi/LOyBCs
 /hfcNeUNDGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1NAAKCRCLPIo+Aiko
 1cRHCACsHIr/u4TXPlaZL/jz67bawo9+vJfuBxm1A5HZl2NfQiHH7zSFdcEi4BmLhiYIf7nta4+
 f4cdD4Mkn2AXDws1fe7ZQ4MbM5mJIWOUy6ic1Z7wjyn+9DTvp2w2vH7SQd90lu5KIoz2ouiHTKY
 NG6IMK9GU7zcR2twfvMxnEm3GTlpbbsRv9EpkPFy9aQ/XD4tRSUp54ko2YFlTDQFp8CBbj1A/JB
 2k5nAyn9tyyA4dHUfpnChWDAPNHM16w61inIY/xrHUDHlEZ0l4wnZ8Y1B3yC4eDunJyKsdQKq7o
 /DOKTXym0amNnJRf/tX+OshsmQfKxdbX6bBbel/R9PABwHI5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OrPgJvYBRPAS1VfilwVhvNgKwACdQc48
X-Proofpoint-ORIG-GUID: OrPgJvYBRPAS1VfilwVhvNgKwACdQc48
X-Authority-Analysis: v=2.4 cv=auK/yCZV c=1 sm=1 tr=0 ts=69b4b558 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=n7_vWGaP1GUJy7dh50EA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX8aTozj3OUlF4
 BESmlkX52lUSpYDF/+h9psR+SS/hUh6hUKs2Fis8QLqcvr5e0JFAocPTVw4cFxw/qYp8C6em8C7
 f1DqKYar23bERWCBgFy7j+LfNI5ti2oeVTH1btbLynoNoHXTce/BYHK2CLQTwL0Mr5euL4f4J8L
 6imuNvpKz1H2NPBL9AHstHda0cTqmoNqLcVa0vUz7/78M/DUAM6VhXjr43Ee53VSr9eeIHt3mZk
 VzFn/EQr8+mui43/sl9IjoDYSFWOEhIZ2DyY7hzrh0iqB5hdR7FWqxWnt3zL3zChfpnTlGLjb2N
 83IHFIXYqylcsBoeWmw4a0QYgW/aQ+ojg4G+YfSzQsWT6vLUR0koS6HnzBxB/FcYDb/sI2r/us3
 DWtIHuQ7siJ08JFnw7ErX8se9aoYA7sjGmKPloOiuNjWT8Lo7SYkSLn8Iqui+BcTXOx0YIh54JI
 RYAFCPKaIF4zcYZY+Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97655-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1EBB728B2DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tracking when the DP link is ready isn't that useful from the driver
point of view. It doesn't provide a direct information if the device
should be suspended, etc. Replace it with the 'plugged' boolean, which
is set when the driver knows that there is DPRX plugged.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 94 ++++++++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 -
 drivers/gpu/drm/msm/dp/dp_drm.c     | 41 ++--------------
 3 files changed, 61 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b4deeea0ec59..0a38957ea901 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -53,6 +53,9 @@ struct msm_dp_display_private {
 	bool phy_initialized;
 	bool audio_supported;
 
+	struct mutex plugged_lock;
+	bool plugged;
+
 	struct drm_device *drm_dev;
 
 	struct drm_dp_aux *aux;
@@ -284,8 +287,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
-	dp->msm_dp_display.link_ready = true;
-
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
@@ -303,7 +304,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	return rc;
 }
 
-static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
+static bool msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
 {
 	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
 		dp->msm_dp_display.connector_type, dp->core_initialized,
@@ -312,7 +313,10 @@ static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
 	if (!dp->phy_initialized) {
 		msm_dp_ctrl_phy_init(dp->ctrl);
 		dp->phy_initialized = true;
+		return true;
 	}
+
+	return false;
 }
 
 static void msm_dp_display_host_phy_exit(struct msm_dp_display_private *dp)
@@ -366,14 +370,6 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	u32 sink_request = dp->link->sink_request;
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
-	if (!dp->msm_dp_display.link_ready) {
-		if (sink_request & DP_LINK_STATUS_UPDATED) {
-			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
-							sink_request);
-			DRM_ERROR("Disconnected, no DP_LINK_STATUS_UPDATED\n");
-			return -EINVAL;
-		}
-	}
 
 	msm_dp_ctrl_handle_sink_request(dp->ctrl);
 
@@ -392,11 +388,11 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (dp->msm_dp_display.link_ready)
-		return 0;
+	mutex_lock(&dp->plugged_lock);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
+		mutex_unlock(&dp->plugged_lock);
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return ret;
 	}
@@ -406,18 +402,16 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	msm_dp_display_host_phy_init(dp);
 
 	ret = msm_dp_display_process_hpd_high(dp);
-	if (ret) {	/* link train failed */
-		dp->msm_dp_display.link_ready = false;
-		msm_dp_aux_enable_xfers(dp->aux, false);
-		pm_runtime_put_sync(&pdev->dev);
-	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	/* uevent will complete connection part */
-	return 0;
+	dp->plugged = true;
+
+	mutex_unlock(&dp->plugged_lock);
+
+	return ret;
 };
 
 static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
@@ -446,8 +440,12 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (!dp->msm_dp_display.link_ready)
+	mutex_lock(&dp->plugged_lock);
+	if (!dp->plugged) {
+		mutex_unlock(&dp->plugged_lock);
+
 		return 0;
+	}
 
 	/* triggered by irq_hdp with sink_count = 0 */
 	if (dp->link->sink_count == 0)
@@ -463,8 +461,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
-	dp->msm_dp_display.link_ready = false;
-
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -472,8 +468,12 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	/* uevent will complete disconnection part */
-	pm_runtime_put_sync(&pdev->dev);
+	if (dp->plugged) {
+		pm_runtime_put_sync(&pdev->dev);
+		dp->plugged = false;
+	}
+	mutex_unlock(&dp->plugged_lock);
+
 	return 0;
 }
 
@@ -820,41 +820,49 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	int status = connector_status_disconnected;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
+	bool phy_deinit;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	if (!dp->link_ready)
-		return status;
-
+	mutex_lock(&priv->plugged_lock);
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
+		mutex_unlock(&priv->plugged_lock);
 		return status;
 	}
 
+	phy_deinit = msm_dp_display_host_phy_init(priv);
+
 	msm_dp_aux_enable_xfers(priv->aux, true);
 
 	ret = msm_dp_aux_is_link_connected(priv->aux);
-	if (!ret) {
+	DRM_DEBUG_DP("aux link status: %x\n", ret);
+	if (!priv->plugged && !ret) {
 		DRM_DEBUG_DP("aux not connected\n");
+		priv->plugged = false;
 		goto end;
 	}
 
 	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
 	if (ret) {
 		DRM_DEBUG_DP("failed to read caps\n");
+		priv->plugged = false;
 		goto end;
 	}
 
 	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
 	if (ret) {
 		DRM_DEBUG_DP("failed to read desc\n");
+		priv->plugged = false;
 		goto end;
 	}
 
 	status = connector_status_connected;
+	priv->plugged = true;
+
 	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
 		int sink_count = drm_dp_read_sink_count(priv->aux);
 
@@ -865,7 +873,21 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	}
 
 end:
-	pm_runtime_put_sync(&dp->pdev->dev);
+	/*
+	 * If we detected the DPRX, leave the controller on so that it doesn't
+	 * loose the state.
+	 */
+	if (!priv->plugged) {
+		if (phy_deinit) {
+			msm_dp_aux_enable_xfers(priv->aux, false);
+			msm_dp_display_host_phy_exit(priv);
+		}
+
+		pm_runtime_put_sync(&dp->pdev->dev);
+	}
+
+	mutex_unlock(&priv->plugged_lock);
+
 	return status;
 }
 
@@ -1123,6 +1145,8 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 	dp->hpd_isr_status = 0;
 
+	mutex_init(&dp->plugged_lock);
+
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
 		return rc;
@@ -1353,7 +1377,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	if (dp->link_ready && !dp->power_on) {
+	if (!dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1398,9 +1422,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display);
 
-	if (!dp->link_ready)
-		drm_dbg_dp(dp->drm_dev, "type=%d is disconnected\n", dp->connector_type);
-
 	msm_dp_display_disable(msm_dp_display);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
@@ -1498,9 +1519,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 
 	hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
 
-	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, link_ready=%d, status=%d\n",
-		   msm_dp_display->connector_type, hpd_link_status,
-		   msm_dp_display->link_ready, status);
+	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
+		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index d2d3d61eb0b0..0b65e16c790d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -17,7 +17,6 @@ struct msm_dp {
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
-	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
 	unsigned int connector_type;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f935093c4df4..8dc0dabd275c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,36 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
-			    struct drm_bridge_state *bridge_state,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
-
-	/*
-	 * There is no protection in the DRM framework to check if the display
-	 * pipeline has been already disabled before trying to disable it again.
-	 * Hence if the sink is unplugged, the pipeline gets disabled, but the
-	 * crtc->active is still true. Any attempt to set the mode or manually
-	 * disable this encoder will result in the crash.
-	 *
-	 * TODO: add support for telling the DRM subsystem that the pipeline is
-	 * disabled by the hardware and thus all access to it should be forbidden.
-	 * After that this piece of code can be removed.
-	 */
-	if (bridge->ops & DRM_BRIDGE_OP_HPD)
-		return (dp->link_ready) ? 0 : -ENOTCONN;
-
-	return 0;
-}
-
-
 /**
  * msm_dp_bridge_get_modes - callback to add drm modes via drm_mode_probed_add()
  * @bridge: Poiner to drm bridge
@@ -62,12 +32,10 @@ static int msm_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connect
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	/* pluggable case assumes EDID is read when HPD */
-	if (dp->link_ready) {
-		rc = msm_dp_display_get_modes(dp);
-		if (rc <= 0) {
-			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
-			return rc;
-		}
+	rc = msm_dp_display_get_modes(dp);
+	if (rc <= 0) {
+		DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
+		return rc;
 	} else {
 		drm_dbg_dp(connector->dev, "No sink connected\n");
 	}
@@ -92,7 +60,6 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.mode_valid   = msm_dp_bridge_mode_valid,
 	.get_modes    = msm_dp_bridge_get_modes,
 	.detect       = msm_dp_bridge_detect,
-	.atomic_check = msm_dp_bridge_atomic_check,
 	.hpd_enable   = msm_dp_bridge_hpd_enable,
 	.hpd_disable  = msm_dp_bridge_hpd_disable,
 	.hpd_notify   = msm_dp_bridge_hpd_notify,

-- 
2.47.3


