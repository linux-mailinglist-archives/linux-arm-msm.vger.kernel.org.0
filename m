Return-Path: <linux-arm-msm+bounces-115084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L6p1BSd5Qmo68AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:54:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF86DB956
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:54:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LtfGVDTE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d7RYOS+a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115084-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115084-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1E83300BEBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E14408008;
	Mon, 29 Jun 2026 13:16:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F48408017
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:16:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738999; cv=none; b=seMHFjzQ8oPtNV6eaWprjoJiPhUOBvfxajVE/E4CCl1st8cNcO1kG67wU00rq6S77VcHa9XgZcAGwrtmDvn3SVjyvys6aZfYaREG5XjGY/7HuiUE+vI0QpKcMWTINFcqCnnq9q3+TfqdHQ8HK7yvVrX37nIfnF+scc/Ua3O6vbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738999; c=relaxed/simple;
	bh=xT3swZArNRG41uWXvzdzz+b4IEAbGI5rShzn3Y5Js04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOlNRq6Qv6yCF3y/s+Pxzb1HQCmZpZ2Qy4KL7T0LfDz/Er/H/c/kPCjRaVAKsbXGGx6/ykzU+uPF///bVvH2++0nfSHlZXWnlNXZAj4dSFfSYXW69pVffH5cb3Col2HWGINuoHzZcGI3yobVnXae1q2I66A2wydb7QpKVW66Wm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtfGVDTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7RYOS+a; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT2hj2646894
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktB48cKUfI0OyW+Qe8qWfc+SIRL6GY3ylfeL6aZfOHA=; b=LtfGVDTE305Cydx+
	Y9sEslj+d3sXYIM7Nc/X6wmHrFPHB4QvI+AcaAAZq+Du66yfGKkLKGi9QtLipw0c
	M4HJPFqf1x6rVIWw6cE1f9UKZvMGe7w1irXyEN81vfSS2WN0Bw6ql6btbBAMG+bT
	QryFLDNx0Rv7D+WOgNeFc7HP504HX6nPmMOL/U1QDOhMxLaxbbuUbYebr9VYjNfg
	ljc3VFHDJU/OpHzT5PD8VR6beHNHZCldm5po1Kr1P7kezViPmci6QM9p5eZdn1qp
	L7wzM+AJ3pbax1wJcUExtxFFDzkXYGNLVw+2fK1ec22JWcOr5RjIUuWuwH21dXWw
	9onFEg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tse0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:16:36 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-662d484ff6eso5471571d50.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782738996; x=1783343796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktB48cKUfI0OyW+Qe8qWfc+SIRL6GY3ylfeL6aZfOHA=;
        b=d7RYOS+a0PwtdPRU62OV3RRKCaDuG0fpJkF0b+ovkZVXjlYsJoLVcAUy+lrFx1pRGl
         gVlX1t2Fs78ynyBmsSRvn1luAsqQfMUgbJqakBCZf1Ihsjdfm8QxbyXlherc5nytIAuo
         N1x3YA/qKeIqYn+4C1vEH1/QnP1AeQCIY3nbkjkBGxl8SYhQr8fqs5TjkimRHHpeAMo8
         LNSaPaORE88Mkn3d1p/SIhWOYKjpD3QMbFi/kLblxcygHBmnVZ1q/p4zLxxwMJkorwaK
         KylzAGDp5+UGKHlW3JnoPmf0i98p+h6/bF0yvQ3RvCPsKxixZ96AmXTNnWO0dabo6u8B
         5h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738996; x=1783343796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ktB48cKUfI0OyW+Qe8qWfc+SIRL6GY3ylfeL6aZfOHA=;
        b=VAOTC0+6FqhZ9ZGT/ccz/sSaQ6YZU9WjTVWCbhVBOGseB/xTpXEJVbY0yWxNCQF4T0
         uXZ8ITCBn9J9V0JpcdEDCJGK/795aS9OrEJJRKFHlxJGH+yT8P2KWjLISJ1S9ppAUVIK
         tTFgBL1B8uK6h71xnYwY3jER2p5T6uFSxV1TNGViyEwUE6av/9vY33YpUocfG5tS9UdM
         xCqAJxRVQ+KUvPPXx4r1g0/Xwec0aXTfH72DBiYx3EO9LM748BSFfWenwTSkY244uZ7z
         ReCZQm8JE6CIejvlAA39uqbAcDMxw6ctLNm3hkv+gmU5TXDvO2ihUX+dVqNpx0SxaCOK
         IgvQ==
X-Gm-Message-State: AOJu0YwRQVGnB0i1l1Zzhl0KSNKFtXr5/zlAD6uT6H2j9GB4pnPJPJMi
	TjsP5EKdQYVlnmaS18h+7iWHW5WKi5968Yi3vLQsX4/tnJQFJcNu6l7nXd6VQVSpyiUkEapLesT
	DYZDikie4Uh53JliBLHRjg2cZ6xIpHedop7Ma54y3yRjxg2P48e1WEnATSkvmLG3eBuuzv697o2
	y4/Ss=
