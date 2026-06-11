Return-Path: <linux-arm-msm+bounces-112663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oFotFMp6KmpAqgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:07:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6F670352
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:07:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P+ZJsfPE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J8MAxrQk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112663-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112663-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88B643026046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02ED1376483;
	Thu, 11 Jun 2026 09:03:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4FB39185E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168609; cv=none; b=ersZqWfY0lirj/Yr/ebeeBKsSuwCjRBdTY6K/4WGqJxMlcDg2b54XrLl6WSQEdjfnukkL1c+jPCjdOFV0n0MH6AbJdZaaF1jKClNFZ8Wn1c+9ruhHmLlb7J9lfdJwxZGO6ldHhGPrrknFd6tbKdn7rUnyREsbx+GDmJ8ljHnA38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168609; c=relaxed/simple;
	bh=sXe88ukQSNsLZHvzyXQa5xxcPKvZD1x3wSbHfVavSEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obq9kBu41HfeblWWByHIazaZOIXE5K3QoF3/ZOba73vXus6vJReb2n5VOcurm3ZhpP328i83V99NIedro2y101gijpl1R/aZDjqFks6Viac4UpTmsWeNWQTlvnxZ6FiF7xqzNhDRCUWY5jX5DOlYfNRdBCYioVhufD6hNZ1VZvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+ZJsfPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8MAxrQk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GnQc3846610
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ou64yNSBPM2pfV/tB9X33X+l86QX/kXFd8dLTHz7OTw=; b=P+ZJsfPEddYxB5VE
	odBoFZ3Vrui5W2fBtB2JfVNanPmARXn0z65PTRH5bb3PPk8h5wfP7/FK8sy35bRc
	cq5Fhvvbul0hsmNGTdkbyLP7krpGcnnBeqLwfa7ZXkLXZivrLfVcZBUcqBGh6bdt
	PyDBJk8FCSklJYAgnKwOR7ybky0HXdBrWSSsTjJY2gEzbtTtlwdysq/OpI7ZyaJJ
	3a1jDlXpcDWQDMAwot09Ct1hVHghT/RnBEvUwapfacQ0OoMufIJWVyHCGlAB1oHc
	YdIi4loJa3kEZZeFQ2NZedobptbbmI2sN6mk2yxPkM/YuDtv0ObAqFloLi5bJVRf
	uDdIAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2k80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf243973c2so54314075ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168607; x=1781773407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ou64yNSBPM2pfV/tB9X33X+l86QX/kXFd8dLTHz7OTw=;
        b=J8MAxrQkfLSgJkGosICjZd/+rsLdNx769EXZZVHM3H1HthgmFN7LW/ZxpeNWU0QcGD
         /A+blAcSNw3tE7PRvkRmswJqI1ITp4+4HoE3TxJlEE2AjR3yVFVmgLaik/Oenj6/gtdS
         20rlR+Ni/p1GvnQUZhOaeYmvAC1o/FxrKGvfFMA5TOX3RvKu2UsR067AbTtXCIq7fNx2
         WgFmHnOkwnpaEBr/YrW7xHG9miCL/DgAMJdCA4l2p+TlPSNBjjYiXHEuo2bQzqj96T1x
         alPixuaIXY78cLrmDgtzspygNiMLiPC8vAl7PLFCEQF/AfICJmlQT4xmwyyaf/Ujy6wA
         /PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168607; x=1781773407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ou64yNSBPM2pfV/tB9X33X+l86QX/kXFd8dLTHz7OTw=;
        b=RBky3HhboMoMTCjmN1EtiJF5e73PMr2AuEap4gIZKnLT+q7BDbu/yQk7n6sD0YfrnQ
         gl5IT3ce8mgWVuo8v3YmOMJRuoFEDy7Sc7E6k8+RPcS/eW2WQLD3wJkasybs7ET/jf8l
         zbwYnEDn2t1bo8bPTzO47Q8TYNdy74Z6nw/s7fUEkr/TOH17d2J7zXOgFnxHh/2y/+M7
         FfG9SHUIapq+IhAvDmSN+TImn9oG1BuBLF/EgW8SOZanxPy8s/v9WkFUF1easWDI0Rq2
         OEScVbHwbxYinG1EtuYjTgFIUcHLHIdavVOGmUOE/ryHLa8/Hah4LyyZzn6xOdS74FkO
         YfPw==
