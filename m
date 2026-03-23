Return-Path: <linux-arm-msm+bounces-99146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJBQAVUHwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:26:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D44C2EF06E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7A0B3030768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0C53876C4;
	Mon, 23 Mar 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfIH5dAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkunuRhL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B238737A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257558; cv=none; b=rlccvkUnAp04AgFaeZlMC7Zaf6rULRAj2GsufNczvcqfbRSYdPJPtjeegb85Y0lkeh3o4p+OTdeBJJFrckKXQPhxBxqtI+i2tN2XXHZEOSsx+tpMUUZ68Z/wBd/oNZlcP+Pw/5S4QqHNjOTi9xSN0dNx3/rG6rENhbIo8aoSCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257558; c=relaxed/simple;
	bh=LS4FXm8KnlrTRJlZxpGWlu2f+zGJuXdncoQPyY79QG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRuFbfR1RTXGhNikmiO4LtI7itf8kZir5nIR00ccCVABS3ugsAcXYcw3JHcNjGGqAZr6wHrl+8SJvuZipIns5zYVoKCE7eQQQaC1KciEReWa+fOUU4AZ2oTERTPhHoAA115TgB9q1kchbml5f9TAr3skqQ8/HsDmkR5tI5NT5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfIH5dAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkunuRhL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4RvnZ3737826
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kPiIhTgCf9OoUIvaI3Ju9pKAKStgsxqhL0qjTgECzE=; b=CfIH5dAXHmJjhTex
	A2CjDdvi7Cqhz26WgkPJR9mELbgvlucLaeFaF4vlWSbXA4KtzF24Ti3/e7iEgZab
	f0EWn+7xsRDITPZ9W64SnnVg2LtowA8pLmZafC6CDgpLpHwO1m7IzA2IOiL1mgDr
	JhlAUhWFNE65Az2jXX8ySzPHzcF88bq3e50qWf6pHdokI975EObzp2Jro0QMTKGO
	jrz+yYCZOu+ACOOzQlB9wGpmfkiSMOHswWVlnw5VpeSuhjIbvdHivyX5EAyOk2jc
	g4AGQyseUEoUpEriRsoiDMXG8uhyiQdCSflYR+ORjaUHjwYKo1zs5wVef/I3fUVM
	FY3mFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcj64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b94e2caf9so14568772a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257555; x=1774862355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kPiIhTgCf9OoUIvaI3Ju9pKAKStgsxqhL0qjTgECzE=;
        b=AkunuRhLk8zN9R2Oc4hrDEOzuzBnRpjogSqgyf+wPDSuyIgGQsd+S6u++H+bu7erXa
         8JxNZayJFOt8EjIuVYCKQkHsWGG9LX7b45xChrq60umJMOHha7eYZhS3nZpQH8tIhF87
         i4GUKvZqEHdDlVbChstF/3bAxtk5ROI4Ivrq2yvClaR7EVK0Jb2fxosw0sGey86sZhLl
         QpkUHMKHOEgZyuSlPCZHX4tQY36C2F5ruxMclSofgUYtTLvdsZbC+NIwPpbvvNHoxig2
         uSRYTEb62qEnMgPSUSKyPq2+aWU4Y6fnUZIiuRoMdg9bvauNJqG84+uM5YVOCP+K8kjW
         RHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257555; x=1774862355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kPiIhTgCf9OoUIvaI3Ju9pKAKStgsxqhL0qjTgECzE=;
        b=RpcjGdC3fcL+3boFv3uSYe4kWfPuFDwmc1yH3FOwOVIM6EHqrS6SVfwtaAvwmVVMzY
         AiGKa9NiDwLNK8IoIJxe5H0egXD7xfizvPpKX1SDiW/nVf2VRd8MT/UD2+bOT80DZzF7
         J5UbZhCwutMDAF/bEsUtC10xcG6GpL0exGiZiRsZSpGuSslJwEpNHZoxqCfOp4Npd7ku
         9bgPhacwk2c+yU/z+4ooPFUlC1/tDc4u7IhAjvuHVLOfzwA+rg0k2oFY9Tybat+sBLAq
         6qny4km31T5NGouoZ0EQqMGEglKBhGPE+YU7S2Qm2cgTYCeOrVIS2YocbyD2oG1GzAh9
         /WkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2qwNQv7rf/jowfFXsd4OVatsqOACh+AtMmgqd1NTBXubbSt/IGnhZjekEl8TWUHVCcA4vSLCa3SMFxusL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzel8wShNuJP6bCQmypESSemmEjdYCQ0EQncKEg2bdNF382DDbX
	WS0/0m8dkaJRc4Jf0WC/1aOWBNfqVwS4uvoiyQreuQm5RtBdwV91xCMtzQbMJE7fD/NeutTahq3
	9EY4gjlmOTvNyTXw1eYhhyHAhF32PWkGAX2oa/qtAXkuleHArLI+JBpO/ScPJeBdStWo2oJ1tsw
	CH
