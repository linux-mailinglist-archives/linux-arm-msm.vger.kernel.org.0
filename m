Return-Path: <linux-arm-msm+bounces-118910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kJxzJmG7VWqOsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:30:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 93829750DCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:30:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f0kelu6y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QQQGZc9g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118910-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118910-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89CD2300983D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A462E2D1911;
	Tue, 14 Jul 2026 04:29:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2382D6E5A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784003369; cv=none; b=IXs52QvVv1q6xIZxkXGgrfXiBPFxFf1Y0nhyZAcpT2t5s66g3c/M86JX30XHH/zk9Oy6H8mBd4rNe6jI5M8nDiBv3lQiWq45Gn6A5fx0G+daQGcXg414xeGgKHzk5rnm8NsVyznDGn+At+UnLWi8oxbxRl7oARWFrT9wjvO9ecw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784003369; c=relaxed/simple;
	bh=FrIKj3vvNeDjpix8chaiPLXOV0/kj+9D/ib8oQufLJ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jReglWxYsCetyuQa9RJQb9686BZjRRmovwNYSJpW+thqd18XqKX3R9/G2+vdKTYWNOzxAlyvAJsvMe1XdrvyPSCmm2QFbp9YZ5OMli+kdhfqPUxJ6rZ2AmGvCPTiF0a21DaEiOkHBdl+gyiiS1HtHf7VWP3jHlTITgb80bNo/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0kelu6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQQGZc9g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Wtc3417725
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=isqwXB0KW6zzsJByAXMJuR
	HwUr1zIuFFgmnPxl8189s=; b=f0kelu6yaU8lkm4icVG4/z79NoghOoKnODRRQk
	i1xW3BDEs7U2n17s/l+uFq0W9gqpFe5rR8INUc1AhjEkkPGj7ZY206ZXOXKWx4jj
	Y0GVa2zsejawGfLoW1L3ttrA/4Wt/H3dHFuCPsvHZq+sroOgHoFpgkt9QQ+LBBwI
	ItuRdiKM61lfPrrhXI4SYk9cwhjny44hlQ40TMJShP+kfTJVqRj4kJD5yAsg9C+S
	dTJ7RYWz57jpUlDaKCxyIgwppkdBQTy/D/bvh4zWjwR//T0F7Dv38LN8aIkfrVXP
	FL65BHHVdBMEfkXAVvW/yR3odwQcCfCkY3mztUvZT/ZwWFSA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j1y1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c891ed872ddso6828194a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784003366; x=1784608166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=isqwXB0KW6zzsJByAXMJuRHwUr1zIuFFgmnPxl8189s=;
        b=QQQGZc9gc/tYCnpZIFvYd7SsLKMvcD7rVHRhuP4FahfaZJubNDoa2fgUQnFL//Eq3Q
         wher04FFfQ3XZXNwKX0A+eDL6E+kUcTGevZ942PZnL/GUV7qjy+FAUpFwVgiFYsVhsJP
         fM0GU+QPLDmlTJn8R+ABluPcrjXmFdyJQguElKOpr2YfTssag31NNt6cglP4h69vngTn
         ZGfLE7XrczizBQEYFioY3J9veA/aoq90w+/6rjYsLo3nYeTWZ8bNDPocjDDhIZlKir1F
         vE1a+UWbdPpYMHLjDSISQ5qUjCrbf1nNju53nx+OI63vEDsL6LZoBTbjaFwPTTBVdKBd
         KcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784003366; x=1784608166;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=isqwXB0KW6zzsJByAXMJuRHwUr1zIuFFgmnPxl8189s=;
        b=UH/lWXDoTod7OaZuAcSUvzM07fZkM52uLhXtikmhoAoHaeFAi0ftD3XbdFwr95vnZO
         3dkV4buiTLSFy6sLYl9BVde06xBYaaF+TRu2fz+brbbM1qv+qpGnQWKm9hYtJ5IyNCzV
         PM4UbnmdR97jNKzdSdkFlSitfAJVVc2BnnighDaui0f5tlcPqmTVyJaaEp1rbUOmPjkG
         QMDVbRJdjHpBfQ8MFY+12EHhhT6y5/CcSmAEn5Gf01bTK7dTMSofvYC3P0lvN65WC4+w
         sUYJNdyVp1+K9TAconVAJg8tCqrN0l1gUuS/+i0Pz8Yz5D3uMpGDRNLxZYkncu3bCXYd
         EoeA==
X-Gm-Message-State: AOJu0Yx4R15io9vJIbb8ztdRKQt4WtV884gcDQ3gFpzzRbApDH0OnDbB
	e115sEBKTfbP7TJblnghTelg/++rFz5wnvNcxm257Jw50byuNcAjWXHRco0t7xtXwmo5yvWpfrd
	GIFuzNY2K2jh+5t57nLBqpZ4vtN9kOUfjWVeBn4QoRnT56PlyYZsNM7FsI6EYe47QdrnG
