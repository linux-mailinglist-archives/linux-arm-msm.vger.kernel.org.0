Return-Path: <linux-arm-msm+bounces-118816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qs2bN8L9VGoXigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:01:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9698274CB8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:01:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hnVlKmxn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ATF1k2px;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118816-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118816-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD23C30B6E1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC9D43932C;
	Mon, 13 Jul 2026 14:55:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F80437452
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:55:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954524; cv=none; b=JzVJo5qecN3YDeJtZY/7bfjJbJgYeS7fHT6mR0IyOeogu9ccrVFl6nD0GklpTuypIrrcPDvdiZpNHCAXRsi7tzHvNeoMRHWZH9DqHmRM2zhb7RJr0vWWhCgdC3Y0U28ksCsLYWg3O8gNuH/SzmxvxaXNU2BDhb83/UQHYCjj+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954524; c=relaxed/simple;
	bh=3RYoy3NwCnlF9xpy5kV6jgraHpowonDh8P0V9h6Z3hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lqr/QsQXymX3rZIcAbVmvA97LREvC6yOStLSiwB/ZEa5RjvB8iTl6WefTdVW7guGHjCSLf+ooK35FnxM5CEN6djUGwLdex+GrbPaDAf/PLiP5wLd8juyZ0ZSctCx5t8Nenx6ijW6G1h6F4jSOi3wokk24UbhUYHnp4CJCGdIXfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnVlKmxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATF1k2px; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEGrm1516541
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=hnVlKmxnXPMktPQm
	yk+j1bTsKNGPKreQoVJyWZI/ztaKVl+Ut8GfBihC5lBvInp+KDtkC2twuPxM6qXP
	KCP8vKxoAzeYtn9k8ajpbo2hYYSU7W1ZnL9pME2qWyV0SgZHoBv5obpTE9t3WJVs
	N79RNddngnMcn+/UNmdcOBZanpXOPEqZw1FsscxRGGH9gi4m9VMnErj1C0TbhJeV
	q25dyT0/VhNThOUFN8ntuYiQY92PdtrrbQxLd4EvdqETLmLAX02QUD0WonTP9Cqd
	Pq48ZODrm9HvvVB0Dr3k/2UzB778ujlRLhuQnMPt3AGekDMNpY6/D9wIcA7xCBcM
	Nmz6sw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubssss9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:55:21 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9fc6dc091so1869060a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954521; x=1784559321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=ATF1k2pxhfYdVKErt4tKwri+F31Y1u2wKo8sZf3TKTwTwZe8BidA6iDTFmX15cmxiA
         sXxSsq2rbhBKnJ2Z6uExkWb9mBigxhiN9VbqG9A8n3zF4al7LUDeNmAU71527KzgcJKA
         xtJfU1MF5OroZ5GXX9MWpOiBNyvInAdt4hAPi0KuYtPe6YHKv5afJxm7Fu76VL074fK9
         PvgLX4BzYIw+AKvinRr9KWgmp4Va7Ka88QAOmH3rzThe3KBu/WiEEYR5gOTtLrn/lXsZ
         lg0LdhWDNv5EO7qDqUNzmY5a/A+TcbGfOK8c9tGciKKDEDfzyKhxgkSO8MoTGiTzrTQ0
         qhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954521; x=1784559321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=lCJp2Tkn8qpTqstSMML+QtQ7BghkwcgDqk9JHL8WvjLaitH7RG6TT/sJuWPq9zns+1
         HEgYAMOwPcfB0LLbFJv82PqCBj9rAQEYqU7XfcBAahAnZCc3V9svz+H7BH/iHkG/qOu/
         6uf0YOcH34Wxp2oXBHQ4F7KNdy3fWM03r7zhzLKNd/DVeHruX49wunBo7rO6/vJa5wR8
         HJUmVG9zuIYdl8E3L4DZi9NkjPy99s3R/yNf4T/5RAsuiIudpoBgDmjbK9fxBx5TQa5X
         edCKqhBwhwPmZ10UhZx5qOBgFQ0OE91Vma7h2U36+Fx82d46Q7/VCDW5O0Wdrsi4MfOC
         xmuw==
