Return-Path: <linux-arm-msm+bounces-98123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL6fDqohuWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:40:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613C2A7032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99B0B30D76EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E943A1D0C;
	Tue, 17 Mar 2026 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHCG+Odg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDlf0H3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A09636C9C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739362; cv=none; b=P2o3pd4sKdPUzuWKpkY724swhbTuRqYcJ6rGpwroE368PR3KKRD0RKz7RcBixxUizFHs0ebzMPHl0CuUajgt9cccDzQsAujYyUk3cATfOJ2cjyXL4TsklUZXFDsILZAzMzum1d/VDujOylq6OzqrOEweMrT0PzxzzT7CRydW7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739362; c=relaxed/simple;
	bh=vXjE20g2L0ZJQyzxZj8qyvW/3Cs1H+TeODfjjpRRFrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ae160gwrHp/kgVxAFSD/AVGsi9hPE8AmEOrgVymSQuUUfkiO/0iiLsmZfnltMUw9j73j5zGN2yLCOSvQnOXUUaWo3kmEVlOYX24slNHuvBwkLxSHsNUplmVnVpu8ojkl6TYppFic2tqAoV6uMJkE7Jdcd5RepZEL8UDavVJHFlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHCG+Odg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDlf0H3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8IPQQ2314805
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYytFxuD86mKrnrbni0xkdSR0IRHqvzld2dCJ36Tg+I=; b=RHCG+Odg97U9OZ2+
	9OvlCF+J1KrgAGWBp2ISSrqEtLSjgaQUocrVMyXHPgjdeh+wYmhLK289DtWTiIOn
	olrdQPK/d7tjRbbmDO+nI1NiM3lPU+W+tcQXjfy9KoK4rZ/1qySHkuph8BjG01IM
	ZoVDn1wK3jxO90gCzf7ueo6EZ8wSeORe9BcIhZ4h2hUbummDOylA6fqsI1uAkk7p
	Wz59dSSoOpz7turO1qh7Q8CZYao2zdu353OHunCaMxJE1Q5KPKu2TW0JsRljMlI9
	ey6QYvoJvDbUPW4dBC8F34ZRB08bJDpklwlBzsA3wCVYSh+c3RmSLD6av1lkCl0K
	ibWAJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2b6vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso6438577a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739359; x=1774344159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYytFxuD86mKrnrbni0xkdSR0IRHqvzld2dCJ36Tg+I=;
        b=PDlf0H3yay62D3yesj3nUnK5fQhhv6Ao1qO5v4gCTcDXPpzf+44gutNN9H0rMBIQRh
         tVmK+0PVGz1AjwnBuek/0fwuaSxPfY1AMs/LMyyKYhs3FesWGlNUKdOS5fvrZkLsS/+P
         /ATFPMoJSkQaJyT1a//I9OGIaGqJhnOTwBXcpN4luwgNYx8Us9+hAVXrYIRx8Stejt4I
         ZtVO8ZmC7ZLvJTT5NfvHUVHXfqIAnkcxdb3iGomUykFWwoM/XwBGizvxJf8XE90gqjw5
         Qb6Ft98h5TX8YzaFAeJWB2u/xfIEAfVR5HCqFiD/TC1y5VdjXFmaxMDVKGMRJt5uiNZb
         e+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739359; x=1774344159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYytFxuD86mKrnrbni0xkdSR0IRHqvzld2dCJ36Tg+I=;
        b=g0xCO1ce8hfQN/jCmDwYSp+DA9fCtUn9Zh921USpVK+xQ4Svr94e7+r5tJ4Qwr6DCf
         u9+u12gIKFDeow3pMTMbYz0+JLAAl2OH7OvF83IkDtbnCJAipnyDWElCRyKfMnb9xjYi
         aVdJXxQSjGCOyQ5hZHr62g/mgtwmdsTH3aMflVr//qn3KKf8sUkjzPMSvi+fF3lxPPI1
         PP7J2NHsTVDGJnN2G+yIEZa3NOg9MpnDNFoeuU8eaioYUKhp8P7FYJyloCN/xsBGd3bf
         mxaIGjVQMlWEhqb3d5B0OamBaff6spmaSDeCOuT1WRUODX7OUv5W3IDCwwwAxtcEsbfT
         A8IA==
