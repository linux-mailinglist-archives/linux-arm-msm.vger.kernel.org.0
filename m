Return-Path: <linux-arm-msm+bounces-110093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BJeMjQdGGq+dQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:47:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A2D5F0DA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE5D314D356
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407843C0613;
	Thu, 28 May 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1WR8qZt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/kMgkY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902943BF69C
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964869; cv=none; b=Oguh1nWNm2nb0Hx+3vWcL5C6nWH+kIIeJFGb4JdIjY+JSUDxksUXSRVCy7vAHQFppYdeS5fMN/wSEjvNozy9fmhWhVjNWU/wxQm+xNyVQ+6uo+9VlOFCpbAZ0YC8oK2+8+UYNSuzfoQ4jvWi0x4KpC0fv0kGuXutHawzrI9Nup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964869; c=relaxed/simple;
	bh=S+ko8gfgb1mb/Dv+kOg6axgerBOVHS4WNYhG4rO68xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XoVCueMadqqL+TVC5CYVz9/d8HziT+81stmtStqE0wg/RAM6ktAGrkH7b0mW+7tuk/lxmpT6Smw7bHHQ51kDenJbm1GqHNK7FOaeWcHEqFKka2LNfwnYkrlZLAofcVeA6Re4WjQF/q6lBKmd1wy0qer1AWxOQ9QYPpYsk/nrZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1WR8qZt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/kMgkY/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vPOD3545377
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7wI6jvNGSR98bo2DUVRgJiWXmNW0I3KbQXB15AxathA=; b=n1WR8qZtX+7708X6
	U9e/PjhbdIZgeerGiCZpRpWQ522uL+jlqznwgZBVknNkCcs7D5gWddWppH6tHtgS
	IsZ4sDRhjCO8oitoX6yJeQ8Q7Mh6yluCyu7PxW8B+9bJEfX4up39rGsXAaLmMTve
	dlgnmxJ2cgDQwX4i10BfZHr92kJMfysMa+QpEDMScIGnSlFMIieWYT1DPBiKMtDw
	XRh5Y4V8XLws99eLf07IpDhOnOi4nHOU188TN08aZUs6zJ2OobUoyyAW/W5DUr4J
	K4GKIVHrpVaRC/9nmkgDmPJ+fAmzwXJYK//EC+XZ6Wr5CUBNe8NX2TYhbHGkvyYQ
	fmfP6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3tddn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914b9dee344so1066259785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964864; x=1780569664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wI6jvNGSR98bo2DUVRgJiWXmNW0I3KbQXB15AxathA=;
        b=f/kMgkY/LDNS3pPbLHH6U1K/mCXySAa08w45/8e/lxnRuZZTjF20r9KHsb3RKfDKLN
         qn3S1yTvN1SUkzAbr2S7aWv8f+xXe25eoE6KweUPpZ84cMnk+b7z1ffnnCSbYo9YXFL1
         BT0MJRuvl82sQsYk7fWR1D1H+0t09EcnO1OlI8nuuk4SZmj/eJjHhuyQw2Mt5uE3GUTx
         GY87BRaT9oghgty9DOGdnDwzrvGp/eIzot2FhlPawwuifMa8gzb1HAlVQ9YJWC6KDrxk
         0BtyxswYqmvI3MdzTtgS1XdALNhs3uWNv5srZLnDna1sgHIYvTkzOHyNad4LmAmnAPH1
         4OEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964864; x=1780569664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7wI6jvNGSR98bo2DUVRgJiWXmNW0I3KbQXB15AxathA=;
        b=Rlnp48GACkCDOYMXdyklwOCReyZyVxvOLwM8ZLR2MMrYmSACvgWl26QDHzTYicPlP6
         fSAtIIRXiPEbi+3c6tW0a6IXc2s54rsvHSV8/dWaLAZLlh6Ak72S8HlQQVOuqjBfwkjd
         5d+e3BpkybqlpWZD0tq0c9dRFS838Dx58OfTLKrZOYyGumDTdwFqkPTogkcSjITY9oZM
         xxM/B83SVEHTpGmCuODN220FI3hBcZJVsi/MBjWHByTbkgfRAh0QayoECEvLdH0JTy/v
         pZCXvjZ5yEjrPl5xXgJyN0LzbXOQ2dgCUkua5chgKxRLuPBUC7m0V12YLWkHwvAvUV/S
         0BIA==
