Return-Path: <linux-arm-msm+bounces-104480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCDBFH+I62n8NwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:13:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 184E04609E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8804B3012E78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1543C3BE0;
	Fri, 24 Apr 2026 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNiqVHra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rzpc1jdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF7346A13
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043536; cv=none; b=d6tsfoEL4nts8/mzXqeXsWnDDsxtsOdFiof5PNSEXrvr0vQDXFgNeJsu6ad0LT2NP/WJMd6/HMOF1tjMGZnUOjA54Y3n0GmX+UxO84PDQWtwAcxaO8yBMBmSEbI3ycTaJxyOWZ6YXuwqmn2//JTGQGGUQ5AODgdh/Ca7M35yrTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043536; c=relaxed/simple;
	bh=yPWb66bAIoSeoVbGKbJy3czH0fsxgSHyCkFJ/vJx4nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mb/nA9/iYmJaMnhV+icBuNNi9dfUk60AvoEtwMnXYE9WUKT2XP8tXwpEwXMH2nvw67xHY3KrORANTPG0nNotXGXfr0rn2h/f5IucQtL3rTw5Gkd9D5IdOfkFu6/l/y6aRh6ffqzX5ukyHa+BmM8rxIxoV+LSmVshCrf136pEI7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNiqVHra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rzpc1jdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAPNGV2972378
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=38TAuDgn/y0
	0OaDm7XX1LoDb33XqmHE1sUyo3NaO6Eg=; b=KNiqVHravKN1HO/jXLQ6E76BAbV
	YA+dtQR6blNm12Rr9GsvLlpYxjTzFpc22GutPwxOicW+phU46TMN6mV9fjChGKUh
	cHnM6tQVToQanytQXfh8WXtHODdqxAXEFPrQQI4iyv2NAbVwcXzfqERTVrV4XvDO
	HwIDw1mJiE+R1eJDZPE8qNvhLuvUOm0lrge0UtxYgTyWDDtQVASg0QjOCofO9uuX
	Gv67123NdqLdjyyy2UavK1PO0nkS5UvB3wW37UnwE2yx3FkYRs5O6rUCF5nNyWJ5
	53eKkftEAV4lgZeHliQ308bg/B7vxI1intVmstiOpgQoLXNl4QniYIfJ9Nw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr6rk94bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso7758051a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043532; x=1777648332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38TAuDgn/y00OaDm7XX1LoDb33XqmHE1sUyo3NaO6Eg=;
        b=Rzpc1jdwjc5mALDuzD5eq7JrBwt4J7dxRhU0uoy/MSzaemahuMyisUsSjXklL1NdFL
         GGtEyO/e1PZpeXHwpI+ljZ93bXvpv7lx7TVfcVtsRXFoq5wQnVIAXz9HFOWugLqIK7IB
         jBRNdddINJ8GrnYHfxOXnGUetmUAvZV/iCNzgeVdvlOw77wgvfoGDVxVmQI6DxKydK31
         ljbKH44dw32UdTXQBIxzdz1Y5SjutyL7VgmIlIR1hu1pIf5geLtT9QuGl2Vq4pCWZGDt
         p96gFGok29ME+XVAsU4Z918z0DSHCxWjaVsCnqvX42Kn/tkNK4myiF7+F2MRu95YbeAg
         ccTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043532; x=1777648332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38TAuDgn/y00OaDm7XX1LoDb33XqmHE1sUyo3NaO6Eg=;
        b=C1xoD3vIO5z8JOgR31UhJkCFMZ6JnYv7hxHZGn9Puhb1cBwWTXdaBJP4unGp5OZgVh
         KXdfvg13GsWzrlsK2bZVk5x9JfpmPnRQs72GlsuZVnpeNBRtBs/OP34axogjw5+/3Uu0
         V6OPFx0UMbNVFAvTaHzh3sQiIa9CznHnMVISx7tw1yCAbX1MGlLp3iRla0mTsObU4v2p
         qr8HxxR3ni/mJ0DoCtsGRjK35hmQ7aGPiH/mWZAss7+5uvbTn6PRII4zrn7JcdtPfJXP
         xB74YqBSlVv5KvEUM+ZTye0q0tIK0RsBeUxONcWL3yU/4l80uCngqIjJFx5JCE48ZQtd
         nXVQ==
X-Gm-Message-State: AOJu0YwzKTCeWK9NnsJfmYr1cVWhsb0wdkahEH/my3dkIC3yDp99BhH4
	qtanlZiEvhLKqzQaQ3Zu69Wn3gbXtwh0fLuG5cpZpfyrGmaNJt9HnTgo26AqoPGph1jXTFasTfU
	dsSyJCj8/nDJhf62QTRcG7lQvdC5D4GaCO7W3HjJh8cfNDSb2mR0Ax2Zctm5Z7PyDRcRe
