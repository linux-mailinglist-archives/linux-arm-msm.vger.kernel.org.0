Return-Path: <linux-arm-msm+bounces-112959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lhhWMLJBLGrJOQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:28:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B067B536
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:28:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S8i5Wr47;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M+BRGMG2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112959-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112959-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AE2A3171933
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 17:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C4B406837;
	Fri, 12 Jun 2026 17:27:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB5236B059
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:27:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285276; cv=none; b=roGwfupAI9c7rZ6bExP2lxAcoNEQB70nP6po5bX8uQXsVFCHBVnBgjFnAfB9vZh64DDZF6FXUG2EqU9KnzVutr6mOe942T07ICqx3AbCiu8jgTWbLjsDjfw3qBU1rvmVcKK+ZJEj2XYZ49HwVIZtp0Vpv5BQLZwYhSmp09Z17gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285276; c=relaxed/simple;
	bh=7BvGgsMzIym3cFm938zERz/XKsgQcAutut856Vu3XHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC6PETre4c9FQbVA2T59sak2Teu3d1VXn/wNCnRqgNSYzImELm4fBj30KP0/+eye19XNXucW/vGn+g2yJjlxmbp/aTCDts2Fv2nnHhbh78oZ8ekuyD27Dtjur47Ellna+UL8itUNMrbLQFDFd5yLHuP1Opgf4JagEE6O4qLfOTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8i5Wr47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+BRGMG2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGSZRh019584
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0B3aL8wANNFMcgo2EUByGJXGvJUE1R3H+briV1PRdNw=; b=S8i5Wr47700KpzIG
	cp/cdtfK0IUskhEYqG4UEm4ShwaFYiJIFzMfif06v/xIx8d9evwFsWeNGlnckidX
	VRsZXxmOcpVKoI8GJP1iRhCNCKqSrVlqZc/Nzpi5Irpvf1C99Ff9ixoRduVGIgrG
	wSP0H4Zs2jDvMFeL2VlyHTKdPf+6S6ftDEjaAOxO6DwbLcgg5/dN5YfnUtmr8RET
	+zDJUmLZKfQKK0j12mvbbkTmC3eAG7RHVpFlacZzOqnymgUEjph3W2z2yhqKyx9R
	iGwqKblizRlawLJTCOXKqLmpLr+q9rEnUPiqfSvL2NHwwdoVAUb0PUHBywgLehcJ
	edkYbA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r73uwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:27:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf3636d6c0so12479235ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781285274; x=1781890074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0B3aL8wANNFMcgo2EUByGJXGvJUE1R3H+briV1PRdNw=;
        b=M+BRGMG2iWWBfaYCffMrA3FHhVpQ29ET3tPu6jWj1wr0U4eBHeCxWGpbOhyob9P7k7
         yFXjrMzR0wn/izneYspDY/isYEtH0oWkBA1yPC/KpWWhZjAMCdBktBMy2xeohzvIyBnE
         sI1142H5F2aBsLE5iC2RKnPuUAsXJc/qbQKhq+lg5rRGCLo3tLNxzGF3L+J8QfqWrhSX
         /SNHH25XWn7520iRsZ+C0DimZBmnpoLuauKrh6E6+r5hJ5u+LvtTO5evhDhayAtaUpmJ
         dty+Kgi+CgXF2xdtvjlHLWpIbIFwEum3oRybv8zEx0PMwbwVKNcB3Nz0nGcCrUgl3SmF
         vCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285274; x=1781890074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0B3aL8wANNFMcgo2EUByGJXGvJUE1R3H+briV1PRdNw=;
        b=U9ciCeKKPT6YPvH5qjTvtOO09InsQnUQjvXs6g6Z7hUjujLJH1Jdc/O1UnAkQzIsEa
         1cFlLxupOmpjMRWa8StZdVgPmA947y2CXm9V6851Cs6v0bAPexHblT8KUAymdOJPIyr3
         Sla2SGRKfp7QUJ0dbOYKYDtAIhR58/D2Wozu8b7brMSMMuFrcENkN94dzKVAY00VZzAb
         cevG6/tgQTyabJAUVJfNkGtFeukCKCUowfF0jzk1a/DLE42Fe9D07N1jwnhyv1JqYfPi
         PoTXVIiAuAZ3NPAXDw2rZNk+WrempX+0JB7AfXGBxh6XMMoxAe21x90MiHIbrWLLTXcL
         OvpQ==
