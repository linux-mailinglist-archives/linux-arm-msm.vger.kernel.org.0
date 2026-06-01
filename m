Return-Path: <linux-arm-msm+bounces-110654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL+LDDXCHWrPdQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:32:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D01623470
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A94E63043FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 17:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8367C3DE430;
	Mon,  1 Jun 2026 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkhQyHZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhRZKKgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF1188596
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335057; cv=none; b=s0RrNU6Zj4xItmL3RwIzVmI30YGVasG1yvYMal3lzJiAnzpjgyB/7ZQGYWi3iP14B8QcJ09kTnOulri4VIx14fM+lnEKZf7g4jF6ZAd3/wzxGXHdwMCF2ElvQ0AtFawA9SIeYMhGD7TsbH7lgtOo+RxYpAUo8DHlicOS+gOnBww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335057; c=relaxed/simple;
	bh=xeSQHPitzN8ohDKs18l6esrdselqsjwFIBvIjhevBqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSFMiCgvUQdx/3nB8IvWi/dcFYBQ8kt2FARxPI9DZMoMx6ME4d30naaYMU+uBcbtshpQ+D1Q5zAaXj+JsvCC39pDPtPY2lIozJ/FmhMuxgCVfBPbpWuqel1iUZSmGBkUdCdHthI/1oI6s7D/6Ccmu5DF0xu2TrUMeOXtgeYpz4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkhQyHZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhRZKKgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BBDC93128349
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 17:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=; b=CkhQyHZdGEBq93G+
	F+4LsLU7U3kU9GOaCii62iiYuleaUcKScBEsMd2EUdp+zua5G7oRDwJlpYwb8aYx
	R9EToc4ZAPD/eSF7SMEo9N1eDKvavn/Jvitp/gw2W4fXcTUeTKwROq0UcV+8b44U
	aQfK+rt/hNXmzZrfIPpHAgDHVxi6gJbYqcvwbcLG9HyCzM686vR8ROeFTWGolFxQ
	u9CMWAVmhPzlgKuw115/x5CoQKJYiyrOn59iYqJnoo0ynXM5ZY/RmJ78X9iVpcfd
	Ur3DiX9XjIhs5TUnUanyUEKwHtFkeRD29WC6URQ7mMrWU2S3w19xuLKb1s9ULjLk
	mImkXA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh9011m5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 17:30:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0bf6904a6so31362155ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780335054; x=1780939854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=;
        b=FhRZKKgFNtgqCgLGDezBbLWRGMrpPwM2hozO5AikxaAriC0H1CynzUo7VaKTdRfzeI
         mIH3Ry1u6bFYiENErG+6QNP5fWTG5i/FJEE8jwP8cdfqgUbwusnN/hOnhQw6uG8jFMbA
         6Ewvhtwr+azd5skp2HWOkAns2Gz+srz/fGwiCPqLF97IBjuhohb475fQkrmagVC3m14f
         gesAwJ47KE90l6cxA/pVqB1Btns/086PTmfg/LEPtPGcZg993GQRFLMCETFoYcjOSd/5
         TVCg/2eGClyFw0xg9vc57S8zCKP1OydktHja+Xl8LxSIGY6H716/f0J97GjTIN4+eSJi
         FNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335054; x=1780939854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=;
        b=B/G5sQpOSaP+blPk6pQVY3+gKt4KsAgpPLHSqehmbuXTojb3VMg+3mzYQj8mvDKd3h
         QnrKKSw9Ab/SyoMkrwSZ/EqJ+cQli3bwHBaMIUeWgMmEFi244SZOcoVDZw9Tr2DXgcVm
         sLemnfX86qmfWJURHAGZHHw2FXGfzqXD5J2X3racnxt+9fn1eiKS8sjFozAs2q106Azc
         DHsoLdotYLXiJXLzgSiNmY08twUrgHCJvdy2cG1X1DEh2whJD1fH/1+XEgmlCKLV4Vka
         1Z9tKwvew77MvYqq7QdbDwXcn1Lasg+rrkHJrV9FM7j1pMzPm6xw8un/Ck+7ACvYc25T
         xHXg==
X-Gm-Message-State: AOJu0YwlAVE4287rIhQddIXy6M6o5nuuWjsoc/DqKvScR8SunYNOVHXQ
	oiEqYvv33EbO9QW4QfLNBafKGxC293d2/du4c9f5/pOg9JGkIXnT19hQMwY5vnUxAzWO7QJq6Ao
	U5a1udj5Ble/PKH471QEZcQWpccprvp3bihmwE6YMtxu8bfsIjS9U6wvf1ao8GeYwRASe
