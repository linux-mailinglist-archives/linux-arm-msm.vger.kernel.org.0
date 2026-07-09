Return-Path: <linux-arm-msm+bounces-117977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HVtIJBmZT2qSkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:50:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FBD731398
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:50:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ekFPnoA0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OCQhu6LY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117977-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117977-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D951D30505E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F36423A64;
	Thu,  9 Jul 2026 12:37:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B60430303
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:37:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600626; cv=none; b=RlHqjdrjISAlBAr+yBXzkQ3kOzcZwco5gWPgMznGRyoLPei6AVHuQZhrnIhvqGI4BnB+mSShXQ4fUG0UETp5vmffbp655As3+ETnmpUbErktAzeyfJ7/MC4WnEMvRsZIViyMM8F4fgMES6nCKNLVfA8bEvijhcC58YY3FFlOVsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600626; c=relaxed/simple;
	bh=xR2CfjR0Ttsj8SQ32cAovG2+MahSFFnfKHW/Fftfk6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkvH3l8cbf25iMMPXHuAWKQDLuk6Ym6z+gXCaQrPi+YLp84JHxUJTExF032zkQNPYhFko8BU35mKvHT4QENvvcZGBOpK/81LfQUQsXdoUFwofJwdj6naYiDhtk7puNhwTXz5mFOltgeUlpTAgvFx8ZPOO9myGvy8w4jETXLHhT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekFPnoA0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCQhu6LY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNTlG1575699
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/564X+41nZIX1jBTbCiHmQUaknwndKWmhk6gZcRTSxk=; b=ekFPnoA05skgA/PO
	BSkkex/FjtunAQUVVsI59qKO/8+/hG3qtwxpMQDVtlBCve3MYzeWuYE2UMqrjP5z
	JC5uMJPl3a8gkkcRIzpFFQr1cR9FbOpfGOveNqc/1zSrs1vYPYbNQCjPwN1TQryj
	VSSJpgyGktxppw24bOmH9tMCzIrFPv9JdLF0PVrtsoMlTzcjtfyv8zYjdd1Sue0U
	ivop8VTgVFe89IMdGet5e87IenGsmgiwYbxavarS3LSkocdergoZ2tgMbpmjCrD/
	nXQLP1EJx7ib8xcs3GcYwE+zOBfEN9r1ysrwRJZGxyQyWFzeT50dmPgGJOoKDYmF
	x3B3lQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwc739-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso798343b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600621; x=1784205421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/564X+41nZIX1jBTbCiHmQUaknwndKWmhk6gZcRTSxk=;
        b=OCQhu6LYw4QnsywX+nrMS7KUBj5nKJ0tsEVijKkr7nx8mGeUtszwpqWhZ4RYswLVcb
         2FcbkveowemZaojVAV03uMDFbnt2c2uzZ/CGC0QVIMVAL28u4E9tGpCg/pS90K6FKTZ6
         EdhmACXFWajNW0GDyGdBKLrnR0IdlhXzJeFgETMx4QJugE8xprOM7i/ailpn2cTi6EZx
         hvYF4AC1EnO+Sb1c5dua+1D725eLErRaLJ+oQ+X7Cw13mJMgrOPW65ePOLCCk70OaI8b
         wKy59mKiPorZ7692vmiVoNf1rmrVry+1XQAlIOsGLIkmXFCF53MFWt2pJhmB4njQ2OT+
         c2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600621; x=1784205421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/564X+41nZIX1jBTbCiHmQUaknwndKWmhk6gZcRTSxk=;
        b=RBVupQVjO6RYzUu5Cj05luxQTqHJ7MBEeFm6ect9hpRixJg1CdPrjxNEe3J5eFKzaR
         cV1qnvcp5gJULb2yUdyLwb0SYTMcLhzV6qABuZmYC8XfL2N1joeHsqavAs84K5oKjHEE
         XpwH48zfHcG+pvuRdOG7lxwmliBSHRiaYfNrvbhvrSJOnQWkvyAXxZIkYFK6gssdEX7p
         2JEQ5P9z9x3IdYCAkGAhjAQAp0QPzR3+8ey4XE3Kpxn+sOkR3LXGADD1Xmrtl1JEsGTl
         O9sExOrxQG6slVtMp5C2SpbKC4Nq1muSuCrRprGOb/7zzbtQY8iC/4j2CBrWd9AmCquK
         dPkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD6K9Hi+cHws89LMx48y7e05F9gccMz0zXfw/rxd6vckiVuKNtSP8mP1v/dky+rVUjQ6ZzDo4D6ry0lY1T@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCm0QTOFGhkD2hkVaHG/bmI8BPMOvMWFhMZccSANMyyvwbbl/
	UH4fHkXgdQDnX+F2UTfJWS+X7QFevHQEsdANqjaz0aGuLv+xjqjI5nUIjq+xO1S+l2GBKhC4fyv
	kb9CjpKY7kImV5nEJzEvjFz1tR9wo4sxu0IfWKMUcRkIrRgd4io22NkJ34s0nT1j+TRW3yQJMoz
	h3
