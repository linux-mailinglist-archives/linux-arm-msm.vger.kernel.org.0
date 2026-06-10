Return-Path: <linux-arm-msm+bounces-112414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hs5UCnFJKWqvTgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:24:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E33668BC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:24:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cSCo754+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jd1og7XO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112414-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112414-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7833310DBC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4D23FB7D2;
	Wed, 10 Jun 2026 11:15:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4F3403AF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090137; cv=none; b=Q/LV7dLe8WVp1hw5aaD+d2Gkiswvbg0U0q+eZmAIY/0XnKFHSLyketQaLiN2DQuRaqD+a+HNNjLPbwOXCEdHzigUQIo+Br4Hn5unSSOu54UzrROao6wGTENym1xXxuZMJcExMkMIXxYC8MPQUm0tDp56ARvFRYv99iIVZtBVNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090137; c=relaxed/simple;
	bh=Uqluud263E5brCcr2XHFpOjXh+t6eAS3H76ENv887cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D0JPhEAUSo1GWQ4usG1VjlWeLjE9M4OuOPx1fZyG4X9z3veUrGuGsHp26XBJ6fjk3hlRahhk9wsgSJREka2ui9wyidGCFq7fvCbN6i2VgvVIdYq4oYqjlL+d5bz30pl9+z1SKYsGPbx7dh7HNIO9nAPprmSGhzYjL/zTFjRVKFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSCo754+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd1og7XO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hj5q530203
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aZA4ZrQW69o
	qC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=; b=cSCo754+MLgEi9UnQHg4WjuzGDz
	+4zOqTJAGdnpsrO9vQkrNsNBs/4V4HduNNtNz3krlJD0/Jzc8DGtmSf0gIu59HBB
	2UfGvIoqO/ZXLblnCwhFpMbJ1y+VRSWH3mR5bnNfHIaAPC4mpsHuDaX7k+NS/xsW
	S5gsUAY7Ygk7wWr28zTyF1e26HhIEPvbngV3PTa5DUqZWJ5QEfPR0d4iBZ+w9rcP
	n/K8usoWJbWijHxGKJiZpJxxB5l4IEyaY7XE3yinL4s6xAmpGOppghNVm9bLoyBZ
	1Bco41rqY7HV+EFUufZKIgMzVKYz2hQ/VsX7Alnb4inbzwR2p1jyVX0PlKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2j5e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32faa62so119773845ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090128; x=1781694928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZA4ZrQW69oqC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=;
        b=Jd1og7XOSWtfR/MntffNHUkTwWnMLVtFRF3tEb2vf+Ejai01EUMHVvUQTA8EyvEmfM
         1jo1MSTKfJD2CGyj5V4uZp/lQEJU9K+qE2Hi67kTikvbomV5lR8m0wMXL0+4TubCkbEL
         nHIddspKj5HYdDnVK8rNvHW85r4H6Ws4MQL465cqs2nA0HSRFwrtqzidmlB22fDqJ+gS
         JCSDk4miKuUWYXgAte8aoLb4LuxOw3YBLiKDkRvCL3uHXvAJG202nRybdMRnAe8fCGWu
         wo0LpRk7GrH8bhQ+Jk7d2/ZfMp5S0SNTB5JlwFj1niQuxglPrwQUiormsBD7PXDBTcRB
         VJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090128; x=1781694928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZA4ZrQW69oqC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=;
        b=F0sodyyTbegfY+XFbdWaArT6Kv8bN6aZpyp/JBkfEnCaHMS8QXKzzQLG/v/2xcj9J/
         B0HaBkdF9Mnury5VlPXDx+1MHUGTWq3BctIr9UVuKdS2v2hknzEA0upzi1XUd0/LP0TO
         rhAhxBbqMEzNTMH9NdHkrJvtTQFHL6AKtOpYdaJWqWZ8OW4pybCY6xaSVK+LYDk0S58l
         8gBRl/eJohkWT8hRrFVGDGNLzwq2ELrhUB7QxV2U/s1g6W/W6FhPAMFJTGTxvJFPY5DV
         pEa4nqenvje5n42v6IQrsYWvVCahYppPR9vOqXv3vsce18H6CyjUFc9psR3KI+n08BbY
         3Gtw==
