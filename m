Return-Path: <linux-arm-msm+bounces-97417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDrmBBPps2l6dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:38:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D1B281916
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6F0E3144FB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629F0382F23;
	Fri, 13 Mar 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kseG5+UP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFVutWV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300AA35A391
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398084; cv=none; b=FaoVWINTK4+nsADBtZYTokIaBfcQ2yQKY//tOD1/tTMhK0VCunGOs6Y+khmcwSIkoHZ6pxnpHS41/6Iu8H5MkCip7H49lUeRk5Wr0XSE81hIdnEXtRsvtOw04GK7Mwv4WZjuNJc6qdedq/Hcsvq4/QLIkI5oYaOF4+HGl3w1ULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398084; c=relaxed/simple;
	bh=b0m5mclYoW9En5q2IdigRQ0qzO/S5dlubz70W7BgIpc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=up85I66yxUv1I3BHYT/d2O9cPRVAJDtii0YhuUejhM6obLRXKqt+xxvl0CAqyZdfEcpgtNnReRU/tvCXGTQnCzPHRQEO7nQe4yREEpjRA7TpRo8WsYVun8ThMhJpv0tnSgBrr1WtURze/N+3B9yOAThjXyid8VDsPWHONglItkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kseG5+UP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFVutWV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9Tqgk1499093
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=npOVpXI/eG50MvSU1dDdoX
	FqT+LB80/JNvS5DiEZhFY=; b=kseG5+UPj8jZmBG/cqzoTZsXmHrKjPzYpD5NCY
	4Gj9FTcpufzRUdwR3HLuo7+8JqQ3B0UoF5wl9XfGkqMbd7a57FPtmeeH6g3tKedd
	cJH4ppw2C5dtSfEkhE/7wR4w/EUUlFd060pUz6A87kIeLEgH33COsQnV5vF8u9b3
	uL4RBM97HzNtgmDwmRX53a5xK2cr9HJCKTin/Kp3lKpI+2wWqIT5SDVJLzKcKtMn
	DgbnMeuJf5fwP+sFyAjLeZ+ZEV1couhC1dB3WhP2nhWR1+RXsV4/VmjW3MRfVzbm
	ljiMRnTWA5JNSFDrId9VjQSRuhdTHtFcFqQ1rZfQ6trREnGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hg754-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:34:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so1940735a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398081; x=1774002881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npOVpXI/eG50MvSU1dDdoXFqT+LB80/JNvS5DiEZhFY=;
        b=BFVutWV9TiUCNYC3RRN2z63Z4cW7GU5N1MjZ3fZ7TY/zRwmpq2Zrv292d/WD6KuZwS
         6f45rpjXeAfoJpmtoTUf3s0dQFYs5+Fr6C/mrUaZrC0leeFdiG0rXdkV0oTf/Up98FHS
         Ym7yoKGlWQnurfHQXc01caWD/t1QCchOK7vDkI038GeePsE6pW6MYpfWHbt0A0Gd2FE1
         BHJY2OKlvmWTfM1WCqSXPwHuzBbemw9RcK13ejdsUlszrrYfNgRY5WiXKIV8t1O9WvGn
         vRhfW7dzSw5GgtqkI4XRoIVKYIrBbPsbn1on5VbXOh4qVJGfPSWcqAhA3RSgifQ2QRFX
         sKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398081; x=1774002881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npOVpXI/eG50MvSU1dDdoXFqT+LB80/JNvS5DiEZhFY=;
        b=SIVNUqU+Fu/k+1/xB6iTmLXV8hwa08HlHvL2xQsbE9ud1CwnkQIcgOP5hFQ7ZU0MIV
         TM7S4Pu9KaM+lJcfTnNEwgLbLt6zyBc1JDJSf1dr5vZ4N09NQPKpyj4+gvcoD1rnPfXb
         nXqyProQZaDbSkD7AJWA+JEA53B0z8XDXvZxtBLrts/A+9aJtg5+r9bLYSiIwGaefwHV
         n6oZ2KvuqznNoX9OOlwFffXqq6qLIYqTdan4sDIptateMZmesSg3VPeZ8nkhgTM0VdJe
         3gb0XjgpECo7/skqgGrDSWuXN+YfRjEPEKgCWilRRiSu0XXaHbiWNjx73n+2mGs563as
         iNCA==
X-Forwarded-Encrypted: i=1; AJvYcCVaFylGF0e4E037zS/L2SgHuEpxE1quooyhDjtxUzPsEdHG/pVo4a0J+pN22hmoIKxzbjNAf4kjtHfEkMx2@vger.kernel.org
X-Gm-Message-State: AOJu0YyNXcKXm72tlpLtcSM+C9BRnRsJGVDNyKRWLMhI5N09OvFdHIpy
	aMVigNuT6PsRAellrKyi/jA/Li+vAhI+0fD8OBCDKAv10IJCpxlSeDbpGMutGIyYmQB/wEF5Kt2
	V/3icv9yRPZytzRl5KSdtx/HJjKcpkYL9dnUQNMfbId/aZN/sUCJ46G2+XA+HweWYox4C
