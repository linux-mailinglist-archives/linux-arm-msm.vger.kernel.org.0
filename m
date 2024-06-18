Return-Path: <linux-arm-msm+bounces-22960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8214590C060
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 02:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995DD1C20F61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 00:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B581865C;
	Tue, 18 Jun 2024 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lu6Htrs4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA6813FF9;
	Tue, 18 Jun 2024 00:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718670975; cv=none; b=iH2KdsBfGiPw2hfwJSRovjJ4LqgtALsEBqcVzelQMdPVV68LfliPs011IlXbWr/5RmVHRzZmSm2FTRLd0IUBLuwd2Ka4AwpHT+deueutp2tJgoUYb4FxZMt4uC5Zme36yMLXNxXE6sSC0chHjgwK8ucLaO8/V7FJzUFy83fhkLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718670975; c=relaxed/simple;
	bh=l5oHj8r4X4O3f01X+Du/SbkcT1hBxpkWDNfZfZPYgqQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NjZ5qs2iKQDAimxISbr4DsGAY+9JUXoYCjiFnUDpgCKzM0cyywmZYCU/Pt/zbjlbnYtZCqMBumq5rlDiCN9+CaxLbuobwuhksGR+7VHloEaBncqleYwfSJbGPdSx0TTvGQTea+IGmuQcLE9Pmmy3ACASlX1cs9e+FAv9w9H/v/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lu6Htrs4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HKh8Xb018761;
	Tue, 18 Jun 2024 00:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5oHj8r4X4O3f01X+Du/SbkcT1hBxpkWDNfZfZPYgqQ=; b=lu6Htrs4ZYEAgsxA
	dq3/4rT3MG9Db6j/9erV2JOPfZrs8p6WUQKlSwwQmjh/3teFqdpm0vvd07AWf5Ev
	2rLu9OM4KfaKvMOWFv6waasKtiKkAONSWZ5NhfrPybeInwP9NzGmcC5C10nAwzpX
	FBEQaXM38vx7OYo3IABJRBLNerJzhgwivSjqxy/kXSxE/o/xac6qZw0Lz8981cF2
	5HoPGhht9issqWyMJbudkWMxW+2XTdr8QHhkPhwY7LUVbu3y9fCq+rPD/3m1Vg8p
	QfBtSQKlloK1Tns23iGgLUZ0e3rHcleGWqvX2KhTrtD4SVLYREJBY2NzrCIEh9FV
	m7FLzw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys3b755nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 00:36:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I0ZxZv007873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 00:35:59 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 17:35:55 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Mon, 17 Jun 2024 17:35:55 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Gaurav Kashyap
 (QUIC)" <quic_gaurkash@quicinc.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "ebiggers@google.com" <ebiggers@google.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        srinivas.kandagatla
	<srinivas.kandagatla@linaro.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel
	<kernel@quicinc.com>,
        "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Om Prakash Singh (QUIC)"
	<quic_omprsing@quicinc.com>,
        "Bao D. Nguyen (QUIC)"
	<quic_nguyenb@quicinc.com>,
        bartosz.golaszewski
	<bartosz.golaszewski@linaro.org>,
        "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>,
        "ulf.hansson@linaro.org"
	<ulf.hansson@linaro.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Sonal Gupta <sonalg@quicinc.com>
Subject: RE: [PATCH v5 13/15] dt-bindings: crypto: ice: document the hwkm
 property
Thread-Topic: [PATCH v5 13/15] dt-bindings: crypto: ice: document the hwkm
 property
Thread-Index: AQHawFGXatdRamw0hEaj/PQeSvaH7rHMAUqAgAEiYEA=
Date: Tue, 18 Jun 2024 00:35:55 +0000
Message-ID: <af1df42efdb4497cb174bc664c692651@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-14-quic_gaurkash@quicinc.com>
 <a9d8606d-fb4a-4394-bab6-3304e1f8b9e5@linaro.org>
In-Reply-To: <a9d8606d-fb4a-4394-bab6-3304e1f8b9e5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ed_Sk8giK7uJLcUkYfxlfnhLd4MgNr-V
X-Proofpoint-ORIG-GUID: Ed_Sk8giK7uJLcUkYfxlfnhLd4MgNr-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180002

