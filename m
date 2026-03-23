Return-Path: <linux-arm-msm+bounces-99144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MagIvQFwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:20:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC012EEE94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69ECF3009820
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD64386545;
	Mon, 23 Mar 2026 09:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c08vod+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+ZyICMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F9386C10
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257539; cv=none; b=TEaQlnHyKlxzt7CDBmbDRfFqtQrKv4nnB0JQyJpknTJSXl5T+hb1w6Dl5tBjUe2cPx7yjMzbfqf8YXCTstdoQgHBbWTp/lPrBIWnQkFFt7stLLpHM0ay2y85vEtAZn83jVporJkhpzc4dIQr9ijlwKSZ+0gSzThm9vIUXSetFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257539; c=relaxed/simple;
	bh=zSf5B+scx1LHzF3C7LbBC/eyKMhHBwfouTQryzgofZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tftFw/0gCUZYX0VzRa2HosmvqfjBAC28kQclOd2HcsB9FSPk3WwTaX/WDuWfVLfMAhP2qhHMOk3akyRaTd6JK/V4id1p1jL+dAFv0n+oYWYMac41SzgDct0eDIt922kpnG6K2Qhm9KasmyuPX876SIjs48S4gTQjA4k4tGVNodA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c08vod+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+ZyICMU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7M0ah391040
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxOtgD2NGLF42PFt4g53gf0KWjA7/Alkky956K2USm0=; b=c08vod+7aXUZjxq5
	mP5rGz0KG2Iv3ICJ4p2/BY9yUkyPnYLys4qen1FcUiCmTPYuO3jdOGwMUeGkdk2m
	uOWBU69cpHyCmcPY1Cj+8/oq9Ny8BuwlMNQnGwmQDRH+IZajm0x28Qq2pDdQaNn2
	9tdw+7BbduaNchvYl9ZWzR03PV4YKlw3F6VC0R6pdmhAuPXCFqrlb1HehH5f3z8c
	tZ3My8H6XWeMzLubIBxZh9y16jGp8I8gAXYy6j4sroSvDj2QR9Ds2DbtWIsbnjCJ
	B733J4ZzSZ7XPQrpWQTdkgaNbaFBnTmcp2WCyr9otFJxkc5GCJRDKRkxdpLnWyr4
	m7+naw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4t86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso5348342a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257537; x=1774862337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxOtgD2NGLF42PFt4g53gf0KWjA7/Alkky956K2USm0=;
        b=B+ZyICMUAaEybtWLLx76IPt4heJ1KsZzU3iA3wP8mF15EdUKb/W649bOiqi7ciqkEY
         ISBpjjQRxPPnBe+luX809lUC+V/5LSK1FrlawidqUQgiu3K5zriktM8AsY3XtdHLctS7
         z0tTkC351tNZb6a44N7Ml4bkBqnHvsJipLpIsnVcQJhqILJFzS7his0FaIQx/Yu3L560
         nlhIgG2tdFj8DZj6+poblvVyUXmXXU1OZg8syuagpkYxez1Ed3r9WhEU9CK/73jW/GlQ
         xfCUw1d9li3qd3elw076vepogCsqPicS8LLAMyU1Rb9YyojwzVkVWCs+EOHEIHk1/hlL
         7Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257537; x=1774862337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pxOtgD2NGLF42PFt4g53gf0KWjA7/Alkky956K2USm0=;
        b=l4kp8v6/MCo0Ajp2CSH71pFwNEVp6dVmmXJsdhZMzK3EBJ24g+fU/YovC6tGSKxJYL
         ISKxa/bf1BeeVvXEH+hZ1cd3TrkfIE1NW+jq3ycXHQOikCSZopACoLcUAwIg+/A/LCiG
         bywZCC/O5FCjTd2VEO2vkunbnQ0j+kDpDDjErIMOcWLc3mu6IhU3iFSdliSid2tzi3Qa
         3V0TJpQ6LrKIbUlGlUw03gbdJonUpD+EOL37rEMXniEMP5TyRbwZ8YdFyK/InnBv3ooQ
         jL7Nfy3YYBTQw4JhMU19ryKPmnR1jQhBvDK9mRv4kOizoob7RPz2dvhVV8JRUK/zeWty
         60iA==
