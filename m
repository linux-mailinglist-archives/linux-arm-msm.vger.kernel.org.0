Return-Path: <linux-arm-msm+bounces-69566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA55B2A22C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEEFF6208D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B141D320387;
	Mon, 18 Aug 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4T0PKC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A49631B129
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521465; cv=none; b=rDoY0SBoRuACowfhFyjUFoVYe8HwQZKQslO30cE+NShWEgtZ508NechRGonBOSfyaET0FzHbLOWT7/yVS45Q4HMFAy2AmjOWJcbxq90LkIf7fQmsJwrDZubaHivj8Spwfae9hCgt/CUAMQhvBekuahR9yz36se0LBIJSUq8XrTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521465; c=relaxed/simple;
	bh=qwuYqZpPtHuX/2WTSLKobMX+4muge/nS9jt2JifQjdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exZTeFTV+uIEsVR5apFGBvpxugFM7KTZZydZl7pCDZPqMXl7juLATyxGnWpI2s2XEzhyGewCJgvIJOkNmzTWIP1B1spVbt50IqJ81a80h08CwJptGTR4+ZsSm8z2TYla1sMlvs8aBk+CvGs3IbY2TcTiz7RJ8bTYqDxaOapOhTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4T0PKC9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Posq015694
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQBp3mqbspP
	8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=; b=R4T0PKC97PH4iOPI0xf+XVLddqa
	zLoniuKFqhpwXRh6KGGbcqnoJ2U0GwlJa6A2353sNALQlUho8GF3nwtPqCNuN1TF
	8lZg2Fblzjj73177wGECTsX/sgFmUFmS8hapTtaTD9UCUPrGxscD9MNit3jb9xUT
	SzXjCZKRBgC3v8+Yzi5BmU/aQZdgq7333PiI6F9+jsMDEkfeTDWhX1ZffitjR1Fa
	h3crg5JsiKTCx8rKLbdvFBkfkVZSKHtD6LPp8PEisXimYUk2PRbEyzrZq3gCbBI2
	qtBtA7L34gIyWvwhjiffuMhGrHvAZRmQLk5ilBt/Xu5XTxlcWtaM/EqcpiA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagvqf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f57f950so91437166d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521461; x=1756126261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQBp3mqbspP8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=;
        b=X9A/fw3iNoN5OVM7y/L9bCVYMlHq3yjdFOZuPEg+E+8FS9Z7lRWATaWCvtMudi2sQm
         6BqLNlFdJW2iJtz6GuZfbF5oqiQfGYwCwi5SWdjTTqK03n/iw5FlMqTK41nbCdQeoWPp
         EShEkKgANYHN4gXfoenJmtxfLcGk7D47faYrEqwVC4dFD1Dq6uKxHB7LBodREf6QLGhe
         +aMNHi9lvMF5EnU5DEjGfy4nqO4614hMHcT0g8D4og+HZKG2Lfe8ErAMKTfQrEW0t53L
         5zqoqk4CHhoRAfpXbq/thVA3BbuwpX+Pw8keODoCCmdMQ7anm3327+CJk1VgyVmLHisH
         RSBw==
X-Forwarded-Encrypted: i=1; AJvYcCV3lflPfRcTeSdmQ4JDxCYgBwlNTtKl8M7C8tOVrtpsAFjezObEy9P1nmBTR08rAMh1f0Y5TdM1KZi2XLkr@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJ48+FJEhqYT+Q64Uw2ofY/BByQ1hnWUYwzC4AQvjSA4YN0T8
	iSHUdaRgwVB3AsNKF0LXu0Qn7OFGgSRgaCWrHCFO/FGAQpvRZi02TTBpDpKgAgxiwH+qIJVEPb/
	Eb3LF9FQEa2mDv4j/on9cXKLr1BmQB0T/hXNMrGmvwaS+eu9Aoh7HlWRw/1L7zDVDbpYAcJ6Faj
	Tn
X-Gm-Gg: ASbGnct71cEMg9K6gv09kV8T5rAJCz1qv0c6LIRAJB9zpCYk9saKJ820TX4xIf4gr6M
	xWbNEzLeW+uioHDn84KsaqSXMxUmM9PqCidWHcimURUr8No06M4/uhJgDhhGF2ygUf7B9fzNxXi
	LeAWENK+VFyPFgru0dAeQIFGeC4M4e6y/ha9x4N7T1kebqF3F2pxtKUPjIIvh0ubFK/wdtw7Kj1
	Xtj+O1C7am9JWoaD+bFSadUC4cnXkeVIGE58Zyy4f0/UtNTQ1ItTFkP/qbXKc2G2IQYon7s7Xl7
	bL2hQtvSwMH56m182mnN1WmG6k7gyn+oqMsn6aPLRPHIhLstbg1n0Q==
X-Received: by 2002:a05:6214:21e2:b0:707:5f39:7808 with SMTP id 6a1803df08f44-70ba7c72965mr160275736d6.36.1755521460432;
        Mon, 18 Aug 2025 05:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmINqOZa9cT2dkO8FkYzE5SIW/vFiqJlspoaNnd9of4SYsEEeDeM5pV9K6+JyP6AydBc8euA==
X-Received: by 2002:a05:6214:21e2:b0:707:5f39:7808 with SMTP id 6a1803df08f44-70ba7c72965mr160274886d6.36.1755521459128;
        Mon, 18 Aug 2025 05:50:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:50:58 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Mon, 18 Aug 2025 13:50:51 +0100
Message-ID: <20250818125055.1226708-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a321b5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FY2npp4C09wRtmNKfY8A:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KMdgZLEQyiW7HYmo5CtWedIitJsNUMc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfXzHuzexk2GeYg
 zvC/wpFh461t+N/2GaZq2MyL6OiITECaW1wJgOTlwAVuyNTwQBRpq9Zh2oWA9GHnpVAdN03hwk6
 bVslS9QfTXAsg4yzhI+KBN+CcDlDGN6M8RjDTEI08YT5tX6ToguQuGVvY3OPRf+SFEWdUuI5E05
 i0u48KX20FcSA3NeTslAP+ezQU+yiu1dWei58kBaapYgEeY2p3v25v9R6e8npwnuaYlXBdobFGp
 kZL0Xa29BXj+9v8sHdby1VeRyz7Ve4lS3Y+c4U0FaPz/YoKtlL3MZFn39ilpdQjtb46rY+vtDNK
 AL1LblZqpiQ5hma3JAS15MP/IqohRTsiQUCQUUXUPS9otpXzigiwQeYhjKLfNrssfH9lIw0jbhX
 M6iNwPTD
X-Proofpoint-GUID: KMdgZLEQyiW7HYmo5CtWedIitJsNUMc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add documentation of possible values for I2S interface types,
currently this is only documented for DMA module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index bc0b1bede00c..92cf72a6fdd4 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -118,6 +118,12 @@ enum ar_event_types {
  *						LPAIF_WSA = 2,
  *						LPAIF_VA = 3,
  *						LPAIF_AXI = 4
+ * Possible values for MI2S
+ *						I2S_INTF_TYPE_PRIMARY = 0,
+ *						I2S_INTF_TYPE_SECONDARY = 1,
+ *						I2S_INTF_TYPE_TERTIARY = 2,
+ *						I2S_INTF_TYPE_QUATERNARY = 3,
+ *						I2S_INTF_TYPE_QUINARY = 4,
  *
  * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
  *						PCM_INTERLEAVED = 1,
-- 
2.50.0


