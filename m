Return-Path: <linux-arm-msm+bounces-84613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BF2CABD2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 03:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 981073023780
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 02:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C552D97AA;
	Mon,  8 Dec 2025 02:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcqgUXfj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A5A45wjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B82475CF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159738; cv=none; b=ZaBa/+6+RXu6GVJv0JMHOBdERxaTqFfcaH2WFfaSuqtsfDOs5o6yU9+cDCoSuILtwyzM4tnSv1yHxRwt8Ji036XxG9c+c/+lZCpTvBkqrSGd2mQJ0UOJpnUh18xohf523xsTiXWu3SY9vxbi+3u4ws/3hPWSWn0kPC+d0nHTpKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159738; c=relaxed/simple;
	bh=3fQ45fmypJKdFU8biOryTsvkA909IucpLjx1Z3EEHfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caehKk5fQut4IPgdRRKteOIlvfNfHhwwclkm/EEpmiL8ZOwq0112FlAne9cCNIdCEq2sUJIliXWwSanswv6Y7DrhnqQhzBz/7l4iXePUgvn7aZ1EKmTZnJ7zBLUSO9c+IPb4Jpu9SXrsOxNT4bZsMwLad4wKKUd3ZibJum4qIwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcqgUXfj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5A45wjI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MXU6x2884275
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 02:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JnwPDCrT/t7
	P0+FTnGBdHYeTzPc9699SERxfezOi6Ec=; b=QcqgUXfjmorckqpM9MOAqwcCtjJ
	sZ9XZeAPz8+NBOGG9Ioa4Otg3wtp/AF+bS8hYWqLO0ag5qQP6EeWezojhZhwsN2y
	cpuE8tWJRcIV96IwKQ6iHHtIN7Xv1T+Ms2koXqsHipHP4tNRA1qTwexs/IymFO5z
	qWAV3TM6nXmn/j2PBzkJYAZ740Svjw9CIGhfSkKYDI9zTyuT9BmMtRkHH/013axQ
	ZePRiWARUcu2wuUoZibLz6FPQiLlqfHBfdzzaPqrzHpJhvV+FhDIo4lhYgezUJ9x
	1hugHd1dgV6dTzns+7A5dMKDSUWgjGwYe784hKf6g3K2VnasKwIsHdKXBzQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awhaqraju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 02:08:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34943d156e4so10761132a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 18:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159735; x=1765764535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnwPDCrT/t7P0+FTnGBdHYeTzPc9699SERxfezOi6Ec=;
        b=A5A45wjIr/cmuffctJfXx35ZkVKkX/a6+iYXVHSlJuOd+wcjjx8KWtRGV2Gd43P44F
         NBBmpKmAfKhL/SEz0CUtd/L+zwQQuF4+E84gwWxN1DF81he80UNuOS64QMURX/seuaR6
         oYODxZ0Z4AZurM6cL4aRAZqjzs2aRfdADs/OxU3xtIryIIpSQGEph2a92qACjhpvb5uk
         sghaZEg09XThlMAytRQeZFW7j3cJSLpFVl15N65Fru9ZGoTpZ8CikSgHwACol2KSvCQr
         pMcVhvyIdK6mpoB+Q2J3x0m0MSpCAEXC/FYfq4P60UUT9uZEwCtE2HIt+Ynq9ODIJAQe
         2H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159735; x=1765764535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnwPDCrT/t7P0+FTnGBdHYeTzPc9699SERxfezOi6Ec=;
        b=jvEUf0o/2xmFbOMQeB+/YdG6ZSot0u/DjZa/Zb3b2TXM9DcLN+ZYmOzHgS6Iwi8lZs
         DGbDJ3dEFn2gVkW2rAmXD4ErxySt2dWKOuCVhWyROnGOT+Rr4HGfLQk0JiaYP+UYo/G8
         PHtdXNBAduRlsKywWO5RwPICl6o0MHGXUY4DNpNkBUQGQusTAgwB3rl7qCK/ZSzJ68iK
         WaLnQsB5+8Bn/hffJM0McDykODAImpJfiC5DJJnDNUIFPkx0koSwOU+SozFgQB0bQT3S
         G0K7RTPD1MwmqyarwWRdwhbkz46NaePnu6UMot32Ah36qjlNASwWnHca16hv4yvHJNdg
         GGdw==
X-Forwarded-Encrypted: i=1; AJvYcCWAmCsP4GJQXWE/FWM4g9v0F41y7zDyNKg8UNK3G49zj46BeaChftiTCosYJiwuO29XHO4+WMRqE7ZALB1i@vger.kernel.org
X-Gm-Message-State: AOJu0YzsfvWmCR/+Qlikw6j5rBvyCwLh/A5ojevlE9NJdJnjnPUaeQJH
	YKdsARLK7JBu4XFGWUZMuz7u7/UxJ151wmkPoEpexqKluLGzlKU1OYZbFp/gI1uFeOzSgCs7pJx
	XDawmN1/c3RT2aDBeITIg2CmrnEGMq2WJSoQIgGIZ0VSPd+HB4IxZW1eZeFjCUsIrv6wu