SGVsbG8gS3J6eXN6dG9mDQoNCk9uICAgMDYvMTcvMjAyNCAxMjoxNyBBTSBQRFQsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE3LzA2LzIwMjQgMDI6NTEsIEdhdXJhdiBLYXNoeWFw
IHdyb3RlOg0KPiA+ICsgIHFjb20saWNlLXVzZS1od2ttOg0KPiA+ICsgICAgdHlwZTogYm9vbGVh
bg0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIFVzZSB0aGUgc3VwcG9ydGVkIEhh
cmR3YXJlIEtleSBNYW5hZ2VyIChIV0tNKSBpbiBRdWFsY29tbSBJQ0UNCj4gPiArICAgICAgdG8g
c3VwcG9ydCB3cmFwcGVkIGtleXMuIEhhdmluZyB0aGlzIGVudHJ5IGhlbHBzIHNjZW5hcmlvcyB3
aGVyZQ0KPiA+ICsgICAgICB0aGUgSUNFIGhhcmR3YXJlIHN1cHBvcnRzIEhXS00sIGJ1dCB0aGUg
VHJ1c3R6b25lIGZpcm13YXJlIGRvZXMNCj4gPiArICAgICAgbm90IGhhdmUgdGhlIGZ1bGwgY2Fw
YWJpbGl0eSB0byB1c2UgdGhpcyBIV0tNIGFuZCBzdXBwb3J0IHdyYXBwZWQNCj4gPiArICAgICAg
a2V5cy4gTm90IGhhdmluZyB0aGlzIGVudHJ5IGVuYWJsZWQgd291bGQgbWFrZSBJQ0UgZnVuY3Rp
b24gaW4NCj4gPiArICAgICAgbm9uLUhXS00gbW9kZSBzdXBwb3J0aW5nIHN0YW5kYXJkIGtleXMu
DQo+IA0KPiBObyBjaGFuZ2Vsb2csIHByZXZpb3VzIGNvbW1lbnRzIGFuZCBkaXNjdXNzaW9uIGln
bm9yZWQuDQo+IA0KPiBOQUsNCg0KQXBvbG9naWVzIGZvciBub3QgYWRkcmVzc2luZyB0aGUgcHJl
dmlvdXMgY29tbWVudHMuDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvOTg5MmM1NDFiYTRl
NGI1ZDk3NWZhYWE0YjQ5YzkyYmFAcXVpY2luYy5jb20vDQoNCk1heWJlIHdlIGNhbiBjb250aW51
ZSBvdXIgZGlzY3Vzc2lvbiBoZXJlOw0KIiBTTTg0NTAgYW5kIFNNODM1MCBRQ09NIElDRSBib3Ro
IHN1cHBvcnQgSFdLTSBpbiB0aGVpciBJQ0UgaGFyZHdhcmUuDQpIb3dldmVyLCB3cmFwcGVkIGtl
eXMgY2FuIG5vdCBiZSBlbmFibGVkIG9uIHRob3NlIHRhcmdldHMgZHVlIHRvIGNlcnRhaW4NCm1p
c3NpbmcgdHJ1c3R6b25lIHN1cHBvcnQuIElmIHdlIHNvbGVseSByZWx5IG9uIGhhcmR3YXJlIHZl
cnNpb24gdG8gZGVjaWRlDQppZiBJQ0UgaGFzIHRvIHVzZSB3cmFwcGVkIGtleXMgZm9yIGRhdGEg
ZW5jcnlwdGlvbiwgdGhlbiBpdCBiZWNvbWVzIHVudGVzdGFibGUNCm9uIHRob3NlIGNoaXBzZXRz
LiANCg0KU28sIHdlIHdhbnQgYW5vdGhlciB3YXkgdG8gZGlzdGluZ3Vpc2ggdGhpcyBzY2VuYXJp
bywgYW5kIGhlbmNlIEkgY2hvc2UgYSBEVCB2ZW5kb3IgcHJvcGVydHkNCnRvIGV4cGxpY2l0bHkg
bWVudGlvbiBpZiB3ZSBoYXZlIHRvIHVzZSB0aGUgc3VwcG9ydGVkIEhXS00uDQpJZiB0aGVyZSBp
cyBhbm90aGVyIHdheSwgSSBhbSBvcGVuIHRvIGV4cGxvcmluZyB0aGF0IGFzIHdlbGwuIg0KDQo+
IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpSZWdhcmRzLCANCkdhdXJhdg0KDQo=

