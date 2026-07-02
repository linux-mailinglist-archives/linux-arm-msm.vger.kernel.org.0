Return-Path: <linux-arm-msm+bounces-115942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cQgZHMhERmovNQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:00:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E456F6537
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:00:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T4ItMzV4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UcHrN8bf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115942-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115942-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1390731C41E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9351B3ED11D;
	Thu,  2 Jul 2026 10:46:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB0A3A5E6F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:46:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989201; cv=none; b=gP7x2ERgBQNasj6qJqE66E2CG+AoW2f6qNQ56p/j+fVV2Ebr4BxiBlGsCjgLtmEgYDJ4OdooZv+uJg8TnouMRUsXdqwkOBORIHGNXhTAJVgV+um0IpUsHThs9gG/j6vOc/1aO380Md98TyzDU5r8z7KRk1SKVlYmO2v8vBu2/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989201; c=relaxed/simple;
	bh=3DSVzwIlnQfv+D7lfNEK0mAhgs9cSZ6PohGta8ETunw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vyv9bQ0KmvQujQoTguBGawtexgcD7zEs9NWcyIWM9T2WkwNpRBjsZ9HfZsuSc3DOSuMsYlKrFAg9lcgZU6zOfEtu1H6ZX9yQes1jJwWF3DaTSKlQ96UDdVcW4VJiEN9AS2cw1VJkeOpl/Ey2v/ExHLA2yK9EHTnqhPQHl7u02fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4ItMzV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcHrN8bf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AfBij3592225
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wa7zNeg/NowcWs39grlG3DDJYgS0nuGoGJSwyYi+7Oo=; b=T4ItMzV4QpaTtcBx
	XsVrhIVkfIpAIf5yUx+JRAUEB2piepvOZfe4XDKmVQxNjAPWFesCq4qSmt9KLGw5
	vqQhsBW1Kc7XW3WE/IP2o9jc8N+svf3miupUWM7ZoOhxdM/YoDFpRrAJ7xRJznhl
	4rpkL/EgCj5BDT41MBHUADyfLGSZoWJvHiqd7Sao9BIELkkQPpK5CYeSrj9RUTrc
	MQb8fJXzlvz270zHmi2onpJqZlTKIDB5il+7Ls1cu80idVKSt9SzNnE92QOzfhRY
	BQ2m9iq7wN5JPksKS4U/DjyqCoX7TjP2vYsv8d3tVHqFaXYi5KQJhKuvbFn5F+Fn
	y1jTgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9aep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:46:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so217307585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989197; x=1783593997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wa7zNeg/NowcWs39grlG3DDJYgS0nuGoGJSwyYi+7Oo=;
        b=UcHrN8bfSR6RgK9NtvaXhvHVROBc/o13hdfG5xmWpUATvmV5xu8/VcqU779U2Aafgw
         yd8y+fIxiSE200ohu0SaFY1bC93gwnxLonGvue2NH7yiAjdVKtNxwBi9BCEFkoLHatcC
         Gic6np0+8IP1RBZLPbEceYlRZL1dT/EpaG+fih2mOYNW9hPuwAVF/NRoNTjE9GIDFhFY
         W7sv5+c9G1KQUduFfv+Z2iZ4JOTXsFtQOtE3z9Yh/p2f6P6ODNudhRbChsGASYJ2aEhk
         CstwZuIo5HfSJxUFNKZfpWA3UazwmDabpgDZ80u2H9sQ+l1+uXZEN1mJqhIhPfRAvAYm
         nhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989197; x=1783593997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wa7zNeg/NowcWs39grlG3DDJYgS0nuGoGJSwyYi+7Oo=;
        b=SAjdX2qC8p5kU7KoLtZ5ik6x8CIUmdrLzgTylcsIIYUtW8vBzoggnOnp+3J4qMfTtz
         msviEumQ6yJtj9y/2WgN9Un/BGqQ6xKfhYj7yCslGfNc0VVzyEYr8Hc9u4X2iEzuVwyT
         cA0xjQ451iFn2UplOBnBq0MyU8Nf4TwYB7kLIwg2S/x5hGK/N5SZsDkVO84FTxRLp5sB
         Az/zeurt8GTNmX+RG924q57NHP2ttBHLC1sa3NElK2N0/GYzD2ge31lH9xVoRYRh3wyr
         0/n7Ym6atRe88ApFLLx9E6mCW9WozRzaEDJ3dk3hDZino16CnQU2WST51y+nAkxxGxEx
         JNCA==
X-Forwarded-Encrypted: i=1; AFNElJ8KHfHyQmUHnDLoQVkB2oWU+vHrZRZyMgaVxJ/RKCVHnMMI+GYBUC0q3I19q0eGnuiuC1JDd0UxWd9FRkt5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxozl41ir6PmTrN6tfydf3jq8d589aymHFBLDSiDsNDijtQLNyO
	I37WdB7R4APUBp3Wa0erZs0Dnsyl+9wFvExn4ZIx9HrQX+Ki9AT2ycqkF+/uiPzvAVWZWI9/ypz
	ixHND4nFYdEqxZSFHxoxsevUzPCOUhckefXgKAp78Oe+HkgT07Gfslfnt4XJSEDdd8WpA
