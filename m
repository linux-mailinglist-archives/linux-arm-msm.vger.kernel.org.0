Return-Path: <linux-arm-msm+bounces-68071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C60B1E1AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 07:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E3A17A5672
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 05:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF241F8725;
	Fri,  8 Aug 2025 05:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loOboYIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A595E1FBCB0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 05:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754631023; cv=none; b=GxdBL4w55iKF9g3EmtCsQhUscZy0PAY5RncQmc2LefcFuQ0GU5VJlxvbl/yIrseg5QwfjPGZNkfM2ziH1vidlJ3EBHH1eA/AW0jZSwjwu0a+onMmWoYbzid222+/OV3WrACJXk12BLra2j3U6FDHUHvPOh5ZIDK5uWB/PSkMi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754631023; c=relaxed/simple;
	bh=Jd76TxLJDO6ktnTVki7hB04b124OqwCvlvXm+sVtsuE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gcj/pu7VW35iGVPDJaKWrNZwyuQ6NaWgw7E3gCHggJi68U0aObhicKvmneKhZNI3aJ1cR0Qwy8SQ50vF/n5D30Y12cTIOC/Ns2cOOWlbHSGEf2u05qnz4pYAxMbAVmSQ4xfumxNqw7BuaL1a34i1+MNVU51C1KEU7RZy/2Q9lZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loOboYIY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5781mSaQ030293
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 05:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8Car4PvODcLhqhbydD+z1uxMFD8WOqlwfDy
	1GI1vIzo=; b=loOboYIYcNiY4EYj1NpU+mpoGcaaQntaHilmAFXH2NpeyP9lDbs
	wqcnd6ZdF14ktVtV7b6kzD/A7KgpwAuCTTVjg07fIKtUF1Mctmq73bF98HG+MIvH
	3bafSzfLQw7cpH06rzhk/minn4W9fNr5jcCXJVaNcotYNn9TPMSUsFOoa8sgjh4u
	Kr6Oh3Fx3c7Pw6IUklGU+DNXTkFHoi9e6L4SrkO2sCpPH/yWkzClgKktyUuvUgYm
	ZVf++isdZEa+VruZaMtMrlh8RJqlm4SaB1UoY5a1HrySCja/YB0cTPg+CL7/t4Eg
	nBH7/4zOXomkd90rTR793lXZdPi1ePYteWA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw00w89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 05:30:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bed3183ecso2093882b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 22:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754631019; x=1755235819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Car4PvODcLhqhbydD+z1uxMFD8WOqlwfDy1GI1vIzo=;
        b=BPbb7F1dmvrSuRqDgYARoY6H98/aTE/KPF3IRvEOPkRGuUi0SlrJU9rhN0dJ95QwmU
         tv0M7GQCrLuhzhrNSyuag+vu1r7jIjitoIkRRlhe8T+XBhSXO9+0+rdjgNatAHaj40cZ
         DzFIV4ovv6JuZy2RiyAKWyiseXrwVE7bOlNZpx3z+IZ5g6NVA73+I+WDEL/9JHbvwm10
         PtFTTKhOodTs312bpMEpqwmesZaqaJAvUMZviXWGWgc24pSEiQ9RbclOJX0oysU2kdMt
         4BblOzFCRb3ngHNV9GYmbacLUd95kgr8e7RHS7mSg2XUnFwJ4HjD59fCKv4PUWQOkq3a
         TJDA==
X-Forwarded-Encrypted: i=1; AJvYcCXSWu92H1JckBJ02hT8/VzF9UEWAbw9AHuoY5u0zW2aZCU9bCYRF3+30v8sIllkV1Ob8CjY9SGAANCtvGPf@vger.kernel.org
X-Gm-Message-State: AOJu0YzGM2Ftj+D/TjrVeVc6y0aYisqqzJI0jwl8EzRPJdZF6yifmzti
	9c5PIa15MNHNc+UacWllCKhsmd2Rk53gJ30tgoPve6hiliBxysHa3t4PbM/WQ/PCfy41SbRF0+H
	t6S7bAZanwg306bx7fIIwUCo5QrfEfcSjowCRzyy+MVX2ef2OQxvwReNTnhpUAGfwLMQd
