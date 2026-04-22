Return-Path: <linux-arm-msm+bounces-104006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CM5Dw8t6GmYGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:06:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD54413FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A62E301ECE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E202030C371;
	Wed, 22 Apr 2026 02:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5J/0cCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIqahcPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660162F6920
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823531; cv=none; b=g1wgp60/pDIP6+r8aasrxNWM7izYpEU2nniy5IZlDadOOgC/JqlCbwuSll6Avc34G0bPexsdYv+zz3CBcoqMTHdzSZmoR5WaoIBz5t3rG7pKwFnQC5D1ST2J5g+cUpwE1iV/ThSR0KD9SxVkXp0KA72n37VX8lidra4dmtCFdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823531; c=relaxed/simple;
	bh=6HcvqUed7v2N5oBAU18sLlJgrkv3LHxTQPb4Kg3jVeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FqUNSfNVU+ohZDFsMU1n+FKep/tP9mZ5H1TUnZxw7mx+uj6GpSJtL6ofV4k5k5cF/qVDEk4zs4RzSN0xY632rz2PNG8fFPSrd/RRkYQam3HuAWgE3safni/rTHXbrGr3p9i4TWYi+KfRV0547CbWVG9WgqhzBD9lHDaafauZ+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5J/0cCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIqahcPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIa1TY2935196
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M+DKp4V79NVJCum/nrwlat
	6stdUvJm51YY820HIGS6U=; b=i5J/0cCn9E4bzvVnKt4sXzyK4pRm/w/i5XdLoW
	2jLy6kSLG0XNF0kF74JEgVYktndSy3+/UtHMh0YUn0TvM/grF5aF8/CkVTfZ4lgO
	w1Llprb/znO4mD7uzwccOoZVMWYpfagSq59rYFvEjlZDg2cwUkPZahPp/7qwfEQS
	5LeN29eAbcgGUEHi0FlrJ/UKOu80IeaVrRlGpyti2bcryVMpyY9OUFpFjjN4KC98
	IymzJVTfEZxjTTGp77po6s3L4DQZ2YrLZBsWbjGTKOnmFedJP0ujIT/cjE9/ZyI8
	0koyRqeJwklVOi3W49gp5tv1URT2fEn1ioMuMH9xT4nW5tZg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenk977v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6b0a7164so6899730b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776823528; x=1777428328; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+DKp4V79NVJCum/nrwlat6stdUvJm51YY820HIGS6U=;
        b=OIqahcPI6eyzaWisT7WAZg0N6Ky9s9Nbyt5zGNX/Ng6njVEH1ZFJ28f9dhaSCQUjrA
         LPC4ev09TiVxnnqwt7GQfvEXJsVjOMlCi8dOawYdcOLQErhxXbgExCA6UKDjX4g9Ut3C
         Z9g+aXWXfJqDiV4FjEaXhaxKz2v+kJuE1NsmHS5x16MzmzA6C5iw5tahzAa3Z6NrTynL
         zpvg73be59h8z0svLf51j8VbWMXXzjNzCcmqQP0vuejhctkW8Qi8yMpmwxufRZLtbcEX
         wb5YujANlliP7Op8+0lt3y5oPO/1UdyNf91oHkRMaFxU1E5zyW8L4cRbD95SWeBjxY4o
         69Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823528; x=1777428328;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+DKp4V79NVJCum/nrwlat6stdUvJm51YY820HIGS6U=;
        b=eluUHCK4n+CwTrodG2G4bFNb4rqf6HMRJeT+ADIBO/v8Puh/I8eKj9pBdbKJmWYKDs
         /NhAF7YO37dB7eagLx0u5cyJATccG8sH25SkT5zm4ZDTM46Efl7QpCgX/zULShaWsOG2
         3iYI8tICic5FW5+9q5ZfXqgv/nwlelkep+O6dGZwIibb5USSNgwNGyCVunCG8maCn/UC
         0t3xDHj203kLMUWUqXYAaXxZW+61nvGwIs98kCGQr2GBpO45cESYc456CWBh2MzGg6aG
         UEIp2+ZAUE9hbLIhdjPkK768DQnpcpIZQ5792p2l10aEqrKdR6zj3atJQg0GxJFWd6i1
         f6Mw==
X-Gm-Message-State: AOJu0YxmCsrHAUUhE1JOH2mzzTy7h72ghw/G8Kf9udIqdrnLE8YZZ2qj
	w4DwkoOfgwOWKsL30cvclVwyGcnYPmUEX6CuMDHI5Z74Ms01at9E/dHiprKNJM7VOg5UgKtjftv
	n3/C1dtSk78B0dvX8LoCP8WAIloNoYVF/hVMo+d/ldZ+t96KJDExuHrIiGJBYRUmGBp+y3VkoJ7
	cS
