Return-Path: <linux-arm-msm+bounces-116106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g51zO8CyRmpfbwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:49:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B06F6FC4DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:49:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CAsQPQal;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bdZM5Gmd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116106-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116106-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E6B631C41E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB4336A03A;
	Thu,  2 Jul 2026 18:34:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0239367F40
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:34:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017246; cv=none; b=VfrDApUYUUk+TrYVwzGZCKNbK3LDLyoHcG8z3MLElQ503dDfPV3K0cHPZ59nyXIH/FVVn36/vqrEYHCLaNdLeZ3fKmA4t6kp4WVJAYh6vYyy8Ham6OkaC90fIKpfx0OLpuD8gwDnpQUQpYtWSGGfZkAmUNYKrOrXLJD2hy2qknA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017246; c=relaxed/simple;
	bh=fxW+iu9BUPCZXeQFvC+j/ZitcPQfoyI6TpduPY3UXn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ho4u9h52ePKUoZmsyz6O+0CGanbvQl9fl/cKD8cDQjqz2bobagl7FXnNhMt3BnteKlxSVxOlDuWe9hDvqE2NQ8rr/fbBS71qQnWW1HGL11hMRker6ambjxTvRC65jRCsVwa0Djp2lKG4Rvp7rPRJf+BWxoYbZOi5+RiCxcJKI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAsQPQal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdZM5Gmd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUdEO866081
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=; b=CAsQPQalx6/1PUgN
	b99cC+MvSzQy5FFHztpz6bwVVE9BVwhW9bTAsjVF9U9N7bS6TbrBy9UaA7kIdXgW
	yHPlix60A/a6PxQubeJqQP8wuRJGLFwNUnqrvTDZ+6Wmu0iGNvR0Tx/tEZ3f/k2d
	Y0Q9+GTvw6s9hdDkY3dMLjNx8ucaDYbh4L/9gfSchXAM1UWUnrEHBTpmJUfw92tV
	nHsFZJbgxDtC3P4KSz1wowaUkBEoO6Ph6LmRGPkDshZjBc3rXGeXMLR7Bgnmu4gy
	6BtgAbzXMVJjq/yReZEG/MUa0LvOsV0tzu8PIgcy7ZJgGRCrGVY4X7PG/O9p7HjT
	J5JSkQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngrfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:34:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1233531a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017243; x=1783622043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=;
        b=bdZM5GmdLmNhFfQlIEWR0Ff5N6ovhPdlwOO0IgM2GHYu4RwLd2q4K3MtsezwAX3kdt
         KrmDFKYen7Ycdo+As/QY9iPNvPNGLoAEs75RNAwQG3yBOamA60O4CPAnXKxabCNuYZz0
         eTbKQqYW33h6wUDtOjfqF40k8A3XjZ9MEacvCPPsNNihrScPRUD+0fZJrHW4daw+04av
         GmND9o80+ull5tOzCUf2F3EIZjWC298aewx4bRpyAs2tHKsZbv1IqTznCy+f80UPflF0
         cPUYC1SJ0KNd7/JVLVUuPI2Alsr/TozbF2qO+hZUFuV63mloFED68HJHSC0DFZuSuRkS
         iSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017243; x=1783622043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=;
        b=Kg3iIviVZm/QmhFP0uKwVpewpCk8dQZxW57FRF0ND9sb+OOMtQrz48PFRbGCSgI1KF
         PvaFYu8vIgy5bOky2+RIQFvOAkzqvQX94SwnOkdyN4tZ4V8EaF73nZwbqOwtePirZ0s4
         Na2T5dvItdHBDYCALWzmKj0SX7MnFuTlF8KCfQrV7kyh3FCyThbe8pvq0ZaGpiyaeHWl
         W90x3M6L+WAEPid5gwmTpjsPL2gqQznJsL2udZTftiASzsMXFyLzsgr2db10s+VgT9TI
         UI2yUcnQ8gAdytDFnNc8DNxTsAQQCDnsuh78Mmq7lrq0AeZUKRI39/V3SL8uwmGHj/WH
         pgJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tLfJ7YoUgfRBnaTyg6aFxNukyBo6Or/w01dDNItBhvxDNA0Gh2NPMM4lLn4nKpLC7DITwAj3OJg7PwDCW@vger.kernel.org
