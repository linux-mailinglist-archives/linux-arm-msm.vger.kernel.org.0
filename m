Return-Path: <linux-arm-msm+bounces-115107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f+ayEMJzQmos7gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:31:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0546DB3C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:31:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fBJO8k5B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b96RlJq+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115107-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115107-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 951CA30731F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3E2409137;
	Mon, 29 Jun 2026 13:18:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95366423A93
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739118; cv=none; b=FZumm1nmDYh79AtrIH4JHLbZA/SRofNWsWRMUp5C6HLil0VxYRPnjkSLW5KnMweGeblXTwqq9HdSu9UH5oCyJq+ZdGUm45ypYgcAKU9wvEYoyH7BfAytoC7WT/M1qGhFKkkGa/cTbpdsFmjwszwqaefqqujuzCDXKSSzi6qDpjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739118; c=relaxed/simple;
	bh=jgLawUeJTUEQ/LNV45pqJIuhaVIzKYq8VTCWBkSwzBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJ/wcXOtv8eDqGkkG0B3H8jC9RI0wrdGogyt/WOV0DEMKFuJYBLP5rBYqV16FyX/c0bc+9eihCqzbBp4F3wG3mjzZVWqTBzdeKQS+04Gm90fjdPK8upXVmxOEO4M78INoXpMYUClo/FiQ9rfVVSi+NG75Kt46cC+hsrTYnVJrsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBJO8k5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b96RlJq+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4up2627852
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/u6JPc641J8wBzj5j0oNFgP8pVVYegd9kCes0Z3CLU=; b=fBJO8k5BBmPm8Kh1
	imQYBPiDiJzRnst395bSM+c59ua2JcQxAOrKjmm+GivMXUGx1s0mHKaZ3yhqA50Q
	F6dqBX7RJQakKkpPDh5yWCFdWd9HWy9QIWLnCLeNSDdgmMA3/imYW/Vk5yYO4Qah
	ETfZmv1r5xx6UZNP6L5mTgSl/7fyUZagxeYfYY2ltB79gop3UYNu8lYaVKuX+r7Y
	iWKrmEuqsQtpAMAr33mnPjd6JQ8j02qZylWAffiBVzUw4I7K8P2G3sY0ewK7FMgm
	3kiGJKJ8tYugA10qjGEwLXnS4RpkDqksJ+kFPtWhlDWTFnGOfDWY+WEdMJ1ug5Ym
	wmnhFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs209-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b2ccd7971so628377685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739115; x=1783343915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/u6JPc641J8wBzj5j0oNFgP8pVVYegd9kCes0Z3CLU=;
        b=b96RlJq+SdS70hbPpnQJkqE4xoBjSQcnJwXuMLMKZmtKuEVT4X2Hon4tnvsbrFJksf
         NerJmS7IVZ9Me0M9pnd1LFjm7bA8pCQ6yvZeFGeDAf+NcbbszVsckis3HBRaY1kFcqz2
         dmxBKVUlCcmB3AIwWo8BDGsK5ZGbVwUf4ux5GqXCj9hDu3xPcjeNl2KmKm6/anSLE1NC
         szmhZjO6qC5VR4VAVVsFrd6kCEwAi99QYYQYwzWs01Bn7xwVUm9he7FD9SrvBhJf3yzE
         5IKxZIndQbC9P8l1EaSx10qgVVs+u7bcQShgmeoEbbMlAfJr+C2gLkGS2bLTv2E4AFk1
         Moeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739115; x=1783343915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/u6JPc641J8wBzj5j0oNFgP8pVVYegd9kCes0Z3CLU=;
        b=ICJxwsnaaRDazTloScAbJbz95/Bsl/BhSUlW/agRNyO6DaRG2VGqZR80Ekw77FQNP/
         ExnyaSYR9oWTb00MikBA01bN6uLIFSnDv1FiDh4ak3EFLXnBJJHY0aBzhDG97E0K1vj/
         HxuNBhRaXiBcCshYh1jqm2qhLzqMb8KMI3PqpJdrZ4BiDfKGuQ94cP3t3+QVcJM5xqna
         DdcZ2yoKx8VRLVrGIIbqd48R6Vx81Tz90QYtJtOXrpYmXTeWGFZy8AfUe/4QiwcLtZgD
         u7pJ+rhKz4r/XpcyC/yI9K2ukgI2ttAru8C0Bq/NxVAfnyvlJVbgdGBiOKB3qFgGOyQE
         wU8A==
