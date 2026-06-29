Return-Path: <linux-arm-msm+bounces-115134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PP+4F22DQmqU8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:38:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6B6DC25F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:38:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ax4D5Bf2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M+vsj4BK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115134-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115134-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3429D3263F36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFC2410D34;
	Mon, 29 Jun 2026 14:15:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C3377EB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742537; cv=none; b=WAcEFjdqX7n+Ghzko8/vNzP6irR9ZVA9/psyPEpLVGuvkZ1hyLWy4k11SJ+lB2gdyA70qOgREGdNI84htRjPF4//PHeb91suM1uw+ggEcTD4W00Jaxg27DuK5gxkmjJqSsUNNqfm+FL7/AC1Sx7jaw6iUMj9gFoaD/JN2MuA7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742537; c=relaxed/simple;
	bh=HrXfxA0vQxpfmNwi4ljkU3JeEeN7YnnHIMe4CnuWbEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UoDL+VGyrttxR0RwEI93+qxz/+H3fKrqAuDzDTKzZVCM2BJUrfVVLmRTvTxr+pJ6fw009hQtTveGrjlN1iGblkbWhCrogsNT82H06xvQ3lHWiznJaSy4SrBpQn10Um74gANtDCzac4Ci1ECywfOIAuUx5mrci5aWzlScskC7Kic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ax4D5Bf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+vsj4BK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEWi2579138
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/poH3AEjItoo7L5qbK6e3dZL/yIyyfNWIp0WMuk8fQ=; b=ax4D5Bf2/vxx3eIm
	6bBczGq0HB5eg1UImixPzrNcR5vczs0kiHokl3duyHpYZxsFz2kyZbvfQsgFZfYL
	gRooDriO7rBmCicKoqTKSHIMpFb3Ct7br/Oq8tauSCbqIW3WomXFLEpSdpoZD/xO
	O0de+F3fs1Otkebfu9Kni98f4drypikYaFNjCFjdL9An2uGHkqvDnCjFpQsFPwSH
	zfFpWwAE5AwZgE7av4R0BUIY1PtV2g6PBPvlMsLVA4Vs18MChPZpQrw5fbAbIAYI
	djY1cBPo5LdLJPH455+NbRXJjsl1uJllR6qbAK+a45Gmg16RKSYSlHDWd8ttJqo/
	K/f71w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hqst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dae6572676so45378426d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742534; x=1783347334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/poH3AEjItoo7L5qbK6e3dZL/yIyyfNWIp0WMuk8fQ=;
        b=M+vsj4BKVr96n2u8u9KuZajmBOv96X3r4LCSNO7tFsF3rr74JB6ip84vZrJ/SFP1GW
         YNN0G7Zuznf+Q+Wnpe260wshhLP4ifxJ94sfHZ/7z7RlKLyKDSwNs7D91TO01WgVR0yM
         iyJX/HXrKHyttcX0IIim7PfSbjSAThKRnvEbL2qJtmVVkc+qtye9Ireljq+11UrIExPo
         k7OKKaMbq+jr0PgZNZXmYcUK1I6AzOiWzCKQl8m5c2/6DWSvhaHr79v+7lVF+bnWDzZA
         bczRN33TsYSEKkU65BGZ1hVE70D7jBgOfPklk4YA+z6M9yN33nUq6iOr1Fs1N1veD2Vc
         qL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742534; x=1783347334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G/poH3AEjItoo7L5qbK6e3dZL/yIyyfNWIp0WMuk8fQ=;
        b=PvUSj2fQ5DfLP8uTrUduQ8UoEKr3caobFzD9pBTYApT792eDv3L7w2RmkSZ9Bvm0N3
         2fL0EKor6BIgs1bE6PHjrU/2rbQkswAqwzkpc7JERcbTU0KxFho1y4XRSiUhXzSelfqY
         j7AH/fJOWanpuGs7a2X0P4oiVfzJ8GoZQHAeg/ObKkWl9jpsh3NsXUPj1LCVjt18OOHl
         Y7l3GURM9CVETI/xNQysHgR0gUJs0PnDXbKQQE8LUwXYjOV8wBQCFE0FVCziQarG4woD
         N/uMEiptMXYPRyasljA8XxaGBi/IM1o+P7Xjls4W42oV406w4MRFci5EKiWtsuQ/AIxY
         LO8w==
