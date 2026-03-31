Return-Path: <linux-arm-msm+bounces-101122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AV8M5AWzGkeOQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:46:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CA37029A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A5C230530E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5826F38F92D;
	Tue, 31 Mar 2026 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loDEkO9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WR5hvfoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D719338F93C
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982702; cv=none; b=Bkn+tHm4lz2JM2263L6Q9kVRIAEyiEsQgEukKn1iojIJLCTU2USJT68yxM2YsSFiqkJQkxc7Bnsg5HKv+J3JxFcYLpSfxYO4QdAlj1nKLIdY81MVSDETBczEFQoDMZBNxuXosxUeEVwWKiib5DMjZ+8z7v+y2PW4b8gkZ0CCQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982702; c=relaxed/simple;
	bh=auldL/PZcJtISAB4iXpRTm7KDneLIlTOQCtFwhlPCbA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aZ+peIkg/wmEs7rsubqxXRlWYqKVpR+KEoXPJF/c4lY3N+FC427GOUp/rK4gAs+IpjYtGOv/4Sx4UkHkTlt1sfogG43UQgePvb9G7PVLAed3zgIpgw0p+w2qxozLE77P7eAHCqmuFyG2ysjbzxv8a6ySI0tHFPEQalncKs6tCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loDEkO9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WR5hvfoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VIGpH63081342
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V73Qkgo5+m2ZEBv2WumRcr
	lVesbrRNCRgCoAU9LhXvY=; b=loDEkO9iRmM4AzBjZ2Lgb+Ff4wQlczpU0CjYCr
	jkVofG9HqjGHxtHeDPdHEB1lUY6UdwG2iCFGW3aPu8+Sy7I9f6ncVUUgTUzxl83l
	SIdIIfxX2qiUVn/ppHHnwxrZN1NmUNBwvRfq8FktXzR2WwWpiIcsRfNSz+rmS/N0
	c40DpGzARJoAenOvFLJy5nEcu7BTNtRvbtug4o1RC8R6WDTLrQBajPUKgUoZUslO
	Vr+OaUaUAsdsehFVSTUSYFyXZe6WotMVAD0e0t3r5vmvw/i0YlrdgPkbHLqY5mUp
	a04QDIX7U6/DLr8K2vUA/S5Lb+fM6UKB4U28xT8+iAn718FA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkr3dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:44:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ad30f8fe0dso18014235ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982698; x=1775587498; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V73Qkgo5+m2ZEBv2WumRcrlVesbrRNCRgCoAU9LhXvY=;
        b=WR5hvfoN4APsERMOcRx4a2Hvj9FgjtXqAFphOUfjwi3Sy5WvfOSv4f4KtDxGVkH4MM
         DroCmGfSADIdtupdsyGepI98WGp4qmZcDJABqMj7zkTX3UG7nS6anRW7xla+mkC1BtgO
         B04wVg4psJd1PeMSnwPrdEgJ/FQXUIxCCZfH7G+IenBJeXfXdiicKsD0gJf5+GYZdkjo
         KHc+FVsDBoj4m4yGmccmvhwafdX/m9aUxjlEZkh/PvNcEOZ3kOeMUpcEHQ6WN6H/te6c
         /Izt1UlpjJ1wVHzuwX7a18Scw1AKJ4Zgr0M9jxewJqXDj9YyNFKLfQ5R9B3d9NbttAAT
         2vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982698; x=1775587498;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V73Qkgo5+m2ZEBv2WumRcrlVesbrRNCRgCoAU9LhXvY=;
        b=O4mkmHGBc5LZJPn+Tr//sozsJf4Fy6xA1ihEfpb9+ifvD00Ywp8VEt5oZlLlRt8of0
         yyIuLiHMFBNulmtrKzq2bGgcJu37CuYTXzvidvLFs9TcaDpA9R41GrgiqSbboSMXJknZ
         mcB08lSbXg9CJc9KtoXULwY4OUC9lLdLKPFdTQQjfq8gMGoGz6IMjNfVKc+xQl0ADvgg
         5Xi30kQzRbvfwF0Mxgk/Db8Wi8xjPj22sIfn73RuyrjOK05dyGUkzD/0KRmoZnkf41FS
         l8fMhMrTqZSpRIAWZLma4B3tELuSdYjVjpBYDxKN+vOJYIhLjmZx1I/uH5kUwXwPh3D9
         xPhA==
X-Gm-Message-State: AOJu0Yz5wmFeWp6Yoofn/rUY+hFj/Vt1kP7kovJJQtn/+lrq4M4Hl0Ve
	9q3pViUQmwcIVfpg4tkZYnXVqADzdsEVKgtfGZAEqJuZejWGva3UzKy9/yaa51g+NQH8ieZJBR4
	WoVFBaO7JOZwp/j9X9lPGC4Hze5LkWjhljSTrqUZW2g1Cz9euueXuQXLqQOUCj4FhVLkC
