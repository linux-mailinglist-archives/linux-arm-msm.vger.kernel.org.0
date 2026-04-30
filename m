Return-Path: <linux-arm-msm+bounces-105316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL0rOggm82mZxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:51:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E11424A0318
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B260C303E48F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F2E3A7F79;
	Thu, 30 Apr 2026 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKg9TL6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLoI2yVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC963A8757
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542330; cv=none; b=k+QDKuNP7d9raQfC/E0+M+5VAs+niXho7DSfI2tkhm1rtALrAyz7fFadn+z+Z5VWNajL6pEInLo5CIbKu/ADyMaZehraKKbMJ2c8+vTqMBRpZp63ZX/ut5G/jg3yh4BtFTxeNQeHO0XiJIyNl/ce/zwkAB53vb7kXPQxF7lFk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542330; c=relaxed/simple;
	bh=giFS3KGnbIJ9nQav9BA4XHkA/to082fHVKY1grUTwlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1lL8Yc9GtAWGN8dcyFVgdZXQhyzZmlrIcJ0YHlcmsh2sC0BRG7WphDkJWevl5RPDZOXD5bqfyRqGyeMY+mQuSquUFopyDxSg5ZojHxM9FPnHSDUkIFrXpXwhiYiewoUlVZ9o3smfXAPvEu96P1nEsOrZ6a2pau7Og/3awAiimk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKg9TL6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLoI2yVq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U59JMY2907506
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=; b=lKg9TL6bRFRKEG+3
	9PJhD9DyBCV2srr0WZq9zNm7ZEXtyZA4yATmyTVCwHT1pkOvbp5DzvR7/X0lQiFK
	a6oCSseUWZTvTgWZPD7qtNLqg++UmC8PzBZru+tHzyUMp6AvQZzirKuQ9GluGC+7
	+uYZuHUTabquu2x2L4dA7ObEBErCpP6yHMFhy9ERpYNQ30N5xaEbCwwOgs3dnuu6
	DAWh3eaLDS9MUbS/rECLHIj4FdrNxZGNHVURp199YSSUhcR4xL0pQTGPidu6JW2k
	ijM3Flgag8N1V541WO3Y6spYIu5S/lyePJew12jJ4uMLe+h7to8tl+q4feyqC5yl
	sfgxzg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pf91dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so1009685b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542324; x=1778147124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=SLoI2yVq2B/Uj8bKT1/OBv8HKTyViuKArO/LBOAkW9WgHwIJTE1xdm6Uz6VvTOxivT
         K0thvjgvUno7jTd4lZ55aIWsYzduznWi0w2lk4bJeQrw7rpB3Uxcwmttn+iKFUsaXuIi
         KAcg5aSqeGKfxts2PmuknDk1vnJy0KPzQ6Gvf0qT4/mzIIiEbZj8sNic6t5jM9VhNV6u
         p7Mu/HXW4rFnseGbd3EiUAWiw4Ah1HRxm4qX+ERE9fU1aKZcuIxnEUqBEePhQKvaTMwl
         2GN1iCVFQU02r63rgnljhKT6LHHRo9+0mcO4oHrjB7s9k912/Ummn30Ms/zXfHSvrVl0
         3+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542324; x=1778147124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=gJbzsWxbDk/SiSiU76T5+DyW3w9SHnJeFR+Y2ABluJb5LcseuskOR7JK4B5h6fHOzZ
         veWl30T1kzWW+gIgGl8tXLvy8S2du63/+vX74p27vJkztz/Rfk/NrgAK3JDEYFR1j0E4
         sFCEXIZnsKdZvNsdCv4jOXA95TI/1DQHSiS+y33FhXszFUeKfpR/c03m0MAtOW9cPQBk
         1M400ELpGhC4QkbQ1SsLBIDnHw0ywSZN2rWAuk9SGdHumrmrih/7uEP98ytVyoH0cuEO
         ASpnmQ3NN9UzvFm3Tqi3W0CTPAI1tNuYoel+2nEgQbfvPZBjf0xn2GLyFRSWkfhnNs2H
         R6BA==
