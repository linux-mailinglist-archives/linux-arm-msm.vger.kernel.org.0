Return-Path: <linux-arm-msm+bounces-107614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LG3C6LUBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:56:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE743542A49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CE603081B84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50B53FBEC3;
	Thu, 14 May 2026 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLzuosWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLD9Gh+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202773F9F28
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766871; cv=none; b=qM7uhhAs3PBbDx2HzDhQlIaMyrQUhQlLDi4lYnvdUcY6EljG3E2gkoziKLoTbs4qD6kZnLw0BqyTVxLq9976nM1vAo37c/QI9VVFy5gBpCFi0aw4fJ0Et54gemK/qBIk3cpTiJ4GCC5Gwuy+9pyNMGiEw5gwn7bXuOdYudJYTsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766871; c=relaxed/simple;
	bh=174Tg0VPzvqwZU2fjs7eN29tqAdGhFMHsOaeOiYFxQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3aVsYq+xlSfdQVTn4AD+exGexSLN7q/C8C2mE2JA2QZ0HJSUmi1DrEVZZkVn0JWYMe99m6F61R8wSdfh1RDnw+wj0zEuVdGNNcw6xdvwLMPuoBeMd/42lIdnPu43s+3cMklTm3ehQxoH+ZTkGVD4LDY1857NpeYfanXwh9U5ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLzuosWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLD9Gh+3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUD32241699
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+k7usBZrKLsL0wCcwFfDE5FGUv/IGoqlEs3BUzKsUE=; b=FLzuosWdW1gZcp9P
	CKKkHHlrVL4rn4WhYRUBsJhFOf9IysFf52OcVTITNjaqMT/fWnZ41izjYLyAeEU7
	rCKxFZb79pCJN0LGhB00oBzM/+GQgrRfABk/kNsvywFuJPH8T+rxVWtFmzJqMUAk
	q4Q4GVvdUFoSnL6r9lyo+o6hOm+XTzUx3+0cCVOAdfgbLuIorh4B1fl8NiycFN+Q
	vufFpHOeumkPWVdaaWb775HU8IsZNBlRWWzq0cJwXAlLDWI8YPRmE+50526addWI
	IBTe+gWpxIX9i61vzB0yUYUdWfRBqua8wOafElZoB1NYbOjLvFJZEkaY7GsxWzgA
	z0GuFw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gavvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514a182b90dso68666211cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766866; x=1779371666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+k7usBZrKLsL0wCcwFfDE5FGUv/IGoqlEs3BUzKsUE=;
        b=KLD9Gh+3oLZWQlLvSWvxj+bYyZ1OCK11kxBuiCGcJuJ3mh3jMJEeJ8IgpkLW7o0VG+
         1kh5KhpD6IIHcZwM4hs0zGBMJO2DTRDMN9lMsS7mAU3duPgRtjowKfiwfB4lQ9ocSvj6
         KYh61BlWZSyJyBjLTZ+OUUr8Kb4a3YMVUWsrfM4mOrdOSHSjjDtS6BJi4COXsF3Mvk/2
         Wx3mPj3vcmdJXbrriHSue1U8LGjdwjENOLZkkjHXQywp2NAGDe9DNlzsptn29cjPhJs3
         v3p8/O8r0DRIdKq3WDARUEir2Cf4vKGOnt8p40ejdJIbyXIxLhGSrNR+iKVUDIZMFrtZ
         guow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766866; x=1779371666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c+k7usBZrKLsL0wCcwFfDE5FGUv/IGoqlEs3BUzKsUE=;
        b=rUwcZKMJLIIcAjcrVxOro6/IJI24Ku2K21jJQIp7DPI4dhvP5gIgJr5pMY5y38oVcV
         1AZbKRARr6i/CtDpvcK/d7F7j4vhUSNaA3J+t1JQRwX88AFErSRofk0RZo9torQ3dXPd
         KWuOV8lQUls1PaCMyzhsG7NpCRdxzA8pxL1RALgOxBmtEqRRwVy66onNcy3YJlz/gq6w
         jG162ZIs5qQux9OnFe0nsGfnEQXuG0Zi1Lu82t6tICp9M8kRpfTzrOBFJWiBtB1v3HkM
         9xGK8O58zuVgcjST+eBxDGpBFM/NG6QSeSP0E/in6tFPomX0mou/GZQjZKazEmAIE4Pu
         iB6g==
