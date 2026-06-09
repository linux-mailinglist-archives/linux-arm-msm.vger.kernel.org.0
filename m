Return-Path: <linux-arm-msm+bounces-112105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ynlXCV7lJ2oX4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:05:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700965EB1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:05:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bcMbUK+F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AJiFGsrp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112105-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112105-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A792930A84A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F12A3F4DE5;
	Tue,  9 Jun 2026 09:47:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D1A3F4115
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998446; cv=none; b=gvvox1QfODeh30ye7vFY6ehekbSfOTLF1bzKXjCCzqQ77if4Ya+oHPuQShXYjlPj2B+M6SLYuCvbc04qRoK+xQxxLMgy9Z5qNk3zieWxlIuhmCicy/hb7vU8706EOMJE5ur2HYNT/EUk3HevXX5xED5ZD7zDvNo3rwNXnHbAq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998446; c=relaxed/simple;
	bh=69/u+u0bMmkeRYaYJHJOVRrxbMKLVJ/mmagPx2f0q9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GAfWfsAuCTgelskw16WsBZzi/gVA0RXC4QTNG1UfDWTiCLosvaNiaSajO6K5COcYzsIiMo+BovcMkQMbtJdjuuWorjZOk3CKdPmHKegUDBSdV2lB8n+Mgy5+bPFO811Oz7eYvh3Dl4SzGmFnc0ggdW1Tl0xdIgrlXGg4GKG3eZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcMbUK+F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJiFGsrp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rh8e2034898
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKV7eY6x0GdZCgdZALVmHOg4bVdpjbHHZgfJ+wEnO1c=; b=bcMbUK+FG6jhBOPc
	NdtnDvNFtKdCu3wqtOBvbd5FpdivZQsF8qJ5KpD6RY1ituoVJqt3/CCksejQjjue
	SNjeNtNKYc2viccLaMFp5fAADE9uH4SEQWoGnMxPMUDMnuTaAibDwNOZSIIVksLA
	fZnw4PkEo+Aqa9E8ZeuZKcacvx7xukeFUxShB5G/EW0YVa8PBMLE0b51PTC3IEdA
	93fIPmB4K7ZIra2DTrbQUPp2otQdgNENkjr/ToljuC49gf/SqOrR3dGENJfuo+8A
	xDqBdu9CHOjOCfh7o0UFvlvVrvHm20HQWrNUz8KXZr9x9p45PjEPX09PRpjgvT6w
	Basvlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearjmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915c8347cd5so532553885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998443; x=1781603243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKV7eY6x0GdZCgdZALVmHOg4bVdpjbHHZgfJ+wEnO1c=;
        b=AJiFGsrpwh3MYJjr7Wx35XQUDKYib4NsWqQdvw71Fi3lVyMYB1U28QQbkTlm6OOK4H
         t/lXDtPTU2zwgF7ZRq3h5X5oU/L6PQ32HZHEYaGSq8tqPCm7eF/A6ZLzn2KWM2D9ESv9
         3C566R3qTCYiiyXV3Xnqb8nLdxg5XDJsRYiK/hslTqyhJpLYdcdEAVsnzXkJimv5RFyr
         1/UYb4q43LUtnVQ18BKesjzrNAt3j1KRts46iwHAx3HbrfOystI70F5R+Jmlf20pVKk3
         QmCPjGbUvcT9G09nEzgRVjc+aG5Fb6tuc04ZLkSj9oku4TucTVVCn0lL8mhe9PbevbOj
         7Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998443; x=1781603243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gKV7eY6x0GdZCgdZALVmHOg4bVdpjbHHZgfJ+wEnO1c=;
        b=HTqEj68qqlHoqbygzQdc7HZZoDIMd0fvP8YF1soR9Wn0XJFh6A1e1XL+yAM7Q9WmOz
         llFWsuzbBUG/pqtGJJUz31fjWoMctROy++qPgH9I13p9xbLBYrboJInTfl8FnpVd28y5
         DmH3GiewklmizARxUXscvCiob1YN8CIMW6gAxqhy23LCtx8IETN2Hi7JKaloXB6IqrRw
         J6nPi2xG6j2WKVuZOuAwGwSG5iafRwCepW0Nq18yrjT5JN9GowzWotoTwWnTe3TR2Et3
         OOhSUB2pxoChzoSQXPqahx5K7D7eZnVlIHL7bcslAX+ApytUQJwcJXaTMgKwJngPVWoy
         rKXQ==
