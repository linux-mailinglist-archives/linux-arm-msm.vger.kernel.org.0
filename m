Return-Path: <linux-arm-msm+bounces-107381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMfDJyqZBGqILwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:30:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD8B5362BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EE613008C19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23707481235;
	Wed, 13 May 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NugxWcVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTtVl+qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1369F47DD56
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686122; cv=none; b=GsFlS5rGG4Y4elWk5fIO7x1tetOc8RND59UH788IFaRmUkrJur7/0aV8Sv/MbzZPFWVybDu+f+qizOU3i6j728Pu2+IiUlAv5sZjq/PTqbAY2rl/FoOIZ3GCKn3vv+TU8wkxKRORvwf8Uvzj91uxz4OCRb0euqWrW84v6l//fvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686122; c=relaxed/simple;
	bh=Zet80yGH2Wsf7rssHrQxPFjARZlF0KRaDSyB904g8Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rN333dxMEOT2oFrBGOjaEcLqRaejMLMiyd7xe6dg5hmd+ERLL8XHBZLkoRdeZ9BHt4qWIqn90SpqWc4t01bqyM+jhSkwszWE+E+mopSmHxI1LbHOcUYcB9qAzNi+3wot40fz3t5FgcXUGRi8wJyXwH8BlyFk1oidIraB0J75Vgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NugxWcVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTtVl+qp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEiRFg4082484
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=; b=NugxWcVnbPC0SIzn
	jD5buxOhkIkG+XVwRsLyXqay5wcrGanDz85Q6clFz0r82jB+Wphm9XU9CbqvUJ8R
	ejeqQKBmbdZ2hmq1qu+X4yMjce0bsYYG/rq7BCPftggA47GnmyYtefj33/gdOb7B
	stbxsiagNbESjC9tq2udMGWmZEKqtuxwXwewIkzd1kEl3CqqIHLkHJ4uRzZa9xax
	nDU1miCehQv66Zmts+T1YdaaJp3N5CkveTe55KjyvGa6buhpDp+KyQFl4pNfdm3l
	TFzHkdgr6bZTyMx4HavY7fwqWmaSRwOwJ7JffNAClPfUjqOUewkTWJRTMps4ksRs
	sYeBuA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e1htq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:28:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c81086bf930so4879212a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686119; x=1779290919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
        b=TTtVl+qphNnrTS+kGPgu9wU3E4O9s2V8VnNWNahHi3s23K/9+ILNS0vMAlu1VuFysx
         wYlfiXSgbXqo5JNVzT5Q+apnOnUcK/7W4AdbHkyMWzsT73s3CFfyAI3WDAHYoEJ9U502
         Qa8hfeh2fYkbDiL2+YUYHBnYBoMWY15cp1IJdKkc8oGi2LgW5lVNGXmbCSaWB5qAK1iR
         mQ59yCgUm690ZtCEOaCdMOv3jFEyl/U59MkNZLeM7y9k4mNz1poQioOd3gY2dBQG2Yw1
         X4Il+FGIJdkNySBowmFBpcNH6xaH1OEwnaIe0HzL4K6jtD0/jbloPAGl3vFAcRStJow8
         QX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686119; x=1779290919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
        b=IpINJ6QCZE+OARHefUDL8ssSZQPaXw1lOuW7V+7TH7Su/GqJFfjvYVbY0W49uIxGFf
         em1ddpR477Rv/px3TQ6hc8jxfjbFn9z3m7W/jgkHs7y7tcuD96Gn14p/zOILvI24be38
         xcOtZs0q+N9PITgZ87O+1fWDuDY9ZWxuhSPKGglhcp/UZnnymX15RotHSaYaQAIz91f9
         QAoteocqD880f5xxXhQi7r2ypS7ytEk/SZK2pV//WPcpWw3L72PR+bP2EWi2k8lb+1xZ
         q5HzVBwsfIMyd1W1iEJOIMujvY4yuu0H9WZF5a27XL5lJ8ReP6Vc/nOXR+oFGf1RiMbc
         +kIw==
