Return-Path: <linux-arm-msm+bounces-80952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E111C45DBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD4A84ED734
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4AD3043A2;
	Mon, 10 Nov 2025 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gY+zLt+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UM4zGycM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD2301010
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769478; cv=none; b=mz8Q/iLBanDbAzZGN1t7JCG5NRgZCbLQKqbRfQMJEuvcZFdu2HrZvItJ/NhdmfadSbBfxP2w4rYw/8II5gjDHKwUJmj4PJzqFEGGLOemsq8EzFrj1kCP/kJEDg9Zf1OyBebqHzbzy9JhOnZGnMSUqb3Qn+In75J9XlNXj0o7Kjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769478; c=relaxed/simple;
	bh=/4jBah1ZYFQOjplUTfS9BagKtVZTMkugu5wHS3+nU5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CirxA0JNDmvDqg7oTna/fcWzmTE6ePRLDjGzdRLxavqlYD8SrR8uD4CGeBddBbzqejcK/c4A8BUVHYwP9lfbbp6gH1pL5hkE96Qyb97iHh1n3j6/69wsWgYakGh1QVIBK3z9BPsDHmRzRFnb6q5+jau4mjdx1k7vseKPRce3RKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gY+zLt+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UM4zGycM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9BrKb2867907
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fxcXNLRndCS
	dBKrzLj3PXcds5y/egE2lHvpkckA8XEM=; b=gY+zLt+/QHUgTzNDk0lzHKH6596
	kxUOjSSeXyW0Ys0GxssliMGkKfaKUPquLFLFT4MJLISQpVzpGmTI8ioNqO3WY4uY
	bJAzBc6g0KvE51W5VMwnEyz83RdxQwG3eYA9445owA5odUvO/srUj7M9PYJRbu7O
	cMq/R/pqomTQ1m53LzdP9s5XomruskdovX9TQsylDf8qPtcpDdbd9JAGgj9QjTcO
	ei2MO0h2HgSOw7Dn9q0o0qpAR7C3f/7mtKdJR4yPUGzLgQ3WlTu0r49HetiVhc/H
	NjYwdxNCKFqs0PKQSe3COI5wYt5Os5S+cCAauCUhd42fVRHrDCDtzoiT0vQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7607j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:11:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956cdcdc17so36809055ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762769474; x=1763374274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxcXNLRndCSdBKrzLj3PXcds5y/egE2lHvpkckA8XEM=;
        b=UM4zGycMmJ3GP6112kihRMp5IlRPPraJwWu1sRPX0AE82cl1qWgxDsMfpbXalUCHBW
         7nOqh8aOXntsK1axHnQ+FxvJzxrQmGxEzj9qDcPC3n2vYLMpE5lBDSxG1823b9svzinn
         d1AANoyETKzVZhOWYkVOL1o5F6Nybm/mgOgfOa5aIYmmdTFNJUtgi0QzAxhkAXwm70Vg
         pnShVf/n2/KNXTzl5xK6PkKvDplsxh99zWXNdULVwJ/soBvtUSLWDJphv67bi/kgdE5c
         hcB72uaKeHH02n1lz/QiKY/ZDDOCkGyF2Tb+4tT4NY7QPSDUH9/FAE77vILjwRhxtqFl
         dYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769474; x=1763374274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxcXNLRndCSdBKrzLj3PXcds5y/egE2lHvpkckA8XEM=;
        b=hDTOWxxLCfHyjuoUb80mkphe5aMyGD4fTtO/KNEepLCXIY02rQ390OIobFKqwN7q2L
         b7kw8xu4PJzoa7XLK8Yv9MFxvwc1F3PP73VQOcpN3C17f+GpuZ2tg+mCU3lkLGf1Ohzl
         LIz3MuUpnXkVsEwPq+BOCmImmla63Us6Yq+2bzKUoK05kqhhocSzG64BoDaX2pfzoDQO
         +MHiumKDxxax3VxavGgH1Gw2UHpy8XJgnwixQ4yNxfr3KttONMSC8UOq+RzpQ6Pdo5ae
         o+4IVN9P6ab5vLDibQ2oDzNv3rze/+a7meOpf1Cn0IEXK9NIU7NBN3aIxu+35FCZqg6b
         4cLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEYBZWWKn5JZ7EZVStn0ZjFHYXB5eV7bPe3KysSfEpMKvtqtayD2Kn3Y5Xzrqg9y6AU1gpqChrQous1DEx@vger.kernel.org
