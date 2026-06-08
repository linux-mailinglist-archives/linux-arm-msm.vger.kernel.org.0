Return-Path: <linux-arm-msm+bounces-111877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qn19IJTBJmovkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:20:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354036568CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:20:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ToeN8+DL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xxn8HxqO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111877-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111877-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F3DD30564A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B46B23395E;
	Mon,  8 Jun 2026 13:10:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75736A37E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:10:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924255; cv=none; b=Ba5SyHoKHcNgOqIEvwRpl6ONelPQ9TGquHZr/mBsdaHzbpaMpT7T7ig9WNrTYX/cJxUFdYymbrim4Lg5MKJKMocIRHlb3kqGavw02RfyH6vkDckFGqfbgGNJ6Z1QTnH8qw45nJTn8PSfktEPmKOLXzMqR8vykiQ9sEYwaEgu6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924255; c=relaxed/simple;
	bh=9nJ4RWVS4xD358qxJqQ8mIalRRMghPwYWOD3PcvvDzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvZ5dArfIuGYzjkxI5lK60PKWrZKKUZ6Df3/WXpTFxz/2fBAXeXk4XtPSPCXtd5TNBRTh0jGR4dkb8PYoHTC3ci9l3LPQYQs71+92tmodrtupyYD6pnWVIeNLlVrWOXqOAK1xKVWv810eNjyaeJwfQUrkBazC87H795+8re5MLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ToeN8+DL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xxn8HxqO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9RV62965393
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=; b=ToeN8+DLKCltdiOf
	QYvKO6TWXiRhb2XgeqvhBwzN2Wmoo+Yk7SL/hHDmlfMdxvV2u1pVTXmFbfbN86ki
	CA0Y0iwGePGa/3lHvIoEGuFhywavLko0EgnRJi1PetEf/DMAb2OpWkTo+kKDCNfM
	/AfsUiD52AYVDDPrsqUfxnk6yp5uENsbQjnv2rD4Sx47ROjtu/9E+w838VdzmAaz
	nhxsUCrPHWd9afG+hPlR9qIwCZtXxsF4ycTPRUUa6qoL+rIVSBMwd6rscXJyKQ48
	02HuCwMaVvJaWL+Z+CfpN/6RVZHNSP5o16l7+jj2zIjAKyB1w6IuqBdXoSWU9zcQ
	OHf1HA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrks21p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:10:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befec3fd8fso30120115ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924252; x=1781529052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=;
        b=Xxn8HxqOTpl7nKV3xK1sK9RpjzPJMOMKZ1FUlrqcc7EciyYPkneXGd2EA1g4os6Fd8
         4mjCl/+WPjS+93cSkCMmtidKW6EY/FwydB4qj5lYtuUTDyGlfp21n7R+saa2O4QXzQTy
         kJ9rvs2XHEQH83UvraYSDPn84fALFW6VHhdBJNJq0qEaf8uXLFQq9zMxQtIoS2osTN9R
         UJNRN5YB0N9ffkCiMKHAxg4HW56cfOWvTXMh3DSWpxsaqZinYbxxuQct/VG+zBBxymOU
         J577LvOPeeVtZxGaisilwjhttbZw7mQnrSg1JUXbod8K6nPY5MWs5sjl9MxUO9/qfuMb
         J5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924252; x=1781529052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=;
        b=QwEh47x9wmvk3JB13Dd8d26LmbZL77p0Ir1/16CaO2yyHuRUocif7ONwyaYq++P+LF
         lZbjJRLszjTVgIp6OOdRFPh/VqXTK/nqghvpHxyWRxZbu6KTJc/a8ayhxhwQC23GqrTH
         4XC5LdX+ANX6YMvmwDR55MZ6KcjFxwAVkNcgN/wzBFLesyXiIpOxEMI22hC/m0X2xaw0
         DKhQO0lxaFXSjGSznJQjRvDcF+Uzurh9molHkY2JltFw5P89aakp0yVJmERBqc3qe1hY
         p9zBM+hUH7o7t/vyUFJ783F3zVBi0Dxx4aN/PIQP74MC17sDsQWUt2vxVmIT5acbD1+c
         eByg==
