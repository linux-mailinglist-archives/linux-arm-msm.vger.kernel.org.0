Return-Path: <linux-arm-msm+bounces-57656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199DFAB4A7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 06:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4610E467DDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 04:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A510712EBE7;
	Tue, 13 May 2025 04:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPh9xN3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536D1B4145
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110513; cv=none; b=BMtNcixcF+8u8+4DtpqMbUOVrOK/4BVh/weoo3Wg0rOjl9BGcO0PvGXBqMMF6hfepcQh5KsdgHxgVeMtDIygbNWn3lAhQDPIAQsBKVJtZP5x9R53MrhsoII31KQmQKgNBPUvWQekAJAFR9g6jt2okVxuqS6T7LGjYF8CTNrzkXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110513; c=relaxed/simple;
	bh=8fWZlBxrX+84Os1R7GIMkrDtRg9kA3/5/dk7OLxFvsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gfQZ8Vzn05mWrFkKSPNbbfOVQZs5jACRwhvtYD5sf5Kn9rlwTV6YX1fm049cXVYSuQaQ7hk6jnaOdrRdTJVMtAs2/wFxQoidXSVxQ+FXZGbix6w16O7JaSQGfMYo9zjg+nh1T2+cSDdUyi5j1HpF6kGwcyfhtNnQ2pW99Ah1yUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPh9xN3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJ61tN031462
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/B9yr710kPUz2FCgJIjP6BTbuVzSWyCLgI9
	V7LIFO+Q=; b=pPh9xN3T1xK3otRbpft1PFc/2Bzr/8mylX1RawIdIeu3hJLfgb0
	jdvaKcvVTj8u5NPfhU1IiJoEKzEjqFzgsF91fnBjmHQzzWj3AJ/eT1w2x1BB7YNy
	6g3ceKhhl5EvSGtnHc48Oz4Ad9fCW408pshMvdYBxP6bjxqo3pzCWnXqPrMxtPoF
	rCYXk7kiO+26pck+FDPalI6ItLLQcayRSqVOtml+9FxhtQYqLgW3nOA2wFJiSj/9
	Fmbp5oUWZlwqRLRpogaOIDFRg2KJ0zST3kL7Mvmao9JjTPJNYV7MjOmyB+Tq2qAR
	mPoINexeP9nPZxcbYgbz8DrJjd8SOU+0mKA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghepm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73e0094706bso7392545b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 21:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110510; x=1747715310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/B9yr710kPUz2FCgJIjP6BTbuVzSWyCLgI9V7LIFO+Q=;
        b=RTPX38QBLni3cfsXryaSMEaMblVyviaWq9xl1lRcMfBfbg9GrEZGfBbuQTgK5cCnFl
         /b7JMgOQIdfIG+iFiWQXYGZyJyiPb8G2bjNUTQmtyq6anoarer8WpnUwM+aRf93mZTAn
         krf/VFBHx7KSpJBi1xYVm8bOrJncWBosS22A31qHU7U5N0isr9LQdGClDxh75GFKJWci
         32AAfy5CMx3X2Si5QPTmeh8l7Gaa1HWYlnWeqvqSGVqyreuBdENPeKP0kXKjdOpb1bP9
         TiZB65Bcp05kIoBaKidFOnB8CwwYr3UV8GSaE5A2AnrQ7vMd3gC/yyW15wtcAdmXcnVG
         PPcg==
X-Forwarded-Encrypted: i=1; AJvYcCW1XrPS2n4sIcONeeJSnba1ulSGDWIL4UEIinDvlcfV5puUDni8QvruQvK9IXsNLGacg/2nKpFHkkHGFIwG@vger.kernel.org
X-Gm-Message-State: AOJu0YzohvGYxSr9/JrwWDwHn0CHCcO567TLA8qGoxK2IivDj9SuS2uv
	/h7JRl9DLD2wAVG7E/lhJlRQE5kMiatNm4o1wEnCsPFzY+rmDhOoSm3Jbv+942V9ZR5EJRuo0n8
	uQqZRgKsTkEjxYnV43o3aAXz9RjAoe+4k/ZVaAfHUw+RhLM194bPNCSn2ECGuveLp
