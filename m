Return-Path: <linux-arm-msm+bounces-105226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOr0HX4S8mningEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:15:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD349578D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 659DE300B624
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033542C0F6C;
	Wed, 29 Apr 2026 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwJupxRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L78KpapD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28962BEFED
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471810; cv=none; b=O6sXh5TsJMcCxAuIXSwp+wjPR4GG/qpMgR9b9KLbUv9lTKYsPv3bT2AMNbKLU/UJhd+revdeIlIAqPBQOhepKlA42LOyGK4h3iAmf4ooJnAEtDgUhpasFnyKPbzfMzBy5EXFmRq33nxKTn7YbXDGDumwOFcI4oRaM2OwL0RE2sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471810; c=relaxed/simple;
	bh=UR2GNZzYk2T/Xx8WSgpWlEZS4x3FLBu7HRA8GCFdqEA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kNecj0pbOxF1fjQi1UTA8Y1/JdjJ5aenDsWjri/yyDj912448BgFp7WLxaOXkSa1IMHTbWwat6eta1jyxnGnfjidzGTP5OnDVgxRpzANvjgj/P3OgF0smYPzJF0xs0Z6OGhVGX6Y5BFQDcoByJX4qhzI9Nhm9wdQ1Vzh8fpf+Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwJupxRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L78KpapD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8prTm1641624
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cfUbqW3/7ZCsQRX+rilXrd
	6uWuepNjMmvDVbiiMvpPk=; b=iwJupxRgFzM3W9GgTgkn6OtT74IWuLjCfn0BtG
	V33Y05oodXq+g2k+fb1oNtZxuogEYjjlLgyykjacDZSWYzs91u64poeA52pydtxx
	lfVybZHhAUy7I9Ul4WdlGgJI6ZRfvVeR5RfveWNAm0xWO3TvP1NkmRJSZxc0XRmQ
	4vHdHPrT/ZYm7/+gtqhlT7X9SnA3CGuwRyAL6MNtkAqsloEa27P8An6frVZAeeJQ
	vWt6HUrQRKF6uW9Wz/O5/+mEemFNCZXq5n5pe7iH8Pvre1/PiKrTHO7w+9U7bl/x
	RRDm7S2DDUD9Se0cLefxkhVG8srIP9uxeHmsiL4N5fbp2k4A==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81utt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:08 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-651b8f743aaso23237879d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471808; x=1778076608; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfUbqW3/7ZCsQRX+rilXrd6uWuepNjMmvDVbiiMvpPk=;
        b=L78KpapDlH+uWacy7uqsbnUW3/FxIV4+cpf9ECFWv3WB2QlDp86dC/IVrFs/bCv2At
         VH1FDnCmaz/5ZfkVIlTRkqJ79H5wTipw6qZlmyZ2CW0V3VBxLbuGsa11zIMbsUFsb3tX
         vLN0yTwAXU8TeZAkdqllYAAoWDXCH54rSo/5zAIo4phpG4RbyBtjb4qWfZNodCh97Bqf
         p8mXktyuf/vcZ/wtF9AbRk0rzkRx0xTT4vYS4nm30iHfd4JJGP9rnonJqbd6hFSe/u+s
         ZXFbxbhIVhmwzCe1FcZOI0dt+7MtQFINTb3YPLVaFHAmSkBGEfQPHA3EeSKfURLTFl6e
         zKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471808; x=1778076608;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfUbqW3/7ZCsQRX+rilXrd6uWuepNjMmvDVbiiMvpPk=;
        b=fW6NBySfpBdrbzphI11y4EHtu11ZBkByVYiwZwPMcJSW00kfmdYLE1uT3sImTk7Fmw
         tx87r3ToW1pJ2qLZvaQjB0CTnIpeL4GVN2YRhY8Fw6Ba9ENlqNHfB1vS5PArnt30b+rC
         BHKrVJ8sL77KWOxwGZ1J8/mCk1bMbPaagYFDAUnwq0348rND3VOvr3k85F5POPhTiBuj
         nbE9oBKxTGSLMgIE6vGh+AOEo95QVqexL4NdXOvz58yOdWoG7HzZDzTPj4iR+l2c9Y1n
         wlNdl6g8TejZCELb8FFnsS9zjpVNGuPzF7ldx7ErSIEcHwNjOlYT9SzGbdm3PbhH+yeE
         g/rQ==
