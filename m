Return-Path: <linux-arm-msm+bounces-102179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EKnIkIN1WlQzwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:57:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0E3AF93E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64C32307A519
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B023B9DA0;
	Tue,  7 Apr 2026 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+g/vIwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4QlUEBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A373B4E84
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569923; cv=none; b=I6vkQDVcczIx77NJYZm7hJN1OLw66E3Sv7ADc5hRZLMLbEE+N+Ltdq8SBaHAj8o4w7zI6RhMv6FgGa2iRa2J5JJOIGMlyGhQ0+pnbPMMgqmtXgwW0h6JvUaQJf2bJwQEibF4AyaEoGdR13yusbCKW9Ey8T6tuWW/Vf9jUlUrqKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569923; c=relaxed/simple;
	bh=9aNnMIHy93ye8Yvzp5QMUCPpY5lXKw/pYtBvbad6HNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+VoNh1/nZYnofQlzs/nSNQbTLNxUM8ru+uxGxaO2b/dx2C/z7nxHtgc8OEpqXYF0w+0YfhtWyYl48mmwXdppDGHnNfQFtV1z3jXrA+TYUiF5L6mdb8nbiUbC1K3lCKTMzEJipefseJ97ahs20AzyojRRV6X7PcV3L1fObONvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+g/vIwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4QlUEBD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Cx1SB1403582
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZVHrEZHHniosNApu3I74U4uISmrILmeMewkp/0RFlY=; b=m+g/vIwJKA1MHCCV
	GXRi1RXLFUh3OxODQ5P1VPZhZG85g3NS++aodRY5cP2LfhBY9pouvA2rF8MGEt1g
	A7CS+RIkdUabvgBKY6peMUP32NgiO7gWsXX9e6BtaUQDGcgZAWBC+98JU4PycymM
	TS9tMO3Ny9t/yXC75EGA9CoJ0Ay5UbMWG1zriIOxSMkaoXHXbQpC6HijmLc5V/0+
	RjUc1OjUUKKJ07oXxbk8rbuN0jt9T7ArpHNizHqo9mxOH4+1qoAFmjQnPnrOsFso
	evvMO6Zn4zeq5A9wRKGvnITlcSzReZsty7eyqX2HxWNbDlvD9aoZpNpaXbXYsyNO
	kQvDDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8b029-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:52:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso20787391cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775569920; x=1776174720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZVHrEZHHniosNApu3I74U4uISmrILmeMewkp/0RFlY=;
        b=i4QlUEBDMKEJP3/F1sMJgaFLZ6ZX+TT62KGPXXB+og757Rex9MsENXeKoWPxL0A6R4
         1kFUP+/nN0LYxjLRUQtdvYzGK4DfMtMr23ZVjr6MaGg2VnYCjm78zXXEaYqH9VfkSA6h
         Lr310VnMmO//r7IZuhEdq2IT4+FLa213MLEOcsB7Mv5v65P8NIyKbhyPuth9gndPrkIS
         CSGn9YYhmXHUfkuUN8ovaRRDE99ZVe3+pNVYRia+3viYeMM5ClCgt9EvciUP+qyjytfG
         rmXj6P8J1P0pSJ3kc8vVeT4/oNmO3nlq10ywt/ifeBcqgDvGMGLSnymmCH7ZdX42qbCM
         gQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569920; x=1776174720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZVHrEZHHniosNApu3I74U4uISmrILmeMewkp/0RFlY=;
        b=DTqw4MnX93Dpj5Q2vUfqWYpKGUm+2XqzoDQfDHr+0fdk+ouOoMvZxaOBwja4a3di0c
         KR65uSe+y5csPSoiP6sqTg1OPJKzVUboo7adsykR4ewV06blS94+/FnYzVdYNhRUa86K
         Lb3dBhox1iG9BqsraURE0H2lkjU+U7QatpuYfcFspPgaOLWEvV3IREiNN2AFISIczl0q
         yUtk7V6b/t5kxrUTgsLiVwF8BBW3ujxIZIlTnz3vKIueqYEc9iArTms0cooICO3tE934
         FQPmkvCWD4+vbSh0JT/PPCwg4PaXsMbKV3gcQdt0m5zlNI6aqu2OERCgGFWPTD3MWUJF
         OtSw==
X-Gm-Message-State: AOJu0YyujgJPOr3dbe9OjbmjWYNZYwtng/x8dmVzA8viB0AiSK35GBL3
	o2kR00TVoSpaK+zDFUD8Mhe8NGvJUg+1my1I36XLfExgo9yyXnbylRM4+FhPw5Ur2VsCfyHIUX1
	+I5sUXMfvivJt24qSxQaEbVjOZXVhJuXkK9fVXONUUefcHYPVNfVrIGdg1lI0VTTG0R8dx3Yls+
	VP
