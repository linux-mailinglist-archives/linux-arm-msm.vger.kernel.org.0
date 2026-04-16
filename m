Return-Path: <linux-arm-msm+bounces-103405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIzQEXrV4Gk5mgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:26:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF11E40E160
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A07F3079F17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07113B7B61;
	Thu, 16 Apr 2026 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+FIJYd7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkEQYLfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581CD3B6BF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342385; cv=none; b=dhJm95AKEZrlepqjatXAjVKNM9euGSfNeIheK/fV4T9Cp5vgO/2pMZ85HcgHHXncxLFPIUhHGsCt126JL6Q8mFGxrq7W89MNb+DDkG+B3CXBEBARGdXBjB2uj+2xAQ/S5DU9qFxbMm+1wqFOPeGW1rxjAxgGdFfvro5qMbcUeNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342385; c=relaxed/simple;
	bh=HLksdKGJAI0iCgDUXw1Rzp6ezeKwOcpnSyQnHzdCJXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I3JKT3m+s0+mqo5k7krFAvH3AVHLHNjD2I3BkM1YauKhTKMNAByFY/hRxwXanS90nWPBOsYqZBt+KPVVJSv3BbxIors26SP4yPp9dbH6Fo5iUVVOULSSqkDg3t0Yx6oM90JdGHI0IXBMEOGC6m/OmvNRD1squUajEgTTprEe2F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+FIJYd7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkEQYLfc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Z9FW1702363
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aplkmEpHZiGBKfdGyVM+q1
	QOGEwDPUO4XHDxKA0PfAw=; b=U+FIJYd7hDfdlddgMNL9MmWZzHQtk8agmh+nHU
	XBVsiqh1CrL2gea+S4mh/5LjXqbLJ35RDMCXlDjbBw16yG1q+UQ2Fe0htiBvUOE4
	TsWtEtHoY29bxBSSVP2iBlpUzZN5qI6znOKTAc+mtO5V/PtTWS0yM3qYVsdBYzJW
	0bYPb6oPY3FnekxpUOyIFJlExfITal5T9hNQnWswcOkgRpkRUeE+4QdJTWQymF+b
	xWUa2zoTpy0Lc8iAP04jNKiUrkqlN06SDc58Pdi02/pI/rAhtKUe/O5Nm3ZnIL5/
	V4HZ0IudFMNEs1qxO5ojL+LifGmHD2+p8Fr50d5ohEl5BZtw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamkrsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so5467779a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342382; x=1776947182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aplkmEpHZiGBKfdGyVM+q1QOGEwDPUO4XHDxKA0PfAw=;
        b=dkEQYLfcQ6XAltISDF+u9TxCpxz4sWxiMzj2ni2zZLHMXWj8ueJAsvH3yrsd/wON+V
         gKhvOz0ydlqzHJUntotuD7FarFz/K7a9XAiZjOK+852LnJgsSvH3gLCDZbX/beY29e5/
         zcMCdddysfCejBrbUNort0ZOVT5cvpJTO3VRKX/g3ENRjfYZC1gOSBW1OsrRU8cSaasP
         wYO+1uGLeCpqWNGaEsAwhjw7437W9QTfUyEUchwSi2yPM5ALwDBAg4PXXwL5gWJPR07U
         UQVDPBLYYwEFDVUmT8pw8vCM+WDzdbZgIlGfCDXAZrG1t6AwCIeWVx6cYlrH+zlF21t/
         wWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342382; x=1776947182;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aplkmEpHZiGBKfdGyVM+q1QOGEwDPUO4XHDxKA0PfAw=;
        b=Fq+tyrUyfqxpEprmABkty0xxnRmuNq+6Tr/Yr8Cq2etF6LdP2JeJutdyzG/YmAj609
         6WVrEMMjJpqF0G4Ezfc5K7Sb3F2nj9n8KRm1WBkMvVZAqprWxcHDvZVyVhGhNmKlgq6O
         ZrV8wrJBjCLGsnB3zEdDbkP/+56WQd1AjewGqyezSMCkVe5snY2agodvUruRMD9Lyp7/
         bVb0hiYQR8EK5Whbf3mo9Q6CMpngbJ3VlOob8c3hOpkois8sCdJZBBnp1dwDIoGSEB7S
         vtDm/MvJwgAx8wqvZT7BdTWzxxBsn0ZTToSu/J3jtV6iDTAwldOeuTkUQMA9YEKcg7w0
         hNoQ==
