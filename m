Return-Path: <linux-arm-msm+bounces-108275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHEFBp1kC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:12:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DBB572B4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 920C13080E19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AB739657A;
	Mon, 18 May 2026 19:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJZkPGKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHAfgxl+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852FD3955ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131304; cv=none; b=MsdXDmNdMhl2v/d9cutx9u6RJkAOFsyJnYoS1awDtZRPSuf9yN/w+2+YcoMdBQi3kiIV4tw/tPM7DX4qSKn1W4xuv87TYQAxF854Tik9sJTPah6/gE2RAGzAFlSPQM+2LC7EntJ5x47+/83OMYWKUEW1abtn/y3NNpMXO72gl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131304; c=relaxed/simple;
	bh=KLqRNWMiv1tFIGsviuSyaJygsw/Xhbs5/vugY6rjZSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FkQv4qvbtLBchWzCVtABfCWNHqWYlGvEkrYyVnHe/9QcNKPzUHOk2+dFTVhvoIxp4YOWNvxqUCSDOxe88t5VrHqFxhqlMwsiKFok4c3tqUNbdcBbJqLCPq1dVrKgCXc+AVMq8YVRqtI8RP1/jQDaL9rjppm5a27KLt37wdTcTqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJZkPGKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHAfgxl+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICFvJv2701033
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tpSYknoSjgu
	xLp2PhcNLzFD+hJIyTtn62dCNb7J3rZw=; b=AJZkPGKGiC8DJki6mgucSqNhEId
	RzGSP8+nUyNVlJprxIPm6Sez9DJRUFxtp+ltFxJ9q6V0U+TyE/VA1hcxpUpP+oF/
	jh1LN+LyYrTos6yxJFztAmWA24Cu3Gfi7mdPftcbdpVyo5+22wdhYpLLnTfz+Ykm
	GWIBJATj/Mw2Is2bR2Iwi8EEewidWqqhVdIf9AmRudwhqQGRN3gacW8Y5n60ixcm
	D0gWkQf678LxT+JfwSKFVM/Wm0WMH3LJoHVGcqO98LEzSHqECkeTL277A8Vsg3xv
	lNz0YBesEdPnyT8Zp8GCKSvn10av6b7/0/nGWuR8P29HKkixIVUrpcpPpbg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mehjxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd00a65673so19036635ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131300; x=1779736100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpSYknoSjguxLp2PhcNLzFD+hJIyTtn62dCNb7J3rZw=;
        b=RHAfgxl+hkTTP42u+6gz2Jg/WaJlsjpnW2P/d8EK58LQFbb3vqFasfIvAuKxnyacwV
         DDUCbO6vFaaYQpxAYhtCljJRXA74F6yIgCX9UcqPvPyEGQ6nUqTqrV35BzKpkr5CEld7
         oAu44CMNvfIfzX0iuyqEUYdf+1AIb6fNr/qK3/2r/MZ2LG1Bel7+6RQ6XJkmJ+zkVrTT
         FE0rmB5n3sPIq4saSpc6YbuVjEYyyqtWr1F9hNhLbV6q18WKQpllN7tQXUm9HwTNqIAx
         R/Er5fBdixXYU+eCgMdKvq4Fj5Ap99mnNfZ60j0aOuT4M5i+fdEnBR11JOoPXDFunBRX
         QIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131300; x=1779736100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tpSYknoSjguxLp2PhcNLzFD+hJIyTtn62dCNb7J3rZw=;
        b=kAHEraUyHaPmsgw72P3bjDDkgTJjhDJrj36gujliJCUwZuH7iZhLKFbtBygjj+loUp
         1LwS7bYv2hJp4KaIyrslkVSgrYFqkdYag9yTj2egyZNxISpU91H4fUnJqLvfqg2yQ5sB
         dnvXY6B1w7iXNkmOC/OvmSZSm9/x/KzI64c0Hf/VGUPbDt2FhTNiuA1wW2YnPGNIefTN
         EsKyN0r+l6vr/z7HRntvLBLg1FbHhKrHULUsCP2qj+gxnCbyp3iW/rNVvix8WyG5djfY
         P/uPm5CoG8PZceSKx8/qKUfcYXX6AIeGMkWxyW/5fOlInmA9XgPcjEuCWt6fxSM8+jr5
         Aiuw==
