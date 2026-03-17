Return-Path: <linux-arm-msm+bounces-98122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO/fITQguWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:34:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A242A6E20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B807631C9813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AC0355F47;
	Tue, 17 Mar 2026 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwJ1WhY2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMgAF7aT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32EF35F177
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739352; cv=none; b=nZvmDNqgTxulPA+WbTh7TIRRFH+1DrrgVOD83fpgsQbyiR2FgRcAa+MnnCeSwunjW7+LXLFHe6W2bXo2Cm05H36Sm3UbQ0ATpeelbDk8PelJk1ipi8m+++DkvroEEDC4zuo2ngLyNXbmMBUDAWPQrX0hNU/YB7/SDh++oJWoI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739352; c=relaxed/simple;
	bh=jNnS6vGH+4xi0XIVQONh6OWH1bIBeXmAWadZ36T98CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEgdKxs1k1EQO4VRCmvlEIFNRV/qppyXqQP93R3om8D8brqhkJVoS1oVRKOattzOwaKKtA77nHT0Wm6iPUxtpgDaGr/Ub2zRHLNMyciNjnHUQav7kSUlL/Cfk8aZeJX9LMVUsXWt/D1k1TvE3FdHaLmbe6i3TNaT9bTGqff70M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwJ1WhY2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMgAF7aT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H6tW7n1639313
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQ+QjOHQmyJW0MDla5KzS+DLHnL+9knlYFjtShy+6P4=; b=fwJ1WhY2wbwJ1LzF
	gZ6k//13FDlX2U8X7N2L8n2YpGdyLybKfXvZTD7GXvFHCZXwrZuNR8R8yn2v3P6J
	u3eOYEwn5dLzMjGbgWt3VlFR2Nkopdo0V/9DqC2KESNEMgk1RxMLmmJ7cSKvClWp
	ijb6YYMVuTJ0iGaK8SHxlsUz/aWDD/0biAga9iykW9cAh1DG8Kf7R/nRHrQADrqi
	FfxYsTeG13u8lBXLyz4jCufA+8LGGUM0PCrYUu2IapuGmTietOyCrlCdmK/Ga5uY
	B8xSxu5Sy+I3OP9bJyVf+6voPn6vkHMP8iveJ7bn9TOkFsQq+jCri7uCOrWbdciJ
	SpQAuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0bk1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso36460168a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739350; x=1774344150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQ+QjOHQmyJW0MDla5KzS+DLHnL+9knlYFjtShy+6P4=;
        b=bMgAF7aTj84tPbsnucbrFzimt0MGJru7+hcqhw5UztP2XGLcI2IQkNAzjxRQP/uZlm
         NvTBroXG3MIi8KYUAOelUPPWNl3wsVUZyaEN1qh0qoNBkd/FFbtxouBgmAUbipjWhbiN
         Y5ZU0vL8oj3c5a1lCfwcGf3H9F95yNWhTRKJ7Sra6YELUB+m7JV+t6qcTlJvKK5RSv3S
         nNjQal9WEvTl4r5x7Kx1uNK5ZfwE/eP/b5KOqnIwxADG5lhG+FmReNxku2oE0IYQ6Sps
         Pxqr8Nt+aeTBfN3fQiBpwM/Jp+5d51UDw/8RGqnu/ilFTMdltG5QFY/trGoBlwoeOpe+
         v0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739350; x=1774344150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQ+QjOHQmyJW0MDla5KzS+DLHnL+9knlYFjtShy+6P4=;
        b=p5F6XlCdHuQV7JQX6a+n86cnD+Lr1aik2HGkn/YZElLSY/iOhyUbMn56HJCphHgFwe
         Oiry7SvG1/2iNgAoJv9w1C7b6ZIifQeRyHYks0dVl8OUoOHmwTFfDCfkfrmSosh/bDWX
         RtdQkUz+/iWdJLfk+/+bXDDsWg7bqYoN7YxAn8UjmG6Mu92Apr8W7whO+quAefOp9++4
         meXqibRn/o6Yj5hhZxYr7uFKrxjN2JC9EcmDHZqCyxIeAcOibMeFsZdJdmfkgmly4Z4X
         SavC+wOqOeUzCfEoOBjZokvlPza3MW5d50tkiU6YQ00nTiRislifEhhuJdd96ZbwfUEV
         iuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf5W7Fr9Q+oqAtqkFd56JSWGG1j4L3wg+muXWlmyDpua/ihmCZaQ0aNVclPl5M9XyykJ6pQumkrw5Zdmga@vger.kernel.org
