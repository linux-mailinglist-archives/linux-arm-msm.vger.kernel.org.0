Return-Path: <linux-arm-msm+bounces-67947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FDB1CBC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 20:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7FF3163B1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 18:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CC12010EE;
	Wed,  6 Aug 2025 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yz6GLYbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061E2E36ED
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754504333; cv=none; b=OPIWKjZ+tPaf9Wo2fGJFp8/aNEEvUic9idIVa3m8SrjkSHbsdeUW8YlsSfialwi8oqEJrfy91As5zzy/vk3FKek15KAYjXWUSIEx6kbEtbMWif492xzepI1SMSH8Jx5I1qYTHBHSpM7BQApkl5He28lzMT1Ooy1ghcGddf/zqbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754504333; c=relaxed/simple;
	bh=gltay6gHOTujsw+u6lXUTehNXIZtIgzLPCEbcmXqR7U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fypIvBZCpcJAKJBg5bjwLR6iBfHdDJS8GWKl1KA/yB1B2v8Oi/iP9CJM/XEPD5BXzieJ9DkSq3dvvERA0zHi989Gtky/UpKsgYA4Wb7tAN0BWBJtUJ+duEP9xJ4C9OlO5ZyHjGdYQJaxUVvGnILzMan6TUOVw3i1ZDuPE+H3VK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yz6GLYbS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576DnixH010412
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 18:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7EtcQneqFbay0S3BezmpHKQD8tPt2h3nFwN
	SuVeutIs=; b=Yz6GLYbShmltUGe3PZGOUeYoPiUFeaJqCKQq0FVjMA2B1+yMoJZ
	feQ1pfYJoFA4UW+2pCea7u9H8DBx3NmE0rVchA6iRHXM7EEZjdNgdMSx8Fu/k/oq
	xxy+P/gYIiwtgi0XYGkqTEaPmsMQyQJTxDrs25zrg0OAD7yQnikWvGvlAQk5rJkY
	aJ8OEXrjp1PQavenczvXk4NUY+A3saRLqYFjDtvIjNYdzsRCAK7hfJfVBgfYz+o3
	9i4yC9x4W+uwiJOl5fqDy/QuG9sZyPvmfeYYrSSIuWX2pchNTvERwzVOUTBukZq0
	6Ex8NsxZf0PRp1m0umihCXPbWBX0mXxQ0Jg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7uqe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 18:18:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24283069a1cso1146895ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 11:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754504331; x=1755109131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EtcQneqFbay0S3BezmpHKQD8tPt2h3nFwNSuVeutIs=;
        b=UWDWBlvz7QHqPJdF6pmnB1V32gZaPpWCcjOP5kEHqJB8YG/DRVtyoJjF4crpM7c95R
         OCupiqPC9hXis/EdQPfbATTTophdFjjgszVD+3lQjPwplW8GHECYRVgrVyWEAEBPXMC7
         W0U254eklwdujeFFBS5m9w540XqSliov2IvhlnvAXSYR2WKH8tQ3FbzfuzJohRoM/txV
         yfgUbzERdB95z1oa+rwP0gW/muXL8PpAn+kKiFXfLlI0CcyuNMA1RQNtTYVWikwnwN8y
         u3QJk85Ropg+t9WeYJuZvnu+8sv4HXoKqan74kmz2wnRx7tnvkpRHT4kIyN5muzP01Vl
         x3dw==
X-Forwarded-Encrypted: i=1; AJvYcCWkVrAx2B/V+dZ1m/UE2CJHozhBmCTEcr9aUWn3RUVun9IifDHE1ZccL2r3drs0cy8bmt/0/Cg7fC2uV0Ub@vger.kernel.org
X-Gm-Message-State: AOJu0YyOz6OYN90W6O87MGU8YawELxUEoj19MZa9Ppx8BUQkuBQFYYjS
	05wAOVyB9JhJPWDEsg2CiqqVY0eXg7gDmwnc1iHEKi8PRItJIMK3ZXwR77Sxb7jvPzbJ0OsJXog
	iglH8JEhECvTh1b6q7UefYlQiZj7jQT4suhJFgsG1+EaRZeqf0lT6ocaty/6tTWLRPGov