X-Gm-Gg: ASbGncsdamC+2HnAm8UyeAevYNamvpCmcaXs5nVv6hMd3RGzvi2NOHiC1QjkRJB1Ztt
	7HcXkN14/VP+lkplXZLiH1E2oNuefZWw8eKtRXHBsuAW9wOWUmZSPnN0kYhO8t02y25ZbWTERrt
	tmNsHhRZriVRye/QKlpQOHgVOC11c3mZ4TAI4lA44cMV6HC5F0AB3QsLpkxuifzJ1nE4hqKl/PN
	hVFu/UIh1VdmL0tQF6BmfXEcaGbyAvtBnqR5pwmUuYXUS8fCBcLh4SSoOouEVgNbAxTDP3Um4Fk
	QpXNU5mm+BDzn5ICOcm0JbNsGlpaRejpRbTPFCBB6vpmQqKHedTjO3e+wB+jfcyqA0tC6bxaktR
	KPxchHUs5IkXrBxj95PuJdEZEY7axHZR6t0Wkbi+17j1yhHHdKJmgbtp/
X-Received: by 2002:a17:90b:384f:b0:340:c070:82d7 with SMTP id 98e67ed59e1d1-349a2656062mr5302180a91.35.1765159734929;
        Sun, 07 Dec 2025 18:08:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED9iRqsVBHLEYuDWFhUVgjURXDkSKM7Kyq84RHO7nGLsTcALh6RIiWHvizgEjW2lez0PP4dA==
X-Received: by 2002:a17:90b:384f:b0:340:c070:82d7 with SMTP id 98e67ed59e1d1-349a2656062mr5302155a91.35.1765159734354;
        Sun, 07 Dec 2025 18:08:54 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34986460717sm6481676a91.5.2025.12.07.18.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:08:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] tee: qcomtee: mem: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:08:46 +0100
Message-ID: <20251208020844.5310-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3fQ45fmypJKdFU8biOryTsvkA909IucpLjx1Z3EEHfI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjMtFhKJjHKCTwIDozXaeQyapbxESQyhkRz6T
 m+lQwTxOKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYzLQAKCRDBN2bmhouD
 1+JyD/0UQqlFKSWruRYTspyk3mFj6IDAALcGtVjZlDHP5qfmXRqyVabypuNzXDIC6CAb9DAqhIM
 UZWBvj5yIn05b1dEbJGNS1McsvMyAtC8op/3gVOsI8EdkBKB7f6MobM22G63f+bo5G1fMosS7hX
 5fHB2vqHhGrY761NKm0rpqDtOYRwEQLP7BvQoKhQzA+8ew3L8K1N/0x/7U85dV8ayVmX2UYUKkA
 7RjYqCuMDEir+5LVVzpzWaMBaZbQ98WWPn5YNOIzrIBxayV0WiNjxnB9LJYilGeKVA+n0ggcTEv
 iuKaFfY7MNU5auQnFbWbhjGCqX6kbp9VwnPcwcnABswA75jCBCBc6HolmGnq5UCJ6IvBaPOKGgQ
 w1IWP5PXG2HF+G2Ej8mAOHzL0Evim7NQ1Tm2G6oWmetFawffgT1K/4ckPei0HXOfr+qMlYxHIpX
 PzMAeLAStcH+cbgl3dzV16QWCup0akw1Cgg++DI/LAGtW6DTNLYyx6UmOBnVGDvjp6K68OCDOYe
 Zbyw1s09jB/EayJQPWLvGK3PoL9vt/97GjfcAo1X6vbZ3Ew31OHWXY5rcdYQ4X0476p+69G/TRz
 PvPoKjd+cBZoiLTmQwhgF15OXqXFtL3+ZJEOZjh1HXrqbD+kusqmoISd56VWwkOolZSWMFhB8cm gdj1F+FuHvD3pRw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX9mBCQ7A/wXPr
 841jKsryIfkTUvx7Fx2fnqLtf7qEiQG2dA9cJnuZdTf9TzOg3CjY9DaNwwyneD72qBxI57245ps
 e6rxkKkgHMGvUywq5M+cle4gs5U3dMIIF/0aJmiE0XBDHnD3YeQpDRvzpOeAiEfTzB7vOpE1UNo
 wl991J1u8k7styzQug0jj1Z/YJTxTAL0H2P7sicqSgYyh7ylDjnvf0APcrQFcquTwDwCxbv5qDE
 xMP7jWXti60C/1BHvcPPreS6XF/Cv+ccxK8Bx7kuP3B4bi2xGxVBM3ih93bmFGGySVAkozfWXJp
 M6aZHl3lSurrQhmcZh0Y4siIXdAJeK2tsy/a4+eZc0P5HRHJgKxzYS9e/TUBfiusIBg4SbQb3xH
 0gjbee2xbNdTWR6l4n/t3tdmF3HXjQ==
X-Proofpoint-GUID: TrECL7BSVLxftxjiiIsHAjFq74CfhL4Z
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=69363337 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NV4WgquvA0qvyq2tMeMA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: TrECL7BSVLxftxjiiIsHAjFq74CfhL4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080016

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/tee/qcomtee/mem_obj.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/qcomtee/mem_obj.c b/drivers/tee/qcomtee/mem_obj.c
index 228a3e30a31b..a16f8fc39b8d 100644
--- a/drivers/tee/qcomtee/mem_obj.c
+++ b/drivers/tee/qcomtee/mem_obj.c
@@ -88,11 +88,11 @@ int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
 				   struct tee_param *param,
 				   struct tee_context *ctx)
 {
-	struct qcomtee_mem_object *mem_object __free(kfree) = NULL;
 	struct tee_shm *shm;
 	int err;
 
-	mem_object = kzalloc(sizeof(*mem_object), GFP_KERNEL);
+	struct qcomtee_mem_object *mem_object __free(kfree) = kzalloc(sizeof(*mem_object),
+								      GFP_KERNEL);
 	if (!mem_object)
 		return -ENOMEM;
 
-- 
2.51.0