X-Gm-Gg: AeBDies4nhyU/pSJq7//IwBxMeUPAQSQyGfwUCLvbyQU2xuGkyozxNT2LiQXVkp+vL7
	Yn0tCq1b81JaBD2hYaXqI/JE+f5WhZqt56njm5kYbrA+aAe39RjWyvXkk4TkdRa05sqUXdVRfm/
	sdmMMZjuTzX9iqznG/EdTUjIY6Re7CTYjcNOJMUYt3HQH6FzeHyZl7qDiBGtX0INv2N2bUMzJeF
	e4KfU38lbG8DLZqrkfZt3iWV8NorV95lpOQG2rtnYi99cXBL+FHWCFZbIL9wfTGHjqsDBfG3BQ4
	Pv2Okxx1ihavPM4DYUGn13hB4tcTcQFchXoAibi4mjARTw3TvlmNsGgZeP+A1wGPd5/Y4vS4qAw
	+XzdojJHz1297hvAhWWM4BeJUO6/B2mD58sgaz3QTsy35
X-Received: by 2002:a05:622a:4aca:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50d62b9d11amr261913821cf.19.1775569920350;
        Tue, 07 Apr 2026 06:52:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4aca:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50d62b9d11amr261913281cf.19.1775569919870;
        Tue, 07 Apr 2026 06:51:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm49788420f8f.22.2026.04.07.06.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:51:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:51:43 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: eliza: Add QCE crypto
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9aNnMIHy93ye8Yvzp5QMUCPpY5lXKw/pYtBvbad6HNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp1Qv5KBNk+KfRBTNbkJp/jy3fPwrto+Iz5tAJN
 aZWA/KYwSmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadUL+QAKCRDBN2bmhouD
 1wH1D/4mYw1oOjqGb396+7veR/0k/6iogd5gD8XKPNpHrBAUlny10iXXEePJIdUqeGq/Lg2pWBx
 mDrOGBvGF99+jzF3JuhiP/n83zZLVeZXmlkZFzRBYxer3rYZCQyCMFZotD8QatQ26i6HouUugrP
 muEOgqbQkgyA4Qi+wCqXTIGWHSp4YtCc8VzGaA7nTE5OMNuB4RBdVVNi9nvvfr1QcUfvSsfn0Mc
 mtTszmaDMLFogZIpTikpVbBL+CFEhqnQiNlrqdxbNnn+RWQOH0pfvuoMGK/pDFcIUPYchgC5l6Y
 pUch/XPRfpxKsIbSF/NN6USMo9yjxJQhBW5Wl6wL3OGNzLyv5klCgRDoIFxV2RaiNWv1xpPfn4W
 loRw43NoX1YMpfK5ZrD8mL7o86qoxSbswH0vb3Zgwj1IplvTWsbtDrkj7vl1unA8Jk+HAazeSAr
 BP2D9LbrsnkxKALN7niBWCssRclbfnCVbpSuCOmyU2i9JJHqyQ1b65UoErQS7iFnEtpOZJJ2u24
 wv/y8CpuXcg57Yv986AWUhKkRlinWb2lNPAqBju3OKeJZRpxikvGheT9dATLrP5M5mGR0cQvXuW
 IemQxbiIpbwOUfQokP4QFmdAGM/MJ1ymb3iMLGAvkqUQJ8dE7D218ChA4MJRHT75kP0En7uuLF2
 QAi7ylPgReXEABg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: B-716oNNQAKPwtyXS4AYeleeufbs6iwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyOCBTYWx0ZWRfXzunY3VVAseCX
 INFO2N55Fha67LEhyXcRB7v7n2vGIQG8hTbzVHI2w7KMYjR9tTv/ZQNmi5SV7QXmvegjMebTBDP
 74D8pWxvoRU4rHaUQGxYkjaeQPzWKe/MkVq971O89v6dLyY6UK/fCpKECd4a2Q7A7XnYoc6F20Y
 u52GN6jEqe8pNwRgnMWnvRpYmEmK7EUP89B1dwB3AHHnSYHNQPwJk9OLL25N5J6r26fpB8gkUyc
 cn9vzOIOd807OTAyeyS44Avs+CgyyXoL6gqE03R7lFV5e4EtUggHVU8hrFeHVFWd7EJlNoo/S36
 VPZaLE6kkTVBqruAZofCJLEPZDQGZTaX5CoOTvQiPWJYl99pd4OpbxUm/CMamzLK12bwfA7aQ9I
 +D+zXnKAfSw0N8x9xQGSIPNUFh1W3AsbN6T/4nIuERfv+dWcZC0fODONqYcR/MyauBDrvgEVe8W
 ri+Oh92pExpHGH2vVEA==
X-Proofpoint-GUID: B-716oNNQAKPwtyXS4AYeleeufbs6iwK
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d50c01 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RBDiCIgPaVw5J07OToMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070128
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102179-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1dfa000:email,1d88000:email,qualcomm.com:dkim,qualcomm.com:email,1f40000:email];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04F0E3AF93E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add nodes for the BAM DAM and QCE crypto engine.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6..24c680795481 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -846,6 +846,38 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+
+			#dma-cells = <1>;
+
+			iommus = <&apps_smmu 0x480 0>,
+				 <&apps_smmu 0x481 0>;
+
+			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <20>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,eliza-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+
+			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+
+			iommus = <&apps_smmu 0x480 0>,
+				 <&apps_smmu 0x481 0>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.51.0