X-Gm-Message-State: AOJu0YxY3kJHdoobjHdVGSwS6manHBohnJYuBosRDiT6QLgQzPDqxR48
	zcrvTg7YvJT674Z1girDzamh5w02jGa7wu1qoLwLJTjf3wchpJc2zTg/vj1OLjefKGaWY4hDLpM
	L6dlNUoHffCl733ke0sE3cxylb9waOvmxqa56B+BrMkjmpJdMWSgLzPFbeEfjBt8vXjlp
X-Gm-Gg: ASbGncvsNpPrtUlf8WKV3zrc4DozBS1a831PUxNnabI7/Ey8GTVuQB5weG/vygUpwhv
	fn86LIRGN8bHUp8iOvDu/FOnt+yGBBsvQ95ELIiLDMMAQRNeUbIGZcczQFKRR4OifNv22/Z+Fc+
	xejmhaKhSwDur4+ZRKhG6rf/7MU2Kh2sIn49+xcRsF3yk0Y3ukqIInzXrdnbdjQystSYUw3B7Fk
	67MD5IWGINuzTWhe0THsU48ivCfA7Ibr37KgbbXGMh3PQWdH2G+o7GbSkUsTg2hqkr/iOdl/umi
	xcTVQthvUf1P7piQH2PSaQbN4hxTmeFBeMsMZg0mHpawmpyWaL3FQnAYifAtKj2MPDt79hjq6wG
	AKaEIQ2iC0MzvBeLH8IhLLAFPX1SsHFO5
X-Received: by 2002:a17:902:d485:b0:295:28a4:f0b7 with SMTP id d9443c01a7336-297e571abdcmr104668585ad.60.1762769474084;
        Mon, 10 Nov 2025 02:11:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBi9O94fjJjAQcnZiBxSLEqKhzjpQEqnNAAKZJzH5cnIKsD+wOOBbY1vP06qkGJRhThmrAew==
X-Received: by 2002:a17:902:d485:b0:295:28a4:f0b7 with SMTP id d9443c01a7336-297e571abdcmr104667965ad.60.1762769473441;
        Mon, 10 Nov 2025 02:11:13 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297f2d9c971sm60180395ad.55.2025.11.10.02.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:11:13 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
Subject: [PATCH v1 2/4] pinctrl: qcom: msm: Fix potential deadlock in pinmux configuration
Date: Mon, 10 Nov 2025 15:40:41 +0530
Message-Id: <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GWGdDYLyxpglVZPNsG1qQ2DUR76LCAFy
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=6911ba42 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPkvY_wpCyZqdAZ5voYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA4OCBTYWx0ZWRfX7A0kwmWJ6PYw
 3LvduWlsz5RTLZ5yocSzwRM0w65g3NkvBB8bAaUBqJ52gCRbBRQ7gofmOCuIH3tRkT6JdgjJXOb
 9pCgUFJQajMWcnwasA+OH2ilI1PBeVtd51/0QUIKvu1haBzJPX4kP6pOfzngLEapHNn2oYGZdyD
 ElEsaMhDrN2FPd5X7AbJb4Bfxn2R7yhPCcgH3TyGTync8frRX4LgU3OCDG1UgDTyBj6LMJ9txe1
 +7qR1IIfB04J7mbF0h8CUadhsmeRHLwawPN1n3zDQgkB2/Lu/yLCOmlRpcdOTiQ2aNh4E8r3Oxl
 N2mn9OMXPCEyEJp6APuMipgS3DLh5g4oPjH4cSd9VLLwBCkOlMg4ZqY4I3bs7qRsDU2dA5xZo7V
 6gQAcWoBSXwfJpXz7leoMhihDXcrsQ==
X-Proofpoint-GUID: GWGdDYLyxpglVZPNsG1qQ2DUR76LCAFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100088

Replace disable_irq() with disable_irq_nosync() in msm_pinmux_set_mux()
to prevent potential deadlock when wakeup IRQ is triggered on the same
GPIO being reconfigured.

The issue occurs when a wakeup IRQ is triggered on a GPIO and the IRQ
handler attempts to reconfigure the same GPIO's pinmux. In this scenario,
msm_pinmux_set_mux() calls disable_irq() which waits for the currently
running IRQ handler to complete, creating a circular dependency that
results in deadlock.

Using disable_irq_nosync() avoids waiting for the IRQ handler to
complete, preventing the deadlock condition while still properly
disabling the interrupt during pinmux reconfiguration.

Suggested-by: Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 67525d542c5b..e99871b90ab9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -189,7 +189,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	 */
 	if (d && i != gpio_func &&
 	    !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
-		disable_irq(irq);
+		disable_irq_nosync(irq);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-- 
2.34.1


