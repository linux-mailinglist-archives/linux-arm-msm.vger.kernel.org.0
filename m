Return-Path: <linux-arm-msm+bounces-118716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PBitI8i7VGoiqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:19:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5804749B70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:19:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IMpGsHrh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eqpZ14J5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118716-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118716-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D572630648F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B793E7BB0;
	Mon, 13 Jul 2026 10:17:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B423E639D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:17:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937868; cv=none; b=hlgUszgXISv2h3qNNg60IlFo9x/sHw353AXACaYU6VgQc1Kwg2tuN7BcxtLorBAnQrB/wjZ5s57YTQzKNKGHsESeI+mImvY0a5R/QgM3EFlNBeCVIxtf7fiEYL+Y4gLWCYrIflr7BZOGi0yJwz4pc8M8VUWw4neel2EykuyI3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937868; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnC3vupP2aXGSO5AWNm8AWvvkEszmxQUeg2YbGvl98c/py0QjJOx4EKAQvHI6Xtsj88aMMe0GnHv2GnDQb34izX/a02FlYBNkm4nvXdhO9+SGFgJaiFFk87/w4uHjrzaEritrWbrVhpPGYo+jC1s19wFVMVlC4sgAZBPrw/nwaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMpGsHrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqpZ14J5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Kc8S774697
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=IMpGsHrhYU/Bjnnu
	l7TBLCS8mzX1iFVdNCGSirLcuEa2sBRnnJiyJMVVx0cyI6DCKXxEXVRqbv8U9y1r
	BkD3SJDiofeFjooEq2r7FbDLmd5dBgMlCd6XjfqK2zNF4BQ+U7Hq1eeWUNyBDBSZ
	N1flU2U+Vc9bfmiAFLqY08b7CxUNEArKHuyRBpL/6Jvnq3ZhJWEWdHRDXItEDDEt
	tTzLqWd83sF9HrBp/EcCn2Za8oHIQxiiXQ/CYADflk9bdQje0vw0kX9l3pcjZ0w9
	DYDzij3oULzlpQUgCcAs3b7f+WFE5Zcb0NMmWilsYaspvkXFj+DUyLG6jgi+6MRX
	ZlWI8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00nx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:17:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so62071525ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783937865; x=1784542665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=eqpZ14J5WvAvUkyW/B6rldlEtgAUQVGxGAhrD3pnW1FoLcMqJn1T5KR7DvQf0oI+od
         pm+p1OhfD4G0Hpmmn2bsZmDIV9VxlDouJ+vi/Hi9Rm7+lNIF8F5SnTJL3tJ1zla0/ERM
         2rmpC0rSmyP6EZHLImBGedwHfB71zkl0kOTHtldp7s0Z5WLqk5ZSCewL8b/AfFhot7TK
         AkMLNLeNUizgfSCniNmGF1Zl+9AxvOsZ3EwLWWLMnedAn4IRQyrtoYFmAj0MaUsJjkkE
         dDaiwVCSXVRbsQOdrdJ4sDsxxTcKRCc/9tzKvkKW1muTLr5Ar2EcDzcS359szQQziFxe
         sSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937865; x=1784542665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=XSrlCPXMyAu58eKmFG7z2m1CqUlgNQumWKvC90WPFrKUwPujL3btMGxzDciHqYu5UM
         nE+VAT61Pq6isw07oOAPbAMkxNQpsElna9fGZyex9zNSKcVXznA+lwPpYBuDrrQdUrZm
         kgInnTSpmykiwMzgEljomkr8X0dl6x1kQrB0cA4lHoN8pIrCO+5Vfm3YN59f45RIyyRl
         MXQ0IUcxM+bmRxpod2sHWqUl9pQ0rhDDnp6P1SvCB85pqB1KthFJiefUPozVXX4AH5An
         SMm+ZLqMT8IJjUr/cyvrQSYkhAdSjWsPWC1WrvR1TZjlcpQ60qCaxBvkg2mxfQDcJoQn
         FO2A==
