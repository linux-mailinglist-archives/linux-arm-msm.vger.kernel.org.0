Return-Path: <linux-arm-msm+bounces-107599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J0hIBvMBWocbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:20:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4C65423C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E24630A0EB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED9438A726;
	Thu, 14 May 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjAkdJfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6E4iOIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FCF3E0228
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764608; cv=none; b=egY3FTd7un4E0KwnMmbltHd03l4+aQn7W4tFryaUUUNvnoGgScwNM459xkmfdcy6JjN1/txSsImjmiDaq+Gt5KIgxZcVQ84EpFm4r5EP5B7tnKU1QPBKXXwhggjGUoNwDGOhF+ufAOGHNqG5RVwlBIw3+DDv5/OYLDfvTqjCW0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764608; c=relaxed/simple;
	bh=6dOmXBHnW6tKHtNL7QoMr6t8ob0iBTXb0NJR/FL3v/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UaDq+t4+B0H667lIz/ZpdvJQ1nA0ozQryAaO0EoV4VFROg/Wag9u7LZZhiS6tOZhmbSMS0iuVP0qJE4I2Yt1T5XX/KGaprHXgUXBB8NPX40ct7ddyL1sct/x6y4iqQomwBRpf7uiL0PzUx4v/rYXW32ZaHwZNVEfb9JQO2WXeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjAkdJfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6E4iOIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBes8V889752
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZBik4vQ6oskEkHVvAPfIRk0jhTzMgdfctoUOWCvyM4=; b=VjAkdJfO7YPLU2FN
	nFU9RIlUvBd37rwypzzACRGaZ+PUy0IGK5q1b/irX7Vdug5vcSLlE46f2xeLU8Wh
	b78lhEGr2B6VMMziJUA9bBjHVS7Uok6tG7l5SBS8zToPnCFgUAkwml0/VV61Diiz
	3fWfel9vChv7p/CmLxNAsg5MJg+dQ9ypPkgjIopVbLgvYFhDOQD0oiN68BUZahGZ
	d50jmw2BiOFS6SoOYtQ42fiqfZSoZsPsB/S8PoiSdEtJn6flbXmPC7Pw6DuuCa+u
	bDDZhjV13ixy5EyouA4MOgBfegAUOkP/qkfF31vVPSNKf+hRqaZ4OFP9bioLXt1/
	FnOBaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjky8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso5470986b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764605; x=1779369405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZBik4vQ6oskEkHVvAPfIRk0jhTzMgdfctoUOWCvyM4=;
        b=e6E4iOIZSwRuq1M8BBr7HYu5Z9DnXa8z8BVauRwlC8azRTRSjxJp/npZI+iHmZxuES
         40i8eXFIXvyHNlsymvYzRqmaGPoHF6R9KUBGloD3d2iPhC+DGqijrmf8MjUFxQaSXhJB
         MRxIxM04iMxPom2eYi+7HheTZMed92PXpL2dwZLcguDpGnOeixaNQwWPgczYelMdKA9J
         MvXGe5cHWsGQvvlju02BQxUMP/rSWUrzcDZS1aSZjfA27Xmdmq/JzJtFBj90ZcDCvKWi
         6vsU6jC0JNXZQsMAHYAbm5aDDKDEmBNMEuEeuytUGIESnkvjuJHEMvGMwWEXn71497ue
         GpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764605; x=1779369405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZBik4vQ6oskEkHVvAPfIRk0jhTzMgdfctoUOWCvyM4=;
        b=QKDKN/JofCXjNyjt5HhXyw5gVzXr159aIMdwFk3NkjWD/wXLL6FgUmXRA+ga1iobHV
         oW1+OeVeVe0bWKrDJaf0wFLGx5o9VCcdEC7qjJAY+hD0u8isRwY8VS/wX5z8W8VBDJif
         kni+/XU3wcFeCULth7KKKcXsXN/srR/atY34sM/rGceVrHn69IRnqtRkHYQ8C4WOeOh4
         11o6RE9ZUEvsFxNt31GyJfmsHUNzwzyOSVL7eJ5/4EpO1VnfmU4xUF8mROFJtjw5eQB5
         xMk7bZeQGRHBs2C8U232+BvNAyNShbl32xkY8RGLM1vE/RVwiO6Lw7X8KSurbT26yqiL
         u24w==
