Return-Path: <linux-arm-msm+bounces-22959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E24C90C050
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 02:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10CC21C20D76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 00:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3B24C9D;
	Tue, 18 Jun 2024 00:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eEqP0G36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7B54C7C;
	Tue, 18 Jun 2024 00:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718670391; cv=none; b=LhKM5992Sf1g8yzYaGIGP080Iu/knIT6aEW7BuIOPey7WfW277gK147cuSYSPo282ykOsAuM3inLknUCp/Ug92zZHQveVn64p7zEF5BqoKh/BpCDnPBDE7rJ4gK3w/+3ppyp38+cCwTowsqmZv6gjsaajZOR9dG8OvH5a7CKESU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718670391; c=relaxed/simple;
	bh=reeVrLOqwgdIWsL9AdTMmQHj3mGW4vYjVQkg32JaCH0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PDCfg8Zgy7C9r0qJlOxcYQyi4mr6KM4Cq57fM+pVZfABpnE20eSAGekKVSAucZsh07jnal8NP53kHS3uNRPuXy5Xd1f94EL9oExws8UfqICg+kyXpsvX8IYGPoYt0wTwQQiuqfewEZaqKDbBJQYS5kwybEN+75Dig6o+j2uSo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eEqP0G36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HMbuoR021328;
	Tue, 18 Jun 2024 00:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	reeVrLOqwgdIWsL9AdTMmQHj3mGW4vYjVQkg32JaCH0=; b=eEqP0G36ArvsCtp2
	olLGOah7tqLU0bjqUYvS2hrhZBFquCRlAFUecdu6CX29T7/A8Ky7kFMjezRN77IG
	I2tvXzR2X10Ay6gpnjUtAjztXDzAjPi1xaxGZYhGBI3yPkh098icvUBQ9cTWgOMI
	fRzuJp5Vk7umoHe7ceR1jdLZvU17YE9sJ+AZSOZqDRkST0qG+KvGWOTp1nU5mjfx
	HLuE0cfJzsec0mLaV0gyHSjIH5XWKa6b5NNy3qNLkDOnQGxuVQtQHiF418sP0O/M
	sBbrIPFthOEfz4W8WbcI1nUlIdqcC5EZRYrTvAZsM6DwKVUVMeW4gqwq5z2KeH2U
	VDMBsA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytx3wr4m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 00:26:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I0QI70030167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 00:26:18 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 17:26:14 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Mon, 17 Jun 2024 17:26:14 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        "Gaurav Kashyap (QUIC)"
	<quic_gaurkash@quicinc.com>,
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
        "ulf.hansson@linaro.org"
	<ulf.hansson@linaro.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>
Subject: RE: [PATCH v4 13/15] dt-bindings: crypto: ice: document the hwkm
 property
Thread-Topic: [PATCH v4 13/15] dt-bindings: crypto: ice: document the hwkm
 property
Thread-Index: AQHaUXhKMdiCdvq2U0iHJQ04R2/mK7Dw+oYAgAVuJICA15X98A==
Date: Tue, 18 Jun 2024 00:26:14 +0000
Message-ID: <9892c541ba4e4b5d975faaa4b49c92ba@quicinc.com>
References: <20240127232436.2632187-1-quic_gaurkash@quicinc.com>
 <20240127232436.2632187-14-quic_gaurkash@quicinc.com>
 <301be6d8-b105-4bba-a154-9caebc8013e3@linaro.org>
 <dd219c40-33d5-43ff-b0da-16ccf0198bb9@linaro.org>
In-Reply-To: <dd219c40-33d5-43ff-b0da-16ccf0198bb9@linaro.org>
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
X-Proofpoint-GUID: u87o1qFjA_Ow3Pouiq8et6FWaBcKu1q_
X-Proofpoint-ORIG-GUID: u87o1qFjA_Ow3Pouiq8et6FWaBcKu1q_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180002

