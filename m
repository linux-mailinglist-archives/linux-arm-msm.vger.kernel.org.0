Return-Path: <linux-arm-msm+bounces-110935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MqJZC9sQIGqEvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:32:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3369637178
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:32:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SnrAniin;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AlQ6gc+R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110935-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110935-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6F730FCE30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9968A425CFF;
	Wed,  3 Jun 2026 11:10:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E7439006
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:10:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485055; cv=none; b=Mf8ocRjlc6fbf33/Fu5nXjhTQI60k+7/5zkivRkaCO7K7ymlN8Yn6VvLDJo07lMVyQvvHkXGqLIvagqDroBV9jYj17ZLsDcyhTAS5cLJj3UoVsUwtjGzaZQ3gjCCpyfdMY1jfcSrWMXRi4LeylYILkaqAMUAEnQH67xlzdQanVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485055; c=relaxed/simple;
	bh=Vs+9CbuVD/QgRSsN7Bgck8hT5qPQPlXEkllEYE9DOgs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cCh94W2LckQLmI0QSmVbA3zBzej10o9JS3E1n4Gj9N5Nw+V187AofM57T5eGdnjLGW/gKRijQzfxcuRhJf0ki8Huaz59UG5vyhAenCoVP1tXJU2egzLLs1lY8h0O3zX+hrHep0q5yXB03z+/ZkzZs4i1scXfQYqU79AyqHSNMU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnrAniin; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlQ6gc+R; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RHxh1200005
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/64rIzA/Pb/Cnm6v4Tx5KR
	XT2mXNM2Pr3Na6j1LlbsU=; b=SnrAniinvhPxcfw33x/RrnXwNsFr2urPXQMqkx
	BuSvZv3l6oNamCBe7mfn29F+UCQ/w1fF3wBQnJAT7qmsXTl2NOt3GMBA86kVKAlo
	YQ1Y2NfGFdz71OrzvjmladSgHQuV2mDkqdRyTDEBB1tjA8GEnDRkLGTcLPMi9/rb
	ch54jYtxEskw8JY+wg0hLP5HS5q56xI5YsgegVHval5gFsPNNhMeJ2GVhnriaofY
	+0xH7URMoJIWnMyaoAhpiBwV7M9DmZ00ye8Po0v4UkSpiCgwO+M/HvBKqo5ZUsAl
	AN8shDFSLAxDJX5sFC9jYlB28yhdoP6tYyG2PcrNGTixBmLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1qtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:10:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf004bf8beso81746985ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485051; x=1781089851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/64rIzA/Pb/Cnm6v4Tx5KRXT2mXNM2Pr3Na6j1LlbsU=;
        b=AlQ6gc+ReEu/QzDMlW3Z5vQwwfL7Jz85HniyrlvCNEnJbVFIF7g85N+FwWDPa44P4F
         wd41zQIcZo6/UM0ndIbHvYsaxRfB7fVWJgVcgS78fdgAZrlEVc0m/UMSn/7AXHr0QYtS
         ERsJ2/7BFOSsFFq7L5Mq+5kbKg4Bht69/lb9xHwQKTggjKYRe/nk9DNv+uFs1iPQ7eLL
         g8GhS/0o0MuEWOUNqe+EpM4suxr6tbnEM860fYiTb4U6vSdCzxqSshghwIgKGMpzo61U
         4VJQkzDP7sN872P2Eql/IijC5DxXoSVr1VXee+tPcgNDXK0lk5v+Vm6mxeXVhVndvKdf
         rNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485051; x=1781089851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/64rIzA/Pb/Cnm6v4Tx5KRXT2mXNM2Pr3Na6j1LlbsU=;
        b=jQ8o+xkQEEJwWVSzpc1UagU3vXJ/kLcg6na5ITI/bScSN6iAP8k6q4hUN4i5Ms1H5p
         X6vSde1PuKJMTX1gFiDgp3eS+8+2feQX7bEQUfCnCd3tPp9PtbB1vJGFwkPCTOCuad0B
         Y1TH4j1i5Lkaunarn77n+MTxDst+iwHbFkIFwUoLqecwlQttw5YEsy/DkJeXGM5NCcAW
         eyeNweZH7wwEcCQbsmbcRC7n6bYiiY7qLfgyxF3aBee1RPy6LfRf1GY4HKELIZCv8b47
         alQu2KhLC3ZFtFozLNAGF2+SfdNCuZW2iNTgBg2CwRVQ0tk9SLcxX32S+b61d/hqtKFL
         pEag==
X-Gm-Message-State: AOJu0Yx3381h+/T3bEjz8yI1fo6yf/OlrnrpQiulKiRYGm1lf97KVvG8
	zxLKzOH4Yj3Fci4o+JYtnk339+q+QJrjAEUDIsvZvi6xwPyNNDCBUoxioyOLcU7NIR0aVRf5ee/
	7QSBU1bHeHvuxSIhU4ytCybLVRoz0naAjUr/H1EEirwhiHmLB6uqhMPirpTOVDMGRsXQTeK6rM+
	M7
