Return-Path: <linux-arm-msm+bounces-90178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OAvNFMHcmmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:17:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2465D94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1FA786C791F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF07243C04E;
	Thu, 22 Jan 2026 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXCFtWKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgAPMvA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92B407571
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079016; cv=none; b=d5zT+dP59lysuKH+f3ie9Q/L0DhYpXUMYbD/vmk7fL4Ekodx3QP2QP7XHLYUDts1f3hjTh1+SLIC8ctoZWwoBDSypg76N9gLk82gkJSWkyca5abhzyU+KCwxDkzrILrytO37Kw1HuMarKWm2OPJiz23YdE4MWXW5PI+yU6HgQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079016; c=relaxed/simple;
	bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWvojKczvAAB1dmmrrjzrX7KtSpFt1H+ULVwHA5qBsOhyXJ/cWHTeRRU2Krf8dxh3KlwwK0JizlDyJ7oNuVxJ2VJ+Ar4WXLL4nxJZCzvoof6tCtVvErekbl1FV/7R5sILv4FU2eT4JFbFHlET+H8xUoBlLj71GrXQgpOl9uWteE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXCFtWKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgAPMvA9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M5nOTI3902145
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=pXCFtWKStN+tJu7A
	slfXABaU/YsMvnGguwvei3HFptmC3STtQRjRQuArIpsmd71xtHvBIupXnvrDEhk/
	HMhyW10V9h3wfCpcQqgx0R2S35qM1i9UTiZlWSFIM596axDZown207KKE39Ouz5s
	znemym+CjIADeKUXiCvJk94/7uhiHaD2dtpcpG0x+ELAfeAm9Lwu1GxZIpBSOogR
	7HhOmno+IEyqC2UrMmKZ1KdhmYxhD8SAPbVANDLhebjdJxnGXgI64wJROYIHW+6B
	suXkBJNTTIg0ed7gt1AgUIb1d52GYWxS+H7VGBkwgOvoreIYeksJxBqaNH2T+LNc
	WXtJ/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khjhf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:50:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5014e3becdfso33541971cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079009; x=1769683809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=CgAPMvA932sYvrYekyMptjY1NumFE+wVn8q2oI+v30zCaGm/IqgQdKGNqZjD7lkkZi
         aV22NtlNepNrCw8ITJwYcexzaKlXnB+ltwxL47r7SoQPcpARcxjQN+Zw63K0jovFWoa5
         g+k7+tdMyKA1U9XG7ptR4YNtLnOz4jdqC4saAYdAqOK/XfZrcHtVHYabvvlIo3tboyYt
         /u3m0qh9P7Azn6u2YpKJlS7JP9ixEO56FUspmGHgVAuk2durUhgH2wJmD/TqzJFKSUk8
         OuBsn8rgCi89XyWybu9qbKh4MapQenH2vmDIkI138VwCCPx32pwumg2fNsh79sNvGXZO
         D4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079009; x=1769683809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=CiYSq3bI+P/8IRwpFdpOJ9+NBRlY2GB5oG44HbGP52RB+XIQ1UiyjCuREYxAL0kcwE
         YOTJY2sEhF8Q07j5kzbLJLACjMzi9zw6oSAW8QC0edxGik7zKlXn2QLmApIxB+LaGOyH
         1MO4z73eWLRU0yYigM/oNqUAEdCBww0l+I588C112WpOhkmnzUDiHPqa8+IaEIi8va7v
         GQi5lZeek289tSPC+oPiDwkKjlSLwcwvW8beGj/JeCMEiptREt1HNvUZiges9PupEfab
         ApuVlByD7CsIZNItgrARJdaKqdhXsFISQgi3YUqJnJbkEkAMsHRBfmB17ZmiYX3bM1GU
         jGAw==
