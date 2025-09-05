Return-Path: <linux-arm-msm+bounces-72315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6C5B45BE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 609BB7C0662
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD8B31B80E;
	Fri,  5 Sep 2025 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ha3gWJbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956431B802
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084733; cv=none; b=KDZykIAsHKDCZfz3KZv2FhqIKvBEuAHWtVM1KAaWyUvyRdiUTK+9fIKTNxIc1lLpZLvyblz/pwhuy9jVTkDnc3bWHpTVmR6q7ClPxEUY4JsaI/WpXlc+LiYIIwk26DhUEk+9diB4WoKMHQPIeYHQD2pPvanxxl7PkKgB9sN4I4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084733; c=relaxed/simple;
	bh=WC0wC8Q7sdcnE55UR77nZ9YhFbz8kmathVHMq557/fQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lUgymURlzija/tXsEtNZH/H++QC3Ex43K9WuLPKKwn5kLtlZJGtOXKPnY0eeKw2h0CliqW9E4l6cyT1XlFPl9JNGw5XcYLXLE6fKwrZTGJhm6Td7KFW0mXVeQwOHWuUFXYSb4BVpcmssVpQKa4D61H/H/0sN+mhuBemPv2TD3EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ha3gWJbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58570ntw031940
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dfLc5hoIAeVv0LRPfL5wwCPsZeYeR0ugf52
	QpVAesm8=; b=ha3gWJbSz1VNvSmS/04o8DaHtDA28rx+/tSSudxsp9MH14BCbB+
	BExvOxFlV3f5VmpVQ68OacA0KytJzP93Q5C9emaM0DcS3fN/XCBjhz5nhg5fjrK9
	jU3+NYm1mmycDFp35Sa6BS8GYW9PweW4khuRziyvg4IWQjw6orNKAoxFYtm24SGg
	6y3xGixxnKdtPT8vtpOd9T5JDd6waobe9FZuX/70TV98V2Tf5VKcXqWUqv5/E8Cc
	UNcKcMLkhmPlRFsGrWPezk9ukMvMWPSZo+Hv7Wv/i/Ht65HpqzQaQ37ZSnBg2lGO
	5i930w1VUqPPHgFJs+exPp2wytNMnA4IZHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0bjpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:05:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581953b8so26174515ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084729; x=1757689529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfLc5hoIAeVv0LRPfL5wwCPsZeYeR0ugf52QpVAesm8=;
        b=Yx+EUaOmiO82yxnKTDY4XZ8LJ9aAJ055mWCh4sMu70rNccoKqx/v1Ofn4HteetSMCM
         csfQYaMtX5+uYqB3VIgrWw2Gir6Y14MMaTfiEjrl9kAuIHwoNcS3mx8raFvkzyz/K8vf
         9B9fkCRTvlXofAv/PqxM0Jy0nIQOZsZtu9NueaoPbrZdyO4b3ohFBwokVsUyndTRolG3
         wzQ8kiFU7GYYNAqRllXIfgB6Rxe85Gf1lAtmk4Yoy/t6shw02UxI5MP0sYkGNUBFIPBw
         JMCpu0Sf4Scr2odE0wS0shet+9ZMQRhFPVuPKOuX53d8uPAzPkUmt4UzllqUfTa399tb
         gCig==
X-Forwarded-Encrypted: i=1; AJvYcCV2syrWUVODuekxHSOjhUaalTi+QypdBbXv2Gb37fnyK836Pw78S65uiAxljgFjARS6M5aPhVZ3htQniHNM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn1plqLS5sKE1MEZM/rBPXZsPkF/mkFGyHUMY7C1lDL2dQXCjw
	HFdbZJ55lWFgmTfUsaxiWuE4r+gqAhlOX2/9SQZZEt0dwRSw2KQmAbcRXjWytnzEq2Yei4x/R7o
	APwzjAPORN1It66fzpuCYw5KYTxfUdi9oZE7GenZlk8mSy1xOkfqgjB0RpJqtiOqZR3z5
X-Gm-Gg: ASbGnctRYEgmrNsy3TErIGfyo+JZE6WGa41Yz+w9S2wgZudylUc5f+kaUfAF22Pm6H/
	ZqU3KrylJPr10b0Yhmc2t11mmAxrDBaCsglTfHmb+8wwwmRxPE9qqTM0QFaulAm8gfSJeGmRLyO
	VTGhcp6/BT6k+FV1y8bNTCpX9ula2NJ9CZCqzPb76EhrHH34e4m8oCp21fm5z5AEachxCCIabfC
	MvUNA74xupjPq/QZSsc2SVeOLzNLwlsO8aI2+ko4GGhbwT6PJ3dnpdkD7VUs28Xnxv7333P7rdm
	ntHXyUSroVUF80nnwSkgDWk2dvcL2GnXkhCrcsCqfz1uk+iqw3vyl4wWpvQB/+8c6q2rZr1xEb7
	o
X-Received: by 2002:a17:902:c949:b0:246:edc9:3a80 with SMTP id d9443c01a7336-249448dce41mr332440645ad.5.1757084728431;
        Fri, 05 Sep 2025 08:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEur4fImbfHnLpDXHW5l9lSq6IXnaOlfb2z9L5MzDU+HmkU7aw7yrqcmOlzzf3CXuFiwl+f9Q==
X-Received: by 2002:a17:902:c949:b0:246:edc9:3a80 with SMTP id d9443c01a7336-249448dce41mr332439615ad.5.1757084727663;
        Fri, 05 Sep 2025 08:05:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm28882840a91.26.2025.09.05.08.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:05:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 0/3] ASoC: qcom: Fix lpaif_type and DAI configuration for I2S interface
Date: Fri,  5 Sep 2025 20:34:42 +0530
Message-Id: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QBTbhyfeQIXSKHXyn6j3o2aHRGi1fiev
X-Proofpoint-ORIG-GUID: QBTbhyfeQIXSKHXyn6j3o2aHRGi1fiev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX2Hte06hB3KeF
 M4BWQCc+z9mFPuzvqqu0vv7gUWo8quOIT4rFIUKoCnHl7296lDnbXeYPxi73ushepbso+NMHPn4
 O9N8RRBA/Miq6INb89U0muDtIYm1Wo+g5CZjkoPUmmaq4RrqG0TCojEW9jwI8niU7vfC5aHHV6s
 L9U2BcnI3MHr69SFrxK+Y0xyCJaWJ2RQ+p7NmvX4sF1Qxrt0SPsI+Kte5T98oKH36nPOnjRP7l3
 A09n+vyAFS4QZJvxegWsSjWCpQhVo0MvmZeAuKumzE0N3fxNbYnzvyXhsysIRAeV6XHQsX38cpV
 5mhRgyaVEDB2L+gs+OEgd2EUigJijjmsMgTRX1axU/gfi9WnAPNh6O7AuKQuPaG6NAE7973T2xj
 crGaiufo
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bafc3a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface and also Fix the
CPU DAI format misconfiguration encountered during I2S
stream setup. Tested on Lemans evk platform.

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
  ASoC: qcom: sc8280xp: Fix DAI format setting for MI2S interfaces

 sound/soc/qcom/qdsp6/audioreach.c       | 1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 sound/soc/qcom/sc8280xp.c               | 4 ++++
 3 files changed, 6 insertions(+)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1


