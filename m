Return-Path: <linux-arm-msm+bounces-109408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ch7DOO0EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:56:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1925B9BDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5512E301D11C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E86381B0F;
	Fri, 22 May 2026 19:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oibm67GO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APD4/vuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0556E37D114
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479677; cv=none; b=rXG5kdRDFgfb+E/dDPQ7Rc+l906/NqfFe7hJKYfY3ZC8Dek/KhtvFtLRxbZe3qR7jMuVlNoExz29DHIueNJ3Ned56DIooir9sz3QU0qLucd5baUSD6moulKEELFSvAY5C8HfwIljUGG2Kd+pBAFrr4yeJ51Jkrs2DDQV5K/8cYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479677; c=relaxed/simple;
	bh=Qc3nZ3OcdnS1cPCaTe9FyxRpFxALJ2JgOgiN3fJelqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbhthQxB3pFF/jevbFxpAb3qsYqeQaijs7FZiwTidr8Fs0dfLIPTrE6FSXnZOdh1vQcXXwQYTFpm1iOmerdH/Iu3y1t5dj1efF50EO+tVwf9YwzjhEJqE7cJTYdccB0NFi4CXkOj14U6jObAu4An6pu13ZxJtouKKATxxMu+n7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oibm67GO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APD4/vuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0hjk3477048
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WJaC5/CErHJ
	2VUtX54RfJ1hB0iwTR636c4FlUn5aImo=; b=oibm67GOsp2o8QnAPQE2f3ngoCi
	36487Pr+GSwi9I3sDtig89ZG3rLbfpfrUeU77P9jfy/cY+XEztY0bFqGlqvcJhtK
	TGpvZFqkZYngfVFFGJ3YDw5PBdblaz2V2Ir4CanDTQF8I5Tu/tesf2LTjJjuutjc
	GvxERRwuSmtlv7ywDMtaoXYmkoNK2bH/s6mIiAnMwRFQ8eyf3QNRMOz9EMr+tVmd
	YjY+cqsAw8xkPmnh3hjfbrqwLZWTakMGUpkFpjuSWJuASC1J/tooF76e8yQ4FEwx
	iAm6iscP97QmB3UCgHDwFs05ulQ0kg3f/JlkpliAxv3aITY10Z+hXaqElKw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8t35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so78844695ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479675; x=1780084475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJaC5/CErHJ2VUtX54RfJ1hB0iwTR636c4FlUn5aImo=;
        b=APD4/vuQXlMfrGnCqPzSedwDoKE2FFAqwz0LOIFLQb4CBI0cKHzgMryKVs+1+pTS18
         dBMnWthng4Va2Jzbf7HpQgjO6iAI3FojsSupwpTGkI6T+Z08X0c/eD/eqxflbYQzM8IB
         Um3yeG2VYjsstjod3wqiBQwY2GDn0KYVxjuyK1VXEy2GtzIdD/eZJgG1o8vMfeY8i+b8
         092zPUFHeOkIIJJFRSW/YPvaENhwlOEel2AkLwEqajtCee+TJsoX41VWqqTdbdQe+Rln
         p4RO15EW4olYjNVuzOJPupuGvsh1zR/Js+MxO25BLFqrzE4z7jKoX1SFsSQ/P/Qds7rV
         EJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479675; x=1780084475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJaC5/CErHJ2VUtX54RfJ1hB0iwTR636c4FlUn5aImo=;
        b=j/dsaIjZoQUPQjbATYs1Wq0+pNsURnBUOATY6cZ79+x5PzDfdvgqR3kR9M3qA6IfWd
         Y0LDTaCzDyqy3CN5RRok827CI2KB6/xbZ6cy3B6UNKFG7JKm90wU0hAgNyGMmrDlTxTw
         BLuBdOhXbHHnFeXeC82EuPbsr+my1QfufLaOrG8q0uVF5BzwZTqsefr/J+f8D/G+Ka9/
         eZdX5zBfRQkmWHyyblISOQ93qSYkUzFcG4vsMsNZU5ZIZRUeO9rRPIIRlmPbyPHXwrae
         rJ44EWZjpiuyalo323aU08aSXF2jaQAnDWcaxqVc0C9U6yCQ1lDKHfUzcTfC8HcmMljV
         cu6A==
