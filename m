Return-Path: <linux-arm-msm+bounces-116969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hNtdNZbgS2qebwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:06:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD8713AB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="RhQbgbp/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bRrN70kG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116969-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116969-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EE5D3091077
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF56E43787B;
	Mon,  6 Jul 2026 16:57:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6743784C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:57:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357036; cv=none; b=SE3Zd7Tpf7zZOq5l/Ybfizj06LQguoLbwGVUABbXR2QjtkIeReBwKkDefw6hBq9P/CP9lirBELG3vsOdGaGv4tbcnaxHNjKNnEeYEYNrkoFw5NU7cUMokGSjOXwd58vg2Kb0OHuYwWTIaM3tBM7QBkjGGPQFifBk6zkHD7O3+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357036; c=relaxed/simple;
	bh=jqUN234mlgaPq8CBPF9A9IY6049dMha0UkLsYYR2Tvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkvC3HAMaDa61ZjOR68GkouKpT6EHmbvRBZ+dZFxDAtDBYwvs41uem+oTP7dDul3lmV7Dsw6boR9TVDn+H85R+vNmF36oXZVwRLXeDxP2zwAR/jmiLAaZq5kQG8oNQpnqIhRAMvTxdWU08rtazC9T/sgXnesEsz5fWQnz763xT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhQbgbp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRrN70kG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFNsC810177
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=; b=RhQbgbp/Gc3Cw2k1
	FM+795kU1npAxorRu8Ca/uqJcSQZP0gcrzXFhQ2dOBIbEEbC+2+EYyhd0lOSrPp0
	jSUc47Ilph5EI9I4oOXTdJtKRcitfTiDnMJucWUVt+kr5xGDI6DKpdZtOxbk3Oh2
	psaBQ6AaHmmCjO5afJnSgvPzloFBJISWQyCKfS4+aeh7fhrHkTzmuhZpKXdsyNsV
	Ti3jhJVyIwitGgAs29xe2a3gTBzY4XmdLGBfS0r9Ok+uENmwbl8EBIcjCltytoVm
	JuYDTVMgoVfhnV8dCq6mdTPPqD0y5Qa120MKngGEbma8XcFJ0daQ0G2GRaI0Aweu
	il+ltQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsaegy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:57:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so5315757a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357029; x=1783961829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=;
        b=bRrN70kGNEfbhEsP0Tc1LcDCIEe90/nVIs3fmavqgEaOWzriZpz3ONjWf93fgN18Mo
         7qSFCYjgTli5W1cm/6rxRdxq8b89b1s3xNjQzFvtXH3qDM8iQQKsvWRC23+YVfK2bdUU
         xGoGd1ScqlY5y7XMpfQteV3zgGyZpvVNhdVq/b9eWoNf2DA/sdf4aAvJ6IzkIQGdlb1/
         igkyapNFQlrBAePh6ZvmwKpaOzYSptP/dScVmxV30vdz+jYNzcVq8WRvPbVU5iD0vRqN
         yxCEppx+Hry4vYEaBwvS8RL8EcL+9WyMrm1/ZJq695ActzHXypb6wdBnlDkngqYORdWm
         WoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357029; x=1783961829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=;
        b=F/xBsIacuR0VBti2rq3tWyFOSSb7KXV4eZV4zWRm78knMKvW9HsBQExo+i4jNjWw9l
         wnBjgUzSGjGIFt64S6aWm7e+f3Dbpn0yZ+TH5/CvzMDRJpuzBBR2MiuSThEcAVthq8Ph
         vK04N8NPWhpTe2AjLPKEVJR0T5b9zwgXS8YtTKvKs9IdxhlKkxqoe/B2rsDBe0NYK8K7
         ADo00PYJyZrCUCega84urChiC7xcPeLlIO1Eb7qv5RdtvxaoT4gH3aCBqgaIOjyhgUvX
         tcPLVQUKWkuykDTckFnJLLWVwwq0WJI999WkPYFJOdVs1YYr+lBeiJFKhwsaHBgbKcKG
         dHTA==
