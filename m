Return-Path: <linux-arm-msm+bounces-96548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCHcELTSr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:13:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1642247177
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B941C31CB312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82D93ED136;
	Tue, 10 Mar 2026 08:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1+pfJa7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daYL7uCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3F3D669B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130076; cv=none; b=fo0EiaSSRJdfrPgRwNFNTga5uT6o0LB459o50LdSY4siVhp5+ozKcy7J7Z1pKvfkcm/+jVV9Leh9uvoQRo8nfcpXG4bAmS3rXfKRBnViqBTzZUVwfmYK2IHwbH0H58QKaHeQaJuJmWn6ioL4kmD+uWpdQfB40R8I0qyE/T9A5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130076; c=relaxed/simple;
	bh=gYZaumYhSsIGJVNztvmwWowAICkPRsJuJxQKDEYgXm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxQWj5AyxJitu5bZn4hrdtKEm1XC0fUMVAIdrLOT+CQjxPrHr4ZR2Su+OldWphq0fywwVjQQ+b16EJX8WoIiiZ+4D2pQ+zSqI5nU0PtNPA+SEgOEtU/Tc9AKrNhXBnDAiVUzJaGWLNz+9/ibpgqbiaKufu9tKZEXDUTgqpt3Yjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1+pfJa7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daYL7uCM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EZYB1900136
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPDC9UVWCZT9cS8dyi8jxernVsW2wVYjaKvNbAETH9s=; b=a1+pfJa7UIaWJrd3
	3nfo9Xp3u2qUiXAqApWMBtMnj3unE+zz+rhIw1VqRUs9iz3TxfYRHpcLc8YPfpAm
	A++IRB5bAiXVup4s/BHODRwwQUWYdXtMPkZkblXcmrpM2sva1RVeUUrNGxlBpWBP
	nph5u2oPya2efTz/E5nh2xSi+xVJXorilmBzUIvwL44P18yVN2WqWzG+wNoFTkdP
	zTnDJWbaPSvU6mu3nrhR+jRmY+XqdhqWvGtDTGhMWH2AOSUzej176/5mS5sd+JlS
	CeobkrJtIs307xRrvSUIUOu9A1cDU+3sWYMJGysH3acV22CKpGiWm3IAjWteajeH
	nn9wYA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsacas7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3597baf976dso35360696a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130073; x=1773734873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPDC9UVWCZT9cS8dyi8jxernVsW2wVYjaKvNbAETH9s=;
        b=daYL7uCM0OehyGB7p/nqj/0DCmXb/eb403FfCOOotWL50ZR+s0wqD8MnTcb1IkOeku
         cCPqNwv0tjClw5vj/mwDHsAI0Dfb0cz2oo9Shgq3wN/obbF+Nbnt8eZIOaMmbLtfMGQL
         fYISQ4/1UvpyNj7BYKt0lIrdGnl3M1IGOC2yr9BcHjkYEcWRhOiz/EMAaPLp9sPC1zu9
         w3E39R3rUrMCAmL0l7WgUiYgJ3NusRzqLxutjsckNXy4WCgMTccUnekiGXFOZ/2uaRI/
         OzlyQARa6ESD1ZfZSlbHL4DCdrYyFGYYoJswySA0uLHZOQtpW2yJmDY9DulH0HWoc//k
         Q5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130073; x=1773734873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FPDC9UVWCZT9cS8dyi8jxernVsW2wVYjaKvNbAETH9s=;
        b=SGcbL3qj8ex7nIdiWRSa9IyiQjQ9ZNArNa2QmxNl+ZyLhIDAhXn6t+aHphDnu/BwI9
         0SzFmMjKIzy0To1q05avZfzhykpcxbvT44PfoB3awzIHi3J/741L3OKRyj/Enco+sgqB
         9P1tlT84W5Srt08SYbIK9xumBj0UmNwUrWZqZzvLZY9O38ie/NpczNK2paeCW3OQWX4C
         vrY/50VJQRr4RpKTYYkN9lY42GOCsR7GtaPkj8v8FSD8bOY3+3gS0YF6ZsnYExyAbCSP
         1rc7u11bU0cpgDWk9xlLcZIIMUfAN356MzQJvYGniwl4td0HuVZrMN9axxMo4XoZTMPY
         Cjiw==
