Return-Path: <linux-arm-msm+bounces-103674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDS2F77V5WnWoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:29:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65769427BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 904C4302D959
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54231385508;
	Mon, 20 Apr 2026 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKm81FNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqWgJ2VJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE91C84A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670027; cv=none; b=P3IDcVB+epMEWmPl6HCbR8vCW2Jdb2SvqJJdbj1/7re7D/wivXnDU9cgQWS0jVczfk0JYPECQ+5sGlDGsCrWCZKGtJjm5L9ypiTZi07QqYFBn5QyqH7LqtolCddbNVEivWGHqi7tD37itCanifOHUW/0VMpdIZWJf17TgrjSSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670027; c=relaxed/simple;
	bh=LE4dEHf9dwalaJLqpHPlUnIUnuDQOkACtj0LUMXgkBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AECNleJr5S4P23tDKSlegB1BwRD72IyELGkNGISBPOLCK4V6p7g4EeWQrBtvW37Ebc3rFkRMV2X3n8cEvIG277IYEPDVmrWKjYX6+EKfq+1JkMM7wbZUm9iJ+Y1ekSIVaGSeAuREojP/1mwNm7uAz4yPdQho48Q3wp6CDidszFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKm81FNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqWgJ2VJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K72nWh1403936
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R4BfAV42tyPI6yEMMtx4VRJAMNDAHJoa+Zc
	H7mz48Yo=; b=OKm81FNmDOLJerlGU+ufPEDiIUVZ3/c99Mq5tjrYOT6AWsHlQLL
	E2lddF5wrvxZc/J4L+x2HfFSzMsTQn6pc8RTRshoEkB3c86B3GV2sUMTkndm2h+/
	pDvzLoi9KK4ki6SzoygeIc5+ZBM9v41MpamN8PCHasOz9X9yhWRXWd2Cti1mKNlf
	cx95Q+lPEre/74pGXQzrSbIVU9xfPADqsBdHjjWwNMV14+YJ8pfNjGrNn5XsvOoZ
	RnVjgE3Msqtrs6P45y9FCewRQJe37DUy2EryaNt7IVsvbsVd7w8dROz5gzI4a8iZ
	T0jhPGy7S2huFNuYAkPfpFA0YyymxEiyCDw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b74k6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c35f2c09dso3130516c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670024; x=1777274824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4BfAV42tyPI6yEMMtx4VRJAMNDAHJoa+ZcH7mz48Yo=;
        b=eqWgJ2VJBsE+vsIjzFk+8Bz3sW851idl4Hly4hmlPwtP9lM24XiLqyAVaul/fzJhaa
         giPi6Vgvr+Rsm38ZMHOBO5pcYLbj2HNWmrgHyIOstFAbjdfL00KzTV6o7c0Bzz90gJuA
         v7x57SB9pbR2TYaSQjvND2BlgxMDKNjSSK9yoerMqA9ZI5cIZCul/FDAf8pAobOsvR1J
         KvV5b1s0lwE7Nv0+Ecfh52XugmCEFm0DPkwi7nzBZshea1qDhR7amHbMfofekYRVINvA
         3n0RxJCR36/xc7FbyYH0PPWAzm+75mtHygMC/XKw3B2LsMu/cUuHfUpkPAB7HsfzoUep
         ht1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670024; x=1777274824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4BfAV42tyPI6yEMMtx4VRJAMNDAHJoa+ZcH7mz48Yo=;
        b=m3rAybC3pO64l2G5LM49iJ19rgzOlGY7drceoVwVdfJBPmYt18w6+dyZjmIrOWe92z
         0n/vKxFgQrvabDLFC8D2dKghXaUexQ564KRln9aN/ee1qAT/cA2L5HQ+Gn4X8D7NvagD
         orPgcANwcaqp8ik13GwIEXfwmYqLKYTBvqZD4avJIY0nuljLcPHBACdfQgBiUsNHax1l
         OOWkSdi7owVOWi83atKdwBDmtsaUvOqQdegX+rq9T51fwUeF/yWyr0zuF+ZNmGB6U7sr
         2+OF8gP/pLbdUDmXPoM+PRqFhi73ApqqFwLfuPyXRqTuoRCcKs3iJq/DdMXahhoBtVpk
         L2xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KOOX44GUKvIBVEEFYc3FzFMcMAtzxCzvGywKUr2aS0AG9o2BPU81PLFthuTut3+SUXOOLrd3n6a40Tpi9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+eE9PnJWf8Jb2rQOmzn7r3C2/PN+Pfjr5zokQne5ubnQuDIDl
	UhflF+IHaqoqcTXxdk5zAo2SBl4Ic8DIyBjLcZq9zgAZagjHz6kt0yQBd+4Ua93GVSNZfQLKPiU
	V0rlC3r4QiyjK55vJAHmFTr2I6bzy50NOJV0JwHxwjYPc0Wqnzxuyczpf7bhKhhu2SZ+5
