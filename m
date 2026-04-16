Return-Path: <linux-arm-msm+bounces-103402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G+tA5PR4GnAmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:09:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25240DE3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C6B730A3411
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBEF3B776D;
	Thu, 16 Apr 2026 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jB9YQFM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQfVJBgX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9073B3C17
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340901; cv=none; b=ttUz8wwFa6xfcdwe/QkvLbx/9NXXfP/GLXPFyYnr1cuAxHT3NhxyD1Iwiw/cDX/dmRuDuT8UE0vb0BiWziu7sPRog6SkmmzMd1JP/UB4v93QRV3F1bnWdU9y9ktPklRxvRzJk7VjSWd0MD2Q1BuyiDUxFrvDNLbchFPSZ7iiNlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340901; c=relaxed/simple;
	bh=PQIwHe0X6J+SePUM39Gyz3yRIWQ9APF+TtzVUvY/U7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0z2YIv+aWTmvs2EdArhVnG1Rmy2Rh7f5ORNO7AuUu6UoJ/WRA7WPnha9RKGQKbkWXELFZIjowCaHzxUAfkg5V41DBvRVbAF5wvG/HqXwgw0Ktp6GEQNeSo3LPX7xe15U1TAng0gZacEC/m74TrUXVAh5DydN4Fp6YhEFeRQ0nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jB9YQFM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQfVJBgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GAXw581245168
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fueCHsyAjRh96KbAlZA+/8APHV0qXG68Cz2uoDsQdww=; b=jB9YQFM31h/Xptr9
	G7rg3Z1YhOmI0+BLx/JGgWZRfX07wDR8WjrxJHaeq6lh6uWQz24yCGZEajh/0S/1
	pwPB+TWD62ZwBOhrYXdv2SkM5413s7hlA3NmQsLbHtYc144Ohj+cqmLoSLHwvFp9
	4/AxJFnQw+K38T2rSvvh+ju7yEdUnr/61wPbxxspNq1bg12Pomd3qX3X3wkUdqLH
	bn1W+bkI+M2VBxEFiACNbKcCQCPJpsK/baOZ6SZC0lYF+qB1WrOgFNFMODej1vJl
	dUGX6wXZiBn0l+Iik30of0lsJUer/VLilYoVCIrIRxOL4mvM8qYwk3H2l4Akjf3s
	Wgm41A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4k883g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7963d8d167so687843a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340899; x=1776945699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fueCHsyAjRh96KbAlZA+/8APHV0qXG68Cz2uoDsQdww=;
        b=GQfVJBgXqiyUwdY8FcV8Q8aUH+e1i8sm5tUa17sk37cUqHwZmvZLMHz/CTb+484kns
         mIODt34YCPov7wjFwTusChliqMI7HL+CI1lIQSXgjvXpJsoR82JZIh2GS/SBhKnQNd7V
         eHwX8JcYxe0GL99X6ffS/J1mh/Pq84BMOrZfmfIDhsPJD6MZ3Qjn81lMmTL2WIos9cQj
         Pm6TEsnXbdSqSnMcJe0tvXaqu9ztBJEliv5d5VGwVUafTVBqzx0+RPmRWPXYHaxD3jm4
         erRDV+givhlKptaO/68IZC7nAtouRlrhwHkLlMgDEvrgUwTcX9Nu/Igela6bLqkoiiYG
         LDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340899; x=1776945699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fueCHsyAjRh96KbAlZA+/8APHV0qXG68Cz2uoDsQdww=;
        b=lKWG9yO4lFMJBeqlvgLaj0Afw2fR0uNNx5iAk+mDgxpJQ07lCz9hHFBQ5Gyfy8Scd7
         /kTMjZEUEiDJdrcq5/2omf3n7GZWVNSK34AiGtl44ZkRO4dxp7ibJpP3kNCyQKWGWS2Y
         S+uHNfiimfFz7VWGOrg2PPDqlg/PcvyZkFV0q2RP5ru4QA7QyznMGY6hNQPPkURJfqtJ
         0jVNrY1mPjcmh23oBJpyIHosDWrdTFDfbAIwfNHMB1qI4AxidZQocsZqoQu7hj0hLrxo
         RhauT9BPbqZROptjmv30jdBjs6ZK0f4gJxwiLhjqsubzjsxjmCeGaFlf0AAxGAEYdmWt
         RhBw==
