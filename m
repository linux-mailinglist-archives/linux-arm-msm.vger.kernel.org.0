Return-Path: <linux-arm-msm+bounces-70448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE05B32154
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 19:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C914217CFDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 17:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0250A321433;
	Fri, 22 Aug 2025 17:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNTyIhAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B631CA74
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882905; cv=none; b=OYCXIFGtY2zbcfznZ7fMMwri8Jc/BlkEqIXkmXz39MGagygkzIWnZOKOJ/mccEnmDo8bPg/lP0B30s8XZfrXZUpAhDCV91ZoNKuUp7Ua+EAA6RmvY8EhtPkpJI/j4mV2OV9ao5xXlBF5KedoNaAuV7+x8/EGYVQ16udCwcDwm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882905; c=relaxed/simple;
	bh=N2Nzu38480ZY9bDOWfT3LEIg5OyITg4DXgjnMztcw44=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KiPKL7s/0yRfOw3+ZNGwY4x7jZf30p8goNeFvt5u84835PKnTG9iAFE+CfjeLdUMAuTddIMZoRzdnjq9UCk0mi2n5cjgqMe84uD48sxhoyURWuiQ4f672ijY9C2Kh0hdgBiEy63rxDm0IK079BOZvYaLlLPlroLYL0ooajfJQS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNTyIhAz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MGBWj7006819
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y1e6gV5g3kH7KN1Jrp5tcsFg+d8ORPB9zZ6
	0/NMHJ78=; b=LNTyIhAzcZfPVre0304ILSXkXOGN4F2JrDnli1AQdk/snrpQZ1Q
	pECCwsE/mU81PFc24YeJU9LlWTI2gZAj+2f4OhR1AuLsZDbw7uSs4lmwnNzbLaIL
	KYuUt13EPhZ97TdFvIvEmeaXrqYsiwMWBwKNVGwg4FuzOCQC+XggfeW96BRZMKMn
	7cZkYhQdvEaI3wfaseci/WzJ3Xl6AHjnmQ4Mfn2wskAyJ0CwPmOkssgQN2zF6EU2
	m8lsTLYLZm3GQG8Zseh9vvqzbs2Axui21IWc69LWYIPN4JOT0Y9DB5bK6Pnv0Q6V
	MiYmEM+jJLE/TLpfltDH0AQ1zsdV4p7ia3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529203q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47174c65b0so4247718a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755882902; x=1756487702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1e6gV5g3kH7KN1Jrp5tcsFg+d8ORPB9zZ60/NMHJ78=;
        b=WIRPH8kEgaMPIalOo7+52oetEfTi3ussn0jfa4ZY+tKP2R3E5ry2FAoRHKznoQQVC0
         Rw0kr8Des71C9vQvWcgUr1oh8bUrXHBkgRBhWG4U7BM2ZhKNHj8FVQArUTNLoyftcTsY
         HqS3hecWbJ1sD308jN8OUnwEl6y83bXUYSdcaNAId0Hg3e90iR2jzNYc+L74H8PihQjx
         uU6mJb3Pj4cHvt5Za8tK8n3Tgfk6CbHtRsgucnEvutqLFK5fc2W14+ZHEL/S4lndnmC9
         x537oajcZl+ajqi6b9PmPNG/EajV839CAI1zr21tKp0Ds0lld/nq8uWkzmUPTlcTDv2Y
         PGbg==
X-Forwarded-Encrypted: i=1; AJvYcCVlxay6AcnnFuX37WcUY44E38Sv5BuZjL7tIFLN7Hbc24vA77w4+FBv9Ntsjwy0HsXjP+buXUtlyk6quduq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl60DIufzLnKf6uL+5zMTKkpxPdWnD7kum0Uk9plFeDetJth3U
	EK32uizhxqsmyaJ5I9zsM82LUS9G4KaSzKuizZJADiaR0KYy1oRqVn0YlJ9c19PpugetMPg6AEn
	Fh8Gg3vjCgMm0g1I8howvoZ7PJnSM4uj+UIeuQYX0FnQBkS0QPW/jOn5N+Cu3CeSSJx3t
