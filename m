Return-Path: <linux-arm-msm+bounces-103412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AImAFMPf4GkEnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:10:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF840E88D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EA08311A5A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCC73BD657;
	Thu, 16 Apr 2026 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pn2CM67Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTWl51f5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10903BED7A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344865; cv=none; b=dci0G1uZe0NcBfilTD0aEX34s+JUSQb0OlVJ3KxRqHSiz1ajnnVvux9D2hiEQViI07ERQVak0H4vMl2tigbDdPC+g3y4vLzNs0/I8LfgQrIzIcVLe7P+s8u6J4liNXs6SmdhZy+tjodEZErvk2JL0+jHNyGVeQMNrFUjTtquoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344865; c=relaxed/simple;
	bh=mShqz2LMKwbtHeVqOaBAu5htLUyQtdiwxxmQtKd8+i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgXfLa7t/NcaCDtEQGs/lUdQLsRQop3uH7qSd5TvF42PjeHvFOJgzunLsE7PRKXSJNiYm8mYMNpv/TwCn35zQnFdcCbkYCCrjaS/sTCInxFc/vVhEXXE5KLlSvNTFqQVjO1zWJ4+rZ3iRLNcW4d1YEu3AThVfTh6n8da6QJh23s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pn2CM67Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTWl51f5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Vaua1702619
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKaAroiUFfoD71Cuw6J0zx2snzlwzrwrTDDWD+/pN0E=; b=pn2CM67YksImvZ3q
	kKANo5vUejPQWCDcNARZgJe91tum3kz5quB52XdSKaSXU70/SJndA8uaOM3yI1aO
	TfPQdsAUM/Y08S9LLnwPMSYhN7q+odVjzT+I/RnEq46CZYSYSHcTFDmrdAgHNf0O
	/28nG4tfswMy+IAj9eHE9qweReSFsO0bQJZBBGTQG4GIHy3lLGP6LXEMs7BCKYwY
	SZdNt5KpXsVspdTcn0WEMltyWQbQxQiWinHz0iJZ9b7J9DxbvAB2RaYKaW0xINUb
	/EU5GBn3iAFvSZhfcjwe1WqDa+duYLewctrBAohH3hyz4GdFagBX+yyHihzO8FIA
	pr32BA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamkw5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:07:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f07078eaaso4374355b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776344862; x=1776949662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKaAroiUFfoD71Cuw6J0zx2snzlwzrwrTDDWD+/pN0E=;
        b=cTWl51f5T3i3Nkx+6BqoGhQrI1cfN2HsJBwqfIn9Ji+y0H3xm6LOGB4OP4Iop9mx0m
         D1zF7iSFdcFjXeZgIIvYx8RZ2nUinVHejOnk5OES1wUzXxlUjOftOfTNSaKapG00Z7JI
         SYJfW+tBgyPfRMz3IvIBAHbt+rHGsnTOdkQANwWl+QO6lhZWBAT/fE8S+RzupnQiqVFM
         C85seBTM+x+qjxuEPbU2tnnp3bvMhUFvIs/Mrve3TZaPG/K3rsSFivuoQMjn9XtwYgpx
         jkX2V5J2tQFPHUYg5u4TGHycCFFjDkXs7va0IQPRpV8+DaKljYgkXr6XHzqsWodJJzNh
         B/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344862; x=1776949662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UKaAroiUFfoD71Cuw6J0zx2snzlwzrwrTDDWD+/pN0E=;
        b=N26WKKnu5Va+F/6xN5uDW1g1kwriNhlPXNEhX5JcQtOxI+ZrPdNM/sWVCtPOLRvFJ/
         9lMMJHMfylTRyMWRWypc6aJw4D9PfqXyvjAXDJmlC/0uWCZfOznLlzaSVT6uje95juRm
         FDu9Azuz5RWSWPl7XfC3d+/DlEHgJXp7pUJxkGgIvRi6jnlrZqx/aMJV9JBuxy8x5/3W
         05PeJA2qlh2Tx2sx/hpLGUw2bx7xoMucOxSRC7gY6AZUGpyT6lPWQFC74c1JE9p9tp2V
         7QJU7DuyYpbWXxW0DtVVoC+G72Znr0nve2YGYfSTqClSWjePM/o6Jz5KmUCaIrF250ho
         syOw==
