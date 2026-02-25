Return-Path: <linux-arm-msm+bounces-94067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANk+AT3EnmkuXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:43:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F258195359
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45DD330980E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D372D38E5ED;
	Wed, 25 Feb 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTVVlAJr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGzONZ/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC93815D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011926; cv=none; b=k2ygji/RomIY6RLGIhhDRiZ+HJRjlVPtV8QQ9/Ae2J+BGdS7l3EifDs49PAlOJ96BWHLUTiIxglSpue7Le9W07nUPMRgdTmXcvhEEC+ZTdGK+bReR1J2actRMovesQ3r6FLwBAaWTxb9BFXjHYGGSRSevXIele1d5w7Jis8IO2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011926; c=relaxed/simple;
	bh=HotHvEBkOaaBPwVihsqP97kDwErs4wTwSukxdfYJBKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cSnTRu8V+A0R+GSgHZYNqGg//yg839OVVuUOoTn9ZPsGFeTa/0zsj1ta1c0ucxZ2OE0g51gC81XrvhLEmAptF955by75+9dPyOnFIuIhizXsFgLaru3kwVN9647VmiAxtgLW5r/s87OGCwSLygSS4KrG9kDB6y0kTpi4kH9PPgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTVVlAJr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGzONZ/k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SCkM806549
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WKOYXbrCg8nl8mEaio0AidFk2esAUje5YLD
	D3qjxjHE=; b=pTVVlAJrE7J5brZmtipCGf6Vx1mcwtOUVTT6slXZIDJoN+NsXUE
	4Zlq4LsfSzur+jdjuSZ2vUKJoe1HuPXcbBP7bLFG+xgtF8jDbIDL8jvgvlzSVsGq
	tP54b8kanpI4H9oOSpwzpeWWOkK4Kc7Jy+uWIvepskMX5c1PhB254zvkv93gcmNG
	EZwVpF0d+4YF7rD+ND2w5+/j9/oRV/+PCakqMIDR+eUHH1qEFZm+9kln3EU0ca9Q
	NlIpvQ9ifFyhUF8OqZosmzu2rXBJd+GkcC4rMkh6LDD7/RAlCeyxplIrK2kVoIu2
	Nc/qgqrtp065HS/vowGNUGq5SsW4PpRQUgg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p94hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e18ade2c2so4279177a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 01:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772011923; x=1772616723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKOYXbrCg8nl8mEaio0AidFk2esAUje5YLDD3qjxjHE=;
        b=jGzONZ/kam/cPbe5F/pFief9WS95f4BdyKiv5rkNuJJ46+fDcHSONTs7piMDIoOPfA
         ltlyYkoaSDLb3TK4r45VBLo7kJiWWyzBvgR0EaiK10W70a+1BwlBE8u/Jk+EWGGcdJdg
         FPNpwXl3QKvUgFtsNaq9Wom2M4LoanvfI1I6bN/r6wYRpI8Q8gdgBZ/QesVUZ1vl/Tgv
         Vy8QVH/Z/BUBGgbLdAfn1+HATexB8cCQ/Fk6cnMe7jhyH7OVo9KAOIcJy7Zjsn6VsN1+
         6l14kDmpLI/DgcyitJdVo9Z0l/7EeHLOIjWvsqUrB2ZohOF97+up10BbhwDac5MUVP2a
         w8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011923; x=1772616723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKOYXbrCg8nl8mEaio0AidFk2esAUje5YLDD3qjxjHE=;
        b=WV6Ci0nVck1/Cr8d1NuKTKxqnn4txGLCdBoBvtu9nMV1K7lfln9n6FSDHY7XhMWhsl
         BB1P6CeD9BMxv9hphlVa/9HyiIC0B7pLWeRBtoKu1rD6Ruh56TTruspnlf185c0zcpS0
         yIsbUARWntDnv9VqzYz+GaR6neXaO/u6hJphrwUXp8wuR9m5CKjdrP0o7F5XTPXCLNo7
         O+2SFKKtbGcbHpaFdVCMnXirA64AvQ2P7TKgJyXMFY1X/QRi+KUJvsUDuHuVs3MzF4DR
         qwr4O+Q7AdJx9Gbatqb74LVvw0i4NqmQUN5HEUNjwl+Ftcw+puYsMkj4gFfI0SKrpEyt
         27sg==
