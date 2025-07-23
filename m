Return-Path: <linux-arm-msm+bounces-66389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D615DB0FCDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6FE758768D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAF927F74C;
	Wed, 23 Jul 2025 22:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsDbD06E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13749273817
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309696; cv=none; b=mcbm7D/W5wB7ieGf6BrLLl//f4Z1DrH7QFjmQjlgo3b0hU+ZVymYKC5t69LOltXiNq+5ImuBnkYMluNuxb08IoYDHI1nncaCo9VcoeylqU6x5CFyYxHOKt5A/8HWFB1i+9QnqAHAXhae6In02hZZKg1gV5b8eWveAbJZTczuVDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309696; c=relaxed/simple;
	bh=D3W+0VC4PAlVH4emFw+f9hnESmnnidbvOLACGA+ZUSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgbcqBEgPPcPfbytitQMaBcBFFBLlkuOQWvEAPP538YJ4CDGJzufOvCcjupFkQCHFkWRearMaszyPiVNCV0NgZJNIh19bzZC4sbOXuh0gekniubPy2gI0ZZf1MvKCJTUixi7sp5puCg4BMSXOx+WIYjICJVZT/IHPGR0pADI1vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsDbD06E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGn7Mb013815
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=92LZIjDLudm
	4UshzJZBlykikxYDTfxT2SEdJRgplJ+A=; b=YsDbD06ErMWsQRRQBAtkuj0og7O
	74bdVOONVwb9vGTPMj/OFlM4weReTOh8Nlc2D6z/1FolLKOGIMqgvTWLiCQCSJC/
	nEQfZ/Dri/JBqVnrvZ4S7I6sWVt0J8RHBF1XMVitQ6iikPu18b9Dep5sQIpNLjzm
	0HfS61K1BK7s6XHxWA7jZMTy8qYOdpZBFYxLFNgEE3S76NE6LB0KYS23ld1QWoLZ
	bT1Y43GIIg4OCGQ+F398rQE/I9qmm4q6D8OkXoWi+vkvHxlW52X0pe4bD5cLK0Qb
	3jNR+/zl8IjmGxMc62Ztrh04kpnRM3uZAMxYRKwZFbLEDB+9KnbUO/UwmoA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vd238-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-704b4b61d10so8398836d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309693; x=1753914493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92LZIjDLudm4UshzJZBlykikxYDTfxT2SEdJRgplJ+A=;
        b=NOLX7SR6Bg31+tN816pDotceT06XC1UUfSSDW/3lBFFo86gatr7ypX24IrYNF9AQj+
         zcDODBgnEymQYozJ+YK4lDA+eyODcR3+SD8ovtHrwTxp5A0hYI0CB/2UrAumh+jp2iHb
         PIf3XJC/DVTL7dXIp0WifSsX2b0gCliZeeKxAI8rI2+iJKy4TKcG3f+kT+S+cF26oLPO
         //CaLWQl+1NmeidBxw++dKgdyfsAAUfs9qrDsclnz8NOHTS4xXVhbIFmu+AdnCM9o8a+
         BmsVBsdrgmW+LD4TUojBJnpnI6nQqeAYSp33xGr2M6bskjIeNXFHjv8IxibRJYpwL5gq
         r2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCU0QZveroYtxzYwCDmTYGt0PmlWjxd3KY8VqUG1tIN/MSsSlM4LhaoxazAysu7TtjNVITR542FXgmnj1REn@vger.kernel.org
X-Gm-Message-State: AOJu0YwIcDUxRBJL59n2e0I9aRC4X3zS9PaObIY8nrKuKRnmkXvo0WbA
	Cwu7T0KvcCJk9EyTDMfLJTBrtxpBgkd5gdaHty0NoPrQi695Wt+1Hm8zqKbk6jCNXJfAHKpateO
	jnwvYz66i/t751Nm2C3MJtfZ4Z3/0B6dVJyt/HCrUo/OpN+QZlt4n03Ej/KUikR39c3nk
X-Gm-Gg: ASbGncsOpqe661PLFKzPSw+joNXiLc3ktcT/pv4WbD5WFfsTZ0KsR7HQMjtc7jXtmsR
	TLw4HJl514QlT7weVuHls4U3jbKdpB5HC6/cCdsNR1coY2bcV8NvAQKObmtsrnZ/waWoJnNGJ7L
	lsyXMNnllocNQf6Pc/v+bOmpq254MSCJa8hH1bHu+SNMYRhUXp9/2sYxZTdhX7DDvsu/bO7+VXG
	UMqSV8WTrgfvWAuAevakAX1IkWOvtL0fnQ7EQwFjLrsAAD2eKRIp3hMG4oyYwx40WObgqga1Kaq
	yXeiBDHW/s+ZSyNNPvpBLIm4O6paqC7CDwknk+NON8SKRAZPU9zZxw==
X-Received: by 2002:a05:6214:20c2:b0:702:d822:9381 with SMTP id 6a1803df08f44-70700517288mr83901446d6.19.1753309692915;
        Wed, 23 Jul 2025 15:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMJbdQKbGqQxac6lcBgDoO54/jpcGXQ9pHQCWa1LXoj9MoBYavd5YJCtmOj46kdsKsTFElLw==
X-Received: by 2002:a05:6214:20c2:b0:702:d822:9381 with SMTP id 6a1803df08f44-70700517288mr83901146d6.19.1753309692550;
        Wed, 23 Jul 2025 15:28:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:12 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 20/23] arm64: dts: qcom: sm8450: add sound prefix for wsa2
Date: Wed, 23 Jul 2025 23:27:34 +0100
Message-ID: <20250723222737.35561-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: rL1OUYOmLVvUJZ3qMLTgxBF6sURgq7Sy
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688161fe cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Nfxnn_ge1f9Pje3RmyYA:9 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX8p4iEpQjyEe2
 oZyzOJdhnKpEKn0RZON7YmYwusUnOKPQ9HBbQ7kY+PMHaSd/Kt8AShk5Xre/ttpy6GPTStBAk/l
 DWjxWn856fk+G1YaFxzOVtTEjdVBVcR0TRfRczyFPVqjBbyXp3j/79562KZzSgH+D9lFOWz9yPP
 ESSSm0qTiCQI1vbJGAG8teXNhYjeaRj+1UF2CMZa4m+Og40Fz5EtJohnCGUSmmxDTXaURLzQqth
 4Md4928oPEUxYrL5HMsrcIoN9EK5hcZusuZpTAdz2VhWKkdz2qAvIIu9oM/WE1zupUdb6m6bOht
 lk4mN0gFMkfYfdYc/Uj8FxCSl5Qr2ctRVb/Nh+PqIa61u2zOXuP1vHBHppijHUUxFpSSq9XGo/p
 CCPGy1WbNez9noAI4VjB6v5xcKOzle9vJ4wZXcPQD2axAL6Ow+KyyLeU7E5obPldcyJ7uUer
X-Proofpoint-ORIG-GUID: rL1OUYOmLVvUJZ3qMLTgxBF6sURgq7Sy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=795
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

WSA and WSA2 are two instances of WSA codec macro, this can lead
dupicate dapm widgets and mixers resulting in failing to probe
soundcard if both of these instances are part of the dai-link.

Correct way to address this is to add sound-name-prefix to WSA2
instances to avoid such confilcting mixers and dapm widgets.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index fa0822c37854..d8fd01997395 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2827,6 +2827,7 @@ wsa2macro: codec@31e0000 {
 			#clock-cells = <0>;
 			clock-output-names = "wsa2-mclk";
 			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA2";
 		};
 
 		swr4: soundwire@31f0000 {
-- 
2.50.0


