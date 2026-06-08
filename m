Return-Path: <linux-arm-msm+bounces-111879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LsQ9H6XBJmo3kAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:20:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F86568D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:20:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PLjpSp9x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JslgQqjD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111879-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111879-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F31C5309B957
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6B9370AC8;
	Mon,  8 Jun 2026 13:11:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF544370ADD
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:11:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924266; cv=none; b=BltrpaRtffH1aTeKNyBJm6/bdSq5aJ0vMvnIHkSyPrxTLfH2wZpdrXO740sebUfXzpIbgJearnnsrJ7xgihyDhpV/3bxCbxPW7Crt5P2dzNzUBAK3W+iu6SC2E8qas0ZvXabbD6HEPqmFITbZ6kNOzju62sEBZ3M3vemK8TLh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924266; c=relaxed/simple;
	bh=DQT/zNqQq2aLAulWAmnNWMK9zqPYRi41u9uyToFunqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZF1qyDG5Cr5H9lxz4y6KJsOFc/BZWbDnAXudCfIPnvwDbXZJMbxaSqlwUOrcB7depjR8KmUXVQXLqmJR6U8X5zs4VoWAA5tpW71wtcIsFtVxaxEYlzCH6dhkpLSZR3yvJ1o2nsXO1frzBGsE4ObwGsbXs9iA+PnsoaAWEIXvW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLjpSp9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JslgQqjD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9R1L2965398
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=; b=PLjpSp9xJ1iVcLha
	SlOxzU0r+fTsHCyl5swAYh5dVkL6iFaZ6NoZoIkbWl3MHXeANjTcE2sxDX7ZOF4d
	v3PKnHzVa2MLrarxqcNqxMDtrD/5oe0ZDdBpT7X+10G5eTzgWL84kSrNaqflDIMd
	yPGGeVtXIu6rSt1M8YlcrU+z1XINGRRoxgyA2DWUkhDH5/fWUYf4rQsDJIR06POM
	FDUhltg+qaqLLN5NFYskNya5WWIYEevE2uGhqDBQcVW0ggG2IR9waWRVJfzAUmK/
	m2lP0d17m5hjXUfxyIdPtS/enh0mS4h4OT0Hxox5ItBZg3HIC5UFGDm7Ycuie9q3
	CEtT6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrks22y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:11:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf160f7191so25729905ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924263; x=1781529063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=;
        b=JslgQqjDHl6Ovg1PmSBz2tiIfRliDYN7Y4DTMDMrBkVBtvhg0N6Eaae5RcgAq2Ra9M
         Yb+kWO717cW/huhgwSpb4VafJZK7P0/swNc56cecCw7SxtOOb5F4WajGz/F3YoZZ0Z+H
         MPbG3hPqKuR+xmWozhhFiOGoz74uoQARGTaihCzYCZJAfuAG/1tuJh5e+TbjoTP+hEoZ
         uoqe5ugyenzH5wOlApAr4T4qeD2oc/i/wqWh5Th9bb/YZ1/dtopxGUNHL4QGTYR7j2cG
         XbCkjsA2UIX87McHPVdmjiVfByqb9xnX7qyVyrjbr3F9VSaw9naxi/VayxLWWoV8pRKl
         57pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924263; x=1781529063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=;
        b=mBsMi+3qM5sGXvru+IP5cIMiHF+w+w83nRWroVUHbEVTnUkIgrXZL+ThvynyinujvY
         +5FZ6/+yat2Cqi3ojPCUgUorMjqE3zLiuznTKGpm0rjm4nZJtyUq+Cme7QmZUOiL8VqQ
         BebteyERfVWxh0ALzGolUI6ki7K+txuEkyOILgTEIeO57EoXHUo+HmWFGjQtSLVzeQyi
         Jz8o/hfCi0CrIBOzdx3BfEh4HiWBkyAM1f3SPUSwlYqPB5xRCLUcntydK2HutTWeS71v
         rv77eyB0TMuFZThDNrs7MxQQ1vKV1Ko0siVJLmSiS55bqvSSYvz2MO/D0B3A+zqbfvuK
         QUmQ==