X-Forwarded-Encrypted: i=1; AJvYcCUx0R3xBU13ev/Sb4cRYQXfSPtjCGShVv8r0cvp2r2Y2Jy59Apnh4863GRj+yPcK/Rism+8HNZhZXipKZOl@vger.kernel.org
X-Gm-Message-State: AOJu0YyoR/C94qUIuWgKj3q7ddiszRPwPBqlJWGv6/+x/APrJQ7VWNCR
	zKx0Bgy/bs45rJsBOejSprEGsR2HyTbu+1mS7D6WR0n0ckL6N9ORy0URLg0pJLu4NK0/M+venXY
	CHniABm2SEsWwWJx/yHAGhnhIg9Wlvt8SNqEQeoDotjyB4LrsDavRw+Dc1WzaIh2ouPzU3Ewqtv
	qWRak=
X-Gm-Gg: AZuq6aKmzkT+RbXYPzVCLiMIn+TvXqvQ5z+Cx4YzZP5p+SmXWRkZXb4oVTcbB75ddJC
	PGWm1Yg6gViA9On+NfKVZrMz2mVD+Zc1z5ewOa8gNrpZqHGwh+W2At4FWSuWxQcjEc8/QHQhsTp
	rN73ev2oZ+T7TlocmaHuhEMsQryKeWFglq3A17ZubF3IPn7K7eIhq2uNMQ9NmM4N8xx4GgpY5Ko
	BXngYWS+Ya+AGupAD6kqVqiHokP6o7jqHcImABZsjKW4ALQ0/Rv6kp7JFMJGZNOL3jZftHLo0vZ
	AosOlFNG7nmh1RmnfCEgEFJExO8NvRX0rUjlHJHSufL5+RsmehCmRzJoew+WZc3G0bxWzgmerhx
	UHMqDP1CiFlIqf5ps+fn7FiKkLgCk3hfWEglD2OKJ11xpt/4hfIqDtem8TktU0+8nUFhtsxj6q6
	UY
X-Received: by 2002:a05:622a:180e:b0:501:3c88:131 with SMTP id d75a77b69052e-502a1e05425mr286886821cf.22.1769079009368;
        Thu, 22 Jan 2026 02:50:09 -0800 (PST)
X-Received: by 2002:a05:622a:180e:b0:501:3c88:131 with SMTP id d75a77b69052e-502a1e05425mr286886531cf.22.1769079008952;
        Thu, 22 Jan 2026 02:50:08 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:50:08 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:55 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-4-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
 b=8b2oOOOPX2SdYaNULjliR8pcPHELaBMrn0YzW4Aoq5mhdvzr1KSJ9jHs5y541HZm1Mu/hUPLU
 0xawCuOjhDaDEslehWSigU9NBuW0C/AQjJkIfSeruRcugbj2FeHIBZz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3OCBTYWx0ZWRfXwFfDw+C4pBUc
 poDlc63knwz09Ca3i9+9+3NR3NJ0CdDwaI4jWC8kxw1+NquJACf7ZNiIO0MXc4zVW7yRDqkt28e
 45UACO21iRPec+kpm4nlMpYdVFT2H2h5vcbjCVXSngH8r+HhO5l3BHKbFDgg8WDXzKIVOz+rgp2
 ZCJHgqk+zdoIBdXxpXV2jwZj+sj3ohnAixQCkhyW2G9B7N/8eO1jI3SwcxVRVgTLu6LxPMabmSF
 bPCN5FinsfYPQWxBka5YSag3W9lNjmFSYwxa8jTlyyuMFr0SU0IuoRw9dY6fsMO5Jn/6z0wW1aR
 JJgiAyLPMKR+GzAAfAzEehJYxy47KAteYi0njr34m48/yj5m2QQ8oj4zXGBHzJWzEAHCPz0s1ye
 x5ughTkEFb4QEgLBUpQ5u5D/xscF47afJuzY2uuKK4JnJ/kHl6BT/7zEqxpqpebXkoaDU8qGe5y
 Nk3Cb1w9Sjs0oYJO4hQ==
X-Proofpoint-ORIG-GUID: bQxur1J-7_ODL8GwPXpxkQJpmGgKRrH_
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=697200e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bQxur1J-7_ODL8GwPXpxkQJpmGgKRrH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90178-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_PROHIBIT(0.00)[0.47.77.96:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79D2465D94
X-Rspamd-Action: no action

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6d28096e50546855bd762e479b66ed6214ec5d65..33897994d0ca8a193acfbc94a932551a09c712ce 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


