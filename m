Return-Path: <linux-arm-msm+bounces-98008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMXhBF9NuGlHbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:35:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A629F1A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B1AB304CCDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4682E7179;
	Mon, 16 Mar 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6i2S1dr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMEZf0UK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E94D292936
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686087; cv=none; b=ZRjZB2QENw5lBKPj3r9p00j5i9o4wwucp6rRlKKeFySwJtL2pOXJRll1+T5upTHTbZ5Ko1JD4V81O//8HAeWnhFUSMTsfLKBBu/LNSDbrhLYG4Ldit7wTOwqEjt6ap0Az2tmVWRxgwOGKTk0AZx8jA/EopurdkLxKLwiDJvuSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686087; c=relaxed/simple;
	bh=xIv7R5UeWILRJK1dmAr3p82Or8OJJs300t0MMPdjYyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HcQSUUh/C8dgJBO3vELDMWoikPAMkDO2L8SkccpmOpKl1tZGXWdqrqA7HIif2TuFpev0iRHBvHGEq0kknG4Sd/NyqcvKXdb19mywzl9L8HISXtBmjceb0d/ooRBrO0UHQV9Re2NiPOALT7bnOOVsmRgCNMHrahjarTKDuvdxzms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6i2S1dr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMEZf0UK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF2j3i1534110
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3K+xBV0IW2p
	AA7sUkhKfEISVHPHCQ8PY8xf8X5kxOkM=; b=e6i2S1drtHd2SCsDyqDwgUrqgdS
	SYlNQpzzTNCE0eajslMOeQjSsVLC972X8gsvW5mrklCQPezAh9HcKtLOKhFcGR9N
	BfyXW3s/PG8K3FX9GHh3Z02RAR6rYHzvmDkYnA18fNXNEeD0xgjPx5jqD3i0s2DK
	emDzYPk/SKl8A1JihuDqO3yRZkQEVRiqu+tioTmlDfS2wfXULHasZhagm5dA+WmO
	J7OtwnJOrfgR/ETVL+qZP2HyDHLWdyp7zMSPRBzpJbFibV6BCQzclnZifqSWCR2x
	9gs0heKINXSAz3m97udpljmK0NvAuEYilQHvOriIgaCosTXt8CyUO01rqCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k0se3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c739120475fso3023272a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773686084; x=1774290884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K+xBV0IW2pAA7sUkhKfEISVHPHCQ8PY8xf8X5kxOkM=;
        b=MMEZf0UKQSXAUSzdqW0uEARIAz6IH4Irsr2GHj23HAe2WQGhloBNTDwQhhg/h+rdrg
         2YZkwMRCXKQCkCQReurHvLSaHOfqbZtM50plriKhz0Vg7Iwo1BQk6jmOrvrk3ai1V/iX
         CWfgqri2Z45SqWAAz3ZLyydkPz6L1oFiVTCS7WqAG9ktzdfspZIGmGL6mVRK+TgxQ10l
         lg6yo7gckV0sNJZ8zi/o8kr6/IAlS4QmVGrQMQm0LZfmjw2q6P+tmBsAbC7xuWRPeN6X
         Pfzw3TCWyCUfyn5TOXiI4RImsoSpVAppOaf3IxeCHxsrGattEJqe98ST8SENg+quQ6Iu
         Amtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686084; x=1774290884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3K+xBV0IW2pAA7sUkhKfEISVHPHCQ8PY8xf8X5kxOkM=;
        b=CW+u5LVm3vhHRWSjSPxIRGZnOLV5x/XgS/OZIHG895PtOtdiWziwnXztD+4FrG58ae
         sVuEGa8iPag+D3A2f6N4CEN5iiv5udoKNvwvJ/NNG1iMe5cYL3GbZH6xQk2wahmUnwqj
         0q+NU4LQEvXjr3t8tgEArguA/5cii7KaNEBm1ic7/fosGd8cfdNDu80nNb4v7QYyhc6K
         vR6HjzaHg/wPN6Dhm9FGaJ7kkwZ/+zLbZchR82Hk847yScq30PjDy97AG7tDRES7uMOX
         KU1PGFErdlbfqFksih4+86O3dcoN6tf5OL6FH2dHJ9CZK5BZY6qu0gmunYARxCa+KW4u
         OyUw==