X-Gm-Message-State: AOJu0YypIoUQruv0gAIW046LQQQixYV12oXH1ydQpDPVimFld2BIV4fy
	Fm8SkzNtr5XzTb//I+KJKcQOQfQZXeq8Hh26vNsxW4/CPpySgWXSvaa7pfm/EBbp8qxIAzf3cCy
	f6/PIP40AqM+vE/pBiVjnCW3mcDa81g5tUQI19NZKBpxIU7V39hHGuVY433NeUrQDC+E=
X-Gm-Gg: AeBDiesKP3BMQGPTyfsOuGp/veGaeZnToNC1C9klhmanY1Ulh5PAgBLF/mtFLaReT/Z
	iiH9HW6XfGQ925c4ceRMUwRoZxY2xGNujumAtiw6pz0gKXFSusNKcNYRyy/mHMzSp0xrSNdS3m1
	5yr9waZVPy0IkAmfnepnplQZrbhZxpedBsK0oayLSE8HEip8VxFR7rMLQ36VqZg9/3Ajigt4DE3
	mjX7jd4Vkp/2/NWR13SuUdN0MyU+WYFBHvSLU/u78rHyS2JJpF0h9JZUFYFC1zco75+ESxyPcGK
	Ez1StNWOhuHc4ToNP7WW7TGtJkqbHacJi5sxw1sEPiuvYdPiD6knjEqr0WCg7PSL/49UbKF46Av
	pfEFJlSyW/5k16M6d1E5aPOGzbucxk8eRCnBNb+d8usW9uEwB0xd277z5pfo+9Q==
X-Received: by 2002:a05:690e:4841:b0:653:61a:2cd with SMTP id 956f58d0204a3-65bfb5f1d20mr3421503d50.16.1777471808212;
        Wed, 29 Apr 2026 07:10:08 -0700 (PDT)
X-Received: by 2002:a05:690e:4841:b0:653:61a:2cd with SMTP id 956f58d0204a3-65bfb5f1d20mr3421455d50.16.1777471807752;
        Wed, 29 Apr 2026 07:10:07 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff7ce720sm1286731d50.21.2026.04.29.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:10:07 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/2] power: qcom,rpmpd: Add support for Shikra
Date: Wed, 29 Apr 2026 19:39:55 +0530
Message-Id: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADMR8mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNL3cSUlPiigtyClPjijMzsokTdNFNzC3PjJKO0RPNkJaC2gqLUtMw
 KsJHRsbW1AIPyDG5iAAAA
X-Change-ID: 20260429-add_rpmpd_shikra-f57873b2fa7c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777471803; l=643;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=UR2GNZzYk2T/Xx8WSgpWlEZS4x3FLBu7HRA8GCFdqEA=;
 b=QC0TFLRbV6TUimG8J52sfoFg5Chz3LuycquIGqUzRedPuKXO7820cBx9z6ySXgwbGBh7WCFpo
 GQYFLhWseDfBYhBxQMBGRQy6GMpgirSX8L+8Zjrvex89YNWnXrulOaT
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: So3JTmDO5JCaQc4sije1xTzxHNyaqmqL
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f21140 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=w8gYdMrFLoSuhkYnXDgA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: So3JTmDO5JCaQc4sije1xTzxHNyaqmqL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX//gbXeGx6yNE
 SSbJxtu419OxeYPhx0G1JnTy8yWrY0zDoI76/ABM2sCrTJavqAX41k1U3w86dtB9TNC7m1mfdVE
 d6F6Agh5tlzW7vx/85W9xEFMlaoZO1jt0wpeZyx3hf6YsAIZI8QMNnyzM5AskWrwn08P0HDh1o8
 BuWG5nvoI2OiuTuHc/6YMXqGxEFrVwoJTmHAwh5tOv1SfH29YiIMHinRkTmtGWZl4+9C9MIzwnN
 FyO7LbdwFBjUIMCIfJk4Pq1juejR/rzkodpeSP89/7RK85DoqNX/Nl/K0zv0/eIMsi5lFXwP8R6
 YFp+vpvJwqkHuahz/QbEfIB0IZNLh+M+1w+Yb2dNBlBI0VCyl9Xuq8Q1ZwNZfcFD/eJX/iq8rMW
 JVET7hEYYjYJFdhZdg4R0WtrC7m74VYAarkgyrLAWmscjvYQfC5+TGQa0RDC1TuCXCW0Xl3ZGCr
 Uoo5Q2fK0sQNYUhB+kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290142
X-Rspamd-Queue-Id: 01FD349578D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105226-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add rpmpd support for shikra Platform including RPM power domains.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (2):
      dt-bindings: power: qcom,rpmpd: document the Shikra RPM Power Domains
      soc: qcom: rpmpd: Add Shikra RPM Power Domains

 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/pmdomain/qcom/rpmpd.c                           | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


