Return-Path: <linux-arm-msm+bounces-90298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHoDE/wfc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B571849
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8447F301DC25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DCB3783B3;
	Fri, 23 Jan 2026 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyKQfKoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfOs8d2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152336AB62
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152419; cv=none; b=Iyh0BS3dNNLpa2DpiEc4lFsWKuFebtINJKTqGFOoq+uHZy0dJVEYOiql7vcEh+zxKsifX+FR3Yjs3ZUheBnByjNW9LvrnCyGjQqbm8A54M1bwqtn0fiq4k37Dgigr/MQZNONK/KGRCJAl8yMATkEq+X96W7p9bK1nccNjrpss3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152419; c=relaxed/simple;
	bh=h2BGt+oLruhKNtRDwx2YFXay6bpO6ryLjJ9UHjI4QSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAhIjxRd1qHUemwYKdJm51QnVsd/oSsl3ksF3qfyVVDvR+/lh9gYE5jezXDuBaixkGymzfJ0bu62qiMnxAQ/+QQrTmI5ezNmv6g5rS6ZI7e78VnqVWIuNm8IcZVgQsEhP2rxNZasvvN+bCj6TnslNLUZgwhd9HnvDrr5MUtlMRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyKQfKoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfOs8d2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N4S5Bo3812527
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rKsEvIZ1Zw3Y1fRSMj26DwJShx0tsjXzs7N8oHy/oLI=; b=KyKQfKocz96CECzy
	AqVZLzucjN1kKhfxDxueAIOuiygJDKxX4Q5+7ZULMiojE4g4LyEllDrrrUU1aViQ
	wQ5tUkazxEO6QvaNAr2aeh6uC2Lqid0ff/RhuxIhw/JMK07mjSqewc7piIG11qGs
	AH5YqLqONCRwqfPWk/ooBK5tvdCOxOB2QQt3MKmPbeRYgjjs2SzgJZfodT5N+qOs
	tuZBTsH4o7/NGg4iGvGxGk2/oyxwgcxkeSQZA4kf6aQICQxHbK4sih2vTawwe+93
	lqrtFMSnli137wBaGNG85DojNCM5uGicLzeewr+iLEpb4/aZh+LcJjT1pQU9ARLi
	LMM1MQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujq1bu2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so17468665ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152403; x=1769757203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKsEvIZ1Zw3Y1fRSMj26DwJShx0tsjXzs7N8oHy/oLI=;
        b=hfOs8d2zf6cYk1kYOO9vcp6S9OdRYLYuo0L6H2LXGeclbaa+7scz/K2YXIVOiU+iJp
         axL+6mlUKeSWcl7KGgxUq+zEr6+Qe2VHDjpJ90xpGs4Fck9IqxLkDk2hrD4MNz6DruKV
         DXT87Kt+0DRNhsAWE/elvwGvGH6GOSqTIHWO8fX7x7eyEIpoxOCYfXmucU2rzLQ4I5Ic
         B8q6VDFHaUazgBRDif3H/IBEqEr5Cb3AZqoJ2ox5envE3cTHye57XD8a7E237wnIiAAG
         ZMSnsQ6QLYkU+QKeOC1UYntBnU0Ph+5Wq/gqKIdQu8mIyCohqF5KOdxbnIVNzpfvmPxU
         bFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152403; x=1769757203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKsEvIZ1Zw3Y1fRSMj26DwJShx0tsjXzs7N8oHy/oLI=;
        b=W59OHSeYAYMl49/0YCGwByZOwBQQpiTrEskbHE/VSCSv0Aa5Z6OumbhOJO3n5Ak35m
         TMj6Z+1LRHsKjPjFczxdPCQAhuoVrAVKi4IlHWulRstiMzYI3q9n+A4O/r0OaSHX3pfA
         OmdKXL7+/IQwxZdn+LtTg6eJ20ePyGib0rpsiZ2phR0CXdcQkO97r9T9kd5WIYTioV6R
         H/Iw1J4i8pR70mou2/bor+Made0d73/pBLsFlAdhK7uxvB5jveu1D6SmsPXE5jMLn1um
         r6YyMAqA9Kt/djFOh05yjI/8KViPeTXRTLZOwAF5IREo5wV5BRXYHCBC170KN3Gf2VsN
         GHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJz/ScXMX5oDDbYAqAhkIX3ZNB46eBZSvZAWB4D1sERM0fz6mbSIuCmPrfdTuDdVIxIop/zZJNk1ml/5yd@vger.kernel.org
