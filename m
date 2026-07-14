Return-Path: <linux-arm-msm+bounces-119094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +IJoBnSIVmq/8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 21:05:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DBB758163
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 21:05:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ajxEi+LR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XWvjZmBY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119094-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119094-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF3573037EEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833453546EE;
	Tue, 14 Jul 2026 19:01:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE88C347505
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:00:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055660; cv=none; b=sKzp4+ya8tMAFU57eKXm7JPT9AahzqciCGIAwvDAvaMgD7jEucjdCegvnxkx4XRbgV7ys38REplx+wuNKMsO6RaQwr+z0BG0X4Bmu39ZqO2SfIcGga1C/m/x8eitiMiVbZHINflSQ2dbrmIcbwT/uipIX87zoxaBkUvDZ1LAfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055660; c=relaxed/simple;
	bh=7GK9DDlQMpT8QfDTHGaKj8I2AooJphTa7MXU9UGm/CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkn1e9YOjo6zx8yVDGXHXD6Lz87nIcZD8myfItYafU1677RFs8zyeZ9CMPbgs3lBYsNBF5/5v0BPQO55ddiKaS/xHB/mk0USd8dzvnPiv9fXcoaqVdQeUDGjsPjqozEGo97cwrq+CbZsOcTo7XBXRh+o/bk8Oj+xhn9IViIcLso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajxEi+LR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWvjZmBY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EIwMIU1455241
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88t5Q1rCrRBovk001PxYQwOFDJ/w1W3H4voGdGdGz1Y=; b=ajxEi+LRyXllk3mR
	fpOeC2RAeYOad0K9GUVP/LvyIycqMmb5cw6qFmX4MxwRN+iNctrehLAvighMW9Du
	gU0P5pHj0p16sVolAonr2f3gAwYlCfmLy3M3zCKhmB90bDUk9P9ZHvEZWBZD8rap
	JCJv5NaOAs24tYqZzxnWIZEvYk988+35pR3CzBN0HgfSY+GRJPz/RSECPSSMfavZ
	cry0E+ogKB8PJ5QXE3sPyxcf0hy2O1m6E6TLaTYhPhBirLKaHoiiDCqIQ+5zb3sv
	EFiCtDXWuCzoYK2nSLEFz3LEe1rUpZypG7mJl5+NDCrXk9xEEHoDIurAeCnhIWIU
	o03v4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq1r0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:00:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811d5ecf66so1582415a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784055631; x=1784660431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88t5Q1rCrRBovk001PxYQwOFDJ/w1W3H4voGdGdGz1Y=;
        b=XWvjZmBYWqw0NIgzT43Y3TssVzOeCWpf1fw/aM7Ba38vo+X5n7K5r4kNDlJN9xAhU+
         aJfqTsz/rO9lH38DPnnmzaLyyafKhGJGJUaMI5Mk5/HG55Mk0O8yA+qqFZ9G0vHYEPvE
         t0mncUEl7N8S6qIKDOfPGsozjjrZx0RHvHtqgG1idgomyXOEK9Kqm0OyrANfnkyRiH9d
         V++VsvFbmc70H6RjCAd3AmJSCCXkQv8NZYqD0a2zys87VWOZWfbSmpblAnmQ2DPlWC+q
         8a+Oe5IKyg3YGZZyFCcjpIpQoq4MeeW5iMgudkX9sDJDKPoYnp132yTAMbWCeJoEEdIr
         i3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055631; x=1784660431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88t5Q1rCrRBovk001PxYQwOFDJ/w1W3H4voGdGdGz1Y=;
        b=UEFXjTyY8+9T8sA006Hh7LT9BL6rSq8lGVlRMr/UgjxMg8viSN+DQdIBNcl8JvEMoE
         k8+BWYotMaE4iky/r15A+Jwx9mJZECDJnGJMhjGEztxty1ZifCsauWqN1h8pew6rMsha
         JJn4Rifgo0yiCCqoIvOuwmQW99l6iJyhkMzwLOE0pGgRrQEBRnDZ85dM5bhozdhhb44w
         jgcllx/99C7Y+qZVO9d4mQhWHvKiLxCiiQGXVZIJZzZTodfUr1e2YL7UTJS+tizzvYW9
         4nxLENVpmrcqGqt1X9Zzt6ZyLmpOYrItR7kzibhk4p5NY8qUz0xI4n5ZxVXyTwJIM1fG
         j/0g==
X-Forwarded-Encrypted: i=1; AHgh+RphdHsHfr6vTVCZLq45ww0fdxlWOBH6Q1Hxv/GDRwi1p0JdtkTHPvsUJW/nDNtHgT4nVxYMPyVXh3gCzFwS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DLBpszMVMDoSQb9Oll7imwlGws3pGolbnng13PkM1XPUrKDP
	1AJaYymmICUze1KkbaMmqM/I8csUf1Tnav0Gh+osJc/c1G9io7C7fLrQLRWHvJ9H7BwdR9IXMiR
	qV2ZM8SiQqZKgJbCBy+phAIWMcD6+QR+MNTyLoHkyb9xS8EtkYqtHy7I5tXDckVM5W4NK
X-Gm-Gg: AfdE7cnNB48VdcOXy19a7MGliYYgxc7gGS+Bkf2sG6m+5aYRXytwrmJ74Cso7OE/OvO
	nv2msJAriq9QUcwEXdlYHEz7SwvKhajxIqp5iuio2oWiuu1mLIj5WX+TdgzSS1D4p/zDoCHXLs4
	pT0uyNSvKycYEYHujzz0Zcz5ZqeaL4nJkUDGSPHha8dd/VqXmGUW4+uHz/EYy4prRZ5vgTlHfvO
	LkF5RAd5yIhHHMtLAWeCDy2wsxfbZNtu4cAsSDrPMCGNvY7l27Tn5xUGChNNBLqVC2BqiMEqo7H
	PxiKazezgqYs+bC2kRnumfWzt2tNIG5NquTHO0DpBSj+7x4xUXZ30H/TwdE6/4WSa/Q0e4J8Iio
	WU05xdOq4BT/m/eKNoVeIlXQISbFhyZncaEiaLLtqbnkkSJFAIxfe0MuoGz5weVndY5MJWiE=
