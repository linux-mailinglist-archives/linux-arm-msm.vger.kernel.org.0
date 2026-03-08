Return-Path: <linux-arm-msm+bounces-96097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFkBMW4IrmkN/AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:38:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1CA232BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60669303DAEE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 23:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DB6359A9B;
	Sun,  8 Mar 2026 23:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdA6mJFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4M3sQKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9535BDBE
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 23:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013033; cv=none; b=BEk3iEzhLIcBzKCod74ezmTHiYIEosK2F1AC6VijL1BYoFFxz1BWg8ozaCaTTnI7VSzota6wt75iGitRKDYymxutERNknjPV3zG41IISOONm2WJZM9Y25i1NH++vCl14QOT/4OHXV/A0OfQXTrQcgoY3K7cC+q4Bw9QhIwiVP7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013033; c=relaxed/simple;
	bh=GWftoszj7bbn3ImxQVyW+DYVQAbOtHpmtrjaSzfje6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ud7J+27m5PlIpRZ8r0X79K2db16laqMODb8gAmvsTXR6WHaecYM1Ao+BanwgfdSw6f8xHsMvF3GyID+h8gLnxBV49u2xfwjXv6xc72/a7K2HZNRMR4mh645FJU5z9H98EJyOtYztst+PzGnCztSVq2L/nZpKGD9IqCZt1M/gvyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdA6mJFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4M3sQKM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N114D199406
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 23:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t4G1XLE6zkU
	yEgv+up47Gk/kIHuZ/MbxKPZHfvipbfg=; b=kdA6mJFfimqWaBk3RzEsdbWSLY8
	VffyiPNdQTAGKoKxdNj6UHW02Iiyu8ycyjI3Igt+wvuSDP2fm6JCIA8Wj8SqysIf
	nXNXAiCaK/skNv9Kv+dyjb9PyrsgS3M77D2wQqZlLkRCE1LbGbpnrU+ovTY0skG2
	oQ583p3pTdFDic2wwRMmFTvL2NOhr8PIKchkg4Y1onXQ96/tzIgGsjHesgBKTvCz
	hbgrwBdx1XqKUbhfUF6hr8XJhW1eq5BfqhtZiDRffQ27UjovYSE8/gsyNyt423HN
	WliAN9Lo6+MBKtbl27oxbfBcrGhBB2cRwGZ8aRU8+ZFaD48Vv431TQEbdEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vb8cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:37:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3badc00dso89428765ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 16:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013030; x=1773617830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4G1XLE6zkUyEgv+up47Gk/kIHuZ/MbxKPZHfvipbfg=;
        b=h4M3sQKMAj5Q52Yn5rP12H+VgT9Q2d3O8ICSGX/1scP+4qYlrdYiwi3xI0D9p23Uk+
         H+gGjIXVpQqTaTBdLaLvGp/Dz/wY0Ebx3Fxrf6l3Y5yEJXv6qKFRgqt38fSZi8z2I30A
         ZTjTSGhL5ftIWjW0er30HJ3tQl5NJVgBrYSJ2ZuT5Ezw8VyXmvZD6oY+tmiTHda+RUE0
         KC7J16t7FYVHy7XBKInLzkOSad/e6fdHbhWE+afOwpF9DG5SQX1bVqR5IpWLb/Zvl6FL
         IF69vpeRGW9OZAQloyqx+9nXBV9+o288fFwUjjgQgL0REt9Iu0Q0hZ3poagqCTAfEB+G
         g7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013030; x=1773617830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4G1XLE6zkUyEgv+up47Gk/kIHuZ/MbxKPZHfvipbfg=;
        b=eIAP1D+Ml3dj/8MDKmilJO96r/qgUn1qOOtvr6vwSUeQ93dAeSFnxqlkMhFvIo4CC9
         UNoXYd3p9MrsALBOOIZp6IHqPua3lKMtGgzdIhN01l9yYv9oyVZ6JW5N9nQa8/3inSpe
         mSsMO7XKVAC0nZo71DS7AHn0UPIBGXeSYDWZc/xEkXFKrd54VYOqFzVqQyz/+QbIdFti
         Z9S6SGZlWcsraH9rMzuAZhikR179pRNe/SL2ZJfiodUszbNdpzX3uV4mwT42kFU23fdM
         H8HDM33aOmfyjpx5DQP8whlg87EXLuwun+wEeYrxucbG5ZApAqMA6fceuDybevFzgEoJ
         xJ3w==