X-Forwarded-Encrypted: i=1; AFNElJ89ZCNDGExx1/4/JfHzLrRUNr7rYCsAy+HqVuWWOe1p6ZxdNi+vDKUTc+aKM9MokNHEkselrP9BW/JCjdSQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKC3NlGaQXfinluDMCIYdTCjAFuo8tX5MyIXJu7m+JCR1/vCzD
	8tN7Yn6pCRO+eLHOpk1n/KXMV94pHdZH4jPZYJGf/o6qiWH4bM7+mqucjlf2MFLJ2BNEs40DJaj
	C5DfehtzKkVdgs5BH8EHsFBk6NzE9NbRGJNb//3r9NwQD/qAeyvfeMqS40YBD3EvyGL17
X-Gm-Gg: Acq92OG+yMdRUE5uVPyIf85f741EOAxB9N+xHu7xJjrPrrInyg/jh1syb7aRdEPC7Hm
	0LDsf3SyhF61ZyxohPurm/QuTiChIz6yQOhxM3dg77+tsr/rGTnx6O3qS/OS2m0+CkiogQ5UmiU
	WX1p/lgjAIh5Xu7lbW9IHAEFcR9Hx4em21qpc/u5NlvaBEkH5iCFAEp86YUtd2PSldYi8QaIjyP
	DVWQyBiM1JWzUGW5f2vBJptq/URzi7X0FMSHQKDlfCj5yx9YBP2JdZnzqrMr2PFiW3WpXo8kSfI
	TICpD4ClN09Lz28n0MiUCihfFvtIS31F597t1xya/bXC/SJRXShMdZEYhrre/66FByrT497k98N
	CxsCQD2KYZ43SL0xkaawC7lXoeO4cp6O4jYikDWJoAkwsuA==
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id d9443c01a7336-2bcfd379c0amr80738245ad.15.1778686118545;
        Wed, 13 May 2026 08:28:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id d9443c01a7336-2bcfd379c0amr80737665ad.15.1778686117892;
        Wed, 13 May 2026 08:28:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:28:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:42 +0530
Subject: [PATCH v4 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-7-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 8BAzKT3pYzt-uG3-SM7XcD9lY8_90sFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX2y8U/wdzz/ax
 1D6cKAJa6KLnodWBtI/TO58bfdKhhJWwPRV8cPIjuRblxynMhiQe1VtxzEASmzCg6NT0uwA2Cwj
 d4hRLJkAvAQ+ly8TYPYBU43/1cRhGlvCqYZlSwBDu1cpU42/16SDc9AYiXC/mbxIMityF2suFe9
 R+I0WASWmjQCvc8mv6urpvbhV2QW/SyZM5qWxPjcc7MpjQpZOU59HQK00rKyPfBHDiiJLPkjoXM
 axCk6KOie/ln+CwOMlgduMKkpg6f73PlIWmloXZswEoJLnkqTA7EtqyvVSCh7Eb9jcfJyJuoXys
 lP8Az/50XhbSqdLsqE8u0pAA3SWlR9D2Phw1bAo5+3k1Nl7o6MO9lpipJTrQEh6NJDgpvPTn6dX
 7Vbk2TMltu1L3E+Huv+48b68ordFa947AuW37xMF/yfJ7uk05OTkrzve0VFIsEydlKVYTSyGz81
 2u0ZMQwrXHtEDIQ6gPw==
X-Proofpoint-GUID: 8BAzKT3pYzt-uG3-SM7XcD9lY8_90sFa
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a0498a7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-Rspamd-Queue-Id: 3BD8B5362BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107381-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1fbf000:email,0.26.219.0:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..1a47eb2a865717dde3fa0ff82665eecc8ffb87e2 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3,8 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -709,6 +713,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +878,23 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +916,32 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1


