Return-Path: <linux-arm-msm+bounces-105139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEyzJxa48WngjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:49:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07803490BF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 782413022969
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 07:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE113A8743;
	Wed, 29 Apr 2026 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qo4y2uid";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsPAv+kM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAF53A9622
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448670; cv=none; b=XXRZWQr+QIcqZ0LDd5dxZ7ejFYoDQ2NacJ4rBl+qCWHrZbZCfs5B5zloUZyFXpC8Zrzs/pw1XZjG9fbnGkm0QGRqCcEi30plql6mP+5k+BR9SsC9dTNsfsq057anwn/kq9aWhZXPI8s+zAK4k4I1JgqIDf9dSJNi7MdAS15Hd/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448670; c=relaxed/simple;
	bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RqAckBysF4sc8oWW9p5Jt2VeYYUr6YH/a/gG6/XWGg83azXt0KmWyJ4y4ukpEekMAc0A8G+r1QE+tUYobqjaylMyi08pTDrLg80BQOm9QaaXq++29CAyfVAAn05uZ8BcowF/Jhjh92HB3MjGMSpREXXzaGCrcG7932dsv/xbLbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qo4y2uid; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsPAv+kM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5WLEc3347492
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=; b=Qo4y2uido7q0bZW2
	TyM6/RxjkDFPIu0ZWCmqDZGXwX3/zdBElRiMvydEci03HIkGkYeH0XyEbQd/JcUI
	HF2U7K6PYWnUUm3/ZnPS2BAZBzDu1PhQ6zyOEnjnli5mL24O4qIdf+d/21F6WS0w
	eo5aO57Im5AhVYmeUslKQcFhm7nSZI2Cv1dcGNOcnBFRm8r33W22x4ahITHS9ROm
	QhI5lM9qcH1gNxBdUUdHH/zPgIb3GPh0ik94lajGpSEZNKcRKijh3PAbVgUTJW/Y
	eYtG2U/oLC3XzCIqJtFGF7B3PrgV/jPVzfryi+CCArSB9Ne8UeTN136eMx7oxXS9
	9EKW1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4t91n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so27525487a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448667; x=1778053467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=LsPAv+kMXyJPyqio2AgwRS25XqWpau8iZ9CSKQzIPtrK2a13GeCDIHl9qgwBxzHMOs
         NwQz7PoLEj8UrU52uWTEwfqO9UNyfT+4uW5snIeOcwaD3oMeeapk919qsfRplwMki66C
         su+tPFsxKMJhHyxtiJ+o0yDsXzA2TpcSGhwOs8mTQ0p2XJGZuObGx9Sjg4hR5fo32K5R
         oWv/UsBxmzappTvB4ddjhB5EJHF+RCJ9UuZ1dHLVztFbxx5DpnJPUvPn0wgxiFW1+8oZ
         q6h1KghC2ubRbqlUqb7IH5xxCL2QOUBTzw+CGuiylcHN5gcpIPHUl7ClZafMr/4VVta0
         wLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448667; x=1778053467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=kJj9oothvFpasYuppwgMhgbPL7p46KxsXfU4XBiRky1Y4/8bFybDvoIG+ptFJ2zEa9
         bYBYs9eKNlHLoMsAREhm5Fj6lCIQR+N/MrGqz48nePPcNz1+XAxjToS7FNcvsOaYTThN
         bpXSLMz61qxyQn5O6Y6YcMO7VX5wBnEUDSVUSzRmlMqOnFVxAvoPgPW7y/ptB9uXgFpD
         fhwC72XAsdhUtozodiFJoyQx2o/rKcxEHhhzuKKaF7W3rnrT1fkfaVKb7ZdmpPjGtWVY
         gsBw+s9352JkCalJsa47U+eHUqXgKaNV9RlP6V5NIJHsrC/KTzIFwpxVBpTVrpDAF1dA
         xfZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vURhoKcvKfPOgmHZgasiCIeQ8MTw7gLv1ONWtN5FA+sVtZuWrJw9leAihkGGyviHPtgkRrGPorz+oz8ej@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqZsNc/XHKsHpltTUvI6fZ/2+YPy1tsw6OWwo7dokYG12dNN5
	sEpat867ePm1Lk/m+nvZi6XjLD9m93vT1wn7UfDIdAsrQ+t3fjDQwVldmOQiaR6Ns72ZNEL9KWg
	cWIRe1yC8AXj8llzm9arrBjwKlFyoZaGFt3EOUIiXbWFe0poiL4pGEObqoSm/h/q5QvDs