X-Gm-Message-State: AOJu0Yw3t5N3ic+9qB7ce8hD+7vAF8N2n5NDqa8hIBdQlLqnphuiDGvL
	t/jF4L1jAAzhUk8O5TtIZMqrwD+2YnNnyWPiZP2RyHP0sSlL2rwIZ1XM3ZCxpberCtJsgS1UeZN
	00IOb93f6PcI/EtzXor/DGHEnaLiy1ISmJg5Tj7EPEigck09QZp6uk/fVK11adVe3kRhc
X-Gm-Gg: Acq92OEIYcPRwimTvH7uELVcRuTQpVEweOo2IQbIn8fkBYjnUa8nNYA08ByIg8YziMt
	5lQcE3eQsAkxcFLO0G/EYzBw9POarUvZn7Mw5m2r1G7KANojCPjKE3GgJsr/aDjDghTWPHX9yr5
	FTox4e6eBLp/BNxZFXm5KR91H1IfRcMhZtCTTVwJHRN4mqFmbnAkFwxS5ziGbil7fYAdPY4lhTV
	7a1zvgznWCT0M2KTrwBvn7BJPaD8x0FZC4FVf5xBaDNezJSspjDp+gXy67NhnrpJwCv3tpaqKwb
	4kqDTMcq+iiiqT9EdXW2deSmz8qHqLAKX9AKdC4tEt0FPpiGgEs2Z732m+Udf3R65TIpmiREEvN
	2NtSEk997RNo0BWfSVNzT4Z1iduy442Mn/AAkcw8rThL+V4Dz+aJAfK+pY3PiiIUba5AKBF77VW
	9QMURFRiavSouylz0C1wF9e6B83i4HV1xTpLXh42/iEZeecCjjCImuE0lZrv1SlBoFuDk=
X-Received: by 2002:a17:903:2acc:b0:2c1:4310:d80 with SMTP id d9443c01a7336-2c2f0731e2bmr25403495ad.8.1781168606688;
        Thu, 11 Jun 2026 02:03:26 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:2c1:4310:d80 with SMTP id d9443c01a7336-2c2f0731e2bmr25403035ad.8.1781168606280;
        Thu, 11 Jun 2026 02:03:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm140980535ad.38.2026.06.11.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:33:16 +0530
Subject: [PATCH v2 1/3] regulator: qcom-refgen: correct the regulator type
 to CURRENT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-ipq9650_refgen-v2-1-d96a91d5b99e@oss.qualcomm.com>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
In-Reply-To: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a79df cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VkQhxhI6jZxeKeB4iE0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ZbQjRa1hT9v7Y0-2uIQbnrKfFN2rMZB-
X-Proofpoint-GUID: ZbQjRa1hT9v7Y0-2uIQbnrKfFN2rMZB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX9Tb/YUjih7u2
 x/lnUU/Kubh/aSbD/KU8nz/JkJ3MzL5fDaC+n7+qJgHLrRvRXZIIHCtZxZcieFN/MmSIogjCEkb
 9jHg81bNMGSQYwJCJZrPue39xVcLCehc1O7qDSM/3mLkqkfUWtl4AXQfIbxLz0KovG7fzso5bgg
 5kQQ+S89C2awMa/HB8prlBlQJ1cV+XrquaBHNQfFJKeLZwbhAaUI6/ME76kSiRopfzLgiBj0RUl
 Pm5KghZUkKnAsVl7120priwPE5VsDXlRIrUg9Nci4cGNmko6UyXSzQ7/Tg7hSU/0n5MhvRRdnpR
 5CJdRcMUw6w44jX0EwFNeXkPOJRn6UbxFwxNS0S1hx/IFTdzRZ8na47tBcIJg4afnbkVwd5TLiC
 nH0AUf1ED1sJC9jUglha14RVks3894eEORNWJfc1cZ+eZU/HKg5TNVisoTwEySQh5/2JLGolsgc
 VeUvL8EB7+Y3sJ6nLlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX/sAqOLS6xEcY
 O0bfI2vUWPP5BOl3vS717COdJ5+eTcoHBouxTSkykxp5nDH2O6zJV3tyYdCIfXkQYzg6GsCZDxd
 YrSnMUHgn+585EmhXwgkRNHdbLhLLz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112663-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93C6F670352

As per the REFGEN IP team, this block supplies the reference current to
the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
to match with the HW behavior.

Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
Cc: stable@vger.kernel.org
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 299ac3c8c3bc..6a3795469927 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -66,7 +66,7 @@ static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= qcom_sdm845_refgen_enable,
 		.disable	= qcom_sdm845_refgen_disable,
@@ -82,7 +82,7 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= regulator_enable_regmap,
 		.disable	= regulator_disable_regmap,

-- 
2.34.1