X-Gm-Gg: AfdE7cn2TjhNvii92idGF2P97WzmcpOvZNf0KY05jkb41TQylEB7TxfLAFckLBEwhHh
	CovOhH+9D82nb3xHbfoQ5BZK/tGG+1HheNPuOybtwTRwgzWuveyusS8xt+WjmE8mp3Um4sG7dZF
	LNYByTxhKQlDKNXK6wTg4+73f3i0jXsdbDoHs5jEHTm4UqzfVof9wa5K/zqjcR+o0ve1PY4mnHl
	SmSnkls6CNipJDIxxvlXsH6mXbMK+RtXSPeOSriDXDWDbS6WMRlENIGxjBUHPn7gXVQC5K6YtBC
	+PpjUWcesyvfwx6/8eGa+mANYtCimggPQtkjSTD4Blpu/iwd8c0sBfD2g54MELrlJlYNcxW6Eix
	7Zn4eM/SBaTn2UJ54tUspwRDNa53k7U0SeUJFNo/iNrH6Y2qm8gY0ttI7V91IOK4Z1ufni2uZuw
	==
X-Received: by 2002:a53:c409:0:b0:664:ae6b:b49b with SMTP id 956f58d0204a3-664ae6bb796mr5664727d50.80.1782738995470;
        Mon, 29 Jun 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a53:c409:0:b0:664:ae6b:b49b with SMTP id 956f58d0204a3-664ae6bb796mr5664703d50.80.1782738995002;
        Mon, 29 Jun 2026 06:16:35 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:16:34 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:19 +0800
Subject: [PATCH v5 01/25] drm/msm/dp: introduce stream_id for each DP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-1-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=10442;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=X9k+lp9FZFrEs6ZBQf2VemFttBNfAGWwILOxRHhogNk=;
 b=j6NkwYJnL847ZV5Owip+XK1kDzr+DuFBU0hsLXoFkt06AmxBCT07D4gIJB2gNprWQIb6z1x1w
 I/jxrYA9b8YAHGG4OOXMPMG8ZjchnPHoOOKa0lkMwCD4D9xdvx+8MfV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfXwaOubTJ4xOoP
 //LOMtiFsCJwhUFR9ekZWlEXQ72d7zAVl3KVWS1IEiI9fzjsDFA4RQ8WIxx4rx0Hun0ulG83Y8c
 9p4ANGmI5iX0fnoBJ3ZCQblHE+KiHVru8u+B16UpjZgbUuGQ5iHJHcaMzAqUdb4brZQ3y4QFRJ3
 EJx3XE6KRhhiOJF2kKOryOTTN02qIBYPM2sER81tskCT9DLg18z7rZnn8X63UtXEXdCqev1/vSv
 h5S73tzkUnPsTyOGupn/VSBg/mgDLnnkhEMVbLaL42j4O5UKPKQuj66HCEl0TddgNeRteWOVjc1
 edF5CPLwRXPBckv0voWlP4+4Um2d7kVy9TLnVA5QijZMMCArHzjHXUNrslIqx4F2uVIa/fC8RM1
 WfNQDH3tSPV1iHeSqcEpJlT78YvVmSXIqOFEHOlQhyj5sFxy+E0/bxTW1TwO808g8Y2WECZKoOL
 AINYVlnpuqS5ttRji+A==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a427034 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2DdK-DT3ArwjwnIMWYkA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfXys4nqSQ9v+MO
 Ua3X+dKDa+QA760YYcPhYbghR3OTRm/UCXBRLcc+cbxS/6zEEW+v4eOak/fl+ExhF322ipkK7gr
 72M2LM6jJ78E8wrnM2gcYnzi8rMQp9s=
X-Proofpoint-ORIG-GUID: 3TgCCgtJVjGxGdomN3uBs4Any6UtM116
X-Proofpoint-GUID: 3TgCCgtJVjGxGdomN3uBs4Any6UtM116
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115084-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1DFF86DB956

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

With MST, each DP controller can handle multiple streams. There shall be
one dp_panel for each stream but the dp_display object shall be shared
among them. To represent this abstraction, create a stream_id for each DP
panel which shall be dynamically assigned to actual stream IDs by the MST
path. For SST, default this to stream 0.

In the MST path, panels are dynamically assigned to actual stream IDs at
stream enable time by the MST layer.

Use the stream ID to control the pixel clock of that respective stream by
extending the clock handles and state tracking of the DP pixel clock to
an array of max supported streams. The maximum streams currently is 4.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 67 +++++++++++++++++++++++--------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  1 +
 drivers/gpu/drm/msm/dp/dp_panel.h   | 11 ++++++
 5 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 90fba03de7f0..a475e787656e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -126,7 +126,7 @@ struct msm_dp_ctrl_private {
 	unsigned int num_link_clks;
 	struct clk_bulk_data *link_clks;
 
-	struct clk *pixel_clk;
+	struct clk *pixel_clk[DP_STREAM_MAX];
 
 	union phy_configure_opts phy_opts;
 
@@ -138,7 +138,7 @@ struct msm_dp_ctrl_private {
 
 	bool core_clks_on;
 	bool link_clks_on;
-	bool stream_clks_on;
+	bool stream_clks_on[DP_STREAM_MAX];
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -1746,7 +1746,7 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->stream_clks_on[DP_STREAM_0]),
 		   str_on_off(ctrl->link_clks_on),
 		   str_on_off(ctrl->core_clks_on));
 