X-Forwarded-Encrypted: i=1; AHgh+Rrpy+nW1i3IjlG+/wIq1jQNTWMIsLNJv8D6BzCEXj7HJAYtLdhtaYmnZXesQmMameq9DfNOeFL3mPeVkmoL@vger.kernel.org
X-Gm-Message-State: AOJu0YzPdqqhes9DarY2vPjc6gNVVVnr4nfOyN4oQIR3xRg5YShkznTc
	FoRVhZuOXIqhF8eoMV8do6NW/pfbPmVY4WfB+ltrVOeO2BKS7c3bn4Fi8uV4W0uVsQM7Yj7D0qy
	7nUgdJEZ4Qu1LB04X+wAS9lqJ5Y9P1LBhxz+SGFpenIeso/veSkjXl7aqL8qRYKvf4n/f
X-Gm-Gg: AfdE7cnmPXqDp5LXdF24/8hb+njP6nhk8+oP6gvdtKph/UM4iFq0yfTVbNGFDLNzg/E
	sOT7EDN/xNKLk2JMMyOKvGDlnUARFWCG3J5w9aMipOcdPuFRQdCuXmrSURkLJttJzfVdi/NOgHZ
	iNFx619jNuGRZtydb8saVhDan973dQBvt1Q2f0B0fatKViZJgHAY2zwh0dyGVeCmfdELoIPODO3
	KDFj+L7m3TQc+/bocUh/7wNlvrWYSDCqZ6t0WlQH3/GD6iqSyzRMrEPI43hZ4e4XIAuhqExHFhW
	IwvcBO1GpFnT2rZ7WSyHv3Lo/P6fiuywsImwtD6v64jAGPsUXAU/1IFXgfN2bDevwAak4cOcGKV
	k9SkcVwwm3ccCL/KlrYNtAPCpxe9IXkBRrDLb1SXNmg==
X-Received: by 2002:a05:6a20:914a:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c08ee0dd12mr1703398637.25.1783357028897;
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:914a:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c08ee0dd12mr1703368637.25.1783357028421;
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:37 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: lemans: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-4-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1066;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jqUN234mlgaPq8CBPF9A9IY6049dMha0UkLsYYR2Tvs=;
 b=1ji8Ma7hdzOxQlIfqJxCYd4J3ISJcrVHCJl+oAGjgiQX8DpK+re8r+OuerLb9O0po65oAjDV3
 yxt38Erb7ESAe8axkhSI4hc2FzLqGqjsLkh6UNnFGO8TVZ8yM5p+i7S
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: 2pau0UIa4Ly2JY9Elp9m7qfFZbAaf3Jo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXx+7sHRXsQ+br
 nNbAq90M40mNB2JzbnKrNDlfQUe+FIEH3CDRF0r0taCz90gapEzBhdIQj7WQ4vZVsGTtmJLpy4H
 C0anbNhEZzJhs/DAWrdkNUHBzJIKc3szXiXBqZIsV5aU+2+hLr5e+Kv5xKXi9584WciRP0X/dw4
 jPy5/DIb0uXzoG+HApkX56n6GHybk3VAK5SbXuvH1SPKQFMOPk/Iu0mb7uNjIYfQh0KE5+SbdsE
 vDT5upOTFek5wSECU1CjdhjX1FT/F3azF1CUyFso2B7gTIewnqdFUCDtplb9CN8bnKEly1BfOPG
 oShdd4YLCz0jnamjJ0l3YSUqqPWtpi2r+2gGxKzBtqf2qk2XMF+unpES02buko3rUPvconFbtKI
 DZJ2G4FC9oLehmrT0ggMMQyvshAzLSr5fdBGfJTPQ4IiuqES1lFadP7ZMpsywrASIof2sY00P/m
 7tLCyOuLZZI4zNZ7t9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXxwisNqBQK4L+
 DHlRHAqbCRhYlV7kKZ0cJRnJ0/UKxogddyHq/U+70QnpOCwGQyIcuMkgcl54qRL4RBP4HWxDdDq
 HfW7Ife9FL/HWSx+JCeDt24a7o6brKw=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bde65 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 2pau0UIa4Ly2JY9Elp9m7qfFZbAaf3Jo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116969-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62CD8713AB5

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a10322c5bc35..167c33d14375 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4809,6 +4809,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		serdes0: phy@8901000 {

-- 
2.34.1