X-Forwarded-Encrypted: i=1; AFNElJ+6WF7R06ez0x6be1LoRzDU2HV5xBT8oS5I7DqJD2DrHu+tKnme7aTphpsw7BpPLQwMEPVTR8FMHJvHlTcV@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTHXsXud5Rb7hdicn7J7RZ1cQIQjnBi2Upe3khmBHytCwWTjC
	+z7Z3L+faOAgfG4zucB52CPz/DBm9NWg9fXNNnN0GwyHze2BYEAorfzD+t5Kh0R/sgVzGyVKfZg
	QXaTdkuD9BlXk8JuCPv+3TO+Ysdb6ZKEZ7Oil22GhaSmA/PrE8gkPDjDd2UtU2AO6HIAj
X-Gm-Gg: AeBDievrVO4xxJ2CpkBVpSoip24X1cuQPke4v3DYCqx8tY/jNCqX7Dl5wtG7TOu5pyo
	bP3JQ7dz0pOK1HkZCSnaNbWqJ1YCjDmWk1apsh00BVOPEIGnf1iSmozRCL0u0EVi9r8NLMCHtDO
	DBSOBg/1pCdu0usFGpYiSvd0R+sb6byKhe24x+5TAFD54DHDQRaZOG0u8XVx9dGFxEnPMS49m/D
	zwd5c6sEIQhpR0ar/sZ/bdQuidnGO41+7wXj/7tkMuuPDkZncvvLhFnwX3C7S0DmLWmdyFqAjqu
	4aK6G7xoqjDwDG/TcgFAMoAqQ5cL9iky42YJaMuD4oIE/8EWzGFI0wArG9XuHrAgAVraiXolkNm
	pXv7cz26MZO9T+pYD+WEB+pz2xajaxRw9nEbyF7AHK/N/Xchn0i6iU88P+w==
X-Received: by 2002:a05:6a00:17a7:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-82f0c2b03a3mr25624167b3a.43.1776344861609;
        Thu, 16 Apr 2026 06:07:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a7:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-82f0c2b03a3mr25624130b3a.43.1776344861095;
        Thu, 16 Apr 2026 06:07:41 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67449c3asm5383605b3a.53.2026.04.16.06.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:07:40 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 18:37:21 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776344844; l=1588;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=mShqz2LMKwbtHeVqOaBAu5htLUyQtdiwxxmQtKd8+i8=;
 b=r0wbMGJ8eYygyPdwRWkPSMTKA9Z7ogUpwaNN6yK9Hxu8LMMe9GHsmpscWwmg2DdaTRv5e3BtP
 F8h/YebFK+VALaT8aZJXo+wKQytjRu2MAZe/AvTgS6TlPsOrCnds/Wj
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: AQn24bRfAtT1iwoLxULIoUqNEoQX2weh
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0df1e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lRx-OlksSAv_QJqe_iwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: AQn24bRfAtT1iwoLxULIoUqNEoQX2weh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNSBTYWx0ZWRfX5uZe1bttUB3Q
 onfE93UkvI7yQcdgcE1fmJRTtA3+JEl1ACI/P0dwXdiP3LixZgvVXe2npR6dKgFyLi4NUCsl1w1
 LYIZkVeQeOfxU6rm8o2ba9BfSh8n7cjnnXdh0zaSdayLrb0ZT1dTrsJ6i806nMsbuYuGRzfsGfd
 NY3Vyl8mGgQVs2+dBdwSGWc4DMjPs53+Cp6EZ2884gxNN8zvl9bWxwZz2SPCZQmB6/SBuWOb206
 T3ZrehrZ8Sge9GWFMaJ3W9904WxNioJOG/KCOi8Q6c2YzKO10dODaVaBDaTJJCYXMHLQBgbIsKJ
 MIyv/WgRwTRWFKEuHTnhPBsyyfekrkiOa8x8J8ZbYMWRUEu8jV0S7UFeXEMTH+SlraJLSJsWZxY
 o6PJAxQu9erNSek0+eYJNdTmYwXfLKWr9Yw2yl0V5winfCIdcKzfpBf2jxrdDgRLzwbB+Evwy/H
 8DKOHjKiHw2Ni7nfPIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103412-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1dc4000:email,qualcomm.com:dkim,qualcomm.com:email,f10000:email,1f40000:email];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: EFCF840E88D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Glymur, there is a crypto engine IP block similar to the ones found on
SM8x50 platforms.

Describe the crypto engine and its BAM.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..e8c796f2c572 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <20>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,glymur-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx",
+				    "tx";
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1


