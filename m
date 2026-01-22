Return-Path: <linux-arm-msm+bounces-90176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMaCMW4EcmmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:05:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 428BA65B42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D96548A9D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CFA428821;
	Thu, 22 Jan 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gm/or7ba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmxiOyZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C7C426D05
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078995; cv=none; b=tyffCx7UNfIGDOnoc/Qq/zZd/TI/m8EpoT/bfWadBbO1t8D0hZI7j0gwgsGmYC7vwdd1rUMXKThZ4QpN108qLtvSuuWOpQMMX+yk739KI3NFKMhqKTqePGH6RJbwGSGFcaN2IoLWEgXANt2cfV5JCFooDhZnH6Wb+WtpN/XycZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078995; c=relaxed/simple;
	bh=B5r+Yo/9SDYaZ8RGuV/vWORvd/4+ohBj6uYfAX9/P04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufkPjcESi0ec+TT5D4mzqZU/gm4HIMkonXHpG9KgbPN/yOz7JO1pvEhawYEgjGbL0AmqYql9RIbc198s13k/eF3R8C3Nfnow6kujmgivw2C1Te/ns78sM4Ibf0k/l98AZu/yqgTg+W8v4Esc4HaF07nrW5xdy/PxLHvbmWS1gY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gm/or7ba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmxiOyZ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6JDTP3902202
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=; b=gm/or7banhIUobRb
	Y6U5/fD5tQyaKKoOKNDIikR9TuSeUcdS5/zEsW4Cg4AONlMgCGCT2Iuw3WOMyx3Z
	EYzP1GYMysOjd4njJpv14m1U1Wur6HCgurSIji9cMS6BC0D7y5lzWyG8pkfd4Sf4
	NN5jbdbEb4Clfqc07BxewBRNT3UCDH06ZcmAlAmshlhVlGGBWUKMX2xzq6r7lgzQ
	SaMsnj3AYr33shWK+6JbuWOd+VOvxqRUvQ4UeKfbL5qv/eH2LgeDN+3OeXcHmi5u
	GRCsehfWzXc53zzUXVIvXRsMuzIeAerg1Bt0paTLWBIDGd3PmTWQQVOa2hoocwrD
	NbBl4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khjhe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:49:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a241b5cdso138317785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078993; x=1769683793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=;
        b=ZmxiOyZ+djPLvgJqQ5NRJ7UohAyvrkkQhcBW73AkjmdFIbuORls+b1EhiHW3TGYSVV
         V3XfPx8qc1XsFvxis4iEq3cIVCFOtHqxNLeNSCXuPzYyi/xIU4QbnEwhOYkGI4TsfIDK
         oz8GElO/cMTzBdVHAlHUJhlfKOov8VNR+ioPGfwTklwt3m9ecUPthrKMXNLFIGPYwnD2
         99dq1N2zx7mXd91FGGMrRAMK7VmAsWlb58+fkTJKpd5PJ7OeJU3zgROZERyczNYf2vcF
         W6fAmbR/oUr7QPUdps/Diu70mnxgYG1uNH4nqKX7pNXxfWgKXnyIgY1KaIWVgz4MSFJA
         hqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078993; x=1769683793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=;
        b=XY3vOYqptk574WBuZ0ik4NV3YplLLaVsABRZC7S3tIY3cN8eHP2k4SPMTml4vaUqUM
         c7Jlo8buodbEyAAJr8f5o2mSae7C5UCuQWFKPgHEHj+pIs3lltquCtWFvUsetOPXRlwH
         BQNSmd5J/qhPDn6wNwCgI8qtPeFJbYNDnDqBSXCKsV2nyFRR4pC0+3zNDoliUgEuWixC
         981PwoXbeQjozfOLSYtFtp4Gz9SOEg6Twtf4dlr2XRjNFRnvU3vCPvy2d/HB6kGQr2bq
         FMaoWmmFWnBS2nsvN7A5eEXqY5S6NPN61TdNLcXp7qFY2OqZE35NilGX206oPh8j/RJS
         FFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtTNRn3y34kkUZGiVLYhlrIx3dUt4M0Df9hELcNjgko09amZDqDtUtnOVKdpRDe6OuVpFPJeeq5Z1cpZ28@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3cUYaKBTdjB7wd4EUCRwACrMHA/CLbV96uAsE47oi3TGe8my9
	wftksDmt7fra22tYHOEkQSmaU/ygzeUIH/+VCRJFn5/gWlsceQ8I1Xz4MaiCvg8zf9x8Sgp9Z3E
	qo+LmKMeI2kXGM6yS2y0crQlVi7tnG9NChb5B8fBzlKaNTjFxqBuKVGWtBQEMFcY+sObV
