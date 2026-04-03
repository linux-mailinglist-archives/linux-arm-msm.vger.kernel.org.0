Return-Path: <linux-arm-msm+bounces-101598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOjMOAkQz2lysgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:55:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B338FBC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D4133054653
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 00:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27C526059D;
	Fri,  3 Apr 2026 00:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ua+tlL0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDyYEif8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD512405E7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 00:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177735; cv=none; b=o6fRtCnoTdC7jJe3LkGt7ydaRsith9X0p20sD5F8J9ty6mMUBWl/CRzeHS4kgyd9GkNN2yaR/usOZEqsJtFaB05J7ecSt2+KlFsF1QqA5pxEPEUCCjsDVREdNG+/jOZ2WIRjvldRgnyS1OTHY+HPxNVqIlMtKtSkCT6K0nkL1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177735; c=relaxed/simple;
	bh=NNsFy9jtd+cTfQVMSotMHHa2fIjaYf2NqeajsZA6Vzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iCwCsXsTv49K/OEsM+PvTlqobyl5FfAz4HwPvr2vdLu4le6ScTLaelDrQOeQ/RdjbytSnk7Qk72zHeUzJrI7ggBfbx7HoCvZF0nTg6fd/BpPDGe4GFhy1thkdENSxGKj4kDw7/Un4yHgNjW0sUizU+71oHA1SWrqGXKHhNz6r8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ua+tlL0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDyYEif8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4m0Y2528300
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 00:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=27cufHd7wNynO5b5/z2+Tv
	oo25GCQZFoaqYbXqPWkDc=; b=Ua+tlL0k2mqdzo9/3JOg6YeeEWCZMbvxPlj3Es
	I//cfgnbDkM/O9WtrVFZTGs0SteIArfirrZvTFvbVGOgMaGmYqeFsTbLGwCdFvHt
	4ynVLUrkv90IRqgKUJPEimgjUJ+hs5k2lkjR9OsJR4/iQztjTewQbRs1DHkwiSwC
	l0LMB8sfv5CsTzMU/wcwq9uxI22PGP5QpbwyLtKubozsH2R7jhNIexP63audi2O7
	93tdXtniVTg5NTi8rPq6otWzeEmdbz5mveecaX4yOCZ3KJwJg85QQSFQ5qZ+++pH
	TTXGRrwPIA3HjqphM90LUhhX7hEWk5KBIK5Zg1daYsBfi2mw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9txc9pjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 00:55:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c8ac8e422dso2297610eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775177733; x=1775782533; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27cufHd7wNynO5b5/z2+Tvoo25GCQZFoaqYbXqPWkDc=;
        b=TDyYEif8yw7oVL/g2Fud0e5+OhgiL/ojny5m+jHMIWWWunisI250v4QW8eUbGVHOlj
         fDgAIs6Ph3Q5lEz51uUC98aXECdAFgwXNVBWrjj5NK7nPeeCJgBZZBjQjdXwzNqrTTVh
         Jd70t5hdYHA24xxdtcnDKb8lHcusbacbxfWiz9JnOSjzXAZBjCHiUpMX6CzB0YxnnFEw
         FFyrho42HXcvhNBXdiwhiAxDC/Ni/4899mukj54Ga4pEZfI3av6Ls+qemVcxL696e2rh
         e+Gz4AVnGQBtfPfrkC0dz4sajZuCb5cvcD4ZwKrIWYlo5t6oOSpBoLDQ/1+48vvCxzAl
         ndSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177733; x=1775782533;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27cufHd7wNynO5b5/z2+Tvoo25GCQZFoaqYbXqPWkDc=;
        b=C3Fxc9xKV1pXpRKG5u+8OY+ZfohIcMaRUyxHwecc4NMwOKQhZHzFEhDz4uZRUfTY5+
         WaO8342C8VnE0gUh+PQlgrDjQh/CDqFPYnmBj0gfeZ+rUwr4cr4ZKBBBeJ/ErXi+YlzN
         Rt2NeUpUHFUae3is2OFUNTijEmtZIvMiIZR4QXPMMVO5WCc0bvqYfo6h1IzYtHoYk9w9
         jF42Wgti2V/QIlbTtG3b3r8nShTJsJ/lpgEyJez6UtOC4i9RJK1OnvNqtdfP/7ac/Y8/
         2qEypv4lKULRgtrR/9r41x1Gwj8kUqgnHQyeswQNB3nrongk8inPTBksojkPnLiWCvKv
         QTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/9GjErZlAnwOd8uxkwyL5zlmUJunFnk3l/AkSNgA0G8tybGDNuBQY3FXjTHqDhHNGrbcuz2mEbMc6wven@vger.kernel.org
X-Gm-Message-State: AOJu0Yzys2QxaJs66+VukzAGwzuCM6lg7U2VZqtIwtXZJSjcZInEOfXr
	YMBowsbFAQn0UHvzrveA9rNDDzO2cHUJHa4AdwDPcyVs0DFmDE/fqs7Ehc93cFQJyfrUCWNgOM2
	ef1yTvpx+oF1/K/rQkN8JbdIzpBC9q3YmkE+kQ1minLrjnsjSR4h0EFE81RlC/4XJDw4y