X-Gm-Message-State: AOJu0Yxvi3cfuPcmAgVLFHQoQOmzxcGTNs6w8i/z9H4C1Ti3SEniScLv
	Aw7MuHcsnP2Cdbt6LNHziKxRDWlVcGhEedNgbnqyyR86GFt61c4qr4FHWxa3tlFMhbg2kcGgWup
	VLtDUF1MSlZODmg3RqEbMQjT0wx+4RAQq91OVh4CgTKc/h3q24a2Jvj9DSpCBFKgXICsfguX9RO
	uL
X-Gm-Gg: AeBDietcnRDuOYHEhu9ugRbDpBqUqr90sWdOs6KnyRAumaY9ZeWU6Yquti7dUvwEwnS
	FlY/cZFm43WBY+O8eMQd29pHnwntVXfO2mwDWjR8c5A6tTq9Jbvxo/JR7Aqdap4cbc8FCf1/AQ2
	RtzQrLs/j9boL8a33Po2Nz9u90RR5iOFima3YTU2eyFoRo6oKqjOTND5jlwFHgN4KFz5r1dkYge
	/Vy/5hBJqjB+CuieLYv8H11bVu7m1Mi74VymX9fJbkFAqwVeBXuwzphXDFIp8CEgW6tP/qcucAp
	Yf8av/IMa2u0GgqB9vgOtMG82JVW+7ckrb/wKyHcpBbGFx8cqhG60+xvPUvWp9Vxg7mMjfPar6l
	fgQkWKJzoiNJO0QZlIAMR+6PvFT4AWRiBB63Ysf/JsKXUsyuukhhqgNHm0Q==
X-Received: by 2002:a05:6a20:6a27:b0:398:b95c:51ed with SMTP id adf61e73a8af0-39fe3f55568mr29161928637.35.1776342382011;
        Thu, 16 Apr 2026 05:26:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a27:b0:398:b95c:51ed with SMTP id adf61e73a8af0-39fe3f55568mr29161889637.35.1776342381463;
        Thu, 16 Apr 2026 05:26:21 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0b56sm6227542b3a.37.2026.04.16.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:26:20 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH 0/2] Add TRNG support for Glymur SoC
Date: Thu, 16 Apr 2026 17:56:10 +0530
Message-Id: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLV4GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3fScytzSoviSorz0+NS8xKSc1NzUvBJdY0NTQ4skM8u0pOREJaD
 mgqLUtMwKsMHRsbW1AGqQTf9oAAAA
X-Change-ID: 20260416-glymur_trng_enablement-31518b69fbca
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776342376; l=613;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=HLksdKGJAI0iCgDUXw1Rzp6ezeKwOcpnSyQnHzdCJXg=;
 b=mG7KiALHFvK6cAP3z1XDvOghxNC9BUw1l5PAsyazoDMkEoYkSXd7mZ0o4kXIygqdBgNHU8+DQ
 syNWhn0gRoHC4wkEo9jCW+3aqBfhDESoOElkfv700oFGkClnG1mz7gB
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: ODB0wCv9nYrhd8gebNxOHzue69dENGch
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0d56f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kES01Y3mVqZ45jXFSuIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ODB0wCv9nYrhd8gebNxOHzue69dENGch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX8sUWkaxHxk6J
 PJkTPqrx7JXfEiTWkjRyUf3E/6/9+WUOM9t0XlAjDpqxWbdZHAoDwuI/u4ipPZSDrSeMtsJUCMa
 fmyQG+s/8b+gyN4kIfeGHboTcI25hKARm+oV6N62FRuvakCfyAWi4ATRiV9ShiUgtbT7ovC9xod
 4rtEcyja/nhUorRG3vPGla9g+0Wq/arm5b/P4ulgk5rqEOHE1DHi2SSLZS5Zi5x4yyo4rvVmN1q
 c6rFwurSM+3EE67FqMz0srjK3o7bmxGbqFmpV0JYD3XbDVb/xZf5d3ZT3yjeE6HphrSFm0Y9Iwx
 7sJFfVPU+yh5Nc6CVGmXnqGmQ/TMBs3L8wHOSrbscT1F5RUaMcLybTKttiLOudf+XpWXmMV6xEf
 0jEKOYPGNB4xU/dci1enwJaeL1vY479y5dO6KUM7UqF4a3WvFc1R/7cie9y/bZV88hK4FadwXLJ
 oM5IJGaUg69s9N7+Rsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160119
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103405-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF11E40E160
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document and add the device-tree node to enable TRNG for Glymur SoC.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Harshal Dev (2):
      dt-bindings: crypto: qcom,prng: Document Glymur TRNG
      arm64: dts: qcom: glymur: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                    | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-glymur_trng_enablement-31518b69fbca

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


