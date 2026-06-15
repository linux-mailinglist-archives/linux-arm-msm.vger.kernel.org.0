Return-Path: <linux-arm-msm+bounces-113111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id paKaMBu5L2p+FAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:34:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A35684915
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:34:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ch+9CQTZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GstRVw+S;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113111-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113111-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1408D300101E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685D03CF024;
	Mon, 15 Jun 2026 08:34:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEB730D3FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512462; cv=none; b=ZFzR7/UVlj3zInRKV6PK1Y1ddXtnFD3F6Sx+bI3NRRmo/TWSmrXj+JboetMvbOqA+X0AD0mSoDN9XgL4zFVPzp7hpi8u/4OZz5dOK7rchu7dHIxh7Nj2rQVSJWpYXCwfW4KWs9mI38EOS2SaDa7wh14NPgE3ip/137WZy3++Yfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512462; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nOpnVTUNr1TLO2Wmu88Lr553gSvVZX9meZ0wKI1945TGr51bpGF1xjpL2bv13diDzlsAjyKdKQEYjZMhqgjh9J0d6pDLG5+oMS5D1gk3RKShNqJZEtI1KvwaVEA4LDYGlUF/5xX7iywR4zIolZ97anDOn1XsIUPRDLI3oiL4FPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch+9CQTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GstRVw+S; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LItF3828718
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=ch+9CQTZ/dXxcWhn
	OEHiPEEmnnGXuY9ZBEOXxs1yBK4bC7sD3QyyAVyGlJXximYY70c+C2DwnmyaKDki
	jRZGPz8CBCx7610QAYu9M9cDfiGqtcfE/TWbda5aLx1LDGjEOSUgj5jitg+rmbAx
	zdrOBY1YSGYhkW4U2foax8PEYTLQUiK7lwHmC80fwf57L9YdCOirbBQ5TvHJH6Uv
	+2OSoPxJVZS9POJWNlIM2OkR6KDxQX3aywJkoU1rlVKK0ek84R5xH8WJrMuS5Xm9
	rGZTem/cNKIM5hOjKUgJbjB20G0YIa8Qi3QJqStRd6WF2nKP8rsq8ukNq3Zcy5UM
	pVz0uw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u6due-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2c98c1be2so23530505ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512455; x=1782117255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=GstRVw+SNLa3Rk59jLwr0jSCPhj646xrEkckCG3mZrFpVm8UYEu8gecgMa7S6fJ2If
         vjidMrivqwzDZf4GYKmYQSgUiBKZ7udHwNAZ0f7a5h+hW/pCEtIcGuTgebyzcC8w2UGo
         iXo1gx8V1IfZ2z0W3Sia5oMXrHMTVce3Qc4p553iR3N89j4+6Oytub4NAEFOgzzPHXk+
         GHo8WYyYtJI1z74RfvR7KGE2eSyQiVyqB6FhoU6n+hP4s5g4II+qYWb87tBql2JP6me5
         vocedhmv2sUAz4Sde/RiFTEbTdiY+CaeHrBRDuHKNel1ms1xckjASShDAGTMs14dYggX
         yLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512455; x=1782117255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=ot+43cjCFfcOxjMoG8ADMusPsi1WtbvQnYGmoZjaCkHlZoocTorBARFOvYEpG5GZl+
         cxiTBuTpWFv6j2taOd6x8Mxz64tSvPHospmkBPAzufqzCc54WzEn5Hxj9wpyJM00L/mE
         w5e+FA+4dUkXpnlTrS1rL77QjMn/nEs3oaIwGQkueT+VNvrwEabLraHoMfisWWE0YJxJ
         k7MRR15vq3GAuk1S290itB7vHC9rsBpNePO37OvM61KOmKLBR8/dzsoOTUKz8+GkHK+J
         FeOXypMcrRxiCG59Y/VBp2jvJXEyKSnFyAiUJu3ZlsmaoWKpujeyjB1FhPlEkA5yNRET
         3ZlA==
