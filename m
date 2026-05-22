Return-Path: <linux-arm-msm+bounces-109409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEgkIfy0EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:56:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4885B9C03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89130300E933
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FD637DAD2;
	Fri, 22 May 2026 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ps6vkapo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsBS0rHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AC3803D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479681; cv=none; b=f23zvwS5FRHYcB2ucsBm+QTvR7i9fCNMJYbQpBRHND8no3UExZaFgXI7xTJ2GwYTREHB45HNFSW6P3GbWsSaVhspjtuhrPBfG9/EM1mPHhNITGyeGHTT/rJQoQzrYKHOT5eV+Yda79GvRaAtuAq2qOJ2q4RyHh5CBbZ86FJW48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479681; c=relaxed/simple;
	bh=inmrcwAHWlNyHPjaFqgBLzw2MtnnZ1YMmIybancc4ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDzyk9ekBoMIbJCW5yKc7FMmy4HWPp4oMDUGjSLSakqbWlMzno8aMqxFzFsg4CIFwQIQrDy6WSocxRPucQ/EphEyohAlXpccx9cHV8Re1lDDrREnOBfaCsCnqUHIwIdILPsdMI+ICTRDzUx14HTFdtspVtftWcX/EmDe28NXZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ps6vkapo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsBS0rHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHFO6M3947594
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rPXJ5mdxZjg
	R/OiigPIU3sYJdeoapA6y9mpY1t0kQEg=; b=Ps6vkapoMZLzl/citYCWY4P441r
	FEWw0laBrTs4lMCHwEs+RcmGQwroRNk50Px/CdH2b4h+muCxGVWvlWujSZuSQ+Dm
	CelQY31qVa4AFSplk0sFKYBHV0gNWW3Y1U3tNyA0zFUpBYKm8EL1aiCmAkGVMeL8
	ovBwG8RXy2sFHpOL3pseNf1d61kZEVqMh52yeFpdJqJyr6zzgTjRp90k0K+0TIDh
	7soY6/6bf50+GrXXuEjPPyL15zM3aH5fH44kIN56SZeAqpg6VoHWMVV59QK1q4Fb
	ilBPbOvOTkXJ0ELs8idMALs1j36VnGfznlz/S+pkmIdG5YbsDP6A/fNa7kQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2nj7ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so124922485ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479679; x=1780084479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPXJ5mdxZjgR/OiigPIU3sYJdeoapA6y9mpY1t0kQEg=;
        b=VsBS0rHpIZOUm+yBEMQ6OUj/Z2qxia6e80BeTQQfFmgibO+eA4BJWvrGiK8mOZ2jbt
         O7NpWRf9r+6DR6mDFDYd1ZqbwVI75WWJRTMtiVjfBI0q9VUKzpJPYF4voJ1WMbBWOx6c
         WW7oF+sc1FUuw90QId+Yzq4mY97lACmfM2HCp54Kn/Po99ruaHci0D4nszrQ+eZaDBA5
         pkYdluXtN8SJeU021Q46cR7pB0sPKRpW1vBEXGY/Sz2pBNF4bGNdOZxG5ZiFdGXfQN//
         gSejybpcF3aVKhJIytOoXivT6YkALdB5zslV/CpmMKunWZLUxODIAtciQrLcjA16bIMl
         Nn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479679; x=1780084479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPXJ5mdxZjgR/OiigPIU3sYJdeoapA6y9mpY1t0kQEg=;
        b=mk/HmcIgDyI0V5uAoj8GsgBhwkuSIqEAGBNcimsBAcBzUGgnfaY3hMrTQp3AAIJKvt
         HUxBFO1NhbemOoJb6KH3/JRdyHv0Av1jqsQz9seSDTefh0m8s+ya5QWqw9beaJ+OBWFq
         WRnee2sslNb1G5AJgBonsHI6DCuN9nWh0FeyAo/eir1230adY7Aox1C3XTftDC0rq4d0
         iprtDmUXxw8ElIjbjyPI1bk2xMVL5RSwjdeVzOrBCLU0QLMzz13mYG/u8vQR6qyO3gyL
         CSevK0ZyNZl453AirZVcz3beBVlLqp2TjZA4lIa8Khg6ElhyirUjsTQYHhzMjsy45xXj
         OTKw==
