Return-Path: <linux-arm-msm+bounces-101407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEPqImDVzWn1iAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:33:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370B382B85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE909301A782
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 02:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5BA2BEC4E;
	Thu,  2 Apr 2026 02:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAdAnhQ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LF4UcOgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0D19EED3
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 02:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097095; cv=none; b=VczP8ifK3BetH6NpU/BnoNuGsSKGhhCs4NU4YvviJffXm4hzfKL1P80iJF9cP3ruwOnBa76nQwVxr5cuY/BmGW0IO3f6ecpG8kXD/mQcfhANR0YgJ0waUa22X51Du7JHVLLy/bKRtlQYvMmr8yccapfc02OphwAoiTsnJkuqi84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097095; c=relaxed/simple;
	bh=vgPRnuPH7ko/CMXVyFPIBOZ5z7rx9s2UDvSpm6qn8as=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ohj2tGFJGcfRUcH1iwnIUZ2xWfzQnWz3Qp8M1sYGYLdG3900t+mmWrifmifLU1OdAEEF+tq+1PihBARP4fefjrGBe+ZNGZOfBiQs7ZIHYShgQadPZkRVtdSqZxqM3Z+EXV7ElYPB8q2vXboSTDjRF4/4YDVkQBxRg2v0GQgvvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAdAnhQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LF4UcOgK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M3wOh3745837
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 02:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7ci1IOeOnUC117Y7WLTsUP
	3giOCURHkZyf5emfHJurE=; b=AAdAnhQ8gVH4/j0NdHTFCh1QuacjoPAm58U7A7
	eYvoxyNE0X2Zrjmlvmd3oCG86UlpObMaW96JsaPOJUj8J1p1miouDtsNm/ODNVno
	sf05ZYY2SXecqkVrZYlazJ0wGUO89rmN3ntV597SCNIT+OBgzjpRR/Ai+YGpvKZg
	x6NePe7ffVQwSibETY5vQk98zGFX+2vEsC97hb4P4fR1UdwpycgYRH+tq+gb7dAJ
	5pY5cU3O16WcrCJN8Zj0haV2TuYszHOR2qUma0zD+25HU7xaNvtqQqQGweffuB3Q
	WjhsSGVbW2ktSidYDnceUIi9STwE6aV5joGYCs4QU3mCiC4A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324jyw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:31:33 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-467e8aaa943so751207b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 19:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775097092; x=1775701892; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ci1IOeOnUC117Y7WLTsUP3giOCURHkZyf5emfHJurE=;
        b=LF4UcOgKCiMNTnGhvZsHfnvGKb4SCQAu9r/E8o87i2q7n5iCDKtwy+vc73sWm5mG3h
         y3NXONi+kchzogNnvjre/JaAcCDZuLN7nImmYLmowUCPpMavhhzV9XC9em/8CZBW0Zu2
         5Fd+hE1ZVT0mYPC0CrqYAwyM04PIAuHKOfV9H1fUdnoTV6G5d33W0PW3p2JF4iQOA6kB
         XARQilp/p6lhntFYHcNnFemIJastqzyQacIUbRnZeFq+uOWJhGcpYsFqqntQgBR1Vo/P
         KjpuDL+KJQqsDCua5usOaaWxtYPY3uACR7gswjTPij888rrLw2hmEokdmAGhc5+rjeMS
         Felw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097092; x=1775701892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ci1IOeOnUC117Y7WLTsUP3giOCURHkZyf5emfHJurE=;
        b=oK7pAMWxq3gu/R3picRhGqz7N7YJ9RR4c7q4UBRLBKV+G3oa0HZ0aYWQdV5B3Urxhy
         sLhQC3NeOwf4SxDeWUNu36PfjW7yN3xszVDTU4uwnw5LXI/f+z0P4nKjMK9ogo7LFC/X
         J2cvF/6bDhrA1RtoCGWp8XXCNeiA0iGu4uTw66Egqbk+UJG4OEtnETtTRvlkYpUH1zOh
         7XepavsXEuaHX+9/Zkb+1e4sie1eaKU5rh+PNlq+161l36o2iy8l2N8kOcxRjJdjidpW
         +87z5gAF0A2SaHQ0GMfFzYqBrMsswSgmaMd/VF0Mi99q0PeOo5BL0QcKKqig7ud0hT9Q
         2rFw==
X-Gm-Message-State: AOJu0YxkQ/RQ8GHEWZT1UYyCKdFSvU18n4xWfIrpDlN1FqVT2nOQqjQ7
	sj7srvb4r8rwQEKvFMawHmgksPYBrYr9ug9exSnJfgRvDxBVmSNbgfPj7bT2GrHSS8zHjYIATfh
	WanIVm3nnCHscD4tKGt0PXk2rMk1V4BdwHdlSujWm+r8601S5ZWiHywHm6gX/IlK9xg4K
X-Gm-Gg: ATEYQzxcIV/VCvK9KTzO8VS05BPkupLucjmVOCYrq0Hy0ss8ro/kCkIM1GPFDnnjmJX
	pdsq62nXRM0GQMQjsnN3L2ej3F6gjpizUHHPlRRY5M1LgekxSJk2AkBhF0LjjuqJV42VdF5e2KU
	i9db+qLcWg/tH+iDCbloljEd2jCFtZKXKLzRCqTGJqjwqtkSh0ggpobXEhfiImwmiZzmPsTIhgs
	5B7eJgFnLWUN/ZaxQstVo9xQpfKXb1ICzs7TeCz7GsCYjhPk+t8laJqk+DR1FVX+IAlbCXqGPi1
	6vueHRU1fo6tELRYkcPxAVLLMKokjEKDGH6xqkk09Resm93eYk+isgO+zz6UjztAg/HMizVOgM/
	o5kw64/nW6fgsM30RkkNdpGYQG9eHmf6XRHl0lfv6rAo=
