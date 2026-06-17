Return-Path: <linux-arm-msm+bounces-113617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1UyJE5iDMmom1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:23:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C3699030
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:23:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U54IvGS4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XxHiOBa4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113617-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113617-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E45F232405AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFF93C2BAC;
	Wed, 17 Jun 2026 11:08:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E58F3C09F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694505; cv=none; b=l66o3per++M6i4cu56A/vTq3cSXMTA3qELAaAQPAP70qxk9XqXIAmU5Muo5tzKlCZ/Y3LnvQNlR980dxYkhNkZ5pojM2MRbKcI2J6YpkrR5ptvVScj2FPPWijRdpwyHIoohgzN434fcun0UVu2P8jRip2Pdt0azj1ZLpVpsXrUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694505; c=relaxed/simple;
	bh=8fW2GytXR72R7Feik4hpgijL1okutZWJ0vbyUcl+Qz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qD2El30It8BLftJc6hZye8XvslGjRh/VJk7a76wYMltHZ74ManQQ8C/wQcGd4XERmTvmgMcUFq0PT7UkeX3J+sF4aFb0NGNUeyiD0MhYDHF/WOICWOd/XeiCUB1RZ3UmPCC4E2NYCun8rF9PIQe6eQNo4TETp3zgNtlgOtmfc9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U54IvGS4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxHiOBa4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UCUH1734949
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFoqRC38wRc9ZJi9oIm/mcQVj3TZ570dYiNC0mw+xlo=; b=U54IvGS4Oo3hc0C8
	/dBAhkPViG8Nb9YauzRZpl18+RrSHb47mzuE0+QKY0gyCjD14tnJ3ODwvPYi0ozi
	CKcZxajyyo8UFlahtdDIPa53dtiMFjNTWKl438qNuopTn1xgYrnkXMZ9vy+7cH8E
	5ugdLqPndDO5KVPNV1vvvgvaeFCXjnEA9mjCb6f5nMvwFPC4/zawHPMY4AgPOG5R
	BA/TmMEDc3rLLrxTIaZOYMaVafqQixbk/nSvX7doegHzjeCov9rElN5jdHXjNHuM
	OLof+sstlY52UC0wYHXU74aVrHAN1OKvc4TlR6u0va0dODiJ9kImY+v4ab0yoxtA
	49f6yg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjtma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84534f17866so15609b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694503; x=1782299303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFoqRC38wRc9ZJi9oIm/mcQVj3TZ570dYiNC0mw+xlo=;
        b=XxHiOBa4lXrqsRA/TX5PGGpsQPz364HKizuNuzKIsdaTBG7hguV6r4aKC5Q64bBDrQ
         c7Rg7fNdVfYkTRFUTOtsrsNizidHpC6TJhdV6kSHww7r4fHPTtVjhXYcZOD75dVouptx
         Pw8i9YgQtc8h7tdaG6iwUORXieAOFhrmIDQm2z53txk43X9lhKKkqFo0Sf4Rr4PNiuU3
         HrXT4uAFy91OOSNtE2ujKE7TF2Ugo4LyfCwx4NC1kInMb04YjdjCVFpkgvLmjikpVKGQ
         sP29fVWJRWuAwrlhI+fcLCxyrcwm/o8UO+/iMeZDAspIZm0q7Din3gaknDBEOS4jukfX
         q4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694503; x=1782299303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFoqRC38wRc9ZJi9oIm/mcQVj3TZ570dYiNC0mw+xlo=;
        b=iS3zuqHnf/yxvBP5QWWyXPhe0Cp9yuAv9wOGJEbaqrt+MFxvJ2jrdTuyH/XslWoEqQ
         8tf3j2+KmMhC4/GRWzZyles4DgSlx5Xv2gUMRh2wYyi0Lnx0u2/+t0U3SRnUg/Y51aLk
         Rc65CQ8R0xewW1k+x16sGYqUOKYrBak+h6v9HT72L76Bv0PlTCcAfX1iUvUtd4CWMsPx
         GSB5jBBAXfzpfCwjSfxcHzewLSdXSLvuPaQc4PbLtvuCcatTcfSiHQeK/ylo0LPMzvoy
         FGcxmZ322scHHSkIM7WQmz7osgMhIEOsKOgMp6OZLoDcAVVw4IjHVU+pc1BU1Rsz3bnF
         frMw==
