Return-Path: <linux-arm-msm+bounces-102645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFxeF0PG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5183D51BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 412263037F19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC74A37703A;
	Fri, 10 Apr 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3gopdGr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9Wxb0o/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52533C061A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813748; cv=none; b=o8tHvLI5EaKVDzncNw6eEedKB7Cm7bVeil9K9fC2EC4E3f0B/asISYL4bG7EfrfYaORSWs/lF/9gzYmAXNEs4luAGLURx5Mtw5cJJTeJPImug9Cgm8oYw0DzPuL42i5mL8ORgsarqHkMtfjzSYWP0wee85Uy1v0ZF25nx6dLHqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813748; c=relaxed/simple;
	bh=Q5hqp9+QZ65GSDu2PPzGySIlV6NAhUrhoK8apwSoxN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2jQ72nJ3IG8u69vT7oIRc3dqp0R5djPEsIDo67BefuTzpVAcjVxnraesp9/4R8hCQD68ecrX7OsAF1TOUoNMbS9kzkGdpIWuvfHdBpIGfz/VVGYvqzG3cxrObfJ4MZXPAoCfd8E9qm084KAGf/qOM1/O62f7U4YrC59XJCNym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3gopdGr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9Wxb0o/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6wvOT1729913
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	62xFHJ/rwzZUmyAq//ZcguSv87877vbIJqXyB2J830g=; b=R3gopdGr3Qu+8JEi
	H3R9JOr149EHe83W+YdIGXdcjyXDfvUXPG08thd/nmB+xDQ/CAklKNHVKCXacbSP
	f13uk5rIf+mQpV+5JLiubPAzDjBPnCPDIQCPXM6f6rfGEgVzf2VVsWxaEvVarimo
	caBouYjCasi6EDZF8Xgnc/CPSAdrL9eKlsD3TvjI1Vvj/2BxEXxUdGpEM8ToDMqz
	eXBbAzwKNnCrX6LPiglDnmGHpFZngEN6w2+pyM6QwFnK/G6SJO/Y4aJd7tjEkPkI
	rC7ETq7dB7qSUPmM8ELqByG/6xRvXkfQrzvTPhOFfZCz6N6iK841/jzUIAK+QwcM
	FZo+5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxkn7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso22951861cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813744; x=1776418544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62xFHJ/rwzZUmyAq//ZcguSv87877vbIJqXyB2J830g=;
        b=D9Wxb0o/mVyIhledtILsiEyRoTo2Q4blU9fgKUVEmRocIoYxztHF8oN+akNTJ4kqvN
         5gCqLVwIhaS9XPWjXdVm1sCYUIhjoQK7iyirEroUxz7vF1DSl1XDFFA7JXBPj3SCg5VS
         JRZDL29kKWbW6eGkOjS+wiaUpkCegyHw+lyuDgghJahVyMm4UJLvhF27KG3x2GhOcCn7
         OqpAYyKwCDfkyZsAw4Dts8RfbgPT5RO7pKC6rF7gEET7TPr9ZsbHsRHNPhZeAhDrsDHz
         gl6RAuzp5JZHYh8ciuNnM+3k8Wxvbnd7naopX2Zv/dpmzOqw2jUV/uiqB7zdQ+UaJ3w+
         3nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813744; x=1776418544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62xFHJ/rwzZUmyAq//ZcguSv87877vbIJqXyB2J830g=;
        b=P54EZzK0XZfydZ+h2qYnOgzjYFntDwJq3OsRWrrxHJMX+MoYVZR8VnUuLksYdPXS7V
         nHmOWnOEglw62LqhtvezN/IEnDp9GEyUyr7bElKfKsj6XMv8vwAIUtI5KzPpoGGSPlwZ
         n2+JyAlkds+/5J0zkgoW9dy5KEixpJN8T9BtrrA2tpC/KztvmZRvPAf/htAZ98zCRcr5
         JeRhAdnV963QCg880ziNTIPVO8N+zNDU8eAABfaRd5xMqpLPaG787UIKgzC50kuhxfMa
         ibaIvymuSYUbPhm0bcd20CiGMTH1GSFdneaMs1oWXW7J2ZF01iThNdfdH1G1ZN24yb2b
         gwcg==
