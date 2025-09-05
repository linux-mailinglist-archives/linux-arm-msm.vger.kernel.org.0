Return-Path: <linux-arm-msm+bounces-72251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DC0B454E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E393E7A5A2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05FB2DC334;
	Fri,  5 Sep 2025 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJP4jSIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552152D4B66
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068845; cv=none; b=pCylqu2h3a5YMfmRrmTw9+NWxVkjra/jIBUXMVBlnzWqEwUuyLYDo5I3tAaHDt2IXMr+0CH3VdcyDnRskas9z6jE4T8m08lja9Tfr1BEzHQHtobT8lWD+SGwGFlMerkee1xPeBkOgE62urqskn6mt2Vz7u9NpKWonyox0Zgiw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068845; c=relaxed/simple;
	bh=DHutDMB1AlF6Zj+BlaAR1mMwCOp39dMu529S9tVIn4I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=on5VWP+fK856nuT5qF3QDY8yslFTOUcpad0raEDELkX2r3wYgFZdfPEyGR8AhlU3KBrBYz2Rv6Lp2yx6GbOswyWsAxhe7VDlQBs/PrTGl+6h0BnuxfdBTRSd/OZYJ/OkoSiQpb9zPUePf1rbhTPV0kR9AB4JOtfrylllhnWfNrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJP4jSIu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58591Op6022479
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KTOjmQ5YZcnfoxX/wtE01OBjnG7ULxjk3k9
	cqZBH8gs=; b=dJP4jSIu6c3uON0HzdfCG0a+5pCTjSo1FfK89E6u8+n6lx+mIDX
	5SooKQuMNZ+ZmXjRfk/cTKmQ8PN/dQ5ZEsVtQzSc3MjBEG3J5mQceDjyob4fpZ8Q
	Uzhyx4XRbUdHD8lrEz1zgUa4l7+SB/IyDeFaHZT6Y2XZT1KE4ehTUJoJTT0lWhDg
	YN7I3YJrsCGj5i3PVN4JwA1HedAUkf4vO4+VtqRG0IOY+AkhgfAUCA4p3u4RwA4z
	TFeKOBhVFsHHGOa+sCeU3FvQGUVELOlx5qbtpmcCJMOEYgbxyJh3nG+709yfgG8Y
	cM5DQT4EB8yPOF+htYMckvTzE6xLP8FrdzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj760a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:40:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77288e1ce43so2128624b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068843; x=1757673643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTOjmQ5YZcnfoxX/wtE01OBjnG7ULxjk3k9cqZBH8gs=;
        b=CvM55DR6EreVfye3LyMnoSCZPSTrULV6eZwdZNfyL398pZUQlCko65GWFek6jMMm4Q
         Bx/8HdiOtgB/tDSMfD+BzFD3PV/Ya42xuKOrctdn6C4zDoKDrxIxW7AwCVYPovXuieSc
         YRkO6Gc9Yo7yu27CDWP0wZivBNP6qvZg7IjgKUhy/cMFRuWTejcpvdqdeCUu83xne5Wb
         HSefAE0f5q8FDqn8MJj4ciqqAwZp3eAJiKdJ/IZ+V/qEx7r7WW53ngbkDNChtcivuQ6z
         elKBOCSbQrDS9n4clPkBhtagu0VNLScRzsLtTk8gCc+2/2bEyVl8Mp0sOyVS+tV5uxvS
         YtsA==
X-Forwarded-Encrypted: i=1; AJvYcCWPIVNZH3W+4Us3BzhUFwpKo5lJbawENgBBFdFXWjWmMTvRGXJbA56CQJbf1lor8pgSNRW8NdTPxRN7/6Ps@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVrdeHjTMl8VbQq/hPDYaby8kcs5ucxniNeClM/CYCNa7Yxp+
	QZvcW5b0Mt8qZCAreRQ6SKWA1bYGyk8mZ4MqDRYFkgTlraB7J3nd1b0XZmIBqa8kSb+Nv6mydnZ
	VPNPJhyTgD0YSAoP35of4LGnsa38SFM2Z1bq1ilMXaqfn9G9YxMx+VD7kDnY9/2+I6lA0