X-Forwarded-Encrypted: i=1; AFNElJ8tZHHP8ZiyVLhp5vQwHx5RpJmwIzAyn09T40lPYqUFqdbFe1JqvcOLUna39IKc8GP+X3Smz5H9Hb6WUG3S@vger.kernel.org
X-Gm-Message-State: AOJu0YyHijgL3wyaCSexeSCXYN+D4DC+AVADngXUoJ49i2MBI+TSF7Zh
	Q1iC8dG9TkTwfNVRggPjLOKQoiVvhQybN6D6CGWOtn+/m5mskZKI7rbd052qCvMym5pTho8vBgE
	Nxn+ZW3OpMiHRdwiWvwEm9H/lncFKaZOMBpZraDAyPShDAbH35v87VidXWPEO78krbbnp
X-Gm-Gg: AfdE7clgVX+KbIc70Ao1wgDOaMsEYJdrzwZa0y3It8MZefzd02OKOFFrkGqKQypU6jH
	6SX7oSja9Jdz1GHnu1Mg5b/V37m0+cg2KPl4hwNBiLxKWft3oijJBbp9WN2Fcn1VhncxCmCNuR4
	wS0Fz3TEOK6cMDi+rndE1Zf0rOJFwBtHDgUwVMGkW5EIsnWKc2+RCCcsXMXFyK/8KDe590Mofb/
	yTS7Fuk8T5g36eU6fn7Bs50MVYNx4tYtFz9uyfyxwcVP3omrKtsMpB+qFH5wP8I8jX4IV4FFkfZ
	TeA1Mue3IJdsYU0KQQ/tBPaIXmSe+maMUE5+l6/3cwnlmSSNJ1tMQSAParY6sxkh1FdFf1r3JGp
	PGwcVT0fuRYGX3CvNh79COR9a/HTrjyGQgNM=
X-Received: by 2002:a05:6a00:1d8f:b0:842:708f:39be with SMTP id d2e1a72fcca58-8452441de23mr3395311b3a.5.1781694503085;
        Wed, 17 Jun 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8f:b0:842:708f:39be with SMTP id d2e1a72fcca58-8452441de23mr3395244b3a.5.1781694502489;
        Wed, 17 Jun 2026 04:08:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:08:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:37:55 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-evacc_glymur-v2-4-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX+AxbyjgZNocD
 fCX9u80CwCZvQPblHY+ApUec5rn1EtWwWbvtwWQhDjUuAG69/EEXJSzbaxUmmris0te8/VPhGMH
 igWMv72Hi0oO27G+XgbbPHN0YBX2Q5s=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a328027 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9WBvkjWlO_SxgljkUiQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 4eP0mabjZ90Hdo4F8lWJ29TjnkGubqT-
X-Proofpoint-ORIG-GUID: 4eP0mabjZ90Hdo4F8lWJ29TjnkGubqT-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX1jhtpz9xoso/
 5yUmu0IgnYOXAxQMl7XnDJsb6qNi7MvROEqVmf8/KjjHPMnbO5IFzqTrWpNj8Cu8iT1IREVV8fH
 6CGZqOJy7c2h+5fWjHvtd6MO6NCDzTjgSSxN9cJSL11nM0hISd7LZEwQlItGP63p8Pukiw+eeJl
 4fq4TS+Mc6eHUhAJJSDekRblkBNiGkCWACMCNIiHccbHMCYJsNw8iDSlp+1GdlN51Mv4A+jveIP
 nRjJaZlkBCezy84hIQKhdzxYrjRJPNp1OH8n+nxefm8eh7CpYCtSQB5IdsFSYaq+DVz6HpbLQ9Y
 z1wz3Fee/I8YPTyBBjqHth0LZ/NNCciE+4JJKtWohb3nBukSIqSO4QwqkSCIGcKH/J9q4/2yzPp
 lAqO72Em5LyRXS0NIICvC9guZ7DeuFAsnr4iyWAr+6v+DW8VQ0qBbxboK0LQB0AUnyrWxnVU5Jc
 nqSFfUXI90IrMnXb8Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113617-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B03C3699030

Add the device node for the EVA clock controller (evacc) for Qualcomm
Glymur SoC. This clock controller provides clocks and resets to the
EVA hardware block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e9549d126aa50a0dc7a90943a3249..d7aee11ca9eff85de4813dd08a1a2c20ce098250 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
+#include <dt-bindings/clock/qcom,glymur-evacc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4804,6 +4805,23 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		evacc: clock-controller@abf0000 {
+			compatible = "qcom,glymur-evacc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_EVA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


