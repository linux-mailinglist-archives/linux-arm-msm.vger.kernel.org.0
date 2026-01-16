Return-Path: <linux-arm-msm+bounces-89469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CE3D388C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 285183008C92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F095722425B;
	Fri, 16 Jan 2026 21:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWsrBD2h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeIRiUCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9571D6BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599846; cv=none; b=WGh1foas7XhwTZZBhkDqaNrGyKT9MN0XgmRni0gBRVnvX2KTOF61LvIstaHmzNWBomhlFw1ArL4c7Xh3RaaVQ/3Q8GD/UlwgvTfo/4hZ2FQzPQF54dSvs7RyWf0Ub9EMJCkT0hRiU40HxbOUQmBMKRidlFioe2+QJQuhAiNc+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599846; c=relaxed/simple;
	bh=YlgyObBJVxND2wwXv1arITL+J/3vwTygGPNmB70oVkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZRsA7hbFNlWYVfAeHlTO231SK94BzjYfIlmnQIUpdzYRhwGwYP+JELDmxX0fX7u+UyHFVGl+FKxle8T740bxyFAWUMggu/CZyV1FQwXIjapcXi7f8jvRytKlvBETj37dc0kB50L4eTpmYx0K2rhSEeL54uXeUB8TiTiGNnJzjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWsrBD2h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeIRiUCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKcR562643389
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3c91yUqoVpi
	6MpMUgdFeEIvx66w0O3RMzMIWcObrohY=; b=FWsrBD2hJj5VAJcU9cZrOxD6LhG
	qD66SfcAtc5hfwPBIji7JEAVIgvTkV+25Xsc1R3kP3dWcimKVs0P++LAR/PpZYqq
	Cq6DTWCa2RnI/nlVmPq8lq9oDFH0mVb4dvPzz+zWK/+3dPfJxGdLGDNPjTRa9ej6
	HmROyT/atjUGylZUCJwB7NruWFz2JWRyRAl/aigQLZePiwrjOm7ERlAnwkJwvByF
	lsiHKmUavxS4PLdU8hMNFqM9rt5OLP5Y2QBvXqkbZ+VBHDgD9B3HHFRQyvRN4GVX
	opE4F8wkOmFAa4INjXFJCudUTRAY+bb9m9Wc62ALHSjX6UbumGJs0YBcD6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvhh84fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso899589885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768599844; x=1769204644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c91yUqoVpi6MpMUgdFeEIvx66w0O3RMzMIWcObrohY=;
        b=IeIRiUCJrQxVZQx1rAsnkVNbLiPZmZYpklJaYwQXuFn8eVuOlXqzSSLtneixEU9Dx7
         K+vAgJdrga0z+m3TwPcosky/nGwdXnChQ/o7ZCA1yXqQJx/T/odGVMXIkXRSyY6kpRWQ
         GAN0hHq4SzAZ/RwAwmTSCrsgw0Keo4OJ5PB210VJi64cJYOjbk86wbNpOjhiHxYrRqlA
         bhoD33IEVMsJ0vcAyXJzV8Blgu8Fq7XfplsFFjEGJ0nXUrmjHPB2UdcjvODFAePWhPtv
         fXbKecdTo5f54sRGvpfz5UXXmSh87UFsGYP/CsdPWotihTcSwL8Bi++tP68Vp7wNS0Ha
         fq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768599844; x=1769204644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3c91yUqoVpi6MpMUgdFeEIvx66w0O3RMzMIWcObrohY=;
        b=eQQTWdzoHTuieOxKPe0Bddy+VX14N0VBia0wrsBExwTjOPZctoQKVpQzBd+5J9X0ci
         Nqy8uGrS3b0bbSEqasgSfhKjAv4Lrft6MLCFOhQ6kulNAYUNZ0Rqfqvs3dN2r/oMDxSz
         VhdUBPhmzK5HTN4QCNSMYFHFbK2RRQh9/6n6YoWjGRCzBb4HfYDysxaFH6Q88Unzz5LB
         s0tu0Oj95KSW3v9eXC8BQ5Pfk4q9psb0ZWM6wgcNMgYJoUmf2uZieHoq4bQAXJ4H2bRb
         Yfdk/8gH+J9MMKpSe21D9D2olrcOzF8EQ/kED0MLgnT2WGFYrkV2bFMtRoT49OymDtVu
         HTqA==
