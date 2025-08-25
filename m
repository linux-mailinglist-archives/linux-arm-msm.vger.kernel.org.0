Return-Path: <linux-arm-msm+bounces-70604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0219B33C4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9A6F1899BA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB252DE6FB;
	Mon, 25 Aug 2025 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZIikFne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3C2DCBFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116785; cv=none; b=FPHHsrFgI9eGIjcSUsPNFolcBuhlqofo+J2vgfjCkGhOISqJyAzXivVeT1MQ/17S8Gq3WIS2PVzIOcrArNkriYA/y+6sHXhr+d5ug8tF0pN5ODPK1LVmByu4twHh1czaOX7GIDNSKipbqwr497T7YGF2Mqzw8DbZm8Td+EMH+xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116785; c=relaxed/simple;
	bh=FcknmGm+9WiIX6l8pOQPi9nRhprVfJbtqLcJynflUEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFtJ2bCGZkkVm/ijr5HM4nr0I+W1F+qehn3BiwA/sKWDwCX5qnXhaR9ds7T1R+IonTNHT/9xa3gRb8Qv95Q/bS2IBV02WvgtGNPgiQF6TuW2ygAwJRyYzinM7kwcL6yAl37dS4GtRaRVv8ZdcvUFUl5Tx9VfqXpOivn6w3LD/fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZIikFne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8PUkv024070
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=70Cd69PzEsB
	YLosF81sclPZtndOuxMvCiDYzgDLZxnw=; b=WZIikFneb69cFXmAqt1KNINOjUk
	koB1wjgz6xzbJxl65tMfytRWpG5pZmD5T5sDNHijhRYrgN2Q+GOwUr8aeFCP1M4X
	u1qpHRhgbarz26xIdRPn/vg7GCNm6AbW3/QQpnDemXZI5ynZdHG7KDun4X3J/jRG
	LAHYni0BLmoaj+BF7XZGWp9zNjRIl6lueLyrBqucpLWfTFvvC4+aH4vLPSgzsN12
	IQpVWjDHZqkYaNXccZRamFfwgExTb994y4sg7Vcahq7UBr0d68sPRL3uXUN9QOSt
	fH58gnSQ5LVUtrSkh0B00hd0xRndxEJb94ZbH9bru1J18Xn5wwMTNhqb1ZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc4m1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:13:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109bccebaso124568351cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116782; x=1756721582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70Cd69PzEsBYLosF81sclPZtndOuxMvCiDYzgDLZxnw=;
        b=OIF7wiMMifRKoixGNTnkLuk0jPQnCzg3IPh2BiqQCLESiL9YgCzCkC+EPl/WrZnvQL
         4w5nVs1Z+hXEqmH2pAfqsmCNeY0Y0RFiB4M+1J10wVLswmTaLI8T6sLvmD6eCiZIBnRU
         roOxu8OmqkhE+uBXXbsADeorfglbqM3Uttzlllfu8KYFeJTuYkdOmgqExavy+Ekm0okQ
         9krAAZ4+mLx+uvX2gchWqmfR32jOg79ClMK6ll++/knvQ8TEyR2slOu3VAK4rbR0pkZB
         IXxsNnQEAAQrTIz+aAdOXHH8xFiUGUWRjZUecL4Fl1YLjv3umidyRCaGb8UsXbKsJk4R
         Fw1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqQFGSf1Yy/Qd6UPjUxlhmmWoOqylpa2jf0oCc+BbPttotNsVkZ210x0YjW7UmnDYXrhMr0SV8smzfXq9T@vger.kernel.org
X-Gm-Message-State: AOJu0YwIDJNiJayl3pIRJJWGjmFKn0BAg2q+Kpwv4f1vt+bVuOWrFH/4
	on2hMTF8n8m5FADO4YhXizPoftZHOhiDjqAkVYlq2W/wPKkqge/na8oJbQsiQQtdrSv5GmNmXLo
	kV0xfrvdUSo8z+fZZPcLLDWVEkv4AxX8O3xAKfNmv1K4kbtIDIgCJhwTFPtZ5NzXJIQ0L
