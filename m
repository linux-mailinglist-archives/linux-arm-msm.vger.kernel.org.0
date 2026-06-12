Return-Path: <linux-arm-msm+bounces-112961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Qa1IMxBLGrTOQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:28:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC367B554
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:28:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EAvhOre3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XUraVFYo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112961-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112961-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D28B2300E33C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 17:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B63402B8D;
	Fri, 12 Jun 2026 17:28:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7F1403E8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:28:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285289; cv=none; b=ZxaGMmZ9lBaRl4ygQCn05H347sfoT00HWmiGAGjulGvx4XMEKSgC1D/3mzeGSk2clLVEWTCivWSmxrR7UT6E7h+C7lUE4dv74C+kI8uQQG7vu9V68hoQR5km4Tc/kRlBf1OXUMs4UgTMuwa/NKDwC0U/pogfqGrSUYR2Hed9Jp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285289; c=relaxed/simple;
	bh=eslOA9Cm586MnIpbe4Ehxfiu6FCtCf33ffQvBFXd7Sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wnhj/9J2sU9VuTX0CxgYLTCgaNJuod1lzEplaY1eLTg/M9czOz4fW/PBE8tapgLnzo3e0YIRCWAloPZZUMs7IY43uFF5x3Wz1QoL9TN4wVbb55CxJn3++laXk/PUJeEf7RExAihaiyuDeRz6sJuKG78oYkzlja67QxfCKuN63PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAvhOre3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUraVFYo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGSbdZ007234
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFFH/l4yzzszeD6f98GXq04InE6HvyOJJIVeeITfwk4=; b=EAvhOre3Q7CCEsa1
	2DPq5tVrOWgRi/uvGABZTdGo1GeIinbfNrIm4WwRrsFulv3At+ZpwDldSeXJp5ie
	BDTZytENTGORf7HYXmIls2xQ2b6EW9/sqbHgLPIDCEoPolyzKFSXYwi75fCea7FE
	GPNj8k5DCkNPC6zL/jjQOXLAww74kj7TCS148zX23B+isP+FUjvVT1JkvOIOjfjl
	CVQ7JYWd3PthPa111EqzKxMFG8fgiwgVEfUPC5jZToX8iqmZGVPQUsfzscFqagQ6
	l6ZrlbwUUIzz+Fns9EGAtrPTI13H5PvEHRLcH0W8KncS5BjChgdDWYkFCWczIWbi
	3lqbyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd4gfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:28:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf3636d6c0so12482825ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781285287; x=1781890087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFFH/l4yzzszeD6f98GXq04InE6HvyOJJIVeeITfwk4=;
        b=XUraVFYoVng1FO0RGedd0O9hn3pdrnPsN//+DVFd5EZWvBk4d1aq05Xsjsg4rcFXC+
         cI5GnF2i9bctR63KBy2CsbEbqVkyTNNIkniiFEvfTtG/fP8ALILGAqOapy9V8ir4KAVh
         xRl2ESQNoQEi4j1jASqZZRlDAIxUN9KD2G2ywoqLKFLCJpoxWtPtt3oJTFmRRZlX8zBC
         QSp3JFAsx+QHzmAYxYRo50JKGt0Fuzlmf2oHr4GG63vETBqeNumqMB3c/8yCIHO00HMH
         pbGx6Wjx2C9W34nh3vtrBIwYiYTwAEYCzyeAmfa+VEg1mSNViVbV8tw7XzQZQWZM1FKS
         Hgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285287; x=1781890087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GFFH/l4yzzszeD6f98GXq04InE6HvyOJJIVeeITfwk4=;
        b=PQmmAwZKC6M2O3tW9FTPxFciG3UZFemwxb+dcJD6vZKP5PLWz1BRLhxGwHsPFr1jw7
         zDiNRC4tNXbP5rba6O9E1IbrZdFzdSGRW0iVP0eE2Unv+eiAiYwNXkMpoNmgbD/tLY8i
         ZvI36HO7Rvm3+tV1991T+tDzoABkO4ISfXqHlvXQf3ImP0LK2Ybdqrq3W6h1WC3K3mUK
         b1Fk+HOU6EoQ1dFMy4tmyJnfHbS/61n/IRphZkBEiQibR5dEGRzX3mFzUrEDk+ryxkvC
         hCX8mq/wfCoGJeXGVImf9JnUMFW7ez5kzjjrT6ZgCdDLrIFGKIupX5huwUDpsShphIH6
         qGEQ==
X-Gm-Message-State: AOJu0Yz/iAwys05usgj+3nolsDl5y0CsOY/PMzCZt9oQMh6konDGRYb6
	zHhZRuWegssTVDLsD2U31iMT+HX2l+BTlv/2z53JVPGbree8OFBsWQ9WBM71WNikmYhZvEGK0xC
	PakIOvSfSHVaJ93UcVJ0crrQLKvH7sMOOdfyKTpqLoHkLJrKWJu3P9DgylWJSHfuuhveL