X-Forwarded-Encrypted: i=1; AJvYcCWbX63pXOlJc/+Nl0itUD8R5dOoTZh/MIdtJsGEk693QMgQM1lHM8X34lrV3UdOo5LB0dqAbTvoey8xxC9m@vger.kernel.org
X-Gm-Message-State: AOJu0YwHPfCt+O+PrmvfxiMY4mnD3hVEtVWOdfgXiOpivmN6TxW/mtyG
	9Scw3/LPbiO8/SAF+T8l+m64Z1QBaAlLa/nGC3dvxVuwbMs4yNm1vMtZ5VbwEkayi6Xj00oQPNO
	0NMsI+j+Q9yxEe6U7Kh7Nq0jDnJkqvFlqcrIzG+hoNtW32I1H5Xhmc/1yluhCstqkgrSD
X-Gm-Gg: ATEYQzzN5/MNOvzSkidorXK+hjIBF5ESwYk0UZxrZot9NIXp+CDaAjPqBt5wYvMPeYq
	3t58Z1wY5TyUhINeHtkQSvE8zDkZyTl43Q8Qiqm11gJX9o/HgfWvqMu2R6kPaAT+QkV8Mq3x047
	t/umaGz4tmFD8zKokBhaKhrnrUTtcpAGKf+WXOFSHCqXkqoV5OUdQo/86HqMX/cp+TDbGuflev1
	Mzyg4fYGL7p7dFkrv2LwQEEsGmdax0DTuYWpZ/eG7FufT0i9t/ZotAMMLhppHUxSKhiVjX6aV1u
	e2NTxqu70Jw0Ln4aDWpDaal3YnPxAzlK1etpuDQhL2qLiPGl9L6cRRM47sGusdY5pNOGJppHW0X
	NAYWxhuOzJqiale5jaCqmkFhqR2yTDgVhEtxj6O9RrvAxhI4=
X-Received: by 2002:a17:90b:3fcb:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35b982a2addmr7810969a91.4.1773739358988;
        Tue, 17 Mar 2026 02:22:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35b982a2addmr7810921a91.4.1773739358504;
        Tue, 17 Mar 2026 02:22:38 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:22:38 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:49 +0530
Subject: [PATCH v3 10/12] arm64: dts: qcom: sm8650: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-10-53371dbabd6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1404;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=vXjE20g2L0ZJQyzxZj8qyvW/3Cs1H+TeODfjjpRRFrg=;
 b=1vG0VQdenz/MfPd/Mx+daP0cUk/cs2FwW+9Kfgk0RGQx22WSSBVux5ZrABbBvP8E/bUCNxJDP
 esdkSYWTFsnAttv+c+2/voZzjJx+emnZOlKjs/F1iuC77rjCEdVDzbQ
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: J5cwXYgI3i1Rp1DQqQOw4Z1sO6pEIIVw
X-Proofpoint-GUID: J5cwXYgI3i1Rp1DQqQOw4Z1sO6pEIIVw
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b91d60 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX5POiwpoOUrZL
 +BXlcFNEyPcSZ3eefV79YfAcDwHvbWLKHMlJ83cvquYi2TEy/m9rmFiODVuL/SmDYTzxumqW7QW
 Iyb9L0RCx7BX9PGxG93lQ1OAAnxEnVp6Epo782rkCQ8JDdzMa3s75GxVNbW4IwLMDPrMX5nTiG0
 kIy4owsjXovtK+IWVAUyGCJqhxaNozClcbZJ3pjtwIgpuQrBPwAQS/rG2P3Xake0rJIf5A8gVRt
 yPE4rgX/iZ/DXaJWEpKfnP06VWOx4XtJphKOXfv1Etiip7UTaBAOFsPBlqWD1HP8rRb7ByW/GTU
 tHQhvYrMyyrtur46QIvy5tpkKNqMqtuVEazd7kpJUMC+qqM/EiD9UDt0h0mP3Nd5rTkBVReb2zA
 Kjlt/sJNlxwtbPI77UlhFuSeR//TTT7cRX8tVgBvgYEkdSvhbrAsOJ1MJ/+OOWESaEFnLIjvkZv
 sglrgfO4Ontwb6aZ0kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
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
	TAGGED_FROM(0.00)[bounces-98123-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1dc4000:email,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 3613C2A7032
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8650.

Fixes: 10e0246712951 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..d211bd94fb41 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4081,7 +4081,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


