Return-Path: <linux-arm-msm+bounces-98118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLSyOVohuWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:39:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8DF2A6FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C15E23039A52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB5D3947A3;
	Tue, 17 Mar 2026 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgXSH+vy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5dw+4uL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC4437F01E
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739327; cv=none; b=lzgv7N7LZyWrpNSVDsJ9TKv6Mt26LmnQBaKDhc/FuqcSuUqsg4EfqmYsaDNh620L6VhqgHSV1GbKjFYAnq1+1n7x4jId9+fRAttCJUBPpkZ+o//S8d/ouaJUITQcaRLp2wr9K9rCAdbid8Xa+w+eHThDlrVtwXKTT0O1jQvo0FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739327; c=relaxed/simple;
	bh=gNKhNyU8Oyr/Xdzey4+OBtMdjcQJNeOG7d2xyewrd14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=thPRVbCEjZfBqlH8C9xybZTuoNEVF2zqyIiFClXTVin2U3Aly3A+BEHyMC408YnIJUxufTzJIqE5iK1XcZ66WBAl7woDztPm/HH4niOXmdJsEfqbe27rSOooZiHvO7WjIa6vBzrjyMiqRriyVcYE7V/klRncn1vEqAbyeAzlPNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgXSH+vy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5dw+4uL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7ZZGi2375018
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arFztdI06DpQzbYjhOlyWZCRNNwQAGFQwZvfaHEejqM=; b=fgXSH+vyiLZ7lxbr
	avUOoTh4zVC+6whj3zVISxIIQ61H8ZxrP/0CU6pmelZwgIycMNwhhneqNbulVPCY
	3I6uZ9VtDP4Lxja7Zd73gzLZl+KYhWJk4R8qxdd9HgNtHWGRXP6GgpqzE3RFNYFJ
	Z5Dmm1NmvdR/KQE0j/JddrN+dFy1xJwMWfC10DiHe8mIku4VohikFUCCraEhiUwg
	sh5vmbmkI+T6Bv6ct179N19gOLdRZoTCQwjemUNWY3O07ayJw3wGNKEwwiL3TzbJ
	fXNbhoJ28Wjn9oeZkTCpXupCZ8+tYxDKJBhNclTy4YtWJs7YnBm6JLW1zN9DAPKG
	3TS3Vw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkby3jhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso6315803a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739325; x=1774344125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arFztdI06DpQzbYjhOlyWZCRNNwQAGFQwZvfaHEejqM=;
        b=K5dw+4uL9n+36xZJeR0FIbi28ERBJVcic/0ddCTJ1mptfbNFV0FmDwdl/MIx3I+afI
         y/P+471bME9CN0KkDj2gdRuGNzKMC8wmYHLj/kx57QOqn+4YdrtgBXn85p2hmivjerT/
         GCQFVDwMsWlSR4u1rQfSAeGGabStYyt56kMfYWdvGcJ1T5qrKLTVA7O1ynpHtcXLlc47
         ZUmvT6T7WMIJ1R6B55kHQqSN8v3rRgmGolcUx8CTm8/nc4QVZ1GykC8VQdF3mH4Nv/i+
         1/ZGvt2dTKmu1ORGyFys1VDGKoD9jN8wAXvZgN6tMTsowNzVVTPYnrBCieyh6dizHTwu
         JRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739325; x=1774344125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=arFztdI06DpQzbYjhOlyWZCRNNwQAGFQwZvfaHEejqM=;
        b=KlcqeINcZrZiLfyd2kWX2UmV6sN982j0nW5IebjZqajB2/Wc97IBlqO/S6btSwZ+9u
         CwAHBEMxdKtp3QcD5lUvupzrgEMXf9J7rB4RFI/mg8F+qvYfS74Q224k2z3jKSkU03Xd
         lvKrAlrcIcBp+l06gOoVfDituGbWnYklfkO0/a7RqpiULBzKuxmsO2TIM725fs68Waz/
         C3EOkMvW396IRyJYNngOlSwf+Gdw75PgiBa4tKGUjjlL2gTRu5c0zVgpZOf1tjnW84bN
         uLIN5EOzw5gvByH7NIx9ID0GVlfpv1LjhpgtospZ5WH9neIbS6+OGZ9wSJNhLX+qi0Aa
         1K8w==
