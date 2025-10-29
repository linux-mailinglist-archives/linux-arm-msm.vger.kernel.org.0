Return-Path: <linux-arm-msm+bounces-79375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A232CC19183
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79831C87938
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10C532B9B1;
	Wed, 29 Oct 2025 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWqjNbzG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCD7E0ZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B70328B6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726344; cv=none; b=MTX0Wf3ovOTe9/wjV7vepTwFELA/r0+DP7HDOqTyoTWeMPk8FbvEA+UzhQYkvy4qGNLEqkSLx9fJ3NmFFktGHY+juhwi4J84Sa+r9DFJiHLdPdtK7zOJJLJ+9BgSGjUX7b5sJYS6of2sPZmVvS+iFrXnokRqSkL+lkHyERYNHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726344; c=relaxed/simple;
	bh=QfKV/d3gO6255Bq1Gu06XBIiBSg6d1J1BVCrin6ruxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5TUykFdsHi1fLCZCbxYFKsDs036snd7OXVP1iC4sbFJXVNWraC/1AarmBtgWXWGUZWcaMaNEHw6FUqAZXYPctBquxjp3DSykOOOLDN2p9xAxXuOJ3t57VNEazIHvEJ7pBzz9v8tP8kLm9R71IMCSRLK16Uzli2b1auzk6ijfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWqjNbzG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCD7E0ZL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uuMn3642920
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SI7h/T2Ai3eUH9gaMcsEZ021ub3ZOvaSkx7DIHf6TpA=; b=XWqjNbzGgmJ4xvdH
	c5/tMCN3UpRvxy+fidtNzDT6dLfLCjSFnl4d+tOkl4vqRF4ZzexTxy+BPiNfwURS
	sAn7MKbanL6dwN2FSVrjJT6SilU3guIVsmyOkELPUtdBgviGV/9VDAqxu3iTT5d1
	vbaOYhsepaPIH7suMUXUgqwtT/G55tw6BraHqbhJx4UfVxWdhyMH3J5WPHo6jF0b
	Ym4zlH3ozFCmVY7TAUGVqUX/pOtxQxhVxbJRnfBIXK3JKH82r1u0UAq7aiUZbm32
	r+pyuko4qu0EXT8oEoAdXi9xDXjJHPQtJqRcJpxSloOqxv+1/OMG7ZmZ8PS3wCMa
	zvgqvw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hswg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-781253de15aso13600274b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761726341; x=1762331141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SI7h/T2Ai3eUH9gaMcsEZ021ub3ZOvaSkx7DIHf6TpA=;
        b=hCD7E0ZLneFnZRm/uyt3jNoL+q61WCVQhJBszkvgDj145DPpx471qmaXIs2lrTdKEE
         nSKtco2mareYiCgXft7AhjGR/r37U6hgM6yS00gX5TvY2QKl984iYrlSQHhMG8PIlW5B
         EWS602q7EwBSY81uB2IQOtJO/dwD0aKtjDW4GN6oGp8VUJpIc8Wy3jYqR/uE7U8aps6D
         pVSNXJ+AhpZeclMErfi/jW1/6rKDEnOOk1gSNDa8xf1YiLpeAWFOkTH1+kGPdUHO4Pv/
         KeQYzl51exlrFiNsKaX3YhbNUWIXt8igE0SvaJXupJD+3X4XHKDrcFsRfMJ+s50NWAnY
         j4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726341; x=1762331141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI7h/T2Ai3eUH9gaMcsEZ021ub3ZOvaSkx7DIHf6TpA=;
        b=jpLMFklMUErcyi0Wd9j1+cQ/Rh6/6OiAcAC1mibPADgFnwOOnKL72RZU4Wi3/NIjWK
         N5uYSAWFikTn7YXPB/jkLFKo13214jXduSoqQQsKzYoUuVdJccFggg19wkqFbL/crwT4
         MPx+xr4iWCGLWGDr6m3ecvftNL3yKzzvFjupd2bUlRN1bsYln3pLMw9ym2r8mBaM7vh5
         09q1phkbOukkq/mH8C4mIPsyUj8F+MakO4fmyledfFBp34wOzErHQDmRxMC7kGsQm9Aw
         xarIuV8vShJlTYel9sF8Kq36IH7bB65SfTpPMR48uLW6xBHyNks6R96NqE+1Gg16vhwR
         s+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzFe7zivkQdW7foi/w7In4QODb1SZ41k03ur9Aty2Z/ledvmaFvYbybSWUTVAoCH0cvMum0R+gNGyjsU96@vger.kernel.org
X-Gm-Message-State: AOJu0YwtYounv9O3NGCk7tt9ohSvP0AUEVOyU2XBbrHl8oXPSyiY3B2X
	Wx2jtc/y44kdh1gXFCu73CwL1Yuiq8y00XFBRmwkSDpv7WiWh0s4Pm4zRP3i0G+TtDXtxg3JHuu
	5ab4jJfUo+ZjZGbUYi6L7Z93T0p60p7fAIcmlxhZExqJJ3bvzhjZs/h/R9r8Fn0mTB0tJ
