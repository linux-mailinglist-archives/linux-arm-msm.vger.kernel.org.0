Return-Path: <linux-arm-msm+bounces-115146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h4KbBvyAQmrl8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE96DC085
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GrtZ5hlf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eMoeFLDU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115146-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115146-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A72A31B4C86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04853C4551;
	Mon, 29 Jun 2026 14:16:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048E413D93
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742601; cv=none; b=Xa70hukaRtKADx6fdAN0/979YiNAMk/Sn6btIz2p/27CkFWnU/HutalM1Os8ynofTXBsDtd+cC9s2V9SmS+o6dZmQXW8Tbii5UEq5uk8gq5AFXDErhgWk2HNynFjUIHRhOicCHgfD19yBwSMzwM+ty9FOVAT32814ofZxnzEz1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742601; c=relaxed/simple;
	bh=M8HporrHR4TroPqsNLp1fnzaVZtixFKytOyYesj4iZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lz/o1fp3TdPjQRdvGl18ivQD3KJ5JyVeRbbc+F06lShFvY76pB3XDLMaEiZ81rsqoquQJw4NjBeT4OC2YJ7zXPKlr4ARvDK8KiSOD7Kr09KNbfV2Nq6XMUdsBYQWIh8avwRfDjA23DVcD6PdJwpv8DnZvPnoY2DaNuE6QDIiRds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrtZ5hlf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMoeFLDU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT8Xc2627963
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZJyjmKYjOSNQb7RA0taR2J0lFRDRngR4/4RIKL4IXo=; b=GrtZ5hlfGt7Fo2jH
	KYdYhZagYISOsKafHAae+WA9W7lZts5Mw1ZKnG1jrRwowQ3eN7wNAhrk+GWMidfa
	87C5jj/fs/sfmMdN3GZGf2pqZUOAnB87raPfHblefpSs4kT3hfvv8iBEZUI2mZYq
	hcEToKorsc5BoYX1k4i0JU9Ll8Lf6XYkc0VPnR7BzsUiS7lKC7imXzhZFuACwzF7
	SGiZykKobnMqTJKZe4bndiV1Ga83K8J8qu7Cthrs0V+zQKfhJ9zZwCpVAqwPIlUt
	PZlLjyD/1XgBIvOqNR2x32YswgajN5Dof4qAFea0q8ZL7i1QOjGMHFMGqec7pgIF
	dU+Q5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs92g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso871981485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742599; x=1783347399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZJyjmKYjOSNQb7RA0taR2J0lFRDRngR4/4RIKL4IXo=;
        b=eMoeFLDUJ1FwPsS+yd5PnvIZrJgUBsDIdjPWNc89TA4JyKCRirMql+/50GdvvFPhns
         r7wqgeuWspsqR9BSQmpiowY5ZbRI9TU6cfP0aAJSG7s5TfIuF/XB2IP37ARcvo8vEABc
         pvWmss1v1jrt9pqgpvv5muJk4k9Rrz3h2T0N7GZibtaEEfMPQAiCxIgtnRuKud2tNc1Y
         jrwPhkhvyni9XEhzPiKKkEI/5qeUNp6OHUVp+Lnmjnpt9//2wblP7YyzuKV3B1aqQmXC
         WlkEtP4D2hZ3PZdEGfI/jUpZ8tldKRQYruLTZ2UQZJIyj6iJ4mjzBOL1yGxcOCOxysh1
         cNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742599; x=1783347399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hZJyjmKYjOSNQb7RA0taR2J0lFRDRngR4/4RIKL4IXo=;
        b=W7rBAP4hp8mRdY4rzV6UTew8TVP4ceIEokgFCNoMEPehjGfcrpMw7VAxgWe6OFr2vi
         7KWmVLR0ZT4o9pHEeSqHgbmaEmvyxf/RMJO1n/XiSicAGKN/Rj8xxGTMn13IiP8TVo0O
         VoK/iO/Ei55B0XLOUZZatK2DissOY/HEYPstpn/g9NlDi092jNvnzxdq6oOWPpRV8Ito
         E483jID66M87HJ/OI5kNd35oOFmcQoLEH/xeD48reeMMzSsQJYgbDHILecK3+TFFY8mn
         32XxLYzw9ENMDLi1mhG3YF5eQPHYyg4orXoXp0h2WguSTOEk4n+2A6TCPe08F2p5X81V
         hm5w==
X-Gm-Message-State: AOJu0Yya29SYnrCA5SNZ6LfOVC8KvZfYG73G1g25QEZ9/+xeuN2/3FU6
	S/QogwM6fIg1Tklx+nz8zLFNefyft4laQf1zEp1aGavVN4j/B5u/xLSbOItS7iyjBrLUIm5vq4Q
	s+nNx0F2R/3tjRt447qWKnvgDz/e/GKX0L3lrlnmvDvFWmEpF4f4y8bIHO9X7PJWPgJBC
