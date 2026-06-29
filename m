Return-Path: <linux-arm-msm+bounces-115141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cn99OuJ/Qmqh8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:23:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E498A6DBFBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:23:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dHK5ezpF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bMRdrRJw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115141-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115141-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FB6D300C7CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E414F41930B;
	Mon, 29 Jun 2026 14:16:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976F410D34
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742575; cv=none; b=bqnsmX7aO24v0dEF2LCiNOvlxB5xBXtxKNzP36IEfq+jdOL/fWQJAGPYyvh2NZO8dMuHiggN9LKw60nVFUH3Ft+heFu3KqlQdUXxDwNQYL2ll7dl8xMbBCWddqy/n8hf801CgigEQZlmvB38rFaE/QhAonyvydYnjiray0I2TTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742575; c=relaxed/simple;
	bh=Nckl5SVHyDiYMHm3zoeeLm9lXkLDiRofsFKedfYvkas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLUvEwG/6VT3w9MXzsswUroYUlstZCwyjHhPRlkEt8Mdrfk/G1b3OQB0z6fuYoVPtcGi1vDszvtyDCrZNxxsKElMEL8mw/xF/jd71TmBvMHiRwEx8s7S5ALsFdArDatuSbpSO5H9KL8NY5qKsa6vhrombSGiXmKgKJxI5Cx377A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHK5ezpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMRdrRJw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT5EW2627909
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3ss0vjFpNbgbDRhLDHRKoVJrgStQ6KKT9k+hgeLDjU=; b=dHK5ezpFA9t782c+
	0F2Bx78154ND81E8diSkDLR0TNgjcNmslM8pde7u1amTd9q78KbA1NUzU8U3LyPF
	K3nWanZOJ5CXWSlBSmfXi0KPXJteUadto4B8dSvWPCyRgmAGgi89GdB6WS5kah+C
	FnAjGGlr3rCsCZ1Juo/J+MPpTG9JcgXoQlHxbv4OG3jyjpRrobMrUTvkQTSkW1jZ
	OZWF6ZjQH4DNeL/cOAu+gMnZV4mCo6jGohJLVdEGRS3Umuk06idJZlG6lp9rCgUg
	VXD5QYFNep7XePapSuJfNG310YMQ7b0cDvbIa0oCpSATzllzt5e8w/7j5IkIMm7U
	jqE5/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs909-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e61b38eddso1592785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742573; x=1783347373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3ss0vjFpNbgbDRhLDHRKoVJrgStQ6KKT9k+hgeLDjU=;
        b=bMRdrRJwVXCtDFofL7sFub2TZ+M8STCTzkMZyw3VB2nMIB3D/+OPufF7YQiLCpOZ1E
         doRBXgKK6xRj2iacx6SQcJofbVQtj29yVo6MDTDSgqkxecxo7XGZhyNBZBzD2NYW/9Oh
         Xp094sIOUP6WgXTcfcGdnUbfc+geDyMm3SGGTmH6ngCU12Ent3IIL4F34hPGp9KbzZPe
         9N/uwr7ypixJN1yZQILcwHIBRzTAG5IB8rTIlYW3PI8M7Ud23Y12NWeS9lBxzS0/Vjzj
         6DggtVHdm1H20zT1l8g6iWJ28Fy5NYKZvz5yF/ydWhas/0ag/1qf63/9FKjJnARvSe9j
         SrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742573; x=1783347373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T3ss0vjFpNbgbDRhLDHRKoVJrgStQ6KKT9k+hgeLDjU=;
        b=GA9B7Tk6ij4qsEhVbuN0VmGt8Is5bnGHPR6B0x8B1G7zmTGxLCBc18dE5/ILGSMqJx
         aacqHGPZ11Uh4Y1WxiMk28H63ivZrl2coVcMnXHcgYb1rw7PJhG8IjHLkjQx6WAeghgN
         uaBf2sjXe2hPtl0amJXBTu1fhfrrxPxJwAjwEdQ1/H6HwRDSqq5RhSguIjcFCGOoZbKj
         eg2QAgwNGlQLK90WpvQ8RsHoujCdj3807WFUC6wJBqjPWrZ4nrrtNJt+bMKwfdijH82e
         aj5+nPYhWVlZ/9Nf21Q0Kxx5heBn0azlYwGYHMTaV8vSDZQ8VxE820aw+uFwfXcGlnzL
         BMcw==
