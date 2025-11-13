Return-Path: <linux-arm-msm+bounces-81715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A004DC5A8EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 1B41A24165
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AE3329C72;
	Thu, 13 Nov 2025 23:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvOv8OPQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J41cthJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D21332939C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076596; cv=none; b=OI8G6Kjb6CAGXbJ+NWBi5mt/7LXrZNXb4KEIzN0YKUPri9HDdJJ1MBF8BG4Oyg6UYKgqIQf1lttvI5wQiP+09iHZrzdmJUX32+WG4ELOyBcupGbDkliJYTEdTGWYh3a7OSJXDEVJ1i6tv39LdmaL/pEPuBq578q3cKdPsnP63H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076596; c=relaxed/simple;
	bh=P0TGR9JNBdFdJf9lbTMB3me/b527sl6CR0hvyTZlFRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYyiD/G+SKD1jN6G4TNXz8FdWP2SKOQTSGG/y+mgFW727THPGExg+xfboVgMw1l9OdUC9OmuvXduJSJ/XFZvcpR8jrcjDWdqVK5RPScZ6B/AN4TcAm0nqOcYcbKkqoMB5NcR5+nnx5E5awQbTxut+IWL1Pgv1adKmVAdIiHhCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvOv8OPQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J41cthJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMarui1582950
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=; b=KvOv8OPQjRl0Yk6N
	GG6XOAzcr2BgYjbcy3Hs5UNvU9iudmZVNrf3cQqHxVsQKx2A7PqUJRSKWEgRRLTF
	XLIOfAXzjHxgWMwdeuhLCThWdMaEJ+tLP0qgmN7G+qWSVjwQtpkL8ZAhLjhz73lN
	h7cgTQz8EDgf/V1K+WSOaWCz6z+hLrSL+RZuaNpSUvQ8IsJTLbtBQJijIMNiB9qw
	xjqSh9DVrZu+8NeGAq8aD9usSriFtPAOCOwQaiOrOfHxUuEqrrrbDhZF+4YJL5qb
	9xS+KMZ38VU++4KwUPUNNkpSvydDd06oWAUx55m1StxImY7kVw1mZ3b9LHpKPgJ7
	U8qA0A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fr42h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:29:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso2206366b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076591; x=1763681391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=;
        b=J41cthJEszdK21zHjhfexOOD9u/SThAwmtKM4XCp5kYhY3K7PHVQulAcCddWclNIPa
         4H+EelkG6l1RNZniVGY/gIkeGoq5dbwsafQjQEl+MHcBWhRDIHDETCVBYiqkH91WyltT
         JXDeg+4V46WDvNs+QPJ6sSSljhGZuDE+ZzUUiqP9RPw4ryaYUGcNLhlZQ6ar2CSqGE+4
         H5F31WNFsmaF68ihAPzxvv/p83B0994Aoit/KccwnCcPynhnWniQFBVGC0+GgIVhJUH8
         y0UlQe/iNKmr22RGN3c1bDKG68i9+QnZ3ilSSyg3pTB12mh6FV3Duz9PQwjmkX4dUmM4
         r7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076591; x=1763681391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=;
        b=PYKPPWbps9b0gNEZE5dI5eemGsePAwdeJym3H2aPSUGlxhToP/CZHSI6zgAKV7oVRV
         VpWhiHLeaOIoIeKOIRkdwqp8zrLEXMxIMBki0BOqvh+BXkbOLWme366WCX317+2155Zs
         K6xDJ/TdmzS3WMmjq5gItghXqgtYJDtAoxPzqpvY37CJNJAxYahP+1cd0CpfRRFJiOUa
         1QD78r0rulmWkbtxofnMAg2sgxLzL/rsT02pUTwL6U4XaEDOuQY9/n7VAX4Gf2t4p7Vt
         NyuRfdAQAnskx53h4p1/oq4tz5q4iDJc2Jw2PSYlwvRqbbfRfhcLV70xZr45nGJd5S7/
         oDmw==
X-Gm-Message-State: AOJu0Yx1wKxJa2yAHQeIxU1TBTcw4bRab4EnvVddmHmvQK11/GH9L9u5
	Y5FgsmSGOlbpvDiBxuK1FPrtPCx3YrOreKZtUpVwcn07VGwKFSLnc72EghetC9TmN1bQ0/+2qhK
	GmF6VyBX5yNS+H697qOE/Dvi28KkCZuhzEZLkvqOhEsGuKKLiP/7ZPh9gXotmtxz/t+Mj
