Return-Path: <linux-arm-msm+bounces-69547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18630B2A199
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D309118992AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660BD27B358;
	Mon, 18 Aug 2025 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/+vaVl1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1A149E17
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519773; cv=none; b=hMoIwHl1AhKw4Nta+e3qgei6zWsHLtGciTJc2Uj5SRy8uyoaPIecbYs0jtPFnx0eHdTHWjgUcLJmyZDKQhllqD06XozeVuQ2si4gBkr78Td/iTAfRqikJ4YSJhsSe3kxuQkdDoI02fhl9X87itZwVzhjbcQPC7y9Bnv25wbKDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519773; c=relaxed/simple;
	bh=woYR0S8MjkM9ZAAwccuBmWu4hFKROEcrsh0YhEXKIQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kuNDImknNUUZ9Wt05kJD3TTPQF9A7MP9ZBlSDoiJ/YgDBj+Ed4XJcl4hZeBHA6OByA09DkFFgaq8Fo5oLM8C09iWggyzzuqQ+UKM4wcPP/Q0Mm958E+Tu4oN2ndBlEx4KHTfy/PcDhRWMgWu913aWUGcbXRAtoo9ejqCc5LNQus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/+vaVl1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8keK2026944
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CcyrurzVclubp48xK17npWwFzjopK9C7v70
	/ul9zeI4=; b=o/+vaVl1A3jnFnRMUBM7v1l1YGxAplA/ny9/JC5SKyTPr1ojNqS
	HdpN7hFlXHT74IK0nUktW8eAW4lDm+lo1Tys+bPOkyjNiGda+TY3OoobXartgrZU
	B1nQUmMzHbHBFB1a+BaOl93VM9Hf7WNCsgUjM6sSEtWNGwOC+CQ2whyC2TUve/Q6
	Q1udpfTb1po+x6myNGTGG6COQXvHqJCf2tDHAjP888TWvZxIOnQCsKD9pvjmyJdX
	GKhBpLaSDnx4Gr/io40sx640DE58tX9O4WjU3gIekyopQhmIhK+AJuwCunqtrrIT
	eiwzWT8WN6C9hL0ZH8eq8LFwOWT9IwG6a6g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh074ph5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f55836dso100018106d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519770; x=1756124570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcyrurzVclubp48xK17npWwFzjopK9C7v70/ul9zeI4=;
        b=Lj+oisy5ijqEg4SCdJgXKSyp7kVmZsG+OBrEzBj9zc1cDxBlmI0kAf/3iTRcROkirT
         x6yAFhd8dE43OavMuq7QQ3c6m1MAq6QzrcUUchVMygDMJ8U0WZn5wYIMzWsgd+b0iAc3
         Erxsl9Y/VkCJ4MAxbh+ItbCI2sDInc83pVswkDSd0V1/O+FqNVFLdzbUIQiCMBJrzoUs
         WGx7bFAltmOLKLQldbzYTu0YttgR+BHqp5+vTMSu17hKs2VnuRYIaAHu67fK7OYBU2OH
         rqhMCePqEGX9MgSn5GsH79rBaRh55EpgFxsQr5eTSi6RRKpeOJN9Hx1DGFb1azpjXwwf
         klgg==
X-Forwarded-Encrypted: i=1; AJvYcCUJTysWk2Dd42xgRJ91m2WendBbrTmT4VTi2jxTiWOsEiEz24zHJ35Q/91fP+kamDCrmWbh9eyLvNsniDfU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2KEz+yetvW6zpFz+Xc/skbROHfYqnhoy4wCwYoogxSqZJTSRB
	k+jxRJiF+k4NbET3xYEiMjKUuTDdRKFzDKVcFzIe2HIcX2/aPjbTTTyPFIOEPS59ZXK8nbPIRAu
	UfPPJ3B7gJ5iuBgJzxkpvJoCrsWCxMYBlyOxhr+3vXQU9hQc1NcU8OzivGqDnyEA27BUh
X-Gm-Gg: ASbGncuzFdixHq4eQYTl49xhLrNX4q4nMUkBkOTsOzufe1b3imGiab2PQAkDh40KnvX
	3ly3XeIIQiFLCIhwYThxu5j3yxnNxPjh3lHwHQ4ie2CklPx/0fydSAGtnihih4ub7dZ0WF1QgLe
	R5+abrnf6KAq2uKNqU5z+SfcabErmuQ3nmYNbMmzvgGs8sWrSMDWBGCp/ILEPvPMZq+wCXkfqT9
	Ca/exvfXnent1eT/bNFsvDao90VsGG9O7igj/M7BvrWfgZQNd76J68/+vXjArhBo4XwGuIbpeC2
	NjkyUtPRDhZInmSqqxSWWD5XkD6bax7ae8FNR87Rz2R2zvYsSzct/g==
X-Received: by 2002:a05:6214:c43:b0:707:6c5:55ad with SMTP id 6a1803df08f44-70ba7a9b906mr133531196d6.12.1755519769742;
        Mon, 18 Aug 2025 05:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG45A8WxLBwNz5N151tfynjvFYn+kG0tl5dncAsfpskCOCbDDrJKZ7Z/t2auL175IhLqB2fFg==
X-Received: by 2002:a05:6214:c43:b0:707:6c5:55ad with SMTP id 6a1803df08f44-70ba7a9b906mr133530826d6.12.1755519769141;
        Mon, 18 Aug 2025 05:22:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:48 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/6]  ASoC: qcom: audioreach: cleanup and calibration
Date: Mon, 18 Aug 2025 13:22:34 +0100
Message-ID: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cvgX_JdYsoSa8GVOgMs5tLEAOpejy4UO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX34eCKmI51onE
 7qEHn72WeNzSRj1vCGDlNUf9bCI+zgecyyq0IkyBLfDR4wVPZ9jEP7IKB/29T/xMnDU1rzdYQbt
 o+9tY0VM2daR4jqeNg4W4X7SipX6vZWfYrA/nkwB/YphV0KIr6EQo6GpNEv260TqBbtmtwMeMMV
 U8ZX7ay+7B8LaK1PJuT711I6qgukCw88j7pl8VrEtHcvgADY15vHUMcbG0jkI3WZSG9/ZXhM8R3
 6heAyHkGT6u4OF65iE+TSTzalAxj8Mul4OQ9WRsrDFoprKbj2L+caOqWBAziAVcidr4dQrEaKc1
 ClylaQ5CesujWotFBboa0xPRj58XkMYU7y1roXuoHZhds3uqj0s7X9TiiIxq/DHsZ7VyTy/WmJ4
 b5iTv8PI
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a31b1a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qzXCfJFTvBpdW4sr2IkA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: cvgX_JdYsoSa8GVOgMs5tLEAOpejy4UO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documention 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

Changes since v1:
	- fixed typos in I2S_INTF_TYPE
	- sorted module defines based on ids.

Srinivas Kandagatla (6):
  ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
  ASoC: qcom: audioreach: add documentation for i2s interface type
  ASoC: qcom: audioreach: add support for static calibration
  ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
  ASoC: qcom: audioreach: sort modules based on hex ids
  ASoC: qcom: audioreach: add support for SMECNS module

 include/uapi/sound/snd_ar_tokens.h | 18 +++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  | 19 +++++++-------
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 85 insertions(+), 20 deletions(-)

-- 
2.50.0