X-Gm-Message-State: AOJu0YxuYTtW+19jw3XqwQHN0lMfqj5qrVYMfh21yfYfwiL7aJeWkMuv
	qyxS9XgOb5LDcoVM6Uj6BZ6iY68+izvHcptJ7pyAoIe3Lj7phCg/6xoViHjBViiFMxFuwj96tP4
	nS1+5SO0s+ZFTYVzafcrrZX5VXJtf2p0kT0LcoH/0O/cpGUpka+Xg6GERCdVYvi/kBWGT
X-Gm-Gg: Acq92OHMXWU1IXRz8WBd92jw9wy3slSxBRHOXqcJkChN9NDEt2v1TdwM1PcpuovltW8
	bdbE4YYR8JcUEELXsjEsKfTYbEmJiZSz2XQfXnDcyH78nIYTV2QAV/Pr40cyThkpqws3uNNuya4
	396iKJiVhid3JPK6dPmufdBY07kkhNp4xxShyn7I5G6YjZdGhlTtWH0qA3nlQxcjv8U8hwzVkgK
	A7ncmSAnXLRg6YqiRLV0wb8y2K+flMszucxH6bDIGWi0H1rK92aTXKwRq7uqovghk4ojIB0Oar3
	leIJq0i57BnRHFlweQLdO6Ueh+mr83LT6qK3Doiwv6SHIyVh8xPAozDfvbptl3GlQfzk2CE4TGs
	L0g44rRC2JK9j7BYdHsMRteLx9O+ttpDq
X-Received: by 2002:a17:903:1109:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bdd6f13874mr51444305ad.28.1779131300221;
        Mon, 18 May 2026 12:08:20 -0700 (PDT)
X-Received: by 2002:a17:903:1109:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bdd6f13874mr51443945ad.28.1779131299706;
        Mon, 18 May 2026 12:08:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb08d06csm14312968a12.14.2026.05.18.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 09/16] drm/msm: Add per-context perfcntr state
Date: Mon, 18 May 2026 12:06:36 -0700
Message-ID: <20260518190735.16236-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b63a5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=OtV_UDYxk2hhjaRdRjwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: h5OMujGAM59AnUWfdDhKlAXyl_ADBiYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfX2lAo3D6TJDFU
 5xLkn4KFQznkHdP6klxGRtEmLPX4a1SyHzmSSjHb76SdInFpM6wM4+kNQ9bkI5LTayWeDuVeGuS
 xb0hksKhMdbLjmeFP0uGgSnWVxcem8nqCA0gHCTqdUJc+TQmTJoulhal7qVxcQJkeK4rZmDx+qw
 EOKezJ1a6UjGNYTSUS1dQW4FvMw9dYOl6U/PMwyHDB8eYgvfmSC6zsl0cxPIHdGZ+GwY/qqWkfS
 c8/h+FDnNE9sjfUeSZyD4475qK+fddcZ1dwCTIjeEQD8CwJ1qnZo4gyU3ZP3xRCwRA/d4AL96M9
 OpMPeB4XtxYqVOeESCHwbnGezDvfrMncIu3U6V95V7i8tGz2R5OpbGT5YaxBzHDqZaxekrao0Y4
 A0kyJbwtb/iQeQFErpPiLhJFHDoR7h8nKsZvcqyWR4L18LzvFEJNWH1K9GTsyNAveskFURfhXBG
 AGtXPeQRVNozjUNXd5w==
X-Proofpoint-ORIG-GUID: h5OMujGAM59AnUWfdDhKlAXyl_ADBiYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180188
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108275-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3DBB572B4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
collection, and per-context counter reservation for local (ie. within
a single GEM_SUBMIT ioctl) counter collection.

Any number of contexts can reserve the same counters, but we will need
to ensure that counters reserved for local counter collection do not
conflict with counters used for global counter collection.

So add tracking for per-context local counter reservations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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
2.54.0


