Return-Path: <linux-arm-msm+bounces-91116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHGzFy7+emmHAQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:29:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B0EAC36A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C76302769A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C683793B0;
	Thu, 29 Jan 2026 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3Uz0yjq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxoeWhwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CD73793BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769668120; cv=none; b=t4ORn5tbT4H6OUFRe3QsnQIB00Op0hXGCgvfvC/9fL4f8Oe9bkZmJaS1Y4EpxLvlKZ9N2SrNm7lPXJ/e5jOG+Aid3Xjq5iewoE6ns2ROkQfZVi+OY4Twou1+LijZ53GTpYci5iZSff+7Bn8RPhAPZJ2fVn4uCLO0ZJWpWauI/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769668120; c=relaxed/simple;
	bh=aLJjSUbH0Z5d3XeAtoxuuuZB8VU98Cz3pGYlO9Duy0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iYywGER3i+3yWd/3Ue5p1Ex+X1WXMTCpM5nMMB7o59tvtVUXrvnehe2+1i9MNtyNImhb9qVn9n9KOscWg03kg+KjH8s5dNin3m2ixxL7NdnycjIyj5AtbWwKu6+CoyoEIbQX2dV2Crsje3gBsw7cjQ0aLZG7qwjQtJHQgMfkUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3Uz0yjq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxoeWhwq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2p1K21565330
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UdiCLGNGfy8
	TJ+qlMFeorIAspGGS3PemGaukF9zDOf8=; b=m3Uz0yjqeeVA+L5mpUVxdGVHPKU
	EZgZvnpAalWBuSAwp8luipChVQtj99nG3CAn5wyVbqIeh9oOPMS1ECpkEfxyexnB
	Gjcsb9FKpBijKURAz2V91Vi2o/PTCOPpMFikeSwc/IRFINvc7KAg80NrZ1CauwkT
	rhAz6/+ECw5CXWGYsfHh4Fap2Qg45zAKa9WlHLcPfuJfby8RsoGALD6XF0Xcrej6
	7UG4+NMrp8beWthzazpVt1XyflHYdDphiMxRMgCweGYZpQkJ/EWQQ+0SBYuNN+hE
	w5FiijjqcygRNbDHOpqyiQxWZIne8wYcYr3P9jSWc9DDM9k6TvKLQ3sivBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byusfh4fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c213419f5so630555a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769668117; x=1770272917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdiCLGNGfy8TJ+qlMFeorIAspGGS3PemGaukF9zDOf8=;
        b=gxoeWhwq8cVKBXklPwzTus6bIgyDrgvd/eG2V91XqXHtO77kRP+frfcIxjWZL1YywQ
         bS4AHyhYStwTojOE3pejBxWZdR51HJkH3er6y8e+vw6isW8Rc8KSTSrS5d5YSxh0hgo4
         lMS2nwBhbilJNUNCfsWEID1thRx1lcCEO5sSAxFp5TvfWNOrt13/pGvEU1Ha/jwhdBH2
         3Y1G3gVO76pOPGs1sit4Mzyb6y+Wj8UGyjF/LF4cpmonVLMOjl8GrdHDzUiGN1l2uOel
         R8BrenqDWMWUcOcOgcBbYKQlRg8oovosHcX9GN+1TMQ5Djk6zfK87ECj35seRyQIiJrp
         g8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668117; x=1770272917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UdiCLGNGfy8TJ+qlMFeorIAspGGS3PemGaukF9zDOf8=;
        b=f6eBTcMwvCVkIAM47xJHwkOOMC026r9ymwMSltCFfFXJV/nTDIcmstAlCe66ChL7m9
         1nUIpTnlc/+qs2O4m+uYx44CbmfgfAEGC15IQtgvNcYjhsO5hpm0hlhdb76JwR31phh3
         YRz0C8SwIi7XdviYlQBqv3Gjj2eMjPPhH5sf2IbfzkZq5ui2TkoSycvCg9Uh46iwy7pO
         FOsYlh9qwgOzMF4ZrPDW1LH/PxJfWjYmKjATz/ClxAj50Gy7i9gw8MPIIIIkk3ktAieA
         7gkingCiYOcv3z8OPw1MFcqVPogF9SoiHg/0v1W2JQmtQwS2B7ru/2tKs3rHjH3n0i7G
         B0vw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Sz+PHV0Uq0WIMxff7LFcJ82U2v8tWFFd3ctOmjXks0GOvZVLwiPGyt+IWkLpirO+ZU0h+d+UwpxzUDGm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhg/XSpunNzADjklbNFp3TdrwCOvhh7Ma/R0JC/s+ZdH4Keekn
	oSdlVy/AQ8Ix/3BL1bPnwSDTN4QUoxcP8l2Mp/UCSxKZdDMBRJREyXlg57Ie0V1+IuAq/wGBHMY
	M+G2kP3h+SqyDTSkU16H6DyXgi+304rU4KIsVomqGmBqZ6THRdc9nx0cAcIueysBMv+8V
