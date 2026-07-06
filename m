Return-Path: <linux-arm-msm+bounces-116971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ds4iETX0S2qmdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:30:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768B714879
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:30:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xc2Q1tBd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZP80XTXt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116971-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116971-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0E8833BD1A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9630043C7A1;
	Mon,  6 Jul 2026 16:57:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88DC435A8E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:57:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357042; cv=none; b=MXrsmalzufgA6RQbaDd1DkMiCYyD8qVTcMDDOYHuBIXC5+JTU5t5iRCw4sRsfv0X8HCQz5SzGmufYpPJA8rhICLG8yLY6t/OIizvHFNzo/JBtcxpf/cg54g6IPmyGltwaga0oXzj/ER75HWmsAWP4zsaGFgiI4O3RuvbmsIvX38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357042; c=relaxed/simple;
	bh=wbPY7V/FOl4cQCe5O2DtEsw3MYaK7JiEV4us8ye3x1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3fBahG1IAEjG1MKhd72pAiAJg6H9IgDSL3P1V/UczNUxh7rtlQQfZR9yiQfx1dkZRotlCBhXdE2+Q5p4cgunG7CTRvTY8mmo50gJE1OpGpEnaN556RXOEc9OvQSo/8gzewhU2sLwsL20fVTkSlpEDgaNq9iy4Ie32FEJO2Iq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xc2Q1tBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZP80XTXt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FsYKb1050282
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=; b=Xc2Q1tBd4ObuSVGv
	Z2uWuZG/ah0C0okCAzSaWsmYSqLXRHVShTyuVimtessLLVDQSDdBC0m+yRsrdsAZ
	Cr5UW7Ltudr9r0M+T191BnRUs5vhxUD49HLonGX2zfl62+emnRDaxycOqYHLeVcb
	wc+Hv71lQ8Fp1QXhlSykLaFSUdyNxvcr0sn0C/RSYIscZwrkh46LUbveP83M2jZg
	HSI47RDxtqeFGMJ/WHZSap7RjmktmAUgCN9hrZMqy5K+KFVh1DJ5l3pDVLvRc3pn
	CSajoF9i6Jbk+rd5c5DXVl1UtTMI5zNr/4CUjAxiBaPbI9Ubn90FAI+kjjvoWIy0
	Er+8Pw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0apm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:57:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84786d85ec2so4148582b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357039; x=1783961839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=;
        b=ZP80XTXt4+puUqpSajBPpKLshRyk3JL97/wyimS4LjVJqHlyFFA9gnbItoAiiIwnjy
         JuidT9OtC+nAagJsm/EldKGvzoI16eGnwfFwcY4q8GfYHvHS3iNzC5asJRFVkCDa6MJZ
         gA0mMiIPNLqdFwGlG54JB8tu6xsSi1fRll8mDWANTSDKC05VHMNkgdubUCObx1eZ90B6
         tC01RiG8oLCR0x435Di7OE4qKM/fl/A3uAfVBbYtGfpTva5TzhhyfOHFCkTwapz8ouIE
         sZT7q8MNAbdiEAgninUV5vMYEKAB19zpGD0qIfoFwqlv5GxCAnyAX0ooxvzf6ITYqKCO
         HN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357039; x=1783961839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=;
        b=SAk2r64c8BfCH8uhhkkZbu6vM2JK+Blq9lgyQ/SoQ2ScagmcvqZ0v0Fx1ZrzyJgcLV
         QfEB2LL+lg/sfuTZN8r5IpIgyfa8aOEDG1kb00hy3goqdli0vnA5ViGS68bfX6kMQfo/
         DMzGqB9LP7a7ianEQORaFEND2g4QU51783BIklie/i1/HcoYPUW9irJSjeJXg/hYVco4
         sGCEPwcMLHY+qNFS7T/Uj7R+20Wd6W6bNPVp6eRwDnxp+IW8xa31gxv5MCsdFHquCx4L
         5NYeHyndOFhn+la0SAc6eQ1HsxetWKHYvD2l2UCfI+rzrvNk0CUYjpzozjpVQXuSvow4
         h9fw==
