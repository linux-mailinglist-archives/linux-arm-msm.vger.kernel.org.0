Return-Path: <linux-arm-msm+bounces-99802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LSbGnKRw2ncrgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:40:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C8320D74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038BB3144CF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E9436BCDB;
	Wed, 25 Mar 2026 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgRiCr7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSrZUwRL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A536828B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774424125; cv=none; b=CSn/Ulf26DMYtiDoK6VxyW4k0lbB4iG45WEVAdZBjpguuZuohbHqGeBFzIjzPby0cIhpmAJ6HUl9BbcvbPfARat/ef8Cb3XdeYNXbFQgPe0unD82PLU3+IbeOMu9PUBcKX6YObtuko+nskdFqd1m10TzS07Hc2AwC3umRfzC4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774424125; c=relaxed/simple;
	bh=rnMA1FHdt96n+5Z/F/ztIUjvAXDoz1qDvjfSjRdv2No=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jCBI/IYgozX+2C77OCJIh2lpWNsPIds32c4wETIDK/61k7S6m/IVdE6E8VKKZuHofcD1lLOpX98JNI6iFUYDZCHQ79fBTDT0br17nw/LDzpyuu0Q/bevJjIz7WCnKYT4k+B0EJ2Rji2C9VX94atsl3IzNaJYyirYwsBz/cqTkyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgRiCr7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSrZUwRL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JBMO3057387
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eWN5vlTiFn9HW+Uy2PK2ok
	+Hs/VyEd9WSFLrAPs+37Y=; b=NgRiCr7S6TsjSiEOSXOcsXfQ59Ute2pxl3i9uo
	cUh1pAKHm5u8XzlwN6bg46wTwZ3Sw91tUmj6eXFe1Jx00QG/CgoMpDvFeS9ZgGtt
	V8sMD3MzsEihpiMCWIsmYsNM3HxdT7q/az6UNW+G67ASn2/TdT4IUCx0nbhDfDBS
	TzJq98GdRTZveDTSZLmFgXeyvaGrTbZ4XTmlbjutxnVzwgj/J34g9JM7FSOrFlL+
	WSfVkRTHCwYyNhX+Zformr8WVBXI6ZsytAaIjooXgmWbhS/AF7Hc+x3RJO6+6LnD
	rzRvhbxHCOKJwxrZXdm8Yeq2r6czSelmT5f76Z1OaDViyCWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp0xss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:35:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c1107da15so402251a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774424122; x=1775028922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWN5vlTiFn9HW+Uy2PK2ok+Hs/VyEd9WSFLrAPs+37Y=;
        b=TSrZUwRLTdD/89Mcs5y82PEpu61yCvOwcb/Mr4IrjWFPl9yDnqgxzCti9ZRLfVhsUL
         bzUIN8Q6yGFElmQ7wZyzH+UWeA86QS0BEMIqyYm6mQMFtzvx1mdIq7NjvnuDb5RZs59w
         rSCZ9W1wJNoUryimZOVHXrv3yWwlP9aofL9K0REUAjHfuX6fyD3+GUH6TSF//hriFybf
         za5IsAhrgGsoOZzau4UcrVU2EO8JTW+h/SQhUWqTohSHh/f25C3ZEJf8V5x1Ht4hwP7r
         7Ng1+KSKuVK5MZwmqVBORljUjZ+tI/P+/LVOuxGiHChlpBQTJ9Spl2Vn1LZSTZUXWr94
         jQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774424122; x=1775028922;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWN5vlTiFn9HW+Uy2PK2ok+Hs/VyEd9WSFLrAPs+37Y=;
        b=JsZScmTsOeVoOgpZmEHFH+48eqpEiNV3Dz6YRHRKXvEGC+k1zDH6+mKUAkL4D0qRrN
         KLFaDHToU8Soi5BGks1jWphy1Ytculfr0Y1ckb8SA7lrBmvSEB27maRrkw3LZaWnxR+9
         DCEU6UcIfGPp63+shWJXFDDC7i65PJ7YTGGkuzB9UDL4xvB30pBkGeSwdz3NAAmtdQf1
         trbjO6mL/+bTdinFX2QensxERPbeuP02Z1fMWFw43TLd/keaAqK1yAhaeOqK4tyemkFw
         Jh8gVU3ta4W36jwU3OufIQHQAOelMfJNZzcWMzPiFMzk+lJzO+UzNeeJ67InghXmWwvu
         ORxA==
X-Gm-Message-State: AOJu0YxQGHz49Ex8UGNZCYKBfOY79Dt9sbRWAw5WwONzxCAjreUBZggs
	RjZbqRPECXKD05kHjIJ+vW4K0PirPblMLLU12jnDa74Kp4B+KG6z/ubDjijlL2hIwvyVwwX+U44
	rLZInPu9YaFuv7ucfsfAZ+YbdxyeadtCz1kiy9Sb1PBIXszmMVyZZqi5GHh3rr4JgL0M6BlWZHZ
	X4