X-Gm-Gg: AZuq6aINL+LMVKFr3JHD0PkGpyg+UnDzQbslGmk1qlQbOBuL+RyCDzKI7FYP40DQNTu
	3cq1hVmLfIXgnJB6qqKw89jA3WntmLRmzTHyjB2CE7FQMmUNwi8tjSEmg/dNoqgHOogNzS8RHpa
	q0YtV7kqSzOvORoeSwHBO0tetPRhhT8mPndLBCL+WsMB5OxBI0HQMH2UdWg494Ctskh0AP1ZK5U
	gwtZQx6Ua/CAuck6w3WQmRBgeJNDFm2W+auh6rfr6wm7lD+KNri/Ynal7vLRpXvkIJ4svTlE5lx
	lMkoPUe0tuyVtvmF9M5uSq9+ep1k4UMaxeyQ+Yf7sEf+WqS0CkoIzTFWqNubkA0lkXuf2Niifme
	GM+KEa9jrRtQHeM9AnRr7zXFSlsddvcRqNlsWPZ4E3PVDHxy3uzGGvERot3mS71+p2sa6Qxjvs7
	Vp/aoVrfwM2zcQcoMxffbndOc7GOC0bLeltteDfaU=
X-Received: by 2002:a17:90b:3c88:b0:349:3fe6:ab8b with SMTP id 98e67ed59e1d1-353feda35abmr6966768a91.36.1769668117520;
        Wed, 28 Jan 2026 22:28:37 -0800 (PST)
X-Received: by 2002:a17:90b:3c88:b0:349:3fe6:ab8b with SMTP id 98e67ed59e1d1-353feda35abmr6966739a91.36.1769668117049;
        Wed, 28 Jan 2026 22:28:37 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f612917csm7215943a91.8.2026.01.28.22.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:28:36 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/4] arm64: dts: qcom: ipq9574: Add gpio details for eMMC
Date: Thu, 29 Jan 2026 11:58:22 +0530
Message-Id: <20260129062825.666457-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1bqsiqS6SAJ2qeCInMDnGuMQwzPlqBwU
X-Proofpoint-GUID: 1bqsiqS6SAJ2qeCInMDnGuMQwzPlqBwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzOCBTYWx0ZWRfXygpXrxWEvrfw
 oAJukqNHbuvuA/Zwxi568V0Sc2ATnVMcP+6jOrDK6qC7kVVYC8/JT2au2s7IA2CXh58HUufG1IH
 oKY7IAmPW+d79t2pbd2sqjW606nrNm4Htxuka6VEKvvOcERWKcAkwavtZdwCioRad0J3R0FQ99Z
 xx4Gvus7VHcoceMzMell+qbtQgkD8xWGyEeyUEldl6aC0z0x1y/Cez9HwHF+GQoAOVyY+NvmoK/
 21uE42wM2Pb7wyZ0scd7ShDz6HdT/JhhxG/GN59RS00FwSyXZCkw/WSjnEuf9WQYL3V5wmdmKJZ
 8Nrjyi62O/aQHvjyaLvCv14JfC+XNZ8sYNqgrnPRXnFGInkengFzxNN9O+O9Z2SuWhAusPqgOr0
 hY6dQjsVKGBStKfk62s/CPQJIDFsn9KY4MTVWXFxeuie/GyDAaeZwcOp4q3mgtmr4NBQInTmrrf
 V6TjpsmmKDYI+gjdnqg==
X-Authority-Analysis: v=2.4 cv=YtIChoYX c=1 sm=1 tr=0 ts=697afe16 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=T3t2raMPkK00w3a9w_wA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290038
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91116-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5B0EAC36A
X-Rspamd-Action: no action

The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
supported. To enable support for eMMC variant, add the relevant GPIO
related information.

Do not enable NAND by default here. Enable it in board specific DTS.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where required.
    Add 'Reviewed-by: Konrad Dybcio'
---
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index bdb396afb992..c0d575562d39 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -169,6 +169,38 @@ data-pins {
 			bias-disable;
 		};
 	};
+
+	sdc_default_state: sdc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2",
+			       "gpio3", "gpio6", "gpio7",
+			       "gpio8", "gpio9";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		rclk-pins {
+			pins = "gpio10";
+			function = "sdc_rclk";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
 };
 
 &qpic_bam {
@@ -179,7 +211,7 @@ &qpic_nand {
 	pinctrl-0 = <&qpic_snand_default_state>;
 	pinctrl-names = "default";
 
-	status = "okay";
+	status = "disabled";
 
 	flash@0 {
 		compatible = "spi-nand";
-- 
2.34.1


