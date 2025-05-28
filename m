Return-Path: <linux-arm-msm+bounces-59712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D20AC6C83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 17:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CB1616A76E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 15:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEA828853F;
	Wed, 28 May 2025 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdoO4htN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48B928750B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444874; cv=none; b=pW+xvUjIEGWDHnseTSqQEXpcV7w45PDMPBW7BXn9HWxrr01dtH9R9pzIq4RzygnYsYyYqzQCmNS4QOxP83hcH6WwARiSMaO4I6SVrPe4IG091a4PYimdgMW/ZGCM180iwMc4J49EkxLxOZREwQfgjD8ML4p6wdTknlQJ73tMigo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444874; c=relaxed/simple;
	bh=rwxIBSU4wpJK4Rss2lAtcFVb6oUwF93lFV0DEUIIzEo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jPlHtPd63i1wcn96gDRBxvIv6kEycS6Qf978d5pI3Vt00l1ljNfA7dxrMaM1Fj4lOH4lTBg26hhy98updDnZD0BJqqaEDVOmcSvymU6pq1btsrOKdB11je6sWLlgcD9B7wbvc2yc+o+sxrR9vXaxG6TEGD//5MXeZy+bur7DPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdoO4htN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9P11D013744
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TqvCyLn/KtAm6zKua0D07MhryvAsfRaF1xH
	groEq9u4=; b=EdoO4htNLpdp60f+0yDBQajbK9FnSRPeZxZpRBG+GZXCzu3ThcN
	3IFgCE6S1UZl4PNfIh2o/tGnEKlNBhmJt2s/nMWhXLCi5xXLPpuvnicrTpda5wRD
	f2DXh/IFA0YFhuJyOC/mqzBeuMGv3yEAahEFXi8Bwfw9MOW49bmMywQo3BZMG0/V
	3iE+s/9UD6Pqk5SaetiBoIbItDyE4rPqLL33ob+uSMHseEN1TJ2Lt5W4Q3i9Wh7U
	6gmpP/DO3Kv0+VVceA2iqV+SK2g7MeD5CuA+7P7qCdK3EZ/L5/Yxs8724P+TBk+U
	udLKEmrLTEK6jUhhLsdzrQe/CkFMxx5/hpQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691d4y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:07:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3776507b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 08:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444871; x=1749049671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqvCyLn/KtAm6zKua0D07MhryvAsfRaF1xHgroEq9u4=;
        b=AJk/Vjw0426cgsS+wU9FHGSXRBCwGp3hoioU2hCebkwajr7qFzKwSZeAaCdGymYJIs
         BNplNFNoSMEGQMpC6KDr6ro4Y+k7vbOxFPuPEfQC2DlRSeA6brIRZMzTSI2FpGiiQb/L
         N2sSm1GQpPyNCuR6HoYBW4xZFQfHI2HHcGSfmR3Pj0ZT19/TkTqMxI3UK/Ao+yO+aSUn
         IeJWOVTUzo8TUliNK4syDyyDhcCruLCIqc/hWsyevPWiAjxoU2YZmXTKUIGlRj4o9Y2G
         ujEIM7JT2pMKiQNreY9xm9JbOxvyaAJAT8pVK2V7PjkfWPKx0vmIvOcEU8eSZGngE0bd
         Korg==
X-Forwarded-Encrypted: i=1; AJvYcCU+F516YZNJACcsl/Bkvd7s9+RIxuo7btH92qyWmorCyrBZ9TKcFuegQ3BMcRg2HK++oyPLzPP+5EnaH6YA@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZrYQjRsLHgblw+bfccMT7EJZDRFO4aLOX/E9+RpXDhTDP4b2
	Auvik6uSLrxLLBksmxgsK7w7beYOfQiujW4ZKs4qXoDjukD9NIUVnGwh5FqQ4EfktVdmh83cdYi
	oGb2+fJ+aWuh68cR00IzdTVzcgxf1tEhvAx39wccSagQ8c5pl+cq5h+Saz4jO0pS7ICRx
X-Gm-Gg: ASbGncuFos5jPisGWiOBuVMLlPWO5/nH+1YosCyEP8bvSoNsIpCQxOjTfFWtOTRr5HB
	KQa6BhiroCwB8Ji2PSzxYG6tHWWKrmdsX39p1H1cddnMNMBDP5JqV3prlK3h/u5ekqPlS4nmPqh
	mBAr8IlUCj+/7MsJSDzZ2XwonyyTjRKjj3J/2xWV6+BaQuGMG1+azGZg22ooxoD5Up6MaHCc2/M
	qLc9j1DZiGrbLQF2gMDowMG+jm7eYmUsazznWlPupBHtELXE4HJEIVfnIBK74NyYdMa5ggchKKj
	8e6M3pMuBNsTTkSI1hsRKkniGpqWF/Fie3pdMCUrFiiZIn5/
X-Received: by 2002:a05:6a00:3d15:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-745fe083538mr29011115b3a.18.1748444871085;
        Wed, 28 May 2025 08:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd3GjaWRf2ZUrRS+emGlm7BSCdg5uZ2Cw2RIKxyTINEtl0qgcmEHjC5BF9Immjzf3MZcpg4w==
X-Received: by 2002:a05:6a00:3d15:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-745fe083538mr29011057b3a.18.1748444870643;
        Wed, 28 May 2025 08:07:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e340fbb8sm1373211b3a.106.2025.05.28.08.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:07:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/1] ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links 
Date: Wed, 28 May 2025 20:37:15 +0530
Message-Id: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=683726c8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=TweMsTatiWGVkviqWuEA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ThAr8Hyk5zG8poWdhwxAcEag2xMjtTK-
X-Proofpoint-ORIG-GUID: ThAr8Hyk5zG8poWdhwxAcEag2xMjtTK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMCBTYWx0ZWRfX64+1drZJZ592
 Z8Q2jFLkND/hLIN0v9aGEV/ylAnHRH61S6O3MErBjDUz2dwtqvLIOT2SCWhyD67/BMNAhxSYLGO
 CZ/btPniLlJS7HalzPz5J3dPlRxKfU8In4yW/to+AkoengMVfHusnak1zAtNU5ppEDx0DEbUqy0
 h5s3YnjL1vr6bz/YipCxl+mYknsejBc8dcsmqOqMemgntH9VsaVRHqcDA6017QlyoQvLThG2F2T
 Lp0XzuwG597AzgyLEVquMHhmj4aC+J0HHWP0vULCAJNtpduzQQtP7YdCdNZ/R+zUnfb9A3vt+CL
 bugC/513wL7xLnLaYuQMj1hSXRgtLDrHwnJYVZyEHC3Jfk32iDQLI6bvRD223QqTnxWO8QDCGKA
 vtTfGK9tZlY4RAPOSvAFypVYKg773PL3EqtljmlEI83KBKdfwYiYCYPw1zX6CFSWjXCqfC8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=733 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280130

In the existing implementation, the link->ops assignment is
conditioned on link->no_pcm being set, which generally happens
when a platform entry is present. However, in scenarios where
there is no platform but multiple codecs in the DAI link,
backend operations (link->ops) must still be assigned to ensure
correct codec settings.

Mohammad Rafi Shaik (1):
  ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links

 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
-- 
2.34.1


