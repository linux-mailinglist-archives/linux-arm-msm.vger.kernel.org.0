Return-Path: <linux-arm-msm+bounces-107799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKGhGW0CB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:24:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030354E594
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E38030BD7E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3785F47887F;
	Fri, 15 May 2026 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuWfEiHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihPW5uO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ADA47884D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842086; cv=none; b=tLNSmmvHNK3zUFpP92qAQcSWXRfNLvyfa4k4gEJMrZess6WhDWfvX1zmpum+T2wD8D1GE/gZZuswZXp1sdZY+VBCI55ABvcmiEieDyoPwtJxaGy/9oqB05JptZexLC5V3CxNoAbooFCRtJV15RX7U0t7xu8jzwv0Ns9SgNvKLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842086; c=relaxed/simple;
	bh=+XnnaCjx3RG6qRrENjsVEcqRroWYclHZQYSm4z4YbGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+Qh0zqQT4uNCJRBM4fWylYGJw+qjUsDmkAK4onPtiJdyUDL9G3Xri/zJqcz62pA8z/EDH3Hj0nZ4X5gYYhPmFZQwCc6EqgCpCThgvJxVwOBrIsKfQJUfwYGzY2tvop/G8n0f/pBlTWZ8B8VkLT9HHikm3iiHvgYiMNsFLWyRps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuWfEiHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihPW5uO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4pu7c654942
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=; b=nuWfEiHN9t1HIMzE
	Psj3+VuTIp+gwIku0JfF21Nih3+fXQGYx55Mvfh2QcD4GQ4ye7jQPowZ0QltrWYE
	DhRNqOJqy3unjAfgUVwArjphV0hhOC8GzZaLIZqlox2KNDk56zwwlaLZbPLD2FJp
	lWo/WLF+Zkrmwd8lG+ranrSewEG7Ol+SqxHzkLl3v+SDn2WgLjacxNzsJixGEVtb
	/GD/OVgK0Geg79u5j9sFUrB1KgNQpaXsGMJVupt2HmGJylpS5pjYUJIofFbPPZ3/
	030Df6Tqxylqilb9aHuzCp42++A7oVXDWDGxgU2QOb7Q6TiOfi1wIoJdFKMTv+He
	+1RmXg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pty4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:48:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8024fc7032so4772484a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842084; x=1779446884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=;
        b=ihPW5uO8fJr1oiODknlAnohN6YyRML2heuWl+IQU+ZHIUr+7ijUZK5CGn3XDEFM4M4
         HvD7Sb+RLlNrqN52fzlyWgmnt38LPzuCQpoO4F30O9PIsoGyeTvRFG/VtjtD9ZwBs6au
         CIm1qwR1EPUqUSXp9+OOFHw+zrLdnPhC0pAFoKez4UMeSyf7kIt5UvNi9yf6/xTXC20M
         ii22qmTb6njtgrBhXnMomEqfa4ReZxv3278AqGXGlKKyJBsdUkg+0G8LvoihasVRApt/
         wzRQTDdl8AW8pYgwcH+p3cp0uSrAPLjljQ72DlH/h1sIttngxmGkbis5fb+Su9jsk3pP
         HLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842084; x=1779446884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=;
        b=mdnPHl06ipimbwdjU9i+N+/uIddP6vopmfuAK2gx+RLsGr7t3aIUJ+auooMPltdJD8
         7b3ZNNGnhZkkwdWItWId825Me/TfmM/iBxhsbcH+F5crkIvTONYuhZ/30PEgFYtnppSP
         KZ8ogVkjvt8f9N75vUb8ZIgeQJbWilzxvHu4CIujiqTcUXUiGfltvtNh8IGePdu6qB+f
         JcfKWrVDGzg6Cfeg3vgB79Xgo4oVcyEFqxVx48wXg3/atVWYSH0dx2C9fpt5Va+Mqcqt
         HpdLED2BJglNhCjRqQOAHzUF16v5/4Vpuyul4M3wN6NNkw0/qfiQQ5WJX9yHVhdfq7SQ
         WMTQ==