X-Gm-Gg: AeBDiesmUE8pFTyneDAOtLh8enHxJ/sX9vBA55JtHACdjg+Fekx4tu9wDp6pfBAtCh4
	XvtKfJr/8siOrhZKzFLWxRYITZ24HfbiO84cvtWLifJqjSDnUO0vsTOewo+eYvdB1cppnN+iEV0
	7C0aR6cHGqaAs8b+meWT3iOAyJOn2AFubBmxBve4rXIiIPpnbNdeKe7TWpDheW4F96QbYDOI0t9
	olJpxIy5Zv7QfwLZDhRwAZKDHEdGnYj3APQYQGNO5DTvmaWz8wLLWt+qoOAv0WjJoSqyy/DNgJK
	IBDAZb8nuDDHru7rOSIUu0fEYKsNxx5BiBzw+HXkdVFV0yy/TRmgqBiMleiE75cys9UQhnkfUDT
	PPG7bKWykEowfZwW5/dt03WEjlB+W1G9uvNnv+HFDbOHNc/luJdlBGcpH+EYzmkTlXUdPkz7tZJ
	oAiJSaoWjefAZoyEYQ
X-Received: by 2002:a05:7022:2602:b0:128:d23d:81a2 with SMTP id a92af1059eb24-12c73f9ae5cmr5867765c88.29.1776670023663;
        Mon, 20 Apr 2026 00:27:03 -0700 (PDT)
X-Received: by 2002:a05:7022:2602:b0:128:d23d:81a2 with SMTP id a92af1059eb24-12c73f9ae5cmr5867734c88.29.1776670023037;
        Mon, 20 Apr 2026 00:27:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm529413c88.1.2026.04.20.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:27:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Add PMAU0102 RPMH regulator support
Date: Mon, 20 Apr 2026 15:26:37 +0800
Message-ID: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e5d548 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=rmhsGHOi_XyW5o5IWqkA:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfXwaPSKf+jG6Oy
 A6UIpBAXCA29sXCO2CarukTpXUZfsiy0v7FcYq2Rv5iDKPDttE7CXIGdMpCwMQcTMwRvkn5LTfF
 Tdt7ZcfUpFOcmIMszmdTZy+62pETazr3tPpB5jaXM4wz2tq547+I7FXPUwJsRieR2vCcbm3Cgj7
 GjdQ1JJREd0EhCFrr6o+bEwnTooUMKSY6cHkVHLAxnhpjVcsT5/6drnr+mbxdbGqItADNrG6/vt
 UeLQNyIU/da+ZDIu7QrkxaZtLELCq7HYsK1lfn/NGIzOZnghW9utu1yk7jQ8ps8GwuEUqo2QnqN
 pl9flbEtFfphBhTFf6gQsQVW+iD0l8qI2sbVqk33lfeJ+oHCC2q6socvQBpLPtBPzQ/DgZMjM67
 LrZQIvOFO1C34tLVprKSbtJY+EsNxOaeaqKh9of6gITQgL9+1jgsDjX1PeHJkXEGNfWjlJbnFex
 /h+OTqJaqhqgfyDP9Bg==
X-Proofpoint-GUID: 5_LW6eomYpga_DBoTJr7A6rAmbLk7-8d
X-Proofpoint-ORIG-GUID: 5_LW6eomYpga_DBoTJr7A6rAmbLk7-8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200072
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103674-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65769427BF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds RPMH regulator support for PMAU0102 PMIC found on
Qualcomm Nord SoC based devices.

Patch 1 adds the PMAU0102 compatible to the dt-bindings for
qcom,rpmh-regulator, documenting its 8 SMPSes and 3 LDOs.

Patch 2 adds the corresponding vreg data to the rpmh-regulator driver.

Kamal Wadhwa (1):
  regulator: rpmh-regulator: Add RPMH regulator support for Nord

Shawn Guo (1):
  regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support

 .../regulator/qcom,rpmh-regulator.yaml        | 11 +++++++++++
 drivers/regulator/qcom-rpmh-regulator.c       | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.43.0


