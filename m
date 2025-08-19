Return-Path: <linux-arm-msm+bounces-69718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE220B2BE65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2111A189B076
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEC13218B7;
	Tue, 19 Aug 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je9JxUrY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4663E320CA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597730; cv=none; b=oldEZlXuF8BtlOR9vJB4g+fhVoIhT+sw0njYTnEA29iqL6X7e7gu1RwyLWykxvQWmbc/Hyxv1gRewuorS6oipIW78L73LoFrr/5JcQiqa7prB3a7YHmQbXg3PNJcqgSRIvV9Q30aixhbOmxAKUCjzvbptfXiAZ8G65xel1qswr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597730; c=relaxed/simple;
	bh=Nxi0Bidenhap9cy9yhPxUe6B3/q8TTTaqSUBpij6HY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLgP9PXXQH6A9OTZs8Bw9AsBXAKhSIinjHEnOi3c/fr0jLKBionDMU+ohdkss6lh05GT/RcxL5yTrQFqqyPyyOUzx5LcvXQASAsjKEkgIaJlCF2wTmvHCnQNXTvGhReobiAV2A3jIVSod4JaDOatjvag7bWKTTY3S+WXlBJg9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Je9JxUrY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Xtf030335
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=THJxLq0EGFK
	SHTbEou4KGPig+UVopLb+QSBxv3D1Czk=; b=Je9JxUrYO1MYQVBk/sy6o16JBAQ
	fMXurRGK2QENt/MrN5y08wPT3bp5gcomxOs8hy41vAq9Blrh5E/WmatsGMfzkaX7
	GHH+rCBnRpY63o9TKQ6OV/UVHPb6pIPgwkou1vyplyUIPUIaU0uWgxh2AsX9s7F1
	O/WdSD051Oc6timTyBH7b1rYYPT7U7WJ4RYVKqifV57SRHVf3tSKOJ8rY3ru7DFp
	uFFuecuSJn6H8iEvgWCCrsyqfL7y7KkQV8S4IsJ5bHtlxkJpLLw27YxLC8dDjJ1r
	3sGIiazntYXALoKOSo4xSQGshsMMvZmzRW5kG3vFIIha0FdXJRWz8sMaO8Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunvavc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f5b078bso53826116d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597726; x=1756202526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THJxLq0EGFKSHTbEou4KGPig+UVopLb+QSBxv3D1Czk=;
        b=DvZu6T1FsvovPxGNWVktNMle2EN/eLQoKGFzH55opKQYzjIemWdPLtpuVu+kQuzcxR
         7pZeHd4ZxiXQAaxlIlPe355kniRpMbydocEOHMGTp4YlkQ29+IzdVGpPlA+jDgNKJTc9
         Fgvqu9hmj9qHxzeM3Tfwqp13j5RVH4ycm6TNDcDE1xLOi/L03RXJcnCoM+9QpUDncIUh
         NaeFK7BMbGOVDhe3CDHAYEfn4khrw3bOKPD6EvOBodn5+NChGinemPke4Fk+Xvrwo/I+
         KbkPusOMLPsGW/nbVgG1DPwuj6UhC4W+KvI7s6k2xx4XIkKrD2AX1Z5dWiaVtPtiATJh
         j7yA==
X-Forwarded-Encrypted: i=1; AJvYcCXfZSWbobwhn/dhFxHUf+V3hsb0Jwqc4Xxv12HbpnlAcTyNGbron3L9UC2cR3V34Jmcl/xGhDHk3MSk6ohk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxail+D6Rj9DOYQw4SxKYY4CW3sajDJ8kIcLtphfOiHEdBfQsJ1
	FxdMfXoobrA/hJ9B5DbK2vEU+pYOVO7vLA7zj8GZ/N6DOMq02OstkLDMX7DlJ9aFot86zB0EGbI
	ayMpHTiTY6RphAfEQqPcq1lzmsGw66cmbZg1JFeZRGEWutJul0ei2M/hSGMz/wCxpOq77
