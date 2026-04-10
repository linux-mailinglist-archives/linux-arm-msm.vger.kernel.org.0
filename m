Return-Path: <linux-arm-msm+bounces-102641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D4lHNfF2GkuiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:41:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C93D513C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21182305AC8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C391336EA99;
	Fri, 10 Apr 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGBCT/tN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDAFUL5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE063BBA0D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813727; cv=none; b=WhkLxxZnbJ5KKNtdQbnfIDJVZ1HRn6YgbUqX91Fa1VPuCDMfqNF8EgwjieRQPu2IWuwsSD5ZC7pYlPJ+c4G7YbUAt2HXyvmFkDqjYeq0CQpcSLlbcKujmiX4YeDeBhqI9sJwIOqd+DOKgKfCOf4Hgrg8HP9BoTTQPnEAhsU20EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813727; c=relaxed/simple;
	bh=+CpePBhJakntbdUuOWtqwO2nvrIHnRAJ4CoVqz6dWdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWTRR2A31Rod8MYYzcd7UL9oj8Vg/7aEr8JJJsQcMxJBK/35ybkF96uT7clmHLkfAfpoicDk9XjyItcvuKSY1p3S/g5/Guta7AGExqne7IpJww2to4tMRYKWPPfAN6X5RIaB6xEaRNeFhcmtFN1yzbp2w2xF4eup3dM+YZurnDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGBCT/tN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDAFUL5S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6qmr62624720
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eylchszgY26qM6PjUr00qPnCImBgD1BjMnTdcXjom3s=; b=JGBCT/tN9BOTUaE4
	PwZ3tC0KZRcYjucRA0ohlvwFAW9kC54UzLZxKfLQE1RoYv7u3Fga9EqGUeDtQBy3
	I0FvGZKUSqUSpdXmjJzpkx+PPQurE8n20COdBFK9TJeOASqckwhITfxqpBRRKqeC
	n4ClaJbS7rhMmr8ORBaeQvJdQV16yzQXMKcQXV6O/kOVoKMxkQIKIaV6qW1P5MLv
	kFu8MqXYCe5mPgxmZ6sA0rcwJ6DSMdRmRKcT0beJTctC+z23ht85OzngLZ8IhTJy
	PcH07U41fsTwIS9LbZu+1OazjwohlPXDSfqm81KqjySghf/B05u3SPtDTuCku4a7
	DYCySg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu3m7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a1f96bf221so62759206d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813724; x=1776418524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eylchszgY26qM6PjUr00qPnCImBgD1BjMnTdcXjom3s=;
        b=VDAFUL5SZdxWC4fjuzMhgQcZ5vGjYb0sTopypb7iOUKKo+7tQtq6qyor+QEKbAoQER
         al7XvwlATayVhcUcdaeKyaTi95HZUVFnQKv85AL6HTinRXN6XLVufNq92Si/8E4HNqT4
         iGkzk9EngK3+9vpHHrTW9tddDDjBb1/czE7nS5+Zla6TRDjjhW8XG0wL2h4M5JKK2bQ1
         6oDp2DVZvlq7a8OwIbBq6WNBxfef8b2HrmZkU4gjgOBzdQ5ge3fuhjOVknUBU5QVpk4Z
         jEkRtLMBuD5VFsvjBRPq8nnzdJfjDSLdQVyxx1IKPEeuTn5tdPLRmIbM8bwGXulyce3L
         qfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813724; x=1776418524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eylchszgY26qM6PjUr00qPnCImBgD1BjMnTdcXjom3s=;
        b=m/aFk5BZW6Zmb3pr6ZFl8slElKO9dKYdDZzSyTEM3zMZwmNiCbX0/GC4jeDI0o3XhZ
         iWMhjcB0mKcaIEdzjP/mafC3zghA3r7WnGcXMk3RuhgSOalvfyiIo1MKH+PHA4RpTHSU
         S2Z8QqSqhm9TjrO/9e33C4Kbam9vQnVijCWFAclQS7XBuFsIqRKfu9zo8EZB+Zq0u9ei
         GO06Ua6qZBMTXlKDn2pRwrKZTqJAZvMj+epgF1coCm7ifLTdJzblV99RTa2dSqBDdQgV
         EX67S/UYl2Q0+YwwWHhyA8C5P25Aonlf8NYgc87VjjK4OH9w/nCjHURIeRS402hspAgd
         MtmA==
X-Gm-Message-State: AOJu0YxtAijfDoP0RQ3S5cQVudWpoF7JxM/zGwObgE3AkQkeRCQVui8e
	VSvXwMxMMIMqgA2GnNDTw8sKnTVWhasM1R07oZZ4GSVTKHyIGngNFZOd1P1MQEMCy5o2bwQSfCF
	Xgx7jkjLcDv1tTvheiJgu+NT1yFQ2AWdETTuSpptDeuoSxKsV9+BQL/L6JnBYCeiOSLKMpDDWAV
	Fe