X-Gm-Message-State: AOJu0Ywbh60LsH6ADU6mH3123jtczQgiWnjDKmSqv3yKRVFbaWXbtL0R
	RE2B1/DZQCnZfDbOMItbjAqCB3S2lZhNRpEDF7jEDj9h+8dbU4wb6mxOyqZywGn5aGNPpS8423A
	c6WNARUy5/mjHROhzdK+c0VbjECvYBKpYOKPb3wMVcSdf9DxHxljsRYgKVosMld0DE8hY
X-Gm-Gg: Acq92OGkYYvIfclqGc+AMpUbllMFVLh978RwF1e7syztzMPHEG+wSh6h3Kh1W2WVHpl
	Wk8LBl1l/5c5gWqN04VN0jo6qUcQFxLgXZ3n896cEBU9BiHuUNyH48IOkdfubHnW0GwLTJux39k
	EsOegRb8wKpytR8RixMUc/e4rQB8WtVe+qJZhjIJScg/6jSOSKuwCffZJTdIhiORn5jDR3X0dM3
	ZMEYXqoelCkniAOp4x+C9KtWGkgTHEwS9Kniw68CtHiHi8UikdjwwLLbCBHfk9/QsYTKhG87cOJ
	hFj7/+isA0/StJLE1vztb50sBO83mi/3JCP4c+L7Jxcq5sG2Fk1wzhHNXaedH59bifEnIthpGrR
	C2apxJLbx9EqgbsK7PdEFi4mPwcb4F62R85WwGNYVzcer3cBCCR02AC/M1OBa7xElKPa1kHp6B5
	cKQiSF4rlLB+LaykaXbQ==
X-Received: by 2002:a05:620a:3181:b0:915:e8fb:acc0 with SMTP id af79cd13be357-915e8fbbd51mr258058085a.23.1780998443092;
        Tue, 09 Jun 2026 02:47:23 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:915:e8fb:acc0 with SMTP id af79cd13be357-915e8fbbd51mr258052985a.23.1780998442532;
        Tue, 09 Jun 2026 02:47:22 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:22 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:31 +0800
Subject: [PATCH v7 09/15] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-9-ea04113e8233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998393; l=3890;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=IBykKglaoFNzwzYIynAYX/xNxF8GBX7vWe0UDGG9/JE=;
 b=3H9FfXTCb4VoYZS/ebi0VLBBMD2YLcwDaShY5OWsGKF3aQ574dbqjntxQT6BwaQ4rDhGuMf36
 lh/3dFbZgM3Cml1zghEi4KrjuEX9heKx1rv9IqZtP1a77C9lbSuN5Nh
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: ZY8rCfo6IC7uqGbUqRWxz7OmHcaqkeac
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27e12b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7LH33tsxRIP6uNRhSrAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX5NxFw4J0aowd
 UAAa1eWycb/9peD/mIIXTUYqcf9gokRjfX1/a0nBqxbfvFqhT6cu7Rr/iighAEbzjhoRnWFD6GG
 lt9y4svZmpTgMEo+gCvfWe0CFB2hWhBmpOC4UlzRevWmBqQPW1fH0tpWll7aAGTYxkF2XoIfxmo
 kvDsHPsujKJCNVd4rlMEOBkUnF2ZeCQ21YIFshtkjvHGg+l03wGtnnMWp+iqScpXI0+S50SBGIu
 iX/9pPLx7UcOahOP+FlZ9Et1rA3Yi+1Uiwjl9+Klwyw/gZ1001uM/ziVnpREbJKJPLYOlbDKiDV
 pdBPG9hqjXgsLHdjQjnHa9W1V+zIjIg52AczsNPu3JPQ8KkxYtH8HjVXehXE+PxNJx41d43bUR2
 75hjIJj5pES10l6dCU5JCAScKrT977OlR1+BtCsdB6bFhGro3XDL4NYIW/BG/vfVWj6vFU6oyHl
 sUEry9JaMyqVBoK2xBA==
X-Proofpoint-GUID: ZY8rCfo6IC7uqGbUqRWxz7OmHcaqkeac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112105-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 0700965EB1A

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 546d899dde23..626b95d4d015 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2598,7 +2598,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2606,23 +2606,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
-
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	phy_power_off(phy);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 1497f1a8fc2f..5d615f50d13b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -46,4 +45,5 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cf859f880943..b8dab3f8a7c2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -714,12 +714,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_panel_disable_vsc_sdp(dp->panel);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+
+		/* set dongle to D3 (power off) mode */
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt

-- 
2.43.0


