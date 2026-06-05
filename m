Return-Path: <linux-arm-msm+bounces-111398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hzHsE9a0ImrCcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:36:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D40647C63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:36:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fIyjm4vR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CitTy8Vg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111398-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111398-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7C0F305498A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F434D990A;
	Fri,  5 Jun 2026 11:27:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762D24D9903
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 11:27:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658854; cv=none; b=B5oTq3uBImPDjWu25f7TEOb1cyhD1AwTYSeSy7Y3NEsqetMLrmBoCLNUesYcMP3C33BSTGGVOhgi8ITSL+04PtvnJx7cK6OAxEfEs1srtPHM0+U1wYrne39KY1ZXQVxphLJhiMkWwhIJpj1VZoDcvsWOxNdnRmcDhOlnSwBv1so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658854; c=relaxed/simple;
	bh=lmfeiGbBwsnfJMh3zPZRyUz9zunZPCI0u2KmSaIagaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f29hEgqh8zOqbXZRiPSki1gbN1p6NZjkoQRbviQrrvTpsRazpq6Q8fulNBrIe0ub6yF7FMpjj43pRXAamLeL8MdU9n9p8b0uEa6a+ohpiUSV2mCfAw6pFBXslclXIF0cO/q5SO9JXMuPNaYPQjlbSrIXndH8u4EGx2ojThkAlBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIyjm4vR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CitTy8Vg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655BABu92667412
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 11:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=; b=fIyjm4vRpixDD/H5
	lB+CnP6tPU0SNJdDqrcDm3kpWb3iZrK5I4ZuFpVWyqTwVasp8ZjxENnDIdpsH1yU
	3o+tV+iQwKNteaqVmWIwrNmV3KL5jX2ryruEDZGZk9NqYe+EvlibksWRv2GV4a5m
	2FwzKhnnSayLoJVdlRG45h40tqH5MRypBR5h5XG+kUX51/733KURmziNQALVzJBn
	RTCgt4ej6IVZ3WG/KmoBz63V7b1+wYeUT+Y872sinz6TTuEcKP4aOj49kriTUzPN
	la6vgEpW5ek7c+D9bkCUKcy7du3s/t4GpkwZOMLmDvHukKc4m99KEtZScTP1OPyn
	DekMyA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekemyupuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 11:27:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84245e2bb00so1568277b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658852; x=1781263652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=;
        b=CitTy8Vg/PGBl7r5haUFlDLXx4LC1t+pyQoCZ2BtrW5sCsQYykMi8v3iQuYWZvE+OH
         u8ejmyf1jNrU1+qg9l0aSRzxxlqLvWPcjdESJFu4dndvsmAfZ8QigTP/gwC8U/1M+WxZ
         52Jy/8Pr+4ZxE0Xkf5QcHop9MZOs+Md9pkMTc2uded/XulKzP67My/w0MT6LULUuzcpE
         TyKFwF26x4IoYOCUwAnjGw99Q+9CrvY8gMMKjBCdSkDBY/SYWXVLL/RXE2qmwO4m3rAv
         nX06xIgaBfjUzQL/jjOVyCeKGYGT7LCl94LP2tmxDvscfJ1FmIXMXiTWr3OSmUT1GvEy
         yPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658852; x=1781263652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=;
        b=qHu/TBa84Wevl2/xtP1rPnhJ+PZERfgYjOhEjs06P89LCI74kPj8Tr6N3saeU4RGy9
         9deYTsPw+DlYSDtqEr0inPDwVoVlGwwwTdREQxQ5nNJpr88ZGJDFHx96Gag7lPuhaKFe
         j3AkcqMFabp0m2KmJyT4lPpA6CyQIV9W2013vxr/Qo9QVuMaqX0ANQlPx4kCrCzxT7Oc
         Y5jYz/2Q8ZXnuaYbTFzGHPpmGpPV4raxVcBQtC276gdKRe+UlFNjxpDbNQ5HOHQddTr/
         +L9uWBbnXulw2qLxnGWFH4lrRsbaSQ8LCJXF2QEYdE6RH3swldBpyMIh/l47qFGD8E+q
         EHOA==