SGVsbG8gS29ucmFkIGFuZCBLcnp5c3p0b2YNCg0KT24gMDIvMDEvMjAyNCAxMToxNCwgS29ucmFk
IER5YmNpbyB3cm90ZQ0KPiBPbiAyOS4wMS4yMDI0IDA5OjE4LCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiA+IE9uIDI4LzAxLzIwMjQgMDA6MTQsIEdhdXJhdiBLYXNoeWFwIHdyb3RlOg0K
PiA+PiBXaGVuIFF1YWxjb21tJ3MgSW5saW5lIENyeXB0byBFbmdpbmUgKElDRSkgY29udGFpbnMg
SGFyZHdhcmUgS2V5DQo+ID4+IE1hbmFnZXIgKEhXS00pLCBhbmQgdGhlICdIV0tNJyBtb2RlIGlz
IGVuYWJsZWQsIGl0IHN1cHBvcnRzIHdyYXBwZWQNCj4gPj4ga2V5cy4gSG93ZXZlciwgdGhpcyBh
bHNvIHJlcXVpcmVzIGZpcm13YXJlIHN1cHBvcnQgaW4gVHJ1c3R6b25lIHRvDQo+ID4+IHdvcmsg
Y29ycmVjdGx5LCB3aGljaCBtYXkgbm90IGJlIGF2YWlsYWJsZSBvbiBhbGwgY2hpcHNldHMuIElu
IHRoZQ0KPiA+PiBhYm92ZSBzY2VuYXJpbywgSUNFIG5lZWRzIHRvIHN1cHBvcnQgc3RhbmRhcmQg
a2V5cyBldmVuIHRob3VnaCBIV0tNDQo+ID4+IGlzIGludGVncmF0ZWQgZnJvbSBhIGhhcmR3YXJl
IHBlcnNwZWN0aXZlLg0KPiA+Pg0KPiA+PiBJbnRyb2R1Y2luZyB0aGlzIHByb3BlcnR5IHNvIHRo
YXQgSGFyZHdhcmUgd3JhcHBlZCBrZXkgc3VwcG9ydCBjYW4gYmUNCj4gPj4gZW5hYmxlZC9kaXNh
YmxlZCBmcm9tIHNvZnR3YXJlIGJhc2VkIG9uIGNoaXBzZXQgZmlybXdhcmUsIGFuZCBub3QNCj4g
Pj4ganVzdCBiYXNlZCBvbiBoYXJkd2FyZSB2ZXJzaW9uLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBHYXVyYXYgS2FzaHlhcCA8cXVpY19nYXVya2FzaEBxdWljaW5jLmNvbT4NCj4gPj4gVGVz
dGVkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4NCj4gPj4g
LS0tDQo+ID4+ICAuLi4vYmluZGluZ3MvY3J5cHRvL3Fjb20saW5saW5lLWNyeXB0by1lbmdpbmUu
eWFtbCAgICAgfCAxMCArKysrKysrKysrDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0DQo+ID4+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2NyeXB0by9xY29tLGlubGluZS1jcnlwdG8tDQo+IGVuZ2luZS4NCj4g
Pj4geWFtbA0KPiA+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8v
cWNvbSxpbmxpbmUtY3J5cHRvLQ0KPiBlbmdpbmUuDQo+ID4+IHlhbWwgaW5kZXggMDllNDMxNTdj
YzcxLi42NDE1ZDdiZTliNzMgMTAwNjQ0DQo+ID4+IC0tLQ0KPiA+PiBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vcWNvbSxpbmxpbmUtY3J5cHRvLQ0KPiBlbmdpbmUu
DQo+ID4+IHlhbWwNCj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2NyeXB0by9xY29tLGlubGluZS1jcnlwdG8tDQo+IGVuZw0KPiA+PiArKysgaW5lLnlhbWwNCj4g
Pj4gQEAgLTI1LDYgKzI1LDE2IEBAIHByb3BlcnRpZXM6DQo+ID4+ICAgIGNsb2NrczoNCj4gPj4g
ICAgICBtYXhJdGVtczogMQ0KPiA+Pg0KPiA+PiArICBxY29tLGljZS11c2UtaHdrbToNCj4gPj4g
KyAgICB0eXBlOiBib29sZWFuDQo+ID4+ICsgICAgZGVzY3JpcHRpb246DQo+ID4+ICsgICAgICBV
c2UgdGhlIHN1cHBvcnRlZCBIYXJkd2FyZSBLZXkgTWFuYWdlciAoSFdLTSkgaW4gUXVhbGNvbW0g
SUNFDQo+ID4+ICsgICAgICB0byBzdXBwb3J0IHdyYXBwZWQga2V5cy4gSGF2aW5nIHRoaXMgZW50
cnkgaGVscHMgc2NlbmFyaW9zIHdoZXJlDQo+ID4+ICsgICAgICB0aGUgSUNFIGhhcmR3YXJlIHN1
cHBvcnRzIEhXS00sIGJ1dCB0aGUgVHJ1c3R6b25lIGZpcm13YXJlIGRvZXMNCj4gPj4gKyAgICAg
IG5vdCBoYXZlIHRoZSBmdWxsIGNhcGFiaWxpdHkgdG8gdXNlIHRoaXMgSFdLTSBhbmQgc3VwcG9y
dA0KPiA+PiArIHdyYXBwZWQNCj4gPg0KPiA+IEhvdyBkb2VzIGl0IGhlbHAgaW4gdGhpcyBzY2Vu
YXJpbz8gWW91IGVuYWJsZSB0aGlzIHByb3BlcnR5LCBUcnVzdHpvbmUNCj4gPiBkb2VzIG5vdCBz
dXBwb3J0IGl0LCBzbyB3aGF0IGhhcHBlbnM/DQo+ID4NCj4gPiBBbHNvLCB3aGljaCBTb0NzIGhh
dmUgaW5jb21wbGV0ZSBUcnVzdHpvbmUgc3VwcG9ydD8gSSBleHBlY3QgdGhpcyB0bw0KPiA+IGJl
IGEgcXVpcmssIHRodXMgbGltaXRlZCB0byBzcGVjaWZpYyBTb0NzIHdpdGggaXNzdWVzLg0KDQpB
cG9sb2dpZXMgZm9yIG5vdCBhZGRyZXNzaW5nIHRoaXMgZWFybGllciwgd2UgY2FuIHBlcmhhcHMg
Y29udGludWUgdGhpcyAgZGlzY3Vzc2lvbiANCmluIHRoZSBuZXcgcGF0Y2ggdGhyZWFkLiBJIHdp
bGwgbGluayB0byB0aGlzIHRoZXJlLg0KDQpTTTg0NTAgYW5kIFNNODM1MCBRQ09NIElDRSBib3Ro
IHN1cHBvcnQgSFdLTSBpbiB0aGVpciBJQ0UgaGFyZHdhcmUuDQpIb3dldmVyLCB3cmFwcGVkIGtl
eXMgY2FuIG5vdCBiZSBlbmFibGVkIG9uIHRob3NlIHRhcmdldHMgZHVlIHRvIGNlcnRhaW4NCm1p
c3NpbmcgdHJ1c3R6b25lIHN1cHBvcnQuIElmIHdlIHNvbGVseSByZWx5IG9uIGhhcmR3YXJlIHZl
cnNpb24gdG8gZGVjaWRlDQppZiBJQ0UgaGFzIHRvIHVzZSB3cmFwcGVkIGtleXMgZm9yIGRhdGEg
ZW5jcnlwdGlvbiwgdGhlbiBpdCBiZWNvbWVzIHVudGVzdGFibGUNCm9uIHRob3NlIGNoaXBzZXRz
LiANCg0KU28sIHdlIHdhbnQgYW5vdGhlciB3YXkgdG8gZGlzdGluZ3Vpc2ggdGhpcyBzY2VuYXJp
bywgYW5kIGhlbmNlIEkgY2hvc2UgYSBEVCB2ZW5kb3IgcHJvcGVydHkNCnRvIGV4cGxpY2l0bHkg
bWVudGlvbiBpZiB3ZSBoYXZlIHRvIHVzZSB0aGUgc3VwcG9ydGVkIEhXS00uDQpJZiB0aGVyZSBp
cyBhbm90aGVyIHdheSwgSSBhbSBvcGVuIHRvIGV4cGxvcmluZyB0aGF0IGFzIHdlbGwuDQoNCj4g
DQo+IENhbiB3ZSBzaW1wbHkgZXZhbHVhdGUgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgc2VjdXJl
IGNhbGxzPw0KPiANCg0KVGhpcyBtaWdodCBub3Qgd29yayBhcyBVRlMgY3J5cHRvIG5lZWRzIHRo
aXMgaW5mb3JtYXRpb24gbXVjaCBlYXJsaWVyLCBhbmQgYmFzZWQNCm9uIHRoYXQgLCBpdCB3b3Vs
ZCBuZWVkIHRvIHJlZ2lzdGVyIHdpdGggdGhlIGtleXNsb3QgbWFuYWdlciAoYW5kIGJsb2NrIGNy
eXB0byksIA0Kb24gd2hldGhlciB3cmFwcGVkIGtleXMgYXJlIHN1cHBvcnRlZC4NCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTEwNDIxMTI1OS4xNzQ0OC0yLWViaWdnZXJzQGtlcm5l
bC5vcmcvDQogDQo+IEtvbnJhZA0K

