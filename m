Return-Path: <linux-arm-msm+bounces-117247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LmZDMB/STGoRqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:17:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C03C71A326
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:17:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bys1MhJ1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="PX8KRVJ/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117247-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117247-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C79930ED2E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066F03DC4C4;
	Tue,  7 Jul 2026 10:13:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73013DB999
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:13:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419189; cv=none; b=jCz5FPJwzFaTW2gU99KZGMIrO42GlS/cYgDvuQFzkUbbst35myn226Ic4U2UtRjNfWW5uit1z8Z3h03o+giw+3Yw+sEF6Jy7kF5c3esuONrIA/bokO4BAkFRBItfPZeXT9Bxx4QAd/waGhjMtB64kU2JjCYbFA0SoN11VVWNoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419189; c=relaxed/simple;
	bh=btumoU3pIG/LAxnXpjlEt5hEk9N65ss833i6VOVfTGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBjISv7/JGYvjy6wTG/yZtRojdkzIBHS/eBjtfXhF2pMDTQu94M5ZnUHBn7pIAmZvc0fB/BvZzNwVEt6YlWE3U+ffLFs/gCvMGMHIzMKiUxeiD7R9ZpAa12vlSLoGqp9bvEqeOxY1paizTrQhxkGJ6jXiQm44JBHwGGsZOtJ5qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bys1MhJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PX8KRVJ/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EECe3203466
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KoENZQMBRLol1CJ95/um9zCMXYskZHoxExsv+BKuhsg=; b=Bys1MhJ1HKJuFcfL
	c6uJlLn+XY2aGZqqvJ83LuYfEHw4lLeWn3Ymkm68z35ySMqx+4xXoSBi8Us8azSi
	kEB5IYW5Qfk3t6Gg0fzu7thLYHLuQS9MiDuHQN8q39Z6E+Mo5glpvwgKW9T2zSO1
	lkeTTx6uSbhtobeQ1z5LOEj0wUtKSuQX74Fvn9arsW7q7mmyPq5hMYXGLUV8ERrp
	ximQ02SXFxucWnSqXGNZU54D1MaN2U5Mc3FptikZQTBMJVrTdymKuX660lbO9Rzg
	A4VimEKXCPX7qyfrkh6R56WaNyWL+vyhHPWHA7yQb/jQy7ZLFQDNp5piLDY4sm5Y
	KcSrPA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8wtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:13:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88da04b719so3408828a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419186; x=1784023986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoENZQMBRLol1CJ95/um9zCMXYskZHoxExsv+BKuhsg=;
        b=PX8KRVJ/cyDVteQ5/8GbyGFsojqCRtqD2vz0xQvVaxzQwr1dkvgYCkKK5Oj9YSnV+U
         ZMSL2+bf73iGdNNsydPcUXiUDuN6Zs2j+k5z7TsU8MSDhuKWKDyH+Ed5XJ9PYMJXyqRS
         lnah4ey6VGj10RBr7p7CRxpoMFN20m8oDGn3omdwuiqQO2ETt23ny8HKjMNIYKDzPanR
         MvkGArA9c8Q1weVomlP7+2i8M85clNPTmYmr11a77x2qf0XiDaqBLNJ0vtvAB1afGbFF
         pDJ/zvVFzud+39Xd6pAGDxsxlCNTnklJ900a/J6Y+HKUx6gcHRwjjWJmSaAlpZ62PIr7
         rwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419186; x=1784023986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoENZQMBRLol1CJ95/um9zCMXYskZHoxExsv+BKuhsg=;
        b=iw6Cvx9PCcfLDKqAIn4htw7BhI0tejocX43L6qNFrJrjRIU5g/rajGe8ieXvt2pNSg
         aqLaJs24OcTEDV/aimV5PBmWhONwkbFUYWz6nh9KBLPY/u0CI3FW2HnVfGdPWKRfD3j5
         QlWE8B7taNbOB/QEi46NbpeoDP/vOofyd6nvqPiKIrM8YRt457pAB3sUTAbZg4av6zuY
         UlsX7jENmeMh0G8fGxN3CnSVaGLtliyN3bFuIv6F5S0F6ItIVIfch4ZuixlcFG12qkal
         z8PLTvcRX31BfGh7SpdkeG7S3qkTZWEMgCf6yNntl8eEX+CX2NpYcWRi83lR1bksv+gC
         CApA==