X-Gm-Message-State: AOJu0YyKMm3JJnn4bMNOzkr3wfw9cqw31qZGSgDed3QT5eJIeTi/PeRa
	DaF11FlDOVZiQgJuc3tOUOs0vYiWQ8Mj6Wf0zkTzjEin0NJ36eQF5k4OsZELIhd26tiVDjTwCZp
	JFUcV7BpydE6NrYseQjhNP7bzVVnNG6zaUWE4tM5bpdUdtN7swT/nEcMOG0zgym7vcwa5
X-Gm-Gg: Acq92OHhyMuo3+3HtQNUCupxVoUSABDAWa3mVS+kHGxS4Ga2l/tDAtfTOrvCFn2s+Fm
	xdImdV+teJ0Q0hterA9ydyw+GcU0xivG6M5XwOm9JXFEc/OIjbtX/bnsDNjI55EsapMMiT6yUdS
	vT9druSg+mPrh4uFCU9/iILlUZdFVeW0ex4KxH5SGLmZ0SENHJuG0QA+UyVcvjGCI7JJ5hl/OUN
	HIPSAUXrz9PGx3nsY2zCcJm+aJ+kJtw4sx8Er2E2BTK3IBJa0SXhDJR7kbBlTIiqkRGW34ndnZS
	+C82T56w1wH8fHqFstEDuzL/7rO1QexlYIVOLJJyzjhO7ZxUUcMaS3ecOXFoQn7pFRaypVxV/4B
	cqwfVLTmdf0bGnoBEpnQw+2x1Mc3jyhKchGyOm9Fs1fkJBxzI3dtS
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr160950885ad.34.1781512455210;
        Mon, 15 Jun 2026 01:34:15 -0700 (PDT)
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr160950555ad.34.1781512454746;
        Mon, 15 Jun 2026 01:34:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:54 +0530
Subject: [PATCH v4 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-1-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=15Up0J+FbwJVIGRY9JiOD8U4yeRHLJFpCKpZF7hc/+3ZGfnZWARaRaYWZU3DWtZwSxjPeU/aQ
 xdOt8iCMATcCF3QAkYKbQzM+Zsx3S4HetByuuecNdzg5Enl55/MbJmF
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2fb908 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qQigq7LTfOwWvj8m-UwgK_GKXcJdzNYT
X-Proofpoint-ORIG-GUID: qQigq7LTfOwWvj8m-UwgK_GKXcJdzNYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX0UTE12Eir+8V
 3yKrg4ASp/e9IvJb+7sJqjffxED/DhGQ689Qu+Dsoq+Z3lXH6YJ9i8oaMaZJkLbMv/9BrG4lIRm
 xpxtLXZcIdjnjiw3KN8983Uo/PPNoqeE/wefZQ7tjzS3zPH268m7+WbA1Pdt4rOBK7V2rbWBQLn
 Tu+C8bm2Hwyp2qLCL+GqasmALFWp6w5Na3FkNpsQy2tRpB0Yhn8pHcFPQ+/KTGNLQ2IXX86eoUx
 DBmgEw5qYqWjX8jMMWzEkjDPKTGEPWdnL/FKPOdZ50rYmYNZVF03x9N1l3pw3S0qYhU5sIMxoPG
 VHKYKQyOhqay49xmD/nFMvN5cdXV3euThAGbzgZNCY/KEgsPZy7je7QzSvsaGmw9j86FCLAdOto
 nB0+vYiWCq4rqrWmJ2Yc+dY5ibUt606/jNb7mW2Di0b8rNWzXI1QBKCvp1Sx0ur3kaLjAjtj+ek
 Z7H0d4Lx6OWBaddleKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX3WKetx94+kyB
 Zb6YK6Xc1PBr69ZAi+VvetVxFQhY4tFkHA5yjLQU7Bw2TlxKMmgOQH8mtW+xSiN4mkKVab0COLz
 Fj56dq+qmXK3ok4HAzpR9Di2L36drJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113111-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99A35684915

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1


