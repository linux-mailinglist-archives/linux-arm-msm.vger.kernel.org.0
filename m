Return-Path: <linux-arm-msm+bounces-115096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DXgzBeByQmrr7QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:28:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1176DB331
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="FC/0TDpV";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dnJzI2ut;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115096-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115096-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE06F3045E02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D08D419306;
	Mon, 29 Jun 2026 13:17:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308714192FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739061; cv=none; b=FBe7tVB1MdfaD6AbO13zoQ9FjnndtIBeieWHoCV6LHzNjPL4/biB9QFX9D4pVvjXxJBF1AZnsdaXUx5jiQwkyoZ1ss3YfM/S2erjYjUWjf7c5d5uQB28/xpW2r7ZC341mGTePxj5UwRUjpKBgfisekwOboWkoATLoMgRYtUmNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739061; c=relaxed/simple;
	bh=Nckl5SVHyDiYMHm3zoeeLm9lXkLDiRofsFKedfYvkas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFsTIdx4nsiUkDtZbhbpoFYQpf/a2jnpM5yHkkqzatRa9DahUYnvGhiHSXcUpTn5a53qmK1ZMOdjQqHNkNXxtzrtdrpaWf7H+kLu0mJu/yIPdRwFktimFrORG8pGP0wgyM3HWi1j41PT48//PYpA9Re/ZYRCS9HJLy66OKnFQic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FC/0TDpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnJzI2ut; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4hT2646950
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3ss0vjFpNbgbDRhLDHRKoVJrgStQ6KKT9k+hgeLDjU=; b=FC/0TDpVic6gKg8P
	A5tl1eBUrA1Gb846LWtPs9xIKFgnOt9KTJGnAoznlVL/e22O6B3c3JVIkPNSfSWY
	K6J98r4sh1qXLClmQuXJaXKB4hMQpksA8rRoVgHJwKl9NBCZfkC5VbeELnW96LVJ
	zzvmHjQoht6H+PAQ9XoL0TBwE3Utn1uoPqTuMC5DJFdRxQEMI7SLPaULL0sFFv2E
	f00eJkKr6bXc/AGTnWl6iWhdR+OHUdgz7O9ZCLzqSBsaTSASJW3RN/xCYJ1gB/qG
	arAOlMvwjgEqiqm4+3Oo62zexK3VE+Tmkd6cskPEEO1IbzDLy7oamrh4orHYzhlP
	PzkL3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tse4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eb8914e651so41685286d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739058; x=1783343858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3ss0vjFpNbgbDRhLDHRKoVJrgStQ6KKT9k+hgeLDjU=;
        b=dnJzI2utQiionAgUI0GB5OrT52f3WRonVZkG16etduegYA7Teta7NqLSijuyCu4KQ7
         JJKrbivUkGPgYvxrmDjROigOVRJHGg4XrvHQmoWvyqo/U/0EBLfu1NAmNtKZKxsnG1SC
         PxnvN/kXNPKqbSOqwnQcE2X5PL2m2Wq1CzyS2qa/BbdJgQGlRQrkGPJWKg3DUBTF+zFJ
         7ADB4fGtsZ77TeRU0ag1aubO20PpGJ/86I8KTQ6BCNhMwZmUDQXFDGVjrXcES5wRLkbg
         6auAeM32Xeu76Vt45jWk8uL8ZI0Djp0QfLr3IhBnjC6Ihk7frEWZiyNaIwj6g7OvgLCx
         kiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739058; x=1783343858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T3ss0vjFpNbgbDRhLDHRKoVJrgStQ6KKT9k+hgeLDjU=;
        b=kAa4M4e6JBoJOlfKVyOMeAgnX2vBJ86e0Lmxr5s9nygbcLrD4pFCjNRZXEbzCi0xMP
         ugQFwRK0vy8XF/a7tpfVc+konqFBuHkzlX9DZQ/28PMulCFDVytCDEKLCpHCIezccnWN
         1habtTELjqcyR6EPtVGyCp9YUAl4iRpmN3Pi4VOJckG55Jr6Z3ON2GaZjLmfGizHU8kc
         /tH0s2AdkyAdz+XnWaKcxZbwTpDMM7tDD/ku/N2m4wgdg96ge7f80toCdwLN/Sb70txU
         AvMgMEwIdpgdWftbuA+Pj+cZtNzen+FSEkKp4+hZaFgY6sXhFHrMdZAkOpcrUSH96EMO
         DCtA==
X-Gm-Message-State: AOJu0YzYB+Yk67F1pCet4Rkvstco+En19aM7i1uD+3W07EkxG9dcY8CQ
	kyZTzeLGDz2oRzVsqw2HeO/eUHdXXdbm85kpiQOc8byPG2mPnSZLdIiQ8mwRoPLQamLYox8vyY/
	3voDHo6nXRd3CXSkw5uErITlH3gLp26aKLhDYTdJB898XGNPcGNef52MzQ3kTRhLhD/7V