X-Gm-Message-State: AOJu0YyNs5/5BZ1h+Rzniutbhkp+57RqH+6Lbow6buR8cnaI97XzGIPY
	A2y5uvadgtSbf086V4RKw1genAZoCnd+GSXOlov4v998D0Vm+hGW/vfjtjQ/RQxQbpozSEHqoJo
	CaO6APvuGKQGFmCGiOp9GVHK9lR+sK6dfu+xyr1c9hJrA4n45RpYMioii0yueUXHYML2m
X-Gm-Gg: ATEYQzy3ajzBSR+uoMAxHuSQ7sKDfwWdtgwksIEe+gjNsbW/5z87EB6ZcI2GdBy38Jo
	ziE+WPb1Pc1PHS3lOoNWu82oIKYYNi+HfGpIBCuKW8F7LnqnKl/+N88P3U3lpzpLhQowK7Is5ld
	MiwcRT4QTgqNluMQ9pxSl3SDJFt/8i4SkWQn7JvP3/guIlJI75IZHsQyBSbqvXdiIsg3YmGtA2K
	8IyaX0xUH/ho7E2oilznECn98gQVRnEXK9ma0ZkSA4lGRC4X0beRwAzayy0yjoV4DwJHB3699CT
	hBDlWiC8OB65Kz7/v8ZJeowibArZ5GgArgkXCT8MVWg+pBpAJtSx2tBcM0F/XmNw2wJA3FYqeZ8
	+1pVvauix9nUaROnZJm55+dagArYVCDcVdEDDXlERxAZW1ts=
X-Received: by 2002:a17:90b:5292:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35a21fdd40cmr13750005a91.20.1773739350513;
        Tue, 17 Mar 2026 02:22:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5292:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35a21fdd40cmr13749969a91.20.1773739350086;
        Tue, 17 Mar 2026 02:22:30 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:22:29 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:48 +0530
Subject: [PATCH v3 09/12] arm64: dts: qcom: sm8550: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-9-53371dbabd6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1391;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=jNnS6vGH+4xi0XIVQONh6OWH1bIBeXmAWadZ36T98CA=;
 b=vbNo5npV05uEkkrqWTggqoxF8bz7B5m5CsrowYg9qOdDLAE560Z/12CZZAz8+WrSotUThYCbR
 9yQrRYwteMuB+oVbxVzk0Z9CRwWO3hSPjP/Ux83tT3zpUYU3A77bDyE
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: udtfU9WZcPXbNOmDhD5-A94ttR7J1ENZ
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b91d57 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX9+7WNoPu0w3D
 1kKAxxQQlz9WQck8bh+dMh7z3/tiR4WG8PMmGzHOXvg4GnRpFyxklKC27J1zLlBfEOeX01nb7yE
 +vy3j+Inv+7uas2FB+AfuhUyGvEVa61rAB21P5LldhuTePQVZMsE/0ydBkK+WHDyckCcCQo5uUV
 coPtnoPIDub1gIuFvsp1EwjfPyshPR+AOLJIoMOqIPFJ3Z3H61L7E2Yp2Yt/DIWOBvraASCTb8J
 WhfSnB5bmZXpDS4BzcHhQWEu4uVY6v0HMa8jEeOf1sdeaxKSKFL3YGSAphJyBnWGJ1x6R6hhSA9
 woyGVfTgbsMO/apNtaOECtiKk2dJy8mQsqkIdsq79FSQlJX7ouZ5vR/xIKqnn80XU5Kgd/F3EhY
 aNApfeq/sgytDVSjy4ViPlWq2g5sTAnM8TMWsPWSCe5XTadn09hIV/6FNSVNa6+7O8xcBLoyN99
 gg68/ZUzdTQ0Cktgz4A==
X-Proofpoint-GUID: udtfU9WZcPXbNOmDhD5-A94ttR7J1ENZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98122-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 01A242A6E20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8550.

Fixes: b8630c48b43fc ("arm64: dts: qcom: sm8550: Add the Inline Crypto Engine node")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412d..473fb4748036 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2449,7 +2449,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


