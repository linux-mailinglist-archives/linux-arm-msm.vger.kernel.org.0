Return-Path: <linux-arm-msm+bounces-116635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hPY3CvdFS2oDOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:06:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7200370CC8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:06:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U6SIsJZN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JCzAUXBR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116635-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116635-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8808302ED5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A393BFE21;
	Mon,  6 Jul 2026 06:05:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CF83BFE2F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:04:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317900; cv=none; b=LIge8flRlh9CqaAAp8BbAFxfrNaQoWY3CiwQDdl4sAHZn7FGNJwk5orTYSQYsSGbGxzPRi9GvfpYus6djXSNrhmmpR1IKXLcol9N7pRV6lmcFEDLMXQ+OH+ZbLT4yv813J6dO40q+Z+gmc/Wl3yHJYUYr3IOEBiQ2BT8EO7q6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317900; c=relaxed/simple;
	bh=HJ8jS3Av1jCwPYHPP2CB+zjLVJJ29OvK1VKXvPWoytw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O88GHEEFKaoKvdpcwZaPYrWnWH+q9nfD5KwflH2hDxzVqcy9gHlZSipHyBtRKdCAGuznLIUwdC0B/TMSNiDOGI1ELTE2qiaSwYjAh64eS2psRIKKZfDnA7qakCAUiQXKv0juqNMa4yVKF+kNcsX7Qn4TOApjq+yTNI0TrH9lepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6SIsJZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCzAUXBR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641T8M3470431
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEqGOHWFuYNqzdrsUSU23fmEEO6FXsZklVxqAYDUKAY=; b=U6SIsJZNd5giFMhK
	kZ00bSdtwFay4OhYjtkjMbFMoCDcQ4q9IrG6Imn4pxMCpC6ZrRTBBtdUHnpIUzX4
	4jm/tMQe5ed8QemiqXUnGnsxkA8z+gNj5t8WzJA7uaS7jaCpy3IewdUxOhgEa20g
	Ww6Q11U+xHEhh8TdRBn0Lh8IDVeTaTXSEgLAg3LPfB3I9Vbga20dScidIuHyrILU
	DXriFcYeuVN5UO3rUiQ49+hiGusV4lzLCBTVfG4D2e4snIiifdUXHa6Z8+O4V+cJ
	SO1qHz8ij4hbt/FvUn17roVaiTxW2zPFn1FgfZ4KBMsT0X8lSsZ1y2PwpJHvA+ja
	l+fGog==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemgj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:04:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so3100802a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783317897; x=1783922697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEqGOHWFuYNqzdrsUSU23fmEEO6FXsZklVxqAYDUKAY=;
        b=JCzAUXBR4Ht0Tn6z5F0uPzdFvQ34OJGbGJ//OHkyJqhKCTYJ53dmVCBw8V7JfF6n8D
         gjXjWWnKxm6wnI6N24qhPw9HE+1+13BMUQp8pHqxD0rvmSix6dsIFXj5xEwAHa01eHau
         v5LsFCF4Kz4k48b2WKtzNbBXiL2OApJ9rLSSOnH6+pBMkc8S4aAcceczXDCCpqMWbFHn
         B4WvZy3tnANR7fjAnvq9kP/W+RHDXszay7fw7DdDoEcKgDoNTT7kcV3PwjdG/go5k8/F
         vJcQAfoGdXPm5ZTCgiWNo/iQO6j0woFF6PC8rjGElcBu4pWx4iH4gGLdUlJWAlic4YnD
         N40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783317897; x=1783922697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEqGOHWFuYNqzdrsUSU23fmEEO6FXsZklVxqAYDUKAY=;
        b=hYb+UF9RyiMOdmEAee26DZHuzbJxdlI+m2wlcKnIYqTcYM4IUPM2NLsw1xSmJitZVl
         mHbmMR7IrkhIHHNreZ0qJ5CHlemJBYYNFPv5Org78t1eABneyGGwLjNYs7MfYU29iri8
         eC1ELmuahF12csRl52TJjnQYJS2PpTisFB22hE1jW96rd6JYOjFtFs41gOG2l8sNreKl
         HH/7qx7FKIHIcRUSqoxZNVIcaGG9zyZG6iWA5W5hZ7/P0wGIuiaRTvTosj/EidfzDeTA
         1LL2WvP8nZLJnkHaX0Z/whwm7mTwca5X7Yz5vgVpo1JJipI+6/EYdAvuzc90md3MOWHO
         zwJQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+RB7W/kFYXp2NSnFVwWoqIdP+Z3j/gPSGJ0k/0Zka/7fo/0kA8oZb/l013orXd5BqddiUq1tMCYjWpusm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LQUK4rhkFVTqI8ZiI8L3aoqmpV8AgE8C3p6RmvzOJbFvm4xp
	K5/YfnuRsZnyV9eif6fLO5RQuByXeXX/VHd+EKPP0BPubDUUQ9uN/4eEDiTZLY1EzYQxMlcJTe2
	ycsQjy5pjgY7bD3dFHbPDI1sBv9C7iVG6H/+tdlY0d6j/Df10V9CPxJe2uacXZMHel7F+