X-Gm-Message-State: AOJu0YxNlgQat0bGUaMhEGSAAmGhriaVuATmwXZThKWRa+EhyaRXq537
	rzKaK8AKOCIw3qpQy+RozUcvUGmNoh2p2cbjx+ERQDgWjEgqz+fZlI1MZ1SaQa9//lfICoBRhMW
	ZMMTYi1kMchrQVLecPR6RROH2IhAS8wNWreH7xiR4CWU3S1YTY7XW7vERTEwxQbL1LWCG
X-Gm-Gg: AfdE7cmr2Prx6uRhuIMBq4GxQ6S48LGowfH2SHu9nTk0wxi7aIZUNskf3s979cto/3o
	Asb0HMOM/pBKe/F2vILme2Dc8TQ5KdV0c9H33ShA7o5eqA2Tt0B2Ak269co6f8nQjsHt1AjqlrT
	onu2hivihhdPAG0VPqfowxdtIupRQCzKR/1noGcUhEX38OvcC3bkMH9B056kIUUKKKlejbzujwo
	NQkrvnb8iXYHqhWiJJf5J0kAVq7/tf0UdMNhKNP/y6FTc4dsqbp16LBJGQGE9qO8lLmvIMHG8aR
	qHeOuAjgnr8ZY93QxX54xGPEumsH2a2/NYwJJg6lOOaDNVFSNYfsXEsVsz41KWjYE+vVdWowxrh
	aGCJvBPtmdPqnWaxnsIDmqYrEDIXq6HEDOkRk9Zpb5FQaTPlP9yqQotuGXiD06YazhiRdug==
X-Received: by 2002:a05:620a:4409:b0:923:8612:f15 with SMTP id af79cd13be357-9293bd3b210mr2439024785a.18.1782742572526;
        Mon, 29 Jun 2026 07:16:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:923:8612:f15 with SMTP id af79cd13be357-9293bd3b210mr2439016385a.18.1782742571663;
        Mon, 29 Jun 2026 07:16:11 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:11 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 13/25] drm/msm/dp: replace power_on with active_stream_cnt for dp_display
Date: Mon, 29 Jun 2026 22:14:34 +0800
Message-ID: <20260629-msm-dp-mst-v5-13-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=4734; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=qyaa9q2aizh+9xuBgPhFHv6SP6/o/UrGrHkmxoK5AgY=; b=UgHZC2uWpKjq6WlQr39Ul6beQkEn2XYnnMjGlhjWpIjVoqrTQAOEP0+EUP259R3FXtddl2s71 AEglTWRoyhNCpbfs7vyTrmoSwkLK0BlHFoigltEYTAPb/3Bj1FLE7mP
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HgREdcikivp8TwHUGO62nqrOvVJhj7jf
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a427e2d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n0N2oAcnmnxAXiYSG7kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX+USI6lrDM5+M
 OMA+62G0JMIzfS/Zq4sqOV2bN4TW9IunWDfnM0Ma5EzYyFCOI9hocFC+escwQredu/3kh3iz5ax
 2ynHYtk2gOoAJBk2+PJrn3p3mUADi84=
X-Proofpoint-GUID: HgREdcikivp8TwHUGO62nqrOvVJhj7jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX7JcMoUtveTkX
 z+5GDiFboir0ELOnVF3Vflvyh1hi/sE5XtECk8eB973dm1OKrNQRuuvB+UHIEcr5JCM5hOYA/o0
 t6zXhuxJJVgnG49NkAi7k8LApcn0QRLBSx7x/+w+sLhTjuAvZ6XaYH1kyO7VscqzESt+v/XRABI
 Q+P/2ftVO2wmuI6GYP2S6dyZ624geOrbLsAkgYehbC2tGtiRodSHwS8o6qVu4sLXBPBL1B1RlP4
 aqlLC9PtD2f8qeMtnwl6QAQflpa3tsDhdI4TulL1upOqw/isveA/k+QiN3UzceY2Yp+agAP+QAm
 c5AjqyHhBWVTi8UVd3+DfARf4/7BOPk5aXI5CiF5JX0ghIUJA+Ztz97/leCkpRpDj1Nt4Odd6VA
 uwXqUMYYFhxa4mptwEDWLkjOlKlB5Ka+RpJuOONinkff+2qMBJBF/8jMXxP2vkRIHXysFqkZah4
 klPGsaYSS5PjnJzAbQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118
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
	TAGGED_FROM(0.00)[bounces-115141-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
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
X-Rspamd-Queue-Id: E498A6DBFBA

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