X-Forwarded-Encrypted: i=1; AJvYcCWcLFYPxaOP+1cPgkpUUb8y7veYFigYIb8u9Zr3UPzQUUjbVVYp11A9+mf9bPJ6VpMI6Y4YCYfOYtNzADGk@vger.kernel.org
X-Gm-Message-State: AOJu0YzEoyuMYeM9DNFq6E5Iaw1I9Ek0dKTLRoYzpDVXdoYYXZrl1Aal
	DETJGiCOdNKqVAdFoOadRx4umi+YP8uCzvrWq98/mYEQmtr/8drnSNmDAnoujxHTfBfTyyo+VhT
	U3qBcRKYq+XdOAUrcmecMpbdIMJRgCIw5Fcn9CxiSm/u3xvRI25Bdl4dlamXUj7/z+CfX
X-Gm-Gg: ATEYQzxLsEQLpTIJ1rPCoNderAVkvW0vri42agK1yDr38P6UT/4SEmMX7SIeXX+Zvfw
	rgoK+W1zb7tNIYN3JVm3vsUIE0ohaePGmUv2BqiWmauq0F/289z+phb7eo3+wACfW5cK84OYPKe
	7+V7E0DatpURUVef0b4Q3xc32+ofMgxnjuRrIueHzy28cxvNn8mF3FH6DCApinTgPr46VoPJrYW
	pw4OZItlk5Lo63LpI6hBM37nfM1Lq7gcG57yeygsLwj9tLj1dmD9D8fLEs2PyeVS3Xtf0JT7cgM
	N/4On0liv/MuJ8gPPfCggYKWdmLTORZ1oHwyByVC2AiSYUbXzuOe9TBYQEjlCPl3ojOUGq7x8L4
	nCgkZnjnpHuwQ1mgPjGKSs5lH29K0zpHiboXK6CG7ilvJL08=
X-Received: by 2002:a17:90b:388c:b0:35b:96bb:47b9 with SMTP id 98e67ed59e1d1-35b96bb49c1mr6229858a91.19.1773739325309;
        Tue, 17 Mar 2026 02:22:05 -0700 (PDT)
X-Received: by 2002:a17:90b:388c:b0:35b:96bb:47b9 with SMTP id 98e67ed59e1d1-35b96bb49c1mr6229815a91.19.1773739324787;
        Tue, 17 Mar 2026 02:22:04 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:22:04 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:45 +0530
Subject: [PATCH v3 06/12] arm64: dts: qcom: sc7180: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-6-53371dbabd6a@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
In-Reply-To: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1411;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=gNKhNyU8Oyr/Xdzey4+OBtMdjcQJNeOG7d2xyewrd14=;
 b=9pKIgvcm//lW2L9A12Tw6qrcqejMTVkaU8/oO5Vfj+itPFa/MdFnXkxkFwzMU1HNV6GK2hYRw
 O29OtC/iUwPBCBQV44esx8o60bTwk9BGdGNxCPN2gIakMx4AboMBR4d
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: JPbgmpjqmMybMMFNLQ8RvbBJGpYi6gT7
X-Proofpoint-ORIG-GUID: JPbgmpjqmMybMMFNLQ8RvbBJGpYi6gT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfXxp4gFm0Rcbe/
 CLh6axTKZIbXVjCn8IBOi4xaWWmOE+/qWL6584/xBQ0I8Bo9wKChQAuVdpUgZlJ/AkpHOaOQWyU
 Iberuv0BG1f16dZYVB5mVftUo3oPlWJK5AnrkOCymYxLyxTeIY0lBPU6iHpeUUNoNTaoKv6Mvb0
 G2/AobPm1UzwalvLwoG4RW1CylVQQzdSzDrsAOE9Wl79OQ4t1Jk1gsz0McCp2JbsRoCdvgo5lBh
 UKOIPuwn7TzlQ0eSfBWiKJndW6JsKWFMFGdl0t71efOeZUaU9z19zruqwNeXa00j33sGWBYodF5
 1XJp7kW0/RQ3vPWmS2hD/K1cqPYLqLHK9kbU9WXchQ1/UXC5f56AnBgzaCADUCBeCLiO5+Qp6cK
 KdBG1CtpTxe++flvLjvkAJ2Tw37zZHvSUxT2W0pS4FCNeBoOYEXFM/OvMCHVAtMhiqvUFuu1OVg
 wyZp3vg6f7mCrf3w7HA==
X-Authority-Analysis: v=2.4 cv=ZpLg6t7G c=1 sm=1 tr=0 ts=69b91d3e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98118-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1e40000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,1d90000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF8DF2A6FB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sc7180.

Fixes: 858536d9dc946 ("arm64: dts: qcom: sc7180: Add UFS nodes")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8d69225a4271..9eaee5dc824c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1605,7 +1605,11 @@ ice: crypto@1d90000 {
 			compatible = "qcom,sc7180-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d90000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		ipa: ipa@1e40000 {

-- 
2.34.1