X-Gm-Gg: AfdE7cllt+DNY3JBSW8BpktTsw5Em/vHb/BJNu/iAmbp0RFfl4vkRvwUC1GwOC/vPK9
	wMFKettDNO4pDzzTw/ZJcsS2BKvyjwMRXVTkEi4mmyHzDSQetJR+EJB/ngULZDziSqFaIAa6BUW
	t+ZfhzIskLA/+FjLNJ8IzNR0E0MzfBW7mGkw5xysrhpVFzgqScB0FJpU6jHP+AvvzsCecugl7gF
	7h+JijjjcMQii+iwwxIPlxMvD8PdaBHbj7koX+0GIDoJ5WKuuxN5chBtnzCwyKi1FFiWqVFy1iu
	dd5xDks/MzYw9bqfURstyFTjUxCZFl2WFNF+IiyNQS5vElSoPPmJJkVfOvBqchMaM3TW9sEaPFt
	zT0lHqRCI6Cfx//tl5VFbR/+aihtNm8//fcjTPQ==
X-Received: by 2002:a05:6a00:44c6:b0:847:8048:be94 with SMTP id d2e1a72fcca58-847f6ef6acamr7644313b3a.33.1783317897611;
        Sun, 05 Jul 2026 23:04:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:44c6:b0:847:8048:be94 with SMTP id d2e1a72fcca58-847f6ef6acamr7644276b3a.33.1783317897026;
        Sun, 05 Jul 2026 23:04:57 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498dcsm3113266b3a.30.2026.07.05.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:04:56 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:34:42 +0530
Subject: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783317885; l=3791;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=mtGhNr9AoRvr1ClOqJKcXjX7QbhtzKUvDzRiaKs2dXA=;
 b=nam1vDs7CY9Anzq5xMBRrx9m3YwsSqBDn8oF2Zqar7S24qKkGloCKkwwOLpYM9HzUw53UlV0a
 pt6NZ2PFV1ZBkVMPwvOLbYOi/sDKU93fNEZuSKVksPzcvH9OEWyuaSk
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfXyiDgk1+Gd7c6
 X6W8yKvn0l/N+OqyEvGWXOcY57l4Bjkv9L2ch1MnsV5uqKWA/LdKSiQjrIrcOqUd6AMMr93BJ+Z
 2kfLk+0+S9YflNbOnMCdrfpdutl60h8=
X-Proofpoint-GUID: xhZZ51tX56MY1ZkzTlTnW-e7lWrxhQvV
X-Proofpoint-ORIG-GUID: xhZZ51tX56MY1ZkzTlTnW-e7lWrxhQvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX7WVZfiNU8uL2
 JELFJbEf0fvPaKXFWhq0JNXzJXjw6qKuwNri6jR0ttWK+8oVDhTodcbXQVkHTbtDLoodFJswpfd
 mnQHq4S+X/HI+x4WJbTZf5NOR/BkyQ2eRJicDX47RjSSZseu8TfE3OiYCWkFlBZ9M7jP7byW/UY
 Xpptn0I4R64hlpUm0rngnwub/nnSDZ5bPSFu4zNIIWowt+hUS6CiuX72SLyZQLGqcRJZ2vG4VGB
 fWM8VtL4O719F4SEy4KLIj5lIw5j3+pP01FIa8cAu4+YZUsU06sNGFS79j+prTfaf7+izPQqAFU
 7B+USF4k1BUf5mfk9Gx8Osva4rsKQoLYP0x+oC22xGd3soVd9rBJtBAMqA1B7DTFhV0x+rL69BI
 Q09GSgp/vLXQ+4U1ZrrvbuZ4FILiRIgvPZx3f27xoXXBCE54pGX6ZfKdcnYUCQ3oYy9A1syI8ji
 tEhfGAFFw7hXI94yfDg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b458a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116635-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7200370CC8B

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 ++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..953b5608928b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,39 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		vin-supply = <&vph_pwr>;
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +93,53 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
+		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -95,6 +175,52 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


