Return-Path: <linux-arm-msm+bounces-81829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B50C5C8D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF79C4ECD2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 10:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB9730FC15;
	Fri, 14 Nov 2025 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni/koqcy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2DS3wHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDDC30F7F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115470; cv=none; b=i5RBgzFVT0yeSBuDpiOHWxzhr98GHMP8Wp7pTgqVycnHm34iSEHEXCa1HJ7ywZ4+aIJELkavk64MnI9MCAs0Yb5ndxzvtxwef1BGwafdm6hbLibv84lKlOAQxk1prUGi9V1vjkGzaxycvO3Yr8kM2C62wJhr1PKeQjAKrPFaAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115470; c=relaxed/simple;
	bh=kcmW0XnS8Yzh2PXq68K4fV/7FcgWMTxoDHcIGBnCUf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HOozaRKZwgSjy2279L+WLhilI2m2786S22fiE1JPJrm12e22FAFeD9igdPReipO0xO+Z9MYaxnQUxPtj75lIycVJrv1ez8AtY+OHfHDDzLasAlc5+1paaB248OBAbyYLQ/9B3LRXimIzMGLhcEmlqT+yhvGmcHtCY1kB8N0FVoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni/koqcy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2DS3wHg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE7ux711699548
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 10:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XRkEi9TvTDddXsjzQ3dIxy
	ddID7H11dRAdtDY/Rt/Yg=; b=ni/koqcyKUSdqgdng20tU2NPYzqah9q+cnwXNB
	dflEhkhKe+HGcD61Rk2EtfeUv5NICDqOJOb2CfVEM99Hn9kU0PWNFRvGtyy6Mgd9
	pqD/neMBhU+Sy+Y9rNuZ8KT7Wb9wNJQBcoz3OT30n+6o6dgSx9WyGy1nhMGNxIfE
	yVl6PnVdyqbOya/JojkoPlAyhBmv4WrD7/yZd31xdPCka4VdQVlRKjmjHJpDSkr1
	094qcInOLmCpjb4Dd6hw+57f3bf77U8EnG1WESfAvYN0qdpL9xmh0mb3fMfla47J
	t8oxBX/9L6A1JLtVU7JFnJFZlDWhTyefrEZRz6PUgfHYWpqw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e1syp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 10:17:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b849837305so1320937b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 02:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763115465; x=1763720265; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRkEi9TvTDddXsjzQ3dIxyddID7H11dRAdtDY/Rt/Yg=;
        b=H2DS3wHg5DMvp13ZDyTBZeHEF0sqQZzQFguyTyBA/W05AkKPwHNdVOAIb0iE6npiPQ
         jRb4wiwiACZupQ/rjfq1LYlM9U5eS2H8DpW53uQM92XMMJoGcZBnS4dvmfl2UoQtCjXc
         dm4FnkPYXXwgZXg0aNY4IzDy6ifwpMgFAjCYQBOOIGxTPPZBsVEqFPHYTXqlepj9gagg
         uhCW4ffQqwMVtGZ+bsq+VuBketCNZ42ibzEDhnzQFtw1++/61r2oyxnqYjYzusBkZcbO
         0GJBcSTynAH4Adw2aWyCp7nsNe+TlHb8oaFK3nOs6p6jfjwcrjQmqAE6JNV3OG5rFYqp
         C+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115465; x=1763720265;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRkEi9TvTDddXsjzQ3dIxyddID7H11dRAdtDY/Rt/Yg=;
        b=jlv10aXPZ6ZKZ1v5cCOWBnAov0I8qIbHXzM8+xi8NbQ3w382W8eV/UpCLi6sRlfYC1
         zgBsns7htp2rJuMpb7+uu9rBU/+f9gpSB+y50dkTBZnaVquGdia06z1ncz+oau/MIVRJ
         NrArGiupeEL1s3c3EWqOR1EnfO8+Ew2UIyEFDb+ypBHn+vC5CT2mSVwBt/eDpsuaHoLg
         cSzifoDA5CE1YsI2EgJmNqGTxvGhVmO4own7KuT6W2BasD5TyHYKnKk5B/tV83qiSNw7
         S8hGs44zLHRqEzoHyO+BnYwBUaxTiWhb19rVShUfz9He/hoIzyn7Lp0qzIektpWK1Wra
         o1NA==
X-Gm-Message-State: AOJu0YwT7QyN3ajOkB5q3R3me01LHu0PW2pLmAmSPZN0cxOUlUrhKLU1
	CaW/AqgKUlwTPEmgz39iUNJRMNS75lttVowwwQ0B9uYTtqIYiMwH4+EmoMpNicUPhA2GxKCuYMA
	YLQxUAEZOAXH3RsQcWzSVTP7VdBJuxIIEtsRO0EACwFmk8iX4NGIAcopFnLJE2OmUwY4X
