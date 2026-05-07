Return-Path: <linux-arm-msm+bounces-106235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KmHfOG4l/GkWMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:38:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 425474E3242
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88C0D3019913
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 05:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38923254BD;
	Thu,  7 May 2026 05:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fd9mD16/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1pcmuKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7926159E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132331; cv=none; b=HzyqNFYlcxLXVf45f+sdfuUgwmXZJrKY2pGc0L9DW/kT4Q2HOWqfadqQTjxRvoiri/rod0LbJOR6qeYX1t1KDv8G0bHZzO4E1x69r7MpJjy8ap4Wuqp+Uzo1K6tuPncAnEf7oOBoFJSgiPLD6hrHHuj+jikvAlA9nBclC/URaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132331; c=relaxed/simple;
	bh=824iZPXR5T7sNtjo7RhCDvws+USZKLZd9qGCT+2bGro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GKxR4CcCuHt6AbNlwAuHx/5JJ4VMFaZcS+Xsmiwob4FGd0SED1u2wrFCWWsopOfAMk5tZ6GqJ/wNw5tnfkXo4UPJ91joL1Hjva+pvMG87h9P8pqdQBBLq/SHspZcMdDRAWr/Mx5qvnEb6pm2IQtJgY+yiJTuXzZFOl5ajOYHeD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fd9mD16/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1pcmuKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LoHE682775
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 05:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RKz5HvkdreumAR9FKqyW85
	CfPz2KorGQzkOYz1ENI9Y=; b=fd9mD16//YQcDqgdbmRpowyHKt1xcRHuz/tdQM
	+FedF0Bs5twM3OzIkKx2iJtwNTxEYxKmhS9Gq59B1A2ONnn3Wrdyql8RMHM56W4X
	q4E+WbIijNkd9yWhJVWALGYAGQ29AnFGl1b8DTB/A10FoWyvaqCE8s9ao1V+y5zi
	HaG5UQSbaytU3JIlBEJAC9p9pUz24/lQcJoRx2zQzGoJ272Ua/fUZHo8dzMyHU7T
	3xW1DC6bYcUkuAtwrhwXCwLYUlHZAhF9S8TCHma/X6RYR5VQktg2xgQKW369eOIg
	5j4RAzR9lfNFYE30oiVw/usKm0zxojLNQ/jGGGSmzCDFtKzw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhar1pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 05:38:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-836cfd84728so294910b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132329; x=1778737129; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKz5HvkdreumAR9FKqyW85CfPz2KorGQzkOYz1ENI9Y=;
        b=h1pcmuKpI5nMJ94A3RtD5RsCYuSYQ0Jgj9AuVxP6xlTm6IMWGIJFOXM5F7BTkMHDCO
         iGHvabFj5h0gmD8/dx25daiI8jqwaCKvR1otEwT6qOELKzp9HbuMl5vASbXa2DIFvur9
         q9+LDxvCsn5U50vE1i0LzDLRHt4cE6P3Lzu54461kYWCuJfHnCyeiV456pHNiU9lPkBW
         IdWD3WnjEKxJMtKmje+cQWvKehJmrTeI2E6wtESJns3lC5bT1EELIV7vvulXa1zYLXkY
         voe+W7ImRRy8Ph8jC58Dr1PIa/xtlUF5hyISk2QRDfOEiTWDNlrwssU/RavzdRwFmwV9
         9h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132329; x=1778737129;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKz5HvkdreumAR9FKqyW85CfPz2KorGQzkOYz1ENI9Y=;
        b=WFd1h+JT/y+U25Zo/wKTRu7WmPxLLlLnK5D0l2FvfY3zzM5ddej7kFBtmlCGDjbfmX
         GWaleN5u6kAnpp6a4Pl9q/yZbZcZ097Spju7nveiFLW4bBp5Bu3ZucUfgWrozxBh30u2
         sIB/ZxR/sNli0QYwEA2/tTpjGDf1X+AKhzY+juz7zmORqmfYGzetqfGX3GGIojH9oODa
         nNriAeE/i23Xz/65mHR4LrwmG/o6u63YfTzTPYKY0UZKAqMyGfMnXJgKgft/tsjDX73W
         PnL6xfR7dub1mNJLygJ5A5pJrxuIUk/8gTm1+KsLOBMowPiZTKTJ2lQbqjr+2Kke6bNX
         lc0g==
X-Gm-Message-State: AOJu0YzPe0LDp15kPqEDcqBIJSk339qJJZCFT1olqhs75P3OtOGDcAu2
	3GmCplU+PHWpsx66ZkuXmtE3bKfL/gH8/cZfMl8IgvSuDtVSeGaAfgZfPZiWrW2HDjgqtAd8ogi
	5n+0y2RwI7SrxcwbqPfqRaw8MR2JDEF1Qt1IUNR3ydFh1F4cUhJnkPg/p8ZA4oWbLZqH+
X-Gm-Gg: AeBDies5Aq7rsAzeiABvvfV6xrTyecuqqd6jY2EAIIwGl+55cP0PMCIsY+BfI8hcw9Y
	h0oIKVffWpKDMLrrOk4w8WNwURudyEnOUrqUT70hgKnTnWusvQY9UllNuyTWPjM6ZCAWCVZGePJ
	r0ikF8aGt8JlurWkm7XFuvkyJI/A+C3xcwsA3MLxjsGYPaUSzjuHHQ7aqZQekJQhUbQ8+bRTQ9/
	3FzpGLDSA8I+/gXYjLeCWbNoP1CczmLr8lmuu+5FH8boiLIiCk5IhQlyyv/fUfdNhG0Q72iBEDc
	2VWqt5ENEQWr9FZO7mrcfDGivaWZbGh1AVKXDRYGcqPRJHp7Rn6wZmDzAnr8GWRmag4YJmAfjEf
	DVT6Y5qHjo6NOGo9h5IBVUL+qUFLooGp/q/NV+kbKFjv/8he5nEZO1ranru+Tg+k=