X-Gm-Message-State: AOJu0YzxRcEhRJ+S2lcG1A0lKFtBHnmht5AWtrM4At/5f4iECVLgBFYo
	DO3WSuksyOybQRJp+953rE4BvU5KtrzFMLX37iPGCy2FXVkGSAuJRLTNB9kI9G1kVvqisXLjO1B
	/H2iQuidZyaNwgPz+/vtMJsblfjG1/9vJnx/neaDABsWfyU3arjUjtD6yuiHPT42fshbI
X-Gm-Gg: AfdE7cmmSwVNLDLY71w46LzMRPOOJaHR3dq8PWCcHLiILQtL2x68k2TTLvWZSnYwptS
	7dd96tl27BK4aTT2jRDiSvsaEpD40ek5RMj+Ybv+w872BtHBMJzmJn9Wkxiu4QW8Jt7IrvK+bU0
	P8BskSh7Egj1yA5uvgIYgOGNCIfj5G07+/n7ZMTlQJR978hEYLXRiUT0Oi3pQab1hSBUYyVA6XI
	kEYadV+CjBIpi1uFHgOEXbc87ihXP0YZ+qFe9GDoc1Jb/nPspcASCfdgRtvqfI9u+ohvlyzlOAA
	7Si8OZNfuQhh4d+sps841rLpWKmw967AvvGNWBaNQEDtuBCOQnXhwn8E+ZyhYf2GzSyE8iX2iEQ
	eGP/T8HmTM3l34xxu+kGGXeTqeBF3AWqYygstJWLJHg==
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr946311637.17.1783017242963;
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr946268637.17.1783017242451;
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:34 +0530
Subject: [PATCH v5 12/19] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: QVNmSkd4cpdG2WwdvgjlT9L_mmh-oDSI
X-Proofpoint-ORIG-GUID: QVNmSkd4cpdG2WwdvgjlT9L_mmh-oDSI
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46af1b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=au4WXa36JUhwBKN8UdYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX7GWDnPk9VeNZ
 095RqTPG+jg0fvdpKwpqTWtcWFA0IZRw4q3iAncnKU+bbR0hajuytB9y1PtjsCZkuLDIkVAuVjA
 wa73gMz7WniSGjlgKzOvntfj5oecNys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX5Ljqo4se6LNU
 hhuIQ9+g8t12i5WvpvcH+L6dsECD79CdBOt1xxKfgoJDwNM/rgEp1pEOicLWdOOZvVshUrxe+Dz
 kR0OfvNNQBIwzggLpxQMtLj3S41C/Zttoj8G4B6S0iFX/gh00WxVZSqtpu1pfWcEuzBDCEFkTiP
 tGCis+LfjdHGZXExvsVKS+uJZrVbWUIcZIi+10vFiKJvTzWT8KkSalsgRGpZ1UH4UiEDeBZ6wCm
 4X/dY2J+20o3AOzx8X1jwVYKFLYqB+2Kyd1agtUlR7tGV2re5JqVj3a9FTl6e31Tx22Jz5RFy1V
 I9lEIE+U9VoMfuapqfQMAZaGxnPcQjfm1oXxWUtKOVlIRzZdmRpZQDgCTN0d5TG2l4Xa4ar1Azx
 G69ylGpZ640yHQ/8Pp/7ti/r6yzQroJ1+4MbHhwK9QaXBLmUwx0DRRmcHAi1VX610oq0484+zHV
 FKfsJPdzeArYx11HpLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B06F6FC4DB

Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
clocks are kept always enabled by the GCC driver during probe.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 4e97a02d942ad23af561ec6ce1ba0a6f61bf5a69..f14b4620090efea139316ad833e034536caa5199 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -7,7 +7,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
@@ -385,16 +384,6 @@ static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
-		return ret;
-	}
-
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
 		return ret;

-- 
2.34.1


