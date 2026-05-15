Return-Path: <linux-arm-msm+bounces-107814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPqPK0EEB2okqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:32:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BECCB54E82B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D6063092395
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69B847886E;
	Fri, 15 May 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwAdAifD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQF1p6c+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58D477994
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842617; cv=none; b=MiFzHzzBbrC7ll0KkgVDn6B9S3C/yrv3TuDcEzmUPUl8VW8GN2eUo6NoIt6zoCD81EC0ZSIS16C4veviJGJSehD6ngmEK3uWZNVE8Rv3MOokm1EboLREJ0siMkRYXOg3RKVUDDd6VApwejpixPsTuGnxuQktPheuqyazhc6jx/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842617; c=relaxed/simple;
	bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUzBBRvZ7UZIIQjvz0sizk1nbHcgS8O85ihtiT9qubHH+3rtMw2FVn7qi+Ke/XfQOet0xlrBqWvbTCQYGxXRGkoudA3x/eJIW3gB24d/9eKX/5AgQKpz7lvVAwo0JNQBj+MZkCXSEPhH/1TPeqAeGpKGnnvDRQtlCKA4NNIUAYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwAdAifD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQF1p6c+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5htJw3197820
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=; b=GwAdAifD+9bPCWTx
	+Fh3GzdYA1KbFgdnK2XSqJ+nQy3fIl9GAScmzpyKQiHgELlaqdJpCjVQTWF/dB2j
	Y/URTYstjwZqNI7AbAzzpEMWYYXiFXKDtGk1mtjeKEUBY5yP+h3Cf5xIeTgFBc/6
	qASsDZ8HGLZLA9IYrRZVrcRpfih6MuD1wt4pTVglBND4iREAPlrNKldxoPuVYztj
	98pxcXWI+KZM2fnGKyOADNN7nTxYx3cpVUlYxK94hy36teMMc9RJ7HYO/2gjxNuY
	GKaBbo8tBMjQMCyiP8Mz1BgC+QQJ89beu4ajIFDVr2pV3n+Jz+hPtf8JO4MpBqjx
	ze76vw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qax6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5162ee45a77so62339241cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842615; x=1779447415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=bQF1p6c+X6JZUYn30zD6S89+DYYj2VuOSigyUReXyPl9fpwsoIb+lfgT7ikk/W7Cok
         7gkNRPZszj37uA8LJhPdzH6mKzZx5LQtKl1VJdnRbUcg/nI7iQrH3RQQ/LU1lE33GMPJ
         7F2wqKZ6JFiw/lNHwLDeBhZONeHg5PG6c0IEEuJaOOWjRbc4aHolxXv2ujpIuTqFmVMQ
         U5C7R0O5axOOGQxqBGJwj/deWkKdGgRpNyo29Jy+jZAgvTPorXfLWNvXPqhT/nDUxLfC
         vBTjiJ0OevoA6H3dLF5FGgDc74r3iLJLeT1C4hWaey+4Vbg/imJH+xmAUMhhRUZTnPNl
         AZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842615; x=1779447415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=L4j8r4A6SUZBzaE3gTreT2Dft4m5iE1eCoN4IpLiekS/Tr7WTBjV1+ptd8yFuncDkW
         OzN0TySnhRONiu4jVHxi4fdnwxrhvd50sKLcWOpp0/XKBpipJCXTuh4CtdLE1/i/ExuW
         KIFMCW9edHsNHE+4NYbdK2y+bhoqoFIkVxGvhvz/LW2wHi479vcSjorIemwo4uPeHSSK
         RSFPo7lbW2NxokCpzC5YI25y+AsBlrm+3Em4jihgLmDKartCBDeRmyUeeeZj+7Jk0xDa
         rG4MypbLup91243UHk3mDkpH5ZWj+MWzRbNXiUWUmeJv0TlwpziCziiv3a8Fa6w8jHmj
         vFIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9igLU0M+Gr7gWrzP1Jp50f+npZRm/C4DK3PKQsaFGJYZ0mdyljbcRWfSi0DoMX5jZGwsWKd9FA6XgXoo4h@vger.kernel.org
X-Gm-Message-State: AOJu0YyadmC/S6t/bWJZGFuv4le9+VgX+5FD6BFI2lQ8Upky706V4ubF
	7QMD28B2xLPS4h9YI6ei0Q9JxvBpPoN9waSWHtdQWuy5pqF8rtCm0bpHPd2d9mm1pJ78FJF6bug
	Ns0slOhyDG1kND16mB/IYsW6SHDSheYpyDXj5D0FqMHAJxXnqSp2FoXKUkqgG8ZVi5Eud
