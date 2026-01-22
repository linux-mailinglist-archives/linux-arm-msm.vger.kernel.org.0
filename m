Return-Path: <linux-arm-msm+bounces-90170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP+eJUcCcmmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:56:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD8765921
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 716D98A59DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E89A4266BA;
	Thu, 22 Jan 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozmmkC5M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvmjGJGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B2E4266A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078494; cv=none; b=tXiRMoucpqyo9SUKh8tT3UfTeryRreLk44LxtL//Yn7kicnxU7zOyqGOrBPk6tdlwa8icZcjkOoLFswxrEwntuNxzk5P/VEZsldT4v01AKEW8AuEFnI/pnle+zRHnX40qfS4w0KOf7ICl49HtWnwoAzH8KM3kTEjdAMICz8zGTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078494; c=relaxed/simple;
	bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLSD1IgkaC72cDne15/fGyPjYsrUcNL3dbN1ZaUBP5g1rRqlJ7WEptCaVbJEhU3D0efjivMXBz9/UTMr0FaTbxMD7ZQTALvRjjfrAAby2UHjJc2BC4Q6j4bt3fQiQvm6WGPbQJjZ74r9sM/IYZBnR52JQy5w5/XUD4HLLVU78BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozmmkC5M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvmjGJGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7uGYp2283415
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=ozmmkC5M/tEUYKvr
	pj9eip0gDDbkOzEihU0UoWRYue/7bH4BfLspEeEb2Faz9QoSWG2rUnXEbK1tMHCg
	ngMz0I4dBEbbLPOaQmzfmuiKd0CYyuH5bEi6jaujxL5bRPaO91Q+wuhL/AZsETGE
	0VAM3FYflM8XoaKQGNMbPRKLyTH4UPCMyt0BYVULynl4x8kuaR7fWWUmsfEBLcLR
	3G6rtPFUidYu5iNdyJcgD2QHCKR2Yepkh3I2b1uy20cJL9m+9cGU2hlPf+RBuVrw
	IpiFLxuTrTw21si6OQGXkFjhzFqCMtiRjxZA6tE+W0fAhuhfxw4pVqC9LyLwdI/v
	wS/SXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fasyv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a289856eso543534785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078487; x=1769683287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=SvmjGJGP8Gr3VUjmsIRLFWmWvtmFkT+NtIJMu43g4iC6G3U+FJz24uv8UFr4Z9t2my
         X2H+Yl1weT195eosflxvCAK7iBuGOgKvhd/46pbSN5OE288/MGu2PC/0SBV1TkjDzo3E
         iMtZGM6/ZLpjgv7xOU9kIvaWmeKApJc41wep6LVoLAX8VkzG01qtCtJvGSI5uTVtjAS6
         26EWyr/VLcPLd0Ez3eTly7wWV4L9b3bP+RqGQg693M3era8hOXGXZvMoPPcKjfjR5bmJ
         PTZOdLNSUADqlAZaZRYKaJLU482MrJLRpAxe1vwZqgcWSIYBoX5VomUCTbkNT/k+EZUY
         JsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078487; x=1769683287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=KmbxPs6HUfVy/nTS3XVi2A70q2wk0j8pfsc2Ngh88I4gfrtmc1Lz00I8lhKUjwYMnu
         K8IwglWs7rqDF4dy1d61yIPcpVO+doXqG0/WOpaHc94aUVi8rQQEGribwyarYDsPHI9R
         mS8iq4/mK0dDvkfJ4EQvQ8mUGk1o/qi1aYkmwBFmMKjrVgiJa1CSXih4D5EW9cLxpAkD
         k/Lp4B/5EajJXZmzlHSZ2SQ3xlvoUFmKHopET+71rY9pMc9iQYcqmC8VlsN7MT5V6vqa
         lytiMR4ilEz3ep6LTKrpS08qSZnrNQ3/rxhBSDhjW19+aKHHjG6dcOHN6xgjVkZBdNnp
         unVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2JzWufDqeg9TTu0OUqC2szed2A9/whE226aOyg4BCspnVbfVJyA9ahpyH2U+PpJW9XkcMUjeKZ8TT/iqn@vger.kernel.org
