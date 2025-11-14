Return-Path: <linux-arm-msm+bounces-81877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CF1C5D6E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FCA2421651
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3375C221FA0;
	Fri, 14 Nov 2025 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+purGcU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8wTcnCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EADC31B83B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763128266; cv=none; b=JEfgw2xbmj3zqaEonFDE2HjbfS8YFmaSDFsUZRwvjdReF6b0HK5Fs+bL8WkHxnEz1rQMJwHW/m8UXNdXhpnpc3nYPTaiAVne5lZPM2Y7a9vJbdsIlS/WlEJnt8OpihoSXZeN7UC2hUIuhNrlIip2jnUq5XGHBqCz7Bol6rnRsjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763128266; c=relaxed/simple;
	bh=0NkF0NdVe3pPnF8W5iS6qPH9EuGCPN1nDNdGvDSBh8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CzMfKuw8io6SI+j7LC18WNvezpvc+jPx1JZ6QqvIbOnd2vnMaXCt5bU8zqnq+ew8h1SdL7680LRvjLoCFnbIzqBF/ntHzDUxP9iTlLbbuXgzfRaLhX0BpUaQpuJ08HtBo87itGt+r0LZXmOcVUfvQ+t5hy28fjbYcXZdDW1zlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+purGcU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8wTcnCu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Ex6v1609784
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+PsWgSGfauRFI+F7oWnTeCfSsY57hSa+I5A
	qRnu3br4=; b=P+purGcUc0ZuKyH8rCfDwH/Zc8bioodjQ/GxhAuRJ2DU5VnsyBy
	WBhKe59miLAe6SwxJkrIdOVYr4er8aXfZfsBurirJbH/hL+83cK08sJkUQZmp+Bo
	3+8ZaisIRAeM2AlbH8pZgxkUOIICooVhWttrzNforRlkhTArYhEkIU09cJylEZOe
	jK9wZmPqsGcNGSwuY3d5JroRVw+Zi3iha5rAYxi0SOwuwMJA9hufMEjd0KBlQwlI
	xo4IM1BVGLpd/O7Mgqrd1lJ3jAkFMFrOIVzFJKlQni4q5lIgK0pIXAJnUR8gL6yJ
	+Q6sXZw0pqUvgeF6hqU2H4t9C+RQpZQBp0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h2ap5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:51:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b26bc4984bso968718385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763128263; x=1763733063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+PsWgSGfauRFI+F7oWnTeCfSsY57hSa+I5AqRnu3br4=;
        b=A8wTcnCubmovnw58Ap7VwBBdDQLhNIzriFUUA9v8u6LFPSu8VJyxgnjhKydJnurAke
         KtKNavzvMDsKbKrgnMKVt22qk/l1sZmJAyMb77ZYku38d+LDI7fX0NLPjflo36k+98rb
         fIaYIrAUi00d/VK5osJWPAL5flj0O+xeuzwjP+X3+30Jj593lscP9K4pqMa5gi/LZf0S
         Uy7n/ZEj+gir05VBkn6lDjjVkOcViwEA3cUPElrzJ7J5zaVQ9eWiMDYLQnF79nvNcu8Y
         m90JXareJ6y2PIqrKOlNcatEQuqY1UQO6g1E6Olx6q4PIqJlw31nDHPdDEd5Wwa3x4Vu
         MDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763128263; x=1763733063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PsWgSGfauRFI+F7oWnTeCfSsY57hSa+I5AqRnu3br4=;
        b=UNN/KP/T1+BRCsZS1kKGgiXHCLmipMMSRz+tSCIdhizZI/SQb1rrdmxttlEOIf2LHH
         k1WMVUujkjVkSlpbNyoRKZCBN8q9qvDzxqXQUfRcLXpabVUsXQOtVE9XomNl2gSp+o0R
         gSmt8x9il92TrziFgo0j2jPTqGCl/b0T/XhTnp0Pc42Chac+xuyui24mRUCXqUjWNOaw
         jX9cYuPFxkO5zF2GPLFK/HEd38+xut2Bu//qHVRvX02V6dJgsUCkSFLa9jCWN0scyd38
         kw6h7kMPuY648a9wwoknvGcMf2L69NC2w5egv7oGSaldM5uXsfmS+QJuvyRqY9/ikuQA
         NiUw==
X-Forwarded-Encrypted: i=1; AJvYcCUbxwmnH/9nh40gnjmwxRRGdZUKRIAyzMRz24CjmopkuUBll0sLTp0H+SWl1D+OWrKdIOKmS18QeN2lggar@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj16Khxd+C5fGFU7JYQnqkdlG6n6Qmbkg2wxglQEv4amReYuVe
	FiGDLgrdIOZU2O7u7bR/UmsAElvN6mxuDoTTmlIVcPw5CPyCeTXX92nLP2lwK3JPg0GvfI/q1aV
	rL352RHMAMJ6qLkiy27ys79s3AHFmi2TSIv/RgD6EuMynPO/hiSHBkQ561bmZ3Qdnrum7
