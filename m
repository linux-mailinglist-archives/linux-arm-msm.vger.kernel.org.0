Return-Path: <linux-arm-msm+bounces-65635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B98B0A0F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218D45A7566
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7B429B78C;
	Fri, 18 Jul 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2Km+4oP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B952BCF7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835614; cv=none; b=OMHff/oCdkfxZ2QgtEbrW9tXQpjuAqSvOWzxBvjCrR6H7jzMAUQN3AIMIRZNjK9WmCjedfsI4XS7Po+VplRbC0N49vU/15IaEkERy9SLWIWHoBNNZyl1cjUpfyI/I7KiTiMAnwW6HQKiaNiwaafW8TyTb8a7RUdcCjT2zgCE95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835614; c=relaxed/simple;
	bh=ZCzgqQ5wClK+CpOspY0xkNzERE+nZ0OAJ4Bui5yuNYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IEd7VDqxtksFUOqk20eP72XtooSTr3EYWhjK84cM0mD8FpFed62pVcTelOE87L9Rzw9Rwj0SAjRdhQaSZ0ZpwZ5+NYlNSht783MPX6RzBAO2JuDqWOp5Cb8fDKjevnBnJtzqxmfHpNu62Yz9w0+8CcNw8JsHG87fPSz3gXzil5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2Km+4oP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8rYB0007293
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ii7gkbQDsBKlsIJbbjCqaJyes15tBplO58P
	17UvUF84=; b=N2Km+4oPwfjpujrdM2mZ5jUpTNJuE0rWP6QSfUbBFuau6XKkLwc
	nG8KQ16CcGbpEwVptjno9cwKyk40YkDjgQzExwu6MW4qCarwbhABvOOPojVwlZnQ
	ieuOtDe+98BL78x58lW1NdVexVM8XB/hWzpqfaYt1KWyECZfUPrpXqifqPghOovU
	8+VER+xCszmMJXwaNR46NW0a9yjc4znlpLnlq0JbjnM1/mXYkn9WyRsRJon32m4W
	8FvFBfIN08vHnpp9l8LrhaP/oKBmQsJQvdphm6YSvmc7oyae5hkJtXmDiT5F10jU
	Fr9sChhiYHn5p1S4wSvfZKZ/6nchUY4l1Dg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcacbhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:46:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f13ef248so2053248b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 03:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835610; x=1753440410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ii7gkbQDsBKlsIJbbjCqaJyes15tBplO58P17UvUF84=;
        b=n+RnyoQ/tkofSyOpdd2X5XD7tv0quri9tyMHolHVFlEy5QgDFxdUixz27X5VXlT8Bw
         JX+PfPP/ZN3Lf2cVvu+j4z4Y7M3j9GNK40t3PVgbciYmZRCTW/jnyzIUU0CozA06Agbs
         LsknW5e0Y9mzBlz13+bDjBbsQY/UBpNAFiPgchM63Crk0ukCNXJ53UKDPgWAuk4obEwj
         Z8sPJ9zUAp3122Xq5N8TwKQl16zwld/sYg7ol46ayYnScIfV/LwfqqtM+fOY8WMI46Ny
         lhmSOM8eumOVqM20QYYDmKNdBvgSuDRTRORGF0WTmGmx+HhhSUdcZI7xs3R9r1Gy37aH
         C7lw==
X-Gm-Message-State: AOJu0Yxz7lexdu6JSOwrYjmV1qCoyvmB6Im4Y7RkCMAltYpdqOTRO239
	ZDDVFfKG6A8q0PUKR2+I1WqfaT+tY1I3+5pvYW3HzsnZ1WbmQaTW4KSzyrNs4IC6ylpApYiokQN
	Md1OXI2kwFcb+Lqija8qUmRO5bSyi4gACkxXwM/eXBkgniN7qu3czxK4CTX8FXEm1gexh
X-Gm-Gg: ASbGncv172mApodyZy0YUULEg8o/fr3HGxh1R4kjM9eea01nwOHHQmhBjfuGIZRs2Yv
	BT98wPBekVNMO4ZZ3aMIB32OLFJX4YgT4UxuLpbRY3w9BQNONV7c5sEVGcBn0r033WIenkZhpXh
	HGdwTUtTRJb0bPlxG4Aw4wyc7JDZOOnDqqzsK2ok9Drm8qcHFcsw4o8UbtJTv4ZoUbBGzIOtz6J
	WT5EmXnC86Pe0JwLTMIscX0MEPHLlXxlbK5KcvL1orrQmHQhedlwHZLFMtbN9gMtRLvSZXa6lCe
	+7blg3NGbO5dr/6jev+Krhn3bEb2xrWctCQ1i0l2e/90JaQL0Y8FYmF8SQ3Ppc9PDUq2IYfJaoQ
	1
X-Received: by 2002:a05:6a21:648d:b0:231:6ba:881c with SMTP id adf61e73a8af0-23811d5b72fmr13279549637.6.1752835609916;
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+oIQZv7zeP2XrajyPNGsv0HOcYRrzrBPX4o99YzxCFVD8DkN7dyHzSjoLscfcsLRkcELSfw==
X-Received: by 2002:a05:6a21:648d:b0:231:6ba:881c with SMTP id adf61e73a8af0-23811d5b72fmr13279503637.6.1752835609468;
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678cdbsm1028989b3a.108.2025.07.18.03.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v2 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Fri, 18 Jul 2025 16:16:26 +0530
Message-Id: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NCBTYWx0ZWRfX4TJw3ZWhhWGk
 DJGYxL6ieQZ1C6Vz2Y3CUR85Y9CPUe6G3bXisHmaxHQxcBuRmY/uF+J0gHaQzXe/xGKToAUK4cN
 g9It2HGBNc1bsoHfk3mD9I55B7N965qaQnuxrMUL8AYx+mt0/tfa7IjCHmqGj3f/THQLJnrymdG
 3rGdN8x5lrck1tkcburjejGo5sUZWwpGPgYUT+9bNTZIwXYicTodgsTdDD+R93cagsSUNGAD4kP
 YWcmE5ZXnsLSZWuVJ6zGxPe0AhhxYNtNiwENoNSMsp4uTylNSGBkdmM1h1C7vPWjbP8eDSMxSc6
 +6B7fRGnengzo8L7DvnmknHBg1hCN2FzDfSYY7PY3+MfC6Oecpd7HX2/kem8Nfs1VRuC08rImmu
 Cc87DgaMRfxHULjjmFoTavHkukPbHLo0zRZpSgEnl8ty2rjclt/m8vy00Qlk/qkACCLEM/TP
X-Proofpoint-GUID: 6oa3Og_FB-FL6OU_61JgEC3KPyoPM4-j
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a261b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sKMTf-CTBu6bTl4tlAcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 6oa3Og_FB-FL6OU_61JgEC3KPyoPM4-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=912 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180084

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2

changes in [v2]:
	- Addressed the review comments from Krzysztof, Dmitry, Philipp.
	- Used devm_reset_control_get_optional_shared_deasserted() api.
	- created deasserts/asserts functions to handle reset gpios.
	- Register devm action to safely disable the regulator on device removal.
	- Link to V1: https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/
	

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 ++-
 sound/soc/codecs/wsa883x.c                    | 93 ++++++++++++++-----
 2 files changed, 81 insertions(+), 23 deletions(-)


base-commit: e8352908bdcd2d0bcf0aca8c69fae85fd5ea5edb
-- 
2.34.1