X-Gm-Message-State: AOJu0YxwCj7dwXj/B1NcntaBgEHcRLtklrn00PjOYNA7C0weyoTnpXEj
	IIzikR753fL06Uk7Tw18axYGScF0LiWIWW1PypVxXy6sZJ4XYWvf9hOUjiUhQs0rOUZ5Q6qLv8L
	K/rUo7o6gP+ldINK3YHwbFKlmkrjROwby+TEaFHYXEZb3dAh9yg71vhv/hASJ+KgwhdMXmkkKmf
	3r
X-Gm-Gg: Acq92OFy871PNKoTmT4o6QEG30J23FDoBevDnOFecKXlrc0X3pkW2lct1OUqjg6nA3g
	7QS6MBeU2hVcuw/waiCKD/D/CTEQR+Hacvlpqr4yoByTwv17KXTLMu23gZq2VXCnS1wkTgp/YvC
	/YkbYP+d8cQxwcIvyhCWRq19fU6bfW7Y8jQjAdFmurNJA2RXYEh+FsosxBd8+s4h1u3ecaqE35S
	+DdhruN08Jxvm8WL93afHhx7NJbbX9C8pY+Km0nSl+6G98Qa1WkBvsiXdfBS16LJG9fqCkLzRCz
	iPX6Z8c/CRWQedUgohV7z9BpLnJV7uoeDcKDhLIxYOdvXtxk/JNwvAP8n3GkBxbNtCuYtkF5LXY
	D/N1vtU1kjgqaPj4/qEDAi01QhUO6pqfSs5s60XTM
X-Received: by 2002:a05:622a:a6cb:b0:516:508b:bf53 with SMTP id d75a77b69052e-516508bc735mr14233781cf.49.1778766866017;
        Thu, 14 May 2026 06:54:26 -0700 (PDT)
X-Received: by 2002:a05:622a:a6cb:b0:516:508b:bf53 with SMTP id d75a77b69052e-516508bc735mr14233301cf.49.1778766865388;
        Thu, 14 May 2026 06:54:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62dde04sm27798165e9.2.2026.05.14.06.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 14 May 2026 16:54:13 +0300
