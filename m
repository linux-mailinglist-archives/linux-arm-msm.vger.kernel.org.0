Return-Path: <linux-arm-msm+bounces-98113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPguJIMeuWmbrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:27:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 153122A6AA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A1AE305D4AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316993382FA;
	Tue, 17 Mar 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJXE11x8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4QIdo2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8948355026
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739285; cv=none; b=t7RsKVz4UgcD8kmQ8nfVMMNbPsz2YmXToegEfdTdfE6Kv+2IooydxRl7hNUNsF0xQl3ylCitlloOvYSdopQSiqsC2y+QhslT31LiGUtulR1wDJiKyhOv9g8G1EpqV7KnFUIoQiw2Phr28aVxWhlVQ5ale4ij6BHmf2lb7/QhatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739285; c=relaxed/simple;
	bh=ZoTYC4gGpP+T/L/xPYhrBgESTmeIr5ilNZ2zTsHOxS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzIzKybQenTedavGh4H0PzE3xDktb52Qrt/3oB4/pVLHY0SdNpDyFZ8hSCLKF1p7L/eAoS/+RDl4aqV1p0WkwtR5rPmaSvwbD4wph3zUjPbMZL3zCASKoFA7n0RgXgPgApCiZVAzTSl+DkbBoI2oUM0aguc0Rb6E+A6n4MEraNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJXE11x8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4QIdo2Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4NlG71428760
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+r4d0K1NIBE1np9DcmCa86bjp9Sk+dZVE7N8ud5Txg=; b=kJXE11x8HS21ZnSq
	GcJt9Ycvh7QcZKkVOqdI5xeIXEjAok+SOBPIXw1iTkH2uiKYVkYMQQBm8bCW7n9o
	XRxYoktdYHGERXH3COcayc5U+XNd/asjNG0xP6pr7IqyJZ/xckPZLZeePrtc9CHP
	ZZnykm5WBSsazsEwv7GIoemyhk54viDPK7eUeNN7lmRK8osicGXA97HI59JHpDoj
	0r58RH2HqHyoSPXnsdG6sbeUNBk9dRvY9bAVOpcp/onUsi+oJkr2dVL8IGGJcQ2O
	AGFoDXaNjcIfedAe+QkGWTUVA4T/YVDz7M+244k7tknZxQc1GU7DY9xYShLznlWX
	Z33Y1A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99c44d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so5775894a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739283; x=1774344083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+r4d0K1NIBE1np9DcmCa86bjp9Sk+dZVE7N8ud5Txg=;
        b=U4QIdo2Q3IxR5q49FWRiDIFLRDfKH0OL2OL9kxgR+9BkuclLo3KJW+2EI4qEnAxq93
         Sb7xNnd/FPo9wT3uqBDam96yPNlPtLfTAxa8G1LcpNB7n+I+qdA/JIxZFjE5d11etKCG
         qRNetBO+amPa+YZoi7W9TE+1n0Wf7UazewHrLsaE1/zlRZ1htrI2IkPTifOdY3mgRjQo
         QCRWXFZTHUQfhLjy6D5M2oD2ubBBGzvMIWl2flyBKiBEJBxljLrWI4Gdz6xeXGl/hO4s
         tAOk80zgmDU5XTr8pzzpCPymQ2kd/uV3Qjui1QakxfLQSFSWyJsFVARBJUZZ89Injbyu
         XcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739283; x=1774344083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+r4d0K1NIBE1np9DcmCa86bjp9Sk+dZVE7N8ud5Txg=;
        b=M1c87JLJqjL/c0mOsIaTVedYjuOJLComWze5QGPjVXZ5zZRO0PplLM58XZ7JUeI9wy
         I0cszQ3ggeXHVmIQw04cjTV/ynr+sQynvh7iktn/+ZN3X9q/cU3eb2hQjp08jyJtDNX8
         9Gl0ZFK3mkGm/UH7OGoLF4GaCCT7FUgPUOvT5LcaMEPqrWoTOfgIfEbqqv1VoOuwG/m1
         7FtEeNG3NSNrwlu6rZFReKJBr5WQTTHebKGSgEej3VS/8Lu9JGYAcMZfYSB06aoeZOCq
         OMvqvWCW8wqFZDSuPUlwDirLqdKVbr5dDhMxyxuPVgMMB+5K51GNdIt6HbLEv0sXaVvm
         x5fg==
X-Forwarded-Encrypted: i=1; AJvYcCXgTF9cYD91zGlMGdflU2zI7/6hKvffpKi8U2vQlnSyk0pqbWFVYbMUdhY1ZfmakbhIAgTl7l2TBW0ZlqS2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjrc6Mxwejm4lNo3F0p17VB7GjUX120DRuMWoJ8JVPPtnYePpc
	1cs4HPlERNu+z7l7vhjbj7RCZGjqyypddFko/OXWBpi468JCNkG1QkbOISLefdiWQDV41Pg8t4u
	RR1FqtePDCVWUeqV/O4r/69M1iBweIs/s1ufgUjJiyRj2NJUuUIG2p8QLgsbBO1InqqIR