X-Forwarded-Encrypted: i=1; AFNElJ+iY7RLjo14h2xxvLlChw3Dok4ijfH/3astMtQHZPmKhhLf6iJTxOBw8iWFoTM19+gaFTKqTXxee8T9zovT@vger.kernel.org
X-Gm-Message-State: AOJu0YxgERhsU7nx0jXOuBfKFG73AhjL21sLs1LVh3+QeHwNkOklQMDl
	7TdrrJcealuRtTKAGflHseKUoV3VRMwFSidgyHvrRnvCzdarqlpm0xojJkf7NefrFvtVhFQZZVv
	8Z+l250Zuyg2vfqkXiu0TV4MH7V3Q8vb0fPF9cOXR5+9EXies/WMpjVg+jcKrUMrhzK3p
X-Gm-Gg: AeBDietNAv1RQfZwCZEO1BVywDcn2aBNUdK6LO1d+FgphKOh67jIOOHtL/TxY/Y7Lep
	VdtAWrt3XJ4dsDrhqFZAkBzvSdM2EpSpS0nzJlFCU3brLpEJFfjyq9oMd4ZYEbfxk0qZVONGUhH
	yquNVeD6QVPnb+6ra+EjzHdB3LMIqRi2PrPxJno+z/csonHXoFyIS1uaw++U1UluEatAFUt2+H2
	ZzuabGKgQTDVAbh0OkgItBABiwBwLq9Xp9Up9qE4JXhvJe/a/QlpyHVgp4pTjNwjrFCyVg3luju
	TTRzmEye7Mpl1GZeHjbRePUzI42CmkMzFyhxqrYZ/Hhg484mlJSvHMCDerqtSwfXmP4nJdMg9/9
	RIr9t0zS8F7BQOW5j/t9ngQO+aoTIny0Y0mUNqT1NRiuLLt0eMZBhhQuj9w==
X-Received: by 2002:a05:6a20:3954:b0:394:3001:8b59 with SMTP id adf61e73a8af0-39fe409d626mr28689685637.53.1776340898499;
        Thu, 16 Apr 2026 05:01:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:3954:b0:394:3001:8b59 with SMTP id adf61e73a8af0-39fe409d626mr28689585637.53.1776340897666;
        Thu, 16 Apr 2026 05:01:37 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:01:35 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:29 +0530
Subject: [PATCH v5 12/13] arm64: dts: qcom: milos: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
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
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1368;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=PQIwHe0X6J+SePUM39Gyz3yRIWQ9APF+TtzVUvY/U7k=;
 b=VPUV44pQZ3CT/160UiaEEW92uAButbGm/uxJDikFIH4/a170ga6m7ssBE3iekTp+GBUhM68EU
 kEjLblRtVbJC1VgMqw+sgli1h8jBGuqwmMnKo7kDZDwkjwlQQcIMlxl
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: MZ-Ct33Xf9YKw-jPBFaWghQZIsvd19o0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX5CMioBueZscS
 KJgqbWbli7PvapPSF4DCJnHKgY1bMbt4DJh/Fv7UdCYZHRkC8coZl1kLE8N6Bpj0wKZ6vY4FL6w
 qcV1Q9zmJFp2CfXDmDB53Ho6vUhZeLpjfGrmKBVCb5zj63bu2XQsLsO6u5rYxpmkjfR7NNxA1vm
 T5vU6pp3vbaZmAvHL0GOHxcsmzXhAsb+truAp84hT8Ur6ymynN/QS4xmzOCd8QskIVojx0f7kek
 4t+D8aSl/MeYFZtMUaSDT7TtGuz/BJY6fXLKaenJ0Zo8K8yprYykmc+C8P5qQomXuELodd0CNQm
 El3/clpYSG2gtZVlZiYj9nkgMTTWVd4x5B4dOcuOtZqe5kwk6WS1IHgC3HfEGDzs6J9I8YPYbB6
 9lh6ojYpT8Mb1tBPHjMYHYux2Og+n1XGaYieVZDz3DoQ3/dgD8Ax1HP4GsZJcslRhUVbI+SndYg
 +lvHU7W63enBXOf6mtw==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e0cfa3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: MZ-Ct33Xf9YKw-jPBFaWghQZIsvd19o0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103402-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,1f40000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
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
X-Rspamd-Queue-Id: 1D25240DE3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for milos.

Fixes: 04bb37433330e ("arm64: dts: qcom: milos: Add UFS nodes")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..a6e463f3885d 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1275,7 +1275,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
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