X-Gm-Gg: AZuq6aL4TZ0XjgBCp1y+WKc6REquRIRrS1UBZMWi6/ZC0ICjzqLYYeysxcUGB5Wr6gP
	4dwQvE82r84SkPkfl+Iy4TniiviT3dubwKQC3lW+RTC1QWXJpzp8gytUM/8YnxmgHQPR8yJahs2
	Vi53BaB12c63Dhr7T4UIh65W/I2keSOX8FnzyYedInwznZGZ3wQei1SXCL+jUy+L/sMdiIJUtbw
	YuSHJUWeRvpgTTBXIkX65HJISY/xhkwF9p/cUeDNkeZNLuEKiwwAaJS5Z/T3KzBJsSwgl3656mT
	99sAop5m/huJn+GQqO5bz42tDum7KCSD9/kOnzl3HxmvtWZdxQTUPFtI9T5EZq2koSaGUrr/stw
	iP4nc5fCYgfn/S82RPXFTOE9gxJpU84cAwlMvfpJk91TtSjP34pQr8skenKdeVsnwPmmhtXNqTc
	fD
X-Received: by 2002:a05:620a:4081:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8c6a66c8477mr2937671385a.5.1769078992841;
        Thu, 22 Jan 2026 02:49:52 -0800 (PST)
X-Received: by 2002:a05:620a:4081:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8c6a66c8477mr2937669385a.5.1769078992452;
        Thu, 22 Jan 2026 02:49:52 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:51 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:53 +0800
Subject: [PATCH v5 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-2-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=1158;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=B5r+Yo/9SDYaZ8RGuV/vWORvd/4+ohBj6uYfAX9/P04=;
 b=avAvsXrSsBDrajbBbVZwDtpKrzztRYABQg9Drw+sLt8tWOBjUKXYhyJd0Aj5Lwaih2O4gak5g
 XLgbYhMHt2gC2zhOC+GhVdTii6z7WSaE9dVle2ZyLXVggnaU0ACmWXT
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX3upD5G11Em1f
 WNLScAB6QQc63Vmc7gk1f0g6oVbN9N1MW1k8Wc/D2NkZRqHkQc5JdAEGwbdacQG5bqXCTfJsSyU
 tisF1Gu4c89/wmbAoZZBSHtD/O2BpnFk0NtTrE8awrV4CM33yzzvzmXcYVy43hAHWZXOtDA2VBG
 fhbh0er2bbNJeoaH/ZRTO67r3IvMvLH7cjyHaEFOXsrQ2pHAiRTdNwrPRtdKFrz8Y0QHn1sS/Oh
 8JtCaV8MHjPs/CJV5oZZ48ThzrwZ47E0ymk0UwgqYBqafXH+ocXgKqquyVXwBXg8Ws9rt1TeRDE
 A2nF47fUU+DC+YEjgj++MsPgaMpynljZG+8LMRQPwbTBLf0/iA60pVj3WkRwaS+oNIYBR9hNK3x
 lpo4oRuKdC4alEROf/xlPlKvrq9xXqtlFiel2PNlJ/5oJFjLSxSggVCs2NPTASPASFpU8vH4850
 6+n6D/G+rve7NClZWMA==
X-Proofpoint-ORIG-GUID: flEtFsnA2BLjTT1mlhcKSOji16o8ZVF7
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=697200d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MV-VTd0to6NmDFHxSyAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: flEtFsnA2BLjTT1mlhcKSOji16o8ZVF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 428BA65B42
X-Rspamd-Action: no action

Add the sm6150 CCI device string compatible.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c94551583d8deaabc 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -249,6 +250,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1