X-Gm-Gg: AfdE7cmhDbLQIyaeWCZVsbSAgoH3JPk6qu+vv3BG5c8QFzRlHy4jaSFgxG+bY6rsluk
	sO6P92lrBzdbDWit0s3/v2uHfKvUpwEUHwSOCeugIdMGKRmmqsoxQgQCKRsWwKljpOyrbye3hPb
	tYCCBvJPIr/Q4y5Z7UaYQ5joJ3OhSXzVYW1uxdTWK6mgSuOFyHM6uqg7iLO7lM2DxX4lJ/eW3yA
	pCYyB8VZGC1EYkHUOhijTr3oRhsa1MMpOsE/G8JPhiKSwC/UIkcn22L6q9KcM+SMWOVA4ZXdIM0
	uQqdxf6Li++T4PKsEIVIC7moejkDO34YMOkrLc8KLprSerxb8plEcbJQvAgtNvUpOz8/V50SnfX
	XjFT4BEnNJD3l/gvR4bxdi12SflIqZGtSDPeSgI8uSLiecg==
X-Received: by 2002:a05:6a20:918b:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c0d6b262a3mr4004990637.18.1783600621293;
        Thu, 09 Jul 2026 05:37:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c0d6b262a3mr4004947637.18.1783600620839;
        Thu, 09 Jul 2026 05:37:00 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:37:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:55 +0530
Subject: [RFC PATCH 09/11] arm64: dts: qcom: lemans: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-9-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2085;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=xR2CfjR0Ttsj8SQ32cAovG2+MahSFFnfKHW/Fftfk6Y=;
 b=mpFWW1OvlnyHxqVN5Kgq/RA4A6Q55QDLBUTFY1c47lxXwyPyMw6yIG6YstH4cqCGSxoYPTAlq
 XYERYzUV8SSDp82L/859VJcCmYHpfuGladyUUhiPelnXQg4Td+npjen
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX8C7NA34O08GC
 lxdZYGwIkz7f+4PJk2NypCdNFy9112eVdcPufWAhKy/UrgGmT6LDwn+g8e8vMsXQFFHX7djhu/N
 RnkKGKZM2XCIQmrARWoDX5JXDZJRsMiGf2AcCexE3QxiZCjVKM6LuPOfIVYnuqGGwwN2HY7HttB
 /Z2Kt7lHagaT+KiH5eNe80WAKj7txvTMMGks6ReWk1uYSJdfwLA4zHLIYCfqRquaedhZ4xJ8kQt
 vgaay7NTRBtlzqdhnRVxJFnTMoYwha4LDtacv6QvdlS6hevrvv5gerPCd/duTTPciK24v5ouSNA
 7T8UYHXiWIA9P5ryDcKd7yYR0ySR8LgmYJUYndvwYs4Wa9PgS0oHOapmDY3GoOjKN0BmkycOVU2
 ywIXGFUUlIA+PwOk3GKUnae0Fg2TtNuLflHP2Aeb3Uf5pODRYga1QseX1FoMLzwd3082yyjnDAV
 FILrD8zSJpjvUtcBQ6Q==
X-Proofpoint-GUID: N9GSH4lREz_QVBNQ3JYGyMJ8GX_TM6wW
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f95ee cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: N9GSH4lREz_QVBNQ3JYGyMJ8GX_TM6wW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXxinzKQioPPLL
 2mnc20s7TQG+kl8gFs7ikKp09EuQCT6ZEOAGteqIjNeBxshXVObn4IdStzpeeSIDoALCnENhc3L
 oriBPlAQZICYF2XKSNsaRhLWrXI+eXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117977-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94FBD731398

The Iris VPU has separate streams with different IOVA constraints. The
non-pixel stream must be limited to the 0-600 MB IOVA range, while the
pixel stream can use the full IOVA space.
Using a single set of IOMMU entries for the Iris node does not describe
these per-stream limits and can allow accesses outside the supported
range, which may lead to device crashes. One such issue was reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Add non-pixel and pixel child nodes, move each stream ID to its
corresponding child node, and add a reserved IOVA range for the
non-pixel stream.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a10322c5bc35754042640d56ecb556a5ed5cf281..90c300461b5029b4084b8b28130cd826155e4cbb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -879,6 +879,10 @@ cpucp_fw_mem: cpucp-fw@db200000 {
 			reg = <0x0 0xdb200000 0x0 0x100000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -4978,12 +4982,22 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1