Subject: [PATCH v5 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-eliza-adsp-usb-v5-1-a21056ffd892@oss.qualcomm.com>
References: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9126;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=174Tg0VPzvqwZU2fjs7eN29tqAdGhFMHsOaeOiYFxQg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBdQJxq3shNpsdkAmtq1R7aT38YPR3Ard/v1FP
 8EICYuxYhKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXUCQAKCRAbX0TJAJUV
 Vg5ND/9mNCY01CiHfLa3pB+5Sv8MK7npErD4rtvFpvQGNM5pDDu/6oVnMsf6gNhP5FCSfU+y39J
 o6wl+dekuqSRgV2RQ+p2xztqeolY81Auh3Zbw6oXcpd/HewoD0wg8NBLFwkgAKBKxloqrHHt3WA
 nuDbdU/aDqnzlEJDCGXS7qaPnXOZ1ssgC2F4XenzB/RkHX7VVMccvgBbRHMaUznq8BVezG6g2+r
 xgTGPI7MLzkcBfhtS6wERVb/hjmzOXzeS+imAwuzC1wH1FdaHnL59mCWlmI5G9IQVvxCYsVb1hZ
 5xSFrbl2rB8YGPVUZ8kSHf0BtiVBgY2VLeUiNm0wK1FhMF1mP7pgvfQGZyUp1whcalwyi9lH3IL
 6ZydemU7OWNfuH12X/eLLM01V/hNpu94YE5h8v+q7Ljg0+8iJZmPOKytdEus5B9E6HP5Io8c4YG
 INzKtoMCgC1RhHtAneFienZeMfISVrAiD7+7cehD5tlhBZUPQRJARMpwzyP7LUW32n1RqCNc2oj
 XeFTPQqp6hvz3PXrjwsdqG88ZhY7tKeVFoIvBOilSEDWDPMG1HWvmFijMz6y9P38JqohyPgLabG
 pp5N+tabuVFvyf4Ufq44g0rfYlPNWfmx6w6SAmr2oVocTd7pvipmfyZZejNKtotAqTQ8X/1pT3w
 CP/7FsaE5kLTQcg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXwkf/5eRYkm7e
 AvnesBO/miBKs8OwjTxtG3fvx8hRXvFEWqiUiD6QpM3gmHjyEDFeMHYw2mXkvqeKPSUESf8TPC8
 tqSZAim3aehi0fSl7aqYrUxFjZxjRm020vpRncI0n7QaoHHWvGme6ZKOUJGiwgJzk9C7cHiGukP
 7qqJo9laAK1DSY1uldgR69Evtvk7jzmNiuxTifI1/F06J4Z6xjipzH7a6HBGWFA3zme/B0dNOI4
 aY5xhikhI0qoImnqPmQZG5U/XJZPt5rMQkAfxLb99IM5Ajl95/Ef9oWlHQuflMKr7uD3f/0WyEA
 P+0mcqGIAos5esbG5szzY1ayXUjVZm/QmziTiugTdnJQr3r8+JtHYzyUiJQuQsEaSkpFen+fo/u
 szcMcUjR0alKNvPUN9CM+pKXTOmMqJRMWDNTMJKNYD0GUXON/FfvwYcmNoowGlh8cL3tghEXe1f
 RDG62MghsxIyVU6Xipg==
X-Proofpoint-ORIG-GUID: NiWp9BWOzhNTUQXfgTO6X8ajZxHkNXrY
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05d413 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0aSsbouhDs5aZSzchFYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NiWp9BWOzhNTUQXfgTO6X8ajZxHkNXrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: DE743542A49
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107614-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Describe the ADSP remoteproc node along with its dependencies, including
the IPCC mailbox, AOSS QMP and SMP2P links used for communication.

The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
combo PHY and an SNPS eUSB2 PHY. Describe them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 260 ++++++++++++++++++++++++++++++++++++
 1 file changed, 260 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6..75d6d02bfec4 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -6,10 +6,13 @@
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -596,6 +599,30 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -624,6 +651,17 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		ipcc: mailbox@406000 {
+			compatible = "qcom,eliza-ipcc", "qcom,ipcc";
+			reg = <0x0 0x00406000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -862,6 +900,55 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		remoteproc_adsp: remoteproc@3000000 {
+			compatible = "qcom,eliza-adsp-pas";
+			reg = <0x0 0x03000000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +970,167 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		usb_hsphy: phy@88e3000 {
+			compatible = "qcom,eliza-snps-eusb2-phy",
+				     "qcom,sm8550-snps-eusb2-phy";
+			reg = <0x0 0x088e3000 0x0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,eliza-qmp-usb3-dp-phy",
+				     "qcom,sm8650-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb: usb@a600000 {
+			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>,
+					       <200000000>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			phys = <&usb_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			iommus = <&apps_smmu 0x40 0x0>;
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,usb2-gadget-lpm-disable;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,usb2-lpm-disable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+
+			dma-coherent;
+			usb-role-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,
@@ -957,6 +1205,18 @@ tsens2: thermal-sensor@c22a000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,eliza-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";

-- 
2.54.0