X-Gm-Message-State: AOJu0Yxvc5hm3wEUJ5cBoQFicR/uPjv1ogIAegZqoCFLcQFY9jbomL9r
	6N8GZpvFmCUxl5QkUmTqgf92QoXZNeKWz1ousgxd13sskCu34rAkZNdVY3+85Gbp3x9OR0XLyBA
	awcZfKiHnPBbUuKZG3MOt4ll0+pmBtvRnN8ctxJOtJCHIzpZxsHyI3Bt05iWVFf2VWgYD
X-Gm-Gg: AfdE7cnI9NkNIIUYs+uXcH4vUqak+oiBXXKCTweoLxpH54QBXfyPF8U8WyUY5swhGCe
	vFsxxdcbXtOGMtuZ3+onCeQvDZlJyQVnxkoiEMQDaSN4UGP5WrDoG+/a8uT4WkK0bvHpEplKhP4
	j5Ke1heazzs9La2yva76ETwkWv6B+bhhP6yp/6db2tRQuEnc2ZminR1wJvNc28Ch9NNPZBYZDN5
	LxY7dE2NMwLVO3FoTFojrGxnfjOxqVpR/z4Ucj28fDl3lz50Xe/yk4BGCAQrEAM0ZxTEuorX6BI
	8/SWipkN3OfZKUCZkSxu95XUd8YFxdAEEPZ4lCJ2URhl8Ds6dIJ0Pyro5wHuUESKs/x7Z1y8P0d
	0ibKxzXYqS4qxs6GxMgy5HpnT2RaEGwCcjX46Z97C2e2IVdb4gf5Eph8iBj84
X-Received: by 2002:a05:6a21:62cc:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3c08edb777emr5808548637.26.1783419185649;
        Tue, 07 Jul 2026 03:13:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:62cc:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3c08edb777emr5808514637.26.1783419185206;
        Tue, 07 Jul 2026 03:13:05 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7098929c88.10.2026.07.07.03.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:13:04 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:12:46 -0700
Subject: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783419181; l=2856;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=9Yzjj9aQIU5lY5XB41tE+SgPpEtYePj7JS1qPaS10F8=;
 b=Dx6YSifOOl1dITFoEPkXoAu9F69nnhmOtDFI/GofB5C2BUrGlcnLuoMNH128MHDMtHBAe+GBG
 7QR0xNF6FSwBgwfS7G2ehT2MOOQaOyO/sh7JJ1V8e7PNs0xdttPtgjj
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: Yg0U_mCa-nH6q7FiSaen1WGTrfySEQq-
X-Proofpoint-ORIG-GUID: Yg0U_mCa-nH6q7FiSaen1WGTrfySEQq-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXyWqZMrjRYxiJ
 4Fga8OLmIopDLEKpzWNN1iuw87sYGenoXthpPjJdg4qMGcRYxFcqbjYxiM4AibvuFLGf4S3iWAN
 5VzmyLAROkFXrOIVqGH7+hHoRVRtcao=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cd132 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9f4fzsQZ2b4kEiPl2jAA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX5EQhB0U0kpaW
 FLfQ+YFRgiWsbDJ5Dc/U8dHJaZMNlQyCR5dOtkov5EkDY+U0ASe1QXbQiW2p9qBWAgPPyWtJPQS
 0SRg9x2+AmY6JXgbrvgtOcbydxQ29o0doEPnIsHp9BLnE6vrmyiuGwqcNhr5NncR/Rp1CrvFayq
 5kQvBLp6H0mb1pwxEIv+vgNYJtCen2/TcNmMZIewY+BjRICktK8gdaLH+hJQe/iK/IWJNTo6PFt
 7ujHgLwG98L50jyvOydamyzQaUFOklqSL1NzCKuNliQXdFmLd9098j2UE4U6A6Ulvav2VnxnCxt
 4e6buLSrTI73qaPkp03bJ8QolcdU3B1rMmyU02r9Tag9dR1r9pmALDDrwd72Y/mrJjE/590ItxK
 2nl3p8FgTy+uyV6B8wnfewWegQXchD9IzrPpf8Quesm02TBD+1glNeCQabhPYqZj2hMo9vDaHQu
 jQgF0gzVpNCSuGF5dCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117247-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:ananthu.cv@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C03C71A326

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging, and various other functions on Qualcomm SoCs.

Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..328eb513140f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -585,6 +585,13 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 9ec7c256b80a..e3dee05de3a3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";

-- 
2.43.0