X-Gm-Message-State: AOJu0YzAr1ZNnuggDLMlValRE1uow0/AbbRqzBDUMqb7aECHZx4lGee3
	Km9aCVI/15Rv+9P27M9P8x/JyQEfj9UB9ZP52je2khCgZP4yUZIpC7H7VCgHQcNX/uRfMps2iHu
	F2EgVMQsEoqJtTGMnEXN6N2UVtGCSBlLLXk5zkcM2IFuKzSt3O8nEV18nWEzsoU4LF62v
X-Gm-Gg: AZuq6aLsyY9Bra4k9PK+bvF0VWTXtJWoBlXRNNJCsXBKRqHpE5K4yOhCUrGajxak0h9
	wI5F/T9MQdCwh/oxqr/hytw3eNQnYkGF6OGsJeK96kt+PltJStUxxSZ0OQOljZWorDMCXenKlq/
	bTe0rtqCwKRtXbC8KAO/agkKPtr55LWqjrLyfP7B2s28tts60EuYPghsRSU8Jnf2JGKaCRuBZej
	R22kqokE0Tk/mBTJtnygu5UtIGQom33fpJORUGJKsSdep2n1Zl/2WBPC1DdTC1YsvRKEjW/pblo
	X6FPW14x/5e3L8VtNyoxV6RmWiStuKhMXKm92QG2ciLekAYRzbxb9VOeHwHdNev6kjpgVpoQBrR
	2W8489cNdHL7JJdbqn1zewkBuyGsVAEyPAFgXmFTG01xKqOKVgb8NB1sSGhcd0tuczuf5rYJGAh
	qe
X-Received: by 2002:a05:620a:4113:b0:8c6:a5c8:fb39 with SMTP id af79cd13be357-8c6da87eee2mr272141485a.1.1769078487581;
        Thu, 22 Jan 2026 02:41:27 -0800 (PST)
X-Received: by 2002:a05:620a:4113:b0:8c6:a5c8:fb39 with SMTP id af79cd13be357-8c6da87eee2mr272138685a.1.1769078487163;
        Thu, 22 Jan 2026 02:41:27 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:48 +0800
Subject: [PATCH v4 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-3-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
 b=t1vTSMWGXPTYqrQxSeJNFQegnAyafTbIj4gd43njXHFo0Sc5yhyBYN9CUxe6ejwaAaXhH0Z8P
 vNxm/R4ARtgCsjYeWoQfBsvr9wAP1l0UyFu+kWQ0/YQRcXsGVs+db4L
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=6971fedb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX2u7I46fMW+ZW
 2Z24hLngUa2kJyWdH5o05L5FWEO5txCkt0kQp1MGMKhNkd5P98giKCAcwmqtu86xQCRTDolgSX3
 LBkGJ0McjU8AOK2wmXBGi7zk8nG8ydMz/++1KsnMYZKEwft3QZZsHIqF2MuBE3w1micU1X1U/tG
 FUmfdA/rVbZoK6SnwOEevobyCFPdo122S1THgohydO8RCFA6LHJ3pb19rpJqblnJll/JnrNldlG
 63t4grKSlTssyQuTNnwF6vCWNA57hKiW6HE7q4e06Bp4e2pY8RsfFzejlD5VZrhp09NkmqgGYH6
 C+25JgaEAdxw5BkPUieTMM9ZQsIAxkAw0d+BOi56jqWGzocLp9yRnF32hC4KbpIsjW9gczs1z4T
 t+0tfr+ooRZuRPTqlOk3Hki4WpHVCGxI9paNRk+UnARGMat4bD6phgMfcPuBey2LuTNKvd8vYyp
 fR/u/0/LNp0j3bl/Taw==
X-Proofpoint-ORIG-GUID: 4RyvRVp8RenSAft3XlLARk9bMplPRPuy
X-Proofpoint-GUID: 4RyvRVp8RenSAft3XlLARk9bMplPRPuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90170-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.47.77.96:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,acb3000:email,ac4a000:email,linaro.org:email,0.0.0.1:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,ab00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FD8765921
X-Rspamd-Action: no action

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 3e1d85b6eacb90b48496ddfee2db27c586f3331e..6d28096e50546855bd762e479b66ed6214ec5d65 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3789,6 +3805,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