X-Gm-Gg: Acq92OFJJHHaDkhvaanZf8pLDd3iACjUtO4efqT7uY7LaTrRjqJyq92kETHGI6xbVzK
	XcrX1YeAi3R6wQEOI35bKAeNc7MtuCEVyzoVM4OomsZZxEd2eQtvRp479+FP0K/b67BGrHvHc8i
	xf5BMxhkY4E6TwIcaB1P8tklb9HrQ8R6JnirT382EnPZZrEEm/xZq0zyYMJjhYX+gILPH1OM+jW
	ppIBWtWlv5YzfjRuucrnvA2WkvpIdeXkJLf1dl/RZLkm9Qd+/kltHjLXdQrhp9Mz+CACvOSW2Dk
	lcBGUeIHWMI/jix6eqVcux1NOBiTs/ImIlKXQpUpQT+7Bx5c5DXVobfEni2gn25PkuuTlf8Bm22
	waTqK0qzGm5tpAUa83JcatHHW9cyr6ELyw3Fn
X-Received: by 2002:a17:902:e78e:b0:2c4:358:db32 with SMTP id d9443c01a7336-2c4111aea32mr45052345ad.13.1781285286886;
        Fri, 12 Jun 2026 10:28:06 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2c4:358:db32 with SMTP id d9443c01a7336-2c4111aea32mr45051855ad.13.1781285286365;
        Fri, 12 Jun 2026 10:28:06 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acae2sm24278105ad.52.2026.06.12.10.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:28:06 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:57:39 +0530
Subject: [PATCH v6 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra-dt-v6-3-6b6cb58db477@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781285260; l=4516;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=eslOA9Cm586MnIpbe4Ehxfiu6FCtCf33ffQvBFXd7Sw=;
 b=xwgP40emI6oahWjbQJWv/JXBJtcRbdjGZ2sszGEteya9vySe5zQOOQc63QM/VY+oYuHLlmieK
 anrNSERpBVnBn230Y3g7i1ojdqopFFPXNaL73IdMuY0juxBfTX2LNiG
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: LaLfJIDxBPn8YrrsY1pzNN2dsn5ZZoRR
X-Proofpoint-GUID: LaLfJIDxBPn8YrrsY1pzNN2dsn5ZZoRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MyBTYWx0ZWRfX0vdYy6eP8So6
 szlJrm0LgKNvIETxDyHgPSGgRBg1a8ywuJ+Zlg6Pfdx/mXA2o2HtZuKL+jmTWZfnNC465hZ0uGe
 fA6LBCDrx1q5UHTHKGe9emxoFH9gLTNglxWBLNb4rjfwowmdu97ZFEhetpsryEG2IIjPvu4sGkI
 crrFSpfq6Hz92NyRUBYQDcbOqd+BLWq6PuJIUua2xi4BqVNsSzPlYmMvUJ5nayuRSyCTPE5fIVj
 FVekf36qPIBP0x4BlvDkuR0CihEfIAvTmPz17JVaV06iXMYTPGF82Q6BXvMsUbzvrjaNw+IkRy+
 I3PkPaCgzxM5moYalIy+bZy9PfgrXJHHmhqfDRvaREfgFXwsXK/Bo90GpxM4JeqRoaMQ3X746yi
 d6vavsHNTGLt2Qr7kokxhvUGQovSvouIxYHCXJzodlxRMIORpkMDEjuXywuCl5aDU2QIX5zfUHt
 5UGAuBllFGpv7nF9M7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MyBTYWx0ZWRfXzXUSYqUTNfWk
 uQexe8q2oZvrw/dqPfQ8khY6oMMz/F3ELmluYFrv6v9pl7j6zHc4oFhcMlBWmaYX2pmoOqLpPJ3
 4MUPxZ3HFBHw0WJmuLdFNKclZRXU4I8=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2c41a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=s31jhp6hv9j5UOuNascA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112961-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9AC367B554

Add device tree include for the CQ2390M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)

The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
peripheral definitions specific to this variant. Since PM8005 regulators
are controlled by rpmpd, so disabling the pm8005 regulators.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..dc3861489f64
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm4125.dtsi"
+#include "pm8005.dtsi"
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm4125_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm4125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio9";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pm4125_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8005_regulators {
+	status = "disabled";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm2250-regulators";
+
+		pm4125_s2: s2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm4125_l3: l3 {
+			regulator-min-microvolt = <624000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm4125_l4: l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l5: l5 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l6: l6 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm4125_l7: l7 {
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
+		};
+
+		pm4125_l8: l8 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l10: l10 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l12: l12 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm4125_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l17: l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm4125_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l20: l20 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		pm4125_l21: l21 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		pm4125_l22: l22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+		};
+	};
+};

-- 
2.34.1