X-Gm-Message-State: AOJu0YwrTV8cgyyaDjUiDwOnDiSdWC9Pn1x3f9fFReYupMCCE1FdZEI8
	BS/JIjRPYiZ8nPcyTKHXxq9OZLvLDwCltdkwAuVeatktcv2kNsdr6rdK2005BX8zItyK/TvCJs5
	NDdctL6Z9QUv7FRETEVHBcjEjCnyeh4NQbrl/aJ9WWyKHFUGRODCl+CRYlQ2FB1yxsHEC
X-Gm-Gg: Acq92OFf+wqQcQ0ihAy7DfUnB9Cpdu7CUSUMXbC1SZkV9HiuQUSd+Lv9LKYhKOVuK3b
	jO8Fp8uBnXME2sIHN64cjDvlEqQ2dE0RHyTHz36EacKZ9Qj+OSsexQXfZjTHxuvkfIuic/qu5Jk
	kaFMiUx7yfY4DO9G3gsK010pGEHg+3thb5X0j+gv3SwkmirvXdEkluBnv28NfLpjkbgslNg2Vz1
	/0RxHDYL4QYG46kzb/FuFIjCDSyBeqqgYlUbjT/jNp9HZeen+7x6cDlnwOlTfCo8aBGXyxlxPOY
	qY3Hx7jfA1uA1O/Swg0nfbgqwOaiPNJBjLhcnDfvGPczW3Gs7PhUm6hdI8Z/Lm5FFBcW4YhmKfW
	0F4ZNBz4FmHEVWZogN9sU4J6sD7KMuJJJlIpznQBDHJi9f65U/+9037NLWJEcCfZpTgdU2A6i5e
	fwyWqIaE8A5tmqLapaYbs6CKjI7f/d1EbYSwROOKLoZc/aekuEKUmXNwScR9w8eg==
X-Received: by 2002:a05:6a21:3298:b0:3aa:f9cb:d436 with SMTP id adf61e73a8af0-3b22e67bb98mr3744689637.3.1778842083574;
        Fri, 15 May 2026 03:48:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:3298:b0:3aa:f9cb:d436 with SMTP id adf61e73a8af0-3b22e67bb98mr3744662637.3.1778842083082;
        Fri, 15 May 2026 03:48:03 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:48:02 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:44 +0530
Subject: [PATCH 3/5] dt-bindings: usb: qcom,dwc3: Add ipq5210 to USB DWC3
 bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-3-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: YYh-_25_S6G_Vw1t7g5BSv8EqJydCp9I
X-Proofpoint-ORIG-GUID: YYh-_25_S6G_Vw1t7g5BSv8EqJydCp9I
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06f9e4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EcSGSXt-TE7RrzoSa2cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX+zYU7qxEIThT
 wvm3ibhjPBAknyCfMqPw7774f21+lECSl7DcN+rv2ZBLpO5zy8tbznJnK3T5ydGKyT/8OHqkXL0
 CuP+w/0Nqx/14fgPbIVu/4cD2KZYRy2flU47+fWgNuZinPZUaBWoX19eyqnuaqzy8aMlVsiul4I
 D5WEUkHGKNb/Vv8EgdWvtHOkHlFB4ouacG34qZBMbWl1/0nn07nqPotqitK0/mFhe3nih13+fwc
 JSBtO7SjDMMeENWY1MeJrglP9nofpz4yF85gKlcgrxuMw7Ywg7BG4Rz5iQzdaP9t+MILIn9vKXA
 jNfGi9oEs1KKgmc+soaKaNS4fGoeR+O6aButSiAPLbJKL5M73RX+IQ0aY0U4VcHoXHpHB2VReCX
 SABMzUqixlfD6KM66DRVP4xbTL9gSZ/eX5iF5SOjBtbRWEEfcU9/+8rXgbGmXtwY5qOa0vgJETe
 nwfitVf02XoOAW6Oinw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 6030354E594
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107799-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Update dt-bindings to add ipq5210 to USB DWC3 controller list.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a7f58114c02e..f8e0819be894 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
+          - qcom,ipq5210-dwc3
           - qcom,ipq5332-dwc3
           - qcom,ipq5424-dwc3
           - qcom,ipq6018-dwc3

-- 
2.34.1


