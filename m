Return-Path: <linux-arm-msm+bounces-110755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHcHDCGRHmodlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:15:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0E262A561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA58130A5D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99923C870E;
	Tue,  2 Jun 2026 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqkNaI4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLjLR6OC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B0C3C73F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387714; cv=none; b=O6qn+g8QNKKldhRnI+lCYEC36E+jubY2yzGPnmHmE7RA1F+iO7Cm+IOI6J25FuX4AzQQvTHeb2n0RKen6lLx48cFqODOqbTAfAUBiO1SljXwh+Tq88nHRY7v6GrvDlBwk47NioPb/nn4sjgMFZ9TDiTy1NTCtNFT1RolmMEL6oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387714; c=relaxed/simple;
	bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IoOvZyn9RiJSWIOIdwjQv6OQGIMLKWcgVVhst/RxweTS87lPQpAp11qcVfycAYQY5wgKl9bBk2eb+sWeiLcuj/96GV0nnqyfwAHD6AOeFH/SN6Vp0NrIkgPU18FZMWTnAVIXUFlEfhqxQpMF+wC9wkwWhB11az23oxcbYvcUL3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqkNaI4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLjLR6OC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525td0w4012553
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 08:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=; b=hqkNaI4rqo6FoMBX
	H4ZyzuLlPHj2kY/iRlEYAb1yDaCLkeF9z0rBJpgRMp/K8e2mk1K6kdiTuI6HRbNZ
	pmQs996N2k0XOqILj7lWnl4LpF2xcXTJ0FfB+0QeRFHdF/x4WXDnNpwNHp7K3Sd4
	kKkufTG0JOXV/Gy52cXTkNbXH2KRAulV0u84FLrLu2duXbM8HcsThqBuTjRFoOJf
	cw4JYyMEyfLjASjYBWE6MqAXQXWajhegIOOoyzkkH82Jj8/3NrYaeUb5AwzHZcd5
	wgm6SaFTa3QH4zq9591DssAzpWGXTaMDHSdTdfQ1ZodL2F0GxyEy+iLMge82baE7
	Crk73g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4ghjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:08:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137ea73393cso4881210c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387709; x=1780992509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=XLjLR6OCC9n2Xa9cttOqrA1Ri9DMsWKU97mG4Ija68gaqmoQ7qKyJfnzzf3uEeonhV
         GRi49r5OfaFSOoZ5IXdRsYehi2osHybaHz4CFZnoFURvT10twclQF7kPnDdKWHZ0UGrc
         6wSq7Ioxn5/YaaF2NTBvW/uE2r6R+jBLUOPTN8V5ZZ42zmR+nxN7Gkjkbo2nePeshl25
         sZ8JeYSIndAe9yFlKRHbQL0z69ZF5EFLHwnM9h8A7gkJGGD+1MR7un5w+KnvJPM8T73/
         i/ByDZXoaBcrxBaMDVqQXTnLB65stoMG/pyMjOncHIDsRedoCyWl+W5de3lEnlAc0SZb
         7UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387709; x=1780992509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=BUdNRfYxqO/lqMGZ9QhA6tQWyh/nQMMb2A5MQsNTIrKdg3tlrKlH2MPLMCOdD5rMmI
         XRVaNXrrDI34BX/wBmQXiQxtnLRNDJbvF6MeFKYY4gkv9hSAIxb5RBBLZvYRbjKRWvBm
         DjA+1tYKgQ9tUMEwToAwQjnRGth9GbK493fvHKfCRTIHUzap4LWyA0OlMKeMyNGvUJt4
         Bnub57Xz68IJb8IyIRWUt261JlBgGMbITaN2AfFgEHtFd0yRVsW/3bIW27ziy0DRxT27
         anhdY5QLAOkKLkA8DcQznoYcrr2wYYqIGfrVXyszQUVydUJqBAKNMOrHzoqx4O/1Zkwm
         8vUQ==