X-Gm-Message-State: AOJu0YwyEL7gSnZSKyKNGA1+DOqB8Pn+LLn1UtAkMaPtQEvqT74d414V
	pz3i+94htmbPrhSgkdCqtXI3rG1udcSORtzhklWDDbJq1ZJLE7FtJrPMCn7ilEPiTjQh0lLiw2P
	I5Qk3gmF7hXg3JtEsLzKkrHc7ucs3GuPeYuSvrlkkjRA2hQYCpFXi/+5hXe8AJwRftiO6hYbS3f
	QQ
X-Gm-Gg: Acq92OHJvV6a1yYkp7HgTlljU0Qy6zpiwVD857lfyV5ccryavYpR81GOibMdeJGvfSg
	ecvlrpGhvrSYNTSC0WdFO0ylxl3Mu+3UzLbwejxJ67gXAh8BlFN2MV0hxYIuNPQlsS3yGBUk8GE
	j30o0U5d63a8ULhb3yA3lnhUgcgzF6eKlccNHam6DDe06i4Gfm5iyRzZZWX+5AUks2wn1pIgsnG
	3ca8zANkgQR5BFUWfzOekyQeFX7wqSHF5JwN+Zytw4Xuyc9cd9gxkRE01u9NHfrXVEyX/bzjviY
	CaZfNJHMMOOLkjtKekKV7whJZy32niCj/8FY8OFWm6DBWBm/Ld7UBqEMuizHYYe/F7Hvbr/B0xB
	TvT74LsNuqmcsBJ1LZiQ1ZxNZVR432stJ/qc9eDs9BBziwrzmInpiFdC026q2cTQCEg==
X-Received: by 2002:a05:6a00:328f:b0:833:2398:cde2 with SMTP id d2e1a72fcca58-83f042f35b6mr8247226b3a.43.1778764604570;
        Thu, 14 May 2026 06:16:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:328f:b0:833:2398:cde2 with SMTP id d2e1a72fcca58-83f042f35b6mr8247184b3a.43.1778764604068;
        Thu, 14 May 2026 06:16:44 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm2666656b3a.43.2026.05.14.06.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:16:43 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:46:24 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Shikra TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-shikra_rng-v1-1-4ea721a1429a@oss.qualcomm.com>
References: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
In-Reply-To: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: Rm_Rbk0cZqOYZGJKgcCA8nM2LixJT9Ka
X-Proofpoint-ORIG-GUID: Rm_Rbk0cZqOYZGJKgcCA8nM2LixJT9Ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMyBTYWx0ZWRfX0Z4Nt/1OPV+T
 GJg0mJuiKag2SETryhHFTOLZTJUrMj6GUp8N7Ow8o02Ubk2RuMMlgpz+rAxiJMapHAbdHQ3EYcz
 /iGPcXJdyxa4kxXYypn5o7ITjkMrc8NNF1YQCgYsztJFpKkXqrVxHgYweh9O9YoReMh+PPoEG3i
 HvPUZf2xGkripCvm6uF9KS1Zzj5XCdGWNHLTPGvwKYEjt3cp9w83VAwemopEwbA8LtKPPGnDUbR
 UEv/Gk06TrCgXI6OiSTaAQzUKP6vPBCp0Lg4h7559ZDGv5Ed4zdKQVnVd83CK2Khr7mkAX9+ieu
 qO6BbgwmBy5jm4LfT0lLeqRAS5AsxbIJnjXqJoODDkWy2gWf0pODkxJw6eUUBLaopRGrfEOSuMH
 OLm1YNWtm5u9Hrfwcdw5GuS5YOMsWSvNmvD4W0pAels8TbhdvbXSJHWX1RccSvtzhS8VavFW4Lh
 +HvKShfJDIgdcci+6dQ==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a05cb3d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mVMjwrqIa5QPTF8STQQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140133
X-Rspamd-Queue-Id: CF4C65423C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107599-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document shikra compatible for the True Random Number Generator.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 498d6914135e..e2430280b2a3 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.34.1