X-Gm-Message-State: AOJu0YzkqSFMvuUwo6NFRepkSqpmdMD7afEv5vRhGdQY9V6qLLuWks24
	P1uMXL3Up88F8SmIyCmOriV91nD2d/LMc5PafRKV1I7OriamB0wl6FYCDlphh2J98H5wj+CK1Lj
	fk5kemH+95/NvBxHFkNJ1A46ZlZKAnjf7MQJmGhYBMVTCLkMJ6S61gIQUFs+XT3ZQi2CS
X-Gm-Gg: AZuq6aJP+6Yj7QIQj7LZzSy4bXCI+XWl5JduPjrAtbSM75aYop8LUHc+cdEDXufp4zF
	RNPQfXD8eWEPqKmkdTcFvgSXrFJE7Ia+80MoLwszU3seJlzuFYuwNrJu58MUFPVr11FqPjceEgJ
	3kGDT+yq4Ron4wOJ+qlcK3y4sU67uwi/ScfK3+T81wI3nB1u38Pw6Lpm5AC8Ogh4j5xDEd7hgzk
	dlAW6R+tQ2HsckFmId8wFh4Gk3inWmUGTO1mvb8vt/fheojDquLdJXiEQubbX84SicrdVoVH1Zk
	C1+uG+zCK2Boy+vMR4lGSTHCvMGzcIS4K0YRi1a9wXS9J246+HXJXF4iLphXIzvAQpLUoegOB+V
	W2fhj/tqwuQ/uRekwSOwYEuIDPBPlZ20xmkA=
X-Received: by 2002:a17:902:ce8e:b0:295:570d:116e with SMTP id d9443c01a7336-2a7fe741882mr22734265ad.41.1769152403265;
        Thu, 22 Jan 2026 23:13:23 -0800 (PST)
X-Received: by 2002:a17:902:ce8e:b0:295:570d:116e with SMTP id d9443c01a7336-2a7fe741882mr22734065ad.41.1769152402786;
        Thu, 22 Jan 2026 23:13:22 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:22 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:33 +0530
Subject: [PATCH 09/11] arm64: dts: qcom: sm8650: Add power-domain and iface
 clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-9-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152357; l=1172;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=h2BGt+oLruhKNtRDwx2YFXay6bpO6ryLjJ9UHjI4QSI=;
 b=35Vni9ObKR8T+NeSWe50ZZfTGBFFtwU+U3+b04NPyWq9zqUSk6nND8NBhgjiDt/ABTKDM9ud1
 Kc6IQoOLLd8De6SxUGsl30QXtrokCrAj7oqui8t2K8USTPzbtcPzgn1
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: a1EsN_YWQLOrFqnTSWP_mZo7YoDp454T
X-Authority-Analysis: v=2.4 cv=O480fR9W c=1 sm=1 tr=0 ts=69731f94 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n08Rq-YSkjsL-2sbs4UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: a1EsN_YWQLOrFqnTSWP_mZo7YoDp454T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX8300snr/SzFI
 ZFS9VjtlYVaioKw0WVTPoFjDxKkf+OHGwbna+TOyrNrBJBaR0CAQmhIxkyY9XjxzEyTHj4gR9WC
 565PJIkwg/VIchcAMDWr/PhOAE8spoOqgfFlDuT89pmuHXsH/qYhYGiyeT4FpaqbdQjzD4gIyys
 GXwPrzm3/13Sea4iVcbNtE1+LPHv88sYMrL6CpAg2SjmIBgOjEaKnF4jWn37JtdzUmAMdweeAHN
 mU1TrVMEM4iF1g4Yyt9h5NPv2ER8hZZuSUQlpNwn1Imv1llpWz+ocvjkiz9z3NVAUAP0a9uV4Db
 TS5PgyhIQU5h4WHy2CVhQTVIBUdN7O8RqA4XV/gNmlGvZVxnMZr46JLR8ILM4ASqwvTl/zbBaTv
 ASVHzTCJ+NCap4MSRhtTdc0D7ipXI5kEpFLynMejls1rS9Hg3g4M01RCktdlE+6ZVy13HHTayjr
 mP5v9Z6O+n3p8KqqZXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90298-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,1d88000:email,qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B54B571849
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for it's own resources. Before accessing ICE hardware, the 'core' and
'iface' clocks must be turned on by the driver. This can only be done if
the UFS_PHY_GDSC power domain is enabled. Specify both the UFS_PHY_GDSC
power domain and 'core' and 'iface' clocks in the ICE node for sm8650.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..c32a817efdb4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4081,7 +4081,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


