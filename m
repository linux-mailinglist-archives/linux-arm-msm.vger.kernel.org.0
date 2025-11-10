Return-Path: <linux-arm-msm+bounces-80987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7985C46405
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B61AF18953C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5BC309EF9;
	Mon, 10 Nov 2025 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9QEI04n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaQFylHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA49309EE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773963; cv=none; b=MjACNok7O1Vgx9dXuPz7Fmn/JDNwrzVHg6olAT0g7Bn8toKIr4wf8R/NdepNTROSZFUQXeGg2a5LR+/qnOgeWS44paJMtQ+QpcCEvkCoBlBQbk9PzoVwro8Ig5IniV99d7NprRx5qEOc8+4SXuLggNizphF/kxv4nqgspfJW43o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773963; c=relaxed/simple;
	bh=65t2YV+u7nGpYrt6fCSvmlRZmwzvXuDTZ/2KGVhOeLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m0JRVbjk1elh9Q25A1IXpJZWVE0vjwMWQpYrYK7nFUh0QfTrXYx09mMpiBs14/ZsB76MkeyguaNpScJAG3UcTiot0Gs/Z5/sUzca5+e5o1heoert80sv0x/1rDDYkBvgLdah4do7Addi7BXA7j2vTebEyfr1N8YlJzIS43TUdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9QEI04n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaQFylHM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAAsCBg2548243
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=II41ff+SvutXHXTwYhbHZQEKHES6u7sCKND
	PZnxgk60=; b=g9QEI04nMslElKThs5IT5iFCdHXRXmTFi0jIdr+CdUz1zc8fbhm
	4uUu7nLhawiyRTfFpndcYlKiaBRhBZ+G3b2uHFRBwnEe4aLX7FR7q9sc4irqTbEL
	YkMLmnVCpCZsLHpIYQuEqM69avcRvUmaAsIl99aXveBld15/ZR4WZpwlQij1qOJb
	o3yDRVXz2M5m7a7YUA8rSoc0jQnInd0afah6xSapYZhccL3Za7nx03Wpv+4OcIQU
	VAhIZa6sZtUgrjngFyyVmygqP3r4KpQQA6JGjJp2RTcHNNBSnh07Lh18D4KMPiah
	3ojKghYzmD5TAIQyA9lfY9tuCYCPHcyqHuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab8ea98r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:26:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340bb1bf12aso7025982a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762773959; x=1763378759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=II41ff+SvutXHXTwYhbHZQEKHES6u7sCKNDPZnxgk60=;
        b=RaQFylHMAz9d0lTigmcBfU59WHFQE+0YnV3QtNm15KxnDMQyXlcKBcy5FnohH7UP0K
         CcTYNntwQLNGnv0ZX+0jwIpZ5QSGPXjNXi/yGxyn6uP8a53I7YXm7q4ERF8QhInYw4Hy
         q/fvoFgndFNGSaFFi89E84shWGSBcTDEAWJRhVg7oODPK4QQ5KVZ47qh3IDol4LIV9Y2
         aLDS66l3CL2IbkHpk/YbUZpSrnXZNMJFXspohRvJ1aWvwt4CnaejMbNt8dTdRm1p6Dtl
         484V1tT3QnvwQRyDjBV+Ye+pOizfAs6mvrDnZzvfBEagRJdY3GEvgbDBMn7GR7N0Uo2g
         8q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773959; x=1763378759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II41ff+SvutXHXTwYhbHZQEKHES6u7sCKNDPZnxgk60=;
        b=WHOsqa+ERnfE9ovMFkbUh/CdEF6bf7MExXhfqIrV0UeqVBa9fhkpw5ALoby+uLQmWx
         0+lmXr3BvU72NYyVV8Cdk8n47pN382UyKxHFqreRDsTHCg9rwvU4kMB74uObK27sRMCZ
         fYnNwqGAVj6qPgr7y7ezeJi+s/FYM2YUmo0dsT0p5pYHSaAZGt+Arm85gO8Ou4rcKnPW
         r4kki6bSxF+2YqnQ410MNCiAF8Bxrq07j3q9Q5CjpSaEhwjdCmNh9CFn2dEoRrY/Yub7
         i8ebw2A68PISFtTtKDw5nQpWJvS0BT28i4hu4PrMjbew8uCR/RFGPNaGhy4cbbOW42pY
         Cf9g==
X-Gm-Message-State: AOJu0Yxj+SiUeuscvZpNYRiiEcxeq/wVPqKNxwW7KbHfkblmUeZ3E2Q2
	itGZhSCbt/qDbAznth/b9zsciX7N6+z5g4+0xlW85N3nI9eQuYO6q2dDTt+6ZdgDQG+Jcfy5z/8
	rxlGJfAn1dOVvDP5Dwo590iIq+m/eBetESBu23DTj95Nvb+1c7/Gvi2nNUa/WIoesVIvJ
