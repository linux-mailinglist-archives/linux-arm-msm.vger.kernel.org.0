Return-Path: <linux-arm-msm+bounces-113447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PX4iJ/FoMWq6igUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 17:17:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9F690E19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 17:17:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ez4FUjsk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113447-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113447-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EFAD30A4C42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0887043CEF7;
	Tue, 16 Jun 2026 15:13:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992A2438FF3;
	Tue, 16 Jun 2026 15:13:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781622793; cv=none; b=ImPh0TJtw+IXBMbu/acQbyJmd3Iy6KLlpA5ilQcH+L2sj6mMvKFDSfa1f0Ch8Yhkep17Sibq7oa3PVyhgUarBRuf2s01xCmnM6gYje/nUh/xOLId59yJHIiVFrTJERPwXgKrySyhZDx0QlOQJn3cy2zqOaODRxsT6JnKj2J9B1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781622793; c=relaxed/simple;
	bh=q8Gk1FPTRKFLnmNLrtolxD9agDOXJg31olEMSOTa0gQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HaORO4cK4l6kDuQRQgg2FX5B0sQ+fKq3D3gR4uxlTMoylL+vlv5wJZAQJutSE2GdRnMFFF/HATZRYWmTvtlyz+ueoOdD15IFl8Z6umYn6aF9T30xnJP6ul3GhND7wjVTf1OBROs1ruJUpI4NJBZyaYOtlXkqTwQBoAAH+9J2BPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez4FUjsk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxWq13731534;
	Tue, 16 Jun 2026 15:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NGCTyYltHtin+edsBwFNobrH2uF2WSC4Gqv
	rDXhOO/s=; b=ez4FUjskBKAMM8IX9hyZ24OA5asajAv2nUG3D5ksiYiKf7sT3J4
	/MfOe3A+F0ZDh2EjJI3tSJAnrJCx4IKa/MDMJDS+uz51scDaaFu7nUoZ6VEuV5sE
	caFjUuj2W2bnifuJ9d32qzcKavVuEBUBcdYZr8JHVTRfCB+elp5VGQt05UAhUjzJ
	F91+pm/UzuYP+EFW/VA/2cN+tX23jeeVrqusPKNrdGNt/8uhJFrMBMw86ZcRWG9l
	t54PqJXgAZDi/NR9U65RXHtqQ4ZwUZ0NnyNKbmIdFE58Jy8e7fjEKWCE5mdA5VB7
	7TLlQ5Um2khYLuAdlgsir8RhZ3q+T0NGpoQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1yst28b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 15:13:00 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65GFCxHe009579;
	Tue, 16 Jun 2026 15:12:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4eu371bkat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 15:12:59 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65GFCxDS009483;
	Tue, 16 Jun 2026 15:12:59 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 65GFCw71009380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 15:12:59 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id AFFF26E4; Tue, 16 Jun 2026 08:12:58 -0700 (PDT)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Kumar Anurag <kumar.anurag@oss.qualcomm.com>
Subject: [PATCH] drm/msm/dp: return 0 from audio_prepare when cable is disconnected
Date: Tue, 16 Jun 2026 08:12:51 -0700
Message-Id: <20260616151252.3599089-1-kumar.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: o1NDbWc_iquCSxvXsJYvOBoqSMXT37Y8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE1NSBTYWx0ZWRfX4BMhFA9Sib/T
 AW3x8FvkLvQN5AZyAQiyf86HDKu38qr6F5NhrOPWEuVjNaBlzwAKTRq+stPvEY6NzGbsXos0cw2
 JmW3RFR87ahTeQchnfLoAVbECdoRSI4=
X-Proofpoint-ORIG-GUID: o1NDbWc_iquCSxvXsJYvOBoqSMXT37Y8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE1NSBTYWx0ZWRfX3nb4aP+sNPda
 vFqi2Fm140mbOYU4/wX6wcP/5HqP6jo1P0djvfNhMpau1FPqoM6lbU4/ha1t7d1Ts64jziPFysu
 Mzmd+ebo6C/fBJsV313CknOV7CmjWlGznSVGpjhKcw08aRQJNbeglUD6OqmRBx/5MR6K0ka9ipD
 LAk2xw+qE8NLQkWT3bpj/tCo3dP2TVAt3ExpHlqwJV1MADYURrHZnmmHeEArUGT4znPCbyCYIle
 jlw+E3gbZkxRI8ugZXcew6A8yMRMujzHmpdOqYmyDZwdX8PJ0LmPtsKsCAB0B0MAx1fN4K4qNnr
 9jH74sQFKcuKJCOKridQduR9MYdd9bvN6R2g7dMNpxzHkx46FqQ7+JklFhSnOTP6aQgFazw+0DW
 EdeRhsgYFc1e1SSfqubDE2BtQ/6DstrUz+WQBiQYKj7sJ3mdcapyAkjuIitk24TMtD71OfyM0x8
 6rlTtLDG+14yRb8qOOA==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a3167fc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=CIlbYoHKnxLhYvk64zEA:9
 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113447-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[kumar.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kumar.singh@oss.qualcomm.com,m:kumar.anurag@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kumar.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AA9F690E19

PipeWire treats a non-zero return from prepare as fatal, marking the
DP audio device as a dummy sink when the cable is unplugged. The
active_stream_cnt guard already prevents any unclocked hardware access,
so return success instead of -EINVAL when the link is not active.

Signed-off-by: Kumar Anurag <kumar.anurag@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 035e230201fd..8118130a3220 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,10 +284,8 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->active_stream_cnt) {
-		rc = -EINVAL;
+	if (!msm_dp_display->active_stream_cnt)
 		goto end;
-	}
 
 	audio = msm_dp_audio_get_data(msm_dp_display);
 	if (IS_ERR(audio)) {
-- 
2.34.1