X-Gm-Message-State: AOJu0YykG2Y42Zll2/61sTXqAsVKMUh4exEnJ8eA3ElQ9O++kZ6WiRmV
	vB97iH6+dzzJjmYpXr2Ib4dtOZX1xvAeuHhPIK2KjoHd3thUhVDMbaPxO1WYKxdcU1423UCWdg+
	58HLXb2wXsKHEN74kNZ3P8T/bJqKdEwcI4+toRfZmRPkPTAp2L42aM8PM8CL4+uBTjceC
X-Gm-Gg: Acq92OHdT9JzHcCQ3HaDXfn7GHXZXwS/VXnvkkoDE7WeciS6DDeijld0H81oJTqsHfs
	SeoMrLKY3QkFawkMqGC8+yvr3sULXJO5zEXgyoFDyBnf5co+i9tdp/px0l+SEIOpx5HtPVTnXxi
	DfNis80gExnleSALEWm3f/ubXxVXW8FlnhWkP1MHo2YGKTz9hoL17sWO1yD/Z1ZfvM3g9BNLsxv
	DLGUyeurCNniYXiqeEb9/7pwAjTa+NBTZtqAaLvQW0C8XuVkJ0AoVHACXTa1DZgUkgSXBJ9bB7W
	5rsf+1pUcjj6TIH/MakICptU30O3HZc7l0AH3RLE+a3V1fKbzc7DYQ/MRwd9JOGaA0xICB2DIPE
	UdwyfmmNN4yIlQIXDdQzzdUzzg2I58UkOqL51
X-Received: by 2002:a17:903:2341:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c4136e38dbmr45137765ad.36.1781285274039;
        Fri, 12 Jun 2026 10:27:54 -0700 (PDT)
X-Received: by 2002:a17:903:2341:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c4136e38dbmr45137545ad.36.1781285273578;
        Fri, 12 Jun 2026 10:27:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acae2sm24278105ad.52.2026.06.12.10.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:27:53 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:57:37 +0530
Subject: [PATCH v6 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra-dt-v6-1-6b6cb58db477@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781285260; l=1818;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7BvGgsMzIym3cFm938zERz/XKsgQcAutut856Vu3XHQ=;
 b=u6nbiWUBsu6TxrfPJwAk9JiZJQBGrhvswgZqlmEjggQJYKOmEHyj3ViLkUguSgSupnYFN8aAH
 qeOF8AtuGgiD5LTNhnnXgqdnaNJwvJfgXSSnPjzLd6adzxtvOMhZrA6
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: v8QuDvtTgy85YWPXC3quiDGG1y8vW3lN
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2c419a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: v8QuDvtTgy85YWPXC3quiDGG1y8vW3lN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MiBTYWx0ZWRfX4mYZawICSTcY
 Q6g7xKy0e3dMaY8VH+wtV9TBpRk9UgOOKKm0uRIpldX+ZcYruxEsBJYA6+/QMAEKMNmIovgft8s
 xf21hLebo4o1pMvY24bOUGfyGJDQ47yWf1lU02vwd02S9VsRzvKks+1/uxuBsAlFGMaBFxBBi3r
 x/nBv3knkqFgFJ8n0TsfTnmjGd9hxDD95EbYAAkKqdIlYf+3Mds9yvCl+Hwow+IFAxqcSb7sgaa
 Sy8wePLcZziW/y+uZ8geYAb1i+dRlH5w1suj6oo5SkiP1g+dRhtmxLFaN2GzCDhezqMv5/uoaVz
 l/uGhF//+WUzQU0/bxQv2El9lziEbWFMzs0GDOo6/iGPa5oQj74RfhXlEGkwmu2sIKw1+AXtzNM
 X6WkEdn5pYtOlNsU4HULdKn0FVL0uIgUgNpJzXgU0CicSMjjHcFagDjKOxTyaiRuFB2PQ6u21Zt
 Vz6MBPbzWZyOTfPboiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MiBTYWx0ZWRfX1+pFe3y40uQr
 bSj09Q6xSJ/NRLDlgQHHM182g71vFbdnS+yQFCiWnFBp/Yxrz9miwmQUpQtwKFeVfo0+7uGS5ai
 tcXAEaYGduvIlnIZcXIl3EB39ZzL5fw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 356B067B536

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
  - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
  - IQS: industrial-grade variant without modem (PM8150 PMIC)

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
its corresponding EVK boards.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..cf7d241f8107 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -989,6 +989,24 @@ properties:
               - xiaomi,polaris
           - const: qcom,sdm845
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - oneplus,billie2

-- 
2.34.1


