Return-Path: <linux-arm-msm+bounces-101092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G0IMTLzy2lwMwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:15:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D26036C731
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E7FD306B182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19A53E8C75;
	Tue, 31 Mar 2026 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCRIoa83";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTLgwUf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0521B3E4C6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973533; cv=none; b=o8nty4OYyRKsr1K/ISLXO9RVCFdeJd5tsEkcvZW1smcW9mp70PX8e7pQm43gJCbrt+ac69gdOBf+MN+bULGTkKKhULXGoMUYCTrzWdFQOWDyRPhtuN8GUCPROQBaAaiCAGX1ISXQ+KKXAS6nWIsn8Ez0gySdBFfHdhcxt0I6vUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973533; c=relaxed/simple;
	bh=JgLPhw+ArucftIYa8makGu0FHnbrtt1zKZEQThMpFAc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iNO6dX7xGFgYveRM4zWP9D8hcq2Mz/9PE4yP/nVO8nMlbiRnFYkODg/o0mDV6cyF6iTAmb2e+I1PCH19cN4XMgD0gWeIavkyFCsz1PTooPjsi31fiBhIGJ1fv99gz54hGCh+3+KypLu3e3mSuFP8bgs/4ezZG6SJxjPwnuxLqmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCRIoa83; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTLgwUf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VEIkWb2049642
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tMix2rwOSw7ExtQ0oKmbLtIuX8OjWbhd9N9
	jr86Gya0=; b=YCRIoa83uwK/Z7mBEXOzZbAEtp7HJTdKu4qZwNYf2cbFNkP4hHl
	3dbsprDEsITZDsCN7nBlQowgH4KHPHQoNfpOVfz/vp0pQSwXO+0fOtRiBt+iMEMJ
	od3zCQTvFG19fF7YoBcg7cR6b/H4ORTqCVd+IGbXzy6IYRe5gCkfdF8+2qbV1o/y
	gYFHgJMBGAWk0CpkKdhA6j6DUQm114TwtceR4SIopw4Sow2AIklEhpvp+1w9gTBP
	W0z9KEcnW6AcnzrcXWdN5i81jM8Rtni3nDaVNcqPMxWsN9Pz6p/iZsoJmB7ClcWh
	MutwvjwvppVT0ObngokJv2NcOdPVGW1Gx6A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1ysvnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:12:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60270015488so10358944137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774973530; x=1775578330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMix2rwOSw7ExtQ0oKmbLtIuX8OjWbhd9N9jr86Gya0=;
        b=eTLgwUf6hgcqjHgmbB7MkAUy3WXeE549bKukPN1OVyiOEKdWBV2dznILW02lhAVaeg
         djzo6WV6+0X7ZbWCFVCzrma1W5c8aP6kkzX75013a9d1k0WJoeoulbIQTP9HGnTnlEx3
         +E0AJdxzPTJqlRp35P18eUk/N/AS7IkPIe4MMr17K4GJw3P7PD5EX5eW9B/Jofd2f/0+
         jVlbF7AYwceqK4NVyNVM0kPO5TT36cPevxZWnyp2vTOBpUJZdrAKR6PSsX3pOOibbCd3
         1+hTzsf4mnUxkJk7awa7BF40PxWDt9nulEKWQtZvNQWBsDTCDopyIpavA9nn9yrc7V8E
         mZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973530; x=1775578330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMix2rwOSw7ExtQ0oKmbLtIuX8OjWbhd9N9jr86Gya0=;
        b=X8UnERmQ5IEKlPYDFSt6btsOobndGcd0YZO2ulOQoUhQZfrREb6Ji7vZ47OIEr9J5U
         1yX/BpV0gA9AKfSePreeBSi5qkQ1txDjmGlOFAtr7ynKpfSfNpJtOin0uTJB1/a6qLIG
         Bp45ucacipof00hMk3tdclVvM+q1gj+nx3jVqkoHeuRF5b4OchvUH85wYXZR04Nvauio
         mPUCpMkudGqPEdkMiX3w2Lurl7T/PE54hm8EX+5WKfEynczUom6RwM+Q+ebRRraPuv2R
         fQNgCIi0XNqZ8yEV3+mozfL2p6J1sg0NzFkBF2ARsKM1tDDBHf+rqr7lNYQFzefc4kkU
         PdvA==
X-Forwarded-Encrypted: i=1; AJvYcCWKpTHipzj/c+z2/8srn6Gqvp7aclTwiEQjFbTjq+GLotUwnMEnAE5jAXlXJ4ikEF6jwtc6xy5XKWaDI568@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oAu7+7ju7UVH1agragqBP0PWOrnqG6YbDpMYaiw2u86qAGeJ
	uko+XjGBp2yWCWXvr3OsQnW5sPqV0ZN2ql8DJWb7rKvx4LzN4iYNgrs2TPlwq7jqJ260pUhw8j4
	crHXZH9lPbK1nzVBvvlIIwlnf38XTKuopbNVswW106iMH70BP7m5/tiCv0GwHBIxYlUkj