X-Gm-Message-State: AOJu0YxFKgaPaNkpKH0HY62uUG2Jem35Vd/MY8BRDS6tj3PgzlaTPSEy
	SJ3P0MblNpMPUnt4t6DqwnPQEAv5bnHCAIvbSeA8Rc/jTDfBOX1nrLvGHcBpBJZyA7lOhmREpl+
	uQvBZyRNX7WfIY8CCE8wmKsxMGVtTKSb8wf/u9MQYfUQFRtqFvMR5s7qZlZ4HglUS6Or/
X-Gm-Gg: AeBDietKQ30ORNBgIhgrhwWqKPHMN7EEbFGOqlnwJ8Lm4iTtExh8z1cwnApdNLy0bjA
	D+Cex0bAsMrXr2ZYoM1FkSPTcWNRB7oXFrdC4XkwRf5nk2nnOMZnzBK/hLO11ZTFfWFUa4f4saB
	0J9p50zW9Rf6zg84LI98WTBx5cuQG4iPQHSvJ77wrXWg8LWAILnWVc5D2CTW3o5iOPLn8nBKXQG
	UxSeXGMNjWa8uiSTrXBndsOClJ/OpitzyrttkHfZwzQWc6AyB//7JgboVHPs96YHdVZSn2YyK2V
	nyM3Lzqy6u0ckms1/kHJRGdX8wuliAHTvLCyBhKMaL+23fowFXVvmk2Z1o8fTzfLP9+NYpTEZIa
	L17JjyaZeaqpBlHaFGzwUmFsHzAjwLGTDJ7uxKJBCAIA0GV6jxB0lAxxqcZ7qqA==
X-Received: by 2002:a05:6a00:4c9a:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-834fdbff498mr2657231b3a.39.1777542323889;
        Thu, 30 Apr 2026 02:45:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9a:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-834fdbff498mr2657098b3a.39.1777542322412;
        Thu, 30 Apr 2026 02:45:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:56 +0530
Subject: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-1-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=941;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=es5ERD8ECRizLcUcsRpPU+cL6+81oQXVvOctJZKt3TI=;
 b=e/hvXR8qA8fACPrF0gQrVbkL0akHmedcGq3djfT2QwJruwyoT7R+t2fQs1m5zvtqKEomV+Yxp
 roVpjQ5FD6XAs2UXsIAnCxyC5Tb5vSbleG4Swp4OD84EmUFQFoK/eaR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfX6T6oAIONsVyk
 bnjN5d84mGgXRrXhEAlA8g13rBv1pdqF2bDZkY7lh17RdsSL7v8FD1lPlyS97LRzLY5D8LIDHtZ
 Ohu37/IAaEiotG+uVjK2+HXX2FC3IL2ghF8ql5yEk0OxCvJsmUsBPj/gQY2Vk/KC82s25S/s/xP
 /8W5tSwSZRhcrJyLLLh+3OdIvaMWi1u6T0L/ANlT6jJscPAGa/0891Sk8rNYTHj9g1yLI5CjbGa
 s5v9DEu7dDewXnX9t5MuLYlNgO7cD/8u00rzyP35eOZpFKaCq500cX2RLV28hcFqAIjN8JjS20W
 n27xRTOZ19uBXfd4trii8gw3A0smrUGx3s63tKV5zBOTgQf8RuCSmOOfVlkUQk6glnqNY7eGXsU
 nFqPhQH8iJmsjMWDexj9Imr/W0DgzL4c97OeL34gsIfTEMbAkpD4egTLUatTnKrLd+aT9Qo8jw/
 XqW02hfjlqSgfjRDkJA==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f324b8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=69wgM2fLTQVZxHge9JEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 75MNwa3klp55AJukLVE0egAu0HpKKNII
X-Proofpoint-GUID: 75MNwa3klp55AJukLVE0egAu0HpKKNII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300096
X-Rspamd-Queue-Id: E11424A0318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105316-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra rpm-smd device.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 270bcd079f8861d6bf9f3058e188895af33370e1..bd1d32898461c48ebbdee8d6c48046a08e39cb0d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -57,6 +57,7 @@ properties:
               - qcom,rpm-qcm2290
               - qcom,rpm-qcs404
               - qcom,rpm-sdm660
+              - qcom,rpm-shikra
               - qcom,rpm-sm6115
               - qcom,rpm-sm6125
               - qcom,rpm-sm6375

-- 
2.34.1


