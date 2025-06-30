Return-Path: <linux-arm-msm+bounces-63111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18605AEE688
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C944164C4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ED22E7184;
	Mon, 30 Jun 2025 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omsmwrcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F8C2E3371
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306985; cv=none; b=ISCgvTS8BUL6jNZljeqiqlNNfGMpHEaJ+d0wATT713yKu/txmcWrOPTznLnowvvCGHfijYQyg7drLBlk/dYy+9vY8eDyGxCVnAYkvcqxHG+E193k7qajpnwKb2VrWkwkJbqZI/3GtQP3SwbTuSUIGRyfSMXHDu01l/Gr4u6Vm8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306985; c=relaxed/simple;
	bh=lwfRgMDH6iOJShq1z2EjkDrsyelzF8x3xJddUQvgUoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TzuHMsxAo/n4s8cTFCQ/Q5RwTIwrqIoUKt/lXBeZHS/cZ8Lac506GXNEAItOxRs2S2GPEH/gmgQxmy9BPGEggYls7yfkuX/Ka5cOpaLL44f3e1bo1hUKmms9uSknC4/oGMEGK/UC1BHDnaXsi8cyQ8cdd4CNDAt5e0K6vrwKv4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omsmwrcJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFwTvY024724
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+lRr3gI/KD/
	sDiUpT3STEHoC0WFSv9i9T/J/yu1bztI=; b=omsmwrcJrXdIln5amOugIOsfUNE
	KZMMy1xv0xpvtpQZc/3EKS2GfBLA8n3ruxkdMvUgsOoGN7vX/ST+Sozp2eBuYuIp
	ajwshwD3dqzb2Ho5qaLrnVe0LbnB4w5j0NPg8D6QAHAME6sEiNbZsCodoWyCew1L
	+nUmNjdXU2noJeeCYBvLZvVMAy1X9IlNVmiCpf1ObvI2i9LzYxKSp2VQ4eE68vSj
	ZaD6mVbd7+B9nwXtaU0T1US36uo3Wcp0/L04PNpM/actHYaB17iVsgD9fa2R6PRB
	d2JWWVhDOae+PsgCilQMrQOasByJzPSbH39B47WL5M+eVSKQQnV8j/+3+PA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9dqkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7489d1f5e9fso7141551b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306981; x=1751911781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lRr3gI/KD/sDiUpT3STEHoC0WFSv9i9T/J/yu1bztI=;
        b=KPR2KxzF5kKsrE4iClSIebRxMnEvvgf50rBWURatDcT+04x0wyopflLtMZaxsd1m0X
         GDw17eqC6I05+JZksiEcJmW329ikIyDGRl8Vc9Ed0BfFRixTWE2XNtG/0ZaJdLLk29aw
         N3qsWGm6pNAJ9m1aHEq5kkPDQkUPwXZgvz0IRHG1rJbsy/h86BHnsHjxY1vg8FobN/I1
         eDh+Rr3FpsP3kmJ7V6yTnaL8T4+L2+84zgah1AEXszaHkniEcef2/hm6Tjr607oqcaS6
         4GEp6nPXybYO9W+pe7YIXFHN7DOC8asU8uwLddool73R5Gkb/M8cwCOA30XRrRpJ6zZu
         sCVA==
X-Gm-Message-State: AOJu0Yz5PYn2vENAjDIVl+WTLBpjd5Zw9bybCYhPSNRyScDWsHLGXWKU
	s6czxCPi0USzfwZls/D34UKSCNp+ij8F64nb43/MYcklHo7lTxnywrELGP91/Gxn6Q2OF8q/SuX
	F6IeZECKSl08lM9ZWsd2P0YVIHlmGWmGOYcyo98nBQ6Mx2MO6nHgDaDLn9ogWwg6KWxvhb2t5Bu
	DN
X-Gm-Gg: ASbGncurHpetqh24IcGDszDg36Qj6j3ybHsH0k4nSQly8rNnh27RuBYrsSy0/VxkLZ8
	2826XyexSwD12jqCCQ4s10JIf8bBxFo9FuHvy+16I1HzfJRthRgw3+TUF/ZyMOgk7I6GdRyEghQ
	lkduJUsGVDji3gMbC1okmXuDHTFLiM98bE22OrttxfBW1daD6kNUS8E/vig8NfT/dJp0fhjQx/K
	d7OGpwMeQI289FKyGwWJxJuKSsqKKBW6pw1KZAXafQFHLM1A8t+14M5wzdHNm4GiTkrod878H98
	oladY5bcRNtrsJpDv22+VR9pAm2Cps17mw==
X-Received: by 2002:a05:6a00:1a8f:b0:748:f406:b09 with SMTP id d2e1a72fcca58-74af6fca3d4mr23163227b3a.23.1751306981513;
        Mon, 30 Jun 2025 11:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7CND6tKFO5hUMumYDZaZW9zhAXvptM83/cyBuGl+RUxf6hGSdNgBe57l5cuijhzysQkCevg==
X-Received: by 2002:a05:6a00:1a8f:b0:748:f406:b09 with SMTP id d2e1a72fcca58-74af6fca3d4mr23163193b3a.23.1751306980981;
        Mon, 30 Jun 2025 11:09:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cffe4sm9288372b3a.138.2025.06.30.11.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:40 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
Date: Mon, 30 Jun 2025 11:09:01 -0700
Message-ID: <20250630180903.77990-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6862d2e7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vubaehVBMwJoC4cWCuwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: dGknpA1bVeMZXEkqAkanj6Vf8qV6m7zq
X-Proofpoint-GUID: dGknpA1bVeMZXEkqAkanj6Vf8qV6m7zq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX98yj2xDuXB+i
 xWIh9GLgR/NPqTHIYwPah7kywDKYrzTAgMGJrBG09kg0kZ2iAwV99cj/XrD9p3bG0wgLBLpB+0L
 Mh8qtChn1yaWqo4QUTTt71cfTbIrvZsFpShSF2Y8vT+9qoz4L/jePPgHvXde+oIG05ubZinYw8d
 R4gvqSjwCv4254c9PnCFAGIHadpdplFmDrgA0ceIKFBvXHDWNmrlmb5+8DieA5P3yNWAwgxIwO0
 wCaTmKcTJMXacSt5Pj9CJ5CjHfHNSeoQWOr7jdfxQ1mBnBrcWcj2R42bOs40HNHiDyOSfYzBC3y
 CiKh1oDInZPPvR8fcDbsWtwrZfUHVGn2KvfDp35OhOcH7ONXMS20WcHBbruAspD0Ty0Rwu6VYeq
 OszhDRBPh/pq/wwsTWtzSORgVYpO9dL51LA61yDkeEx8pAJi0gQ6dzpyR8xNqNZ1w6uaKoKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=919
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300147

From: Rob Clark <rob.clark@oss.qualcomm.com>

If running on a system with full desktop environment, the file will be
much larger than 0x4000 bytes.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 03a9e814c931..978ea18375dd 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
 static uint64_t
 get_bo_addr(int drm_fd, const char *name)
 {
-	char buf[0x4000];
+	char buf[0x80000];
 	char *p = buf;
 
 	igt_debugfs_read(drm_fd, "gem", buf);
-- 
2.50.0