X-Gm-Message-State: AOJu0YxxKjvG6Eya2VcZ5V5ClXusTXwwoCUDxh1UxYNZ59HkIGpqjg4m
	CGRye3uZRlKm6XJta/2x0JoBLtmyiRBpUqibm3yIBfE0D680EXaRow49IO3mZu6UTcKmjCRcf5Q
	ltWQ46/ucFxYcA2rXtzN7XVLCUb0Qd+8LxlUypOjcHB9PuiXEi4ntqI2rV5Hj8szhh7eQ
X-Gm-Gg: Acq92OEn5tDOGiBHBAWksA5v/S9R1CBECvh9v0e8UD4BPMk93dwMZcYaoUwo1HLN1S3
	AIlssBscHB5mA5TQR0Di9fPUB/Jd0II1VpLVBA+PZ7l3PT5WOEwuKSZ4g6XHqwbHnaQgUun7Py5
	qnSvWQLzJje6XFDbD252Cj+Z9eBxA0pnUyFTuF3MNn9cVyTgKRKj74SFFQn2AQINU8PI5GhV5Bq
	muUdLi0MR6xtru8bpyPPd02tYrcz19Qo31saMR5eIdguq3Br0G/nl1OV7PkmKPB4GONQt7fJ3/d
	goDnG1FBRoT9oI4njrZc6Ik2mO/4bHnLBEgv1lIQ+8DuTCHeB9H/mZpLVaI8ICKyQ8q2hu2aOO3
	MRtawEr74UKU8r+Yr4JSkpE+LzS4KacpayeypYHKqcCpje4gHcqrSfQW0ZSB6LSSyQ1zyO5DTj8
	MxRjxIYJOQnHixMcNm+Q==
X-Received: by 2002:a05:620a:448e:b0:914:7b4f:cf6b with SMTP id af79cd13be357-914b49d868cmr3771421885a.44.1779964864629;
        Thu, 28 May 2026 03:41:04 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:914:7b4f:cf6b with SMTP id af79cd13be357-914b49d868cmr3771419485a.44.1779964864203;
        Thu, 28 May 2026 03:41:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:41:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:27 +0800
Subject: [PATCH v5 06/15] drm/msm/dp: split link setup from source params
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-6-a9221c1f1f3b@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=1402;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=S+ko8gfgb1mb/Dv+kOg6axgerBOVHS4WNYhG4rO68xk=;
 b=nj8DZNQBAG8Yv1jLvE8uPR2T+66yfBe2XIg8TCJ0m7qaMRXMPXthbOtz8NdPcHoR5bBRo44OX
 FXMYyUE+l4qCi2Bi0FgC9yWHqP+bT3ujFg8MSoJZ1JdxEGNxFSHYrLa
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: mtDMgr83sx83iYIH5a_W4AvGqfuI0_gQ
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a181bc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=saXSvH3Ee-fMY4W8qR0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mtDMgr83sx83iYIH5a_W4AvGqfuI0_gQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwNyBTYWx0ZWRfX0pltQudNTFG2
 LA1G5vRi+BW2+/tdVyDIW4yxNi1IL0cB4RYEA7U5MSxDWzUYzoZG5LPxNpXy+t9VAHEn4u+E108
 t7KJ0ONddhsJ7F7N50U8SKMV8Tfhp19sJhSq/1iYXMNJTATSnsA4/TPPLUD0tI1iTzWKs5ElV94
 Q8Tea5uit7oE0MlNBzojNvxCGaJc4m6R/btkqEsfj/IKDqCpG+6QNtYfmuvx350L/q5Bki4xbss
 qBHtg/Zh95QXr9y/HwwxZGEuDQlU5HIrnQuB4HRM6l9yqdvNBQ1LBxTTq8nl1pMzUUNZVgNT0jd
 Xrk6Mb0Ye6XovEFkSd5/dLPuuwNbbKM5faQ703puk9IuS0v9rFt/5H5yMVdA7uz0pq5LWQrDLvU
 4e8CKgqizz8yo2BnZ84qhnFUo1FUrUHE5IUcoyuWcT6scCq8PeXgJD7KOXI3sOdgTbHcxl+vBwz
 mIKKwaPsAb/SuqCMXYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110093-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67A2D5F0DA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

msm_dp_ctrl_configure_source_params() should only handle stream-related
configuration. Move the link setup out of it so MST can program link and
stream settings separately.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d4f48669541a..b22b3a0df313 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -483,10 +483,6 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
 	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
@@ -2552,6 +2548,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	 */
 	reinit_completion(&ctrl->video_comp);
 
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+
 	msm_dp_ctrl_configure_source_params(ctrl);
 
 	msm_dp_ctrl_config_msa(ctrl,

-- 
2.43.0