X-Gm-Gg: ATEYQzyTGuDX2FfRrqL0f7PrSjrgJfGocDRb+8S3A1Ka3lUhkVEVtiUIJ1I1bycGpWp
	c1jxcOu0j72+Riu+TtSdN0wE1P9pRd4NuaNFQ/2f5nn6IAIx8nML3BtFTuWQPeTzprccflaqvkI
	Xl13ypCTV1lVuhG/GIZLrBfkwJjbLKG10oXZ2KbamvT6oRvI8Ph35add4TBjuNwgs+MJEMqTf4S
	M+KmTobhBZQIVi9As2trxAmyIxIL0bGyYu4zvmGW33wkBYk08BGWE9+TYfBvdfu/o5IcIYWxfj8
	fkgjrlfisJIRSD3S8240qF6RCGFKEhuU/dAPhYOEz1GhwKkCie4cXAA4jvlzKY4N7pjKLuuO6nj
	HUQLq74Eu2c+Uszy5aS+XERu7UxHHaT4DoGZvCKuhjx/Q93uwxg0=
X-Received: by 2002:a17:90b:4a46:b0:34c:35ce:3c5f with SMTP id 98e67ed59e1d1-35a21e38ea7mr2317488a91.5.1773398081107;
        Fri, 13 Mar 2026 03:34:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:34c:35ce:3c5f with SMTP id 98e67ed59e1d1-35a21e38ea7mr2317449a91.5.1773398080668;
        Fri, 13 Mar 2026 03:34:40 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc8465sm8055383a91.9.2026.03.13.03.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:34:40 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable TSENS and thermal zone for SM8750 SoC
Date: Fri, 13 Mar 2026 16:04:16 +0530
Message-Id: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjos2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNL3eJcC3NTg/iS4tS8Yl1TyzTLVGMz4yRLSzMloJaCotS0zAqwcdG
 xtbUARyPpzV4AAAA=
X-Change-ID: 20260309-sm8750_tsens-59f9e363b996
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aastha.pandey@oss.qualcomm.com, dipa.mantre@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773398074; l=715;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=b0m5mclYoW9En5q2IdigRQ0qzO/S5dlubz70W7BgIpc=;
 b=UgeqgAmsrx3Rbl1cGEkWil2GG+yW0w0d5oEcO/z7nKW2ruuD2tm/pgec2j7HY0cxwmyooSKQC
 n+Usd1Q4MwEBs97askkgET4g9Rf9HJ90wS7lf9ZXYkIS/ULjEAIg3rE
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b3e842 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iVRbNCi4RErFctStz8oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: fC7bgKhRKgWN_5JF_ma6lO2pK1IUOTQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX2WEPl3/PYmkR
 Ja1K/NyCI/o7mQElItGUUHJQ7SMSkVYSQTsacQ9y2mDFAj3wt9PM57uwBAaA+BAoQs+ASrJQprW
 HR2ixHmt+STpcQWjWMHLJmMB8+xWl5+Xo5iWnBpbATvt0zZhIT3P+0swHU6SKJuFinYf1INvYZ2
 QTwrr/VaiGJA1jGlQBPT4cXqN4aiOSLleWI+Bgkn3/CbQetEaOIgkBYxEzfkm9Wmbh3biRQaKAE
 6Inlf1fCz5qnVMr4SBqWW85wj+VZvhtc0nXIzJRsx5y9vDL2RdpCGz8WTs3kLBb+nG3sPWz7hr6
 FTAYBljf7H0gP8l/PgxdIC10oGRGzR2bWBX7TSxzMqEvVmkX2jf9oIWj6JmOdylzpwK9MicoBo5
 OcyTs4q6/kLoiFsc9+UQWMv84i/2gdIzOy2KgoS16OGPv6YdiGHDFNc234TJ1tLYK7dgy4MXERn
 b6K0PzxJD8xe6DRVsCw==
X-Proofpoint-GUID: fC7bgKhRKgWN_5JF_ma6lO2pK1IUOTQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97417-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0D1B281916
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adding compatible string in TSENS dt-bindings, device node
for TSENS controller and Thermal zone support.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Manaf Meethalavalappu Pallikunhi (2):
      dt-bindings: thermal: qcom-tsens: Document the SM8750 Temperature Sensor
      arm64: dts: qcom: sm8750: Enable TSENS and thermal zones

 .../devicetree/bindings/thermal/qcom-tsens.yaml    |   1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 897 +++++++++++++++++++++
 2 files changed, 898 insertions(+)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-sm8750_tsens-59f9e363b996

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