X-Gm-Gg: AeBDievbMNuRxlHpfAqNTQc2oLgee4+GJchNChA8DUQYxc1tiqC2PXx2dC5jXrcSDdp
	Avsz6eK0W/OdVvzUe/vx0fjaD1ZlnxsSr72InmwlDtpOL0X3RIIMMrCxKIMbanERBM3TXscDE1J
	u5GwOlSFZDOzJcou3ue5p4zabc45TTCllBKxNWLOn7Aq/KBhRWOnz2WEQ95c2gi7dkSl4d7rYp3
	tRQPS5msr5+tea7E3qy5RANKE8x8/UYCTdAPfc4mGSbgmnEIFydVUMML08pX0gxYsxLibSZyUw0
	3B9dY/olzgjoV8iu5vMWb5cSxtCW2ZLHFPL+kk0D4CBZUYTZ9T2nsEXhTPM+yIR34DuDbz3rw0U
	PEK7jOsAdAacPwDL62TDCnzLPwjQaW9dOjDfB93PaWYZrqOAIB0LfeSVyw0M3vrM=
X-Received: by 2002:a05:6a21:3399:b0:39f:8aaa:face with SMTP id adf61e73a8af0-3a39c10bc91mr7560441637.1.1777448666951;
        Wed, 29 Apr 2026 00:44:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3399:b0:39f:8aaa:face with SMTP id adf61e73a8af0-3a39c10bc91mr7560413637.1.1777448666535;
        Wed, 29 Apr 2026 00:44:26 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:26 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:55 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-4-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
 b=Gp/4tUPyrhtJpBSK4LylQlefwHoKOEOZvpOij9A5nugDN0RxixBEu0wfAiqYlDEYqYyvYTduN
 Hk3kFShz/5zC9i7SM28NrI7ktDvo0FDDp/4uk1QhcSWaySIhq1y5XB6
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfX17Vp2lx9fqcJ
 YnYeLELbjMdAAV+qJ2MYv9WjFrWSj75VPXlR3RjfS6oeH/dS5iTMa4Q3uwEUFgjdTxQuUS7HAfa
 80y/D4u0I0CfTt4k/GfQBN5TYvdJF+AexpvmuYdhwtIZREfkgap5eukRjWKCFcL2Nw+VZVE5A1P
 F4n7f1c+wD+gIrQHNG5w3xRFsdulHWBadY+T2sAljevABD8FmdNYthuUXPMi6Xu4gdtJ8DGw4ZM
 QZGAL/rsCbovpTZXBP/+u2RSDVxLd9jIfKkc5H4lcwomgekwRhgHeeeH15zgSEEdU0Jo4v7Eujc
 X0ylozetQjaqJqOEfbqKgiOn2YG35Em8mH+saWkfoGp3/ebG0rMPnWUu16ZYgrt6G9wGLX+I4Id
 SC1X9TANEhU1myVQdJBeRJ77rykuFJ1tVvYw2Gth/i+gDvfdZTQ02KvhG5/IfII+nn05IEvuaG1
 8/Lo7cgVSZvEPO1S/gg==
X-Proofpoint-GUID: iUJEolEn_Iy6JYXXt0fEFFbtkUCk1CEX
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f1b6db cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iUJEolEn_Iy6JYXXt0fEFFbtkUCk1CEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290075
X-Rspamd-Queue-Id: 07803490BF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-105139-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index ea65b8448836ead83f837e973ed536e8ea0ed8ef..a503deec97d75dcfb6792b007e0b74e517404cfc 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -21,6 +21,7 @@
 /delete-node/ &cpu_pd11;
 /delete-node/ &gpu_opp_table;
 /delete-node/ &gpu_speed_bin;
+/delete-node/ &iris_opp_table;
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_aoss3;
 /delete-node/ &thermal_cpu2_0_btm;
@@ -167,6 +168,55 @@ &gpucc {
 	compatible = "qcom,x1p42100-gpucc";
 };
 
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
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000 150000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-335000000 {
+			opp-hz = /bits/ 64 <335000000 167500000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-424000000 {
+			opp-hz = /bits/ 64 <424000000 212000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000 250000000>;
+			required-opps = <&rpmhpd_opp_svs>,
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