X-Gm-Message-State: AOJu0Yyyf3CugVcIuWyW6br/u8TVMY/jEZxrsS69VIYgatQJuA2KwibX
	J0GxD+FtfSOG3I/4Q+7fq0zT2TDd2jcQ99d03fsiPVs6NpLEQD3CLxAlhdq0UwFDTrLTuIMV2qC
	DNZ1pg9NPW70B1Zk8BXBhuaW+POOWs/bcgxPTpeBKEDxB/3gpXbXhGCZ4V0JRdiGcN7Sb
X-Gm-Gg: Acq92OFfQwsHMfvCIQvVzktO195wYgFIfP2jjsRs3YCJB8GSsf/+zL9Gf062BR/9deo
	FtqEFCdEwUK2AzrnH6Nrf0YuRaqywEkgKKcQYaZvu1IXT7MFiUjBAZS4oT4I5B9bnk274eIw8IL
	Cszh+KqZ8sdo1TlaohO/qkSE5IL4mfxMbUkHposfLpj9cXsoEnzvACm4r6CtSc4zJ8vqz3E7EuB
	+vTNstTth/A424I1ngUOa+2ryQZE1nMflMrUB1KUzVSEWUAOBwoV0A+lVAwo9OCFP8jq9bLnIeP
	xQn7WJDomwBv4UQKPTq/MkL+FFF5mQt761XaMaYfolFcQYAkc4jlhf4S+rOFsB1iR4vD1a2fRl5
	iKjLqrZSYAppn+wHTgxk7UVdEDa2bAiGKMtQHyeHstervKU8=
X-Received: by 2002:a17:902:da8a:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c1e7f92548mr183184385ad.24.1780924263469;
        Mon, 08 Jun 2026 06:11:03 -0700 (PDT)
X-Received: by 2002:a17:902:da8a:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c1e7f92548mr183183815ad.24.1780924263007;
        Mon, 08 Jun 2026 06:11:03 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad172sm185235845ad.83.2026.06.08.06.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:11:02 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 18:40:24 +0530
Subject: [PATCH v4 04/10] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-dt-m1-v4-4-2114300594a6@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780924231; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7ByKGzzDTD14i4DIQy9VognEH4x590vwDySV2Co3gPA=;
 b=nsZErkUbo/EXqASccR2ilHGqPbl/KdmXeGHwHAHGIBrjgMHzdglD4X0gd5IuKNYU/zbDE7RJ9
 FBjLaA0SeQ7BiEIweGWqNmb6hg54PGGtv7fa6AVcuinOiHZhiHZeSj9
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: Hb3VOHdL_H6AOsGjxWl-8LIkYDoxP_TK
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26bf68 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Hb3VOHdL_H6AOsGjxWl-8LIkYDoxP_TK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX7p6oXFPT+U2p
 GFbGNXrr5yxxKAEGiAaIfYiCubaozKqSBIgknczZ+77sQRPoaldCZrTqZBHJz7TuBgOtRlq6vd8
 o0pt203wamZes0Kz/iFrm2KJtZRigaxbBVC3fY4iQ0GoUdK7hSUZ4/m3HGF517eejoA5eXQLpLI
 a7GTVab3RL3RT3kU6vrbQoEdfltS24NYlOTT1N0wev48FkQheG6iKjqTVhi6HZuvPVcorWVSjDH
 IQmB9X4MNt0zVhAC20DRw8IhAOwoaD5oDoZ/9cG0t/NNUsCvIUgypOIrXnd6WpnMRZWu68o+iYN
 OzvrKCf7tiSeiWzy4D/htle6vGDJsWgZ58bo5+BThDm+bJ0JCiChygD0pm0c/LGk5bfJ6AE79Jc
 kKNxS+67Bfy+BDdsm/y9DBdDzS68wUS3thngC0bAgAv8AQuWFOD1sWKiefNlPnrKf2cMNNM4YVq
 uijKGzZldZSFhl0lo8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111879-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:sayantan.chakraborty@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C4F86568D8

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e6ec07a865f0..ec1bfebed226 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1


