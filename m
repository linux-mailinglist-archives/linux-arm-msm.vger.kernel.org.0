Return-Path: <linux-arm-msm+bounces-69713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC39B2BE57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59D577AD4C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FB131CA65;
	Tue, 19 Aug 2025 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAV5rASm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAE237A4F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597724; cv=none; b=bfnZP+mljYVMN+kSMhRWZqDO9wtLKr9gKBPawBg500aAflEovQqlRJmsmoeHMSiZq89Wzt/KsTBqa86Hyj29ayOXbdj227gx3kJ8KneokJqwd0LIw+QNWSyZH+WRFDpYsJ0uCCukHTnsQd4HXBe22gJHTQmnSZ0di75K12MDEQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597724; c=relaxed/simple;
	bh=bvbxKw7mRhdM/DVnr+b1jvlsLinzxDw8efh+jPDtC3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WIAkTKUKR7db3+MshxfaIrtmFVHA7t8+cperdsMJe4lC6csAp5ZPgBb3ZCmIcldnIuFrTF7G72cOsMhJh5miafLT0qWv9A0roGKS1GJenNUkM3aGFGnIeHDLEYtolLc/UJr4jCN/8e+xkkVjIs7JaT0K8vBWH0XIoSyR0QFdN+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAV5rASm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90YRT026967
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L74y3L3ig80cyaRVCD+72TwKzntZEtkauDB
	W4M/MxtQ=; b=ZAV5rASmnB/LCAB9iG8Bh7GpQ77LmYSnN8YauF2/BkqIHRJvGlB
	MlnTsEmqEIIMTedTGw/EX3681OWKNUekh/WqkIBhsOqPAsh1KcSoLEK1D0jssD3P
	jEGmVoeeu8aO60XJKT+CMmFAe0XdresnqS1zvYg61leyiTiMiAqe41osc66z69CA
	jXzjcGVLDlrLEfnO/nodiW+CWnCbe9R8X4GbqPPlZjInQ6D2dbTrJXjeyPlLV15W
	Y7Bb7hvOJrw8YQEoddhctsDe7euQ6q6M1EXhrAlOLFgEUes6/y+BBoL5D63NJlbn
	X0gk7AQ0LFJq192V1YcI88bJgbcNWc/JdNA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyg3cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f5b3601so125183456d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597721; x=1756202521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L74y3L3ig80cyaRVCD+72TwKzntZEtkauDBW4M/MxtQ=;
        b=hMGmnWDFIsaNmrxVAbr3hMcI2oqINMVV5Eh4M3ZHztXB6W9OCPLu7ZH8xYHG9q59cZ
         ttUDq6tW14GLnZ5INB91bMK6Ge7OXr0dlGl2WY2MCq++611O+46jM8wJKW75eGdNWI+p
         SQHHtK1miDKvqKIuLPmK5P7IgVJGJmGShHRWdmLjY6QV4Vw9gF6sojle0Os2HhY0EzDP
         oUfwkI5f0FntzoUtKooTnluflVrH+Xv7ZXK0MZD19c5RE8G5brWSwzL4RnhEQfHWoQUs
         SECjwBTYI8RSguBWo/tgqI7xGfC2TZP/MqKmfw7Oy04fjAYRmifdXaqm33QyYx5hV+q/
         5nmA==
X-Forwarded-Encrypted: i=1; AJvYcCX9h9vky44HSLfXLIugWiwbqQEQHq5xSK5rb7VHGBJGWd69GPhgi3J1N8bsj7HTSF+ydqRGcgCKTe+j1UIf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx934F9oQ63PGtUca3T4XSlkew7NcdHrfwfKZFo9fnoMKA0K5yZ
	zoYhcdeGts7SzymWQ7SrDFig69PN6RCwCRZgFtV3yrLr5lo59WBsBvQTxHu591X6rYVLYjZLlnZ
	XXMGM3LVcIHgpsJEzYByqPXqDskFjTdZaSQMAICRJ3zTPkzlft5+p9wo2s3Hbg2iL2HSo
X-Gm-Gg: ASbGnctJMTjmhKu3+CIi00puZ5swfTN3pPCnIykJNG19n71WT8d3Reh6iKe+Fv9diOG
	K53IgggwdaZoC4l9/4gcUH7sc/98kfGWF9brUwsxc1d0cpJc+bVKqfUl9xWm108jpIkFzBL7IR+
	lxpQNWDkdpMtJXgdWA6Dod7fpHjDeQFXUWl87MnXF2XJ37gXrAvUs18/WZdu8ModmMJa1qijdah
	6pYp/ZHU2JlMQPdxlNsmmjLd/jbsWxr3TEbuuXwVmfQ/AkTriAJgtZp+IQZEa2ASR/TEXAoNF8/
	7jrVjswUAKgo+zaJ/LeGGC0W6Rvfg5LHMhyidgvBLwN1+xPXZIzFUw==
X-Received: by 2002:a05:6214:401c:b0:70d:6df4:1aef with SMTP id 6a1803df08f44-70d6df41c0cmr4504566d6.61.1755597720967;
        Tue, 19 Aug 2025 03:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0ORyYQYgG/iPv6OpOGp64k1lv0s5xEkKvvBPh/sKk6sxDMwJojqrbJJynW6bjWoANW6j14A==
X-Received: by 2002:a05:6214:401c:b0:70d:6df4:1aef with SMTP id 6a1803df08f44-70d6df41c0cmr4504136d6.61.1755597720477;
        Tue, 19 Aug 2025 03:02:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:01:59 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 0/6] ASoC: qcom: audioreach: cleanup and calibration
Date: Tue, 19 Aug 2025 11:01:45 +0100
Message-ID: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A2d3-3bPqhwNBnw6kBVGCm64PEkcPbrp
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a44b9a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=c34dopEhia2B6330QucA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: A2d3-3bPqhwNBnw6kBVGCm64PEkcPbrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfXzXxc6O8YFFIt
 ThKlinZwG4HBp2plLUfBkUFX7H+0A9VUxt8bXHHeIV2flW/Jqw6FLvpKUZAzrqqmOmiF2AqLMID
 TcAqFV78hl9l/wNODOrVTWK/vslVCFY2C/qaOutmY1oXERTJKI+uJXd7co/umUrgpveWlUl29bM
 2bsfFMzLVRIbvJCkzrr35NGkGA/E1qK9vCws/Qlgu1FSROmlwxoaf8q8ipeT6CM6h9MYiZMqVoy
 tqms758Jpnhc61qBLJ8FMVkmNBAtJbTM5tGrLC2GyCocXQF1NQJKLCp2WQrca8K3YIrWmOtAfNQ
 xKo34LK2UlV7LgW4jk/aM0rn0l2O3tL4AiGaZfdxA8xR/LA27k1SsQB+opNDZWwyLJGsIxMrztR
 tzWe/8Ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sorry to resend this series once again, as some of the patches seems
to be dropped/rejected by email client from previous send.

This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documentation 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

Changes since v3:
	- added missing linux/types.h in uapi header

Changes since v2:
	- fixed some fixup rebase mess.

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

 include/uapi/sound/snd_ar_tokens.h | 20 +++++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  | 18 ++++++-------
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 86 insertions(+), 20 deletions(-)

-- 
2.50.0


