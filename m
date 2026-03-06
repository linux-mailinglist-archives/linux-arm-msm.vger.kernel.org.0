Return-Path: <linux-arm-msm+bounces-95731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNhkILSUqmkkUAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:47:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 098E621D51F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6736930C4414
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F653793D9;
	Fri,  6 Mar 2026 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOW631vU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaiMbg7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E805037B413
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786691; cv=none; b=U0l/4ALvF38V9Mb3cTu4wlf/YJ7nGhzMhzLQBGj7ZlbHDBd6adaVmSAfq7va8MnxN2bApmKWc36yeKCy6tuBzo7V21a/0uwKlNdl5i3arJGreAttkrBqJpRxWFslaURX6JZkY8Oj4M/5ze27kdpmqHU7OF4lmAfkQViiTUjTZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786691; c=relaxed/simple;
	bh=Zg9lmcifY79a8Un6AZk/xfMz8WdGCWi9sZcIyDdPApw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjK/1ytEcASTqGD01Mrb4zv9CjTMnKXWuZ3Z1sBUOUZaj2LHuazuhsDNp7PuosJVzhP7KYPI1XHFUdN74TlI6p1beAJ+98oicUUnsddjzsREoZJRAUP65emPQ/gYqosi49SXKWJSYzCmbQRSxb/kCtNSZY0D45RpUQiKd/S4aPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOW631vU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaiMbg7L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aWWA2483249
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 08:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=; b=gOW631vU2tJ1433B
	F9WOYLc7th/1eP+Me70Px5OTtSkqVWoA6mSYasF8pvqtDYuouLzzn8Z04gdxv+Uw
	DfHaNK4qkFX2oBBmsNxuoNBmEFGzbGl1hIOFqh8lqBgEg3XRsl3W8xg2rQPcxQJ0
	Xi/zi/zyVCUVdtrb5JEhNro81Sql846noRonNp7IajnceTFCaoUeNTJ3wgYe5ztx
	NqmgYkS+qykru+jJT0mLrhgAGVngeiaXqxRvlhM2EdYgBLMVLtyLKcjEJ7b2Af6/
	Upno8c8J3lWPAkTHuNuYWOBbXS2mK0GVgCqVyrBkoQY/LERJiZ0RO5jx+QlEIFcN
	Lx7qPA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wbxhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:44:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso31559581a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 00:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786688; x=1773391488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=;
        b=VaiMbg7L+rHykaVa2IfYlcg3dn+myoVbBlhhwb4c16WPXwKFOrBCM8KHCSR6b1lFkT
         tRVpJYllZKMEHpPak0DWE95B7ecZCIPkbU9z2t/wCfyEgFa0WcXb2DA8UpXDdP8CQQ2A
         siMY1BS2VzclrK5JiZso101oxcffpWYaC8YCKcBAYRXKtdwOjYy97/taJGnhAsIem5G2
         LHWzkHEX9LMvcF+J56nrwsDbU5wi3IvBSER5fdaHQyLquHcQDsjLJekEemZeK5jxhMzy
         CxT7Nq25YAWiKqe2eDLPEl1B+Y7tts0rIWcz52STbmiXq2mVEpR1t8mvISzkCu3EHFQ/
         No7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786688; x=1773391488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=;
        b=iQkobmvAxJjwAVtL1ob0Z928ZgcyMRPpPLYWV8AR5fhUUIS473/HIeocl08D4DhH//
         /byWnj8uXl8On6byUd4hhylGs1gJhRS5So/UfXzCBNV94IX5bc/W8QPrqlozO7ieMt35
         yxtEZQTS7rA9Qu2GI7o9R7K5NM4y+3TGCj9CMeW+5tDN61g5IZPuvWfq5RT8QsoGvkdf
         00cDLMsSbEEEI61oAN+heR7084q6KNZeLDGwgAdLRMPEZ0KAl72Pj63X3F3ZQD82Wrqe
         9mvZkKu15AyGvhGBVBU+PvB9/eT05WNLCboDrh0ogpULPBIRzsXU21H4coXgazvO6Tgo
         jp0g==
X-Forwarded-Encrypted: i=1; AJvYcCVuC2Ycn+IeKW4BNDFuwA2GeSScBws+sbevFVlqjpJkRYF/t/zPpDBQtdF0ctZlwXk7Saoaqb609KWMmAKh@vger.kernel.org
X-Gm-Message-State: AOJu0Yym5zLMivgUltN2aPMUyysQu/NFw1bpf6+x6leM2OV+vcxGHCsH
	m/1cZlDdMg7w0GlhI7Pd6D/q9QNTt8WjNcHCGMYhElIkf4AXOSJBjK/8ZHHo7lpkkxXkxKmHX0B
	X46e0gqqP5NL7+c9G/i6mjOKHtdFhun/WWF/WFt3bozFPQ0u4xCHjpCv+9b7SoLyQPUZO