X-Gm-Gg: ASbGncvvb6+JLh4TPZRhHV24qq3Obm46oBpeW7INzibrHi5TX4r62McEG0TJFTwGqPT
	kA9W1afvweeH5J+pIn5OjILURiXLG9EXYOCrw3SvVTOeY8hkydOuHsPX9jhg+zWS5EUpgJEMrCy
	NZIUDvGPmFIPkqIHZklIV4awG5jVKyuvbS2VguqhaI4MAI5ZJdHAdZWh4EA7yCdJFYdkj0HyWoT
	4ks46chJrn2+OOtqaUcuJN8yRLjwSxx6HmuwyvwT3YU5j57mvbGaZ6UwaelEfINjiYlC9u0CR28
	a8giUJ1P7AyoueQfW++xNFhSiXTEoPmUWY0VUWPrbWaxupd93NZDQQ==
X-Received: by 2002:a05:6214:2b05:b0:707:6161:5988 with SMTP id 6a1803df08f44-70c2b5be2cemr22622326d6.7.1755597726129;
        Tue, 19 Aug 2025 03:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ANpoSUVhLH2Vcl4jJV2fZu1fKwBudjv9iiCIhqRJgJR9L03CXR7iurdsDGOqFENhFyeGtg==
X-Received: by 2002:a05:6214:2b05:b0:707:6161:5988 with SMTP id 6a1803df08f44-70c2b5be2cemr22621746d6.7.1755597725521;
        Tue, 19 Aug 2025 03:02:05 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:05 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 5/6] ASoC: qcom: audioreach: sort modules based on hex ids
Date: Tue, 19 Aug 2025 11:01:50 +0100
Message-ID: <20250819100151.1294047-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: My_cFvWuQMnE4Tzt48X0xU59f4_-RvIc
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a44b9f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8nb5IOs2KV4HrawvOq4A:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX8Hr10d9/D2Hq
 HWSTkhaSk60/kSN4JTD3HIdPvxHuOJmT77+j4HCkqQ9MZbPSw2c7+45kcfcBDYc2r0hK/ozJbL4
 7D0tzMrbyTeiC3x8OhnpPr8rzwi557Ds5y4DVORGkDRzQAxi2aRSvtu7ChZSpxG5st57BlyWI+7
 OqsuIFDrN6T43yqBBLZuXcReTnrgGwg7EXcy/VKAFmhO2SS5tqBJIn6AL+LLHNiB9H84GeIorn8
 YPnlJ6YTV57nkHhnTmnBse75CBSAVKnNBg1Zjv4x8AVAIr67OLHT6hVEE3HO1GsUJxxxrUUjjG2
 qRfVZqIxt0VdMXKLhFQ7f3madnRwaJdLXWPatmBC0SV6D4oog++n01j0P9+cCel20DPnxJgKrx9
 /UtLRMwV
X-Proofpoint-ORIG-GUID: My_cFvWuQMnE4Tzt48X0xU59f4_-RvIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sort the module defines based on its hex ids.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index efc918452e2a..e4babf9a44ff 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -18,14 +18,14 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_DEC		0x07001005
 #define MODULE_ID_PLACEHOLDER_ENCODER	0x07001008
 #define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
-#define MODULE_ID_SAL			0x07001010
-#define MODULE_ID_MFC			0x07001015
-#define MODULE_ID_CODEC_DMA_SINK	0x07001023
-#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_I2S_SINK		0x0700100A
 #define MODULE_ID_I2S_SOURCE		0x0700100B
+#define MODULE_ID_SAL			0x07001010
+#define MODULE_ID_MFC			0x07001015
 #define MODULE_ID_DATA_LOGGING		0x0700101A
 #define MODULE_ID_AAC_DEC		0x0700101F
+#define MODULE_ID_CODEC_DMA_SINK	0x07001023
+#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_FLAC_DEC		0x0700102F
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
-- 
2.50.0