X-Gm-Gg: ASbGncuIZNTdwqBTb6X3YApAMAqpV4nmyWAxJaFjgO++E7nkfjLm20h8kfEWOumP1bJ
	KFj/1nvzO/XUNyTUMFAr+F0cC1O7xbLsHKy8+MM9CfABRDQ9/i8Cpr/A3YHVCiIOjAQrYCpbhxg
	OqchpQKt5PfPfr75ZXRITkoILa6mYwfEnHftj9Xs84d4bn2HGcShvlWuxQsq4lAiMIDgUQQt+C9
	p5jCCF0+wckNxWPxC8S2SziiOrcl/M8l7xG1cdwYCRCmkNfmSBAhMW/JCDvv56iPPPnc1HIG3IJ
	zhnV1ua8NNfUsjGUVX0uM9rgY48tl8veTRZXHwiYyzwsfr+kSP9d3m5TgtiFM1PcRJ1Lt4KBRAu
	M
X-Received: by 2002:a05:6a20:7d9f:b0:23f:fc18:77af with SMTP id adf61e73a8af0-2405526b3d4mr2604485637.44.1754631019266;
        Thu, 07 Aug 2025 22:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2AX1odTQ7pYbDdG+vscDveuCfUt/q/c3s8e8DDzLhI/9qs3snSGEcgCMTUUe5hjWo6pSeVg==
X-Received: by 2002:a05:6a20:7d9f:b0:23f:fc18:77af with SMTP id adf61e73a8af0-2405526b3d4mr2604436637.44.1754631018849;
        Thu, 07 Aug 2025 22:30:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f483sm19278662b3a.31.2025.08.07.22.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 22:30:18 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] Add sound card support for lemans-evk and monaco-evk
Date: Fri,  8 Aug 2025 10:59:37 +0530
Message-Id: <20250808052939.1130505-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3h6DHhgzv865A5linKAJ5410sm_I7eCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+4CGFIDNTkA4
 XLcEQmFq03bNot42MbnWGtZe4LuoSeLY/eZlci86zntjehukCrM2llVyVrF+4HH5JQC4bee2SCZ
 PJ2G+6tYXbKr1TewZZLhhlBbOwEPpsrr86Uw/TldecnmC95H01oygNfGZHrqIq2JPhASmIv8Fre
 CWkOj4+jfbPL4dooavFLzm5lwaUzMuwPak1o07g5UA0MZk4xJpzjTDZfYjMaPbTaY7JIivfDS8f
 XmraBqpHDwf8bL9ROPBjBYwnuHsreU4z2gDyM5E+1Cpn5r6FGxi0p6CNhnMsZCP5y9ub3VL35KO
 LtI60XM/iwUEdV+ypScmHyxDK0DZtDYKKKxmNL4nCagJLvGuuhBYSno8QMqwPiiuax03YV+OCqd
 2JY7IEKL
X-Proofpoint-ORIG-GUID: 3h6DHhgzv865A5linKAJ5410sm_I7eCX
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=68958b6c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=XcHJyV3jQw5NWJaZqmMA:9 a=zgiPjhLxNE0A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

This patchset adds support for sound card on Qualcomm LEMANS-EVK and
MONACO-EVK boards.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,sm8250: Add lemans-evk and monaco-evk sound
    card
  ASoC: qcom: sc8280xp: Add sound card support for lemans-evk and
    monaco-evk

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 sound/soc/qcom/sc8280xp.c                                | 2 ++
 2 files changed, 4 insertions(+)


base-commit: b7d4e259682caccb51a25283655f2c8f02e32d23
-- 
2.34.1