X-Gm-Gg: ATEYQzzhVCxjqCueg375sG3H8YxxmlI7GPyqAvBkFk0B+iQ6yEphCPILgTKHoFkJpUB
	zJPTKeL11WMXBQ4SkvjSahqzu6xj7hOdst/FeXvEORJmEyQbtZGDUH+kp/9MeOpO/IhmMQOqv97
	te1mqLD7FYWnd808RkHu+IC3NOfrfAq7Yu5rR15l/GT+pT2ZUOgCr/GofNew6RniqpFCPpmJhmD
	9DoqjNydbj9fk4spCd5JwqqTG2GQzT4H4nA9FCMPLzu9oDQzOVTSHmX7TJB6tndKKBvVS2ToYEx
	KgcoKq6o1nWnC2cBOH5dhP700wcyGaGXTeBVsZmKSb6w/HLNCQbZUEWTw+Jb8cy3siM36EyvUn9
	qyBmwNNXiXleY8ctSWw9RrHWnz3BsCxCu3rtZicEb8QlzQlXoJfXV6fqTt8KOjS0Z57Tx/SfPDP
	OKtKU7ltwcIX6CtW1Y1QA0
X-Received: by 2002:a05:6a00:7483:b0:829:710d:a46b with SMTP id d2e1a72fcca58-829a2f7b48emr1186687b3a.41.1772786687859;
        Fri, 06 Mar 2026 00:44:47 -0800 (PST)
X-Received: by 2002:a05:6a00:7483:b0:829:710d:a46b with SMTP id d2e1a72fcca58-829a2f7b48emr1186659b3a.41.1772786687249;
        Fri, 06 Mar 2026 00:44:47 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636c74sm1393573b3a.12.2026.03.06.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:44:46 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:44:30 +0800
Subject: [PATCH v2 2/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-enable_iris_on_purwa-v2-2-75fa80a0a9e3@oss.qualcomm.com>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
In-Reply-To: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772786674; l=2376;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Zg9lmcifY79a8Un6AZk/xfMz8WdGCWi9sZcIyDdPApw=;
 b=0zQDnxv6QtoP/rZIQFUZlKVUWWFDx1aFsHudgAEKJfPqZVakmGjs1phqgj4EiYRgBhp3LNdqO
 gbfGH2rX8J2AjTSQLrUqBCEPmPM5KqHv2PkQ4W0pysedsynZJS/U+4q
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 1mB90uolEuo5AJxje8BPYUhkDUu1q6it
X-Proofpoint-GUID: 1mB90uolEuo5AJxje8BPYUhkDUu1q6it
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfXzcoRP/BcY2yo
 CQd16tZKeoRmYwEY2DZI3tP4VfqQlbLUVlYWAQwBIbDBSTk9aWp9/c1zQnNzBJIbs5lXEh7UWzy
 icHql7oDcKWyEWmJVSZMkpWhybvu70ppBv09Zidb3S4jZd8pvkPTbRNekCwF2LFk9tZlveNofds
 rDYUHMm34skUGUWrcJkNxz5gMLogwdIcRbFGmJgen/83AxDvzegUVyJh47zsJeu/iMgFgA/WZTr
 0DayIsAQV6d7Eh/lx0iH/mnWe/CcESe/j5i1xj2c3eCgfiWBDhJ/4zVYHbBL72obGpS1LLERPrF
 Qu3nBtVgh1zN1WEbHpDaHkCEs7Uac1tfkMH9PFeVaCQBBXdqeBQmPtD8EM9K+Zl/5o8/AFsFh+n
 lYMYFQPiNlAZt+O3AvphCBP11/vEXxzZbLFGDLgBHTYakK+qrWQf7OGHBCGYbajRQbz3DNc6zsl
 95V8Sf1onE+c2Zfz9mg==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69aa9400 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: 098E621D51F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-95731-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 53 +++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 46ffe5353f3d2fe20e70fa8373c2591863708c61..9db77fc734021ae2986ec6a231b1f6f5461e6688 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -153,6 +153,59 @@ &gpucc {
 	compatible = "qcom,x1p42100-gpucc";
 };
 
+&iris {
+	/delete-node/ opp-table;
+};
+
+&iris {
+	compatible = "qcom,x1p42100-iris";
+
+	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
+	clock-names = "iface",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec0_bse";
+
+	operating-points-v2 = <&iris_opp_table_x1p42100>;
+
+	iris_opp_table_x1p42100: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-210000000 {
+			opp-hz = /bits/ 64 <210000000 105000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000 150000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-335000000 {
+			opp-hz = /bits/ 64 <335000000 167500000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-424000000 {
+			opp-hz = /bits/ 64 <424000000 212000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000 250000000>;
+			required-opps = <&rpmhpd_opp_turbo>,
+					<&rpmhpd_opp_turbo>;
+		};
+	};
+};
+
 /* PCIe3 has half the lanes compared to X1E80100 */
 &pcie3 {
 	num-lanes = <4>;

-- 
2.43.0


