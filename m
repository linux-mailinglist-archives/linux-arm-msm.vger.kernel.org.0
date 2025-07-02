Return-Path: <linux-arm-msm+bounces-63456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEACAF624F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1353A4E82C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6835A221FC7;
	Wed,  2 Jul 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnDYSZxw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7EC1E98EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483006; cv=none; b=KqKMzjXbkQFeJE72DBi5WimI2Y2xmw791PTapqLeiqoXQjyT4U4LlE25iDIDmucZrz5isN8cLEycUMtDXlLXhfbJZ03PfGkojZYTLmURNZ7l+ZECZozInnWxKzHNvgk7AyOUK6FyFOyBT7pmKNC5wp2wiNAbFHJ2Arymm107kHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483006; c=relaxed/simple;
	bh=68qKDUjPCCZYBmwUgz7n8Hn8M0VKfFy2+35o7l3EaNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhfeOP/tZukdMeVE/8090eX3U+2EIHzEnmetcwFWPfv5WpPD8uGH/eHExCf0my3IZ/RwVTxJAm/lgKAiPBIl9F3t4WZxeZCd/z8MBArIn365Q+a66vG1MSMeCJdFRg509H6REE5P0SAQjXpSl3RY4lluEiwImRuSe3aPOfMtc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnDYSZxw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DQjdX024817
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oFZ0e9I9l0t
	NVIRHzSo7wHujKF9M6yQvGWfgYyp1e7Q=; b=cnDYSZxwnYsI/ZGI0ANfd4rQz/M
	VJRkZGNcBucyZsALXx28yI1ti16ptktOJ1RqotD7lu+1uzjhcSoJywJ8hlImLR/2
	CemD+nu0vzxHPHVGQySbmsOMRorJEKZ6Pbcx4bHSZJZgkXn3AznqjFHbfH7qEXnQ
	14fDqLmQxDdOGscWZLYfY1UjgtrqskjZRausy/7EMsOHJV6jfrrlzh8r1zRs/YBB
	/roO9NakxlUuXXs1UljE9RhUJCi51MqxgGRzzrTt9kHra90hOvg2Gr3vo4rFy6bj
	WQfI4/Mfcn/NinBndqG7vkShvQeQgMQThFmkYPmGL+HE2OT4gZYTvAfJd7g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9nrw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so5128347a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483003; x=1752087803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFZ0e9I9l0tNVIRHzSo7wHujKF9M6yQvGWfgYyp1e7Q=;
        b=o1b1roIuEJXNy+UqZwR2L6gV3btk6p/xvV8+qu3fPEqUCswTLOP8WxhsSPuo8O0XXe
         us0ORupqQzQqpi6QXgTrR9OWNtmXGZ1VowlHFeGuanvrIxAB5EtXu2NKQbkiEwcWHx06
         2P3GAQ9oPPPqSueUF1wlqShUAkpH0pF7HusqVABxqnjJIxiXrsPKSWuWUJjE7GfYpMi6
         H/vcODiUW4z/7vKcIs3vqp0d6CqiOyZPajTNW/7wP2DT9WPAuVyDOzM89bnvQVTDrUxl
         Zi4Wor/Nefu/lf8N8hwm7CnMPEWKec1w/EkOwP7IFA71o9BZqKjZQFJjaWh1JB7BRpn0
         WJBw==
X-Gm-Message-State: AOJu0Yx4oHLfCiQrqbTs2WplL4GbLcj9Ca2sAHbnhIROQu+fo4x5UK3p
	M3U8vyzp2ypfMcRz4s3MnUQgKSCEHcxw1GMKb93E21tcqBLcrdKDE2Or/O01i18v35QR3+sz7BZ
	Pn8E2NhwCI0Kw8UMSfyCvhuh8uObLFqpWkP1t32P63g0YryUSss58y8gmftjKcfPikohH
X-Gm-Gg: ASbGncvxpEA7HID5IRPNQa3mX8sdJCr0Aie8XiyOAaP9mBvgYCnUww+ZqSKcYM6utU2
	k+PGV7ZFfX0Pgu+zQkUYFyEbpAysVH/65rlPnPb+JphHYozDgCumf2xevcZGCCEfeFu27c6YKOP
	6sxnW1GfagESYlYI+ZuV6zeKKtCb8K7NvvHeTt5p1HpAWi/pPAYkwPnCEuRsNYkNP1YXZ/iIkMK
	JogMTyxocghVqr9nUsmzBkq5DCh210y7dzLyjUhwkQxSZ19JEn68+OHeMN1weXFaQgxS+jiWsPS
	/Y3uh1D8K2bECmQUz/pqGCZ8Zkm9MlgucQ==
X-Received: by 2002:a17:903:1a8f:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-23c6e4051c7mr62847685ad.0.1751483002673;
        Wed, 02 Jul 2025 12:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6AnmmjH4JuAeHzEqK6aI/ZJbdxNMxlvR27URXslsBtCrTacvprNg0CZaAQwg3HXWdYa8zSQ==
X-Received: by 2002:a17:903:1a8f:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-23c6e4051c7mr62847385ad.0.1751483002244;
        Wed, 02 Jul 2025 12:03:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3641bb0765sm1684368a12.60.2025.07.02.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:21 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 4/9] tests/msm/msm_mapping: update for sparse
Date: Wed,  2 Jul 2025 12:02:44 -0700
Message-ID: <20250702190249.376313-5-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6865827b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=Tx2W04geZ2YvJpcLXekA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 5VuAIeLE2PuOmfFq_sL5DtXto1GrrGGV
X-Proofpoint-GUID: 5VuAIeLE2PuOmfFq_sL5DtXto1GrrGGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXzF7qwNGxBudo
 ucTfAqBMwLdW7KW9/nfbYDgjTyoR/2WySea5BJVlA5sLczX0rMco6dNY0h/SwN4Y6ZDoqVsZf48
 Do/A8ekNIfx4k1C+Kn6Ub1Gt0J12LIX88TsuK0SwaSaB9oB/i1RTHx/sVjvihm0Qp25BTMi7OTG
 9Q38/qkbLHaZ82Q5IY0nK4X7gWew97ZKO7dlj1OQabdVjmO2XTVZ9Xd7pVxuOyTeUrcOoQt+a+3
 fJpFLVebHc7zAdqKa/bZdqd5MCsi64qMRrvHksEhtzrWBC/+LiRmV+2u8JqWoj7Ub5VNno/o9Zc
 gvQ0Zv48pFqcOumVDUgP82D/KJ1zdwGgMzbIwKQvn4/f8zu/0Fjqogq+uIG1wySQX1BbeLchixh
 onfxIxeiGQG6dpFLEYVBqad5BrYyoShhBnLXCpkVbFbNYKHGPqpOzR8L7MryH9BabFvuHuMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=885
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020156

The debugfs format changes a bit.  Update the igt test to handle both
cases.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 1749a670e70d..64dc62c3cda6 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -147,7 +147,11 @@ get_bo_addr(int drm_fd, const char *name)
 			igt_fail_on(!line);
 
 			ret = sscanf(line, "      vmas: [gpu: aspace=%"PRIx64", %"PRIx64",mapped,inuse=1]",
-					&dummy, &addr);
+				     &dummy, &addr);
+			if (ret != 2) {
+				ret = sscanf(line, "      vmas: [gpu: vm=%"PRIx64", %"PRIx64", mapped]",
+					     &dummy, &addr);
+			}
 			igt_fail_on(ret != 2);
 
 			return addr;
-- 
2.50.0


