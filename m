Return-Path: <linux-arm-msm+bounces-102086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK49Ed7P1GksxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:35:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AFC3AC1C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BCD43074119
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BF0331A77;
	Tue,  7 Apr 2026 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFmStf6X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeCJqYn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B439B4AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554306; cv=none; b=khF8iLmh5lYOtjKUD7LlyGDS9RrtE2LnXusIfIbrep9Rju4EKtOUG66mpEc8kvs/ZTWpr5dZ8aPrqYluqykssJWszKVO3I4FbUwbybEWOgd3dQjZSx4oaYDTB3IPMbiQw4itVSNu8+EZ6eGkF7c2qBbgAypzJ6M4pq7Q9LuuJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554306; c=relaxed/simple;
	bh=rSdTxndfhA3XLQEODC8o412hrkb7dG2LN5ijuH1gUGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2LantC0yGbQvR35sXiDCYq9iXkETHHekvyvtAqNaecCA7MhsrX+9fQIlu8cOOg+XrQdpOIOlE63DfGevAG7zLkMqFPV8z8rG+ZCA4rl0S3+XXhYK1C8y+y+5eRMvVRKJkYitQF9iXTTGVnhaGhC4N3DzzGHr9SRL1ZOzyDpMoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFmStf6X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeCJqYn6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Gh5J4008692
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHzEQ6XM/z3+Muw5eGpH96zPSOY5H6p0mASC+IuWNqw=; b=LFmStf6Xj/w6kh5a
	sT5wy7fhiCd15n1fgtreWReNFUSvJAybcIKoPAgjYEXOtWhrwouAt34lOkhsP0Yl
	d0eqmBqkqMBj6mWEEcim3KdtdW0+olwsuD32t2StYYFxlua3wGMTYUle5D0OmYUQ
	40r2kMSO38eOHFsFAgbUvqox2khUuoqcJRRhYk5TIeX+wmVuIk0ExiP/usmXXF13
	v1TCVBbU1dLzsj9TtbYEV7P3vi7LLkFYE55yfhgvM53gNGDK6o6MshERILbi0Vtc
	lBJt/gSi4wWS/pUMCsTLMC3/FzHOx4X/Y3Ca5kg5CyYUHgelGF8Zbzxb73GPWStj
	vokGuQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkt1b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:31:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242f76113so57472475ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554303; x=1776159103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHzEQ6XM/z3+Muw5eGpH96zPSOY5H6p0mASC+IuWNqw=;
        b=HeCJqYn6B2T+F3yPmA3fWon0qqkt3hdvBCdGt4ElXKDnzJIUX9r7IjrMe3INhHug5g
         X8KJLjbev3k2g1zZB/QCmUI+MWfoLP3Knvzg/eAgAIcf4ka78Xcs9pAXoIt0TdrzQbJB
         aXHbq4TSopc+DjKtzD1o7RO+rKVUGJb1etwR8JFza/xfLeFllO1jJGz7uGHieXyKpUf+
         rav1oubiD3RjkcCvrTo9gqIIXqy7TYhfN2X63vosgLZOsbHS7IKzNeRBbRg4HemcaJSd
         qkDJgfZ6Nj+Kx66O7PkYj33kbHXy/7kLXB9XEa/oncBKc8gBJ6wZYkHnlxzErJRtTjie
         LapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554303; x=1776159103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHzEQ6XM/z3+Muw5eGpH96zPSOY5H6p0mASC+IuWNqw=;
        b=oJ0L6KKJhZIGIBIfPESMAd6qifMOEIoAkX64RxoB5s+lYinC6hVP1flZI3jkTdYHEt
         VD47wYpyIrjrKdcQemYeqZS/EbKDbInYPqfhDZEzncweuGq1KEofe7lPvt9mwv1ed8f4
         oBWruKubswY8R0pukMINAU1hr0FjJBqx1vUJJKjDXGySGJpWjo2qCTbt44MHhqfizpZ3
         tnM2+YFR5SyOXO3IqhXcKT8aaLF94C+3FU+qQMM+UvuOEreedzFpDPKhi4OWd8yFv1pj
         Zq++sllP928OLEGmpPSrgOJ3hdV/HikoJy2iFebqnHy3i/pWNWUP4e432VQ/5V7wGmyj
         AHVA==
