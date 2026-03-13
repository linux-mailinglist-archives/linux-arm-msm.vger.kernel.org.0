Return-Path: <linux-arm-msm+bounces-97571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGVvHpM2tGnTiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:08:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE709286B14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54624302D5E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BE53B8931;
	Fri, 13 Mar 2026 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K59+m8ju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1wtqZdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E7127B4F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417806; cv=none; b=OgYn0Bw4D4DeHcOIR+DJO6bEmgGCHGh5H2kNFKP9q82CD5T6w3+edqqRh43rQfdY1lu6VChnWEIkD6f1XYGzToQHBoo02WrXNmg9xNYtoTXYipr9SoYOs4YezhrkJZvjTa3cyEigsAhH6hFgcoFY5fQzqnMHW6bQmFj/Q2M5r1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417806; c=relaxed/simple;
	bh=NlBzHmF9XNuzGZI+9KiYD5s0IEAX8PCjpWMTiCzFRU0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SMlR7mYw74AzpjeSBq0Z0XqnuEteYqy0xOJzcF0Hf3yDIInI+kF4xgK3UbaCwGNYALS27bxMvAqmTKU8k1wSYExeTMBCm7pTt4phEghvmV0fJgb1cyf2He1WU6AZrJv6Y/2odwjfkflOYkhjF1yR+kWX1vkftnxcsNSBGXg/yXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K59+m8ju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1wtqZdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXIkf437804
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fCSH7YgfuRw36PrqV4M0ac
	50v20gIybCGY2rKsjERRg=; b=K59+m8jukMaNIiIht5OwPoiHEIOfm+/o86Q1nA
	ID4xDhVtdGMI9m44Ve7tDVgCWJw33/1pYk1ZEihGfyZWOlXI1jFAQ042YK3nkBlS
	fC8cFm5eLOXrRNXh1I7/6S4/Nd2fpg2W8Fnm88Rt9tO2jzvnYx+DrSqodhxghKhg
	cZueGWS4gYaa98O/krKBhEzsHr7/1hh8OLzN7F0DYRORt4xct1iuQEXbJQwHSSSw
	BXiiDPrb2FzTQHYKNFawvrJNpp46QSRCcXTaC8+IpLKDplTiGwQjG+cDqXKuPuXI
	psl+cY8pr8qmbutqOXpSqLuFmK4E+GMB8soY5m1Js5bh5XmQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax839e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82988b04c5cso7279603b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773417802; x=1774022602; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCSH7YgfuRw36PrqV4M0ac50v20gIybCGY2rKsjERRg=;
        b=e1wtqZdUthpQTK201S0/hkXHEbRXNosoLtLF0Yq2gJGrr7Z6ZNkh6LGYqS1wwM//oP
         WQ52XsobVomJQl31FEBRPLeQfFAXYMZIFt94buOJieoaJVEdtREQEqUQv+MVXBa5KXIb
         nqAUyrSW/wmqgjifK80AdSZS4hIp9SqSCmnBm489W8CY49vFn2bHC9OfzKUU9pPdHYZi
         /fuHtkeZ2a0G32o/1tpPb8gxi73oPVlLo46/q5aNAKlVf7vf7Neb3sPgo98qq1KR8C6E
         cXo8xlR1rRyyjpa/3U/XLZo272NBukpDuxs5b762tlWeoMXJtutJ8gzFJqPKs9h/THLd
         Ymgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417802; x=1774022602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCSH7YgfuRw36PrqV4M0ac50v20gIybCGY2rKsjERRg=;
        b=ZXSSWR/qlorzL0AsZm2lXhsZe1yeR+V9x4NdoPsxX2F32KkvgTLvRGdQxKKkDsePD/
         iMlP7bmIWzSjpWwHHhqxYPln0kMdvbY1+N3uMuvY0ppiTdmBzuF5ZH+Tp1ApWas8YHXB
         TfCM5WM1aF9+3EAjrPWvIxAa7+jGplJpt2YFr8qIxiKTgXPJi+ORQWv7lAo+bYFf/ZXD
         MK0XzzzmIc0AzwDQZWNi7JIcWXqVuomDjqsK/OENAceU2TYDn2FM4CNP+er8ZiUFxIe4
         Cx61V5zjxl1C6+4TkBn9uUYxhQ81F4izO3jA1uUlReQKDIhgIRh0dlFUbeh91KPH4rdc
         60wA==
X-Gm-Message-State: AOJu0Yx2UVUNME/kgeDaNbDPaJfeyxvZVzD553adCYrgm+m3mSaIQj3A
	jPDMPb0RSM584yc5Uols6nNzuejBJ1Z4N3ayu0NkNeg+QnUc0zE/uUO3Z/Rk3bKXO0k3F4aJ5nU
	8+LO5JhZKEQpva6sjd45B+wW8eEAlhhrRLWbsiDWzwRYFM1iRsC3rLAkGavP282ux/7k7