X-Received: by 2002:a05:6820:2212:b0:67d:ec7b:cc9b with SMTP id 006d021491bc7-67fabc069f9mr3414345eaf.16.1775097092298;
        Wed, 01 Apr 2026 19:31:32 -0700 (PDT)
X-Received: by 2002:a05:6820:2212:b0:67d:ec7b:cc9b with SMTP id 006d021491bc7-67fabc069f9mr3414332eaf.16.1775097091879;
        Wed, 01 Apr 2026 19:31:31 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm990215eaf.8.2026.04.01.19.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:31:31 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
Date: Wed, 01 Apr 2026 21:31:24 -0500
Message-Id: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPzUzWkC/03MQQ7CIBCF4as0s5YGqFLqynuYLgAHS2JBoRJNw
 93FxoWbSb5J3r9CwugwwbFZIWJ2yQVfwXcNmEn5KxJ3qQZOuaAdY5WoDPolIhnoXmppdK8HC3V
 wj2jda4udx+rJpSXE99bO7Pv9ZfjhP5MZoaQXUguhFNqOnkJK7eOpbibMc1sPjKWUD29i3iKrA
 AAA
X-Change-ID: 20260311-ideacentre-9048b8cb7b9f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=vgPRnuPH7ko/CMXVyFPIBOZ5z7rx9s2UDvSpm6qn8as=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzdUC8druUzyejIxgOKKOKyEKy88X3NK3JyQy/
 +cVx4AMrBSJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCac3VAhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVS7RAAyozYveZQoL1+om5180Oc0ne1XXbOlS3+WtjRxk+
 m2meBwNm4dSFifYiBRh4D9petOgXopNGz6EFZvxEFF/Pn8D8kp5leNNQ79Qd4w6FPV99pDZhK21
 +GRO/wnXzmzffZRIEgOJxdGf6UhjymTdVyHRVSZt6PJWw9GThKVB+HoCnhFWBIxlbzTmNQ6gAXs
 fLDw5O2E/Rvw5ZbIFxYgKnvM5j/PYuF8Z12qbX4xyst5Tfe8vO1vxTuq5YMJjub+2TAE2QtC/vl
 +WclSvW39Nf1lkgkWw0t6IVvVAUE1sHp9UFx1p8/UiG5hRwLtAX7NoVoOYVsxKzJBQ2FANEWZWL
 xp0wRB3zqC1ZTbQOSaQ4fxMsP8sttD6O/dYPuassiOontqZO4yE/98X37ViWJQ/8C7Bpx+mJRyS
 61SoDhpP2fjYzz1HUXk1McPeDSL/koNAbEvNXqKC2BKY5nDZOdz7f2rc0UYZpFDReCNY7LKMWFf
 +s6Ei59yjgluudIFnrZfpBeWN4LxWPYTFHWj17kTRyFOjH+LUlwtrVRgw23QdyxcLGoorwXx3oA
 A66hUxXG6RUWIPQ1quy33pwUPMYhwEbEZ5LWOR9Q18EIOocOuLViqwBQVhDsaY4VUAyuPuKZxtc
 p/nxoChC6rrBC70BMENEQPcDwRMV07nwfa0vUUU2soQ4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: vrd-TNigCmmz_N1U-lEwl34CyA_LlduM
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69cdd505 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9nN60HbFSD4cxyUCmJYA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyMiBTYWx0ZWRfX2cEL+zTvxTlE
 qFVsZWsGxtZHu7wJMJIxSXA7jUg8GCHBO1pbPW00P2jY/4ESEe8HXPCA4TWMG73rQzciwqn104h
 na74NPKRwMkHansTcFG7dFyuam+iNoIHEMbCtu8QvQNTS+gFSlZmy5qb+kKGvcT1tUKj4S2Ee+L
 /7mpYSVqJbBXZYYoqRoJX/GDPs2JNvfJYgQkSLDZmVVNdYNPP1Fh1WKxKlL3EGNO1xIvHknSONU
 20c1xt6N/oO7AXN4KIx/AKTP5OI8qpC9HMpQI0zHrr7aiCnUY3r6ES2JX+RzAvDzUGosNWjmhv4
 Lxf0rdGKeE6juZ/5H5LKvbRGVE/3SAk2MaLVwR5CFjf+Vf8fjKwQsfWvDfm02rFAZcQE0Z7Wdax
 I49p0OrzQygOSRtI18oQqyUxwaE4pppRxR57dj/u76/Xwebw911E/FaNEaK9edvxULWzaunGchG
 Jv9CqwKgxg93tXKt1fw==
X-Proofpoint-ORIG-GUID: vrd-TNigCmmz_N1U-lEwl34CyA_LlduM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101407-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3370B382B85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Shufflex the reset and wake gpios for each PCIe controller.
- Fixed a couple of pinctrl-N vs pinctrl-names ordering issues
- Dropped duplicate smb2360_0 node
- Added a newline before status
- Link to v1: https://lore.kernel.org/r/20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com

---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Document the Lenovo IdeaCentre Mini X
      arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1200 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1203 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260311-ideacentre-9048b8cb7b9f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