X-Forwarded-Encrypted: i=1; AJvYcCV3MFWZZNWuZpfhnQp+XNrqoccNZBIkZO1U9YTXdzRhUH8uzFmC48RdgnQyDsAIZHfxsZaZKxID09mIEXDw@vger.kernel.org
X-Gm-Message-State: AOJu0YwLwttoHNl0bfWCkJ+6/wh7tbwaQkGd/EwPUxmjMrh6CyvFzHbW
	WgVaNwC95bYUdkJ8kfQK5qLPvy455kVIYZXT04DLjKsU62rXgXMeNl094gAVxDhEf2rcVkwT0DX
	qo4IoEW2PYXHnMxWrhto3BVkF2D1mhulY4Ryy/fWDHRoObPb1sJG+RDbLqWYwnFBuv8BH
X-Gm-Gg: ATEYQzy5buR3JPBlPgz+TRU+TmVwbgEZ6WN8gUbzlVn+oi30gj11GhgIJG3QzlcAHwW
	E255Em3cMCGRVDFKR3xPMtOor46NYUwd2JFy6tZtv6quCbrj91sHhxZWdG5akVpvuGhq5hN7c2n
	LY+87fMyRr5ayymSzBaAfujwSLuDGntxkJpGPqAEYo4m6sH5Aiz8VIuniLqj3OlSihi9H7HB8CY
	Hu2ByCGIstVUOAVQe5Kqt2ghA28x5tKzOpI9li58SYHGKd4ZF1EUn3+g0gCm8WTgYSY9/9ycPw4
	WMZf1roEBuooGiVNTdwQIsrfDibRwN0gvVEdW1HE6xmix+Lfr9+n4U49d+e4PvWDFUfmoSvSyPw
	yuM0z0tIxvN8Ss8DFcpQD9UUd+qY+2UIUjErgSBa79HxWM8rMXipgQzO88OaNlAEnNk/cVpaUSv
	Nx2GuITUZYsI2Z3dykpgXFJddZH/rQhd02eCEV
X-Received: by 2002:a17:902:ec8c:b0:2ae:4150:3125 with SMTP id d9443c01a7336-2ae82397833mr85238955ad.17.1773013030154;
        Sun, 08 Mar 2026 16:37:10 -0700 (PDT)
X-Received: by 2002:a17:902:ec8c:b0:2ae:4150:3125 with SMTP id d9443c01a7336-2ae82397833mr85238725ad.17.1773013029682;
        Sun, 08 Mar 2026 16:37:09 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:37:09 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 3/5] arm64: dts: qcom: glymur-crd: Add Embedded controller node
Date: Mon,  9 Mar 2026 05:06:44 +0530
Message-Id: <20260308233646.2318676-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2EwWcjpZoj6NHj5iXNYRu3u81_1J0xJE
X-Proofpoint-GUID: 2EwWcjpZoj6NHj5iXNYRu3u81_1J0xJE
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae0827 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=h-fhkJo0eXD2C244oGgA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOCBTYWx0ZWRfXwroFgDwaQXhN
 PJaoZBrR5qHJTPBJ/N0izr/kAbfJmO5sBg3PQpBTPsRejfyS6566MK9tMEOSDUWUsA/n8fBqby9
 i17hxjp1lJvP5HwKQ66gwcyagFdqulIYwBh97CHv0wdUoMbupReUP8+dkMUJgcQhR38ze4jJOVG
 /dd04MnuyNAGH6X+u67PbLcjA4fI+X+oJBNPjwpboZpaYADA4OJPs4oFeUMaH1IFB6KT1VgisgS
 kKIvNxUURdVpTIpKb2yJy5brppJJdbczY57yygaYtUALvJ/Hb/aznwMbfa+qBTku70ifcCtQVAf
 igeWr1SLLOS6Ofrgepir/6rsaL3+IEAfCmIT7ruee+S59ysBY4vrki+4j9w/nu/8XsCdP0VZQn8
 2F831Tb6DTfrBb56mEdwlSp2YBU90GthYjYuKRr02t2TJibuEp7WRkw56JAi/+EotIuCr9bGhbW
 PJz5Z+UTOhz3UmS+ldA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080218
X-Rspamd-Queue-Id: 6E1CA232BD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96097-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.76:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..94abef7f0f1f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -367,6 +367,22 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-nuvoton-ec", "qcom,hamoa-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -490,6 +506,12 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
-- 
2.34.1