X-Gm-Gg: AfdE7cnnKiudJda4GWqd4l0wqv/aMbzWwPc0CI1sgeDc0lk8xDcPAt6JkAPpvHwTQrZ
	sfeKeNAHP+7AVnu/FsqCwQ+KiNrC3Mal6dgwbGjHUCCz8OgUndGivJqP3g0JGht/aEsFu5BjRiw
	cX8BenITwqZIpUX+dQpvX25pE+6vKnz+VNKp9i2aX1an1b39/1zoRVKRFVWeUUTn7DpyUCHyID4
	3kG0eEU5St6grAQpDAxvyycskqsrZ7O+8yMRWpEaOB03MrCj5cXNSxGG8SfQn2483ICCtOdNxi2
	Co94CpAKkGr8bPTQD9QwNOh3hB2qhdPkcQmA2x5N4hOsscp5WVGwFY66Kq+sWdcyuQDxLAUYpQa
	xUfQ+9mYgfuaOAbEgvy8hFY53ei5Hz+iSsWxsMQI96Ad8DG3L/0aZjrnT203JlHGMHJoFJA==
X-Received: by 2002:a05:620a:4409:b0:915:8502:f7fc with SMTP id af79cd13be357-9293a6b149dmr2490994285a.16.1782742598583;
        Mon, 29 Jun 2026 07:16:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:915:8502:f7fc with SMTP id af79cd13be357-9293a6b149dmr2490988785a.16.1782742598029;
        Mon, 29 Jun 2026 07:16:38 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND v5 18/25] drm/msm/dpu: initialize encoders per stream for DP MST
Date: Mon, 29 Jun 2026 22:14:39 +0800
Message-ID: <20260629-msm-dp-mst-v5-18-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=2431; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=M8HporrHR4TroPqsNLp1fnzaVZtixFKytOyYesj4iZk=; b=lIVxLBznHHgdMi6x0uKdG+bKoS0Cn3KqoZrNI2q82E5yBFPEaiWOGengt+Qhfx+QPw9ePWBkW dm9FD0D9McxCYC3FlVyKh2eVWP7U7ptF2zGAsynxKpcfiJnCadTsdBn
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TIoGzUvDxGWykj5TBUOsAyr52WYk0r3A
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a427e47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CHjaKMol-vWaWBnFkvwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX1fq0sbR6iX0k
 0nx9LjCvtnboI2l6lH6HayiTX52Gy3Zcp+fj2O68aOnOM6i5P6pxE6SEXfqCqemC42YF8JTfWZc
 3yQr9DBZ0JS4vrJQu1thhK5KscujRJw=
X-Proofpoint-GUID: TIoGzUvDxGWykj5TBUOsAyr52WYk0r3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX/QpAaGqYofUS
 w9kTKfjE/oSuVwANXAa1+qaSOxhjCNfp4696MgswbOvPDFuIalwsqIffXTIrB6yCCkljtGHpzaP
 BgZR67ZrHiGRl79kKaCTrNwfbNLqGc09yk3vCyJ8S3HOh0I8JRPOR2VTqEbAd3FRq383ZxQIm3J
 bfCvj7fvPN1ERY+ksz0uRENL0SR4szwbdYl+Z96rFoRxwCiLpfuN76vQYFRaaaWwwvqkunLlQdD
 qHciYAywZUv6OatB06tZT8SK8aUqVUO+JiXGVPPMVc+ar7MHU5k8iW91LvST6oTXikjDgo2VwZw
 QmI/DAwMVHIy/9VNgUOx7bVBqlG/5KKiNIndyErDV9WLr3T4z1PMmePONlDUYDxDLsGIk0xcmi9
 aXxCbravdCIwIXJZd6hKuAECm4r5+kF+menvMxWJXdS3Wg4LOlHIiu5jjvM1Sm9BIv8cpfPZl7y
 a3jzk05qWRWAqBp0KfQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115146-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 6EBE96DC085

Simply initialize MST encoders for MST-capable DP controllers, and
introduce msm_dp_get_mst_max_stream to query MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h           |  7 ++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..7a00c4094d5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -655,7 +655,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct msm_display_info info;
 	bool yuv_supported;
 	int rc;
-	int i;
+	int i, stream_id, stream_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
 		if (!priv->kms->dp[i])
@@ -678,6 +678,18 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
 		}
+
+		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
+
+		if (stream_cnt > 1) {
+			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+				if (IS_ERR(encoder)) {
+					DPU_ERROR("encoder init failed for dp mst display\n");
+					return PTR_ERR(encoder);
+				}
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c3fb3205f683..5fee0b291059 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -355,7 +355,7 @@ bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
-
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -372,6 +372,11 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
+static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.43.0