X-Gm-Gg: ASbGnctFCyFkYs9xpogX3wOS2MJbR7w6fzWX+7EzhPUFQkIAj8euG00uhsgRAsxwBn3
	2HAqAPYLvZOdxV7ku0s+ShmQo+xt53i8U2snLdp4wCP5Pc79HbxjPAoaJ+zh7WgZCXd9x4rtPEb
	L5EOOHXaktPj0HMbaXRhIkhU4Uj6NMLvFRUjvtbvfUjhWhf5BMBaBcsgAvZLGZ6ft3MkYye+per
	Uz1pgeMWDX+7Zx/lCUSeq7qhUNiZMDYTJ1bfEyKxHUhJoqikAo0e1nNR7TlNHL7uUg1PKqmulpY
	4mvbmcDW4IE1QsrENilgT8qsmrjjxRT3p4kYFe5dJu0yVP8f3+s1xGm0ouRAFeTZ80pHnLzJU/f
	i
X-Received: by 2002:a05:6a00:b81:b0:772:301a:fbb6 with SMTP id d2e1a72fcca58-7723e342758mr26414384b3a.19.1757068842640;
        Fri, 05 Sep 2025 03:40:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+kvOTKtPmkE+qtmPs0DrM1pO5RsX4xLOd6KiyukaWHCJEsYx5miSGaqT9A7ydir/6LOnzww==
X-Received: by 2002:a05:6a00:b81:b0:772:301a:fbb6 with SMTP id d2e1a72fcca58-7723e342758mr26414356b3a.19.1757068842221;
        Fri, 05 Sep 2025 03:40:42 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm21993859b3a.17.2025.09.05.03.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:40:41 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/3] ASoC: qcom: Fix lpaif_type and DAI configuration for I2S interface
Date: Fri,  5 Sep 2025 16:10:17 +0530
Message-Id: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX+ReQl6v228iK
 Grme4JGEtZ5iLmLN728EbNNVamxBl8jFitaMWOEffGt6rJfzBA1nxByzpW/axnuekn0fP9neeHS
 1nStRxSmmxegUsbl/EerE22cxEVkVMALg+kC7vVDZdZqZNrH99TWE56SJMXmr/CJ4epXoNb6vEC
 CwftmyLCUx+tjGr7JRi6b/wfy+hAXK3e4F77YehfaKE08J9g8ZcmzKogRbBooiuZ9yAyzmEEYTW
 R0XNPcI8cGB20K+PSzEi86XT4+O1qZLYI+LP0OFKWmHb/T7rp89+QfKJ3w8oNWFiH8UZMrfRlft
 VQhVHLpSfPx3a6aEwGdbi1ExuyXDP/a/lnWOvV6Dw9QpGfpOHWRQiLMsJ66X2g9coaSLjcSHaJ1
 ZoZvUoEi
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68babe2b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=KhSO6HZblKlzq0T7JtwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: S08LZHvOiK21ZXnQB3gvSeRJSHByWcXD
X-Proofpoint-ORIG-GUID: S08LZHvOiK21ZXnQB3gvSeRJSHByWcXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface and also Fix the
CPU DAI format misconfiguration encountered during I2S
stream setup. Tested on Lemans evk platform.

changes in [v2]:
	- Used snd_soc_dai_set_fmt() API to set the current clock settings,
	  instead of the default WS source setting, as suggested by Srinivas Kandagatla.

Mohammad Rafi Shaik (3):
  ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S
    interface
  ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
  ASoC: qcom: sc8280xp: Fix DAI format setting for MI2S interfaces

 sound/soc/qcom/qdsp6/audioreach.c       | 1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 sound/soc/qcom/sc8280xp.c               | 3 +++
 3 files changed, 5 insertions(+)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1


