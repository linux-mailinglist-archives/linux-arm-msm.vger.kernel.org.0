Return-Path: <linux-arm-msm+bounces-115147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /6HMFHqBQmoK8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:30:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF176DC0E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:30:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JXFiJjnC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YntpBC0N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115147-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115147-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4640131AC9ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F38D405840;
	Mon, 29 Jun 2026 14:16:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F201394780
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742612; cv=none; b=TK5jJP1IHbDbQbmb8WnXdvCU0S/aNLdHTcLGg4n/N2Xap+8E/6Xt5s/L2ICIQ9cBDtTKHAoErpgPChjnrmrPPQMfv02gWDu4xsw7MUPbWLv3FZhxO6rKy/dYgexdFvMc0CYF/Wr+lueG8k/JugcjMeafof62N5LrZZ7u5+K6TB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742612; c=relaxed/simple;
	bh=ZmA6j9PaSgiCKIx18GfrmSXgrNCTuY6lHFe4jcnsXM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+SYBPILJngOKYZIyIHKxgzcmeHhHGYYWt0BB1x3AWv6I1kCMfOFPCF7O2CNbyOJQDTFT1IRgS/PZkmsNWtdYvl1EhdO5hqnEGHEVsA/CqCxP+uNdN0NP8C8nbBVYO9eoZID2pHOxYY+69VP/nfB9VvfzJlyHsaYK09FY1gpF2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXFiJjnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YntpBC0N; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5FwO2728545
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTRODGoRdiTbi9v1uwQEXTif90CmJA2jnvlNqKTiqQE=; b=JXFiJjnCoOH0JiAW
	fbz6LJ4Rq7zsariBN2F26SwD9Jk+OQX4C2EIr7YTPWMwejMSXEyD4wXGdLXTnCqS
	FP0DVLAtuVChwSTE3JzNP5xkha3+fVDyB2rbqmqHmehljZE3MP7xcKq0odvVl8eJ
	Zk07D2IER2QxZ7NQIVabE3bJoUlKOktW5HcBCUmeUZq4JAvdMLwWxQy2r7I4oXdX
	g2/XnR2fdrJRH3LwuXzdQoDALUq1hoGZeiJQlxDmxEZNBR420HZ/5txmRH/t+hWP
	rj0koHNwRSscV5QP0IWwSHhD5vX6NE4bEQ/IXIY2CWNZtgokQhAhz5viADKDEhmZ
	iM3zMA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha8pkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737f663b020so935350137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742609; x=1783347409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTRODGoRdiTbi9v1uwQEXTif90CmJA2jnvlNqKTiqQE=;
        b=YntpBC0NrCj0cxtL114FZnOlZGh6OFzcdeG3iV4yEj6VpBRNmIi9F7RfSuFu8L+J6P
         lC0O+gnjluL9hTfBJwIPIQ87fN7V5ctiIGItSwS561UjsecR+LQ6fb67TXjWkqViMP98
         BzaTrq8pQf9JEE7YQnmREFQvIkIauG8rhbfNFLynM4rgR1smKhMA7iHnM1h5UY06Ql2y
         1iG/TXL+5UQuyRZj6/mgyWPOhLNOJTsbAcIcczzoARzTRTE9p43lOTCd9EtxleVSwaDl
         UFKDhrkMbBJsyVRs75FIkxX95wdKuqg/WcnkNfNClDJ1MBiltqCRCLzUUkf2LHeH1c+m
         BFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742609; x=1783347409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTRODGoRdiTbi9v1uwQEXTif90CmJA2jnvlNqKTiqQE=;
        b=S1AwNuijUmwWq7YiXE2th3Fuqbm7b0nZmGzCgUUpPddlGZsYoSvK490aPvGc9MawwL
         AB79tdjqThTm8u+uqxgqGnNGxzwL9pXt4nO3dSxQwMRPi1FKyrNifsYVQ6EJ/6i+Gs0p
         pVl498ZI+Dn66/GAbjPKjXW9HnlALOxCDzT4CDBFC0Y4vtT6snKdNvS5kUvR+1+7EcPj
         tmu4z/bB+tnOyOCeqFqLG6Um6vNjcKrE6tjWcdeiiLjz/a2Et8Dket2KQS2DiGYVv7we
         uk4n+LxCy8pR/rn0CtTIjN68X37XeN+Ij1LYBKxPRa771eq8NCO17EuclOwGRbrvFA72
         LbAg==