X-Gm-Message-State: AOJu0Yyq2R5OB0zCjU9P+LxPRJANNKeV1g4QzofJDaT7YfB8APmKbth0
	c+SVKK1sGLyZP7fw0mxVLDEVH3rBRTOVomX4P04XJr9PlueWREayk+YkjEfI+INedv8p6hl71ic
	NMrAeXKBpZ7lJgXxdWqe+L/9f8DTwOD1O8cXuWOiZQWWwuzWJvqvA9FAq4oOKfbrsEOx6
X-Gm-Gg: Acq92OE0id50wJwVQzDK7N35lfaS/tD/rkczV8jo6E7wO60UNL6miEyjtmZ/aGD4S3w
	yTII12hYoLokYed4fyyTYChKT06SvaFaQN5beLZsLqxbzD0JYIeNHOxYEmfRQuFxHNugXvByeo/
	KJzdedeNwwCiNbzkpwnAhGLd/oyEAA8C0d7HOQ4OOd3Jgwgm+X6kh/CtIfNxv8DEQS7o3sXXwZu
	P8HBFdA4dkE7OnndCMrhZa5LAb8D7YK7nt9wOJo+AUHmSSES2a6Rwk0Atf+gEhvlOs7Kf5Lgi56
	0MeTg8NV6JTLcKw4CiPjo3PZEpwL7nqeqjpk+M0WdFQu0s/kkVIh5GMGbQunxH4CZmBjG5ZYfTL
	Cl7KUZhozxZ3LCiQxbldS5zWhJ+nMPv09v3/l7x7ALt+UVH3ywSiRI1lLMdel7L/PTqyVChl0+K
	uqJAA=
X-Received: by 2002:a05:7022:41a9:b0:137:eac4:82b3 with SMTP id a92af1059eb24-137eac48995mr2598619c88.17.1780387708529;
        Tue, 02 Jun 2026 01:08:28 -0700 (PDT)
X-Received: by 2002:a05:7022:41a9:b0:137:eac4:82b3 with SMTP id a92af1059eb24-137eac48995mr2598601c88.17.1780387708024;
        Tue, 02 Jun 2026 01:08:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:26 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:23 -0700
Subject: [PATCH v5 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref clock
 to RPMH_CXO_CLK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-7-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=993;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
 b=H98TNurlWjladkP+bi4o+RpFOHyFZNlHSpzGx9FP6oNW2HziFKwHwxqJJ5ZGA3y6kJUjBj2q1
 roGThJh7vkVDcyyk4KyPU8ReV6d7YG2bct2QVVM597xzdq68aEbD5wp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX5Fx2UfNe9Oqd
 UJSpsN5+eDWt4+56+3WWHpDxTDT0X+AeI05SRA4yVr4v8RRyLWvL+h9tX0j4LVmhW8YhBCz6Ts0
 4hXSY169pOFKAA9M8Z9O12IrVWzMnY6e5kE5R+hAyDC9nyvPgDmtLKIjHAogp8lBlOISTlD90cV
 HKjS2gMh4eD+QrAXjOaxOg5jwVJTJ/Ku+OWUQtiXbqYAV9GPjd2tdnC+qumBFLB3d6Lygu/sXVr
 98HKwRcb9UUK329Ofizm7HFG34tbWCx23gGGJH6Umzw6uqtI1NfH2HTIKEFo9hdwFGgcDgwChdw
 NRPIXAcqX/ZocSka+uuch44LfaiGaobx8fX2Uun+MymEbWBXKKq/csMIzIIHUq9QwKfDcZJzKZ1
 aD4L+wDdApP0+jRRzkU9/g1hBWlopXzLD96w15eKjHWCWmDdOhRFd2xFiT4PWp775Ghp1MCo94D
 jNkopO5/069a+DCOAAw==
X-Proofpoint-GUID: rBkN0wu9QPQILqJA6HjyxxTOCmmTlI0f
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1e8f7d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CR5IuhOMo0Dix3IxAI8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: rBkN0wu9QPQILqJA6HjyxxTOCmmTlI0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020075
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110755-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C0E262A561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
directly instead.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index eb45adc8a0a2..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };

-- 
2.34.1