X-Gm-Gg: AfdE7cnXpqXAVNNn35NGkWxbtnthtM6bO98nkhP6fdZgNYTyXor0TD/2H+4hs4GFBE4
	JoYYsq1WZ+SJHXdNjG9Te83buB3PfQraFyoyUsi8FCVnxzj7nGE5gj8/mmYJ8axbMgfCCrwJFec
	WZS9VDGIb5YG8Mz0/lrKUzFUFVA92QfMHj8jMUZqe5f6g2uhbyTQn4qYE9s0PxvsxAHLmlkp29A
	xACWhX4bXqVWlP5ytKbO2FYxDMEM/Dj/vfCfq1he/YfnV1LYcwP1Gt6tD7i1UU4ZYwOTNWZ2nC7
	qSfv7buHzy9gGe2eX1tt6tXif1CjC/Ux7eZMdMIRK2CArY8vCQXHCkb9NIig0MenZp34DCCPqZ+
	1wLcRLPMD4nptfa9ZOlF8hLPjNbNdNt+N0+LUhcZ3487SWhJXevmfnV2U9NsUcMWFo0yAK3719z
	00u2UcYqgI595KNE1UnvMaD63O0T4Zz/C0XSxY7iVF7kz81g==
X-Received: by 2002:a05:6a20:6a0f:b0:3bf:a8d7:4f4a with SMTP id adf61e73a8af0-3c34d71984fmr2286043637.40.1784003365901;
        Mon, 13 Jul 2026 21:29:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0f:b0:3bf:a8d7:4f4a with SMTP id adf61e73a8af0-3c34d71984fmr2286003637.40.1784003365481;
        Mon, 13 Jul 2026 21:29:25 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm64388999eec.6.2026.07.13.21.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:29:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add PCIe support for Qualcomm's IPQ9650 support
Date: Tue, 14 Jul 2026 09:59:15 +0530
Message-Id: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABu7VWoC/1WO227CMBBEfyXycy3Zju+/UiFkr9dlKwEhDlER4
 t8Jgd4eR5ozZ66s4UjYWOyubMSZGh0PS5BvHYNdOnwgp7JkpoSywgnJaTgFa8R2AELuwblkQ7L
 eS7Ygw4iVvta5980zt3P+RJgeG6/GiKfz4pmetV9N7FaJUf8l22F34VYUV2qvjJcQ5579vffNy
 fDDEQAPQSsvtNCp1Div93JqyOG439MUu4zobF9M7bXMIUDVTqWK2QhfdPC+WpUsJMk2t9sdzOo
 CYScBAAA=
X-Change-ID: 20260701-ipq9650_pcie-8c77a69a6881
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0MyBTYWx0ZWRfX4cIzTSj4tKqo
 7pYnZo3xLphfRl9Og1Fk4uMP8jOIJjUo4QbKGFdNgpakJ4jyvP5GrV7FKn1m1k5u+qvrSmF9FK+
 ny/1DiNOEeqEnyi0HlnJHQFYKSyDiCE=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a55bb26 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8PoG6d3iB0iVfgPWr68A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: tDC7IDLnfBJDQH8zJmrAQW6nLk3pgvT2
X-Proofpoint-ORIG-GUID: tDC7IDLnfBJDQH8zJmrAQW6nLk3pgvT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0MyBTYWx0ZWRfX+bL/qVj9o6l9
 HTOnOK+KoJPTfoZ25plzd2HwPyPgZExwMOOg21ynm3zRK6b99VcuzsVqJrQk70n2xqpUjUdcn7P
 gMYIg6g+e6FiXe4KG2s3ZFxLj2InKI5r/Cu1QBkEfisxbR7JVA7tN3rrUmbhSRwVGtKxt3Q4MEL
 lcS/AwZ6j/9LJZjZYBBV7M7tqwgspNhVslcFbjCFsr8P4oiqTR/0ea1APrl5IVi71gDHjfLiU/q
 p4ViSa4TSo2GNhkAr9IGNWNz2LIkHXpOsVjS4TjU2DWZkkc5jKJ4/cjjHs0/9ZyiMBbTBPOHNBp
 4IBLNn9y06cH5pclgai6vfnE88gwMDZDb8TUnXGl9YeHO9YOKUYi9uSkXnmlxkNEQUL0/Cs6/0W
 SGeQzjtRUqdnyEqL4SR+3ZuK+dLYiVrPFwj0tQGzD7BAmGQYOU0ZQNcIQKdM7bfZUMIUWgrgCQf
 jKDWYSCW28kxDqY4bMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118910-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93829750DCF

The IPQ9650 SoC has three dual-lane PCIe Gen3 controllers
and two single-lane PCIe Gen3 controllers. Add support for
these controllers and enable the three dual-lane PCIe Gen3
controllers used on RDP488.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq9650: add the PCIe support
      arm64: dts: qcom: ipq9650-rdp488: enable PCIe support

 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts | 119 +++++
 arch/arm64/boot/dts/qcom/ipq9650.dtsi       | 665 +++++++++++++++++++++++++++-
 2 files changed, 779 insertions(+), 5 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260701-ipq9650_pcie-8c77a69a6881
prerequisite-change-id: 20260521-ipq9650_pcie_phy-60d7df32581c:v3
prerequisite-patch-id: 0e1655d496f2d2f3df84eafd66ddfa6d7e202f3d
prerequisite-patch-id: 46b42b118c95ec605f763f3f4bb3588c2685166c
prerequisite-change-id: 20260519-ipq9650_icc-994280404adf:v1
prerequisite-patch-id: c601bc5425e90330caf3faf758296ecf364b54a4
prerequisite-patch-id: 75fe7bbebbac8801823601f17d55ba0aac29eeba
prerequisite-patch-id: b651a08f6d6933bf8ae06f3e8a7d1580bec5cd64

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


