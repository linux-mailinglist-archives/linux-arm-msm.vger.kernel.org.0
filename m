Return-Path: <linux-arm-msm+bounces-114575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OcbvMVCSPWrH4AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:40:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 897536C88F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:40:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BR1gbFcC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LJRKs0ta;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114575-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114575-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84AFE306D886
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 20:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAF437188A;
	Thu, 25 Jun 2026 20:39:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53FC369204
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419965; cv=none; b=OVpEeyl+11ASuY+89baEFyMdxIspALEBaCqtYBuYAZOz0rooNwH1qN9Nc2HbrVoSmnk2FAo7jAScwzlY/g3uzEZA5OjT+sY9+XgWa5ulGODFHMeW3q0ICpQJzMt0kyTSX3YXl5WXtXbnCB4HqtFxJANVg6wo2x2NSylErYFujro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419965; c=relaxed/simple;
	bh=g/vNPd8VALc/K45pOjMR098nGh6TjliGmsMVyh6ua4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8PtgzNEo6YuKe/tzdOsvIBBr+j4HFPwcvUDSuE7dYLdCk7l/37hlNUU91Zoy2jaFuF9nF0GleifnbR0HZbv7hWZORoI1SdkWMekKuQRLNPdKssuFlB8RcndAoq9AC4ilihW4gN0cpiyRXZSrHjlAtbvFeuSvxxx1vB0eikmUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BR1gbFcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJRKs0ta; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFdkaY2510315
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=; b=BR1gbFcCoONrG3B1
	D/iYK0DQp6U0IJmGuVVJGU91UTNYEQTQOl3szD+9kFJUT7jdt8L0bq2lpc/Ty3KM
	NNuoRvXJOhPqqD6nOONRbycKW/6yvymWWrdQ0SoTbblKwhwy5yoDoCOsNwHidhev
	JgvjRqQqVzCNq8iKkhIotPiTyt69h1t1HYyL2FHqnnj7M2vQEiDtSzCkYB4qV5Wv
	QlJXIJnkKSHRXhKGVZgKLdIegC55Ce8oii9kQacmNBE6ycsKGgR05/81Tn8dj5LX
	8G2ytMGxQPADlm1H5Im9UHW5jd6lagMNrwNCTjqgIkKUSYNDloEeI2cNTo76rLg3
	ZWhHXQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16jg9dw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139553dd8acso42930c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782419956; x=1783024756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=;
        b=LJRKs0tadOXYXfdTlPcRKCpDmUsw59W74BEqnw5uBVJ+jru5acsAmmRGgSwgk6tc/5
         1enlo7TqgOKsm+ZAvQ8EfdVvTKvULgCfaZtVU96tStuTQrxLsu7g59ZoMw8NHeF/e801
         0xNRKB7OwCsWN9XY/8bUFmYowad3OWBjELWTxRNeI7CTV8lsHBMPOrPcpLSR4oKUNhfL
         EHCNbUSwAWmtkDf9j3vT10cHUCRo5s9n+nYdm4gefflP0PXbUbVrVHt9j772bfnN29hN
         Zr11NuunywSyXXUfX7B8i5Cgxy8WTMhcN8poX1QDtBeGqw8a2k4afRm1HbedJfvo0Vfj
         J5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419956; x=1783024756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=;
        b=YzByj6HI4yBNU9avpUcziwXuhME1Z3W6RkdktM9zwUounpvB0YDYiVf2CNjGxekk3q
         9lr9vmFm5al628ZAkAYevx3uLr/LkmGueCZei/cbSuxKA95C7a2afFk0/7oEqhDfaZtz
         eq6oJ2YH599UBw2DbB44Wn6bW3LjOu5VFPd2MkYbrMUZmbfVeDKrnS5fRU8bocSSar6Q
         8w8GFiq00aZEnKeBp+4vnq/2BGr7S+DJoJUmy5PCTg/NpYAuJM+8smSyh+Cbz7vbaP3C
         kgrO5t1qWxQxJIpX4WM8Im2o4RViaNfwftxrziXmNezMVazU3hN7NzsaWcLyvaTs4hCL
         n//A==
X-Gm-Message-State: AOJu0YzR9htPkSbpbQspYDudREurSEcoNhWC1078b27S28nHxAzMM+oc
	D2UF3ZOiPxr5Ctq+F8s2Lr1aXgEK85WIOKIG2xsWWYK0YMMmsIwrEnkYLs5CYGZcaxff9zJHTb3
	6cV4fjKZNTkxVO80Y0BzcBvGkwHGrhhoOhYYEwurdWpJd8b5CyZect92ajTKuNM/iColguuPmhX
	6F