X-Gm-Message-State: AOJu0YzvdMtR1Lqrb2EiwO16GOPxgj5mKOh2Qvi+AbJrYdDLyE4aFJ+W
	4kKJhDgr18nPFbVV4IGS1vMzCwS5RhAqtQCG04MKq7hxZPdPV/O0zCOD5FP7iZGz2ywUKEQwxVX
	V9+VCF6JBzNYdydIMc3z46nLPY2ps/dJcIuzEtfUaLRC2WyUbTVhP4GVVKiDZsL7e+5Am
X-Gm-Gg: ATEYQzwAFuOau5b1o+hM6ERrBNLv5QOLds0M4Jj0NHIDlkvGB9EBb9GDoNPI8HoSpsl
	18ue6LCVIirZhP9C2fikhQU33ikLAQb6cXSFBeC4FOW/ggpJw23FAiIuqc1fNMIu9ZKVCLw/qKc
	cDxBTD8izGWwm25VD3DKUh4E55gRQ9/IA7obgWyM2cbmKF9UOIzXmeLpUgh85OUWScc3Ua3aNOO
	+yLSk1qUoY5qMwrqEVaG+vQup2AuOLweUV9CV2LUhx26f+zqKUSQDHdelr/LJuL17ymKciY0P8i
	3oE/U9DT+jIeruLYRigbe5WlP0Q2IkjChQnEEnnZayBMjj9uDdn75NGjRoMkqnm7Az92SiDKDki
	+an8ZUKNEDLyQMcZej3M5eTpDKpwE70TpF21ktgnYmtNbQrtGXim+auY=
X-Received: by 2002:a05:6a00:4303:b0:824:ad1e:3b6e with SMTP id d2e1a72fcca58-826daa2579bmr11682945b3a.49.1772011922527;
        Wed, 25 Feb 2026 01:32:02 -0800 (PST)
X-Received: by 2002:a05:6a00:4303:b0:824:ad1e:3b6e with SMTP id d2e1a72fcca58-826daa2579bmr11682884b3a.49.1772011921973;
        Wed, 25 Feb 2026 01:32:01 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd688aa7sm13628098b3a.14.2026.02.25.01.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:32:01 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Enable tertiary USB controller in OTG mode
Date: Wed, 25 Feb 2026 15:01:52 +0530
Message-Id: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5MiBTYWx0ZWRfXwrPmAaXQ3qtz
 TCTNgs7JrJf+bq21pd/59TJION064D5thWTqyY227LCMef+ZjYcqAw3tR/MieHIYU76y78HqwSd
 4wkGxRntK9NZKMk/Cigoahmb8djcEoDwk0kauCwZ98ojfICkWipr+Y89fmQCyORklu7m7xtKP3i
 caDQggWj4MPe4Nn/UmZgsWltHlg8j+xAZAHWphzDtnr0D6nQOam9V+3POO0O6G0qCP9ihiq86kB
 JdxJUbYhSeReGNACPBVe9Mb2wcPLAxfjwTTzLr4sszS3oIc0q195hTJSeeHAQD0ArHu8XyGa6EY
 fwrnxmSZIkXQ+QVVvJrAjT0hoUyy24xFPZWhkwjxvNMOcl8WelC4d0ocFPcn77fJxaReyyIoBgk
 abflfdHrCDmlLnCSLSGJ2E7YpBvkPcD4u3bv1QYdcxsN1MOuEcGjvkCwWGkXxJhUOC98TXyKLCj
 NrMmHoiAYz/83r3Itug==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699ec193 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BVbIWkHW3BUUPBfwmv8A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: cuIfIVtnc61BLfXe7b62lN2PKjJ3XwY6
X-Proofpoint-ORIG-GUID: cuIfIVtnc61BLfXe7b62lN2PKjJ3XwY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F258195359
X-Rspamd-Action: no action

Enable tertiary USB controller in OTG mode on lemans EVK platform.

Changes in v3:
Separate patches for lemans and lemans-evk.
Minor formatting changes.

Changes in v2:
Added interrupts for all expanders.
Minor formatting changes.

Link to v2:
https://lore.kernel.org/all/20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com/

Swati Agarwal (3):
  arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for
    Lemans EVK
  arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for
    tertiary USB controller
  arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 96 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++
 2 files changed, 103 insertions(+)

-- 
2.34.1