X-Gm-Gg: ASbGncu32H3xhqbiuwHPC8p/t6wM1D0cqvdxkkIzT4d8CvBfPARNUPPBqcFt18AfiLv
	ougGU0EU3gpXNbTD5vFE/MwAlvT9BfArwyK8Xc6iEAVCpAfQtuaQNbaEabxD1J93gDKWbBp6u/s
	0j3/RHD40dqSswOrYm0tLqQwrmUf8sXgq5OeKnQFvq1pVREILf2F+r3Ld5WMshAIP1EYqCWABKQ
	mAZkf5qUZXGTQgCB4bE+QBTFovaFG3/xEUoqRNVZ6t1cE91TQb4simQWXVI87r2eMO8FhyHSTvD
	q64JDwrmo7AE7uyb4gx6akRS+fmQb3VdGk4lhY7lc7Rn6yotA8Y7HFCfnTv6HhhJ5tGchhcZnlW
	0nTntlCldig8U7UZmIwKAEA8=
X-Received: by 2002:a05:6a21:999a:b0:34f:ce39:1f47 with SMTP id adf61e73a8af0-35ba1d8b9femr1418074637.38.1763076591293;
        Thu, 13 Nov 2025 15:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeBbGRvCFU+UB+lpyJ3viuKd80lm9qg/SW6FqrTQPCqEVq2jmUv7RyRXNmK9UZPN5Ft+Hy5Q==
X-Received: by 2002:a05:6a21:999a:b0:34f:ce39:1f47 with SMTP id adf61e73a8af0-35ba1d8b9femr1418047637.38.1763076590803;
        Thu, 13 Nov 2025 15:29:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:29:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:58:58 +0530
Subject: [PATCH v3 01/20] drm/msm/a6xx: Flush LRZ cache before PT switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-1-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=P0TGR9JNBdFdJf9lbTMB3me/b527sl6CR0hvyTZlFRU=;
 b=I95TcxJrZo5IfCg2YLag6wnr+kCPKB/xqUAfc8bUf+PfKRdx17k8+cUdMO4lgWu4+f96+05+p
 nU3+6ArVQ+8AtFUkQwj2m6kgMzzvLE2RHpuoKjwRJqkhXIvMDr5t/LF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=691669f0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: cgWWnK7Rar4pBGaIoyJynahVUCTPR5xx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX785tKJb3Q63U
 aGAelbHhLch1kjZnBGTX6YOWXx6gSQh7423nMCbVsgi3Gmx65ApITHErzWyWrog5jEzEkB1d64D
 j7sjf8WoLXdrEAVxr0P/TsErDC0mWhCqneu0Ru7niaKbg4zkRGHeyfG6b0GsT4OJuQdXDr8WhDn
 eNlsEdQM2j/LlcSnIYTCiyix8SNNYmkwF6gbQVVah6s+ZoHpjvchW98C9dNvwRxb6pfpOWqvwV0
 bY4kTI3LeRQR+HlPab/A5+YymH9UOiSTuyGyRzlTAWXlSNTiZcPpLF+TMoACDJoMIj8uuqKkIEr
 TSvvSHO+Vd5g7IiALKpzMn8N1t0fYHa+WtPiIlE5bnvmG1dltCwojRHv45uFACJyNO3T1rF9h3a
 K/AhHc09mHj6FUZ4vd4w8FLouXXeGg==
X-Proofpoint-ORIG-GUID: cgWWnK7Rar4pBGaIoyJynahVUCTPR5xx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185

As per the recommendation, A7x and newer GPUs should flush the LRZ cache
before switching the pagetable. Update a6xx_set_pagetable() to do this.
While we are at it, sync both BV and BR before issuing  a
CP_RESET_CONTEXT_STATE command, to match the downstream sequence.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55..6f7ed07670b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, submit->seqno - 1);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BOTH);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
 		/* Reset state used to synchronize BR and BV */
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
@@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BR);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, LRZ_FLUSH);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
 
 	if (!sysprof) {

-- 
2.51.0