X-Gm-Gg: ASbGncu4kL1BwAUMpwYHENkLHStd8UvccG+JG2nhWEPH1dK9xGa5B0c9YXNZKrOv2Ub
	nT9/lI4x8/WNWtT6BsnUjIvkCBFUDTsbMcWF+tz2mRapuZktTFT+lYMyT6DKTLeFxYXUTABr+3V
	RGfRht9CpXCaVBYlEQWf3Hqnpb+p5rasDe/78stCYAIXwHaZPHs3QkKHhdsgj2/jxgefokyr0nt
	F0m3J0lF0b7xAEhoxFIEQdNP2hkuciqDHj0LheIQRySqMRhEN6/bmdDIV246bU+pHY0zE74Y9yD
	vhsnVpgcIhLHP6kkkpvFRK5zzSECqdi5fXIAX0xVo8FKQr+LGwet1c48DpQo/wGm8me/xcH2Iy7
	vUN5NAnTuHDcYhFnybxp4O5EbvQZiScI/AX1EwNMyZKoWhCfRqQeg8deZSWN2VF+/gg==
X-Received: by 2002:a05:622a:1ba1:b0:4ed:6e15:d2cc with SMTP id d75a77b69052e-4edf210c041mr42546411cf.54.1763127507579;
        Fri, 14 Nov 2025 05:38:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt0foB30s0JDyRT4f4/1sDpau+ybRc3AhZNrqIIssYYE+lantsGfHNPc1iTVasNrdFAjd/aw==
X-Received: by 2002:a05:622a:1ba1:b0:4ed:6e15:d2cc with SMTP id d75a77b69052e-4edf210c041mr42546021cf.54.1763127507073;
        Fri, 14 Nov 2025 05:38:27 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:26 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add QRB2210 RB1 vision mezzanine/kit support
Date: Fri, 14 Nov 2025 14:38:18 +0100
Message-Id: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4upevlDdIxhxa-46xhZcPBER3t0FjBLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExMCBTYWx0ZWRfX7Trxbx3Tef4C
 ZDVwbjuWs8A9n35g7nk3gIOarnqwe2nc9dkA1+ygdjKzZJapmxSiMcvhBbwooyk0tZ6gMGtYwOO
 gLh+QBPTEt3uKJX/NXkpcXIrKRXNyaOVUbDggYTh2WdxPoN29+5vtMzuWZIUt5oeJE8q87ja7ck
 C9A0pMhxh6He3tjfrdgAZmdAoL4PhuzkmlO1d33m4gzTu5GR2RfkP7/acPm5SUVi1AZJK1k68A2
 +JSczDPkGZK9qDK74hBNYLos9jqzfOH0y2iZTW28GfwmNnpw6PsBqVPGfqT9frLolNLGUQcBbDj
 v76yLzS0hUUKe0Gh+vD5J+rkJHFSTvBEuwWpTDHkUg/xVsQhiDHiR/8Y5+oBY9ezEMeo7JFJuXr
 RZwfowcC1Ku78pOE44K7/sT1ZcE0TQ==
X-Proofpoint-GUID: 4upevlDdIxhxa-46xhZcPBER3t0FjBLU
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=691733c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=i7rZuoVbEr22-3_dwz4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140110

This series enables initial camera functionality on QRB2210 RB1 with
Vision Mezzanine.It includes device tree updates for camera-related
components and a fix for the OV9282 sensor driver.

- Correct the reset GPIO logic to ensure proper reset behavior.
- Adds pinctrl configuration for the four camera master clocks (mclks).
- Adds the PM8008 camera PMIC node, which camera power management.
- Introduces an overlay enabling the Vision Mezzanine board with OV9282
  camera sensor support.

Changes in V2:
* Move mclk pinctrls to soc dtsi
* Ensure backward compatibility for ov9282 reset logic
* dts cleanup

Changes in V1:
* Use correct polarity for ov9282 pin
* Fix ov9282 reset pin logic
* Remove always-on from pm8008 regulators

Loic Poulain (4):
  media: i2c: ov9282: Fix reset-gpio logical state
  arm64: dts: qcom: qcm2290: Add pin configuration for mclks
  arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
  arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 28 +++++++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 65 ++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      | 75 +++++++++++++++++++
 drivers/media/i2c/ov9282.c                    | 26 ++++++-
 5 files changed, 195 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

-- 
2.34.1