X-Gm-Message-State: AOJu0Yx6ow12Og4O4KsjVy4451KqaZBf1tah6HHGZplXwhLCVR+Pf8lp
	D7sTykZJ9rfpx4dDVNU2UhNy+Z34x0EFCIyS13WbW43mgmBVTZNQ91BuiWY8qBprUsDqvCofuEn
	/5NGfKCG/SF7xvch2/F+Z+oXwYpfOXvE79TNybgVaiP0cKy7S0vnpYCQrtpXabsoX8Yq4
X-Gm-Gg: AfdE7ckiqb20NpF5PqRlmE2OAwberAgOE4MLLriVYssLzttSQjQaa6j35TZThG7YvcM
	eH/I+dxgs2GA+j+gEA4Q84uwtAG+PR9dorEZpiSPG5fV50342VhKABblQB4HoXxh0IsA/JfvkqF
	gAMN7XYhPe8bck9PYQcys+bAho1Y2Qov/xEMUyM9jBWpuoAr9L/e8tU6beva/25cGnfdtUdN2pH
	XYPU1niSjeKioAMMJ+E/sWxaw1TBDJvkVwHqHQ333t7N6WYKUZ3x32PxnT9S7lzJfZUU3JD4rd1
	ccG2a/YT+5TyF7TI6Qt0Nt1plSh7H5Um2io/ZgAd9zS9t/16frdyZsyvD3Q6CJBXMnFShqbd+eo
	+pwabQyJr1ewMsMFOu+dBFuzWRjLZulunZdb6cR2FaQR7mbz+F1F8LhHzogj1Y81vRpurXg==
X-Received: by 2002:a05:620a:bce:b0:915:9984:5781 with SMTP id af79cd13be357-9293ccd3e07mr2348338685a.51.1782742534140;
        Mon, 29 Jun 2026 07:15:34 -0700 (PDT)
X-Received: by 2002:a05:620a:bce:b0:915:9984:5781 with SMTP id af79cd13be357-9293ccd3e07mr2348330685a.51.1782742533511;
        Mon, 29 Jun 2026 07:15:33 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:15:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND v5 06/25] drm/msm/dp: Add support to enable MST in mainlink control
Date: Mon, 29 Jun 2026 22:14:27 +0800
Message-ID: <20260629-msm-dp-mst-v5-6-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=2592; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=Mzn/mLQcqys/EJpBrtkVNH08m5/h5cbmf+/AjWnre0k=; b=6Uft3/WkZ+7eSkUNxcdPQhlD809YEyGDQXGU7xNpVLOWWKi/RrU6CCKccWgm0VLKbK47fHEWN myz3WxIbHvtAFNTJJLy8nX4oSMTB8YYJSP9KVuTn2fa4zqL/d5K6/8h
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfXzqfhQuoutYfh
 DGs47sPQi//ceGUJ/OBFyxuozljzzCstRlfuZ0Rnh0F4X3IAbUsPRU8/LBzDg/KJOXJM5I57OhU
 fkvPu9oOXgPgKA907ZK7N9k2jq6ZGNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX9T8UGRQHZB5P
 T5CzClB/iaCPYLu9LtAwG1UvvKnopcxmIgP6hBczJ6mSVHhLrF9fTppcTjZiXkjH9J/tIJkkJ1u
 LI4BDbQKREWwzC+sSNSz0ZhDj8B8gsM+EuI7z5vFD/2juqIBwwWZzedX5sEuSoiES7wV7R2bKbf
 9jU81IWZ+qIQG7Ly9OTnxcyTB9btoP0UlKfO+azFCPazcJEzVEm4euVXldZIhtHL6c0/CY1TTuo
 EZQvjPao2iH2ChntTty2DkXJtKnCf96BY+CgO+Oime0lO8RCBZpvpVLi34KjLoXp51EnqiYdzUI
 FXtNjOXdD7zGmL+miNjnoDAz9yHGOaXHOMJF2Oe9vBG7rWfcRA9N63Z4N3+pyml8b8TSE4b+lBE
 Q14N5UeW2ZsOjUSV9YviOB+NMf21mSt4R3nGoaSCowvlTQeIesh1B9q4utm8jDdrwY+qXxxHJGz
 SbWFSPjDZpKM/vlLsHw==
X-Proofpoint-ORIG-GUID: qtmpQYIDmn4QA3CRyPx5cXKrlruTe-m9
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427e07 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qtmpQYIDmn4QA3CRyPx5cXKrlruTe-m9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115134-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: F2B6B6DC25F

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6754b10d418c..e9aa0e254234 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -276,6 +276,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2678,6 +2691,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
+
 	if (panel->stream_id == DP_STREAM_0)
 		msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
@@ -2731,6 +2747,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 6808965878d4..deb40ed24654 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0