X-Gm-Message-State: AOJu0YwjqKMQ0UwWQIEw2sYkN1zbp9+2QFKm+Uqs3+Z1PT0hzZHusvg3
	gL5b7EKTare/XBd2cbBuLxHBZ2luZKU/rrbrB5Bc3QFKePVMVNbgYmh4/57rf3P23s+CsKNDPlC
	2u+ICq6lbyCfKiO9cNBu2yzuXyEyA2fkfjUmHcazK5smnlEqxEwdG5ED5NYis9IWvWnfeegfRfQ
	RGGuTxiA==
X-Gm-Gg: AeBDietgKybMjaexh7gUh9ULXx4OMuaxaiJGbKPKrdIvHQp+2g8lqtf+YjF6zVi6wNW
	MvCvKMFY13mYmfxkj7MxFXqIswygM7s3/yZd2YkU1VweE75aE0HlwBhax93k1HbrTqEwQEzCqKo
	42rSvS3EzAoC127hqcV33AkG1y8S20MNqfCg7ovuYzSv6ZjmJdifaWVxNVIIopQj6bIv+Ox/q6o
	Y1g7JiKmqYFf9/wsa6MK4IxkMPjucFP6KXyNpVND9si5eunpn4EkV3ce/YctJxSMvG9xb/z7ned
	X3JJZ8swZfE+PL80tet2a9mXRgQnn0Uzy8tWQnhLF8WzyJrrAzRQB2PtZAO9DZ0Wf4qj0HXEbQh
	3sSAAcieFuFa9CgIhx00hL/IkRRtZNS8KQFQNpNX4IR2nUgZC4/DjlLFMl0cvOECdK7SpEZdyPj
	dcu+I7U2I=
X-Received: by 2002:a05:622a:229c:b0:50d:7686:7ee0 with SMTP id d75a77b69052e-50dd5adaba6mr36505221cf.24.1775813744128;
        Fri, 10 Apr 2026 02:35:44 -0700 (PDT)
X-Received: by 2002:a05:622a:229c:b0:50d:7686:7ee0 with SMTP id d75a77b69052e-50dd5adaba6mr36505041cf.24.1775813743654;
        Fri, 10 Apr 2026 02:35:43 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:43 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:57 +0800
Subject: [PATCH v4 22/39] drm/msm/dp: Add support for sending VCPF packets
 in DP controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-22-b20518dea8de@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=7461;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=qLN1sgnjnXdzDFjL9GGnHUfEboM6TOEGPJSsbnwJUCg=;
 b=BDBJKS1Cz8Xv5IhUCtFh0MmmNLCtUkrxpFZpPMpuYKyr1UGpJGBmbrOnwKpp65ztC0uJdUexf
 AcFuAHRb6VDAKMW4GteQMKuF8rH0H5JYlhXghQWin/0s1MQBghCvEXP
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: lbFE7dvTBLhswONbZWcFiSEDY5jd3U8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX4cOSZYcrG+Kf
 HwvrcVjbkrpm5fIxqHjp3/D8clygBAIOliHnD9aq5D2DMtrJSMBk8YagO2wGrH/OnHdykaqt9ZK
 u+6EThoMgKM6n5KciQCgEsOcFeewDzEoJAAqBEKDmw7JKrhmTq81amnnUjN3SJe4A2+3uzq/LuS
 Ts5h7xTgblZ9bwhE26s4AlV+kMtbXlp0+IuIAocSt98ioriL//6IET5FJqYKaIJ+dkZx3iv4E5a
 lY1m9JcYAAcK0j9SsRz8JyTV/uMkiFSpQIX4rri2uoftO6HyISRrZHXzxCrJGeFJCmyf0PWD8++
 +e06yQRy0/lHt1/ZGF+9evN68X+eEpzhY82Vqbp8JrAm7nmsYLRjvm/xMiS9HmOPXtn31DMKKLk
 scji6RV/W6H55KKlNIak8eVTW3ys9uXz9znrSxlmPmwyd7oHCiczkwrd+bac1sA6N7H0KlFI5G2
 bi/EHMPDBmF57EKUWmQ==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8c471 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=unrKvF7sv23klRea54oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lbFE7dvTBLhswONbZWcFiSEDY5jd3U8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102645-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB5183D51BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The VC Payload Fill (VCPF) sequence is inserted by the DP controller