X-Forwarded-Encrypted: i=1; AFNElJ/9pMUDyMFhd+OYCb5b0KV9h7kxuifbFz9YTlH+xhUfdueaIhdtRcvlo2BjkeqpOdbNuT4jtyIGJ6nDPYZK@vger.kernel.org
X-Gm-Message-State: AOJu0YwWksc58ehZMykTbrVQIQYfg/03SEuVMRAHgAWVVohW/+QbPLu/
	Gj9jiwYmd9XD3p02TTI8FTJA55Vdp3QYVs1oecQTVwTZSofjbIVdJzzlKkFv8uoSfDpDpfiEbY5
	QEZpA74+JSXr/wDv4Evb6KR45saj7lw/RnA4oPBAlnnSLx4sGhUFvs7JK2BxXU/4IHeEU
X-Gm-Gg: Acq92OHcYBXFgEiXa6ZF6BiUv2fTfM/yUbleaH9Z3wy0LvawsEf37X3mo69m1bwbvOK
	dsyIp0yM7CUt5of9zj0GCBDp8MM+yUoTP0UqV7zD1O0Td/xuAVgkkfhckKpUOgWNM2PYJi4l7xw
	AsMUeBP5rjNhiDbsUc/3PS76qEoF69Ru1sn2YeEfEC/3Ine6k2U90cParI7h3Z22xIUa0z6JX46
	Fa5OpBoRlHdqC6cSTRcKWmtZK7IU1f0a8tlrb9Ygkfl8fSMn4+ttMkRLX/T5BJGThNXwbdD74PY
	U7ruqrXKV9aPxY0B5hNsHNPzEZ3gAsWDPmCOgO6EAULSjQznwijn7wwcU+ukH+tUDI0xXj+0wI3
	4dQ/lyO2HEvFqk/GN7dwIwA524MDGSZWFKVrHNSqUU75dobbFz+mpRYzMIqIxZDQ=
X-Received: by 2002:a05:6a00:b807:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-842b0e1cee2mr3086270b3a.9.1780658851499;
        Fri, 05 Jun 2026 04:27:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:b807:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-842b0e1cee2mr3086224b3a.9.1780658851017;
        Fri, 05 Jun 2026 04:27:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:30 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:33 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 8w0xeXg-OvtyeDeynxrQjTiYxOL2fbQZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfX0TGVHMPavRLb
 q9QplXPoca4W0GitbMNNcdlnVg+U4rfwvEE+l3JZO9288msFw8tvvkAxA+J1HvDX5fkIfO+wPOw
 Tsb5GuZY96m17PJ4kHbccPsoeccXBVUWuAVHnE8ZA/Zi0d4ES+NDtosO+k4kycgbaqhoiXspFOx
 A3O7MtdUvjtGtXDxVqsGoyZXDxfr5H1AM1mhcmY5IUQyh4uj8WimXt6Y01q5v7UfNrQduBF1jp1
 YRfO1Fi2rwgEBdpKsL53NjADjPOhRXR17uqnjrocYcMC5B5PZ5ua2WgEObF+usVi7AVI92+oSsD
 kmoPMpBIdBdzL0PA1SVC+pVew270FkK6eBXFUOFcekD7kEyb8IkmGiK/g3wRuLG/LIZcspONHq0
 dLvw/gbUzM7hmk95+dpiFDSR+QbjxGOfWPj1yHPbL65sQWNm8QMkI/oox7GBh0EtJizQ7Hm/z/7
 CBr7jEE7dLIb3ZcHR0w==
X-Authority-Analysis: v=2.4 cv=K/wS2SWI c=1 sm=1 tr=0 ts=6a22b2a4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rDU0rDU2gfLWSAyRyQ0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 8w0xeXg-OvtyeDeynxrQjTiYxOL2fbQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111398-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96D40647C63

Add support for Audio Core Clock Controller (AudioCoreCC) node on Qualcomm
Shikra SoC. The CQM variant requires both clock and reset support, while
the CQS variant requires only reset support. Update the respective device
tree variants to enable and override the node as per variant requirements.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  5 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 13 +++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7aed3121ef092df684b19a4de39b497..b5e3d573868a836ad5e5e8eb3024cb5fb71dbb4e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,11 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	compatible = "qcom,shikra-cqs-audiocorecc";
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f15757d52af04d8cb5540354a239127cb0d174a3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-cqm-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>,
+			      <0x0 0x0a0b4000 0x0 0x1000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			status = "disabled";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1