X-Gm-Gg: Acq92OHZuG23wKCYF1pwb60VxYGm1tIllZNchXeDIGNIb/TgkyM7hZ18FFWZN8Vc28p
	O96PmwElx8ZGBD1Z+m95C4uCVRlJdNXuvU+DKQN1aJlEwfRFEn8LcmWsnkgILb9RktJslRz5brM
	Rb3rTTx13Md/fASJm0wOuL9KsnTE0OItclw7vNgf1FoJuF1IfXhoQ8aAKYl/ONWZ5IL5DhymowP
	gdwSrgGUldcgS/LMP1o9qKG++0quw4uy7UFjKEWKnPZk+/kdcnaNsGg7zhy6wmT+jEml5G4O6b8
	FLAD/fi3ZmsXi0VbhzEOiZ/zyRTzB9nGchG1IK0eS8yFQVOXaDgvP1WAFsNZJoJS8d5T6e6xhZ8
	kymqtnkwi2s8nCdgQdpMf6tCEXa76zxAXy7ilCb5HuUeD/3cEzqyNYSYw9P5hb9pUyqY91mJkgY
	XjHKluiHIii65iSbAjaFprQzy3pk/wmz1L4MY=
X-Received: by 2002:ac8:7d94:0:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5165a1db10amr42448221cf.29.1778842614565;
        Fri, 15 May 2026 03:56:54 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5165a1db10amr42447731cf.29.1778842614043;
        Fri, 15 May 2026 03:56:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:36 +0300
Subject: [PATCH v7 2/6] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-2-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvw/FX3CuWW0ejlOjtX9H8DE4NiE/wxV8cng
 hLNKiSHMdiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78AAKCRCLPIo+Aiko
 1RsrB/92CPB13aS13KB+xx6m6iPMGGvSEltDGHMo/G4iW2GxVZIkHgVIghQzmcrny4Dx6Tp+YHE
 Pl1d+nSP8OrLdb7d0NJ5TqNjHHAJ9oQM2gDxFflthUAdx6iWEFdvt5hxsvN/jTA3MUnhMx85rg2
 fyYZUbiqv7q9jbpavclxzW5orgODzX0TdevQCEe4VP/7pS9bLdsurJ/+sDAPV2tqu1KrzkuBjxl
 nTB//XGovRxKsDSQm/r6KRUG1j/yPfSzQw8CPk4xjoqnLUJ9F8j4JtMx8enfm4dxQrXNaug7J/k
 rYA1KP5yeEMgrlEK/X3RgBNQUz+IeYOuKa8pZcGhRy+v3dNH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: xbQj0Dy1t24HhblNcxJJ_ic8D1HvnPF-
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06fbf7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX4OmcQUPWa87D
 AqZVYODoOUyGUMa8soOqzTJ9I9aQdrUd6exx0M8Io7lB7HSuTpzFgakvWsQ5nGlMnF8T4ycadhp
 9LXOJusnCUHXEmEg5m+rbNWD4/7kpZ2fBDaZ+9UHiZk2IeWooTEu9nkU+OPzdVrxWH4XhV2OtjX
 5sgS3yu9KXkTX4paNlhu+ppv9BKbC+E4y+OjBRS91UP5BQ6yDWnb4Dzhgyp1lTT0WrZ95TnkXeK
 snC5Gh2X9wb+9HUTX4VBgG1E0jEFn9jqN7DTjvgEKRkU8T8gfqGz/1ReKTQY4KGKvbXClRJbBjy
 MczoeHFltqIRh2UbfwXaaSBYwbb/tuXFlqtQjjqJlhI5fNoc/o4uQa8VdW0fcCF+hSPsG2ZdSaU
 7+3VUHlJ4wWRN+lqNyzIWu7h9jsX8ybD+VcQcwzVJ0cU2Yra8UM45xF16azDE85UfZplhm2koV2
 rNs2/QzUvgMHIxklxSg==
X-Proofpoint-ORIG-GUID: xbQj0Dy1t24HhblNcxJJ_ic8D1HvnPF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: BECCB54E82B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107814-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,85b00000:email,8c600000:email,86c00000:email,8bf00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..b09bc6f3b518 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -692,11 +692,6 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
-		pil_gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -712,6 +707,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_nsp1_mem: cdsp1-region@8c600000 {
 			reg = <0 0x8c600000 0 0x1e00000>;
 			no-map;

-- 
2.47.3