X-Gm-Gg: ATEYQzwoRgLZLcJnJh+egjFxVU2LUPX6r0R0Qe8Y0kTwQoW84KjOOetOZ9fjLlQG5o5
	X1kIyB6CeE/K3RAGqvMQ7RxHk0H+OpcIn9GIkJSIfnIaW1xwYy2iidGDTrGFVxXeAPAtU+kGEYA
	AvffnEIXyil/83YYdQIzcIoos4O4pj7Phh0RKnBv7SgQRZQtIdFYDxdPQkKgND7+W37AX8rOhT6
	OH0E3T3CgsKH/y8ARdX3G7MUJ44+dynCKprcz0BZd+oNsuw4SDzf5Mj5oI6LN2idONMpljSUEli
	2pARcD7heDTBydGSickDLYZhl9Yeoipy2v35S7gBTSCslw+5imkaR5QE/tXbz5kXcNi5p0YglZA
	oHKkdaJhoF+gMtR/NFt/CZVpWpCdNzELgIGgb
X-Received: by 2002:a05:6102:509f:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-604f9278af5mr7202457137.23.1774973530298;
        Tue, 31 Mar 2026 09:12:10 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-604f9278af5mr7202444137.23.1774973529852;
        Tue, 31 Mar 2026 09:12:09 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93c0cfsm51343375e9.9.2026.03.31.09.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:12:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: eliza: Use Eliza-specific CWB array
Date: Tue, 31 Mar 2026 18:11:57 +0200
Message-ID: <20260331161156.211623-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JgLPhw+ArucftIYa8makGu0FHnbrtt1zKZEQThMpFAc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy/JNfDb5vpHJa7e04BJqZwv1y0MCREY9SF6L2
 5AcMKHVAdeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacvyTQAKCRDBN2bmhouD
 1/V9EACVgeoymDxslEnaYbRxKhzwaiax9UqfQiPmrou41/ed+x88LFuiKH7JmXST9IHALCbEIHg
 dVw6429iAs6txtzxEDzJ2ofK8JkOA85/o9FCJQeZ9BVjohbSrcKCcJwLtvRHjexWu5vCquSFkxt
 FfNAGIps7v9Fcnpu9/fx67du4qumcLZrSF80mcFsQ0y81lhNRq/5kHGTF1zdjwv0vwF+tYvNadY
 Hm5Kz4kp0VB4VRAH9QkSqKj60kTip9HM7zYRbiGIgvbJIEjegdkb7CltoNqBFM6avx1UetFAhit
 dZe4z9fSgdIM37BWktWsqNIebvK0qnggQxfzBY0imYOc5vgDL8ZNfs5ilo4RqNPVGwbiGX3EalW
 LT+Umo04OcOwachTELizrTdhObC7dAz23UXaZUClvvhDkIdqDJDw/EVhU1vAbkOwHreVee312Uq
 S2tcC/CshMjNcuAGmq1TrC81+ckMwW0jdAlZXLiTwDWuatKPKbtTbcCvP1MULozQLw9TAgKbvK7
 9m2hLpefnc5d2RNRhmNQcC1I2lsr27JHhZ6VL8//hf73I7KcqyEjJ30y+1pqLBivJ0G+qXhdK77
 ONIjDgg99e+VnS+QkUKNvZXgtdXWfuIr8+B6zja6dw4Ho9ASWXuyQtRcO9gF19vmOzup762Nusb VTRvgZsdf7HJSZg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MhYQOghpm90ER3wJEkAAjugCVQbUOhER
X-Proofpoint-ORIG-GUID: MhYQOghpm90ER3wJEkAAjugCVQbUOhER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1NCBTYWx0ZWRfX9vFaigqoCnek
 a4sQcQ8YzlZ2yt2jsHSA+/el0/qE2YCFf8bZQ5xx6NvZdhffrn3MiVbEKDyO5XWPUiy31GiOYZl
 Ul1QmzUUZxO76ruuM2oZl7CVI1o8LiBXqHEnQJV7plSHW3KKTY0J1vkw/cCcXS1sRsCzjMwuy05
 QogH/4NHIIB42iYtNVKdVkSE7Tj91Rc1kz4Rn6FWiAqhBd+jDs3clWSl87t+xVoAmPPO+cPlQEB
 St54vmYW7rc+2cJQSR8aeSoR1TWIf63s7MLa/pOEf6R6AztGP4tqD7waZkiXz0AmAygbFdeAaO5
 H0HRSMb5alCLhGvJc4+Fy6g1rRgt4z+C2JoyhQPUOGsK4FRMN0O6v5UZyH2xSxsCR9O9VxFx7db
 fMUXrM9aUSBQbtmV+o3ebuQctbwppUb0kYAeO7XU5bMt/ntMRSWmF1WccrSo3/SphxsamsLHg0x
 mjjIkzYEgrisTqBo9qw==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cbf25a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dRBQDy9s09Ah_ACL4fkA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310154
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101092-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D26036C731
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver references CWB array from SM8650, but should use the Eliza
specific, which has different register space sizes.  This should not
have noticeable impact on function but is indeed confusing, since the
Eliza table is used for .cwb_count.

Fixes: 0eb707bbc7fc ("drm/msm/dpu: Add support for Eliza SoC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for a patch in next.
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h
index b482a7e4e6c0..b93d32888972 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h
@@ -353,7 +353,7 @@ const struct dpu_mdss_cfg dpu_eliza_cfg = {
 	.wb_count = ARRAY_SIZE(eliza_wb),
 	.wb = eliza_wb,
 	.cwb_count = ARRAY_SIZE(eliza_cwb),
-	.cwb = sm8650_cwb,
+	.cwb = eliza_cwb,
 	.intf_count = ARRAY_SIZE(eliza_intf),
 	.intf = eliza_intf,
 	.vbif = &sm8650_vbif,
-- 
2.51.0


