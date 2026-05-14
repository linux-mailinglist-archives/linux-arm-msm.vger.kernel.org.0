Return-Path: <linux-arm-msm+bounces-107518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDGzAh5KBWpEUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:05:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68F53D827
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3D833014572
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572EA38C2A9;
	Thu, 14 May 2026 04:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXjueYvP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAB3tZ/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E05A304972
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731547; cv=none; b=CdPgHFo6qpjEhxMr0ulUW4fQxAzhH9zszfp03Sy637W0RcCiib61/1lelFAQFinxcJ3T/bVp5hDyMwxqMkXpNO39s4fAIVxBTe5kub3WyY8TKV3pW8cuKiiXoqPTr0YNv00z1RkPzckKFivh2Pt36HA82gTxqMvpCX5qMkTBFik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731547; c=relaxed/simple;
	bh=un0IRtFtp9HGA/SAnUxGPXD5R1Ixbj7GtriN+lXDHmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t95BZ7uWOxzdF5EqZXYQvO1k0daU8OdvJmtPgJiJd3T/7J3SW1qBhj8uoWo+nYZTxZaITUEX4xgJhNjLckM3lws4V+Fz/FAljVeZjTOJqIIa4QVQhEwvAwp9ZN1zcXBVIhr5eD9QDYBBo3hU2MtlxAwuYv56pp0orkQSOWJXNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXjueYvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAB3tZ/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2xtcP1095994
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AEoBtD056KIOqMNBS6wtuX
	6v1ARlOzo/InY0Kh8om3Q=; b=IXjueYvP2nFtyS1pkdpLJ8NzxjE7bdNF9C8a0+
	CdSrb8r+tjLbww7Yo8r5hhl9cpftNHLHSoNFZzKjWQZ4i4T1moZXo0Q5YHwyhtoc
	8sdsQ1Z6Tvt6+dPPZB7v+VE5L4ahg4rXt1Yay+JdSlCPzfTgsyv2/hnB80o0rtUa
	WgeVdoL49axhsU2wtkKCgli3DOtlK1jo+hkJ3iN+nPaT8Z5W94c9G17HT+eUiw+s
	SQpKbeGkSBIGRm8a5T1bkNe7DfV4l+JBS3wJydd1c7r+89jJpjNrFquUt+G6FDKJ
	Qeg/BzQtoHl3iPrUlX+ByP+iRmFH7rPOahGEOhZR5OM7xutg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hg60t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7aba0af02so79561195ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731544; x=1779336344; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEoBtD056KIOqMNBS6wtuX6v1ARlOzo/InY0Kh8om3Q=;
        b=OAB3tZ/2cbBvIuy/CWsgXZIRmNdKqUthveTUtTXhBJF3DspCKL4ZD1WN6cv/IgMElm
         QXAVdY1hEb4SVqZCAJoPYblViAza2GmwBgqAcdx9BmJVGYWI05c6Gql3ex7BcnA+883V
         YZQSPxKpRbyOl+51kBqsrYqxUw7EoKtxHjq/Y0oYQdjnxx/cdHdSncTFZLO91jQq1Y6f
         vzvZmsxK4YdaYiby4O3QYxEH7a2usORP0JC6esubEtyOA4zYn/Dyd2wrhQQzx1+c0EPV
         Ld0J3PJiJErbCPEYOVe5T7HPRptlNZBG2tcL531HL2s/knlNbsIEdUYWFTwrsg6XThqF
         7NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731544; x=1779336344;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEoBtD056KIOqMNBS6wtuX6v1ARlOzo/InY0Kh8om3Q=;
        b=GvZXHiUY24jGXMwBtDrnFk5fJf3Ahhkcm6Gv22i02vVxWlYeqEMdtognZl11Wv7wzj
         ogpT9oBqRABv17/HMGgwAnzviCUnPSC+7zH3fNFTzuq0qrrz1Q0EVMgddkBDcr/9qtLQ
         KDFkP+dEQ4z/936AeUYCffhM1pBpdL79TNKR42gC4I3SRA76uYLVjjXkwfR68mJT7py2
         FDZRFUO51V3SGedtP0fF4wzkMhBdMU9vIIoxiO3lKlQTrgzQCVfoI5oSI2gRtp3rVS8L
         DPfQ9lg2esySNP/X26gC8jnxqqmdE45HBf4RRKV4OSho7BvWV1+rAFAxPKDg+PNsA7i0
         cZzg==
X-Forwarded-Encrypted: i=1; AFNElJ+B8GLpefSyCFsH/aZFbS3PVEVz5TL1rFGYDiHyljaWg9flaMKwLCN9ABOtPcIp6t5mTWqLfzTah2OLprUj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jLsCusEznupyjN5LZlABwp3o+EOxbsvRKyGwj4jYZDfmrPMH
	HJ8Wi42L3tNIN3oqX23UkA54MoPW3LqT+YMMJx9k9fnlHNP0U1fAip63rbHmIrErp8LgVsvoOlY
	9Du6yvNtElrdaZXjWOFBKAYUtJz1uUtF244ZOlIZPe0rNgsmXr9SwMTWITA2cYQrcJAy0