X-Forwarded-Encrypted: i=1; AJvYcCUsGijrnsI+BBQS8gpnzrL6seW7VgfBS9PbHKjb8YO4+5sREU02oJzQOBOcs3vapw3fZ4kEEKEqk3cPc3od@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51wXzZ7c2Nhkp7Ez/B4Ikl8KVn+GsupOv9yAfCb9f3ia3Fu7+
	1+PkM4XFoPiuMUXbsL2W8XxVC6BxN3+z/L2VAtfqD509AJtyK4byrn9pHb+/QrhnvGl+ljoNQTz
	c7N7jWKCri0RKPUl8mx19ibnqb2NNGoWcFM0GCjcuxSr36nGEEOitJJFvtGAvOVxI1o/L
X-Gm-Gg: ATEYQzym8O7m+4Lv7g9Um6s1DIj0jjemal8tmWNYEtIedc2XVpecfmqSeWSvLxq5vqm
	raJGMglIMOwuKSnMFX2N82v2cFLbBmWUxs2QhaM5T8nRi/Y+Xdpv2WXkwsBO7fwsg+QGoX6xLES
	Rv+8jomq3WYEDi+rh9/T02GRm2AI311L/hMCdyPxKfLzkQrf6t4aBvzuv4ZaBgt2aZK/7czn4B8
	KRAoFGPf2Flqh9lpiVAXXTnuH0ivjEvGYK5RYS836dvC0/zWTNlDHak9usY1XqQCu5ILaWcYPwZ
	0oZR7djLtdFwn2jexTxPNexa0VZ4iYmWDf/SeG1TsmA0tcR/DvqBOw4WQ3Z+O/9hIwziH5RKYOs
	+U8Xrw08wUL30ovuzojWEKKrjEi1+CClhO1Ex+W6tVNj5FXo=
X-Received: by 2002:a05:6a20:2593:b0:394:5dc9:9758 with SMTP id adf61e73a8af0-39858fedfeemr14302482637.28.1773130073141;
        Tue, 10 Mar 2026 01:07:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:2593:b0:394:5dc9:9758 with SMTP id adf61e73a8af0-39858fedfeemr14302435637.28.1773130072619;
        Tue, 10 Mar 2026 01:07:52 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:07:52 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:36:34 +0530
Subject: [PATCH v2 08/11] arm64: dts: qcom: sm8550: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-8-b9c2a5471d9e@oss.qualcomm.com>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
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
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=1403;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=gYZaumYhSsIGJVNztvmwWowAICkPRsJuJxQKDEYgXm8=;
 b=r8k6uj5/kJCQ8zdV0eJV39dfQXzKWqmaLOeE70uG02ffT1By0BEWMp7wVTYwo5D4hTjJxUMbh
 RbmZVL9GRlUCnynr7bkvI3L0eychPRxgMN9MQu+o3Zyt8j87yYAtqs8
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: 2rXEQTrT28CuS2muA1oSc8oi9w74cAO_
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69afd15a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2OCBTYWx0ZWRfX9zDEp6NURcB+
 9KiTFUy63IwBXuNW75V60dBtdZbbp0L2g4KXMXlABjN2NxNNHT83nA5PF3zNeg+dPutK2mf59A8
 ANNIL4vFN6cS7lquceFGLzYKxeee3QMMbSXeHTUKS9s0kUvXRffM5vozFbSx7yWs54dj2GsP8X7
 E18LV4MuKc+49NuXk9V7hw2FGD9xT70ckddfHK/LAVjWYedvE6RYxGij8yA9qcFWGS8xtDOV8cA
 B7+wXBVPSePV9mS4fLmnLRpEecEN9/QbeaNUNO9X+PR90mj0QxnKEiosGf802odGv7IYKPIvAfA
 dKrxqdPNGKn9wmTDhX6j/EqKSBM+XQvp+bDtOU1ZIsoBZBNa6OkNIhkZalYvzLihWU2GVBwfSit
 2uoU6czp+hXDwzy90n5KEbqGEJBCoUm1q25yr6BHpQ4G2XIdJEQqe7B2U0XlpUkjb4uJRMfjtab
 HxQOI3asYOAm8HXtUdg==
X-Proofpoint-ORIG-GUID: 2rXEQTrT28CuS2muA1oSc8oi9w74cAO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100068
X-Rspamd-Queue-Id: C1642247177
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96548-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,1f40000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

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
index e3f93f4f412d..b6c8c76429ba 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2449,7 +2449,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