X-Gm-Gg: AeBDieuoA12Fpe5pcVbjtlwFyLiaLV4ZCvLDa9Grjai4g1s4Hxax+kNbdlscHinSOZf
	7STVm0Zi3n3DhTEQdPGiUouK5T+Yeh+VX8vpXZAKlATDrrLuSnu3mMrcCxIE9ldfvH0or6f524j
	m59aG+5Ski7D2/qR8/2NhUA6TT37AUSlkdqX3zPe+GACO4zutGjeEgDgLdNxXs5HOoFVPi03Aby
	zONoO1+WxRo1PSU/B32D0JdsUp/NWGwCh/cpWqOQYBJLImTLNin5ASmwr+ijSrzA9JxDaYuklbp
	8NRrnoE9Q7f1Zst0dLLfSrImQe5BNTAmqK5rpyGobiKpksJ2p+3qTRRpLe2hT8cyD4KGASlY8/f
	MQ2C50hlRDa9ZpGNZTxkN5xPRFuSALIQzL4ZagvylBZQLXyAk74He5vZFgMSV47X7lw==
X-Received: by 2002:a05:6a00:418b:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-82f8c834458mr21906646b3a.19.1776823528036;
        Tue, 21 Apr 2026 19:05:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:418b:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-82f8c834458mr21906603b3a.19.1776823527530;
        Tue, 21 Apr 2026 19:05:27 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981be6sm18040368b3a.9.2026.04.21.19.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:05:26 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable QoS configuration on X1E80100
Date: Wed, 22 Apr 2026 02:05:10 +0000
Message-Id: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYs6GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0MT3QrDVAsDQwOD+ML8Yl3zFEuzZIskE/OklDQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAak4bnHAAAAA=
X-Change-ID: 20260414-x1e80100_qos-7d96c8b47bdf
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: kq9xaRSHp_D9Q5Hye35ww-ctm3dBltLt
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e82ce9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sTjs9E8jwIvs1E9oOeMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: kq9xaRSHp_D9Q5Hye35ww-ctm3dBltLt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxOCBTYWx0ZWRfX4BwDrWkgzt4W
 DrDcJfE148J8w7lmjVnEOTrMDtK/uPngLIq0zNyGxiZce/YcNrMQukM4zWRhwqITm9YS7itCWbw
 AZSSyh2pH3YJDenFHvKhHDgBgTv1Dr4e5GLP4qapkMNUrDRjP1P9C/Zf1pS/TBugRDpSu7jbeN2
 1ZAHia4tSHiZSTL5xjiL0T4mIw1Dnp5rDaeU4i01KM9bNbLn1zmwDwg0RZnpBF/81Dhwq3lqJvp
 l+dhrZinZeGNSXN23W/vxTgsRcvvTcewS38CXBq9ptGMHPElntv0LOhTg/esXetovxxnd08c799
 mP+VNlql4RSSXh1dXOijvnMqGGUYl3fOo0t1PPPrbyxCFDIZPT/FNB0CgIAIRHp6txsn9qgJL+h
 Xbfh/7YFQWpmKcX/IqoGB08X5v28STECjD1jB1HDUP8lkmqVj4mk9gUM3diEyWuwSSoEMoxcYdW
 z/eupqcPZP78+oHalsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220018
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104006-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CFD54413FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables QoS configuration for QNOC type device which
can be found on X1E80100 platform. It enables QoS configuration
for master ports with predefined priority and urgency forwarding.
This helps in prioritizing the traffic originating from different
interconnect masters at NOC (Network On Chip).

The system may function normally without this feature. However,
enabling QoS helps optimize latency and bandwidth across subsystems
like CPU, GPU, and multimedia engines, which becomes important in
high-throughput scenarios. This is a feature aimed at performance
enhancement to improve system performance under concurrent workloads.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Raviteja Laggyshetty (3):
      dt-bindings: interconnect: qcom,x1e80100-rpmh: add clocks property to enable QoS
      interconnect: qcom: x1e80100: enable QoS configuration
      arm64: dts: qcom: x1e80100: Add clocks for QoS configuration

 .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  |  62 +++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   9 +
 drivers/interconnect/qcom/x1e80100.c               | 485 +++++++++++++++++++++
 3 files changed, 556 insertions(+)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260414-x1e80100_qos-7d96c8b47bdf

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


