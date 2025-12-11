Return-Path: <linux-arm-msm+bounces-85007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06445CB5273
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42F8E301767E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A364E2E7F0A;
	Thu, 11 Dec 2025 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixKuLNk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoLRz3Wp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29072E7F3F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765442718; cv=none; b=Rux1dXCNGkUGsczLTlNbAOK1+vE8E8nsPKqN7HDrAaqXmsiaVrI82GxJdfOeLxeR2z6o/nDYBGs5EQEjzu0FMMgKnkyHAO4qTDcNjWtoj/3p4UFabxHVPQLmk0695tyrAITDfqRKlokWL+l/ut7hgr3WdxX53PwcE/B9PuF1+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765442718; c=relaxed/simple;
	bh=tA7rSWjOklQFAL5MqnFh0aLMS/Kqq/abTUJ7uP0yas8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1DqFpaH3YllvuHecCHrEjxJO3obKPaFli6LvuQG2Pq87OqZDypbfR8YxhKu4kmnEI4reXO1VDKe9egzuTt13FdRXTG+4xDnZjG8C1axtFaqA/5FTSipZ8sYutaK+pT7qMhk27/haCkZmw39HTIWMfYQs431TTcFneTbLaF6Yd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixKuLNk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoLRz3Wp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB8gTDA224145
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEL68xIdbSe0Bko1W614HTi5iAYgcxCt/fdYmXWqPwI=; b=ixKuLNk+EwpSeOX5
	LyFaZXgjOg/2AUGyHAbhfaTv8886kJXnmZvrnqC03shnFIjob6RmFsL1vbzhfVwk
	QbRha2m20N0nKdWU8vPQEIUUQstmQQ5J7kzRxEjCgDuY3Z9HpguF2xMYUq1aFWfH
	PB6xzqY06BrhU/BWo+Khkl89qoeYCJFkDt7T0zX0T8B5U1T/UgnjDAkt+psv6NzH
	oe2vGPHSltsQMjVeY80Y/d4fqEjxOqo8RCXJVdyW/UQexaPJxR/TKgF2exwpMT5G
	Opt0CIkMZYq4HmtecdDOCFE8pW1O7lvfMLGFT6Wh5N5uRMH+RKSE074e1r4x8S0p
	XzPCww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvrvn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:45:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29806c42760so21908155ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765442714; x=1766047514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEL68xIdbSe0Bko1W614HTi5iAYgcxCt/fdYmXWqPwI=;
        b=BoLRz3WpnvmTV3dTZj8QHVt6AtWtrGLsjW5Zp3PZ1mnUfLcaI/t+nZNmhsU5iEOzEi
         2YWHrKPbxkaKJxTp9yMAeoDP1HXqOzvWLfAKyLx9Av61A3+mHJMRjkOiRIqmK5ByqRFO
         clkNk/NhlCn//h7AsLq6ui+BcmyPk2/nM2lHnFr4eMhJGi9/gb4sE93AkNg5TVYxoMZZ
         QpZLPYPRPSD7R1IS8rfofJPc7B4fLJZEc+hj0ggoTgRB5D9GZa6IcJmFuOExmu7vs7dI
         ddMLAYO1ZtNKVFHzwO6T0R7BgNbOrMcyr3Qow8qE7KQw3m5I2m4yl+u2YBWX1wv/XyGp
         Hwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765442714; x=1766047514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEL68xIdbSe0Bko1W614HTi5iAYgcxCt/fdYmXWqPwI=;
        b=LtiZoEt2RGXjYJvJOYcs4vYEOIaEYTqddJDNFQqeicQKIOnJXSvBywUQJbg9GbWmDO
         YxyWLIczgSuPhLfpJcbt1974+S7ZrY7vpI9bdfSuSDaowAZMQ6uTSfGGN5VI4A82jT3e
         /nNzyiFGiQRjYQRZzpXkK0t54xMZ6YL9bVwhZDJs61AXWzDN48n/sG/KPI1rdv7v4hao
         D3ipUVL/iLHtg08nGUCSbxZgbTx5WjeMXyYn/i5rzt8dIGwSSqMpMfNM80YinubKbm4A
         J+r3XdQIujo1xUK8M1A/a5cSUNtoWiZL9XkatOiYM3LJgNeOBzUf3iMU34x3pLuVZl6n
         wFlg==