X-Forwarded-Encrypted: i=1; AHgh+RqUX1CG0ikIGlOiJjFUMhFlpavzrfFrwZFRP2VfIbTd3rBLUQAW2jqAuPKpE+zcCvkPS/6KCtfSRZt94x6W@vger.kernel.org
X-Gm-Message-State: AOJu0YwrpqBnpa9GmgXxspBoP9UG6TG9Uy0gqGHNh5OR8w30M6piqA9t
	JXVFqnj/XryrodDoaRHdB/HfbGUr0jTHaEvLE0jaXcLz+7PAysJEwcbSU/bj3Gcdv4ws6lQrOZ7
	Bv4Er1Z7/aHrkc+dCYzXJKkIv4fmvgFO4fJSF1HZaMrEOz84hl06STS2pJAXfTBYz+qwN
X-Gm-Gg: AfdE7cnw0rqjpDo5WUt9fJw4WgQ3wtgRFQIzN3BwHVCEtPJgz4Fe5EuWus9i7rfCOSi
	LhjZZ5iQJuuNm+3LJr+5/b9aOesIWibf2KBlYSsI5TMEo9Wf1rPpghtQcZ5R266ih6qGLpcfcX8
	xJvgEMetxX6zM7jCVhu0RtVWoJXsGOEfY0gNTYnGlf4N1+DWC0h7yArrFj19UaFpzUUCw95JLdQ
	42PKxOt+v2Tf34jGrj6hQZB0LnYRKsm940wIu8RE9G73ttKipoNhyPOXL3r12LYjS3i2C0jIBr/
	7gFrw1d+YoOiWyNjcliHdLxsLJl1s8Yx5MIT0WLgpIxQQuK7B35ancVWvQ9+D1tlymUPG+tcqpb
	ZPdibud95hdnejTLfeTPnjC4u6sMSoH3DVZkSH2JWSw==
X-Received: by 2002:a05:6a21:118:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c08ed0f40fmr1869402637.4.1783357039474;
        Mon, 06 Jul 2026 09:57:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:118:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c08ed0f40fmr1869330637.4.1783357038743;
        Mon, 06 Jul 2026 09:57:18 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:18 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:39 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-6-afdca0125a65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=wbPY7V/FOl4cQCe5O2DtEsw3MYaK7JiEV4us8ye3x1w=;
 b=uIp4SJQdb1agf7l0A1zJf93Xn7ky6npMpVlZAoLLOlESlUMOfaywlUkQrpjdFuhJvffGiF/zC
 Wp42e5jaL2MBLNqPZ4dOCIwPH4FLxkvnx1FF0fFlDAOxJ32l0G6R0YQ
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXxD1RKZBmEvwG
 HI5qHPgAk2VxMQ6oQ0RL3drOBvgHIp/Sw8otIhm3iAoGz0T9jrAP4FTHQA/iK3Ax9vJTB++F6OI
 Hf18usKxbnz4KLHfsI9BEezx8hMxUGo=
X-Proofpoint-ORIG-GUID: aDVG9DMR5_ToZeKP9s5ScnIUalKSLWCQ
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bde70 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX1li7JJiTKOWZ
 oNj5MHrjhhziXOrFOkXEXIfijLIJt7kyniDM1al5KUqPDhbgCCj1P14MnrAOPA5WhzgMBw+DZYe
 uJXekrMKU3khN5HnqhFZqYvx3EaKUwe9xID9f8UZNS53n/DZTHMMVxPuHtXCzDE/ImsxJK9rGew
 dROi1/5Ckpr/sjDn9iXwfkm6H/rOab80VwCLVdHF1lrXfh07jJ8fmu6xJYDepsErjJUguLEP1AU
 uPS/UoX1uiB7/pYTJoqPegVmfLH2ZW/TpmfbjMVGYUo3n0t5pQGYeIbqjQHogCSgVTS0BXTfCHr
 OD8M6OoAsDTQunLz0rxXMwsN1GhQ/zeGCuB/PLLghZ4KZWwnIqDYmdtwmDABUWqlKsoAQIgMGGw
 +inSv6K3B7D7z9nS6v8V8rOimLcu7rTg4ZzEcYVOFfrYQrcdp0DL9UMbixriifo59g4Yp9sHd9J
 qTdMx47ynvPNVgPn1bw==
X-Proofpoint-GUID: aDVG9DMR5_ToZeKP9s5ScnIUalKSLWCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116971-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9768B714879

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index e506a16c9070..ec7f2c78ad18 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2090,6 +2090,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1


