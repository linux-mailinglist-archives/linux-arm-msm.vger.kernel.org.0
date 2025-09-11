Return-Path: <linux-arm-msm+bounces-73066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469BB5290F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C01A1C80546
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 06:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CC526F2AA;
	Thu, 11 Sep 2025 06:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRCHhpB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E8226E70D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757572597; cv=none; b=UXKw+Q56XmnI02GkfveldL75uZEKs4XnSHa9lBQBiwWt3gCKemryl0TlH33oQnQPzm6tneJVLvBjyMZHkXmxyLhEiHgbyr8zkwqCr6JlwL6HVqz3DfdFq0f76bfPfA3+BitNDKX36rRRfcAK/hlsV0zrCYXjAbVvOcnTMpeX++w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757572597; c=relaxed/simple;
	bh=3WQparlDQcdEdl7ZPJ262lJlWoZyN0BU1wz+mBY/Ok8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BX3AujQSdidkbAcO7/hqeIEdXsKHWw+strSqfKJkc4v8pq/FnUq1AlE5zIGudkvZObMsj3lzOO1hO1k5gX0t3OeUxOF6+sodCebpLA5aiUq0zWYFUjbrSshlRtqs+aMvxV/qkwGRSAQO8ZzOCWnn5et079vehawyF4Mx3AejZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRCHhpB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IVlO005414
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BUtZ+xnLuqe8A3qnoyRxyt10mylwZS9Sqaj
	PHtwNVZ8=; b=cRCHhpB5SIDHyO9d9RSv+z7iEbmbDlG1v89/gR8mgF1qIworOuh
	i4fGKTonTkTcQKj6sDqxV+sHlGsNBEuYSq7BK2eXQ+DhXNYlaOIhQN+6BrbOh+c7
	G3gXWwLW6l6+/bms2Ojy1CYx4NRX/Xt/XJocK/FJf4Bf/02mMzH3wHr5IY8KymTD
	HCnSTecTKlDdVUCm4/5f99c0mBTHH6QrAy3BrXux5eS/ujNsTJUv3zC6s2HoMG+x
	sudlQVjcQ5hgm+jCZsb7nQrYQ6HBGGinRhMwwjfChoJMtgANLcJB5DqrlnjxQluG
	I6IDCFWwEqu0oKc31DhrHgwmunc89LNyldg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2ak6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32db3d5f20aso415034a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 23:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757572592; x=1758177392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUtZ+xnLuqe8A3qnoyRxyt10mylwZS9SqajPHtwNVZ8=;
        b=TrQfmQ2NQ2/QgjjqHPamyTJD9nA/m5IlDHEbaRN6FS0g+qhJO7U/HZ3pT7CBZdQQ4U
         fZW29qJ62vZQm41qxM2aZz+MqfZzWyZJpI/eoN+Jl0AFj9rtKMMEsVU6QBXShThpiq6P
         Z9m3iwuaaRHrxL6HzIf9yYsXoW6ONpIDecohv/ZjwfOP5aRWKZMiUDqOZD6ETsnHx4oW
         PSb2FwFoBZAE3yA+te2dkbJjmR5GfC9ETsaQpHYJWP2L4tJ5FQWI01t3PqwYk8vsmYSr
         XOETEt02o4m7xDQuwJDLRHFWJaAu5nsApaxVSgPCxAOGT3Z5K0GRidzzQWtCAe60iQ7H
         EWOg==
X-Forwarded-Encrypted: i=1; AJvYcCVUJezlsU7bdDDNa8N/nHhJjYkXaWCET/cirdUjM2gBe7xWZojVfGYemfrHy2Yo4Cn3fpbmRJ8ttbIE9NzF@vger.kernel.org
X-Gm-Message-State: AOJu0YxlUvLsxztFJscJuEjvAPzm9vufhaYLfhRTVV6iyivbBc6/mZVx
	VqDD8q7nvMsUk+X9oionpgZOg58ks/OH00ZuihYzpKLIncxpuSnDkFEdiCCTiBRUF5QwQKfXaqc
	xufSTh29kEMDvFfj2/npwoPYRnmvMeUKuwifaRBz44A3Szo+zWjdSettZtakxAsgcefZt