X-Gm-Gg: AfdE7cm+p/OLMohe8eqYpBzperXgRaX3V3qRj8vtGY1g//FOYt3XF3qwviI1nNRCtzW
	uQe/AlfpaHMWhhetz99MQOqxqkBPquArYbGbhuoZTTlZ9YkI5jMbicdNbl85e0fpXMYJjVAabvr
	jGP3pS0x0evaqDwyGFyHUyaM6cM3enmO/w3hYnT4+YklteF02UblP/lTQwjAvlmbPFknrC7lE6z
	i2NEl0wisupsJqRD8V+lI2x7BC6BbulvEJMkoXXz+R0A3VLf8nbo3jJd3/rz3+DAeRxV3oWBE6v
	GByJTTCIvILdrZJLZBIkZx06A1H8r8xnb7XqfpjAICYuvHPJEFFwN8UlwhmCLk7iXYyyvT9cDsD
	6AwPcM4rHws4xzTvCby3hjv8gHRmhcj4bSZ7kh6ro5EvsCwk9SDehwSaBQw7hRlO5vRrKOewn+f
	+//XrYY0dh/p15VWe9kntYXkRiXCz0/qat57bVuryptuI2XbV1a9MYiF+RWJW/7cQ=
X-Received: by 2002:a05:620a:444f:b0:92e:5610:e479 with SMTP id af79cd13be357-92e784db52fmr656335785a.52.1782989196834;
        Thu, 02 Jul 2026 03:46:36 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:92e:5610:e479 with SMTP id af79cd13be357-92e784db52fmr656332885a.52.1782989196333;
        Thu, 02 Jul 2026 03:46:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm109689666b.0.2026.07.02.03.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:46:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 12:46:16 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-monza-wireless-v2-4-7b56e2a6a6d4@oss.qualcomm.com>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
In-Reply-To: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfXxduppZHprxWG
 UTnTcs5MCffRTPhGUhmvqQ8UhBS/bX0jx1e6599GfB0YAvOYekoOEiqOHCQIZUuAx+feDtu0tcj
 eD4CrzGFdP5+zdfQibxKVWNB3HbszKdNvC+Zu7tddKx1G3L6e37Sepywo8ySYby8n+FSTxeCYog
 tcNa91n2VpXGab3ThXhnKqeuz/z+qx54Zm++l+W26ASdCcSu29iFVPtL9vcBA2KVKrcLV2sIlqj
 9k0wxeT/ND4GMvDfN+2Ryp7v0J27CxommlOug1XmS+nwF4t/h/ZQGrv4ELvwLnSMPHbfidX7YTL
 OtEW6ccQxbpwjieI30B0t7DVgb/vJEKCzF22RE64+pbUqpMmLoT4Fc8zMOsBNtxNesoYRkWB18/
 14LsGQh3+2RLdNh2GkH2G3pYJsz5bvpS+ibYo+rZHd7JzU5r8xYIA+YFmZpAHrqmWPF51M2BVu8
 pmH4ICl5Z/R/k2XDr0g==
X-Proofpoint-ORIG-GUID: -Y8LsxgKpORanJHiVq7cjF9ObkHckCny
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX6xv2Eqac3YOc
 6SNFyR3PTH3j2KzRyONbAx8cwKNzwpxZdMMLq43TFvokc5ZW5xty16trL559wRnYFZLP6UJy4Qo
 mrK6y2PUSu47jOxnuLbNsm2LkWHxgwg=
X-Proofpoint-GUID: -Y8LsxgKpORanJHiVq7cjF9ObkHckCny
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46418d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115942-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7E456F6537

Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
Arduino VENTUNO Q board. The module is interfaced via LGA and is
compatible with the M.2 Key E.

Add wireless-lga-connector node using pcie-m2-e-connector binding,
connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
the Bluetooth interface.

Add pcie@1,0 downstream port node with pciclass,0604 compatible so
the pci-pwrctrl driver can acquire the power sequencer and enable
the M.2 slot before PCIe enumeration.

Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
(gpio56/gpio55) used by the power sequencer.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 64 +++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index f67a554adf956696aeac2348e478dbd0b74f0e62..e3d3d68932efff494f3c7ab96d75869be24c4a94 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -155,6 +155,40 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wireless-lga-connector {
+		compatible = "qcom,pcie-m2-1418-lga-connector",
+			     "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vdc_3v3>;
+		vpcie1v8-supply = <&vdc_1v8>;
+		w-disable1-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&nfa725b_default_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* WiFi/PCIe */
+			port@0 {
+				reg = <0>;
+
+				lga_pcie_ep: endpoint {
+					remote-endpoint = <&pcie_bridge_ep>;
+				};
+			};
+
+			/* Bluetooth/UART */
+			port@3 {
+				reg = <3>;
+
+				lga_uart_ep: endpoint {
+					remote-endpoint = <&uart10_ep>;
+				};
+			};
+		};
+	};
 };
 
 &cci1 {
@@ -409,6 +443,22 @@ pci@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
+		pcie@1,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			compatible = "pciclass,0604";
+			bus-range = <0x00 0xff>;
+			ranges;
+			reg = <0x020800 0x00 0x00 0x00 0x00>;
+
+			port {
+				pcie_bridge_ep: endpoint {
+					remote-endpoint = <&lga_pcie_ep>;
+				};
+			};
+		};
+
 		pci@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -501,6 +551,12 @@ max98091_default: max98091-default-state {
 		bias-pull-up;
 	};
 
+	nfa725b_default_state: nfa725b-default-state {
+		pins = "gpio55", "gpio56";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		wake-pins {
 			pins = "gpio21";
@@ -544,10 +600,10 @@ &uart7 {
 &uart10 {
 	status = "okay";
 
-	bluetooth: bluetooth {
-		compatible = "qcom,qca2066-bt";
-		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
-		clocks = <&sleep_clk>;
+	port {
+		uart10_ep: endpoint {
+			remote-endpoint = <&lga_uart_ep>;
+		};
 	};
 };
 

-- 
2.34.1