X-Forwarded-Encrypted: i=1; AFNElJ9Hadtn1HzHmYvZjOLXlzDXn7IUmpLZ4i3x/jrhqYmNj9i28aw9O1t5cXOujkEBCln86igIC3jBYSnvEhqS@vger.kernel.org
X-Gm-Message-State: AOJu0YwBoyDAhdB3KrRhPsH5htjr9q0oT/PLHBzxEsqlJGAkDrO/XB1c
	bSD7i1Iv0NeySo/skYRuC/zY298MYTL8AGz5itEVxO6rlSBB7KY9harscfM2VC26MUfZui9iWw4
	pPISfwUdpCEtI5UwQV8N7A58G3Y4B5zpX0i0p9d8iTsoZKPqDo7RtRzN6KLMW8HQnA39q
X-Gm-Gg: Acq92OGXciVSCHtD3Vm3UheRf++pWDUbHb212aSRVkMfjfVVDY1C8sLWxmORANZyobr
	zuxbLgjresU/O6uwWcF0ZC5igHQgHepdAkiXjz1+s3AYSMEZvPipmUxMr8dLkEqKfLMrrWxHxrS
	0qVYrgm7O9x0pqgEiwjxGcmeFs8URxQTq/wnV+N+kmZHjZCX0v9Wck/WnO1aHiYbp9KDwAnzK47
	hT6j04SwYjhQzqGsRgZ5uC2pW8Ugx9bYM7fN37bNhq/Dh/tOC7Yt2jZ0qwpencVzD9myNPncQJo
	Ul3VCnQQA53gZnkqnSXTefupWdo0UBL+99x/5e/CfOTljqkUgKb4zZRUWvSTYBQa9ZfW5fLuQKO
	oemr52ENjOsPsM0pv28cvxsueuld8QjB3vX+FDhttlRdRHzP/moSLpxce+i8=
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr271259745ad.16.1781090128009;
        Wed, 10 Jun 2026 04:15:28 -0700 (PDT)
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr271259265ad.16.1781090127400;
        Wed, 10 Jun 2026 04:15:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:27 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
Date: Wed, 10 Jun 2026 16:45:06 +0530
Message-Id: <20260610111508.3941207-3-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a294750 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6d2A0baYHafENtA5ngIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX+EZcwn8gLoO/
 /OfHpXr+ms7SXS6yLgIewowNyNAXvb3VAWDOt5sumvBz4wfvqiNuD/Z5GlVGO5apEpMVdm//ZKG
 P5/DlMep2a+j36OSXrxmFGCfjrIIECCZZwnJLTAJjhwmFmW/FWcFq153iJ5UUoB9CsPdNLBwH8u
 RDXLzoe//S0yovM84dX/zIUI4NrnwXLfKWSja764zjKBFPnvrfFwojmEBK73D8D3ymZwh8+5zmX
 coHqu0gfOsMiaWJtyJKeiXct//V0y70BPOioqWF67jdhF6a6mWeGdADav1t3FI97HrjZ4QwOeI+
 muuLZ3vDuLVmZIQSWurP5kibafkQ14eLYiFUIWOP+jPJpY4G5HaEAUQpdhVetI0yujMcdbYoEWq
 rt0IMWbQVReLdQFiOF+HcEHD7xjFqrliwaQRObf4dv5qxHk4Gxvg9c/DVMFbaPEcT91NjnWstGg
 KhARZ8/MVVnh4pmccDA==
X-Proofpoint-ORIG-GUID: ImK9U9gksJDCTd2ZsxtFAhUTj75GMqrF
X-Proofpoint-GUID: ImK9U9gksJDCTd2ZsxtFAhUTj75GMqrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-112414-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6E33668BC6

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Document the Glymur-specific SDHCI compatible in the sdhci-msm binding.
Use "qcom,sdhci-msm-v5" as the fallback compatible for the MSM SDHCI v5
controller used on Glymur.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index bd558a11b792..6a8ef84617a9 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-sdhci
+              - qcom,glymur-sdhci
               - qcom,hawi-sdhci
               - qcom,ipq5018-sdhci
               - qcom,ipq5210-sdhci
-- 
2.34.1