X-Forwarded-Encrypted: i=1; AFNElJ+UA/heJZZD2TYW+3AtRIAz0tea7pKMSyzSbOrfXU/E5nq2W6ipTKMh5bAJ7GnFoMycDjWjUJczgk5KhXxD@vger.kernel.org
X-Gm-Message-State: AOJu0YyCb/K3FqqKE7JhQWf53nkiLyQaPugWxRiXEHMzEpg0ODvdy9En
	PyXC+Bn/wEWi0QawoSFZMnsrikp+y8BLfXgULSkwoNb34Kip+zXZz58PsINZyGLi1BbSpik3TrA
	AzNomaJF3lRlKBd9MNpux+jxIJ9dWHI/oiRWV8SN2THp+8s3nny0W/47+9gItEhoRGaIg
X-Gm-Gg: AfdE7clJ8PgPI57YZVfYkfhXGpUcRykbloeVq9tW6fR036j9zJRJisLFrn3MwYK89PG
	ncveF4q4XRu/0bW28Z+773MY1ezBInUbKfsgLdt5dYK8s0y2FOvIM6lQQAGnTKxjnr34SFRMC+t
	MajNxjtbgIMrLmD2PBhcHK5eP/BcIw5FvVUsFursj91eFsGdn1SeKpA6nzgnWTulIlgjRbNZbv4
	dlypPh2SfYvfxYqcQhUpf7wuJnVRA3hsag7vbJ//TFnQ3jEj/GrYL94+mbK02j93ChJcqHr83Bw
	tbQdVIgI5+Y3q3VYfiyy+qPFw7ZFePdvxxy161+XtxxLLKjdHzEHb3nhKbHn203qC/po10mDySH
	WBNTVq+Sqy4hAN1cTg5l8mBVUDeAB9QDIPi0=
X-Received: by 2002:a05:6820:134a:b0:6a3:c52b:b95a with SMTP id 006d021491bc7-6a3c52bbe58mr48657eaf.29.1783954520779;
        Mon, 13 Jul 2026 07:55:20 -0700 (PDT)
X-Received: by 2002:a05:6820:134a:b0:6a3:c52b:b95a with SMTP id 006d021491bc7-6a3c52bbe58mr48636eaf.29.1783954520268;
        Mon, 13 Jul 2026 07:55:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:55:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:48 +0530
Subject: [PATCH v7 10/10] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-10-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54fc59 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: 9IcG2QUsJ38uyRuN4kuxl47fEEvNHos4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXxCA2jhDu/g04
 kkxnOIakXeloUKTAYE2Il5Efg37WeYUkUkcczQAl6xHYxFVxvrQo49RPlyzEvi3ZOGiRxhoOgtV
 zp2ijkvKmZ7P3TBf0ZgNNdDHhZ1BwGU=
X-Proofpoint-GUID: 9IcG2QUsJ38uyRuN4kuxl47fEEvNHos4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX2VL91VITFq5l
 Ny6x8mk2SzqLYe1uHn/ZyeSHX9Ds16tznFpD7wz6xrVEYB88zTDEOrfrQptCOCCRbijrC7IlUQN
 4GnCvw75RLobV14FB38URJfe5UUZJKfsqyuz/NqbhLysjRlqile8aIs4pJzjERWXfODZGskZ01A
 9X71y2eJWY9tKGg5H3Hf+ihW+N0hcKCQr+4kifV7P1efLFogbtr52C0xyTkZX5rdc6Hb1cZ+Zwi
 Qqpg/73dHNQQBAJXepGcD1FXpKilMM9V1T0f5WLPZJ8qIphHoW9RjZKJWW1bqlMKdA7v+zFvuSi
 f0YITR1Tfu5wCgSk/HxfCAut8MLrxwQYlJKZe06hSEsgjdi0RAIkrZHIJJN83uN4TLKU+grrKrh
 XZQ4Mewokpmd52PLZCpOfPEbVWu497NGFI5viUpvG2n+hryT5EDFlWRmwtPHVFQ2j9ObsyK7lhI
 2b/hWEr8ck5vkW7H8LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118816-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9698274CB8B

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..fed88a699fc264cc49e0bda79870a8dfb0b6c7f7 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1779,6 +1783,24 @@ aggre2_noc: interconnect@1700000 {
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2679,60 @@ mdss_dp0_out: endpoint {
 			};
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
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