X-Gm-Gg: AfdE7cmm+76jIjv8PDmYQEfNN9o2fdpzf2IGc1qeAdwjIepOkReKAcFBKoy4GIlRVFC
	47j9GFleK3hSrYQnz/GXnQ+i1dMV/IDPmNuumYVldPJ8UsMGyWm8UN3U2rURM93vdiUr5HOpjAc
	FVn0iG8Yud8D1OCCGW4ARi9TYpNWK0wfaif3UNBbjB2V1Le7HsN+THDz5E5/5Tesm7AuEwG9AqA
	zi9nGdmYiDFeOcSrp16uYev3J71yCTssE6rAca6xqptGD7dat8sDJ8EVREndxT/Fugij1WWyIeT
	Z3qe9wQrDQWFk2u9GGqYs/b/BSQIzqQmPkx8erD2DEvD/AdFJE7rgg2lG5DbcUeJyy7KHFfWH0R
	xUKlZM6EcjGpIJo0Uebc0yC+SfyPy7349oafAwxP6LqyolB22
X-Received: by 2002:a05:7022:78c:b0:137:ef8d:a58 with SMTP id a92af1059eb24-139db9ed769mr3336986c88.3.1782419956276;
        Thu, 25 Jun 2026 13:39:16 -0700 (PDT)
X-Received: by 2002:a05:7022:78c:b0:137:ef8d:a58 with SMTP id a92af1059eb24-139db9ed769mr3336968c88.3.1782419955764;
        Thu, 25 Jun 2026 13:39:15 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8ddcd34sm10858623c88.0.2026.06.25.13.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:39:15 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 20:38:59 +0000
Subject: [PATCH v4 2/2] PCI: qcom: Add support for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-hawi-pcie-v4-2-1a578603cd86@oss.qualcomm.com>
References: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
In-Reply-To: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782419953; l=919;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=g/vNPd8VALc/K45pOjMR098nGh6TjliGmsMVyh6ua4k=;
 b=A5Mue3yAIOcauVRSNX3v/Fjj30fGyHV4HsRl3sIcSaEdE3H5M6nJ4GPlLFS4AsOu4jserBaMh
 s+YYM1hLwR9A04rhKJdiJPPaxO7HaDATRAkSei2N8owi5gvOSlZaBTy
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfXzFQBN8iMxEgq
 iqlZxy0t2KsFa7pZJQv7SZjVdVVzg0g0JCmr2DaIuHfXv/LeQrSCNUzzEbuJ3MMeJRfT8ebHdf2
 NLYo7tsGUrb6FhbyPsXbbTaFTI7rO79Wzoh4QoOUpZ2VmPjx1YHXTbPN0MqMFI4PLQoE9SJNvu4
 /dSw4xEnbDWsjlwHX54X0Mjro/t1LHewBsvHgTByq+iFE04Jme5MTWfc+4kvFYb61oAhXcNrkWl
 wiQqy3VIXqyyim3nfj46t80z23+ue3F9EaHYQgfdYUYXqjTbGFbr6RGvrlJoN7opIOt/iHpzcbI
 7VEePbM/9EIPER9S/p1Lwsveu5KnA3Mt5/zrcV+FAIwXbA1NCRpR7k31c6hgu63rECEZfsX9GgZ
 ulg6mHurMChaaPLsDJ4cjnQhVAxnfj0GK4SCcGYHhPv5L87vE5fIFB0yMaYUFDVS931l9wNR5JU
 eRxdWm+VfWvbAIrpgCw==
X-Proofpoint-ORIG-GUID: VDLR2ebBbGP0VsMVK88ox4BhtW6snwg6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX4kqpTOwjz7aX
 0qbi16yzsVGeXj4IXjr+8JrLU9ArsGt5nawGtRnXpXnnietkRXrXQCi8oEi+U5tyY1j0lap/sPg
 3O4TsV5ZKyjBSqn+gprDknXlAu/ZSA8=
X-Authority-Analysis: v=2.4 cv=daqwG3Xe c=1 sm=1 tr=0 ts=6a3d91f5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KdxOZhL9OB_EpBcCT-QA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: VDLR2ebBbGP0VsMVK88ox4BhtW6snwg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114575-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 897536C88F9

Add support for the Hawi platform which has two PCIe controllers: one
capable of Gen3 x2 operation and one capable of Gen4 x1 operation.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..89ae006fb6c3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2282,6 +2282,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1