X-Gm-Message-State: AOJu0Yzhn968BKxyTKKSdx0PrGdSMlyr2wMp93mbOiKj4pAwcZW4Eqo3
	19GVOgHKXIN7p7vWzYttYsJ49YZqUT43qaOFc2XaLQwVcZz/huTlbeGftGUvqEv06gngYm3lSKx
	OechVpTHgAYJ39K35bG+GxgaVYLcFaZyQUug1FmRGrnZANNnecnID1zQIuzP3LhZkNDXk
X-Gm-Gg: AfdE7clCDuWCRJDmJqRQWGmKnrm+IWCB/4sWa/TsesctCKrZHR8eNTuHZgSPNgvdik+
	+2xzM44YJyQclbRCnm306TChOxoPpJMSKV/9HM+yAA+i5fDGds1Z1cNwml7Z6Y3VvZn5w9Lbj2W
	CAzUDKyYm2CMD6KMbFab5/etEH1osg/ocqM3oqOweR8T6G8Auvxq53/ThjblibnY4z/3/htPCfT
	wxMV2FopWg/6dvCNXkYwMbJ2ScjS/Svzzc4EJbfaomZhRK0L463NvPM1pQEj3Z3ZL4AW3MLIyyC
	ZPV01w+8phlPhP+rz57D87K0Cr6fPtIL0L6CnRoypcay6TaYOmLS7y/OV649HA7BqWyWsJOMlmE
	ptBAB0nXsT0A59xBNUDPoNVUd/xYpXGch2aDZOOkMnxGIEuoNmI3ualkHBsIOvx0FNh8TpeKvAw
	==
X-Received: by 2002:ac8:5a0a:0:b0:517:642c:8196 with SMTP id d75a77b69052e-51a727a4b1emr225934771cf.12.1782739115011;
        Mon, 29 Jun 2026 06:18:35 -0700 (PDT)
X-Received: by 2002:ac8:5a0a:0:b0:517:642c:8196 with SMTP id d75a77b69052e-51a727a4b1emr225934301cf.12.1782739114581;
        Mon, 29 Jun 2026 06:18:34 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:18:34 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:43 +0800
Subject: [PATCH v5 25/25] drm/msm/dp: add HPD callback for dp MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-25-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=5643;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=b+G2f0mUuFh+XGa6ykrKQSB0dIdAdRaLzVWlRhztVIc=;
 b=/ysUftwlkwW5dnv+MlBLFQT1FhdJW9svWKYgi12frkvgEp5CBGM3rkp66n2df4Th/MQJz3BjB
 X05fRQyiCvCBHu0XA/rMNNTk7h8hIrddnXSP69psQzmmbz+PNZ5DKp+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: nQgG8P420Lm9gMvDo0CVt8c1n0iZD03N
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a4270ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=cF23hRJ9h-J1zlJA4xMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX6KqPsXG219Nf
 BPVcPnhGusTRnJxqNTtwLeRxZBHy1FBWFIRNCJ7/7KfdYk31tNjXSFGjEIHjJD+dVR+aGzxDaLB
 ez1anev+o+ELs0uOCY4IBt/wgGCeqN8=