X-Gm-Gg: ASbGncuJ7bJFXDh1kSCnqxGElU83NYxmlVNARlC6/htMXSwV+MmY+NWj1EzfgffsbPr
	mbrtCxGHYCCuFS6TDqwiY01Sp8hS0Z5+ZEuYKAB6FAxBLFB+jUGIRYDpJ0hWH/ablpT7hxKG303
	AJojYm8dkj9ssdhex5fTbetxm9RgPcp2dfahl0WH5dWeijoQPh71iz+BrauUAtegkAIWRcuyUse
	DQy7q8h81lKw8mNleilC8eBUb3nfxV2OXJTZlXw9DUl0fxruU5ll5fPbaakDOFhLm+7SP/un5Is
	3CLOnUxMcyZbrXQe9rbIiG/pmxYf8af/gyJOiQLl57rm
X-Received: by 2002:a05:6a00:a13:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-7423bbeb32dmr19989911b3a.6.1747110509812;
        Mon, 12 May 2025 21:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE70Gr+yrpOtCcR7nL5udcSWL2S3FfHHIHR6OnyBoeHKME3UXPIKKmiDUQAqePTdJkn/YoF9A==
X-Received: by 2002:a05:6a00:a13:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-7423bbeb32dmr19989890b3a.6.1747110509398;
        Mon, 12 May 2025 21:28:29 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:28 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: [PATCH v1 0/5] misc: fastrpc: Add missing bug fixes
Date: Tue, 13 May 2025 09:58:20 +0530
Message-Id: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XyBo-UIVNdYspNFAovDTTvNVE14CYTRl
X-Proofpoint-ORIG-GUID: XyBo-UIVNdYspNFAovDTTvNVE14CYTRl
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=6822ca6e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=3nwid1PSdH_ZJRXHEEwA:9 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOCBTYWx0ZWRfX7SQKl8FX0ooW
 FFXpNXdNAbijej7hUNBvbxdmwcd4OJEESlhHyX0okWnbL9T4PvPWIOVMee7Ca3LxTI8OVEP4GJD
 UNCqnkp6f0lsxCuaMbZjnSWUIEDWTtEJfhsmEarKyuQSkphKrvz++lUaChOBEMVK2/CsNWoyPd5
 ORFVKKm+E9Bpv6fdktxfS62BtTj+pHwgR64XCPIMScgQMqoW70PouePu745RaaoHcElmdGKS/m9
 dBg4yQokHSchBXYwXbVjBaonrHAT5FbUNJrZ3EqbPVc27LhFLObC99Jv/RcXCTA98ZDsRAlquPg
 kmEURCrd82DsYBD152RAGDHOwfYyiZYFxXYklg3XdhzCJoElkd55QzzChq26S/ad/cVX3ZHLy8h
 XuROWs6sp0CW+DLp4CEhKqsn7CG87kYOKhCt77tiOMuaa3Q0ciJb8zlN0YENkxVburBJ8eSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=685 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130038

Add missing bug fixes in memory areas. This patch series carries
following fixes:
- Add proper checks to fastrpc_buf_free to avoid potential issues.
- Add multiple fixes for remote heap which is used by Audio PD.

Ekansh Gupta (5):
  misc: fastrpc: Add NULL check to fastrpc_buf_free to prevent crash
  misc: fastrpc: Move all remote heap allocations to a new list
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation
  misc: fastrpc: Add missing unmapping user-requested remote heap

 drivers/misc/fastrpc.c | 182 +++++++++++++++++++++++++++++++++--------
 1 file changed, 146 insertions(+), 36 deletions(-)

-- 
2.34.1