X-Gm-Message-State: AOJu0YyKc1lk95AYp8zYk7QXAOOxJK+/bOVUyHhlpGCeTId0dKNFUpvn
	myehW51aWXZ8YUf5zpetBSSxmVtjLxPOxbk/YgSIrVZ5jn+a0vSVj92wkCuFrm669QpGHl3Pd5l
	kl2olDEm3jrMt81bL/YyG7eJ/ifd3HMNt/lwL/CIsVmsraRvGgHeZ1or7zd8OUrBmdvGG
X-Gm-Gg: AfdE7cl7Cep/Bq+ATUCyOfO4rg+iVsT2OnY9HsHX/LUDL4vGoBvit3lUV1Y2U9TQ/a6
	RsYZttfnejN7RICID3CLXUNe2pRNTMbptF4wBtTtX4G+WG+Hct7R7foOhTj1ZisPU+ejBC9yQGs
	qp/a9v/hPjLcUO6fmA4rawqOffAPbh3K3OThV557q3EL1dPp8E6iKdUBhgj0LmWcL9MTHKDAwYd
	Spr5pW5Ig1vhXFQ62EQxNnLfX+hJLd2+VIE8MoFn0QWoALESc6gahB5KNiM4p6n9zH/rcx68FpR
	n5wOlP7pMirD6avpTu/pF/DztAaQGWfxDQRcLLTipspTTYUfElrrApGPinEFzUfCo38vTO4Xn+h
	aIEoVZ+D+Bb4CW/Ehy8BV9UsV6wchn1U4v0hclVUjcLnBFscIFeA9LimvSWBYuAqhaZj37Q==
X-Received: by 2002:a05:6102:6c2:b0:738:5e0:b40e with SMTP id ada2fe7eead31-73805e0c206mr2379928137.27.1782742608396;
        Mon, 29 Jun 2026 07:16:48 -0700 (PDT)
