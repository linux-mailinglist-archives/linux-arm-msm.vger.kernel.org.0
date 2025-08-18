Return-Path: <linux-arm-msm+bounces-69568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B6B2A282
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0348D18A6240
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EF431E0FC;
	Mon, 18 Aug 2025 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUsAMxUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D24320385
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521467; cv=none; b=ghz0YALb7TwAIiPxq07e/E2XQEmjHwNMhigybAO8PZeoG4flv0scA18OaiM7d2jB2uM6WKg+c7ZzB7QWR2kW7jhRwLuatuHcFEOTRGV2flVmONBaP/GWNHkzaTCWvlI0j3Xzi++UYjp+D6ofAywjxXccsupeOj0p6GATKp4VM1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521467; c=relaxed/simple;
	bh=lSfDSDJulBXzVJSH8kLsetVnz+LP1lpOSpV6/QKxUP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdVkvs5APrQ6s71EsduCjSJ/JdpfaX8chKxpDTbIlR6PP9IAA/aJ38XBr6JlU22SlQwk/sq/P0Qj+EgK/b5c8KGP1uoYgcoqDYUt8LKLrpfto3fQJA8/ssu5hx7rWKD2aJJQMIh3L2mQgU4clSO3xkg16afOmK2uVuQOa3BZtek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUsAMxUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7WibC011483
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=99NPc/hNZh2Kb1E3FD5nne8SMDHWyt5h02m
	B6Lp5Gj8=; b=CUsAMxUa1mrg0ugsDD6FiipufqVXsZNxdLXPFO3Kcet8Sg06dSr
	PkLs07gh2JCyAqWL1LM38y2DKu/Y6ocQcis+/ZWB295+hWx+ZrDzjr76oEuBRMXk
	ffVSLOVxZqMI5rKjXGY3zWy+z+JIXPe59ZJJLhF/JFnJw+duZ5fMql7jlwqSvVLX
	brIEeSxkxk93ZxlbB0/9gF8/qMe94svI1UQ0CdR+95supZcCFSUQCBXB58jt1xzY
	Qi3HMAUH5oPqugju7HoOrbJ4WjRckrfG5yqzf2mAU1XWdhTEK6uREre0QS0T2jFF
	mAqqNw7LyxcsWB6+EBdUAw9YUo5sey/AGcA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvper-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:50:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9289baafso87857536d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521458; x=1756126258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99NPc/hNZh2Kb1E3FD5nne8SMDHWyt5h02mB6Lp5Gj8=;
        b=gfryDkRRtLmIZWTCYkroJ+Qc/pbGBIdGj22NY8IunkaTMxhLONx6PB63arZd7VMawJ
         YSzGCpXGDCQM1mresc2mVnQFdQ+Z457NDEuTVq6jJk2N7hYKsQuXcvQtYBWSR+HT/nwR
         FFknWdrcB+0ln4sRREUavxGLQWHgHcZawFsHyHznullwf9nxRQdjAo2C1fEdyFJEIug2
         pUBru45sA2/S1WToQH2hdGFKDcWBLwwu8A0Y9xQUyWJoG7GgGR0GPMGCIgL+5b8/L9FV
         V8UZC2GdS9h033FziDKbTiPGBO55oBiPPMjN/u2BJBeUHwJRCKr+X11G3Y1af7vQc/d1
         Kd9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUB5mqslgBtGfHIsg7yl3m1OAX7kTulw2sdYmAd9YRE11mTSCT5e8euvqlLTHZtareC+OOdcbLWpLepGE3m@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXELLJwFOrvH5oLW5dFibtFBXJ3QRWYVnbYuyI9luR/AHvphq
	81u8m3byvFeiNocVQdAUNwx5erpAkQ/TXyB52MU2fV/anX9H75h9j5MxC2TKtagzBroEmsFdZ5c
	cU7sxt5ZkKtrCDSPALd0hSBs596dNgxq36Ywu+8eH/0oXnhPn/s3s4HUgxCIb3s323B/wsOSe7+
	u3
X-Gm-Gg: ASbGnctfBwoHeM0KqeFQqXq3L+K7G11ie+gBIYhXfevzKJZJ3mdRPkoh1i36lsN3cx7
	u75o4Zt0KSpH9xZhMGIamuOvzTbEJg9mO7CumlxlKtD6g0z5+4bi/pSaw1XsQzr4+LjIYTBOQv+
	j8BWSMHYC9IQk3rcz9ljdJZHVF6BUDo9ZKpXi5+kNTUXdmahXWw/TUyuyDXseS1ueWJM4dXFWGl
	OQ6oO4N1xwZXUlvosnY/lfJbLjb9v9zUQbdLoDVPhSuBzUaGPHC+HOxFVoo/dsWppYMg+7Wm4Ey
	ikyfcF3oXqAsnAw7okW28LCuHk8YdbDdh/yhgZDRs3vdNbJyucfKDw==
X-Received: by 2002:a05:6214:20c4:b0:709:3768:445d with SMTP id 6a1803df08f44-70b97d69158mr174285626d6.11.1755521457656;
        Mon, 18 Aug 2025 05:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEehzsI6ttyklkU4OQIHPZGVa/k7IHY5zvv9A809GRerz5FOGA67mbOXfqroqTaT/rLzJkQwQ==
X-Received: by 2002:a05:6214:20c4:b0:709:3768:445d with SMTP id 6a1803df08f44-70b97d69158mr174285246d6.11.1755521457127;
        Mon, 18 Aug 2025 05:50:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:50:56 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/6] ASoC: qcom: audioreach: cleanup and calibration
Date: Mon, 18 Aug 2025 13:50:49 +0100
Message-ID: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: T7dYuQpRO1vXCeITfj-4skpWXFVuohow
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a321b3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NU7b6h4jXCN-HWJItUMA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX805V7Sqku4XD
 rCN0Q6BALuF9mWqxP0Ahj2685x60Ag3+Mb2BkuxMuB5XZv/MRMmzDd6x/OqnXHe0l/kfjeRz6Hk
 Imj/rEyDDpQxAeeRSTWsYE7t0ERnZEEnPh35ILEjYNpaHDXeFGisGgSt+aiNHOz3qHD9CNGoXGL
 wqE4b+xfloiEX78r5VNiOH1kmIv9z1eWdmRkmRB1lwFJPjB2nSpdQqAQesSn4/QiomsgGrBglu1
 ot+aBWwSQMuSEeyOxB7FIKNY/aq53QUbYcmvOAdTI5zN5E0YduuoMR0dambFXqKtQa1TcZO0NWT
 rwwILY5QL6ns4l5Gf9jp6THLLKotQpKi3w4M4S4IuV78HWydMKYWeSE3luYWPbzjJ2Ws08gp7Ly
 oHOVEmgf
X-Proofpoint-ORIG-GUID: T7dYuQpRO1vXCeITfj-4skpWXFVuohow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documentation 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

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

 include/uapi/sound/snd_ar_tokens.h | 18 +++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  | 18 ++++++-------
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 84 insertions(+), 20 deletions(-)

-- 
2.50.0


