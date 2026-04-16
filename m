Return-Path: <linux-arm-msm+bounces-103395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOXwIy7Q4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:03:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9794D40DC93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1A383055F48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CE934D4F9;
	Thu, 16 Apr 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIiuIxU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egydE3wy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B04348469
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340834; cv=none; b=Rmy4O1Z8EYvt6lsrmog0/ObFhoBO+K2IV9pqo7qnfGbNQf0dtXy+K0PWivtP1/TBFMv8vkr/SxoT6wDu0wjilQBDyv7rRlmIqS+1t2ubShsd2QplGw9bxMTO7IwC3kCzk4Dsb67Auily0/hW50MDoXGZKsNEv0BBfyUIGIkptz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340834; c=relaxed/simple;
	bh=Hlr/X1jpHVRbaIJRwUKkEuQoVBfs2TtNCkWyFOX+H0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXeh7vcZVCMvZM7aLqw3RbVDiH1K4vj9Ql7YFaYzZAdPJP0ekpgVmhS+4J1Wxg92TjB1uwQI8CSRxPYtlOgJlRr12Tq/hLzGuTDj8DftUgfpLxjM4o5cPe03OBKlR4WZvbfnypfyJl+suFvB4Nov8xzXAy4qkqTf7pjP9EXamF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIiuIxU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egydE3wy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9b2KX1553884
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	75vHHvRKh5QqiO/9HH7clEC0d88m2FYIfhh7wjkOHaA=; b=XIiuIxU47t7m/G2e
	kcnb5/TgVtstAGoQvzeFt51q1g4YjBGqEh/23T6wZJq6gydUbQQxXSTxEUC0ih/B
	9OJ5Z2wuL6RxjB0zw0Vd7qMTiWn3yLdH38gGmhVj1XEHeZRwERTkFWDV6X3j64aE
	I7urs//UNJsbCtVfnvC3ab/4WFNKSF3J+0GFmFYT/d8eoOJt8H4lRBnEZnGwuwxe
	RbIQbE1zGNt7ez5AYgTEqFlypbNZGGq6YsWDeEbZgyVpFymbSvvfBQHtnntvTqaO
	dXw1+9C7jdKVL3DHLgzFhFpGU2XG0SI9vwZrwKtKI597oitN+NvkWebfl7k8PDPn
	0tVHrg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn9hwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f5f48458eso1303456b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340832; x=1776945632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75vHHvRKh5QqiO/9HH7clEC0d88m2FYIfhh7wjkOHaA=;
        b=egydE3wyJQyjLxGCCcf3+Q1d3XQIBwFOPvN38pd0hmh1cn0j6hx9MKLq5EdCtGSg+t
         LcBclILxOj0tYMQ4lvmG/3FOaqtL421Suc63wKcyt5BCyYpskrgYZIGwk7V5fLUNkQDv
         qu+7ySumNhd4VZR4trMSUBELvCHa0jY5a4bGjvHiNhvXRSqkBWSSoh316eoiq+/7pbKh
         jEtITx6yBHd1kv8hyKyVyjnxvv37aXt/MtOIXuVUC05bsIH9Xfrb5NgjPz87ICfF+B3O
         kp19jRsc3ej+ZxHFvgtFrYpopK4dQVVPOc8i2UT470kOyVKbwLlF+hX8tnyoa8x59qm8
         DYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340832; x=1776945632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=75vHHvRKh5QqiO/9HH7clEC0d88m2FYIfhh7wjkOHaA=;
        b=m2l3MOG7iKiy16PAH9tlPQhWySbGV8nPIb8Lg9t6U08LCg8wimSBC3LIVk6hSgIOSK
         fM1NnwXsJ8RxmTFi1w04ZmxBNKnKDZEVknWAypf7Nik7DNBGqu9JazSKOTOhFIJbZe2i
         UzhXqlyO8sbSJK1kx2EzrokoLBRqqBEbdykBjexAS2AIhshP9uiL6xc8FkgxuZ8NXClP
         Sig60z2j+HDvBqxAFTdVlt0OJohWezAHC3mspfHQxFL51st+VISwtepb63FpBhwzIFrG
         NJ8QpndgMg5D+7ElW6ixOiXgU/Vx/u3q49Q2P/SkpYP0bJI57YeeL2irAoR2sNuViCP+
         WKag==