X-Gm-Gg: AeBDieuUYOr2wrPmx9Fwwp46RuvgLE2HXQw/z3je5Ej5LyV7RdR9gcPSX3fIHSH+oTQ
	e4IZi9kKV8t7XwGzsTnAMYSN01leK8i3H34tpvINdBzij/j/jWMz9aGPi62tx+mqV0/GBuO38gy
	Xd1CP2iUwl1HL4Z+GLHNtPIYZp5H7jkufhGfb8m8kwDe3Zzujnkj8h1kvokWttBIh+sa9OKr9bi
	KSUUY6oPIsLDbVWiFgWOsEiC4CQ1p7Sg7XWkokWO0McGFG/ZsKMGhqtV3jeRWFqAiCSN1Hz96Bt
	P/4dUKt8BAhGPYeDNncO9Q+31idqsg5NdTELO7xeyWQkhPoQ7x1Sv/pyXGLM21u7Ws8QIWBYb/o
	CFk3pyLs1yBnw2MLjr//igjtXkw78sLutI22rW4jbGYU=
X-Received: by 2002:a05:6a20:7d9c:b0:39b:f026:6f8d with SMTP id adf61e73a8af0-3a08d8e27f9mr36956104637.43.1777043531897;
        Fri, 24 Apr 2026 08:12:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9c:b0:39b:f026:6f8d with SMTP id adf61e73a8af0-3a08d8e27f9mr36956061637.43.1777043531369;
        Fri, 24 Apr 2026 08:12:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f356sm18521903a12.4.2026.04.24.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 09/16] drm/msm: Add per-context perfcntr state
Date: Fri, 24 Apr 2026 08:10:44 -0700
Message-ID: <20260424151140.104093-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AfWB2XXG c=1 sm=1 tr=0 ts=69eb884d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=OtV_UDYxk2hhjaRdRjwA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: psUsTIQiXN6hKTHEMXomy7R-HDiAlHo2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX11TELiiLwVZ8
 /kgw46g6NO8hJ9yAMbNzlMV3QyaQJfwQ1iXJewssIIEPwemAo40/gMkdH/vu9OtjEkpZem9/CJp
 QDgk5pdk4l41gX9kwVURveTnpPlq9DaxJFxEEvviyU89PiGOfgV8jCm1Cd6601x1xXEvEVE6IHa
 3Hv8x1cRAeW7hW/5oCmFh4lMtGGmYnaXPoNGXFtcG37kPyXToImcPfojODrn8gEV+gHXF6KDTC4
 SbObs4z8eAZiAox+P7UtSdwt6+S3iQTrCiNeXpzkWwHYkKhcWoWghmEqXaJZjKV5dlEev3gyHgl
 4SK08ZlxB3ilSb6Z0ssOS/BpcVOv85/eiNzK5Rp5RfTsGOxZ+IMFxG6vAoP1r8iWcVfR+vP6LWw
 WM351fY9TlJkVG2NWHZe2KiuhwN0BU19Y/2nFShS99SKwmkYp/VY22sfLsHXyKYSJ4G/Uo5mLUE
 XAauW1HQxBUHW8dvKNA==
X-Proofpoint-GUID: psUsTIQiXN6hKTHEMXomy7R-HDiAlHo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240147
X-Rspamd-Queue-Id: 184E04609E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-104480-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
collection, and per-context counter reservation for local (ie. within
a single GEM_SUBMIT ioctl) counter collection.

Any number of contexts can reserve the same counters, but we will need
to ensure that counters reserved for local counter collection do not
conflict with counters used for global counter collection.

So add tracking for per-context local counter reservations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h         |  5 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h    | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  1 +
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 9e5c753437c2..19484774f369 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -434,6 +434,11 @@ struct msm_context {
 	 * this context.
 	 */
 	atomic64_t ctx_mem;
+
+	/**
+	 * @perfcntrs: Per-context reserved perfcntrs state
+	 */
+	struct msm_perfcntr_context_state *perfctx;
 };
 
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 64a5d29feba1..7f0654182496 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,27 @@ struct msm_perfcntr_group {
    const struct msm_perfcntr_counter *counters;
 };
 
+/**
+ * struct msm_perfcntr_context_state - per-msm_context counter state
+ *
+ * A given counter can either be unused, reserved for global counter
+ * collection exclusively, or reserved for local per-context counter
+ * collection inclusively.  Multiple contexts can reserve the same
+ * counter, since SEL reg programming and counter begin/end sampling
+ * happen locally (within a single GEM_SUBMIT ioctl).
+ */
+struct msm_perfcntr_context_state {
+	/** @dummy: Some compilers dislike structs with only a flex array */
+	unsigned dummy;
+
+	/**
+	 * @reserved_counters:
+	 *
+	 * The number of reserved counters indexed by perfcntr group.
+	 */
+	unsigned reserved_counters[];
+};
+
 extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
 extern const unsigned a6xx_num_perfcntr_groups;
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 2598d674a99d..a58fe41602c6 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -66,6 +66,7 @@ void __msm_context_destroy(struct kref *kref)
 	drm_gpuvm_put(ctx->vm);
 	kfree(ctx->comm);
 	kfree(ctx->cmdline);
+	kfree(ctx->perfctx);
 	kfree(ctx);
 }
 
-- 
2.53.0