X-Gm-Gg: Acq92OHemYw4xUy6Lj6441gKmfTbtZASIS0UsjuAIWyVYdMXElct9GrRAS69aNheU0N
	PwPXf9W+6ydYTFmZeaJ/VaUsc9IlwNYg0Vl3w/rdAL52ZDFssd2GVgb+UdBthVoSlB2VUVFjlY5
	zXsqPJx9u5EwB98jvc0NNuUW9gofLHwCQ66MI475jX7giE5NE5BWZIVNDMxbFq1U3+EK6WLjozL
	u3E11aeVLKxI2mYM+zuKUVDYJtdoyIQmfxxZDvJbJNimSsCcTTavHSVOobLj5jI5xZhNFil6ful
	I0m3ceS6nsbZeU8VfVQxI2Bx2mT22Og8uru3RTBY5IPil7kVP8LXjVQR7oLarbWrdk/vy+AdE5r
	JIzDLlwjFezO7fGQFcyFD13rExVsYHuGqDxLeNBlQbwRv/lslYEFqiSBgLhjl9LWUCKY=
X-Received: by 2002:a17:903:2f05:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf367b1670mr141503395ad.2.1780335053965;
        Mon, 01 Jun 2026 10:30:53 -0700 (PDT)
X-Received: by 2002:a17:903:2f05:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf367b1670mr141502805ad.2.1780335053501;
        Mon, 01 Jun 2026 10:30:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm149136085ad.41.2026.06.01.10.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:30:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 22:59:44 +0530
Subject: [PATCH v2 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza
 PCIe phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-eliza-v2-1-6b44c9c23d5e@oss.qualcomm.com>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
In-Reply-To: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780335042; l=1706;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xeSQHPitzN8ohDKs18l6esrdselqsjwFIBvIjhevBqI=;
 b=8TAw6i9HWaMl9TKddGR6bg7RHnpwPvMpNjH6kopEup+runXShivaFDIsfa7BjAa+eov0bpYQ1
 II6sIgMEXd1Bu/kukcd7mvNZ06W518oWDz9OnjtqH2oUbJ9YU6iA2qF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1dc1ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=d5_U1CTwwdyySJRbjq4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: M82wY9rpXF-hU0r195m06k9sSbrJ2mCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE3MyBTYWx0ZWRfXzKkYUOwprVMw
 Am/MMVEGbcE+gWDQYCiOUH5BBFA1tV8nU1dmaDS7vw6SR6/hoHr+59L0Tkgz9lHSgC7bpbnviWC
 Ejjl7FdEKcl3ZEEngdDh3jchP/sN0PR6r2JlpRgV8cP3Jnxb0fdeHebBnJkBuaNnQ6Ekx/h1HLP
 XxT1ymm4Y7rwbSGTEngoBm7+0cERySXaCaSdTWu+mbJRlN/sz2XJhkUQzVfJIzPaYX3W1z3yUQk
 9C6nT0E0mFH/RWWQjmOpWbpFWg/jlPRWxHfhp6r37Fr10567pk3lg1onm1Tv+C+g+Ixk7+HcqkB
 wUc6FRBIj13gbKF0LkjCQkxBIOhQvuPGqSOQVQgq3MTQ3aNnaTjKfO3xzry0WO9L6XllayT5kqF
 AJ71pCKbweqvC4fO97v2jZMqip4e8WBh0jj+/eBrkZ20lmnvBLNa8ZI4ryxoW2XbuD2+SFlP6XN
 JcDOvBrNSzWEnbvmY+Q==
X-Proofpoint-GUID: M82wY9rpXF-hU0r195m06k9sSbrJ2mCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010173
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,sea.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-110654-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81D01623470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatibles for the Eliza PCIe QMP PHY's, which supports Gen3x1 and
Gen3x2 configurations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..be4bbc327982 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,8 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,eliza-qmp-gen3x1-pcie-phy
+      - qcom,eliza-qmp-gen3x2-pcie-phy
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
@@ -181,6 +183,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-qmp-gen3x1-pcie-phy
+              - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -206,6 +210,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-qmp-gen3x1-pcie-phy
+              - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy

-- 
2.34.1