X-Received: by 2002:a17:90b:4c0f:b0:37d:f70f:fbf8 with SMTP id 98e67ed59e1d1-38dc76069b8mr9790217a91.0.1784055631081;
        Tue, 14 Jul 2026 12:00:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0f:b0:37d:f70f:fbf8 with SMTP id 98e67ed59e1d1-38dc76069b8mr9790176a91.0.1784055630350;
        Tue, 14 Jul 2026 12:00:30 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm56634528eec.12.2026.07.14.12.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:00:30 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:00:25 -0700
Subject: [PATCH v2 1/3] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-enc_roi_enable-v2-1-63683f9dbcef@oss.qualcomm.com>
References: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
In-Reply-To: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055628; l=7340;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=7GK9DDlQMpT8QfDTHGaKj8I2AooJphTa7MXU9UGm/CY=;
 b=7dvywaOemnD8FH1LcfJy29+t4Ch1JXP8Jy1FuXpWHl+ATOsyXIX1JoF6b4N1YsfBlTqZR9lcG
 z/0HxHMeRcXCfwmUfadSJQwVg0qzQIdXC0SHpNeXwOgEsXRSy4b75iF
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a568750 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=o2p6THidDhOa5OcZzacA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: -ay6WUmIAcAi2NSosAnUquB0xOWs1Kmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX3ucE9G73Vryn
 F7X42AoTq9DV35ksQrQ51XG67krAanVMq0KD/2QoKHdlKOc0OgCvIzOi0COlGrHe81sM8RKLxfj
 VSnXL1DoH7fS7ChAqh8DE+ZVZy0r2eT6gQTZ8uwDWH+VXDkVge5K1+gmu26WVND/u4dHrMpGSVc
 ANX7EG2XkVbisuPAyiPAQO5VKGjY/Inhx1lSaq8kSFjb/EWQkpTNcmdlrmKwWwoF5z0nEt/f0HM
 7TzQeJpj4mpjEBkdZVLOK5PzmrxP1n+TigehAYK3sZrc7ofyN23rdtmp8sUyJaDv/pCaWAPFOZZ
 Z9A5biGT8g+hTvVYZu+4oxwM0f70g+QkvooA6q26sUdJog+JH4o09kQcnekgL0B0awLD1XIl+7q
 bFevOFP+djr4d+ZoQM95EdIY7by4oesllP7B5uilOja2L4Vg5y8FUWaGNAHjiGRZke0sIf3+And
 rX/nx8qoR3byW6Y/zVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfXyAEQjZtVjYZN
 fRUICbjg4JInXoHCtKYJkqkWcplekTWJ9TLwMqBrpzRrJLZI/Ujjvhcl+kJGg7E5t7Wc6F+ziQs
 yVfSzrYJNxF5PHU2/CK7E/oP0VUUwwQ=
X-Proofpoint-ORIG-GUID: -ay6WUmIAcAi2NSosAnUquB0xOWs1Kmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119094-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6DBB758163

Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst  | 14 ++++++++++++++
 .../userspace-api/media/v4l/videodev2.h.rst.exceptions     |  1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst         |  4 ++++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst |  6 ++++++
 include/media/v4l2-ctrls.h                                 |  1 +
 include/uapi/linux/v4l2-controls.h                         |  2 ++
 include/uapi/linux/videodev2.h                             |  3 +++
 7 files changed, 31 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..1995e7335fb29611151c61561df577f2bdac7a48 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (integer)``
+    This custom control is used to set ROI MB map delta_Qp for whole frame.
+    The frame is divided into grid with MB Size returned from querying
+    V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE. Each block is configured with delta_Qp
+    in raster order. The valid range for delta_Qp is encoder dependent.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE (integer)``
+    This read-only control returns the MB Size for ROI MB delta_Qp map.
+    Its valid range depends on encoder supported codec format.
+    Example: For H.264, 16 is returned for 16x16 MB size.
+    For HEVC, 32 is returned for 32x32 MB size.
+    Depending on the size returned, delta_Qp Map is set to the encoder.
+
 .. raw:: latex
 
     \normalsize
diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd808979fc590715125f689880e5a30e..8d5eec357509700c9a582b98c14843bb5e483be0 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -185,6 +185,10 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * - __s8 *
+      - ``p_s8``
+      - A pointer to a matrix control of signed 8-bit values. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_S8``.
     * - __s32 *
       - ``p_s32``
       - A pointer to a matrix control of signed 32-bit values. Valid if
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
       - any
       - An unsigned 32-bit valued control ranging from minimum to maximum
 	inclusive. The step value indicates the increment between values.
+    * - ``V4L2_CTRL_TYPE_S8``
+      - any
+      - any
+      - any
+      - A signed 8-bit valued control ranging from minimum to maximum
+	inclusive. The step value indicates the increment between values.
     * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
+	s8 *p_s8;
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc14a90a230601d8e23b0e13845d34..1e307781645543960e4b73ba46fdf83279fda4dd 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1880,6 +1880,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char __user *string;
 		__u8 __user *p_u8;
+		__s8 __user *p_s8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		__s32 __user *p_s32;
@@ -1957,6 +1958,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	V4L2_CTRL_TYPE_S8		 = 0x0103,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
@@ -1993,6 +1995,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */

-- 
2.34.1