X-Forwarded-Encrypted: i=1; AJvYcCVF6pUv+jIypsslTm6ekW3JIU3f5JAicLHvBWBbeLOI/hiuePGSxdFhb3t3JTW+ghMaOqZsZcVVGfyDt3k0@vger.kernel.org
X-Gm-Message-State: AOJu0YwZgkV+hp72fTS+IxJUGLLvvrBcuGCLr+PtkLWsla4z0hMWQ4Bk
	zRgC/ANXFaBfvoAc7T0jlAu2/AWBfpAzQww6680TKW9HafVelGAgVwZv0ny9lBTmIkSQ3P/8O7P
	S/gAJHq3Yr2MgsJW/0VMk70VE/NBNgAwTpNxyvize208s6RR88cvzi7kdJChQT3xcVifW
X-Gm-Gg: ATEYQzztUUeyRm6TBbD27iHfF72qC+gnmNTjvHVn2KpMUH9lGSh3e/8s2xWJZwSEAaH
	GFGkYnJb9a3srpi4NChewsktrdAhQ6nbvaYP/W+CYOdw2Fqr8Whvm86UDnXpOtsptccG4drFMjY
	euljUwaHANxLlFvCNXhQQEFjbx78BFsTOe4wrG3aJY/+BO7HyCjq1aFlX2x0TyBq5KFPXvkBS5H
	y1ilT7Dy0ZWY/m8cNHt8sVp34QuxWSojS+STL4smB5zXugVp06a+LiiZbKQpLUgeQ4C0ZCwLX6m
	cJyQtT1KlmEWx6sgWqyzowiEvlfUnZGdEoBRX5t5X0VFlBl/43lPfL7fT5sQwebofIg/PIJm2K8
	rT5tOxZ1A082CSBInt0f0onfTNGFbppK90nqLaTtE6RX9Csw=
X-Received: by 2002:a17:90a:6c82:b0:35b:e4f8:7cc7 with SMTP id 98e67ed59e1d1-35be4f8d75dmr3257288a91.17.1774257537116;
        Mon, 23 Mar 2026 02:18:57 -0700 (PDT)
X-Received: by 2002:a17:90a:6c82:b0:35b:e4f8:7cc7 with SMTP id 98e67ed59e1d1-35be4f8d75dmr3257259a91.17.1774257536589;
        Mon, 23 Mar 2026 02:18:56 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:18:56 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:58 +0530
Subject: [PATCH v4 05/11] arm64: dts: qcom: monaco: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-5-e36044bbdfe9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1516;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=zSf5B+scx1LHzF3C7LbBC/eyKMhHBwfouTQryzgofZ0=;
 b=KE2Bpeyxt+9POWeOYoFJl1S7PQnufeCWHtYVTgveOr+XvgBnLh9rgpPsTldA2Gh6Vp0GXWmNS
 Xe8uo99AM0wDLgJw8n9TK2D0vSedbmuBcBoLlrc+fMymHylZB4Bo2fU
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: ljHsQBJM-tqzSc9vUsl9QX2mSd1CLiqb
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c10581 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX3gBfKA3FTfgC
 5zXiz2OyFA2N86O3RNEIxQ9t3xER/PrPnHOIim6RhGFfY3/mR5rqSDOp1pVk3AsN3hmP4HuBqO+
 +M0vZ53pNIvMuDwLhJENT3m9NB5OZRci63Dtwld7T9kRzMqoUfyh+80x1nzz/QnPHSoVK2F6P+C
 UYs+qv31vJ9RxknvHTG4o91yB/MwsKFXwXZlgQ2yyvzxRJsAtHJpww/aNjtlCR9peoJ8HnBToaU
 LAxq+r+2YBbJeaZ9Q5qZ8zM1xr4rD93v2OUJ0Cs2o76dUBOhFqmYTN8ITWEjDuvt6fsf9eqOfIx
 gozOHIMjikuYKhBL5EGV/aRW3hoFnWhmCbasGHn9nez4BYUbWUpeSKby2PIzCrXP+9sY11+3P7n
 xFCzKIDAOO0KL7W4SzgwgQZC5LY+ieZmWNQJaCKm0ITmf33zPlJy54nya3TlLvGuakNOVVB5IJC
 aYKFpa2pQ+ZOZ7X6nFQ==
X-Proofpoint-GUID: ljHsQBJM-tqzSc9vUsl9QX2mSd1CLiqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99144-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,1dfa000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8AC012EEE94
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
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index f92fdb1cefa0..e408f102a8b3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2725,7 +2725,11 @@ ice: crypto@1d88000 {
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