X-Proofpoint-GUID: nQgG8P420Lm9gMvDo0CVt8c1n0iZD03N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX0dU+tskvXjT9
 GSRRqWT8Ndn8RQQHyCL+trllwoVIGs4Ldh9Vx1NLEg3X2Zc2etVL/WBbNPZBjXc+u2Uq7VbzEau
 jmnoLW/s7h297ZPP2FTsk1+qT+ef7Dt80C/zI7pGj6eFkwort+2ZR/+OaJDvb6uNSCCw6guBf4b
 KTSRUcLyxw/d0WtpA74+O8PKB9dudQorlJwIjmjayc6vm/8zoJ5+YIRT341mF85Au1NQ+Qe8azj
 qXd9v+CW+EWcsjnMNsymwu2Sk7jk3MmsSlBYkUJgztGKPLufVe6W41TCG+Kyotj9Q5UdDZCqG+q
 Y1pqP14jphm0CrFyute9415nYzo3BNHWBnkd05rMcLZlJK9iBgcbUYjLlrHHMIgSBs8R+JblFg2
 pgqazsBDtJpoA+Kwlta+jb4je7oFNvpxF7PA+nKaLKsJENSzkcN1yWFwIyLN5L6J7bSuze99QOn
 Gjo2wWTiQksl5eUH5uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115107-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 7A0546DB3C8

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 46 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6eac390af2e0..49a7bc5e031e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -455,6 +455,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (dp->plugged && dp->msm_dp_display.mst_active)
+		return 0;
+
 	guard(mutex)(&dp->plugged_lock);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
@@ -550,12 +553,18 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 sink_request;
 	int rc = 0;
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (msm_dp_display->mst_active) {
+		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
+
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
@@ -1111,9 +1120,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 				      connector_status_connected);
 
 	/* Send HPD as connected and distinguish it in the notifier */
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
+		if (dp->msm_dp_display.mst_active)
+			msm_dp_irq_hpd_handle(dp);
+		else
+			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+					      connector_status_connected);
+	}
 
 	ret = IRQ_HANDLED;
 
@@ -1776,7 +1789,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			msm_dp_hpd_plug_handle(dp);
 		}
 	} else {
-		msm_dp_hpd_unplug_handle(dp);
+		if (hpd_link_status == ISR_DISCONNECTED)
+			msm_dp_hpd_unplug_handle(dp);
 	}
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 12b47a413793..56f7a84e77d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -36,6 +36,8 @@ struct msm_dp_mst {
 	struct drm_dp_aux *dp_aux;
 	u32 max_streams;
 	struct mutex mst_lock;
+	/* Serializes HPD IRQ handling between IRQ handler and poll_hpd_irq. */
+	struct mutex hpd_irq_lock;
 	struct msm_dp_link_info link_info;
 };
 
@@ -288,6 +290,41 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
 	return rc;
 }
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	u8 ack[8] = {};
+	u8 esi[4];
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	bool handled;
+
+	guard(mutex)(&mst->hpd_irq_lock);
+
+	rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
+	if (rc < 0) {
+		DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
+		return;
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "MST irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
+		   esi[1], esi[2], esi[3]);
+
+	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+
+	/* ack the request */
+	if (handled) {
+		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
+		if (rc < 0) {
+			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
+			return;
+		}
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+	drm_dbg_dp(dp_display->drm_dev, "MST display hpd_irq handled:%d rc:%d\n", handled, rc);
+}
+
 /* DP MST Connector OPs */
 static int
 msm_dp_mst_connector_detect(struct drm_connector *connector,
@@ -502,8 +539,16 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return NULL;
 }
 
+static void msm_dp_mst_poll_hpd_irq(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	msm_dp_mst_display_hpd_irq(mst->msm_dp);
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
+	.poll_hpd_irq  = msm_dp_mst_poll_hpd_irq,
 };
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
@@ -532,6 +577,7 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
 	}
 
 	mutex_init(&mst->mst_lock);
+	mutex_init(&mst->hpd_irq_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 5d411529f681..08e145399cfc 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -9,5 +9,6 @@
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0