X-Gm-Gg: ASbGncvBOyEl8sgZhOOVjPxyVoaJRtm7Feb9x/E0hDQss6q2Ldev6+wLE1diqqcelL6
	SJkiP3CN416FPIyLbjijQ4wI0LMU50yQiuo2EzkeXHPIk4g7YiNCaH/BRINYDn5yBTrTF91niR6
	jsoBpqUEVEjjgfivEhERArUSGtuSCygDClx/IlF6sXpM9suv3RT2t9b6LpNzBra1H1Pv1IA/zer
	+Bu2rYFhZQ9yGoJHjv9Goe2WgtX/XcVPGd9vHfG5CjJrwPgH0qbM9AnjS7pJlDtvnetaiIiPKYc
	xkHbvFs//9D7U1PyJa8pTh5k6B7CNFTM3L5g8g1hMQXSojl0Oy3V/a7jzs8IwN7RK0h13RETpy2
	J
X-Received: by 2002:a17:903:2f81:b0:234:ef42:5d65 with SMTP id d9443c01a7336-242a0bfe495mr48028945ad.52.1754504330343;
        Wed, 06 Aug 2025 11:18:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1Jjp74fSOAUZPkCo24NljY5UCf/PFKkDfQbKzSbRPxCaZMFEt+QxieBL3ATAUpTk1S+I4mg==
X-Received: by 2002:a17:903:2f81:b0:234:ef42:5d65 with SMTP id d9443c01a7336-242a0bfe495mr48028645ad.52.1754504329772;
        Wed, 06 Aug 2025 11:18:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f36311sm20235186a91.34.2025.08.06.11.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:18:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v4 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Wed,  6 Aug 2025 23:48:16 +0530
Message-Id: <20250806181818.2817356-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=68939c8b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PJR2aAOtTfpWL2UOpAQA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: sa5GHe8n7TJ31DUfq3OMNcD0tkefwxEC
X-Proofpoint-GUID: sa5GHe8n7TJ31DUfq3OMNcD0tkefwxEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1vB6ClE25BIN
 39K+uEpXr5wk2dZoQ/cB3vvQFut9aZj5UfDrB/Y7iUVOxffNx8AcU0ZF9AdogU+Fq98bYgD+N/c
 4j551rh/SITfK1JJ0cJsavKZ+wLgteince2mSmcSKx00tkZIs/9uPM6v0vr5Df5mkHfLuKNz1wC
 M3W9+dmRZLqoKNzShvmfhIG3Z0LTegN2uR4ncpTNQ876AYHHK+GeLV9VEga4p5ZSubk/HMTd2LF
 gawwqLo4suCqpoya8GzACLKOjFU4T0nLh3UdDdBtSQIQjSHXdQU75p/BqRiaeDOmkaFyMp8mD+7
 qqutsgB0lMyfPs1YVVg/wf4n6WeAANxp/aQaY7nOC6nm3hKNzON7mu0cbWjeHJ8Q/ew5fVDlR80
 KfPq05ly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2

changes in [v4]:
	- Dropped v3-0002 patch, which is not required.
	  Fixed with proper error handling for failure cases.
	- Link to V3: https://lore.kernel.org/linux-arm-msm/20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v3]:
	- Created separate patch for devm action to safely disable
	  regulator.
	- cleanup the v2-0002 patch.
	- Link to V2: https://lore.kernel.org/linux-sound/20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Addressed the review comments from Krzysztof, Dmitry, Philipp.
	- Used devm_reset_control_get_optional_shared_deasserted() api.
	- created deasserts/asserts functions to handle reset gpios.
	- Register devm action to safely disable the regulator on device removal.
	- Link to V1: https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/	

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 +++-
 sound/soc/codecs/wsa883x.c                    | 57 ++++++++++++++++---
 2 files changed, 60 insertions(+), 8 deletions(-)


base-commit: b7d4e259682caccb51a25283655f2c8f02e32d23
-- 
2.34.1