X-Forwarded-Encrypted: i=1; AFNElJ/JD7X25mnJRwkuyNTWTN1SVr6GzRDtZDHM6HLecJThqKStgswI8EMPX9CzLJAMTy1j8jAVJF+h7mrVR27j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf54vI6iubORa+6Q1FDHllEvKoPuaNFGP6I1wwN0tAIxV/9dKg
	wPguNqRQk+nSHdYLqP5miWkhfLL2N7tpAQQ8V2MGcT5Lb6dQk34deF+fKdK2B5oWxE5iuj6/+nO
	yITjNgrSXEADFVT/DO8igpd2G1rEDvlilkRHcjIkfLj7eGDXgWtnVGFOZXD4tQZ0PUD+s
X-Gm-Gg: Acq92OH/0n/6gzHLs8iwjDg7hf2emxI9y+fdlB51S/BBPAyh9B48ewjt3t8jGvC9qjM
	rHLJr6bZU35TnYw/LgnzMZyhK6t05KmQLj/qdie5e/r91pCnOfiPezk1iL4G39sV7a1FBT1vTrs
	7l968O8DPbE4r4+7F3NkaJLssEsIQrD39SfbcxU+85UIjctl4Ogbhig9K3uhbRgqQpXKXL15x1S
	ldGxzfmr1w6JoTYLh7Jh03d7o9YHmJD3Wq2ZK0BdZyC6Ufb/9qcxCsTjoanx+51LPPQOMcZlh21
	dhH4uxHR5UHhZBbJAUJZqYQfmkhPxnjIVm0XMgFF4kTRSoFvq85V3VOLcb67kdHcWut+ZfBMYlx
	trtJr8wwNXhfAmFcs4G/4PZyN88ySBeDc5z9dWqXrT/p7AN45tbittx2Huws=
X-Received: by 2002:a17:903:17cc:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2beb0722d9amr56947775ad.10.1779479674668;
        Fri, 22 May 2026 12:54:34 -0700 (PDT)
X-Received: by 2002:a17:903:17cc:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2beb0722d9amr56947525ad.10.1779479674156;
        Fri, 22 May 2026 12:54:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 08/18] arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:19:59 +0530
Message-ID: <20260522195009.2961022-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b47b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cce3eo5V9lAC2CK9kT8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YB5sf5cOjSyRaEa-d-fLjnTnUWTPXJ7S
X-Proofpoint-GUID: YB5sf5cOjSyRaEa-d-fLjnTnUWTPXJ7S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX1On2ZJURXeL7
 WtAZ1slWvXlWteTefnuKRKnT8jboA3vuADnLuJHxhWnXcu6tiZDRaTQk8Mev8wmyLxnzGIZ5cMe
 WTN9mOq6D1aeUcI5BSMZuyPa6yfyUZbeYsMgTjs0nYXpSM0On4lyjY3LBIQyLsmC7ncsJQeJV76
 APLDLk8NItV6XSOU/XaV/pbmB7mIgoMB3+pequp/YEb3FJZMtecear9daw+/CEb0BrFvJ/+UNPe
 lAJ56MgivICv/9vV0exmVm+1p6Uw0tWjd8HYeZe9wmuJjfnZE7u6j1DyReGf2opdeB0PpJM6x+f
 s/t7OuJkkGnFDeBUt9/z4sJJF35ewJGe/fqhxBuZAU5C8nU5w5fo0IlgsyGnHiwohMQLUHGqxlA
 70MZSwSQPtY6e4UxB0qjJvWN9b5FVd/WN/yN/i1F+i+WUWPvKwok5dvU/9qaKCgy4UnCA9oJ49J
 jFppxhHbcu5BbKYfEmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109408-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,94c:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,1c:email,146d8000:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E1925B9BDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..b408ad9c0844 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -634,6 +634,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-qcs8300", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7150,6 +7151,10 @@ sram: sram@146d8000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