X-Forwarded-Encrypted: i=1; AFNElJ9OLPgr8x3ToUu5J9UAvPbMc5PZSIeGbY2d0vmw7kDj7+4zEYKr5diVcx68ovBuuqctb7+Js+2vGWy111N6@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHKi8ezRUpyiUB3M+np4q9VOgeJkhZzcws2KrAOKFCFoATzj5
	+LkHFD27DqB2fc47avbIbBGLiqZBM4KZ6IM45hkOukZZ97NRzHauLragzmmqE46KJmXPK9uKdqb
	/pPT3hSyZ0VJR9LshxeYFj4Pait0uVXCXDhyeUE2PR7XkSVBr3zDHDQDlYQ7nK2YBASGM
X-Gm-Gg: AeBDieuHBRDeyMbLoKISRK7VB8BkiH1orcr4st8h+3naJzuxivwK8y2ECECyAuVAF2n
	UeJyynqJyNehFMg6wDppPb7gZilhPZnLco5aoHaVS9FTh025+Zyj7Y2M8OxitWYOcyUUha1IDAJ
	GSIJCL/yj0AKYmsuWr6TQIug1a1kk0OG0ncD0iZ0ULGvl2+iYEnbSNibkHNk0iVQ0bA6iM61kDu
	9FeihcCMUs6H2YHYNHTk47BZF86CcL0bYySHKdqykMySzrsr8TFVs2OQR5m7TmymCvOZYK9UcjA
	PK4QVYRCYwxs06xEu0I7WCh4PqYggvnIqCxK2Ul5+znjqNbsUi1AQa6U6FYDPlOpi9pGcNwUhe+
	jBMe+nmxfebCfvTamPwNbibyK/zF+RQ4DPxvfMe0oYhB1SYw3CDDFpwhp8w==
X-Received: by 2002:a05:6a00:b80c:b0:82f:111:7e60 with SMTP id d2e1a72fcca58-82f0c323e1bmr26984000b3a.37.1776340831443;
        Thu, 16 Apr 2026 05:00:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:b80c:b0:82f:111:7e60 with SMTP id d2e1a72fcca58-82f0c323e1bmr26983909b3a.37.1776340830676;
        Thu, 16 Apr 2026 05:00:30 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:00:30 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:22 +0530
Subject: [PATCH v5 05/13] arm64: dts: qcom: monaco: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-5-5ccf5d7e2846@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1577;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Hlr/X1jpHVRbaIJRwUKkEuQoVBfs2TtNCkWyFOX+H0k=;
 b=zFyeQLK3DLVgiR5gu6pCRZC5+dp/ErhpmDvpqGo6E2IkbAquIt88z96g7d+DygajjIS6u7RVK
 WGCJQzkPlupDsQ7PGqZW3SnMujqYl+TqRcantn2qo77qaZV6FzUhVO1
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: qj6JtW4_jyoLRmst4fVXi5mG8nUSrEmf
X-Proofpoint-GUID: qj6JtW4_jyoLRmst4fVXi5mG8nUSrEmf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX5uNyAoqbwM0Z
 aio4xk7Lk/MYBk0sWgC6G3R9W0B7DLBLL1L4ZDspClAt3fnZpKWvYvyPjdjc5eUzG/mK55RIw18
 UAogPPzsQH/gpq0U5PsjA3/VtDkoV9OmSEKv+Pfqf9ttXvSof3Km03BnyIWeQ0E4jboX8jJMNFu
 QxR/WcNcTNI8JbiIezFJHGLqnzGVmEbos/N/yjFL+KvWZ9CHpyczAyEsLaBhVOWAstC52LJTysD
 pQc14N3Xfp/XgS1IKFhODmAsnTvVRBLWAXnWNCWpjPqONO5pKUFFz1oRU+yXEOrJCd73rDd4J11
 svRpMl08gGgOEzWOhI1bupBkR4y9+RfKcjIkKpFij7wQFJ8zSZNVHbpRa2gyCSnUA1M5dIl3tUT
 9kOy/EetQVZnOatudf4Q4koaUrlqpos+8UWkwgeNc4zgEGd5mTYuvUuIY33MjnmqnpTM5Dx/2bW
 NSGQO4z9WYMygHJ1uGg==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0cf60 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
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
	TAGGED_FROM(0.00)[bounces-103395-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,1dfa000:email];
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
X-Rspamd-Queue-Id: 9794D40DC93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
monaco.

Fixes: cc9d29aad876d ("arm64: dts: qcom: qcs8300: enable the inline crypto engine")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..fa13210fc539 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2737,7 +2737,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,qcs8300-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		crypto: crypto@1dfa000 {

-- 
2.34.1


