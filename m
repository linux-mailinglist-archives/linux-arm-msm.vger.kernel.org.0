Return-Path: <linux-arm-msm+bounces-69549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843FB2A19E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90244189AC5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1A331CA5E;
	Mon, 18 Aug 2025 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kx1txnnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D9E31B110
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519775; cv=none; b=R0QWgZ95rkZwNuo3ejCamgPbN3SkRllavpQPSd/Ayw2GkaFWT7ywSSef1bHzCrfD1f7+5Ix6iMA3lHy1q5GFJk8/umYA4Lmjpy7DUx9w5LW80Opbiml+0TweX6kMkJV1OC15ObzSvqPG/hZmuRTCUn/x7L23W3FlhJ+VihBavio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519775; c=relaxed/simple;
	bh=lJiXI/C5Fuyf6B55gsngV/ulvqr7iM3XDCbQuIE36GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a91bOPuQPuOdgjdw7dYR5t4o35frnqYUa4gT4Gq1pvwN/erQwUDvoI4vegzaeii6cBMt8QPk+IDuXXnjoNOdebpZKR0lFpQYfE0ewgcqr5C7F0gjsezZVAozpk7SQy5yCfcoiQ61gH/KCanOk2fvuWLb5/HFNZ18RnbOO9CZCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kx1txnnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8hKWE021396
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=18KqI4JQ1JW
	PbQpGA5es5HkuNAUrV8JMaK/zZS5RWVA=; b=kx1txnnE8UVg6qDf10/ScpJgfHm
	Sb6o5KrqK8vMq7JweYSeBujnqCgHTHuiGKOgVAxXqUC7YYm4bbP9bAAC8zV9DXQ1
	SnSXb41M8J2KL+6PjYQ1gbBB5ZkrdgOZejn+lJAWc+pum9CnpL75LWyQGPNUJtaZ
	SLmqfJkAREBkX2njPoJUkMp5C//F2awzvdwCsHmEcHr288ValDNbVXXhWyI//dGg
	oL3pjkVZgfOGjQxD82uerSS+2hb0+ey9xsEK+48PdGIMlNcpxIgiu+Fq9Hl/H7Bp
	5giq0soDgneomKdhz9vuYfyMQDq4Z1BU5K3XOXnWZce5YpC0W6eqJf6WnGA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh074ph9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a8b32a6e3so84990906d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519771; x=1756124571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18KqI4JQ1JWPbQpGA5es5HkuNAUrV8JMaK/zZS5RWVA=;
        b=R16NWLB2PMKACvYstkeMhRv42HT7Tf/XH/4OAi7RzlsJzuqqzxgbHXxk0mgdvETkrd
         rQwFZ7Q5wOjEe2MlXcoyTBh8y5IMIHe72vKhBxAJsrZR+6xWl96EZnte9p87/15Gb8QB
         gdsPoNkBOeLiLr5HdCx/cx68/ML27UJNZjoKSY+HBsUwkgsM9Yz60h8l/uNsREiArkGD
         U3rZPrVrOSsHQFf9Uv2BP/4HscIF2oIOlHnTjApjIRSJiMqY6/L5VhPzwq5r434hAkyF
         5vHkMYdy08JFCjdadn+lfiTl+/CTt2rzFNhFS8g2DAGiUlCMinxOOBCc19MDd14IxjBb
         U97A==
X-Forwarded-Encrypted: i=1; AJvYcCVAnQ5nTot8T+CwsdTfzpSMJg0Oo1+ewnWemdy3DzifgFjQkb76kTTakvK43Buc1LoTzHjjZUjVOw+6dZy1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3o4kR6/gPreu/3VNoLBUVEXomCcw+18BZpGpD6lp3Fe9a2HM8
	FSvYXS1i4XZIjdFu5gV0p1e3uRarcOHNLLs6jXLrtwubDbvgUmGerRdxfjlbhd7F1ezCp0iYNlE
	0yxWqy9z0aQyXU2wfkEFW8XX1xkp+1uk7e1l/lEJf5B5SBHc9LuZwKHampIDVnDnfk0hvVceGh9
	GW
X-Gm-Gg: ASbGnctqk2/VU6m8fNvxTTQlfyT8+J93G/yU/zZxxDoLU0BI2ikvnzUNwpiQ21BDjLg
	fp//7dUHyRqeWVntXsDeqF7XqB9j+mWvxzYvw9XfmLH3epkGVI2IYferCpTqKAqAE+Pp+yoBEPH
	UpDj4ACYBm7QceTHiiIjNr8ifPe/5skhVj532n13mye07MmR3A6Ydp1l1ajVRPKdmLq67x4V+f7
	di/RjeioS3eL/+QjGbYtpthdbUdWOWH1UmKM5vBuhIX8yApxXFZ4gKy5N2XY4ySb+0PwJTwXC9g
	jyN4i02l63LkSwi5tBCS6nJnUCINDNUTBJZOAZKn8LZWzEdGLBiktA==
X-Received: by 2002:a05:6214:c43:b0:709:e51b:2971 with SMTP id 6a1803df08f44-70ba7bfbca1mr127743526d6.26.1755519771591;
        Mon, 18 Aug 2025 05:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsRLUYmlEY9isyXBY9OO7FatP/twXOv1kdIQnNy6AnCeJmhofS9wF093UUPE6Fpivow8O03Q==
X-Received: by 2002:a05:6214:c43:b0:709:e51b:2971 with SMTP id 6a1803df08f44-70ba7bfbca1mr127743076d6.26.1755519771142;
        Mon, 18 Aug 2025 05:22:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:50 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Mon, 18 Aug 2025 13:22:36 +0100
Message-ID: <20250818122240.1223535-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: hxOkGsYB4TJPpL23kR28IRk0mgftOQdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXwiLKeIgQmcau
 GGE3VI330kF6zU34xs1TpnVe/osbZpem85k6DxvfVvTWQ/+KZVPNr4eZOBQMLzhpQqJggTx8RlB
 1AV0OXC8EJoYNX3A2X8IzEhIJxEysIL49E0DUE3V1tdydk+tpU5MtTMOqrCnqku7jtKIl7lVcZ6
 EkqaJLkoNIzB8PdMhV4gN0d+dFFdUJvVniBhsUHHREQ2oTzDCjEsLi8eNo7Z72L8IPxlW6gf+wT
 BPpu3BLSTEo89y+b25NObqIcsfXu0jcnN0GS+8qLIeBC/W+P/GmK2CAPvZbcY4F4WrZ1tQPL0Zf
 qGfqHUlrvn6zNF6vA54zzqPRmke1EnNO/NSOXmWelvX6/+gjs+BFVTAUiPBG611gR6ng+Cas9qD
 iF2N4In6
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a31b1c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FY2npp4C09wRtmNKfY8A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hxOkGsYB4TJPpL23kR28IRk0mgftOQdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add documentation of possible values for I2S interface types,
currently this is only documented for DMA module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index bc0b1bede00c..3aa5f4928a2b 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -118,6 +118,12 @@ enum ar_event_types {
  *						LPAIF_WSA = 2,
  *						LPAIF_VA = 3,
  *						LPAIF_AXI = 4
+ * Possible values for MI2S
+ *						I2S_INTF_TYPE_PRIMARY = 0,
+ *						I2S_INTF_TYPE_SECOINDARY = 1,
+ *						I2S_INTF_TYPE_TERTINARY = 2,
+ *						I2S_INTF_TYPE_QUATERNARY = 3,
+ *						I2S_INTF_TYPE_QUINARY = 4,
  *
  * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
  *						PCM_INTERLEAVED = 1,
-- 
2.50.0


