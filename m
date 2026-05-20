Return-Path: <linux-arm-msm+bounces-108804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEHBFoLTDWrA3wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E2590E24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE5A931BD3C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041C83F58DA;
	Wed, 20 May 2026 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YroWFbLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfQXuWTm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974673F54DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288715; cv=none; b=R4OEMYcinXCkIeo4DMQlDegwrq1Sfq9C7i4ddAlOU/JrtW5/J5b28lfeZq3Oausp4zx0ebLo/lErD/oiidJlMA5tYFRfPdUVW+DNeByXd7BK9+l7KhwIAlE5rTe5rwiJQ9UQg0+FoOdbWxJTU+xGkpUmJllRPE45K9ikkSBnOV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288715; c=relaxed/simple;
	bh=b5eNY9JoK4QxZcfpbnRgSnFL5p8K5UiGKR7ooENUrTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILzmSdVccN7DVa86anAJ8qdgDH80Yl9ViNHRXOLJ+BAQs8RodgAElkoFqZJAHWaICY/f7YSUz/i3Ab9wq4QI8i9x4loyNbnZAncU/sl3LKUe4tFI6gACzPctY8ebdHZnblodyqKGDfdDhvVPeNipHgMnRwQM3w6gUz7jl+n3Ad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YroWFbLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfQXuWTm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2OMG826609
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+VuVp/80e3hOAN8xb/50B+5XE90CwHDX5vu23WxKJHc=; b=YroWFbLNV2IdmH/Z
	lLlbiGgWekdNV+qhOp9QsaYlBg1Hq1hoPT3L/Jtsxk0dSt2Qd5qMkJ2evTksv9Ay
	7HGV+e8z5QaRpe4Oh5UMQyw+WAHPkK1dUAqBDU2049uI2jR+HvlqKINGfbDzyZrU
	s/Ee2cjx7nXwNyvBvpqNqCOxm3cW1Usto3/pC+KXw2k+p+sh3C32q4XJlxmiwncX
	NV3Z6u4FHwFB/N3hnM2QoUje7V3zF/AjRlgvb1aaCjLfTHcpWhJklLRp47r6ryOD
	eSQhkLX24QIP6HgKYA9LpzZMq2lgoCZ62KUB+rSCNlNK5au0uO5q/8OJ/4p91JBh
	FoxTYw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag6gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57525c1ed46so3943518e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288713; x=1779893513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VuVp/80e3hOAN8xb/50B+5XE90CwHDX5vu23WxKJHc=;
        b=HfQXuWTmsLpkKpGhxS++h7o7IqPpF8J9kqWfm+YyXKBOPYBzAMB/+es3Kv/p9B9Xfj
         OGg5N9j01/VBoTGC3z3vgUN7loxlzypupnXgYMFJ7MF9/7yMnez9K4hSdfGQMZz0nfAp
         eINR+WHE9rCrq9RTyyHNOSi1tA1g145tGp3v8L9YzGmq7fQJIDTd+ggUb2Q17tr94ECE
         +jcZRBbZcHZ5I60nonwySgI1TcQwt5DGvRZJubL42WfczEAQ49fqK0W50DXDcC4Yqk8m
         v2SlVYUoJCfZYTQJYKUI8mwq8JsAjqL9p41J901Xq8yHXU6QD10QHIUQhkjbVGASgp0A
         AUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288713; x=1779893513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+VuVp/80e3hOAN8xb/50B+5XE90CwHDX5vu23WxKJHc=;
        b=Qx0yotuhXWUlfeR9P38ubuFJHHl2ixX57YUTrOnG+DTM/pjvyGH3xPkc7AJe9SrPRw
         /mcCGt9qKa7EPxgtMqNHLMa/cKtCI8VWbQW9WKNTF1YB4hn7MLW45e3FcK0Ta8D/UbnD
         Lnr9E1iWmmpGHesjx/gcUmftHeBmRfemK25mXtPkXO1UxlEFgH3bjY0UELo3NXLh2Om6
         THzOdRiyJ4h+hGlTL7ba9ykI5AGGv6wyOVPStroG+A6/szg2dsV214CX7h2Dk6LHUdjF
         Idwro+nhAgksoQfFaGbugrMTZ6uyXA/8QpQHxOIxlrCKLaaAPr46kkJdUGsNfxgfRpjf
         tIXQ==
X-Gm-Message-State: AOJu0YzAO+J21kWC3ejnwEpOGYLlGK+iFPtDLOuSwN2vYJqIsyH+NXcS
	pJORSXG1zl870+53FGATa3YOYMyU1HuUk3+Yiyg98O+ZvCyiNc2+GdkN/GkbRmK2OCGThPbdYHB
	n7Kj06hjc5SilY45kiDFAw9Lk0MdyRFo7vXf7vYpRxQunFI2W9HkX7qn23l1Bxt7NoRkk