X-Gm-Gg: ASbGncv2qxV2y4mVDbcLtDTvoPEbB1FcMLidwQvRrrQuTHHyPtngeyTxapf/0/ix+GF
	pwUE5b4P8ZlyaSK6lXxZo5wuCw3yyxH4ZxwTSWRgOiF51TSQDmi2fllXXnwUu7lT947C+4iGcrI
	7sGu0SqNxUZaLq+J5iOCUjwaNQHlTtqzCpfL1xOR8nY6PB532riQIy4tStO0BAVoccIPuCGcsCu
	nEeqJXzArZ4XhP901cllwfar+8UsEx6JbHtAwv4oooKAwRbsxrjVpvhlMlwXxNFINZr3X8zTEJg
	2nt0VBG3CNTv8EmCDLakCRxQTB57uxAW0mY2K3HxUnp3ccZy74rQ8iKVsUJJ9Rj8jRpaSAXh2HD
	NsA06gFL4cVhjGq+F399Dxqmnna8gaOnFAPCLsWu3rzAPYywC3Q==
X-Received: by 2002:a05:6a00:17a1:b0:7a2:6b48:535f with SMTP id d2e1a72fcca58-7a4e31d80c4mr3183301b3a.12.1761726340732;
        Wed, 29 Oct 2025 01:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdWUMfoQSftVn+lusAOnm02Ws2xPYh2EYrN1Mtd4aD6Wz0CNiia1asitR9I0WSYSAKCYnvSg==
X-Received: by 2002:a05:6a00:17a1:b0:7a2:6b48:535f with SMTP id d2e1a72fcca58-7a4e31d80c4mr3183249b3a.12.1761726340191;
        Wed, 29 Oct 2025 01:25:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049a44sm14158850b3a.35.2025.10.29.01.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:25:39 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:25:31 -0700
Subject: [PATCH v2 3/3] crypto: qce: fix version check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-crypto-v2-3-b109a22da4f7@oss.qualcomm.com>
References: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
In-Reply-To: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761726334; l=1130;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=omxST5DmfZwYu9h7SFMilfhE7adNC9B84PnqeP5dI6k=;
 b=0Yz0fbgUYPu256QnGv2gWtF6KiZ29fOV4bqnOkX3ltZi8omk1/WNEEktvwo5X5aVDYjd/sNil
 i6nBblXUZhvCi32cKd38ep3NI2ef4EiQ9fZekY42hyTLtNd5T7UQaea
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901cf85 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7enFwbqk3NRG6xSZt3cA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: PUL5wkjnsBOvXsPqd2WoxCf2Qero_VsF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2MSBTYWx0ZWRfX0SQXHR4LwqYm
 +vGPKNt4tb8jwOyjblS1/1QZg2rzQJzp8JDFxc8J7IfaKn+EeJ38nM1Q8kBsSwevLCUGyrthPgi
 qvAFzoap/c/YTP22jc1THlFGSbAhrUjXbdV+N7AKuODbXAYFHAGOJm5qCikbC0YWZ0APiYaJULG
 O0UN7d4nORK4/iCRUp1WlQdwQpO1P/h6msG9G624JLApMAD/Jd4QzzS9MHS4uq/6/lQE6bgs6T+
 /yiXw6sb8eeBzUzJ+ZfNcL40X0vtrz52G0hNRMrVaixaq9uTNOB1WAYNS0KbSfWN9NuyuxsWKyx
 f4oCEHhB2JvhNZs+H6W2/+56fsnzmcFcQLByCvNfqhlGnd1XnqIPyM36ZscCnRruoJ0KLYFnutj
 7vH0eBDdrpGL5QIKs7zfMjkyOHg5EA==
X-Proofpoint-GUID: PUL5wkjnsBOvXsPqd2WoxCf2Qero_VsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290061

From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>

The previous version check made it difficult to support newer major
versions (e.g., v6.0) without adding extra checks/macros. Update the
logic to only reject v5.0 and allow future versions without additional
changes.

Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index e95e84486d9a..b966f3365b7d 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -21,7 +21,6 @@
 #include "sha.h"
 #include "aead.h"
 
-#define QCE_MAJOR_VERSION5	0x05
 #define QCE_QUEUE_LENGTH	1
 
 #define QCE_DEFAULT_MEM_BANDWIDTH	393600
@@ -161,7 +160,7 @@ static int qce_check_version(struct qce_device *qce)
 	 * the driver does not support v5 with minor 0 because it has special
 	 * alignment requirements.
 	 */
-	if (major != QCE_MAJOR_VERSION5 || minor == 0)
+	if (major == 5 && minor == 0)
 		return -ENODEV;
 
 	qce->burst_size = QCE_BAM_BURST_SIZE;

-- 
2.25.1


