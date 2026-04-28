Return-Path: <linux-arm-msm+bounces-105018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LcXMarD8GnMYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:26:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60241486ED4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A21DC303DC81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61BF45BD41;
	Tue, 28 Apr 2026 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBY9ODjK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBAMh3nr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FA6453498
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386209; cv=none; b=JUivCkxrB3JI4MEwjqdSmtQkZsLGyYp6xlJSFrS4iLfxeG4WeUe8+FSib59yb7vGcklX04uTZuQpViKMMyEybx6U8QLM7qvop38LgFmzqeL4Ddyyy1sNlslUrWP3oTMTv04iKvwS5wrTl61hmOGnYgLCjiqtzFIZO3zNs9w4xDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386209; c=relaxed/simple;
	bh=iY/VfJm1uaSOqwTnG+ysQb3Ah4zUvNYZa5ApjLpBAeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7onAmBXwGi7LX0xtIu4JAjZh7/Xzy6aEir2f0wy8LSStQeh1B5WTUgwzegualSK0cmwMFxUpMRNE9mFfWFbRxLgX14c4Je7EZcg6MsfPaowyheGnhe+CKcSs0b2lFb6mgRJqwvXLu5H+FQeKPxZiv5kSfXVdU4HOpD0D5vd+b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBY9ODjK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBAMh3nr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SBgkCU1625116
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=; b=pBY9ODjKd57VJ7fQ
	8wU/+JYQXlY52h6b7nn6uMPFeERqAXOixtsF5OYvZ74ld3CJoOYU2kPGd7y7VQ+M
	jJNjX9Trr3O9rvHejYSwkFdrhuAIVUTI3/HKqJE6irsxU/2muTFYon2sJLuQufuB
	xzXXwihPXe4EqPnW/R940HTBX97jdm8/0Gz0up51kSOncR3Lk1BOOq/iR5mY0/PG
	4GWrSof4ZxgaFXS0UGC3ZBKpMKz0NW+ARMW51icCCqtzdqdPJzB1Wn9iRtqzh9mU
	8Flb8meUeZH6O2LQWgvl5uJJ0OXiPrjj4tNzmwJHJlT5Rx8CVCsXv7c8/vTQD3LK
	p+pGsA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsbey0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56eeff9a2e3so19652322e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386205; x=1777991005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=;
        b=RBAMh3nrSai8dP3NQGVkoo04mZ+mDslcKH3eOkfwqzA8RPTMDQMagmrZRDjvhVpTGN
         GNA+rm1h5X/f8K9opiTJL5WgtaqejGW+/3143OsmAUk5s6F0GsP2N5QcaLSobQgTD05o
         JOW49CauDMCgSli8trsnXu5GIyEUunFWWpzFWIqB3Uz6pISDFigohzX6nTDlaJvTGkrS
         A6BGT5S3AyX4OeuofqsifhmXd/cqru2PNqovo9m42G1OkkFOkKD4irTURcDzs6u1wX54
         kFXsjiD+/McG1+4hGf/7AdCHN1Hz4+F+jF28Le6qPMEgfVBgBWaxZ7u67d40GbPjgfmv
         eEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386205; x=1777991005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=;
        b=OujPPi/YdkThBbg1PLUMAygjNDkfZfsv7xGqPd/4fzJpC1sYscaCQDggOh0g+In0pr
         8TTU0AdN17BRfSBExDI9n8Q8UbHWLJbvjGKCSEngAcrLOsaZJ1W5xhnJPV7DEtHhzPam
         Q3zoUT9Ud/Cs8bDtFKxdt8vr+QGE0R2i70vaWKZg9zyurLKqLtdib/Tact2c96b2aIeB
         xQTXoK47W/RAf7/YwW3sF3GtLeOh2hafyJJKVTSQTm+TwG1qVtURwKUD+kqmCHydRAcE
         TNXOBKvz/sm7/qJlpXwd/KkodjppotNXrnob+osoThMn2PvGo1dFoCjSMetwP045WH+p
         vdjA==