X-Gm-Gg: ATEYQzzJ2VAzv+hIzjhC77kZGWzr7odpUyWp6XPIm3bDiZieDk/WeZNn1WbUcn4Skcb
	6SQnXHQWolCAG+2HG1fymL3FJzqdyC2QzSQnSbMrhVuMsrWdt5Nn/Uf2SiCuPA1jIrm/Dn+H/M4
	rNhty1hzaiGvtbTG26DQoJ1ORIhcXK+zNUf8Amcu+GLQYvFz3CX6f8ULWxmIvobZeDzPHYRWsj0
	0CXuC3v1+WvEKqrQPRThm3rRQsGrBup0y+Zxf1E80g4Kzowd7tJEX+ytrCxgVojj/6WFbzTrQyL
	P/6Hc5IvLu/4JvTv8QIEU0fBsAbkcvz8C1RIZD9NfVyzMyyxPHgI9nIcqx+oFNph2IqySk041/7
	az06PVux3xKOwP5PBNrMyH2opXXBtxOnVgN/y/r7dxT8uE9I=
X-Received: by 2002:a17:90b:35d0:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35bd2c69ef3mr11216545a91.15.1774257555428;
        Mon, 23 Mar 2026 02:19:15 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35bd2c69ef3mr11216507a91.15.1774257554914;
        Mon, 23 Mar 2026 02:19:14 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:19:14 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:48:00 +0530
Subject: [PATCH v4 07/11] arm64: dts: qcom: kodiak: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-7-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1513;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=LS4FXm8KnlrTRJlZxpGWlu2f+zGJuXdncoQPyY79QG0=;
 b=biRYorjV9jV7YU0YAsnA5858q5QwIrCqCidA4lchyItfLEu9ysEGLe/XL8uHLOG3QJl06gLZ8
 YklGA+Hy0nqBxf57auSkbNCDdiMjzxsQMdMCc+jIs/2ibF5OBOPFf/o
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c10594 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 63CGAfJ90pVbfI8q5iEtBBAxQXWSSR-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX8c2EqjF8c5ei
 yy2J2igpaajmb/C5aFxI5YgmAWStPpABCoagrYz3zabEJuPd6tdiLblEjPh1O1qQgKks03LacQJ
 p+U30C5XUwvtYGKB7oJOTYzx/bAHs7OfgNnhr+luDDQXaWv5uzVxB00l+b2r6pULeUBdIKEJ9Ft
 bXQNL1g9Ru1jVqjrnoNZCLQLNeZhSdsEhGr8vpGAm9SpWGHCj3Pu/slWsJRLaW+NILY18LK7GSp
 H3xbRwdgQhA+CNo61eOi+ChA0YIRnyZDh/0rmCuY05M05tcyVzEaH40GGV56Ag4HkyEbCPBhGpz
 NO01KeoYjVc1dTv9HATgbNF6myjPA/gozGoPGLuQnP1NV+2Pj70F9QeJeriv16Pt6Zuxj0uePNA
 ieeGvty3Y2il1f3g7O1vIUKd1jiHS5dWxNYGW6z4M05XqNCrkgS0bHZUrQWU2mxYO04smjuelZ9
 sCTsQgNbzyuv/C3lTWQ==
X-Proofpoint-GUID: 63CGAfJ90pVbfI8q5iEtBBAxQXWSSR-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99146-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
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
X-Rspamd-Queue-Id: 6D44C2EF06E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
kodiak.

Fixes: dfd5ee7b34bb7 ("arm64: dts: qcom: sc7280: Add inline crypto engine")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 149954a3eb7c..9765bf361db4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2579,7 +2579,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