X-Gm-Gg: ATEYQzyIylMl4eBuhBOuhYv7gAO33iRYK3Tl7MuaLxJUvkYzPH2GnozEYrAOkDwqM3K
	iBLQQZxf7utw8OGaODwuwGp98twSgZrrCYwwv4S1RNQ+jJQvdnbmZU4yvQAw/stKR5CygWMzaXm
	ddta1dvyFYUo03O7yhs6j5+iQYx+4e55Dvljs19M2So5X2GcVBX7YfEXLWwVtcC9i+2yMYrii2h
	G19IPNmc7HAYvcAveYN5eXPrgOVA1LN1OSCkoRFnJPydH+5onDIGUEvms2aDbfm5VDK5SrHkdid
	oPm0kKyDPhlkYCvMzovFpzJ5I4phvV3E5BWkLm87KCKNaBtMmZ1lCx2EAgZlw/rXZYXQsnSAmse
	LiUbVCOzbfFDDl5SEvCsgB7djgUVLQuSZiAA1zXsJalc0lJt7Llb7VW9egkkruz51C8Zr0cYcV6
	H1WdrSJIDS/Oln0eMp6ayPQYfKUUZsnBUvLl3Se1WwVFWJ3P1PQ8Ka9yHV
X-Received: by 2002:a05:6a00:1a8b:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-82a197081a5mr3553233b3a.20.1773417802011;
        Fri, 13 Mar 2026 09:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a8b:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-82a197081a5mr3553181b3a.20.1773417801283;
        Fri, 13 Mar 2026 09:03:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a13a2f2d6sm7617470b3a.9.2026.03.13.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:03:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add SoC IDs for the IPQ5210 family
Date: Fri, 13 Mar 2026 21:32:55 +0530
Message-Id: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC81tGkC/x3MQQqAIBBA0avErBNGK4OuEhFpU81Gy4EIpLsnL
 d/i/wxCiUlgqDIkulk4hgJdV+CPJeykeC0Gg8ZioxvlWsXn1RmNs0Q/8yqq73Ah3Ix3VkMJz0Q
 bP/90nN73A0c2RWlkAAAA
X-Change-ID: 20260313-b4-ipq5210_soc_ids-750ae0f2cb61
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417798; l=1130;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=NlBzHmF9XNuzGZI+9KiYD5s0IEAX8PCjpWMTiCzFRU0=;
 b=4vdnH9WPpP9RRt31m+QeXhPza0xBq7YHhH4lmePTaI5q/F56+Reo6yrorlQ8k0gD5Gshx84U/
 43pALjDVrQjCoeNG27xR5Dmj2xu8AB5UM6sy5j1g1D5jfzBx2fDNuru
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: oZpDuPkfpBBYe1nNrYLtLNaczARHFKN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfX1513KDhqdryO
 +iyZ4MGeQd74XM2g2ytIvRJ2B9x0qoEkrEAHIQmJqdzCK/me+XeYvZb+iJi/v1MSrYZ5R0RD1CQ
 cc5MZoiq4krjo8UlLpuJE7DmnqQLX/uKRwDCWvvjLVlFRb6Ly3pNSKDxmv988MWO9X+wzTwKVNQ
 HIP338H23az0z+EGR1mEtSinLP60sWGAWBEgS/gJea/Ukw/cmw4hnM5jYeDQnAhDCcKgwIwIiIG
 Fl/iyksyCmyAuklR/Jls10YGpy3WcSWfz2c+klZI+JH38/UjoV0Wdsnfm9k1rnc7/HLWY7+ytz1
 sXWmpOJ8LOMS/egNsPOnvVgucVTMgfUmsZ51CmXf7YF44PJAHJ6sDYDHHQqfppNvZnN41MMTfe+
 1lD96Wkh0qAy1D/AhimQ4eV3KcvYH2bCaoxuIh8vNO8wQfDPCDnK2Ks5XSHTNbPbxIv2GG4FrF3
 MDLC1WTq7cb79UfdWBA==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b4354b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oumORntXeR1PY_SrwCQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: oZpDuPkfpBBYe1nNrYLtLNaczARHFKN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97571-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE709286B14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SoCs based on IPQ5210 is shipped under 2 different marketing names such
as Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being
is F8 parts has the Passive Optical Network(PON) interface which acts as
the backhaul where as in N8 parts it is ethernet backhaul.

Add the SoC IDs for the same.

Qualcomm Dragonwing F8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/f-series/f8-platform

Qualcomm Dragonwing N8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/n-series/n8-platform

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: arm: qcom,ids: add SOC IDs for IPQ5210 family
      soc: qcom: socinfo: add SoC ID for IPQ5210 family

 drivers/soc/qcom/socinfo.c         | 5 +++++
 include/dt-bindings/arm/qcom,ids.h | 5 +++++
 2 files changed, 10 insertions(+)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260313-b4-ipq5210_soc_ids-750ae0f2cb61

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