X-Forwarded-Encrypted: i=1; AJvYcCVaVtcVgPO1oyOeIHLVCsgUXVG/sk/L2T5RuXui60M4N1wgCeqU5ZHPK3lX/QC8KplBXlRifxNMDfhkbYKP@vger.kernel.org
X-Gm-Message-State: AOJu0YyoEFg6bi7lNRPMzx6mwUp7jehrFuOvpaaaQcBCO2kHgPzBMcu0
	TVQz+UU0r/9thdI2EcdJ1Q8MkgSAhf2l8PUIr6BwcF3nU6nnbOZ1vPjjN3RP2zZ4QTOrNVVnuTU
	OKVzW/Kyt+GlXqa5C2l7e0ePVennh4Nl1rZxNJMqrFJqpXrEjuCvImyw438dYtoRltJZh
X-Gm-Gg: AeBDieu53XEsOWE9EUnS6ZsLBbn5T2iZAXA4SZfoLKu6hFmUTSpzALc+U+nufgC7JDW
	bK/jjNeKvhdTACa+crLw/9mAx3hgtVne+Hb/3eu1e0eQIVmKrYrMNYFAwS++Ox2KhbcbNwH36Ag
	7l+WXdXVK4QruenNtAAjwJOc9BZl5kUHYqd0AN6s5SGdeQiTxkDYOdWCavdDTIfJn8/eBwXElAa
	mIBOxvIW6H8Umtl/AcQHgwVzHodkmnVwfIlLU+1bIOL5HCSBntR9zm5GXrq52k6yx3JLfohI8gr
	d7VHr5HcEMYqlkbQFlTu9e/TpcUWwSw9Ks+U/WPCm9IUwz65t0kirTCIXFELu6GZYLSp8QX6oTg
	TPEc7yqiMvDZ9Da8h+yyf0p9/8RCwYZnkfeIXAKFTp6zipQ==
X-Received: by 2002:a17:902:f78f:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2b281821ca2mr174235195ad.18.1775554303474;
        Tue, 07 Apr 2026 02:31:43 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2b281821ca2mr174234775ad.18.1775554303001;
        Tue, 07 Apr 2026 02:31:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:53 +0530
Subject: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend completes
 on probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4cf00 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=b5psBqh-k-Y8K5vD8YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: j9q-MQmTDwTQR3Fo0YUMhj0D37P6ZLuy
X-Proofpoint-GUID: j9q-MQmTDwTQR3Fo0YUMhj0D37P6ZLuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX3mdfsFT/7peV
 pwqbn17v+0ldUyPDLqPZR7SfNaTUylhkYxEcn5/Ki3A0Fm8g8jqEqhCZ7kRSZX3TJIyxd55l0JZ
 tEVbX25fPfMfLxNR/5izet0QT20giEm+hzSX39z9snG5Aiju8KxiREKzG2yEOC8Ua2jTrDuAcaU
 I4no/bXzg5EXxW/PtnYbKBEWeP9ee3c41niZlTFfbmjUwx4SUHbKB/zWHoqgZk84Pqc3HpfcaRK
 tILANqxWMwcE1Jl5dg452Xd1wT1p6d3ru3vxvOOLJwJZg5CIYfu3ESOwYCnJFqt1bUoz5xyE4D1
 aoeSsQ+HazFPSN5xXfwkvZZcEWiyKAdPi3RZs2p7dBLgB4BLZzsPuqVDwUoYl/uJwQZfk0T0JtC
 1e0R4RSAPu+OCi7bFROHzO4KyVBFP1vqpXcO9WC2xlS0z488qO9ZuxRzgn8TMCsIhHV/tThURiG
 dUPQ0T0FTpUgwKNaZnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102086-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3AFC3AC1C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the clock controller is probed with 'use_rpm' enabled, the
runtime PM reference is currently released using pm_runtime_put(),
which may return before the runtime suspend has completed. This
can leave the power domain transition in progress while the probe
path continues or returns.

Use pm_runtime_put_sync() instead to ensure the runtime PM “put”
completes synchronously during probe, guaranteeing the device is
fully runtime‑suspended before returning.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..2c09abaf1d2a15b7fbbbfeb67c03075381185a00 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -428,7 +428,7 @@ int qcom_cc_really_probe(struct device *dev,
 
 put_rpm:
 	if (desc->use_rpm)
-		pm_runtime_put(dev);
+		pm_runtime_put_sync(dev);
 
 	return ret;
 }

-- 
2.34.1