X-Gm-Gg: ASbGncvw09HZf6Z23x47zKHoljsLQE9v0bnHWywi8ic+yRUWler913a3aAwtANurZ+r
	4BuoBXvccRsOlfI92LlbBMr46LAz0XzvReOQiV3km1z5eHSpLisGRUpxiYV4Foni8zA5pMNenlz
	MRltGQQ7U6+nCBUuhqOOut0JZDMERnkRioaF4MrikDICWZxTpiML9VIQ5rbov51g/RgvQlFuFca
	EwZUuAMwRXGcI2cJUvC/ARXxPHYCWKaO+E1CV+yTGb2Qty2OV0bXd9+B2ay+bpga3k102GqTyaL
	yQ69VgcqKP3J1JwFaJUhcBOq0viRNb3I+o4kaBghdkqkmzvnHAnbkxsLpYFzsRjKnYcexKu0iQ6
	5Hhah1MsWe+fKVeX7Wg2ARi/BbPObSoY=
X-Received: by 2002:a17:903:384c:b0:295:557e:747e with SMTP id d9443c01a7336-2986a7408edmr27488585ad.40.1763115465277;
        Fri, 14 Nov 2025 02:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWxjHl3OrvYdcGzH+TDH7qcBOsFJC9wCxnE+LjjIFy8knZPDmKHSe+4uaPLEuy037XwPbfXA==
X-Received: by 2002:a17:903:384c:b0:295:557e:747e with SMTP id d9443c01a7336-2986a7408edmr27488355ad.40.1763115464779;
        Fri, 14 Nov 2025 02:17:44 -0800 (PST)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2cca66sm50424595ad.99.2025.11.14.02.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:17:44 -0800 (PST)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:47:37 +0530
Subject: [PATCH] arm64: dts: qcom: monaco-evk: Enable TPM (ST33)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-enable-tpm-monaco-v1-1-4ed566838698@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMABF2kC/x3MQQqAIBBA0avIrBtoIiO6SrRQm2qgVDQiiO6et
 HyL/x/InIQzDOqBxJdkCb6AKgVuM35llLkYmrrRRNQie2N3xjMeeARvXMBe654629XWaShdTLz
 I/T/H6X0/C6C7EWMAAAA=
X-Change-ID: 20251114-enable-tpm-monaco-855816b60bc5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763115461; l=1302;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=kcmW0XnS8Yzh2PXq68K4fV/7FcgWMTxoDHcIGBnCUf8=;
 b=AF50w4HZA71kjHq6WoO4CKgsjaq5L4F+yVlZzNRPZyCCAX9shHIXgmTNefBItJ451QqElHBOM
 CzkKq0G34RyAzQdXpvJKaiMAxKSnJLatLZDCj/aD7KTJPge45ataza+
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-ORIG-GUID: o1JuOa80B0Dal-KeTUzjbn-BCt8eP4nH
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=691701ca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rjKJIZSWYijzmp-bF_wA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: o1JuOa80B0Dal-KeTUzjbn-BCt8eP4nH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4MSBTYWx0ZWRfXxyq+/3qbEgdJ
 fGfEz4uujUaCwJKKzX4uawltbQg9ojE9fmCJw3Fs4PDUuK8hSCuEDNb83P7pkdI4iAHJcS2BCWP
 IU5qShnzbIV63aeqnM4kSnY83f8gWLle3kiPjMpLwDKBUELUjLO6rcuUUR9Bbs17fouJou8tMru
 S8vHWL4ubFKO20hcB1JdHdEnKlgEYfjXjo+b13ppL7i53YzaXRKOvP+LAYAHWfuTcPH9yZ1RLVc
 Sj7zCAbMEwlIHqFvEcfIPmlV8KQj43BkXtEqM93H4urnJC3bO8plms4UfP5SOHKw6ymZHkrPbF8
 B1gqlRkPRPbz94Ylez31Eh7q67KGOzocIPFDNChc7MUz5BI3Y0t4MqbXNcutipA7d2UUGnAFb6p
 Lbuifk7WhFf5N25FOa+vK1PwQd1j6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140081

Enable ST33HTPM TPM over SPI10 on the Monaco IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Hi,

As part of TPM support enablement on Monaco EVK, the following tests were performed to verify functionality: 

- TPM detected via tpm_tis_spi driver
- Verified functionality using tpm2-tools:
    * tpm2_getrandom
    * tpm2_rsadecrypt
    * Other basic TPM oeprations
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index e72cf6725a52..ca1bf3cc69bd 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -432,6 +432,16 @@ &serdes0 {
 	status = "okay";
 };
 
+&spi10 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &tlmm {
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {

---
base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
change-id: 20251114-enable-tpm-monaco-855816b60bc5

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>