X-Gm-Message-State: AOJu0YwZhpWjH4p8x7gbfcpE87uDfFVdijVVAapbZhxs399kBKKNWt0C
	ZejyofQmf3nrzpxlK2EsS6aj5QcOTGHprbBIHpjNMeos+i2b/zgzaxH0ontDHHx2eVIlrusM+GN
	AU3RUwGuhQFjRrmiC5ucnqNVHv7o/QoU5s8y8At+TQQc6zPdwtdmcpc5iDMyfNasRO/1b
X-Gm-Gg: Acq92OHDba4voCJ6PpsyfyHysJ8vubmMIqYhb3k1i+hpxNeg3quPgZJVUUh4pJFfCb6
	idqC1HnJIJY2j/YfSTKybKIDNGFIketqPDwWb3O2sEtBCyBkJsQUTCUmuaaItTCBOo1l9kfxU2/
	zboLyO3MCGRhT0YpUsgOZN5SSeyhmmQ8Pi/TFRpxAbEumJuR5OkWkpACXUaRPC98hmTpCBCue1z
	EFQxN48CKH22lgbn5FSLl82fbGUX46QuZfT8xlSbCL3riEygMfWwD3oLCX4HXvp1D4xjcL5Kfwl
	lNfaqsxcjpbt2X46E3ZuEl6ByEl2ZLRGvXq1iljyNQhYkA5IxNXO3J87kYzobxjU14604Xkakht
	6bg1j0ORcqcIdtkSBJzcMF4gW1jRVGGQzIIBhI9zeX4HKceE=
X-Received: by 2002:a17:902:f606:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c1e810e153mr176407905ad.26.1780924251949;
        Mon, 08 Jun 2026 06:10:51 -0700 (PDT)
X-Received: by 2002:a17:902:f606:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c1e810e153mr176407605ad.26.1780924251482;
        Mon, 08 Jun 2026 06:10:51 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad172sm185235845ad.83.2026.06.08.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:10:51 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 18:40:22 +0530
Subject: [PATCH v4 02/10] dt-bindings: interconnect: qcom-bwmon: Add Shikra
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-dt-m1-v4-2-2114300594a6@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780924231; l=1132;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ie2wM60+tAThpQPFlruvov7NzPvO75/SEoFhbJfHGt4=;
 b=tNkS0s8Bu4a5n5l/WlkzXwkGjZxfxwWSDn+0OvPTRAaen3Spmk3CD/7q+v/+CPsg4O/e9t2jk
 hXG9g5vRbKrC6qR9FtrD95X6awPWXaSBT3PBCEd5nCvjLnhQCqswj7n
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: dkTFzNfqlwyiSDhspsLGUe9GkkrLG01A
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26bf5c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=s2Q_muabT7T23weRVv8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dkTFzNfqlwyiSDhspsLGUe9GkkrLG01A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfXytTzLN/n8foO
 54h2Ae/9tIpykwp4GvnUJ2Wpz+8vKw9R93jh4lrKQLUYFetubj2/ENhMxOAQKZ0NxsJ62tkruKc
 wn/fto/QEHdTjfUXnwsrQyLfFW7jP1S5GIFMHa1PbXWBZo7MKLyS5F3d94rESqVz2ElZuWJKwjv
 HQy+n5uj5alsKjEMziRee4yvtnBNSxbCDkQu8kgBtSd+r0oV3xrQNncA8dGmOTvtg5DmAVxaMY4
 5Jl2pnUtEWoeWH+Z+inu6jd7CKo0L1JPglYAwHh3FOjOTVtyC2z9D/1JmnSJ0vug7m1P54laARl
 7yKFeRXcuKMT7/eCacATPAqwKC+GqL5q4xbNUyZ+dvTzpWZtdVOJaXKXkmDZ+wAFP2hlANy1E/r
 VA96o5GzEwXwBKAR6g8e7CvAgcppIZVcaAOHeDoYd9EQ2NMk3fRSrli92f3hzWtePrHB0zi9jfO
 B+g1tNYQ1Ss2qafAfWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111877-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:sayantan.chakraborty@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 354036568CD

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add the Qualcomm Shikra SoC compatible string for the CPU-to-DDR
bandwidth monitor. Shikra has a BWMONv5 for CPU.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index ff64225e8281..8f6c937e44ce 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,sa8775p-llcc-bwmon
               - qcom,sc7180-llcc-bwmon
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,shikra-cpu-bwmon
               - qcom,sm6350-cpu-bwmon
               - qcom,sm8250-llcc-bwmon
               - qcom,sm8550-llcc-bwmon

-- 
2.34.1