@@ -1765,7 +1765,7 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->stream_clks_on[DP_STREAM_0]),
 		   str_on_off(ctrl->link_clks_on),
 		   str_on_off(ctrl->core_clks_on));
 }
@@ -1796,7 +1796,7 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->stream_clks_on[DP_STREAM_0]),
 		   str_on_off(ctrl->link_clks_on),
 		   str_on_off(ctrl->core_clks_on));
 
@@ -1815,7 +1815,7 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->stream_clks_on[DP_STREAM_0]),
 		   str_on_off(ctrl->link_clks_on),
 		   str_on_off(ctrl->core_clks_on));
 }
@@ -2188,38 +2188,39 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	return success;
 }
 
-static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
+static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
+				    enum msm_dp_stream_id stream_id)
 {
 	int ret;
 
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
+	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
 		return ret;
 	}
 
-	if (WARN_ON_ONCE(ctrl->stream_clks_on))
+	if (WARN_ON_ONCE(ctrl->stream_clks_on[stream_id]))
 		return 0;
 
-	ret = clk_prepare_enable(ctrl->pixel_clk);
+	ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
 		return ret;
 	}
-	ctrl->stream_clks_on = true;
+	ctrl->stream_clks_on[stream_id] = true;
 
 	return ret;
 }
 
-void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
+	if (ctrl->stream_clks_on[stream_id]) {
+		clk_disable_unprepare(ctrl->pixel_clk[stream_id]);
+		ctrl->stream_clks_on[stream_id] = false;
 	}
 }
 
@@ -2240,7 +2241,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, panel->stream_id);
 	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
@@ -2250,7 +2251,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	}
 
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, panel->stream_id);
 
 	msm_dp_ctrl_send_phy_test_pattern(ctrl);
 
@@ -2542,9 +2543,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 		   ctrl->link->link_params.rate,
 		   ctrl->link->link_params.num_lanes);
 
-	drm_dbg_dp(ctrl->drm_dev,
-		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
-		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
+	drm_dbg_dp(ctrl->drm_dev, "core_clk_on=%d link_clk_on=%d\n",
+		   ctrl->core_clks_on, ctrl->link_clks_on);
 
 	if (!ctrl->link_clks_on) { /* link clk is off */
 		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
@@ -2584,7 +2584,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
 
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, panel->stream_id);
 	if (ret)
 		return ret;
 
@@ -2644,8 +2644,6 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(panel);
-
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
@@ -2716,6 +2714,13 @@ static const char *ctrl_clks[] = {
 	"ctrl_link_iface",
 };
 
+static const char * const pixel_clks[] = {
+	"stream_pixel",
+	"stream_1_pixel",
+	"stream_2_pixel",
+	"stream_3_pixel",
+};
+
 static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
@@ -2749,9 +2754,19 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	if (rc)
 		return rc;
 
-	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
-	if (IS_ERR(ctrl->pixel_clk))
-		return PTR_ERR(ctrl->pixel_clk);
+	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
+		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
+
+		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))
+			return PTR_ERR(ctrl->pixel_clk[i]);
+
+		if (IS_ERR(ctrl->pixel_clk[i])) {
+			if (PTR_ERR(ctrl->pixel_clk[i]) != -ENOENT)
+				return PTR_ERR(ctrl->pixel_clk[i]);
+			DRM_DEBUG_DP("stream %d pixel clock not found", i);
+			break;
+		}
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 5902cf7e746a..be0d89d60914 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -24,7 +24,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel);
-void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bea5bfb22967..bb243ab09e66 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -718,7 +718,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
-	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index e76dad0f6663..745ee6976897 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -723,6 +723,7 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
+	msm_dp_panel->stream_id = DP_STREAM_0;
 
 	return msm_dp_panel;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4519ac374220..50a721401751 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -27,6 +27,15 @@ struct msm_dp_panel_psr {
 	u8 capabilities;
 };
 
+/* stream id */
+enum msm_dp_stream_id {
+	DP_STREAM_0,
+	DP_STREAM_1,
+	DP_STREAM_2,
+	DP_STREAM_3,
+	DP_STREAM_MAX,
+};
+
 struct msm_dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
@@ -40,6 +49,8 @@ struct msm_dp_panel {
 	bool vsc_sdp_supported;
 	u32 hw_revision;
 
+	enum msm_dp_stream_id stream_id;
+
 	u32 max_bw_code;
 };
 

-- 
2.43.0


