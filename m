Return-Path: <linux-arm-msm+bounces-93304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEq0Htb1lWn1XQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:24:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EEF1583F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BD6A3002516
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EDA2FFDE4;
	Wed, 18 Feb 2026 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2ONqsQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frmenS0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123DB2F744C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435474; cv=none; b=giR9CJ6GBwfz/EU9uaGVicwkEZUrmag1aCyAB4QHo7ktZ3padEd+kv/lInJytDnKA8WeSylUGJG+j8QnaF6HxhaCfMhKEIE1g+id2ewFScrpsl67G6BOYKTEtEAnqTGYnwSS5AUWhk/COUd8CZq3CpU0zdkOmb2D9hoJw2tGTp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435474; c=relaxed/simple;
	bh=4hrjJGUuTmPdSNRouy7j/Yjv4LKXbVwkg62IVzhs4Og=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Itqx/K/blqrhNnxFrwu5G3gdbApKzZhLq9pvdh8ofN7Q9xFxW5vM7w6DIOD+qFGuovpnX32hTNJk6W/EKWq/30ytSpLsVvL7gypyIYoS1eWiQQ0lbgeV17tBjcMzQcVi30dH9F/HUHQzdzU7NGV1Ca384iPd1aPKEigq6hC+K3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2ONqsQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frmenS0U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IDVwg71046695
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HpAqhLvPxhuGwRTrvYggys
	NyS/zmnMo9K/I1PhEVNS0=; b=V2ONqsQ7A5vob43PptMVxgL4eme1dILoldcQMx
	xA2IXSFcyKSYT/hu4BaaKXghUxmSPsMybCoLWQCPJWVj00KPd8GfZCb6TxgapTVy
	ZJHo0CEGfWvUjlZbwCRxmcoULmPckpIbYbzkAk0KP2bHAkEvteRnR3IBFwcpAKto
	txOdKZowBcgNT/m85kz07wvDzeSoBwuzwdcEGgkHOg0MY05sj6XbgqZ4CbOTjdVa
	ygmF6u0PkkeA/9T8xBocUp25pIcwmIdc5zjuHq+V/8LxH3GZCdXMo8kPJxp4T9fc
	ZgA2PumHwL2ymBNJ9ORzRtVtimlsvFfpxuwIPGb6yjVaYmxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cded00p58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so57283585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771435471; x=1772040271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpAqhLvPxhuGwRTrvYggysNyS/zmnMo9K/I1PhEVNS0=;
        b=frmenS0UZpfRH9UuQHZnlaP5j+1KUlgPMilG5+UfXzuSoREaNlgWKEgo78gJ1ympdu
         gfUAhVJfDS4OpT1NtTT+YVyZGQBHg8CWrKKlL7rzVNgs/0LXv/+9e3PRSCKDk0Pi2VWE
         2o2n9g+qY6vFV7dc5wpmVE7bSaahjPHT7IVNZ+UZjSztQLIe+AHfftQxVkfYVGarhFIZ
         b+vEtLLiM/Cxf2nJLYb1kzxLNelJdEKsNcP+Y+TkOvoRNucK1sr9qENK90XvIrWkphV0
         Ph35Eqhw2rqBAGHTAHGucZQUtU1ztuxXvXhbfz1bcyZFSAA9WBIFErPVMcWYcOmhTxle
         fnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435471; x=1772040271;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpAqhLvPxhuGwRTrvYggysNyS/zmnMo9K/I1PhEVNS0=;
        b=Fp+s5fgC1D8mrnIjtm+OOXkdnaLard3x9y/beRmh6Ytvgw9HysNZEc4jR4FQ+T7ZqX
         jHcQwe4A1Q1GWlKNKK7gNHgfxgahiN+QXkj0HkiiznVRT3HNUNl+I0A5XVS+HEwYWyz/
         Ujj6incAp5CsJ1JxmFjdc0l/38iXbpqFa2FnWByAh55XR033pl1hGtQmcDoGLCALGDJG
         JO0vBk+wc+INxcoc/WGHQFItkF/Va5Nf82uyxfs71KXoWZ0zYkTVA5R7SnRK6XN+pSIV
         qALJOEZjlqi1ObBPPB4d9jdDoiTmu/dK7KUeN9rzn2rDVHsYQwxnEtwM7ppPltMaNNBJ
         EONg==
X-Gm-Message-State: AOJu0Yz67ABnUcgfW1OiNYaFas57GOfSc8AIMfGSfmmvFPQmPKWVIulT
	rT/COi/PAJYlweITwG8Fb1sLMN+Q6r+tAwI9HXOqlU3tuO0CXec2WnyXGJnGTAwmlq/3hh7E0Hl
	CD6YXotvFQQz5/3F4Ll/WTOSppwlh4kCjC9YdbPhMl0/5CqX2xXk3OW0sL1L9deWiWmIP
X-Gm-Gg: AZuq6aJX6+9YT7Zr3phL2KlO019fF6XKOoW2eGecMV6F+MUqMn6pE5xCYal4LL+XMn3
	32xpmGvzxcp3HoHOz5DwAGb3eZXgqXNehf+6bmWAPYs0BOfOqM0doFWDF0wKMiJTSDsWS5ogZ0b
	vCseIph/OE181CLgpQCZ9VgHOy17tw13f1aFgYSN7q5FK3oSwfMCZXsS8BI5tjhy/XDWhqIjRlM
	t1BY92NEl6sXbtKmk36WcAwq9nQjPfBRm1e3dYKOwHRownc5ruBT0bGN5lAVOGlwVuy864pBnXr
	pNv8uaPyYOoiPl7Dbn0yv7WXeeBz/v+4ZqTAHSzffiGWVA5A4Zicvwn0GSJXGVPUI3Raj0B5yqn
	73y7+GdtILDmvMcUX3glpRkSj1P7TLH+0VcUjHQ01BIUtSQ==