X-Gm-Gg: ASbGncvZAV4LLZoFDu7aDZ3w2gbr++PVv4/2UgadNUir0h8uFp6v+GPVzVJu+GZYkbr
	fYn9rIJj7FDlIciuZsleHBQbek9J10xTgO/6Bi8tq6386r4JNgS8z9Ees59YeAui3jBzaPB/FVO
	4eHQL9povq7eAsQTMZQyWoIYbMh66TlSIE03f1t8Q5jT4vug3ON6yPBJC/A5Bjw7YwW0XftrZOh
	bMCHI4TwuBHrPgUq35rKV7NvXxub5SYsapDqVmkF137PFlQwJ/mn37Po+NeNyVNNv+KwqTe7J4v
	Hi2X1gAl4i3hUBQEihGtx2LqN1DTiLPeXPGwwpXkB5Bh+Z/X0dEUDg==
X-Received: by 2002:a05:622a:4c7:b0:4b0:61fa:19b4 with SMTP id d75a77b69052e-4b2aaaf9fd3mr124162211cf.46.1756116781744;
        Mon, 25 Aug 2025 03:13:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYQRWrfm0H/XKlro+Vf5EWtN7Tv7phUWtVwKFsMpl7Jna8Co3ls3l7ua2pKZf+Phx1OGRlsw==
X-Received: by 2002:a05:622a:4c7:b0:4b0:61fa:19b4 with SMTP id d75a77b69052e-4b2aaaf9fd3mr124161981cf.46.1756116781115;
        Mon, 25 Aug 2025 03:13:01 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6359b8d6sm5798645e9.4.2025.08.25.03.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:12:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] ASoC: qcom: audioreach: convert to cpu endainess type before accessing
Date: Mon, 25 Aug 2025 11:12:47 +0100
Message-ID: <20250825101247.152619-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX8SS/eL7OvjNf
 9bLVhzEF1hTDvgLmkEJLNsB9azW97u2C5ZBOxCTUH0tKUOLxAt1ApqZ/aOdTrntF1l2OFlSq9NE
 TUj6SFjhKf8QiUXvS6Yjs2lzXY4BFfNzkfpNhNJnqSNDGXbmoxc6oCPZXBMdqHMvdhnsp8y2uSi
 QMF1CzRwz7r/k37FTihcbL4aTRFXOFhYxnZ0ZxyJuVq3KiTv5XSRGXNyrQJeepidkkoQDnkQzw3
 WKk6Dtv6cg1PeYHvvBTzBhnfGNvLjsKASl3b04EfAJ5bX2Q3loGkHZbB7KDDYOp3D0t8I/H3UrO
 lo4my9C7kwkMW4vhMYv54Tim9j/B6VhDR9NKdeBaVPjfzPxvAmd/8J318JZJBtIYvIsfP7woHbz
 N89OL39p
X-Proofpoint-ORIG-GUID: X-PedsUERj63G5w2pxPUBqUKVICv5V_0
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac372e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=OR_sDe2PA-1rWwznPDAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: X-PedsUERj63G5w2pxPUBqUKVICv5V_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

Looks like some of the members of module config are accessed directly
without converting their endainess to cpu type.

Fix this by using le32_to_cpu() where required.

Fixes: da9881d00153 ("ASoC: qcom: audioreach: add support for SMECNS module")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508230830.Rkp7HHbG-lkp@intel.com
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f4c53e84b4dc..bbfd51db8797 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -815,7 +815,7 @@ static int audioreach_set_module_config(struct q6apm_graph *graph,
 					struct audioreach_module *module,
 					struct audioreach_module_config *cfg)
 {
-	int payload_size = module->data->size;
+	int payload_size = le32_to_cpu(module->data->size);
 	struct gpr_pkt *pkt;
 	int rc;
 	void *p;
-- 
2.50.0


