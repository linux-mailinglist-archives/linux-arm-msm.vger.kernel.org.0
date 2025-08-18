Return-Path: <linux-arm-msm+bounces-69565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2EEB2A28F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD32C17A276
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAAE31E11B;
	Mon, 18 Aug 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9SwftKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364131E102
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521465; cv=none; b=BCEgON35MPvM1H7BMX2vw0b6fY77VbZCtM4GWJdPUWXOOGpcdPl/rBWxxu3c+kobpQppGwVIqm0LaZEMVJIF5kruaPcHx/hmr8GS17qZ85GJfFgLnc3wAJf/o9LnR7kUNWwfme3xV2tuPrCkQoDQr0NqP4W1w8452qm3OrjTfB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521465; c=relaxed/simple;
	bh=MXxOA0e23yUVQE19DoFyqAM/igT2n25s22U/pbkdpu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRzOzUAqOe0AITZ3W0WoULyei/Zsd2epKuZxoKrCYXruUsG8U44CTaKOla5Tagn6c8YC0dYTvl6gVOtm2tbpdiAKn8hSyuaBJUTZOj+U3r55+42rTO7wF+7dQiZHdDkrqFB1Fwx9DGe8HvqqayxhPhq2G0AUy1JzxjPE27NRHfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9SwftKQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8QvRb016840
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T9OutginLD4
	JovrJM4X4CKlX+fhBcBPqmCHNdCEWKNo=; b=c9SwftKQIR74PiFy9Ts9TikpQ/d
	3tXHf+yU3kM/eAHA/zIj+X5W8RdzPDW09cRaNmixQQOSxODRyecU8xMddw5XJTQV
	hVnJ+16+vHTQA2Ga3DBu6ftt8s4HEwDiMG41CXxeGyYOfnMQFHHf/lErJmPVFO46
	n3kqtRk4TduwwQzKDZlfkqD1BHvfdtU3ON1b89BCORAHHCxYzMFIeF8A9hgAtQCY
	f1Ehyjw+NVpEJ4HR7D239cLM6JReoRiLCoo8qXQBbphz5gGdDFO2CKBKWLVNQZRz
	iji7v0Q21lC+lHkN0o+8QXYbBKhiejRnuepbeT4npd/p4poS9PdRwdflkWg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjycs6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f6346f8so90332686d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521462; x=1756126262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9OutginLD4JovrJM4X4CKlX+fhBcBPqmCHNdCEWKNo=;
        b=eN1oRI5YJ0/IcxzZKHQJpwBbAUiOOka/rpPgV8g3vf2gBD/Hjtbh+fmRPj83AKxcg2
         AIyJL0ATf+3zh4Zll+mnIm5WqhOeDpEf13EbiPPfnHlj95C3D/fxAuajFATYgooJFdb3
         9mpSq/9xfWjzD5pb+tBp86PfF9e3qPvqZOJjHhor8u9pJnwqQdzoe2HcPVk3EdyDmQ5M
         7pZVIdlWutkCLKJIW7ZsKVNU5AB1rZmsmvCzjXA8xGNT1BBhjxFmHGvRrt7PgiQU3iG9
         mlidLJiTtxVMsssp7uK0jXYW357nlO6E5AMgo9sXFdHDdPfo1qvIxuJ2ADlKADVYaAPJ
         a5TA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5viIWd19m+O32YAmXLsXdaTAXoG/zejgff6hzCrskwiAl4uue0n/8NvIJHnH5D+c8ebZPULB2U2zKESr@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGoADiW0tdThOy0OqSKvL5lR7/VwWM2xVKWqN82ICVj7/QUmZ
	AOIoLX/3F6Jf37TvyakxZXA0zgvDvT+aFj1N3aBCbAHJWpndLmwLpvyoGgV4HOmE7Wnc0hYibS5
	1FNd7+VRZZlSsoSEnfPCCACrRjSFaxnHUAMT/TRtJ2dJpJMFF+QFDkGkKKP9HV24wJzyD
X-Gm-Gg: ASbGncvH6glZwvLJ4KDuk5NOI/mkuqJWgvEzdLyF6uBEFI0lZ9aTET7NKxUAubFaTwx
	kSosD2M/xi6zGQ5MRGLE/XGD1NoQ/kt1JKZ05w5j20sDbZe6jetRsqOlkCHM2oCIzbf7N0EhCnS
	eEiHrshYyTY6MpLL++JiZuTsZHtS4w4/3KXsihekmMed1EsVZ2VG+gNm413TgpyYOesRhAurCPi
	zw1TcWnQOO2BsGO3lvFItqRke1gUVlBFdSj6cgJkehJANgBfp+N8qyQXeTOvWawa1l55dhcdxrV
	i5KrzumTb0h/w5Gbp0fpAAVittJ8fstCKA2w9pB8fhVpKj8Md94AIQ==
X-Received: by 2002:a05:6214:1250:b0:70b:b660:4d62 with SMTP id 6a1803df08f44-70bb6604deamr48746896d6.2.1755521461653;
        Mon, 18 Aug 2025 05:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPgoUzQkhRctOz2bsEP6KkdrUtGiGkLED0ER7M4x3mmHheX7uMf63MEYPSJMwsa22+gItE/g==
X-Received: by 2002:a05:6214:1250:b0:70b:b660:4d62 with SMTP id 6a1803df08f44-70bb6604deamr48746656d6.2.1755521461193;
        Mon, 18 Aug 2025 05:51:01 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:51:00 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
Date: Mon, 18 Aug 2025 13:50:53 +0100
Message-ID: <20250818125055.1226708-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MaosNauQLXpov6TVR0x_L1xYgDOkhKry
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a321b6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2ggkzc9sqBovd5WwaRoA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MaosNauQLXpov6TVR0x_L1xYgDOkhKry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX0oyum6XZ/hJ0
 9LDQCt+cTIHjTzX9n060rSII9NcsblBhDgRbhw+EaeBH/y790Rl70zp0JNllL1XsXjEpjJ8Dxau
 sgM/8uvNlQVupn1TcrYA4JUbMbWxmDiekaZFkbMwoe2IptzUdHVgKOxUTCESbUee1swXrZBITdU
 D1bllmp7ND324gms3Ct9bSD3Wpe2wWT+3qKpUaMw9Js7+Cu4OqUlVwWOq1jDJAN6Oqoy+EQaIZL
 qTtbYgmqUM0WgCkYdv00rADhgD7wybFzvLbk8Rg2EG6lgBHVcAZYVhdrN8cdRX7eqwXADVKtYen
 9QPN/D5gH98QkV5l9XxEfkQSo1AX0hhniDFLYokHgqGQ5fplvKtmgJIOf34MBdgq2JEVrCGpWJ0
 g4TzGfcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Fix spelling mistakes in I2S_INTF_TYPE defines.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..efc918452e2a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -462,8 +462,8 @@ struct param_id_i2s_intf_cfg {
 } __packed;
 
 #define I2S_INTF_TYPE_PRIMARY		0
-#define I2S_INTF_TYPE_SECOINDARY	1
-#define I2S_INTF_TYPE_TERTINARY		2
+#define I2S_INTF_TYPE_SECONDARY		1
+#define I2S_INTF_TYPE_TERTIARY		2
 #define I2S_INTF_TYPE_QUATERNARY	3
 #define I2S_INTF_TYPE_QUINARY		4
 #define I2S_SD0				1
-- 
2.50.0