X-Gm-Message-State: AOJu0YyayUJzMLMm5foRhHBAiWmAFd29KlzcfCWTCzueYXJwCHUNj766
	2hOdiEg/0roHKnuYkJd6hbg2Dp3x8cNY/sWzp4nmnJ9obtogneJmCW7GacqxF2y2ua02IrXToQJ
	jG7VhKKk/6Tw6+YaSaeoxjPcZ6bpQUxmAzRQxa2k2iDwEbORZdhedhmSP52gq/kGEUSnz
X-Gm-Gg: AY/fxX7bj72Ib7ke20TyDAPyW/AINKeVyT2dBCQXQ81FQXCpDAmxXAowd8v2vQd0r6C
	nyksSThMRCBm4AdIIQPIUV3abs5NeKdIwPordFVlNWP/Krc/XxiJgu20pDyGRSpjQSeDp8WITsI
	uWuOR6GX84jLW3eDJaF4775K07s6IkgoM9c5UhxAxIahS3fm3ptpk/XzJ1zMFXj9rKt6fspo8kO
	TExSKLtlULWTpHLGNlsjA2Jamrx2K2tHtVCYZiNFfheGNCbJp25GeHBdcIED7I6FdVYRMKMO6lJ
	m4ekfP36tCXDOxMNUt9xRKvCSJjiuN498l9Cj07iHXEapo4JsfZxt3Nq3z0lzK7RaA0aX7IS4sF
	+NfYDExUkiMLaNu5mk5KWh5SJ70A98jyMm6g=
X-Received: by 2002:a17:902:ea0e:b0:269:b6c8:4a4b with SMTP id d9443c01a7336-29ec22e3ec5mr63410885ad.6.1765442713819;
        Thu, 11 Dec 2025 00:45:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp4kxixkf3dMTYp+q5hmdYDoQGEfWePNeN9JyQ/GmyGZIOuW/9F2dIiOEh5raInjYU6VmalQ==
X-Received: by 2002:a17:902:ea0e:b0:269:b6c8:4a4b with SMTP id d9443c01a7336-29ec22e3ec5mr63410615ad.6.1765442713405;
        Thu, 11 Dec 2025 00:45:13 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea03fcd8sm17322105ad.74.2025.12.11.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:45:13 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:15:00 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e80100: add TRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-trng_dt_binding_x1e80100-v3-2-397fb3872ff1@oss.qualcomm.com>
References: <20251211-trng_dt_binding_x1e80100-v3-0-397fb3872ff1@oss.qualcomm.com>
In-Reply-To: <20251211-trng_dt_binding_x1e80100-v3-0-397fb3872ff1@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765442701; l=942;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=tA7rSWjOklQFAL5MqnFh0aLMS/Kqq/abTUJ7uP0yas8=;
 b=ctLXjztotMUXXNG4rKaeGt61oZhP2AMvLVdoQ8yYEDocdcmc3KxHujVGQWUi9/+XO/3nEh3Ae
 9r9h7fnLk4CDQWpiZTBG6LWlKYzQl4bCrn+g3vfUd4zJ/CG9HCv34f0
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA2NCBTYWx0ZWRfX0ouhrWcFTnD+
 bJyyMh47UFVLjy3qWDCYp5izqf34f/q8iZpwp86lNhNxiCFG0YUjSbo8rPkawvRh7a0sfz+kpvK
 QWQo9zt1KreJTSsbPeb8GOaSqkiOZjaEAuIMVv6oqIPWXbxEAmEfpvtdn5tbcYcT1hZ9vLP9sEe
 8Im71abfCKp4TZqS1NQbc1JOyEXjmTg8MzYC6pvkmfrkLSIE5GVcPmlmsEb+DmdXwGOSvtY92ng
 k5NP97JGKZhkwYfUh1eVtJLhuI8HeDygq3iVYZ7W43XHdp3zoi5CT8rO4zjz3Is93LEcrUqr0BD
 lL3mC0f1erzkZdDTdLLk7l7qRrdLd+BOIDVassGEh6RWbxMQ8MMDEB+J3qvTdoBYbStW9rl+aJn
 rJNrMPdHxt3upyTwfUSa2bpiW/axUQ==
X-Proofpoint-GUID: 5GFL3Z5Si2kXComxnUSdggUa6oCfadMX
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693a849a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=75mWG-WH9mJFzEGoRSkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 5GFL3Z5Si2kXComxnUSdggUa6oCfadMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110064

The x1e80100 SoC has a True Random Number Generator, add the node with
the correct compatible set.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..c17c02c347be 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3033,6 +3033,11 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,x1e80100-trng", "qcom,trng";
+			reg = <0x0 0x10c3000 0x0 0x1000>;
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,x1e80100-cnoc-main";
 			reg = <0 0x01500000 0 0x14400>;

-- 
2.25.1