X-Gm-Gg: AeBDiesdtxxV6B0kTSDS/TC0LTB/aBC6lmRtgXss61bgnkWZWGTfNqixwAEhWusNeRJ
	nx/AWj81XWq7b0KjkzBcW8cvTwqLD2MRs/vi+NkPIfdK6/iSLj0QNqRfw6cVcPXPqc1M4FOhAwa
	nXGr5QLYJE6qmtntH3MLBRMpPiJ4Pb08nz9RxTZcokJQhxOsPFUy9pUv8xP1Midt0KnmcDRtkas
	bT993i0drvTgFZBkaEMJDllBA8apTV0kA9ba4E5ijUV1HXH+tJhaRDDbfdiT7WUthdVAvdNWAiD
	MVaB+xLZz92AYt3b8yvUY/wkxTmRtlDFTVW3xPbeqUTaaSv/yhO/ElrM8jP40ZEK9BjmGUCEHen
	Gz385DLLRjjiOyOVkQ9nFCBUycLASlceDaTqwWT0JoiGPP7fSvo8uEH5sKVm6+mKxt81lAx0s8Q
	==
X-Received: by 2002:a05:7301:6093:b0:2c7:3a7:c7a6 with SMTP id 5a478bee46e88-2cbfa2d8089mr711366eec.13.1775177733012;
        Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
X-Received: by 2002:a05:7301:6093:b0:2c7:3a7:c7a6 with SMTP id 5a478bee46e88-2cbfa2d8089mr711353eec.13.1775177732463;
        Thu, 02 Apr 2026 17:55:32 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm3750800eec.25.2026.04.02.17.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:55:32 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] spmi: pmic-arb: Add spmi-pmic-arb support for
 Qualcomm Hawi SoC
Date: Thu, 02 Apr 2026 17:55:10 -0700
Message-Id: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4Pz2kC/23OwQ6CMAyA4VchOzvSdROcJ9/DeFhgSBNhsOnUE
 N7dQWLk4KXJ3zRfOrFgPdnAjtnEvI0UyPUpcJexqjX91XKqUzMELECi5K15Eg9DR9ygto0uFWi
 jWLofvG3otVrnS+qWwt3590pHXLZfRW2UiBx4bQtVAyoJe31yIeTjw9wq13V5GmzBovgBCsQWE
 Amo0heFBCWgPPwB5nn+AOBU/kDqAAAA
X-Change-ID: 20260323-hawi-spmi-a29ef97409a4
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775177731; l=928;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=NNsFy9jtd+cTfQVMSotMHHa2fIjaYf2NqeajsZA6Vzs=;
 b=b0oPikiZHpTWkmkWWCPomey6wfNOgPfhHOnowCZPSOHaHmc105MRj74NJTPTvtRNwdpoDhXxy
 H55WNlwUdajA5Sq85Voenr8wfY/gPrMH8JZh1cM1EOy2bIOmzxETj8H
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: fnXki0nNNGfEBxjYZ6LG8cB5QzuKU_cy
X-Proofpoint-ORIG-GUID: fnXki0nNNGfEBxjYZ6LG8cB5QzuKU_cy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwNiBTYWx0ZWRfX94F5ittpZrbk
 iTtsEExTfkMUU2QtpDXVCaRyQBVeirl0DvB8AadKUeV4U3aYgUK+PFVwg/XiPVd+ZUTbzOh7g+a
 tM0NiWeWN2ngJQOFjUe/U8HfNkxEg9oFJ1G0x514r+D7auIyw+8PYzIGqSi8wOAxRI+I90fzkim
 whG+2czPdIb2iU3BVQGrsLpUn2opZRYpSj87p/0A6HF3fU7AE0jM/OBsO5MspC8SXkGt+b2JEID
 RblURdCGE7MuKjNWqgu15IEIqCMv8yWxJ0yJXLl7lPmf5tr/7cJ3oe9rwRQaLowUt2rDoNoIDm+
 OoefBNx3AtGpNQoTYRZX4dOWqYWPzmJQMXRJe2Vxo+HAWBJGmt7Hkkdk3UzAWQ1ejniRpGsq4/W
 uaMhv7UYHC4DOzWTZ+rGE0sKUu/wxTyq19r7D+Hpl+RXM3sEKeSG9O0YDCtjG+6qs86Z4G3xiRk
 4ORpPiwkBGB7jhO1bqg==
X-Authority-Analysis: v=2.4 cv=HKXO14tv c=1 sm=1 tr=0 ts=69cf1005 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=h1JfItXC7O8gTr-dc54A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101598-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 601B338FBC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Hawi SoC and add pmic-arb v8.5 support.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Revise patch 1 commit text to highlight the new features of the
  PMIC arbiter in the Hawi SoC, and clarify how it is compatible
  within the Glymur SoC.
- Link to v1: https://patch.msgid.link/20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com

---
Fenglin Wu (2):
      dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Hawi SoC
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |  1 +
 drivers/spmi/spmi-pmic-arb.c                       | 69 +++++++++++++++++++---
 2 files changed, 61 insertions(+), 9 deletions(-)
---
base-commit: 840b0dd6b8c169e963f74265f508c54f1fe3c968
change-id: 20260323-hawi-spmi-a29ef97409a4

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