X-Gm-Gg: ASbGncsHOKH+Guldb4HbdNFh5vrEbF8sEnu4xNCIZ5Zc2M0vy3nFXIo1F7Qm44rTz/a
	PdUy85TZAzUqngc+QnGAqCSH6eYUvzE//PHlQmB6DZ/sWyvkybqvUoEeUudbITNEpBRf5PkoYQe
	3tuplLf6prDUYzq1qp1XQ0wz34r7kiEzz6QvCOVyrmvHBAFn2amAJA1H2Hri4wcy+Z5/y/liLmj
	wBMfewiUc8p8r8WSyVPgv2Q+KdZn967Yc/w7il/JFhmJF8Yi7VOWHkEegKnTqLYCF6zGfopRjGy
	YnXyPvP0i8qJhZ6MTpaNRAJPpMgP7794lhLgmX+MxcWWlf1/fWpSaEeBWOlzU3iv0l38NrgUe4l
	Yo0FsB8TqhslimdyuukGLSjeb71BtUTZfzQ==
X-Received: by 2002:a17:90a:ac08:b0:343:7f04:79c1 with SMTP id 98e67ed59e1d1-3437f047a07mr5788231a91.9.1762773959351;
        Mon, 10 Nov 2025 03:25:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxlrDc8N4hRHSZZ3POhzWZIEuLZPkwIs1KhS+IqqAGFvhrS/Uv1cDfw09eZ649n2HqNb51ZQ==
X-Received: by 2002:a17:90a:ac08:b0:343:7f04:79c1 with SMTP id 98e67ed59e1d1-3437f047a07mr5788208a91.9.1762773958832;
        Mon, 10 Nov 2025 03:25:58 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c30bffesm10390114a91.6.2025.11.10.03.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:25:58 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, manivannan.sadhasivam@linaro.org,
        krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        krishna.chundru@oss.qualcomm.com
Subject: [PATCH] schemas: pci: Document PCIe T_POWER_ON
Date: Mon, 10 Nov 2025 16:55:50 +0530
Message-Id: <20251110112550.2070659-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5VCZBzQqjKqBBRp9sTRp-8NMMK_rldwy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5OSBTYWx0ZWRfX6M3XMe3ZoU99
 KyFTEuG9AssqMjRmuLInwXrA+YCQbTi8svMZkC1vjvpVKYLoAaymugLbONLtMbLHiFcWf3ZrmxR
 beIuHjHK6hixAo1NRpakb9L2GiyJw70CT7PmIabzpglmGy5mAhsC+o7PTYcpKUdgjDgHtlq8Fhk
 a2GhdHXBnOwfooq55ofug2YzkgGOJBw1OGWhb19ZvuYHT6Fxwi2HJHDKTbXLL9A+aiZGvvPjv+y
 1ahRJxuYZUzbp6kn4kOI9g8SRHAemMKhpmoFnLhxqSkQYLMaurUpeMOutIryRqZXMRiPi41YIix
 qpv5FsjobwoXga8PRRNjZTNnwBw78KXc9c73bFVhkGeYrRj0cwktM3BPJO3JLx/gLt4WjcZXjPe
 g+KfDQN4JzAt68FMAJnVDfI1kDh7Fw==
X-Proofpoint-ORIG-GUID: 5VCZBzQqjKqBBRp9sTRp-8NMMK_rldwy
X-Authority-Analysis: v=2.4 cv=QLxlhwLL c=1 sm=1 tr=0 ts=6911cbc8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5cN519QvuxvD8VeTpmwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100099

From PCIe r6, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
minimum amount of time(in us) that each component must wait in L1.2.Exit
after sampling CLKREQ# asserted before actively driving the interface to
ensure no device is ever actively driving into an unpowered component and
these values are based on the components and AC coupling capacitors used
in the connection linking the two components.

This property should be used to indicate the T_POWER_ON for each Root Port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in V1:
- Updated the commit text (Mani).

 dtschema/schemas/pci/pci-bus-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index 5257339..bbe5510 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -152,6 +152,15 @@ properties:
       This property is invalid in host bridge nodes.
     maxItems: 1
 
+  t-power-on-us:
+    description:
+      The minimum amount of time that each component must wait in
+      L1.2.Exit after sampling CLKREQ# asserted before actively driving
+      the interface to ensure no device is ever actively driving into an
+      unpowered component. This value is based on the components and AC
+      coupling capacitors used in the connection linking the two
+      components(PCIe r6.0, sec 5.5.4).
+
   supports-clkreq:
     description:
       If present this property specifies that CLKREQ signal routing exists from
-- 
2.34.1