X-Forwarded-Encrypted: i=1; AHgh+RrKWsVIMu8YnG7ZAtKCVq+SoPEvznGzyepj9ZAjWA5XqVVOTeDUWCBzLTM95ZGk0BtrOHjK0MI9MovPxm4g@vger.kernel.org
X-Gm-Message-State: AOJu0YyUYmC7j/HbL6zAqx23Sw4AvywRfYnGl7752JBThV8WxWp9PKiH
	5KyYMED0x1x1IFgW0Pqy0viX21PbT8lk0EwV+mYgw+k8XZvxr6PLtfdN6VZZ7S1rGks1fXI5+Mm
	qGjbb/IwmH8EOG2APRgocf5oHT5x5xjFUCqDyle8ep8onDdPhxYNZG+d+Skw3a4R8x+WMhoj2Tn
	d2iLo=
X-Gm-Gg: AfdE7cnc59wEJePWCVbzcrfF0GOrKoOlj3InOWAzYF+ISDOoWes4gTorSBIQTz0w9Cg
	pPCfPCKgqsIQWILQNaWX6flfqWJXFfmqXdPXBagMusct9Wz8f+vMKrhRbNYuCPPZoyiF/Fza4Q+
	daHPsVa9R3W6uEokgkRA/IhEbLehGiHmNSloqQ2x6+6IDUnAnJ0gbu/ZZU5Tz05cUcCI4b8/NrH
	+E3mjw7Hxf21IjcL6yiWnGojN6buYhjyQc43RwyQW+Tk5bZeJzoG0bLeHeqb/+VBkTu3pczXULT
	X14Qzu61yFXywuMwm/xTMM2MgGT3xXGkWUbvx3tja+o5iJGcyN/WO84fSO0sZfuMWDyUhynCiHz
	pYhtTlh9GHCOoXOuQrjC0C1DK27dINcc+EPQ15M6pf2ayflw5JuR2FxhIGBSTPVhqIf5J/5rbgP
	0uB8gPC7TZFw==
X-Received: by 2002:a17:902:d2c8:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2ce9eace276mr84813515ad.15.1783937865337;
        Mon, 13 Jul 2026 03:17:45 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2ce9eace276mr84813245ad.15.1783937864904;
        Mon, 13 Jul 2026 03:17:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm98257925ad.39.2026.07.13.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:17:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:17:27 +0800
Subject: [PATCH v9 2/2] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-enable_iris_on_purwa-v9-2-633d7b87f0c9@oss.qualcomm.com>
References: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
In-Reply-To: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937849; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=dyX9On16Ld4tkiOAnHRplOwY2mAj27jfz661dBMxoW6xrBgHyAo/pJbiT2//GW5yXVpdAaDy7
 gw1ElsB08MQDuSkenjq3GwxjH7J4IE2FlcLvWFVfLbnP1pXrwjt6Eyu
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfX626pjNR6uJMB
 D4QcanicmQebG9FO/SsBny9z5S7wIFPoLTaAsIe0+VlRgJCcNovfTgGXjP11fDF6/9ub1YWhHIM
 jUZOYdDh7KYLtRqovqLU/XqnyuoeZyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfXzQy+vWVrGweh
 WlKrMf7XK2lXhC6Ta/pQAjusXDifnv/oNpHzUVvUICO24bKqq8eZoFlKaKefHrFs8nwkRxmMITs
 U0NCgpcAxxFcbPKLjG9M/VqKtpN+yETwP1qghzEz7F3b0aNG/ReDT9lF2vKlRrhYxMO+5wwLnDc
 QHNeL/LSWdwFxyhCIcVxEsMnaxOf81eGrSdWS1uOPR4LFHaA8zAAb9bbtjpNY+urGM1BZZO+wVl
 SfWJN/b8mLNrmA9FQ8Q4YvEEYkqhtar+T5UoEpJSjQPTRUF/DDD9QWN5nECRokc6A0AfU9X9y8t
 CnEpxiIiunTu3BcR5/TyTfXRFeTOkbFxmaa8EeGdgI20+znYMG70fnnot4p/j8T58jRMfZZtDCf
 082eZOAeTS22P1uMvv8YD44xpxdvQaeFCTjQcDGJIi5X1H2k9UriW4sG16KqWcYQeIP0D3vpB/7
 c0+upkM56xppshXPsCA==
X-Proofpoint-ORIG-GUID: HT7toPKdRNyU5qz2_jP9fXqjs0X3-qsG
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54bb4a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: HT7toPKdRNyU5qz2_jP9fXqjs0X3-qsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118716-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5804749B70

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0