X-Forwarded-Encrypted: i=1; AJvYcCXwHQiSCtgrcb69JDUKKDYwDVGBzLmuXAyd4ctdGjmluUvLpEppKZHlT1ukwiH/iO1chz80zlfk24Vtz/8I@vger.kernel.org
X-Gm-Message-State: AOJu0YxaApyrXBV7h8UX6mANoS7Lq8I6FfSL0yoAGXYpaf6gtANHrIik
	o4ZTnJs4ZrY/W3FIzztgHHTplF2yTlbjqutt9Z3H+v2uIa/70lHf/OWl3OXLmaPfO8+6DITlnG7
	eCsqfAA4PZYVoCn+KcCzmW3MclgJUFFkBe3ELduy+5Q/xhcQ5yuUoFCZLxbcNPxkZEE3H
X-Gm-Gg: ATEYQzxMIfBD4wo6s+kObTU6h27zxCgPJHfm+a9A/aeGQqdObA2oaUdF1JZuP3vlB8N
	BnvuQRvxtkQmk4+82O3GvYdrwGUwb1Dg7hz/y/2aiurSwD4bcVuHexBKIf0qsiQVefP8CjBaGOS
	IcG4NjwyrZrmJO4m7BsXbw0mamuCH4Rp/t8OuQ3yfDgYuC5d2HB0CNueWm9g4xoyCIaOGCCKQ4/
	XBeRb0R9/ZPMRVU729lScrvEuEXG9wp40dg5/5yWG6aSEzFerp5DoP/AtFMbyeUCLFVWj21hPpM
	jNYGhz0kULhQu/VTXJ4vw4usciGmJmee1tEYhJPZp5/wkC0klN1SzrR+tGuqmmcZSPM/DgpZSmN
	+27hx9fIY/fydd2GSjHseRYg3Acc3Tzmm
X-Received: by 2002:a05:6a20:430d:b0:398:89b6:1b2e with SMTP id adf61e73a8af0-398eca6b5cfmr13444973637.16.1773686084202;
        Mon, 16 Mar 2026 11:34:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:430d:b0:398:89b6:1b2e with SMTP id adf61e73a8af0-398eca6b5cfmr13444940637.16.1773686083724;
        Mon, 16 Mar 2026 11:34:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c740000056esm5980813a12.24.2026.03.16.11.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:34:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/adreno: Change chip_id format
Date: Mon, 16 Mar 2026 11:34:33 -0700
Message-ID: <20260316183436.671482-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
References: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b84d45 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=MCzI1sFhaE8V-z833YcA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0NyBTYWx0ZWRfX6OC46UsGuaZP
 kzhhLmOVITLOdjzxFQ6GPGchVyFH6B/x7p/XAOsfdO5yTPQLjHdhAXn23/Pq671IJzUCJzD1tMh
 N8R/Sr/vcXmcBnSPg8VtyMTElG6cy3IN3HR3KmOaDCsTeG9X5IMqCbb7j4fbratUG27RilVlpMT
 OmR3CzxMphbtSBDaSXWclTF5zovd60A40nSM+BG1v4KaAa1SqqpisQtb83fUlv4/rmOR2pTwkkH
 9g8gaV78HStkdZAS1+PoO8qeDpIyUJn6x/q1Xwgs9+GfR/mRYa+3dIJybRlIracnTmXoum4n4Qx
 9Vngsc8EUiVsKdor6C61OrIIXodUV2RdxKxP63AzPso+vaNsx8462xmdFKr/+GBSIKnoICBiUE7
 Di1TsIBPC9LhMQjg6x2vm10eqaZd/3scZRaZNiVeNf7lW1fTDa+ggCg0m9HJxPzpanoAT+EtxV3
 TVTH9GOlRr0/fs2zz6w==
X-Proofpoint-GUID: k0NUBKR2tSvUSMdTGU40Tmgr3rrLvbLo
X-Proofpoint-ORIG-GUID: k0NUBKR2tSvUSMdTGU40Tmgr3rrLvbLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160147
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-98008-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF9A629F1A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "ipv4-style" %u.%u.%u.%u used to make sense when the chip_id was
simply encoding gen.major.minor.patch.  But this hasn't been true for
at least a couple years.

Switch to %08x, which is still easy enough to read for older devices,
and much easier to read with the new scheme.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1d0145f8b3ec..6cdfafcb0c57 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -67,12 +67,8 @@ enum adreno_family {
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
  */
-#define ADRENO_CHIPID_FMT "u.%u.%u.%u"
-#define ADRENO_CHIPID_ARGS(_c) \
-	(((_c) >> 24) & 0xff), \
-	(((_c) >> 16) & 0xff), \
-	(((_c) >> 8)  & 0xff), \
-	((_c) & 0xff)
+#define ADRENO_CHIPID_FMT "08x"
+#define ADRENO_CHIPID_ARGS(_c) (_c)
 
 struct adreno_gpu;
 
-- 
2.53.0