X-Gm-Gg: Acq92OHNiangeMgXFivQRjXsfwuFtA+YH0Tjx9mv2L5+zgUUS3/+3NbhfMgiVxZ7ZWL
	1L4E6SAVtMyi1GWhpamzQiCB+So406aDOxaPBZgDsPfCiuCjxsnuprhKzYCwHuE3/LhJVIZ8ZyZ
	SUPY/OsJWSRo9mfasRgBC6v+mYK3q3q6bzKq9nh62p3AF6zuKPFRKc2lqWE4z+E0zDdAJcFgkQ7
	dLiM9V6ZIoUxym3s8e3D2oEl1e3TMuDszbjJPdjTsE96qDQj1aKqxgchPy9bAAtsULrhFKeM4ou
	drH6KWuYL+hAv8LL0bgJPZgQc6gG58O2PKaMObJHJH6vDUg5Eq/I8ipE2fGrUMSDEyypnksYuB0
	CZg8nGrTMTjnk5qanK9U61GaJg4CuGu+hxFrQfKxd5CgPzkBq19/CW4M=
X-Received: by 2002:a17:903:32c7:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c163a16f5dmr30956505ad.5.1780485051452;
        Wed, 03 Jun 2026 04:10:51 -0700 (PDT)
X-Received: by 2002:a17:903:32c7:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c163a16f5dmr30955865ad.5.1780485050900;
        Wed, 03 Jun 2026 04:10:50 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e636sm22148805ad.51.2026.06.03.04.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:10:50 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add EPSS L3 provider support on Qualcomm Shikra SoC
Date: Wed, 03 Jun 2026 11:10:36 +0000
Message-Id: <20260603-shikra_epss_l3-v2-0-480cdb5abc85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKwLIGoC/3WNQQ6CMBREr0K6toR+WkJceQ9DSMFfqQLFfmg0h
 LtbcO1mkpfMvFkZobdI7JyszGOwZN0YAU4Jazs93pHbW2QGGRSZAsmps0+va5yI6j7nCkAblKY
 pjWJxNHk09n0Ir9WPaWke2M67ZW90lmbnP8djEHvvrzwInvFGKCi1zAuRy4sjSl+L7ls3DGkMV
 m3b9gWqcqPTxQAAAA==
X-Change-ID: 20260524-shikra_epss_l3-522afe4fb8f5
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: un2im6ISjLzTGrmLLNDeHYY84vTeR5WC
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a200bbc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=r389I4eL0Z4o-6KvsIcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwNiBTYWx0ZWRfX5tdL4qpQV97r
 nomNQd7kInkUsuklv1wCWoqDMFQniQVbv4g7kNcf9Mvu81MsjooDA5p0CSWHOT9dpXuilztAhM7
 aoBwgGqcSYG38O83LlEHSSqRXeADT/n5gv3Jv2XAe2HNVaeITNvUhZ2G3UCzuTzDH4Xmbfo/cjf
 ZdDtZuqMlAw0Q6s8GcMu+feaJKlgDtsM/sSOjYSBeu0bIaf+DoiVHQNwk0GTEUzEYidmRdk1dGs
 +5B29jVb9iooFjBJwHpjgfx3QHKfDtq3bMFkhilzJ0aYl5Sp9F1Do2qo3DLJGUh3pTcfiTf2Hdb
 nO37mqWPNktWDtDdCKTwPFhOWD0L5RMO190/JH6nR5dndBgKysiTxDmooHGt4Q4AguPlr6ztjM/
 +KqvM5FBjQQDHtHOUm1Go6IFeZ9hxhZdq6zCSwnLBTKsewQa7vOaI8DBGRoM4O0EQYifqQWEQm/
 cbvuu4cCAmgLWPgBR0A==
X-Proofpoint-GUID: un2im6ISjLzTGrmLLNDeHYY84vTeR5WC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110935-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3369637178

Add Epoch Subsystem (EPSS) L3 scaling support on Qualcomm Shikra SoC.
EPSS hardware on Shikra is similar to other SoCs but supports only twelve
L3 frequency entries (LUT). Reading the LUT beyond supported frequencies
can expose incorrect frequencies.
Introduce new compatible to represent this constrained variant of EPSS.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v2:
- Use the existing qcom,osm-l3 bindings to describe the Qualcomm Shikra
  EPSS L3 hardware, as it is similar to other Qualcomm EPSS/OSM L3
  hardware. [Krzysztof]
- Link to v1: https://patch.msgid.link/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom,shikra-epss-l3: Add EPSS L3 DT binding
      interconnect: qcom: Add EPSS L3 scaling support for Shikra SoC

 .../devicetree/bindings/interconnect/qcom,osm-l3.yaml    |  2 ++
 drivers/interconnect/qcom/osm-l3.c                       | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-shikra_epss_l3-522afe4fb8f5

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