X-Forwarded-Encrypted: i=1; AFNElJ9iPoE5oRTyV8UvttFRBCyjcvxkEGDt25GJ/At8pwQ3ymu5ZuAS28vCYlis8/cfe3S+jxAScyjwo4vVPKx7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8R8Jd+0zPoi6jqksTkYfDfNpekrI1zEG5QauRSZLQLslfEmEI
	aDxdS8r2lnL6RszdcIpZLfTr3HhLYrVZCIS0henuTLVNRTiQ09hcekZYuhHOfA2x5Yg2TWXmF34
	68ipky0dxB2Yx0nv/flJ22wXIL2a/kfsAh0slKwjUxOXpfB3QFYeUn39vSpIliUAw0EcQ
X-Gm-Gg: AeBDiesPdHqqrUgnIHtAMyCt2uoH7ZgUyCeWc2fNgnQEOZUHHVxoX4tXVl/Jw0RsAZX
	Uiozz7ZzWukRt/+2qIjXC/dO7HE8Ej9C9SNBDwXTNRE+9UHztdF+z9I8OhK4kd7/ShqNdNMyC8U
	l0EU1Sk7gVbSjCQWgFc+lEeBS6GXDWUK5GQfKj6+k5LSAy4pZJVNWIxOypCaNVkBuSQcdoj170P
	RNN5A+lds0U1rITM2wkSZ3jH8jzJ+5jvkLSkuk163ytY0F+u/T6wh3BeX3/N2UYf7tJjPrEZA1D
	XOQsclbLIYU4QjkGVa6gq8eEAkNYAtR+9URpYmOZUBZFizN/FbEKRv59S6hWS2BzyTQB6B3caG2
	k73bpY97hF/GXxn7yRHPgc4GxdN6keNDlPmqVnKAicpJOY3NY6xF20NB5XpV6RmBRVX4imj5vA/
	fOK7NkafDBZxseu4nXUIWRQFexEsc=
X-Received: by 2002:a05:6122:1d4c:b0:56f:8f5:b135 with SMTP id 71dfb90a1353d-573a56fd202mr1557384e0c.14.1777386205089;
        Tue, 28 Apr 2026 07:23:25 -0700 (PDT)
X-Received: by 2002:a05:6122:1d4c:b0:56f:8f5:b135 with SMTP id 71dfb90a1353d-573a56fd202mr1557313e0c.14.1777386204513;
        Tue, 28 Apr 2026 07:23:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:10 +0200
Subject: [PATCH 5/9] arm64: dts: qcom: arduino-imola: Get WiFi MAC from
 NVMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-5-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: nsLqeSluVuxqHiHX069HCME8-gnzaVBT
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0c2de cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX2Y0+z8Nyh0+V
 2l+nfO1TqhhfaWIzj8Xau7XptHp+C5Ap4q5AhcGos+oJxxZ/ptL2EgINDddRbMb4/6z6bXEyfHJ
 586l0AnxPWdX/msHStoOqxGZIq0oZ9T6RklCRvvm5PMKw+oMd9AkSH0xeZJZiKRNjdQZt+4EcKL
 HKecXNJW3KytiGSyfuqbsQQc5MRe8QHGYJ8y1Xu5ocelhOOsli4CdBELMaFFD/SUpsEkfDhiT50
 PqANLgWlkebTGMbTVWAGyZP7YF8YspltIzjvBFS6bqXnZTxu9BPSs63vxje3H07zx6HhpMkK4en
 11BZt/hIr7sVWkAjBjR5GiZzQB3i1x4PmOG6Mf/e2t7wcMgmwY3+z8Krg3aEbk5oZotYhMPY3UR
 jdKZbGx4aDNhF45IBQDKEIONBYoeucFG4lU5aozNUBmEcrWp1PmOC13lkBTHzspzd9qLN8Svx0A
 mo/Ye1wZyoFLRAIl8cw==
X-Proofpoint-ORIG-GUID: nsLqeSluVuxqHiHX069HCME8-gnzaVBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-Rspamd-Queue-Id: 60241486ED4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105018-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Arduino Uno-Q, the WiFi MAC address is stored in the eMMC
boot1 partition. Point to the appropriate NVMEM cell to
retrieve it.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index dc85cf94f71cac8666cab30ccf37cc2d2f8fd941..35a30cd6f47d6d2e018f6841a05fe929fec15738 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -581,6 +581,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