X-Gm-Gg: ASbGncsT3ajCY0k1A+S0w1fPdKtuGxV9XE5n0wN5Aa+pOZW1CRdJgYe4raCMZhbFY/C
	bGo1pFpVnODUqR0MHbWZn8FNR4WfKpTXllh7hkwPY96s4jjTljacUUEdOHlHhL629myjr+Tsxnc
	n5IibSdHs7HAvQgYwacM4oCJC/kYSEoMbABtt/fACfMpUU/dIXd1xBTxkMVRlhXBHZjjRBDEt0X
	FtPIpIuSlk9J7l+hjsz+r688jsnZzt+7nzQIdZDDVc4pPnxa47qyxt+qMdz0KNyjdTx8MgR/FpU
	EJNOy8gGbkQCjXOXJaxNZ6Wn0rAFg3jRTqQ4iPjCIY8Ezvi6uSjgZTK6fzc8f47QPgZrk+RCNy6
	G
X-Received: by 2002:a17:903:2446:b0:25c:19b4:7ae3 with SMTP id d9443c01a7336-25c19b48233mr14261325ad.24.1757572591964;
        Wed, 10 Sep 2025 23:36:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYwp5uptw/HYP+W3XfteKDOqQGwpH9u9pH0E7b1QdcfjmApuxH+jbDqCz/Mj/ZSR2U7+AbDA==
X-Received: by 2002:a17:903:2446:b0:25c:19b4:7ae3 with SMTP id d9443c01a7336-25c19b48233mr14261115ad.24.1757572591461;
        Wed, 10 Sep 2025 23:36:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84f72fsm7739125ad.72.2025.09.10.23.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 23:36:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [RESEND PATCH v4 0/3] Fix lpaif_type and DAI configuration for I2S interface
Date: Thu, 11 Sep 2025 12:06:09 +0530
Message-Id: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c26df1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: lNN7Bw8tWdwrZTGHhBfNOwMNgyQh8M2v
X-Proofpoint-GUID: lNN7Bw8tWdwrZTGHhBfNOwMNgyQh8M2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXwPmDDgxat70s
 SX/89RE2rfDbrrlNG+nM3za+LRiiXRZMGi6DwpAbdD5yNX2p5wsH7LSe8QsdwEhu4nZ8DPvhmP6
 fU7mQPsoLzzRbByTUfbuq36VvgyIrFddDgesl2zXp0jczMWpXoMzxNra8IF20+3XKWU2xb1HUsV
 gJpMyzmA086Zxr/X7NNpykx1Rv0O7la6q81UgOiZJ+sr85qB24sjR9OJOe1OwzwfBQa7PbFToxw
 nhH2DFQdbNLBr+iD4otfOP45Nn5Tqno132VqAJfv8ULBw44CD08qtKr6D/PSsoj4zUvEjhCbWX4
 rnj5rfgrUp7furkmIzn0+DKjso0/2+91O0tO/BrtTAGp/nAt2wnGDa7g9fc1m7ssaCIrPklaKNG
 sjpk06Do
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface and also Add support
for configuring the DAI format on MI2S interfaces to allow setting
the appropriate bit clock and frame clock polarity, ensuring correct
audio data transmissionover MI2S.

changes in [v4]:
	- Updated commit message in patch v4-0003, suggested by Srinivas Kandagatla.
	- Link to V3: https://lore.kernel.org/linux-sound/20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v3]:
	- Added Cc: <stable@vger.kernel.org>, suggested by Srinivas Kandagatla.
	- Added QUINARY MI2S case in patch 3, suggested by Konrad.
	- Link to V2: https://lore.kernel.org/lkml/20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Used snd_soc_dai_set_fmt() API to set the current clock settings,
	  instead of the default WS source setting, as suggested by Srinivas Kandagatla.
	- Link to V1: https://lore.kernel.org/lkml/20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S
    interface
  ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
  ASoC: qcom: sc8280xp: Enable DAI format configuration for MI2S
    interfaces

 sound/soc/qcom/qdsp6/audioreach.c       | 1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 sound/soc/qcom/sc8280xp.c               | 4 ++++
 3 files changed, 6 insertions(+)

-- 
2.34.1