X-Gm-Message-State: AOJu0YxDj4UU3Pg/GttDiX7P+sX2d/j0hHi4iT0nRI8+wV7w3kq2HwNU
	DqgHlAV2jx3pQmUwero9sk8a6BY9PD8VmeTjkdtKL9dVDgQ1m2lST/9DWwVg7x/4+LiK66a5UN/
	Uih15H5VJnjkoRzTsIA7IRF9QSLURIzdxuHldhEZwPgEAi0yV3r1WxtEm/JtOkeUXnwXg
X-Gm-Gg: AY/fxX75Sew/n7BSo7hi1bjO4JR1uNTQdZsmVa5dHle7xVBGnp3h1g/7x3IpHkf2gu/
	HwpZAA11CNZNz+tEeNwWst5s7WCpMU0NxD87zwbhg5nHqzNraOjr8klSXTAIQZlgU6fg+KJey5B
	Ceq71zl0fWRhc2NCG8th0p73l/59kJYogJwZqhL3DqGwOOwNrqeE+C0VzcxuoXZuRsSgOrHCWpf
	pwvUkV0Q7PHih9A+YsDnXYxnrZOa3RXkOKJEYEXYK/IRmE1t9SsFsWb4fyCb8m2apE0cYp4gSLN
	H/f9+MMAeqzAio8Dn/VXvThPFQ91nCn1S3bDgtXytlm5z/VIM0knU2ZiPAWczgi1XehSl1abJDO
	FqFcAFyrZ7fi5S4HkdK2jiBvb3vVAv53WOY91MQsYIkRhOP1d3140j26LWiC7nRGE+HY0EK+fli
	cM
X-Received: by 2002:a05:620a:1a23:b0:8c6:a522:14a2 with SMTP id af79cd13be357-8c6a5221655mr748711385a.35.1768599844034;
        Fri, 16 Jan 2026 13:44:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8c6:a522:14a2 with SMTP id af79cd13be357-8c6a5221655mr748709385a.35.1768599843613;
        Fri, 16 Jan 2026 13:44:03 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:910f:b77e:d7fd:93ac])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce433sm3479743a12.3.2026.01.16.13.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 13:44:02 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: monaco: Complete SDHC definition
Date: Fri, 16 Jan 2026 22:43:53 +0100
Message-Id: <20260116214354.256878-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
References: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kB64bx0k8amLEJ5L1gNm_HToNu4uGSAm
X-Proofpoint-ORIG-GUID: kB64bx0k8amLEJ5L1gNm_HToNu4uGSAm
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=696ab124 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2MiBTYWx0ZWRfX+xKgt0ofEABz
 U1UVZuIN+GY/LkMD5tqh4yHTn063tUq7m16sO9lvH6zG2ZZzcs1GM3HbMsQEl5mZr4J6k9ebYDp
 /88W+RJrr1z/NPojDm49CE7ON9uaqQUgNzA+VoZjYDx3Z5sDO02oAXrNjpYWxQ5nnIlzyHs3ZHC
 LxxOOAdoWEkYV7dCj1i6QkeXMzgkdrXotSodNLxE5TNJL6/FTCVLDPwh8hm5BAVuiPhzyNfLcJw
 Hn+4laSWF5KlY3vzbfgrJ8j6TP3nYKicGUEBeZQj+Q28HxeTJdGlz3IcKeQ7sOIoOalZ/V4mtu4
 UdUWJ/3Dmt2tpjcia7CqAzmPc0/K37PvhEFf73CW9G3YgplxXkEKob1aXvr1n4Z4CW5eTY8/9Vd
 2XO935ImMmSpRchMtrjTJOgYa3ugoGqZnLMfFzHHxAvq1VqSGiTAUFtJh0yMawLIUV9Y9zKs2Mt
 kKJlIE2Ec6uI9F8OAbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160162

Add the missing SDHC properties required to enable HS200, HS400,
and HS400 Enhanced Strobe modes, as supported by this controller.

Select the proper default pinctrls.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a..5086e1dc9b90 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4197,11 +4197,21 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interconnect-names = "sdhc-ddr",
 					     "cpu-sdhc";
 
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc1_state_on>;
+			pinctrl-1 = <&sdc1_state_off>;
+
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
+			bus-width = <8>;
 			supports-cqe;
 			dma-coherent;
 
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
 			status = "disabled";
 
 			sdhc1_opp_table: opp-table {
-- 
2.34.1