X-Gm-Gg: AeBDiet76XZKfehTuU07GeotfW9NqwbeqFrmWTRB+oo+6dacfRebFB8IeHc27Hq9yoQ
	C9hIXnE4zkpWPU5lvEHSjCmDbcsJhEgClrpppupYXjANvqEpwarI5+0SNZeOjAW69klZ1afxaUw
	yKPzKi8gusIz2p4QiHjlsqVHylmxLFhPU54W28gxAeWLb6m7T05dMy4mM7nroXJZhVdLuO4t65u
	DLdwDgY6QLiH2VZptTkaXM10P4X7Je7CedgxAejVdn5ohI/BD5MZjuclnejX2t8C8hbPDanxVa4
	zfhApxHJf5OWbwJYd1cDcfBwULIg0ICM1y2x8U8dDO+rYfq50aAzFMcK2k/q6vSds2GWxfpdqeD
	5L50S2wTCPwAK28mLCxZCPJwljTuHzf3TGr9swJxUQms+fuI1OPbw7ZsNvjdHfKYRk0CXDdUOJS
	ipvqanDjw=
X-Received: by 2002:a05:6214:5546:b0:89c:5c84:36 with SMTP id 6a1803df08f44-8ac861a235cmr31669596d6.14.1775813723877;
        Fri, 10 Apr 2026 02:35:23 -0700 (PDT)
X-Received: by 2002:a05:6214:5546:b0:89c:5c84:36 with SMTP id 6a1803df08f44-8ac861a235cmr31669186d6.14.1775813723407;
        Fri, 10 Apr 2026 02:35:23 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:23 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:53 +0800
Subject: [PATCH v4 18/39] drm/msm/dp: add support to send ACT packets for
 MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-18-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=7120;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=CemO4VmQ+98B+fw3BBYwaBPR2qapVb0Nx/wFZyKNcvY=;
 b=mL1DFIaKSk/UmFz41yhSYdIOdGIAQciObVOfoWp5juk7DNKUuIkF50DShPaNUYwqV3ha4bU+l
 wxTl1fUOydmDFtDr+Cun7RNi+ogpKYTDMLwrY7yWdpPLZP8ZIhK+nZg
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: cNjhCcuvXE3Gr0VdYc0IAonzE0_oUwcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX1fwXPFBx90nt
 RR9cyOoYOx2Z9aohdA/bSUgwIXGPQb+6pKLwIq2F+Efb+kxMWZkbHtNUoOWHleSMMksPU4tkEVW
 nV/LcX/BXmyrl4cMnEUJHfk6exEx7Uf9fOHlLRWvEaFCiGt6QpN9UiCYd2yAkju78WKkBoMkXXX
 zzSXQtz4knQvjSkQQV6lfaiJo/XJ4OBW7JO9xmJRxs+lr7iLaLaORKJF12KHKXxQvPkS+jUZoX0
 VYbFQWU9n9SLKf7wPo8dzyP6RdNGLisb0wFnEqPz1Sq5voIAyGvl3gkuqURgA77fLRMxCyythiE
 gH7qsx/iYi5RfIPZDJLFmKzaPof3BAZLrV2+O2JLegCwgnWiHTZxy17LFVpd4+w2nkRTWAVwO29
 Ls7gMo7iELMrvmGr6dRdIsxAjpFMzDBVQA5HbGkk1aiigsHmMRLEqr99ZxMRXtHlAeiqT4jeiw6
 ck/w56Osg/UpDccTx+Q==
X-Proofpoint-ORIG-GUID: cNjhCcuvXE3Gr0VdYc0IAonzE0_oUwcO
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d8c45c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WyzI5VeO30yZZBqxhZsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102641-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: E62C93D513C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 43 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
 5 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1109b2df21be..6f25145ef214 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -143,6 +143,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_active;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -228,6 +229,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return err;
 }
 
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	bool act_complete;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return 0;
+
+	msm_dp_write_link(ctrl, 0, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(20); /* needs 1 frame time */
+
+	act_complete = msm_dp_read_link(ctrl, 0, REG_DP_MST_ACT);
+
+	if (!act_complete) {
+		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2081,6 +2108,10 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	ret = msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
+	if (ret)
+		return ret;
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
 	return ret;
@@ -2277,7 +2308,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
 	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
 
-	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, false);
 	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
 		return ret;
@@ -2357,7 +2388,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
 {
 	int rc = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2375,6 +2406,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	rate = ctrl->panel->link_info.rate;
 	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	ctrl->mst_active = mst_active;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
 
@@ -2654,6 +2686,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
+	if (ret)
+		return ret;
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
@@ -2693,6 +2729,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
+	ctrl->mst_active = false;
+
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
@@ -2876,6 +2914,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_active = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index e72d501ac1ce..f82fd96e412a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -16,7 +16,7 @@ struct msm_dp_ctrl {
 
 struct phy;
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -51,4 +51,5 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a924fbd825f7..80bb5fc4003f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -660,7 +660,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 		force_link_train = true;
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
 	if (rc)
 		DRM_ERROR("Failed link training (rc=%d)\n", rc);
 	// TODO: schedule drm_connector_set_link_status_property()
@@ -1547,6 +1547,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b0cfdf215970..fdbe6e4871d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,6 +19,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool audio_enabled;
 	bool power_on;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 1c2d3d8d029d..237325d52dbd 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -156,6 +156,8 @@
 #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
 #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
 
+#define REG_DP_MST_ACT				(0x00000500)
+
 #define REG_DP_SOFTWARE_MVID			(0x00000010)
 #define REG_DP_SOFTWARE_NVID			(0x00000018)
 #define REG_DP_TOTAL_HOR_VER			(0x0000001C)

-- 
2.43.0