when stream symbols are absent, typically before a stream is disabled.
This patch adds support for triggering the VCPF sequence in the MSM DP
controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 55 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |  5 ++++
 4 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e64f81bc8c36..9907f2e56e65 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -65,9 +65,18 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_INTERRUPT_STATUS5 \
+	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
+#define DP_INTERRUPT_STATUS5_MASK \
+	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
+#define DP_DP0_PUSH_VCPF		BIT(12)
+#define DP_DP1_PUSH_VCPF		BIT(14)
+#define DP_MSTLINK_PUSH_VCPF		BIT(12)
+
 #define MR_LINK_TRAINING1  0x8
 #define MR_LINK_SYMBOL_ERM 0x80
 #define MR_LINK_PRBS7 0x100
@@ -405,6 +414,8 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 			DP_INTERRUPT_STATUS1_MASK);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 DP_INTERRUPT_STATUS5_MASK);
 }
 
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -414,6 +425,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -433,6 +445,20 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
+static u32 msm_dp_ctrl_get_mst_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS5);
+	intr &= ~DP_INTERRUPT_STATUS5_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS5)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
+
+	return intr;
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 val;
@@ -516,14 +542,28 @@ static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
 	return true;
 }
 
-void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
+	u32 state = 0x0;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	if (!ctrl->mst_active)
+		state |= DP_STATE_CTRL_PUSH_IDLE;
+	else if (msm_dp_panel->stream_id == DP_STREAM_0)
+		state |= DP_DP0_PUSH_VCPF;
+	else if (msm_dp_panel->stream_id == DP_STREAM_1)
+		state |= DP_DP1_PUSH_VCPF;
+	else
+		state |= DP_MSTLINK_PUSH_VCPF;
+
 	reinit_completion(&ctrl->idle_comp);
-	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
+
+	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
+			  msm_dp_panel->stream_id > 1 ?
+			  REG_DP_MSTLINK_STATE_CTRL : REG_DP_STATE_CTRL,
+			  state);
 
 	if (!wait_for_completion_timeout(&ctrl->idle_comp,
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
@@ -2073,7 +2113,7 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
 			return;
 		}
 
-		msm_dp_ctrl_push_idle(msm_dp_ctrl);
+		msm_dp_ctrl_push_idle(msm_dp_ctrl, ctrl->panel);
 		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
 
 		msm_dp_ctrl_psr_mainlink_disable(ctrl);
@@ -2183,7 +2223,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 	int ret = 0;
 	int training_step = DP_TRAINING_NONE;
 
-	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl, ctrl->panel);
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -3005,6 +3045,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 		ret = IRQ_HANDLED;
 	}
 
+	isr = msm_dp_ctrl_get_mst_interrupt(ctrl);
+	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
+		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
+	}
+
 	/* DP aux isr */
 	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
 	if (isr)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index c59338199399..cfe7e4496943 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
-void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e0bf4dffa6af..e8028402f748 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1557,7 +1557,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(dp->ctrl);
+	msm_dp_ctrl_push_idle(dp->ctrl, dp->panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
 	msm_dp_ctrl_mst_send_act(dp->ctrl);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 835a55446868..65695fcb48d0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -42,9 +42,13 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
+#define DP_INTR_DP0_VCPF_SENT		BIT(0)
+#define DP_INTR_DP1_VCPF_SENT		BIT(3)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)
+#define REG_DP_INTR_STATUS5			(0x00000034)
 #define PSR_UPDATE_INT				(0x00000001)
 #define PSR_CAPTURE_INT				(0x00000004)
 #define PSR_EXIT_INT				(0x00000010)
@@ -356,6 +360,7 @@
 #define REG_DP_DP0_RG				(0x000004F8)
 #define REG_DP_DP1_RG				(0x000004FC)
 
+#define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
 #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
 #define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
 #define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)

-- 
2.43.0