X-Forwarded-Encrypted: i=1; AFNElJ/h0yAkHCm3ZNyeOKK+iXbboDeanU48jZGq7/hit0H+q+SXm6Psa0cXmQ9ldi/6X9HDsrKpgawXTAw4GExi@vger.kernel.org
X-Gm-Message-State: AOJu0YzOHdVZAE4p3pbsmK8jqEuDVocLzQNmMWaB3wY9XdOyEEaWcNAk
	A7VxszdFGhAc3aAvHunOdGTHlkt7e9SEQvDgGPy0Cy2U0WKgvs1m+XB/592tUyLVK8RbwYruAOi
	KQAmrhlQHribZPHzwCrYbT/q4CID4ZLjSuAAirWFVRfoWRdH42dQlmLDwvo4joSNqZGU8
X-Gm-Gg: Acq92OGaGaUzOp2W05xfVh+Nac2lajwOImUxbthchVWiLPzpm+Zvr4N0J9qIswGnyjp
	ZqWqCK/BWEBmp+dTnqqua3gEXGx5C8PTySRIzqhh0SpAhuryWDKTiLii2Z5K3uwlll6Z/tfUtVp
	fTAdZASxdHDN//EK4X3f82d0X9wiwDznud7KLSHQoyLKZ6TYYA0KZLvRjsXK9HNmryc31WiUbGB
	XPjzi22rIk7jldgKDBQIpkZ6wCKAkn45wlv9HnLtx/rTySRzrmZBk1jdLHfA3RbS1rBGcUgTvvE
	m+saHjspG6etLGkvWaG5VjFB3j1//27m4PRYExLfpX9Ad0n/K9eda6K0dKFYHoYckP1LO1P0fXt
	YIUWFNtPxdRM7xKS53bARjCQKlV1kdNuVdXSdWrsNRwR0mlZO
X-Received: by 2002:a17:902:ce8e:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2beb0381369mr55169115ad.14.1779479678625;
        Fri, 22 May 2026 12:54:38 -0700 (PDT)
X-Received: by 2002:a17:902:ce8e:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2beb0381369mr55168795ad.14.1779479678110;
        Fri, 22 May 2026 12:54:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 09/18] arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:00 +0530
Message-ID: <20260522195009.2961022-10-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a10b47f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7AAAc7QWiM0iNXn1Wb4A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: -DTZS2KyTDSDDaGXKqZNW-S2oNY3G0_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXwqa4WhQmLSxn
 nk/1P9N9kvvLVwjFYzHQWOQS8qMZhZfEZJ2KuiZQPJBjHJj0CBrdinA2i9D8HQo8XYBmQJ6sUm5
 /KoT3LEY2ezTGoY/Je6q2swhLMNl2Pg5Q8wGfamuYxtPiABv3eTyLeVsW4q/RQzzoNmzcGgXH6j
 k1eZN08LhuG1UDslMYBPN9+JcgGbDFjddJxO8CDV0bOij76MJH++W/ymYnUuiKLwy1J+hYhFEud
 /YlBtmw69E2hUrf8NowlCO8Dj+6qNFK4qwSNT2ytFXO4Rl4xPHz2rWnR04KvYRJa/rOpYWctwlA
 BH6Djy0xofkaH0Qspyl3rt9BkmYwSeIDCmiGkXaOUM+168nxxHLVEhaNmd8/hwnqkIBPDQcdyqJ
 2tFC7aufPCSkfkVnXiNtmfQoSO302Pb1bHEDQpdb+8eZVGKHVEIZ0fVehKp/J50TUWsGMvLixhK
 rNysklAWs94cbi8Hxuw==
X-Proofpoint-ORIG-GUID: -DTZS2KyTDSDDaGXKqZNW-S2oNY3G0_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109409-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,94c:email,1c:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	NEURAL_HAM(-0.00)[-0.986];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C4885B9C03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 952d4270d118..0c6ae3ff06fb 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -171,6 +171,7 @@ cluster_sleep_1: cluster-sleep-1 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-qdu1000", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -1369,6 +1370,10 @@ sram@14680000 {
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


