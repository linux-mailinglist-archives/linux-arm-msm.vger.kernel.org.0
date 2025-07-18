Return-Path: <linux-arm-msm+bounces-65686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4AAB0A851
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8425A3405
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045152BD00C;
	Fri, 18 Jul 2025 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQTN3Eu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AD4221DA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855625; cv=none; b=nNV3JhCl4q+9nD+kj8DJz8KCUz6J6B32EO6JxtpCYAcsMAHCTqXXBxayZCGHal2kkY2wpPhrmYsBWcZZvJpHCM7umT4flZi88JLR7ozaPrX25H1s8NvkcW6zKcp390BMRLNxuhHURlKKDuFhEKHyRc92JiCDVH91f8OIXhewBNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855625; c=relaxed/simple;
	bh=gmfr46OFYmUccWZSBc7IaVgajR2Vt394m5Ncm1zzRZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXJCh7BFf5rDysNfHA0UF3G9Oe5SApIoNcPp8WeFVRBdO3JjPoafvsDvWJZn+zSjf085mRq168WXdiyiWAdHAgGNmekmys7ctjoHBiaOSjE5q5H1umLSYJbx7izBedgDsBlVxI1PPyCCn/T5+tEOQBrIJVVlIc/wA90mdPKH3wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQTN3Eu4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7wolY025209
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyGX0yCNyB/fJpepU8CmcL0R5Xf5NuixqQQS52Ar6fE=; b=LQTN3Eu4FoyTKj3e
	pR5PMtaGCqha8gKjJVV/Gwwk9cnsGI5dLZPpSDaQPLi0Vhoh3lHiVZd6uhKybHOu
	qT7iVSelDoOi9gUzEgfLH8liFZFv2tyZGrDA7G0sorhDVM5u5ea2I8mfXcj40/42
	0eaLlMFGev+oyslpBUESeUV9n4JtQL3N8+1CmTUoJnbjKioDo0Pldl3w+RPyvLOU
	Kt211uds2/+zEvs+4LpjTv2nMgcu/ilWVoWkcx4vkcjly6Xo2NHDX8uanHvAZkLE
	Wl/asb6LFk0Uk8XkTBX5mB31VX/id5rJBwfP0gFlU96fnXs9yDuVtRC3EURfJsbB
	Jc5WBQ==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqge08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:20:23 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87c056ae7c0so320998939f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855605; x=1753460405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyGX0yCNyB/fJpepU8CmcL0R5Xf5NuixqQQS52Ar6fE=;
        b=KzsT0Dm3Y8OfL8oxVEfdYUqio9rRj4VjbRcnoRuP7j/3oiIsdPEfZmKmd3Stz+FY+M
         70ysWomB0Fen8wPDg4aZXdjRPWD6YirEn5GP0eEsL2qLLjtsfLZnxj5JcSapmsPBBfI9
         UQfaIzQu1cq/fxOeQXNZ9gM5Mr8aa0lQq0V0reFXW3oY91LqoLM2dMvzQy9xlh1R2ouC
         u5zg1KKfJNe+qOWSECPfRMWMMG23orMxqohgmdI1vQr3akJoJcovTM5SakFOBYRNc5do
         /060u3wOt1J+28BqdGYUTGgz2TAgf7oEHLNOrnhhS6qWTgKgniXrSqWV0RHWPYNlV3tt
         ukwA==
X-Gm-Message-State: AOJu0YyU0WthviOusxYKQLGJAuL3NRFQ5peUAq0P72gPLMtFPFMPEgTl
	ztu/mflYFajy/yki4AtBU1Aiu5Y/OOtkIojtHmylIBqpEDYCM6OGMuEvmfQl/MyoEi6qniE0Guc
	rO1mfFjKSscSK7roCbWdsO3BGf8B+cDHSkhpVTfg5BZYTG4NXRqE4Pxo7BVFVmrkSWgwgGFba4+
	Q/
X-Gm-Gg: ASbGncuK7//Os58xLo6f4BArzQ3Ek+xvMW/W0mA8+JW9WjGO1TV4E2eE/xLKGhxepEx
	S1leBOyTR90hleVC6kR/qH/zFVtsAsLHIV9S1InqFnEG/jLM2yB+fcj5LwWkkX0716XZzlIXZdD
	UVo8+Y6FX3AeVyKWErMAE64SRQUn3uZC3yWe9FklMIpHeVqvGYZ5cl6Is2YijnDpcRTeEsjwIs2
	LjOHvWsxmTKi7+xxWENRydvRt+hwaAdsDWjl5xGqQTq6pfpnBVBN4CMO4n1e4QEll/x3LEYOn5w
	gBQZeaumuRTIs5iYBn0JwvtnoXuetQgLiNdm6XkIydtTCMd5INPvP4HWMQ/2+o6HZJHTYV1fBga
	KzligoVbB4WiuqpdK92Rm1KiKVtaxEf4w6OJuPwbcQzDUsMOTiamg
X-Received: by 2002:a05:620a:4111:b0:7d4:5db0:5b95 with SMTP id af79cd13be357-7e342b9c9d9mr1695736785a.58.1752855239300;
        Fri, 18 Jul 2025 09:13:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF5+LPdchdvDPtfa1f7zPMhgf1TwpIBYaXASh9HQnX2GtnD+tloD0jFjFD+zpI1ErW5YaIgg==
X-Received: by 2002:a05:620a:4111:b0:7d4:5db0:5b95 with SMTP id af79cd13be357-7e342b9c9d9mr1695731985a.58.1752855238785;
        Fri, 18 Jul 2025 09:13:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1ab7sm2388131fa.50.2025.07.18.09.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:13:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:13:46 +0300