X-Gm-Gg: AfdE7cl9x6invm/dPykQqDJuR9fsgqe60g95N8R2p7QUKVGw54LjSwvTRJi8yQYOo4k
	cdqGGvEFVsp8Kj5+FX+40Vn2UVWhs5adnmliumRDAhDbm5QtH732GEUVBhBiOKa27bzDlHeE2Q6
	3w8k2nIVZGBBZSEqRmNmZxiCjLk4Es/kBssbDf+0KsKlb9Y78k3OoBec2K250XhAKbTZJmxpftf
	OYyWeE5IlAXFf6RhTpjs0lNdHHDGpTRyzspnjT30zZWY46wI4lbOXDxiS+npdgaH7e864yGFRrd
	aRsqfx6n57zwfkXFZciJCEb99hE5OOpZjO+qt8U2qLnWI2tzpGn9mG+2geUSrwMYEh9TjES/kw0
	Ro6rblNtgVIYn50orfed4mALPoJcQ/WbInY54UgrcLg5e3/+rBmgyECmTYLTOQIgTs7hsYYcg0A
	==
X-Received: by 2002:a05:6214:3213:b0:8db:1179:d180 with SMTP id 6a1803df08f44-8e6d8103a36mr287554136d6.23.1782739058321;
        Mon, 29 Jun 2026 06:17:38 -0700 (PDT)
X-Received: by 2002:a05:6214:3213:b0:8db:1179:d180 with SMTP id 6a1803df08f44-8e6d8103a36mr287553156d6.23.1782739057652;
        Mon, 29 Jun 2026 06:17:37 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:31 +0800
Subject: [PATCH v5 13/25] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-13-1d882d9012f4@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=4734;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=qyaa9q2aizh+9xuBgPhFHv6SP6/o/UrGrHkmxoK5AgY=;
 b=exGqe+aKROmq4l0EXEWy42Omv/43/D3zuejKFzAtM12LiOH8oVbRDQisfi8c9ela5/3dZ2Ezk
 Psp8YOt089ODV+1HvTPMJtHfqxaCFTk8UdT+aEw5Z+M2dUXiRAMaW+w
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX4+LqbOwwQWjK
 BokQlXVlVED7a7RbHqXtCMJ7FbsBzERi0/bXUafq92w89YZvq2Pj8kJQhU6v1DO/Q7Ggfx5XXL7
 0mwQP7y2R2C+xUDPeLq93W1yHmlitbh/oqZahGh0d6pOcFEmxraUON7GX8z3j2t2qlLkI8youRx
 vUh6SC06qB9qyGpV2YMtCZTWGUDmNhdKOtJc2M4Bxi2/K0RBrksQLyRb3s4zb2092TNCVZgzhKq
 WkXbnnSO+b3qQJhXDtYlDSNKEEquckvRZRZ05jXUwdLrmj/Nqq6L6CYFjCXQcXg+aLfQdmHmrh/
 vCbUvEPPimZlzgmCTLYBI4maqOstE7ETG5QVQivusny5qywY13mEYCjA3PhQ2ckDPjzqHZDcN6F
 JLfjG3cgwePDV80lkuIRbuexNe7/iG3dxkYKTgXgTjjlu2vd7c5WhciC4/mp+S8+IP99M8MothM
 usf0yJwreFOeObni4hQ==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a427073 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n0N2oAcnmnxAXiYSG7kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX4YiV5xBX/hX3
 5IXQNqXW/U7RR6PkowSSP+LQ4WXIdFrPKagYlShvIox2mbPiiZP/VHkG0972b1PhsXMcZQGg27o
 LaZXK21jOHcm9CHCIsnOBz4AkI3swFA=
X-Proofpoint-ORIG-GUID: T12LPVI-5sSHdBtMlteA0YLwzVWhuk9g
X-Proofpoint-GUID: T12LPVI-5sSHdBtMlteA0YLwzVWhuk9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115096-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 6E1176DB331

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For DP MST, the link clock and power domain resources stay on until
both streams have been disabled OR we receive hotplug. Introduce an
active_stream_cnt to track the number of active streams and necessary
state handling. Replace the power_on variable with active_stream_cnt
as power_on boolean works only for a single stream.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 41018e82efa1..035e230201fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display->active_stream_cnt) {
 		rc = -EINVAL;
 		goto end;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0e432f35cc51..d0081ea9f5cd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -650,7 +650,7 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (dp->link->sink_count == 0)
 		return rc;
 
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
 	}
@@ -670,14 +670,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
-	if (!rc)
-		msm_dp_display->power_on = true;
+
+	msm_dp_display->active_stream_cnt++;
 
 	return rc;
 }
@@ -726,14 +722,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
+	if (!msm_dp_display->active_stream_cnt)
 		return 0;
 
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
-	msm_dp_display->power_on = false;
+	msm_dp_display->active_stream_cnt--;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
@@ -850,10 +846,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * if we are reading registers we need the link clocks to be on
 	 * however till DP cable is connected this will not happen as we
 	 * do not know the resolution to power up with. Hence check the
-	 * power_on status before dumping DP registers to avoid crash due
+	 * active_stream_cnt status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	if (!dp->power_on)
+	if (!dp->active_stream_cnt)
 		return;
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
@@ -1535,6 +1531,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "no active streams\n");
+		return;
+	}
+
 	msm_dp_ctrl_push_vcpf(dp->ctrl, msm_dp_panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
 	msm_dp_ctrl_mst_send_act(dp->ctrl, msm_dp_panel);
@@ -1555,6 +1556,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 55ffa22bb233..75dc40261723 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,7 +18,7 @@ struct msm_dp {
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
 	bool audio_enabled;
-	bool power_on;
+	u32 active_stream_cnt;
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;

-- 
2.43.0