X-Gm-Gg: ATEYQzy8G6o9QoVSMjJgrJ1syrV5ZEmHlcctCBnxYOmgT7ScserupZSWM28LLkghHUe
	FuHx8WCbU3DKjO1UIZ/SrrUzJpL0rRubBamCBDwQ+jw54+ETA0QSeAkr3TDNncnDHEm29No0/gd
	Ml4Ejh3tdmrtnegt5Rv3TWKgE21buQuJvY/Rxrv84+WVJaKuyROXS+B9zCa4sQqgWlVOAnqH9/J
	OwV2ac4s1eggmgFX0Lp29xW5AXinQNYkOAhHSO7QMlRDE+MTb0df3la9lD6h3BfASgM+51T2TM5
	1ZChTOR/UeH/RaF5omXqoYv7ru+lWF1WqdNPjRY2HqL83pXCXLedUpYO9OeNDGAP/IbG2kTy5y1
	Y5Odxr7skuXTrWY5SUQyAgDijUNqhJJUJWZyYdjeHX96VOgA=
X-Received: by 2002:a17:90b:1e45:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-35a21e3958emr13589199a91.4.1773739282710;
        Tue, 17 Mar 2026 02:21:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1e45:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-35a21e3958emr13589177a91.4.1773739282112;
        Tue, 17 Mar 2026 02:21:22 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:21:21 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:40 +0530
Subject: [PATCH v3 01/12] dt-bindings: crypto: qcom,ice: Allow power-domain
 and iface clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-1-53371dbabd6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=2159;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=ZoTYC4gGpP+T/L/xPYhrBgESTmeIr5ilNZ2zTsHOxS8=;
 b=xdpCR4Jhrp26F+SmeMPtKGA42JLxPzSPWxmOzvipMHoX/IOupgWCUogAki83Kb1VVPRYaF4vL
 Y7H79xL/1wDADi6Vc/bFD3hABg7ETbG+F9YoksoPWeh22EMjoBKLzrJ
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b91d13 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FLtWHdY9P_O1C5dx__cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX6B69yYkSUMHz
 tY1NW+fHFKzOwbidYAb/Ykk39qHvYH3CH81kZbYATpfMx9L9jbGy5/k+NBFwD4n1N1LyVOVHQQ0
 d9synzogMzPCzTPpIkmDvXgid8kHzQvK8jl83GYzNlxZarFkppBi4H4y4KrtN3dYg/2hjRpN2vm
 8BsHDeEJa0dJySe8zrkd3OXFYnl2Jao1G45kWyY7yp/VpmROMkjAVGcZDNNS339vsFdg6yZ+/dz
 N0P4Wp2SvLpqHXSSV6kKVgqlfebNUhEDJXO562GhjrFXd+p7XxHYkSkMsX0tItnbRCD1HdwwSpI
 nmWBe7DSNdDj7wG3gdhHSHpLQCR6oWygrzKcjAH1mHnDWSE8d1QLntmKD9pHvf6w606Ad+2/SdZ
 l3WGw+5qrqmn/0C85G3rG2uLOHz92fTv1krlsa5uLf6dqyBWOROqHeS/YOtQi+a3iduqkukI6dx
 b5305WzeGwj5n2BtZbA==
X-Proofpoint-ORIG-GUID: R9kpb1fh_kjRLWb4XyPaTkeOj7rjFBzq
X-Proofpoint-GUID: R9kpb1fh_kjRLWb4XyPaTkeOj7rjFBzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98113-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 153122A6AA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the inline-crypto engine DT binding in a backward compatible manner
to allow specifying up to two clocks along with their names and associated
power-domain.

When the 'clk_ignore_unused' flag is not passed on the kernel command line
occasional unclocked ICE hardware register access are observed when the
kernel disables the unused 'iface' clock before ICE can probe. On the other
hand, when the 'pd_ignore_unused' flag is not passed on the command line,
clock 'stuck' issues are observed if the power-domain required by ICE
hardware is unused and thus disabled before ICE probe could happen.

To avoid these scenarios, the 'iface' clock and the associated power-domain
should be specified in the ICE device tree node and enabled by ICE.

Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..99c541e7fa8c 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -30,6 +30,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: iface
+
+  power-domains:
     maxItems: 1
 
   operating-points-v2: true
@@ -52,7 +62,11 @@ examples:
       compatible = "qcom,sm8550-inline-crypto-engine",
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
-      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+               <&gcc GCC_UFS_PHY_AHB_CLK>;
+      clock-names = "core",
+                    "iface";
+      power-domains = <&gcc UFS_PHY_GDSC>;
 
       operating-points-v2 = <&ice_opp_table>;
 

-- 
2.34.1