X-Received: by 2002:a05:6102:6c2:b0:738:5e0:b40e with SMTP id ada2fe7eead31-73805e0c206mr2378903137.27.1782742602665;
        Mon, 29 Jun 2026 07:16:42 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:42 -0700 (PDT)
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
Subject: [PATCH RESEND v5 19/25] drm/msm/dp: initialize dp_mst module for each DP MST controller
Date: Mon, 29 Jun 2026 22:14:40 +0800
Message-ID: <20260629-msm-dp-mst-v5-19-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=7456; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=6XyUS6qRZs5X6/pKt4qoYuSBISthOP33nj+/4w99iLA=; b=Fo5ChQ3bWGgWBF0ZWi5k8jQ2i+CvNMg3W9DPQMRLKcyjDMZpjLyydl74DKrpXMWWhsVjDASs/ ypflVn3ZpTvCDzXJiqZjye7acqdpx64YLx7BP+5FjeNxGLgIk8QVfet
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J5OGOHFwboVxnV47EimvZ-C_syi0BAfk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX3F6wm7RFxIiF
 NybfycZnI9AxNsoefn48ZMjZnLEq2MeMXrQNYIRNtB3DTfN+GQhc3mPn4LwmtGM6VZiGOxH062X
 tp3BLHmlX8C3V0E7c267YiibvFIksj6ahgBlzsryF2U16bXkujPjhFSrHwuBCCpo9ZmFmsAvBLz
 Rx9a3krONm+/VJYw+MuWIUTuhue7Rn4Dq0POHWkyvs6I3FcyD0aAOyU6Qk9h2LLzDg29n7oWbgQ
 FgOHyULg/l6OBAHq37L9eKuioUHTMDOgUSpXnt0mByM/UcaY+5ozTe9XlyrwpxqtP6yJ15Vimi5
 YibwNKBnpwqGYeE/otPyWemcxXJTgbvwqL8N6SF0AEcbmePJtMnmN/nH4J7N9iwrcNywxyZKO6X
 IRSmmTprMksphQz0M6VHUaSwN6pZwMl5aSIujjeNw20L2ZmuwOM3rEihCxh31XIuzInqT0UHyKW
 YiwyCkuG55NJiMbySeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX40psJjKlkllX
 vSWU54n9aAlpTzn7fMyOEnLTDRgbIN7zO4XXFJ+tRTCujt+MGJxDmZlfIGKC37wvMlBsCfDaeG9
 zINV0nUSLZzxojaWQMchmF7pZNHX06E=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a427e51 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Tb4r1nT5KeEeR2f--GEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J5OGOHFwboVxnV47EimvZ-C_syi0BAfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
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
	TAGGED_FROM(0.00)[bounces-115147-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: BCF176DC0E9

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For each MST capable DP controller, initialize a dp_mst module to
manage its DP MST operations. The DP MST module for each controller
is the central entity to manage its topology related operations as
well as interfacing with the rest of the DP driver.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile            |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  6 ++++
 drivers/gpu/drm/msm/dp/dp_display.c     | 18 ++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h     |  2 ++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c     | 60 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h     | 13 +++++++
 drivers/gpu/drm/msm/msm_drv.h           |  6 ++++
 7 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index ba45e99be05b..d510be1c173f 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -145,7 +145,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_audio.o \
-	dp/dp_utils.o
+	dp/dp_utils.o \
+	dp/dp_mst_drm.o
 
 msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7a00c4094d5c..91d33b432427 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -682,6 +682,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
 
 		if (stream_cnt > 1) {
+			rc = msm_dp_mst_register(priv->kms->dp[i]);
+			if (rc) {
+				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
+				return rc;
+			}
+
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
 				if (IS_ERR(encoder)) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d56ee10ee065..fc9c1e3e57ab 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -28,6 +28,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -351,6 +352,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
 		msm_dp_display_mst_init(dp);
 
+	if (dp->msm_dp_display.mst_active)
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
@@ -522,6 +526,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -1530,6 +1539,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
+int msm_dp_mst_register(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_mst_init(msm_dp_display, dp->max_stream, dp->aux);
+}
+
 int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 				   struct drm_atomic_commit *state,
 				   struct drm_encoder *drm_encoder,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 0464f8941e8d..a185819ec57e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,6 +24,8 @@ struct msm_dp {
 	bool is_edp;
 	bool link_ready;
 
+	void *msm_dp_mst;
+
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
new file mode 100644
index 000000000000..78b8dffe111b
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <drm/drm_edid.h>
+#include <drm/display/drm_dp_mst_helper.h>
+
+#include "dp_mst_drm.h"
+#include "dp_panel.h"
+
+struct msm_dp_mst {
+	struct drm_dp_mst_topology_mgr mst_mgr;
+	struct msm_dp *msm_dp;
+	struct drm_dp_aux *dp_aux;
+	u32 max_streams;
+};
+
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	int rc;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to set topology mgr state to %d rc:%d\n", state, rc);
+	}
+
+	drm_dbg_kms(dp_display->drm_dev, "[MST] set_mgr_state state:%d\n", state);
+	return rc;
+}
+
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
+{
+	struct drm_device *dev = dp_display->drm_dev;
+	struct msm_dp_mst *mst;
+	int ret;
+
+	mst = devm_kzalloc(dev->dev, sizeof(*mst), GFP_KERNEL);
+	if (!mst)
+		return -ENOMEM;
+
+	mst->msm_dp = dp_display;
+	mst->max_streams = max_streams;
+	mst->dp_aux = drm_aux;
+
+	ret = drm_dp_mst_topology_mgr_init(&mst->mst_mgr, dev,
+					   drm_aux,
+					   16,
+					   max_streams,
+					   dp_display->connector->base.id);
+	if (ret) {
+		drm_err(dev, "[MST] topology manager init failed\n");
+		return ret;
+	}
+
+	dp_display->msm_dp_mst = mst;
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
new file mode 100644
index 000000000000..5d411529f681
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DP_MST_DRM_H_
+#define _DP_MST_DRM_H_
+
+#include "dp_display.h"
+
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
+
+#endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 5fee0b291059..963303079220 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -356,6 +356,7 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
+int msm_dp_mst_register(struct msm_dp *dp_display);
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -377,6 +378,11 @@ static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_register(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.43.0