X-Received: by 2002:a05:6a00:a219:b0:835:7c0e:b530 with SMTP id d2e1a72fcca58-83bb3d7835dmr1334309b3a.0.1778132328781;
        Wed, 06 May 2026 22:38:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:a219:b0:835:7c0e:b530 with SMTP id d2e1a72fcca58-83bb3d7835dmr1334294b3a.0.1778132328272;
        Wed, 06 May 2026 22:38:48 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:38:47 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v5 0/6] Add support for videocc and camcc on X1P42100
 platform
Date: Thu, 07 May 2026 11:08:25 +0530
Message-Id: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFEl/GkC/3XNwW4CIRAG4FcxnIuBAXa3PfkexgMwQyXpigWlb
 cy+e1EPesDLn/yT/N9cWKEcqbCP1YVlqrHEdGjFvK2Y39vDJ/GIrTMQMAgjBn485x/La0RK3nN
 v55aBgtBqhJG0Z215zBTi703d7lrfx3JK+e/2pMrr9e5JmLpelVxwBwrJjBiMs5tUyvr7bL98m
 ud1C3ZlKzwoJXSfgkahcwgIZnI4vKDUE6Vkn1KNGtB6KydhtZMvKP2gtHjvU7pRxk5kAiBqBx1
 qWZZ/as1p8p4BAAA=
X-Change-ID: 20260506-purwa-videocc-camcc-fef043727e4c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfXzclChTqB2jBu
 Rv6rajh57PaQAnxbvmMtIqCxpF2iweiKuUIz/03ivijkHe1bVu1nH2GYKGzJ9TdGwRVnT0zVeyJ
 T+JQY1SYcDNk1tGon/Fc1Firh4Dl998ifCMGwFQJZ7oT0g3XMkvBkCxaYVnaF0UA0xLU/xqSBqi
 tsKm7ednysFydC8hiHDlKHO7UaHG8rPZ+ikVfJYwDqx2MNGKKKCKRQ+HWrVH3sjBs3X1VLzzp/m
 HASrFP5+Z9wh8XkyTIuR/wE8V5Rlmje2U5gsQ+vWkrSD7Dhy0XMYUSBUhkmeyFJIzZdMJWmxnqN
 Y8ZI7Msr+Aj8T0yIuaJRGlvj7xqdEKF//qEHiRRgny7HfC26nDxOjXKGORJ9A5ZqQ2I/nxKY4yB
 SxsdXDcjjLTn5VmZcpFcnl4F2Fx4/rsUmAJjpSMCUhKtcOKvcqiBhV6b7eE/ort68XLzk6uofXK
 RzVxEY0XI+AekvkBysw==
X-Proofpoint-ORIG-GUID: KEhb2OcqlctoFEMQzQGRGyuTUkYOz2sK
X-Proofpoint-GUID: KEhb2OcqlctoFEMQzQGRGyuTUkYOz2sK
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc2569 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-aA_EJKQ9c9Fm2tRs6UA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070052
X-Rspamd-Queue-Id: 425474E3242
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106235-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for video and camera clock controllers on
X1P42100 platform.

The purwa(X1P42100) platform includes the hamoa dtsi file
and camcc node is already posted upstream on hamoa(X1E80100)
platform in Bryan's series[1]. Hence included the camcc node
patch[PATCH 06/15] from Bryan's series[1] and extended it for
purwa(X1P42100).

[1]: https://lore.kernel.org/all/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-0bc5da82f526@linaro.org/

The camcc node was added in x1e80100.dtsi in above Bryan's series
but moved it to hamoa.dtsi in this series to align as per the latest
changes.

The series also adds the camera QDSS debug clocks support for X1E80100.
This change updates the X1E80100 camcc ABI, so X1E80100 camcc bindings
and driver changes need to be picked together.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v5:
- Dropped defconfig change[PATCH 7] and marked the drivers as modules
  from Kconfig itself
- In DT change[PATCH 6], used hex for 0's and sorted videocc in purwa.dtsi
- Link to v4: https://lore.kernel.org/r/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com

Changes in v4:
- Added R-By tags received on v3
- Included x1e80100 camcc header file in hamoa dtsi which was missed in
  v3.
- Link to v3: https://lore.kernel.org/r/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com

Changes in v3:
- Added a sepearate new header for Purwa videocc
- Dropped the fixes tags added in v2, since no user observable bug
- Updated the commit text for few patches
- Added R-By tags recieved on v2
- Link to v2: https://lore.kernel.org/r/20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com

Changes in v2:
- Dropped new header file for X1P42100 videocc and included
  additional clocks and resets in SM8650 videocc header file
- Updated commit text for videocc and camcc driver patches
- Squashed Purwa videocc & camcc DT compatible update into previous
  camcc node patch based on review comments
- Added R-By tags received on v1
- Added Fixes tags based on review comments
- Link to v1: https://lore.kernel.org/r/20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Jagadeesh Kona (5):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller

 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   17 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   10 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-x1e80100.c                  |   64 +
 drivers/clk/qcom/camcc-x1p42100.c                  | 2223 ++++++++++++++++++++
 drivers/clk/qcom/videocc-x1p42100.c                |  585 ++++++
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  |   48 +
 11 files changed, 2978 insertions(+)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260506-purwa-videocc-camcc-fef043727e4c

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