X-Gm-Gg: Acq92OF+EtcP8UEffKEMR4ENDr8AxVif7pUKzvOMZL8zgydhSIEkeBEU0b5zpyCUuqf
	dhwi6D72TTYmzB8V+XHd/CT2KR0EcVoBYyvhemeK8O0Bv/4zGiEXrXNHgDbu+I6rP5K7UewQtti
	6ntVgdDrpoNUpinoSFiV42tRmnkCtDuL+FesSOASLZJxmsfsezt4jM5/Y3aTWfkXOWD6IaJlsOg
	fYAg3bJMS4OEJnmuj3ZzKoigLMsaIdlf7pIQF0Uss7ybJIWvIzo/NXPhsX0YbEDATets/rU7YFB
	xYUuQkKqjbDB2WWiarWcQxL27TBnMPpdgRCfNUswTEh3IWLgNQZYUMTllEAa3OWqz4jAgMXVgt1
	mrOQyHYPZ+X6kx7xyStHyeeS+IzPj408yXG4gbonyiSjwP3hkTmCiqI1MV1htVZm0docxVCr1YV
	o8y2zWNYoA8TzqvYclB3zSsraS2zhdE2ZDyfv22EU5NYpyS3cC3xQPGowhjNJOTg==
X-Received: by 2002:a17:902:e74b:b0:2bc:dc18:35a2 with SMTP id d9443c01a7336-2bd2fc24a64mr53203865ad.26.1778731543891;
        Wed, 13 May 2026 21:05:43 -0700 (PDT)
X-Received: by 2002:a17:902:e74b:b0:2bc:dc18:35a2 with SMTP id d9443c01a7336-2bd2fc24a64mr53203565ad.26.1778731543269;
        Wed, 13 May 2026 21:05:43 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm8035145ad.40.2026.05.13.21.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:05:42 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable icc-clk support for Qualcomm ipq5210
Date: Thu, 14 May 2026 09:35:34 +0530
Message-Id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5KBWoC/x3MQQqAIBBA0avIrBNGzYiuEi3MxpqNmUIE0t2Tl
 m/xf4VCmanAJCpkurnwGRtUJ8AfLu4keWsGjXpAq3rJ3ktOl9UKJboVTTDO0GigFSlT4Oe/zcv
 7fsdIHPtdAAAA
X-Change-ID: 20260514-icc-ipq5210-0ab03f3a3e83
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: luXIZQ7VrBSyJ-GDiYk-wsqaec9tpU2k
X-Proofpoint-ORIG-GUID: luXIZQ7VrBSyJ-GDiYk-wsqaec9tpU2k
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a054a18 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=07cjT_76NfHvuXGZdNoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNyBTYWx0ZWRfXxZZn6bQuy+GE
 nBufktPx5STxUK6EJ4pp0Frq8Mi2Q0VBzQlEbW9cNVMD1s3SLVVz7m3F8Ldt8rPj6IhwVpjL/KV
 sSb/ib0H9gMBXB0Hrt+0I30sqkv/GniMw9xMMIwhCOwfL6ZcHZZNyZdbW48g8aDCKvVniBSyCo4
 8skLhOpAHfd0QrpGsIxn9+bZNE3k7jMQYBr7bD8mN+WhZCq7Pc2KP6mUvZCAoFpUgFvQv/0UJJq
 rPyR57C7mxb/9WMYLiUejZVCTA4wN6bLvrYB+xY6geseQIU/mODizXJzTsA5GxSmEpGpfUtYjZA
 P9e1I+sIlDG57OfKcfvu4/oMjbDJoe5CttTd1pHyTc4ECDqkUqN2jzRLF//WG7y2xU3zPs+Hzmb
 yJNgKyt24JmfO39UhmlszPo8qth0RrTNC/3xyAssiqcsQuhK/Dg2SrJCogaKBE+tPj/Q41Qt5DV
 fM2YR2iCOB+wBYWfcng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140037
X-Rspamd-Queue-Id: 5C68F53D827
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107518-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add relevant master/slave ids and update the gcc-ipq5210
driver to enable icc-clk support.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (3):
      dt-bindings: interconnect: Add Qualcomm ipq5210 support
      clk: qcom: ipq5210: Use icc-clk for enabling NoC related clocks
      arm64: dts: qcom: ipq5210: Enable interconnect capability to clock controller

 arch/arm64/boot/dts/qcom/ipq5210.dtsi           |  1 +
 drivers/clk/qcom/gcc-ipq5210.c                  | 16 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-icc-ipq5210-0ab03f3a3e83

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


