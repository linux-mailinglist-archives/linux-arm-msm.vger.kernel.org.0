Return-Path: <linux-arm-msm+bounces-69550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033BB2A19C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5DB01776EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A938D320CD2;
	Mon, 18 Aug 2025 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dp1ivFds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A5C31CA72
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519777; cv=none; b=RxpeBfH2QB8rcqmjowqsO5kLdwL/v6FtyJ67L9W6voJk/mK/T5tpXRF/4dRZcjEXxlEos8wU4NEgnbAx4qlTkJvOZZNvKioEiTRJj29B5a0XMcO8rfQUf8RyfTT6iHaWUHfoA3ib9zseN4CV8G6/oHFTNRrUoTwUauTlTNrfKDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519777; c=relaxed/simple;
	bh=1QJy5HXp8RqtbvfH9QjSa54p4CKY+vOGD8v8UxtU1oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/O/+SglZNWukX9e7XojUUYd4Zi5nt4GpW4wIaJWXAF1BsBF8oUMRIXSvlSwnuuEMGALbgn7UEeQB/BiwuU5ZUsRu7C6tGslhZ4uBfpbV95q///6vkLDges4aaLWuglFN6igC2uq0iHuuBs1pwBDZ8u76brlAc7qJpwiLYtjWos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dp1ivFds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I804GO010679
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HacHHhvAXRy
	jcyFHFFz7ZOUdKUy5an4FMJmyZykFyXY=; b=Dp1ivFdsODGuK33sbocSiOd/XTU
	VfdsOvOYNu8PXzANreC+N9dRKOkSlFkaihA5loHby8ykcrqxFlaPjTgbLp7stivc
	SwWRJ5HjflMThB8lkWcvqr7rnOOPl1ywZHGLDHDHsPWTChYwg6IARcaNN1p3/dF0
	REc5lDwfAuKQKaC9dKukmzS7WvabvnzY3n4Hmtcgm3SWQjvU3mMX2lX3tifpxiw0
	quGCH77UwDgdHMjItaGkza+uZym1MRdHlIR/Iyaze8IqHh665FrcfKbbEMGNPtyB
	dWD29Y8h6i73klupArg8StEEvlNmQAqYbRamirrbcKHbKq+slAyKw3tyngQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagvn5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8704c5867so1741207385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519774; x=1756124574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HacHHhvAXRyjcyFHFFz7ZOUdKUy5an4FMJmyZykFyXY=;
        b=Q25dpQdd9bNkpaJ60YeRdWlhO9O30PTfIucCWXsjjIcL5g+G9C6nAu/mduerX1t4Y8
         XQThpg3INUBfyFEr07EIQ95dTEBSrNvRZ8hCwnxtp4xWbJ3ivfUr0cpJaYoGcKwhwO93
         wP7dDCcrtporx9cmrDjk9OTM84t0YRIAdKbX2R5Q0LRySiKvlGNmRFABTL6oxPQqwO9Y
         iAwD6m7+sMlkUpx4g0HztKbiB1FtH8QXbR/uNYZES91UZDWecvwoTFD02IKbj9rNqKdb
         xmjpHZ7/FncXpZqK20g4B5Ygp/C72QTApDRxLevtpTyocuXnb/21gGHrJJacCQpnVk8B
         TDRA==
X-Forwarded-Encrypted: i=1; AJvYcCUMt9oopB99qhZc+B452zKHUvZlc2s/Aavzmbxynb4da9vIz96WN8F6rDE0hJuHtFM2PvNjfezLAltLGMUO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37Bf8C6n3XuDus32e7GW+ZZ7wAJkDRLfzCq3/ZCr3Xdoyd/ik
	DLsiPdzVimwLnkRlUm7gH6fZJ26978eiMUYZKwyNs/7u4KhehbvK9LBrg/ZyfejQVdUi0x8gTxJ
	/J02S0V/uEx4Asvcof9btW6/dTuq2t8qlDz80dxfvI4RocJaMbTHlfdNJG0PtLHiAzH6o
X-Gm-Gg: ASbGncs3xOhpqcBrLJu8A7qeKEzJ+cL5lh6GBbCEr989V75RmzBYkJHC81TEz0Tmy6K
	N669qJCiWhbfpd1fAOhMVOUUP9RnY5ndBY/lI2wWGEVllTHlc56XWPJKXsDYW8Dyp/41rBxAgiR
	87V0q9yX5R/a39kWrNDVnZYs1sUwd5pY3hhr2qvO7Y2lD696shJcLRNuMdhWgOjydib0ntwkK3G
	y05e0K2pl92gV9DuVmfF/MMlh/ZDjDnDQ/mXUqD5NIQC94wjAyN4JGM2h5uAkka68dr4xTj5wOn
	opWJVr0aj0UKBomaUFwhQp6zLw4/VtL5oQgH0HQqZ60YFktGQCdYXA==
X-Received: by 2002:a05:6214:29e9:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70bb0589299mr110356146d6.3.1755519773988;
        Mon, 18 Aug 2025 05:22:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCkyZbh90HaFr43NwnI2Xy8gRlPpwFreREm5ORfx3M9PZ9NBRHduIuQl2W2+h3ZKXM+Gd7qQ==
X-Received: by 2002:a05:6214:29e9:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70bb0589299mr110355616d6.3.1755519773342;
        Mon, 18 Aug 2025 05:22:53 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:52 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
Date: Mon, 18 Aug 2025 13:22:38 +0100
Message-ID: <20250818122240.1223535-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a31b1e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NygpE-9J13evsolF8bcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 68ykK4NWzt3sRNUnkAE61Guw4BcuUWf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX0ORE3ISkWhJv
 g+bkKkuoz6nlAZuAd7rv/JSsI+dDJC30HJNwFacSAuJicRj6dRkDCrL14/BpHqiR/HGPsU0yElj
 TZr9munEn92yXpUWs40TkFnigEQVQRuNp6rYDnC1w2CHul2G4dRDO5cB+tAt6TV4VBbCfMNRbXe
 4gJoTS/FdxArlfQERtPo5gKJICTmnDPNF3tNPisRGGfuUgRlrop+FMnub/iAyo5gtbMlD/+OtD3
 oRdDUDNYi6u8s062lkYDtoKnxMA5q/Fe5M7pGSd3Hh6seNi8kQMX4hWF6i9JNrU1nAbxH1/flRF
 6IVDSJblmwm0UmEI0YHzBLEIeYY7+Wi5QQgTYjj3I0ysq4rtKSoLVO7QufdnkfzW97Poi8U+uyE
 HHGZKGaY
X-Proofpoint-GUID: 68ykK4NWzt3sRNUnkAE61Guw4BcuUWf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Fix spelling mistakes in I2S_INTF_TYPE defines.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..512886042224 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -27,6 +27,7 @@ struct q6apm_graph;
 #define MODULE_ID_DATA_LOGGING		0x0700101A
 #define MODULE_ID_AAC_DEC		0x0700101F
 #define MODULE_ID_FLAC_DEC		0x0700102F
+#define MODULE_ID_SMECNS_V2		0x07001031
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
@@ -462,8 +463,8 @@ struct param_id_i2s_intf_cfg {
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