Subject: [PATCH DO NOT MERGE 8/8] dt-bindings: power: qcom,rpmhpd: drop
 duplicate defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-rework-rpmhpd-rpmpd-v1-8-eedca108e540@oss.qualcomm.com>
References: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
In-Reply-To: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2189;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gmfr46OFYmUccWZSBc7IaVgajR2Vt394m5Ncm1zzRZI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoenK4Ky2laV+OIQFpLhQXvV3YcdhKqF4v3szYM
 L9s+c2reICJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpyuAAKCRCLPIo+Aiko
 1TFkB/9zASb2ttqh4bUFeLr7tB6UPx+zGOKm5Ru0OqSNEZ4peWOE+CyEuXuLPlrnvrfqaSBc9Xy
 UKYbqiqaYolNJ6zGX6WYpRw5Il73+W1GbOG7remVMF0EcnsLxEWZ1NnS/mcYJ8ayu9C2ZlEdc6S
 B98tNfPuHTmNR98CKd9AceXSoztM3VTaGTKQ0OvBbdrFt+hLg/IaE/+GtrZFfTw624cGDyMH6Vj
 qzjpibaFgupAuzA1ZmtudzlnszBzvkA7/7PPVLdBmCdeNbJ5Zx1Q5VGbh3BgVD7OR7fbjiS4GfO
 BDKDeHj1ZRpF6mEaVuZg+6HydBzIFpSMy/IVMqgnrAZM9h/j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a7447 cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ucwj6ZyNMwC4X40j0pUA:9 a=QEXdDO2ut3YA:10
 a=CtjknkDrmJZAHT7xvMyn:22
X-Proofpoint-ORIG-GUID: QpG8hW1tmeCkNb0OHgrXiaBZ68N7PLKL
X-Proofpoint-GUID: QpG8hW1tmeCkNb0OHgrXiaBZ68N7PLKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyOCBTYWx0ZWRfX6jeW8fxoto7z
 sByP9JlFNTWLC4ZHAnQPRk+rY4tC3NjmXoyHQfGC5hrQb9oLRIOgQ5PgCTvH4qY3rCWPOMGn1aC
 ZUSBY/4/i23nSJU6+GLg+A+vA/zjXLjCooW33iGUYMYq/kLlpZ9WKHKga1Z5/Qc6Cq4e2awoTP0
 GNpGSnyApd0uHsKhOdJ0A2/Hb3q81y3QLXZTytGitFAwnSNHLAMenFdAtOTtTnYrofqQiYHjYeF
 eD1s/bshtT47AN/tSlbNvN+M8HQtIsX1dJ0cBxNDBqYOJ2Gf9uiN/ky8rZMZwp7GlUljJWMhrHB
 zX3BtkOQBKmVKHMuvRpcdrWdBS/gYtSAcLZiP9ZegupueaDZEacQDVfDr+W3mnNRJZkfSGOubxW
 md1RI4GWw+I2l8xFkJE1HW17EV04wUxJVPHzcEXRT04q3PBg3Sls7IobAgg6K72ZBlC94aMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=488 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180128

In order to prevent further confusion, drop SoC-specific defines for
power domain indices for platforms which were converted to use
RPMHPD_foo indices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom,rpmhpd.h | 58 ---------------------------------
 1 file changed, 58 deletions(-)

diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 73cceb88953f705106486b7e111b3ffc39c85664..ccf47b4670d905b166a9a39badc3535c8f9a05bf 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -146,64 +146,6 @@
 #define SA8155P_MX	SM8150_MX
 #define SA8155P_MX_AO	SM8150_MX_AO
 
-/* SM8250 Power Domain Indexes */
-#define SM8250_CX	0
-#define SM8250_CX_AO	1
-#define SM8250_EBI	2
-#define SM8250_GFX	3
-#define SM8250_LCX	4
-#define SM8250_LMX	5
-#define SM8250_MMCX	6
-#define SM8250_MMCX_AO	7
-#define SM8250_MX	8
-#define SM8250_MX_AO	9
-
-/* SM8350 Power Domain Indexes */
-#define SM8350_CX	0
-#define SM8350_CX_AO	1
-#define SM8350_EBI	2
-#define SM8350_GFX	3
-#define SM8350_LCX	4
-#define SM8350_LMX	5
-#define SM8350_MMCX	6
-#define SM8350_MMCX_AO	7
-#define SM8350_MX	8
-#define SM8350_MX_AO	9
-#define SM8350_MXC	10
-#define SM8350_MXC_AO	11
-#define SM8350_MSS	12
-
-/* SM8450 Power Domain Indexes */
-#define SM8450_CX	0
-#define SM8450_CX_AO	1
-#define SM8450_EBI	2
-#define SM8450_GFX	3
-#define SM8450_LCX	4
-#define SM8450_LMX	5
-#define SM8450_MMCX	6
-#define SM8450_MMCX_AO	7
-#define SM8450_MX	8
-#define SM8450_MX_AO	9
-#define SM8450_MXC	10
-#define SM8450_MXC_AO	11
-#define SM8450_MSS	12
-
-/* SM8550 Power Domain Indexes */
-#define SM8550_CX	0
-#define SM8550_CX_AO	1
-#define SM8550_EBI	2
-#define SM8550_GFX	3
-#define SM8550_LCX	4
-#define SM8550_LMX	5
-#define SM8550_MMCX	6
-#define SM8550_MMCX_AO	7
-#define SM8550_MX	8
-#define SM8550_MX_AO	9
-#define SM8550_MXC	10
-#define SM8550_MXC_AO	11
-#define SM8550_MSS	12
-#define SM8550_NSP	13
-
 /* QDU1000/QRU1000 Power Domain Indexes */
 #define QDU1000_EBI	0
 #define QDU1000_MSS	1

-- 
2.39.5