X-Received: by 2002:a05:620a:44d5:b0:8cb:3a18:702 with SMTP id af79cd13be357-8cb4bf6994bmr1822432285a.17.1771435471382;
        Wed, 18 Feb 2026 09:24:31 -0800 (PST)
X-Received: by 2002:a05:620a:44d5:b0:8cb:3a18:702 with SMTP id af79cd13be357-8cb4bf6994bmr1822427585a.17.1771435470842;
        Wed, 18 Feb 2026 09:24:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm44181368f8f.32.2026.02.18.09.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:24:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: Drop redundant VSYNC pin state
Date: Wed, 18 Feb 2026 18:24:22 +0100
Message-Id: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMb1lWkC/x3MQQqEMAxA0atI1gbaOsowVxEXtY2ahVEbFUG8u
 2WWb/H/DUqJSeFX3JDoZOVFMmxZQJi8jIQcs8EZ1xhnv7iFZca4KyaKh0QvO64sirbylTdDX4d
 PA7leEw18/c9t9zwvrHliDGkAAAA=
X-Change-ID: 20260218-qcom-dts-redundant-pins-13a3a0fb5c46
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4hrjJGUuTmPdSNRouy7j/Yjv4LKXbVwkg62IVzhs4Og=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfXIE+4I+xwOO/6eTC6lSmcul/Hz8/QhHEfOg
 k7i9WvMj4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZX1yAAKCRDBN2bmhouD
 11WZD/9PtPqPXMvG+qDp4LMAOorrZ1fgGD4744ibwZiVBZrP972449Lb57+Cg9Nf8mIQyM6LKxb
 pqlNGxeJF5+3/x2mscVM+PyQB0bxZZseF1jutvJXCKYWmnK9562GTUm+K79NLFgejHqYHFuQ2AE
 MQanrt5EUk3w+S79JPCMPJOwEu1nodEb2QrwI2vMbdd7f0bW6lvTXt8xTLkxOUMhEJ4jjskhRE1
 TI4zeyx4V3TQMiBLsAst2XIcYBD0Fwy4X3LAC5UGEgGdwa+TzUuC82O1tg3JzWPX5IxpULkS1Zm
 9Vr4AClY/phJibUK+CpV2TM0AAKVtsG0cFi38STOlObeHSXMSQyhCDKiXafnf1YV7JFKqJ3vyL1
 0bFmLIa+Cs27SYS8latUsBgiE6pkfSLjj3NSnVbHhZvKWB1awbRm53Z1yLGLQeQBPwwM9VMC0zv
 uJQz9gE6d0cFxCrjsKci4peHjq9BCRU6aoCchMNREvX5S0wnzJVkN0X3X0Kz2d/tDJTeQKeTbQr
 OkTjkSmOL+0FEqfgVXMzVWJHGipoCRUMK2RSWkSnGuMAeYuL+EoHfoOjMLmU2EuuFqL7oiZThM/
 /UVa5hNsq0kcBzC9oNr+TwnIpgx8cUZcc0sFjrZrrmLqUbmIcxvimc3CfmPejOEQxmmdUhK79zu
 ZB0shfyN4B++0qw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: StZ0zI7XMX7f5-95BykyL2Z6yDrzCCXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0OCBTYWx0ZWRfXxNMGK9Qfe9XV
 csJgaCcyw0WlIlh6QmDheuW1galmOzIo/O7WJEQr64XVKhhRChYv5flGLOAGS8VjdcOJJDBkK7n
 8Rv9RNekUO/ABN9irNFwcA0lFCaoIpAcVCBSmOO1P7vihLWaTrLLQHwPIUwCp4I0Y9F2v+2KYBb
 BOLyegwWNgM9EuhwOP6Uzm9rtsnFpMGonbK9Ixf3kx6cSBHQikCfZaD7wvgHBTMaz0b3ZR3y/XO
 EgpC/3HQr/Vu8vs7unqPqTu9aYt4cNEl043LLThpebgSvUN2p1jeHHA5IB6OCDbFuaVhASvDYIg
 dqWiCgaNqHUzgiEltF+CD3VynAoXrcx/0Xx2tNDuaSJKoJHTDEg77UYoz6bUf9Gz3z9vil/FeBh
 QfabrWZ9xBC2X17rwKT6X3ICb2I1fJ5ooh+ule32UbC46CLGknUL2FtX1bY2tFvz+uomtUumas/
 Uib5PKBhcneeU3EEDJw==
X-Authority-Analysis: v=2.4 cv=b/q/I9Gx c=1 sm=1 tr=0 ts=6995f5d0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=m1syVNA5OkyIPQ6o9u8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: StZ0zI7XMX7f5-95BykyL2Z6yDrzCCXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93304-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9EEF1583F1
X-Rspamd-Action: no action

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: qcom: msm8996: Drop redundant VSYNC pin state
      arm64: dts: qcom: msm8998: Drop redundant VSYNC pin state
      arm64: dts: qcom: sdm845-axolotl: Drop redundant VSYNC pin state
      arm64: dts: qcom: sm8550: Drop redundant VSYNC pin state
      arm64: dts: qcom: sm8650: Drop redundant VSYNC pin state

 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   |  9 +--------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 11 ++---------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     |  2 +-
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts |  2 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts      |  9 +--------
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts      | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                | 13 +++----------
 10 files changed, 21 insertions(+), 77 deletions(-)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260218-qcom-dts-redundant-pins-13a3a0fb5c46

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