X-Gm-Gg: ASbGnctxgSHxzZ0K7pAu4qDVTXM5bx9hUvqlH8GwSNKokQLcvsj1QhVLqIhUZxiv0ay
	TjGCvNEvf3ra1K56G1DCl6/bcw0LDlrq242pO/16xfsPqo77SAE6NE4wXVFXmJie6oqfeNb/Fmm
	7/c3DraX7uPYyB/gor7KbvVTnVNy7fYBNEY4eoFpwNmmuaJiBsKjgBYNH4IaPEnooAiTA9lFYk+
	WKkOzo7ztnKH8XwjjdCzdh2usMLqQvX3t7RqNg6CINmKt871z936sXdP0AiTI0E327ROx8sCIvJ
	WA0qsetsJ3WbbgoukOpYn06IAIyM6zXcBXJWM+0zQmLrUrIxaASAOTfzBIhLuHfJPGUD59UG157
	e
X-Received: by 2002:a05:6a21:9994:b0:238:351a:6437 with SMTP id adf61e73a8af0-24340d1d2e0mr6022877637.43.1755882902081;
        Fri, 22 Aug 2025 10:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ2zJtVjuqIcQWtyOtIV1CzUmatZvFMwyY8CPoIo5NARmcWXDhSRRl2SCw/GI820eaq/xb4w==
X-Received: by 2002:a05:6a21:9994:b0:238:351a:6437 with SMTP id adf61e73a8af0-24340d1d2e0mr6022812637.43.1755882901649;
        Fri, 22 Aug 2025 10:15:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8afc56sm309995a12.15.2025.08.22.10.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:15:01 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] ASoC: qcom: audioreach: Fix lpaif_type and WS source configuration for I2S interface
Date: Fri, 22 Aug 2025 22:44:38 +0530
Message-Id: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a8a597 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=ZqeqJFRRshZrXyHQ3DYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: lFByqmARhDbwMTC7abJfsvHGjRzLWLXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0PZX02NvnNU7
 sBgx2RPSxpGfSwueykIORl67TJZ0D00Hcgbb62GyuhN9GAIc/HwIpVlIvyp7KNeKCRP0SR7PAVx
 BxfL+U/Mfm9d5QDxr8zE75/fR2uT65ERYcnNDCYiTcndpSvaGUXPO2Ynt84JTHee5Mu0SMUhXSf
 47aNstgc6PhjIV6upAg6pkU7NrmZQNvUuTItnSBO8ZQzVGe37sj0ROaWy7z3Zx6uZ+G0v+aZhfC
 KGEeHnOMoYnAJUlbLkicQDVCftbDRqbXikAsk007je6gM9OWuy5f5DVCVlNCWtQoR6psOj80oMC
 mnYcwccxdr81e4bYUI4yZDOMyrvZEvPq4DNKylgdioWkqRfFLBNpDZCAuv7TUzF10oxw41I4Y8Y
 alU3OhcGsOc84CSNS6ZRCs+H/a0I2g==
X-Proofpoint-ORIG-GUID: lFByqmARhDbwMTC7abJfsvHGjRzLWLXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Resolve an issue where the I2S Word Select (WS) source might
remain unset, which leading to misconfiguration. To ensure proper
I2S interface setup, a default WS source is now assigned when not
explicitly configured by the AudioReach module.

For HS MI2S interface, the DSP need proper lpaif_type and WS settings
to appropriate I2S configuration.

Mohammad Rafi Shaik (2):
  ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S
    interface
  ASoC: qcom: audioreach: Fix default WS source assignment for I2S
    interface

 sound/soc/qcom/qdsp6/audioreach.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
-- 
2.34.1


