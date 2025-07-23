Return-Path: <linux-arm-msm+bounces-66391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 887ACB0FCE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51C071CC3000
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FF127A44A;
	Wed, 23 Jul 2025 22:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpsmPp1k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5BD27F736
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309698; cv=none; b=Zc+yv6xFBBH8sJG2CHBUG2MY7pFzE4H2xNxUnbhwvRAZmaLMeP0mtt5emYJCoxGG0fzwl7EcHc8nnxNQqW/qUfnLh++wGKukhilI2PreHz0fa5+PiLm2KOP0Y3ESyVZDO53WUWRHAkYuAl5Nv3azS8sUI3WInO4VMwyQPdD8V3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309698; c=relaxed/simple;
	bh=W1uXbTmsNMhMMyXy2Ux/32rAxYrWnHpU/nitZXsHqjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDYU1OGBUTHaWtZTK4S7yrZfHocMHZHzjrS2dShxqT10apnORA8F6AyuqC4TU302vjA/rDbOco3eu3NNXtBOvhQqAR8PZcI++BZGNv+OLCXroCPX2OgIbkn7NmQ/+NZulODcYz8WGJuDSH4RNPNVLDXoUjM6wFWvrqQyHZEyU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpsmPp1k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHBuND009270
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UurPSuwLvsQ
	5NrNV5gLdgbM9aMVO09Q2yfwt2uIkKvE=; b=LpsmPp1kLv/hku/pyPACK97F9gL
	0ONHYTHM8jRttthh9yJzgQ+BQmqAgcVVbYQ8ZmLutw/wPmkKYayU/iu69PL8z0lb
	Qbi3h47qNyhpHcIVThh9Gq/1+FsvqtZeX796PYpQYuy/pRZPmrJwMXaZX8/IF03q
	DBsrcJ6pnv3mi3gK1YbVj+IPOyWrBSqoan5FxaaBG+6HheAuuH6CHwYf5fMvVV0L
	tslx5jnMh0nMxM8DI9KZhF+lOu1Sk7jzh0pHklv7tpq5SwxMIUomnsexw7viCC1c
	YWeVtAM45UwDGdOAlXJACB6gpx29cRBmBETidSewc8JW2CPV9bVuMh4XNKQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na555f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-706efc88653so7623046d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309695; x=1753914495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UurPSuwLvsQ5NrNV5gLdgbM9aMVO09Q2yfwt2uIkKvE=;
        b=asc6k20/I+Mz9HA6M3kMRem4SqIyLxdEn1tz2AiwrtZh4ON4vVOjTbuDK8LCdUQWEw
         I5hK79tD9dSJcXU4FLG4DG7oySxU68n7NaMehtOluhSuZRZpAAaHT9egpR4BfajLdkGj
         gqTmBhnXvrzxNuBcVD1RyzmkN8ZHyLwA3f+QKQ9VABI9T/fExJAtZQe1DV9FedYz2oG1
         LzvunO2iQ9NpXCiXVEC9iv4qT7jUUWJAx8/9k1gJfkFU3tRb4HARsrdeloNk0Swd+s8I
         bch23sQBER1edhoVnyEoYSK0uSsGZB+1Gyp/au0vrDzuR7asYqGvd3e2///A2mE4tXy4
         QqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5sGDIUHn/07Mq8iY/yX59aW7hOYMOq9ioZWtOCkPOpIXfWRIAttX2Xz49xw81vA2miT/aFNK/bhW2nB1W@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrBfCi6vJawL6v3cR6xL9RYjijcp/5tLHfxYFg/IXt19mTvlf
	OW5+LL3Uaims4IlLck1HjA8mUyUduGFhqPGbPRTb6m09BPuudWBx3wkgpo/Y2RZQzMqoY/nWuoB
	lAEjeNWD9gxAQClfE+9VxX60GspuwtcRkvjKt18+W89YN34bkyWkBEVF7duFgHvXtb2MV
X-Gm-Gg: ASbGncu7b56FSN0wIt/3y7W1/WNKsNJneCY39McFqkk7JeQLZDc+b6I6tiJs5doYElE
	7vu5XNVQayV9sCV0pByWMLZVOAOGmm5MemRFIdhZo+o3ED1xG77/SG/s9DZ7mQRsyo1nnq1r7ph
	BUwnnfKhE4smgYS/ySb2R8hapR75DesqbzDm6cW9h78X53JGkK2gymwW3/v1a+2mNFHdPGuOiLG
	CMfsxFGmb0OjSU5P1evwkLXfa3GfCfi0W+Rr0zVsDEhzPF/Xt6PYLaeR0FTeclfSQeYxEsTSemA
	fkckYl/AGI6x7Is8gFkyJ5Fu72CygnrKI+jjZ4D03n9V9ed/+qGP+A==
X-Received: by 2002:ad4:596c:0:b0:6fa:ce27:5975 with SMTP id 6a1803df08f44-707005abd62mr63190716d6.22.1753309694829;
        Wed, 23 Jul 2025 15:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp6Ef75jlerxYrMg+FmKFlFarFjYWrfMy1DVApQlTuEoJtqEvUFn5ycjc6wY02nR5zJyHjvA==
X-Received: by 2002:ad4:596c:0:b0:6fa:ce27:5975 with SMTP id 6a1803df08f44-707005abd62mr63190396d6.22.1753309694411;
        Wed, 23 Jul 2025 15:28:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:14 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 22/23] arm64: dts: qcom: sm8750: add sound prefix for wsa2
Date: Wed, 23 Jul 2025 23:27:36 +0100
Message-ID: <20250723222737.35561-23-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9-CxVMGOq8UutNUqKq5hH6W3lKK4t9Vm
X-Proofpoint-ORIG-GUID: 9-CxVMGOq8UutNUqKq5hH6W3lKK4t9Vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfXzdkm2nne86WM
 J/md8bh0TggZ+EPNGQ7/41Zd3pOuDMwIHORpUBK9czTJti/lqM6qM3Dq2X7cdn3lkSjDVN5sLZe
 LPGXpiFUVDteSbL79q6+HLDIwMR4GRsKi0t+ahRwVIYoI84e93O8j+zPJyWHVegHLcmEAifZN+w
 EpfWIn0yOjhq8s3r1QXEI3r8MzytYNHyFM2UILEAJCY5R2Oy+9jAX1aXP9lD8KDdPILazrIeiCg
 FT2AvcudKv8wI8MXBucRJZAa3PZa3fihaJLpFDAoFxpv+IaKVTHPZJXulW1GlOYNHWIWnS5qrGv
 KLCRvXP5LJjsHONyGQY5ti2u0txsdLzS24oBzVR49/zGQd/N+qYYOR323uKirYjTDAj0tRmj1xv
 +sLYwCO2NjGtQ0BPWYsfmCpEHaXBu6X7BpBvHWk48MQMR2VbZFumuDG43WNZDgo4WsoMkGBz
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=68816200 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Nfxnn_ge1f9Pje3RmyYA:9 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=795
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

WSA and WSA2 are two instances of WSA codec macro, this can lead
dupicate dapm widgets and mixers resulting in failing to probe
soundcard if both of these instances are part of the dai-link.

Correct way to address this is to add sound-name-prefix to WSA2
instances to avoid such confilcting mixers and dapm widgets.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 952f6cfcdccf..c9abffcdd21b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2213,6 +2213,7 @@ lpass_wsa2macro: codec@6aa0000 {
 			#clock-cells = <0>;
 			clock-output-names = "wsa2-mclk";
 			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA2";
 		};
 
 		swr3: soundwire@6ab0000 {
-- 
2.50.0