X-Gm-Gg: ATEYQzxpdjowydA0A03S2+BY57oWtC8lnY276JCZd0qvgdta9jC/RzUsbuRy9jG1vWL
	eFPnvMi3bDlCG/HF6KTWrQF6At6XqYYaAJUyaDO+hTn8CsNYYs29MTv8Ue1sOFvW5glRdx/JE6V
	ra57gQ9s6GYIJlLKdqgPfuGST+vA/zfI7JwwNCoA/afj1dZ5sQovDSHcuoowbmTwg67GsDrnenf
	8LdZ7HulhiuuPNRCOmIdgbk9LyPVUpG3pWScpIWCrn95ocHOE+d5h+cI6B9EB1YsYmMBawmcVyg
	7aDkAsRwlxgreBsy71na1jmaT84dbHwTRuzChgLfRZheb11G/r9eHdNRn4XzVeTrcnSE/r53PzW
	GCyKG8Icfez8NmbYACj3V/nra3SpzKMmfNcxKczxKee0vbxVGWWYl
X-Received: by 2002:a17:902:db0c:b0:2b2:46dd:c3b6 with SMTP id d9443c01a7336-2b26998e8b9mr2205975ad.0.1774982698359;
        Tue, 31 Mar 2026 11:44:58 -0700 (PDT)
X-Received: by 2002:a17:902:db0c:b0:2b2:46dd:c3b6 with SMTP id d9443c01a7336-2b26998e8b9mr2205815ad.0.1774982697932;
        Tue, 31 Mar 2026 11:44:57 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427af930sm153284635ad.70.2026.03.31.11.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:44:57 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Introduce support for
 Monaco-ac-sku Evaluation Kit
Date: Wed, 01 Apr 2026 00:14:41 +0530
Message-Id: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABkWzGkC/32NQQ6CMBREr0K69hNa0iKuvIdhUctHKtJqPzQaw
 t0tuHczyUtm3iyMMFgkdsoWFjBast4lEIeMmV67G4JtEzNRCFWU4gijd9p4wDiANkDDDKpVqqu
 VLEtpWNo9A3b2vTsvzY9pvt7RTJtoa/SWJh8++2nkW++fP3IooKpbnm60lBU/e6L8NeuH8eOYp
 2DNuq5feD08sMsAAAA=
X-Change-ID: 20260328-monaco-evk-ac-sku-6d66f965335c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>, netdev@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774982693; l=1361;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=auldL/PZcJtISAB4iXpRTm7KDneLIlTOQCtFwhlPCbA=;
 b=rogm1kseHgtplfJ+xCyPjtSwQWfv3XCXx/qFoXKXvzLxW1LG7L8JkjkCwt6hQMPK5gshrHepp
 lNTciq4qgw7DX0YNv5v+NydHVRhpWTWEghMcAJ63m3exhGgvMPrkVQy
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3OSBTYWx0ZWRfXxsm9wfNlZXTM
 RdxA6ylsDMPmKAog8eVqnqWOo8iCJBxr+eKsy/h2CefyMZT29jmp89tJ/sRchnYHfntBRUV56Bc
 0phlXygt6wD6MdMofgRJ6Vlv/QNtjopTURSmunGW1m82frqQkxCAlkQ5XspH8Kk4EcphxOvEs3+
 oYYSHsdZ/0UN0AKAbaVucVsZEUogzwSymcnuGV62leoTRUsUVfGkQGX7JPKfIHjgG2IrZOzNi0w
 FeLOITikZ/i/R0LWakEXqYwJ//DG3sv+q/0YLayuMWKwPaXP8GYBd8dHe4n6RjNo11Z0tqVofRj
 xO6X4AdEJiSuZi4v19TtH6YbPncZGQdDb0ZTqgXQSlJJEmCn+je8uloOXKuRGxAgc7+PDJiiA3I
 2lvm9j+9pslPPXjxjUHCZciQLN17rl/R23nzREUkWlQH3Ru7rZm8aDa5a/H7h3ew8LkkCWqj7HY
 L015M+QRvWBbnC1jv5g==
X-Proofpoint-GUID: vFAux1l0ML6W_GIfUmEbZUeuLRiBeCrk
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cc162b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=4V7GHvCDef1FtlI4rEYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: vFAux1l0ML6W_GIfUmEbZUeuLRiBeCrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310179
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C2CA37029A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Qualcomm's Monaco-ac-sku Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac-sku EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
Changes in v2:
- Drop keyword "sku" from the compatible string of board bindings 
  - Krzysztof.
- Wrap commit text of dt-bindings change based on upstream guidelines
  - Krzysztof.
- Link to v1: https://patch.msgid.link/20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com

---
Umang Chheda (2):
      dt-bindings: arm: qcom: Add monaco-evk-ac support
      arm64: dts: qcom: monaco: Add monaco-ac EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   1 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/monaco-evk-ac-sku.dts  | 730 ++++++++++++++++++++++++
 3 files changed, 732 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260328-monaco-evk-ac-sku-6d66f965335c

Best regards,
--  
Umang Chheda <umang.chheda@oss.qualcomm.com>