X-Gm-Gg: Acq92OEiGfiU72reioGjnLmDFV364i9LOyaLYN7ZotTclre961q+QsxbeEEMExIzRtN
	sl6MqAJidranlIk8wpfg+khVwDLh51QiWsfKUZCMxYXWwY3NjCQww9F4ZMwzGz+CdbLRZyWL2c+
	t8pLdDNT16JBhQH2NqVHaY3pGViLCWe6VSc2KupkZLerNwGCgn4NN1hvKjdTDCUCJL+kue9BB/v
	yYsOJ0r8g6KmdL88sQMI7ap1u4FSUJkRcIF6/U0zZjFQrfR4jAWSXQvLp7d9Vi3QtQ8/diPxgbN
	qzXfDn1g7az6oVs3l4opJA7Zg0X85S9ShKbwhrK2626e6txMXltTnb1IfOOexvzRlaX4E/kDNXA
	2uCaF7Ul+zcqz0zlxAsWifAUXT9yNz8jqDTUNZxQmUfdN93eAqjCEjaBOT/n8MrADwLlWPM0ck7
	YUU5rEsuqz2X9sYJGNifdYwG9VMs/qES/qYx4=
X-Received: by 2002:a05:6122:3a0a:b0:56d:3b69:87d2 with SMTP id 71dfb90a1353d-5760c044d95mr14404933e0c.11.1779288713002;
        Wed, 20 May 2026 07:51:53 -0700 (PDT)
X-Received: by 2002:a05:6122:3a0a:b0:56d:3b69:87d2 with SMTP id 71dfb90a1353d-5760c044d95mr14404852e0c.11.1779288712487;
        Wed, 20 May 2026 07:51:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:25 +0300
Subject: [PATCH v5 18/28] drm/msm/adreno: use version ranges in A8xx UBWC
 code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-18-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b5eNY9JoK4QxZcfpbnRgSnFL5p8K5UiGKR7ooENUrTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpo4M66Q9IDlF2Y439GVSdezd9GmSAQpdsjf
 bjph7hW23WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaAAKCRCLPIo+Aiko
 1YIaB/4oP/w6qzkzlHUuNHAX1Lq6DQTlEsOfN9Wm01nFB076Julinc+8W0hBMDNqgb15yZkuivm
 T/Bl2N0UQUaSd9GVoFB4ony7SX27YHl9ouAqRchJ+bB+svmgFKEiM7e05MafpP2vEivykaQebY6
 I997ydNJeobdew6An1apuevgiUvOTYhi8mLzl9z1Nlg6V2DHLKBZTEFALSqVGmlnmP0YySxvSnw
 nP9L5EFvdgl7r0ATcIF9sP1NMezn3Ewsq+KarnpaStAHYxL1vBuraVc3sz1YKkJ4Egf4iD6I2wu
 wn7aOSapnx+cU8TslNzEI7iACiQCgSa3NDxXKTUD78nDBkej
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SRkxWq4XIdYAgZsEpUVCYBbmTCtjbNoF
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dca8a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gyY6hpWVHAyQZ-18BSkA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX1Z4yGY/z30bN
 eh0fsa1ooDpXEe5X0JmXTQ+NBSTWssveGKg7DrhqX/nAY/l2KpSBzJ2QWuuhNaYdld3ZvRXLGSd
 cu+getuvP0bpFbgzYi3B9bLv+/xnFQFzAAJ73Hgvz85Hl4Oxhl6aEf/NK2iy804MVe8rQ4exX6s
 EHamDsveZTHguXb8qQ/1ZmcuYmDnuop93mMTlFT0pSgwqGP84BQQO2k+95Bd2Vjtif1Nb43eX4d
 wytnNh5zxE9slIGEsZHxJxZK6JLWOga5SNxiWU42JbgT9Yz+n6CufGsUjtUdDSFxVV0ZTBRXCmj
 nGWEMTZaBVEUmjrTGbhLdT7PtQ7djCxPV+ZIYx9TVqThKRAbrkwqVtvZHo6pGc06Tpwze8M6vXn
 K0h2PeE+tG60j3m8//5o2QeUrbKsZb0qnk7vBO3BgPQgHmgrE3ir1ThHgYERTT3ToKRvumHABMh
 YqXhXd7IuXqbJZnGfnw==
X-Proofpoint-ORIG-GUID: SRkxWq4XIdYAgZsEpUVCYBbmTCtjbNoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108804-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E67E2590E24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to simplify handling of UBWC minor revisions (like 3.1 or 4.3)
use version ranges instead of a case switch.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 5c73a9ebb22b..29d559fe4683 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -286,26 +286,24 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
-	switch (ubwc_version) {
-	case UBWC_6_0:
+	if (ubwc_version > UBWC_6_0)
+		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
+
+	if (ubwc_version == UBWC_6_0)
 		yuvnotcomptofc = true;
-		rgb565_predicator = true;
-		break;
-	case UBWC_5_0:
-		rgb565_predicator = true;
-		break;
-	case UBWC_4_0:
-		rgb565_predicator = true;
-		fp16compoptdis = true;
+
+	if (ubwc_version < UBWC_5_0 &&
+	    ubwc_version >= UBWC_4_0)
 		rgba8888_lossless = true;
-		break;
-	case UBWC_3_0:
+
+	if (ubwc_version < UBWC_4_3)
 		fp16compoptdis = true;
-		break;
-	default:
-		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
-		break;
-	}
+
+	if (cfg->ubwc_enc_version >= UBWC_4_0)
+		rgb565_predicator = true;
+
+	if (ubwc_version < UBWC_3_0)
+		dev_err(&gpu->pdev->dev, "Unsupported UBWC version: 0x%x\n", ubwc_version);
 
 	mode = qcom_ubwc_version_tag(cfg);
 

-- 
2.47.3