X-Gm-Gg: ATEYQzxSgfi8DmuNYNmMrqInTC4bCeDc2MeRhutfvy/quzyxKJVLaOH3mQ0VoPltjLQ
	KmCMfhTLoY6OEflKJMyZMKSUh/Jc4TSp1+/4BLcS2JdwkC1Dvsi0ajkS2KlRKUKPNgU4BJyISog
	EgcWv9OM67mkOD/xDWuugwIvP3weWh4W4Zxao2C5kGMpmPIkbGPTNvgW1/+PmNMN10qaXEydaWh
	PalUIs4AwrW6s4CmAaGAsKhWKTXf357r0epd922bpIo/Ss8HrrkCgWCXZrQ/KJaxMY4wAOI9GTs
	dK8pn0e8B61B5eOj7eB8Dxw/7xtJHGpVU+4M64aHpLDt7gCO4z9UpP90e3Mt5pKaK8IvB9rAvcp
	arbr+7Hc43sPwQbVi2iTtHkKKypasO9qWq9aAeTOz+2ZuNtmNRESU+y1ofkhGE7kLRpD846OlcB
	h2oxEQoVO98aIcrXNw/X3xHMZOsGJ3Cze6duIDmIekO3OIcLWagOIxIk4o
X-Received: by 2002:a17:90b:1b43:b0:35b:e4d5:dc71 with SMTP id 98e67ed59e1d1-35c0dcd49e6mr2351329a91.14.1774424121656;
        Wed, 25 Mar 2026 00:35:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1b43:b0:35b:e4d5:dc71 with SMTP id 98e67ed59e1d1-35c0dcd49e6mr2351307a91.14.1774424121151;
        Wed, 25 Mar 2026 00:35:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03206dcfsm4814629a91.13.2026.03.25.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:35:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Date: Wed, 25 Mar 2026 13:05:14 +0530
Message-Id: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADKQw2kC/1XMQQqDMBCF4avIrBtJRlOlq96jSDEm1gFjNLHSI
 rl7U6GLbgb+gfftEIwnE+CS7eDNRoHclKI4ZdAN7fQwjHRqQI5nXoiK0bxIFPy+jtYy3SMKZQS
 XSkKazN709Dq4W5N6oLA6/z70Db/fH1T/QxsyzkSNuqxUoWXJry6EfHm2Y+eszdOBJsb4AX/yo
 96vAAAA
X-Change-ID: 20260317-ipq5210_tlmm-df221be105b5
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774424117; l=1505;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=rnMA1FHdt96n+5Z/F/ztIUjvAXDoz1qDvjfSjRdv2No=;
 b=tNx0j+MNihk/1BxkYrSDSUIv8s51NjBDo6BZ+Nl9MhqJcxPjyITk15mSQbHvKl/F2hog+EHg5
 Vs84kCDTWjbCxm1p6emGguxAx3k2KQjQoMiHT320tedDzjaJ1ervmzj
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: NS20kUFx0qr6nx1EFx4IcqK4pcMW3eC1
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3903a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DebfbtQ_iApC_oJ65UMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: NS20kUFx0qr6nx1EFx4IcqK4pcMW3eC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1MyBTYWx0ZWRfX3uSfdBxGPnIK
 3vqZIFusitLYRs7OCrdFG7oFuj+nKqDmrmsu59DZzka3TiS6km8eM3J6nlhVBzfe/NE7Uwmvl+a
 BedonQDzNc2eVgibMgmtxc0sqaNxxj2A6WJy32jIimajdTKFi24DZ8wigNBJszxsTGMrND9YkN2
 2W+xKheILYY+LqY2RyRZa8GkIWo7xSiuzcs6K1NlUG7pXiqEOZ+Lvq5EZq4EKPgJD0Viqwoje7Z
 hFnSZv3IXS2JCKGHdiI0ts4hrV5udGrGl5viJPeeXu6apyekZAAAjyYP2e1TFEBLEGcmew1g+jR
 +Ie5+p1SYi2M4HEWWFCnIhtVb6SVoLZSXBdFfZfl8rEEQfbxG8P4ij4rWZkFeDqB5AlEzLMV4UB
 ZC7KuZPJscZLbPliLIkeGV36VKftR42f8KLRb6PIn3JaOY9CAK/LBptGB06sM1fjqqRY1fG/gEu
 Dg/Sb8Ggh+kmWJyoM8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250053
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99802-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD3C8320D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
  confusion
- Dropped the R-b tags due to the above changes
- Link to v2: https://lore.kernel.org/r/20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com

Changes in V2:
- Split the TLMM changes into separate series
- Picked up the R-b tags
- Grouped the led and pwm pins for better readability and usability
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |   8 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 898 +++++++++++++++++++++
 4 files changed, 1030 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260317-ipq5210_tlmm-df221be105b5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


