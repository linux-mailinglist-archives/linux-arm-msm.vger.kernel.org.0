Return-Path: <linux-arm-msm+bounces-23303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C205A90F8BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 00:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BF2F282327
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3F17FBA8;
	Wed, 19 Jun 2024 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PQeH3IVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951678B4C;
	Wed, 19 Jun 2024 22:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718834604; cv=none; b=VcpgVqoTQBsf5AVZjYhlkOxfqdlsr/5X41Fn4RPmi2guQz98II/GJYeTe1paI3tGkD+3nrUQWXayPQg0Ir7EIzxHESJJqlZoC544+q/6TvK4RPXFMICr1J4S0wl5I2TRteMH4kbnDZsyjYrFTIPDoaBlVB7WHiA//JpoL1ADfj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718834604; c=relaxed/simple;
	bh=hNJUGCfw45ZSne0v7dRDSULucoLvp5Sdb/JBgBH6hdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CLeSL6SEJmmYx6tvl9w2Qa2yU7OZHszRpzPMPTsg96vqB0z2/axIcSwiwZ6d1jDOPT/XlifBCZiH8c4dili0y6UjQIlOQVQYT/e5MxGDQ0ClsBjJKbdSErjr9IdheltBCcZ3tEnBxfxBAdQ0QzfNJOwzVzu/vM/SLlOItmRUvXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PQeH3IVq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JEvo6e024960;
	Wed, 19 Jun 2024 22:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNJUGCfw45ZSne0v7dRDSULucoLvp5Sdb/JBgBH6hdI=; b=PQeH3IVq0qtPGi8j
	Rtnyyk8I5h1Jf422xXwTjVNqF4y3xwanVm4nsT/0q2lKsEXeW7KOKfiwymJZ6vbe
	c+xsqbZEb3BxO8MqNknWmauIgDZlwM/o4675v0HsyT8f+6ypkzKNBlL4R5HCjwdI
	s4xn5xWlb9ku2qoK6hMz1YBAbnKQqmSzP6+uyKtvw6PNkNjDE4gRLW3md7NmtQYA
	f3/w3IZLrBzENZsEmswQ9YCULE9zGdyQ4uCL1iCN6WiWbxQ8eYU3kmVyJFOqY9Sy
	0w8ahrTvp9Fjv+c6MCWTzkI/AjpKlVBszpEvobs3In1iqgnOyrkHYRuuvXzR7jVd
	edbCGQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv1j90sev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:03:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JM38XJ019014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:03:08 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 15:03:05 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Wed, 19 Jun 2024 15:03:05 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        "Gaurav Kashyap (QUIC)"
	<quic_gaurkash@quicinc.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "ebiggers@google.com" <ebiggers@google.com>,
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
Subject: RE: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Thread-Topic: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Thread-Index: AQHawFGQ2Cb4IdeC1UawBk8ySHD6CrHNksUAgAD6HQCAAJfhgIAA+NyQ
Date: Wed, 19 Jun 2024 22:03:04 +0000
Message-ID: <64ea2ecbf55f4dcf94e2243ce0eaaf58@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <ad7f22f5-21e4-4411-88f3-7daa448d2c83@linaro.org>
 <51a930fdf83146cb8a3e420a11f1252b@quicinc.com>
 <22121526-c6c7-4667-af82-76725ad72888@linaro.org>
In-Reply-To: <22121526-c6c7-4667-af82-76725ad72888@linaro.org>
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
X-Proofpoint-ORIG-GUID: Z7SP2k0emvlc7jEPd-bEvoevHCW2568q
X-Proofpoint-GUID: Z7SP2k0emvlc7jEPd-bEvoevHCW2568q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190167

T24gMDYvMTkvMjAyNCAxMjoxMiBBTSBQRFQsIE5laWwgQXJtc3Ryb25nIHdyb3RlOg0KPiBMZSAx
OS8wNi8yMDI0IMOgIDAwOjA4LCBHYXVyYXYgS2FzaHlhcCAoUVVJQykgYSDDqWNyaXQgOg0KPiA+
IEhlbGxvIE5laWwsDQo+ID4NCj4gPiBPbiAwNi8xOC8yMDI0IDEyOjE0IEFNIFBEVCwgTmVpbCBB
cm1zdHJvbmcgd3JvdGU6DQo+ID4+IE9uIDE3LzA2LzIwMjQgMDI6NTAsIEdhdXJhdiBLYXNoeWFw
IHdyb3RlOg0KPiA+Pj4gUXVhbGNvbW0ncyBJQ0UgKElubGluZSBDcnlwdG8gRW5naW5lKSBjb250
YWlucyBhIHByb3ByaWV0YXJ5IGtleQ0KPiA+Pj4gbWFuYWdlbWVudCBoYXJkd2FyZSBjYWxsZWQg
SGFyZHdhcmUgS2V5IE1hbmFnZXIgKEhXS00pLg0KPiA+Pj4gVGhpcyBwYXRjaCBpbnRlZ3JhdGVz
IEhXS00gc3VwcG9ydCBpbiBJQ0Ugd2hlbiBpdCBpcyBhdmFpbGFibGUuIEhXS00NCj4gPj4+IHBy
aW1hcmlseSBwcm92aWRlcyBoYXJkd2FyZSB3cmFwcGVkIGtleSBzdXBwb3J0IHdoZXJlIHRoZSBJ
Q0UNCj4gPj4+IChzdG9yYWdlKSBrZXlzIGFyZSBub3QgYXZhaWxhYmxlIGluIHNvZnR3YXJlIGFu
ZCBwcm90ZWN0ZWQgaW4NCj4gPj4+IGhhcmR3YXJlLg0KPiA+Pj4NCj4gPj4+IFdoZW4gSFdLTSBz
b2Z0d2FyZSBzdXBwb3J0IGlzIG5vdCBmdWxseSBhdmFpbGFibGUgKGZyb20gVHJ1c3R6b25lKSwN
Cj4gPj4+IHRoZXJlIGNhbiBiZSBhIHNjZW5hcmlvIHdoZXJlIHRoZSBJQ0UgaGFyZHdhcmUgc3Vw
cG9ydHMgSFdLTSwgYnV0IGl0DQo+ID4+PiBjYW5ub3QgYmUgdXNlZCBmb3Igd3JhcHBlZCBrZXlz
LiBJbiB0aGlzIGNhc2UsIHN0YW5kYXJkIGtleXMgaGF2ZSB0bw0KPiA+Pj4gYmUgdXNlZCB3aXRo
b3V0IHVzaW5nIEhXS00uIEhlbmNlLCBwcm92aWRpbmcgYSB0b2dnbGUgY29udHJvbGxlZCBieQ0K
PiA+Pj4gYSBkZXZpY2V0cmVlIGVudHJ5IHRvIHVzZSBIV0tNIG9yIG5vdC4NCj4gPj4+DQo+ID4+
PiBUZXN0ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPg0K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogR2F1cmF2IEthc2h5YXAgPHF1aWNfZ2F1cmthc2hAcXVpY2lu
Yy5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvc29jL3Fjb20vaWNlLmMgfCAxNTMN
Cj4gPj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPj4+ICAg
IGluY2x1ZGUvc29jL3Fjb20vaWNlLmggfCAgIDEgKw0KPiA+Pj4gICAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb2MvcWNvbS9pY2UuYyBiL2RyaXZlcnMvc29jL3Fjb20vaWNlLmMgaW5k
ZXgNCj4gPj4+IDZmOTQxZDMyZmZmYi4uZDVlNzRjZjI5NDZiIDEwMDY0NA0KPiA+Pj4gLS0tIGEv
ZHJpdmVycy9zb2MvcWNvbS9pY2UuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9zb2MvcWNvbS9pY2Uu
Yw0KPiA+Pj4gQEAgLTI2LDYgKzI2LDQwIEBADQo+ID4+DQo+ID4+IDxzbmlwPg0KPiA+Pg0KPiA+
Pj4gKw0KPiA+Pj4gICAgc3RhdGljIHN0cnVjdCBxY29tX2ljZSAqcWNvbV9pY2VfY3JlYXRlKHN0
cnVjdCBkZXZpY2UgKmRldiwNCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZvaWQgX19pb21lbSAqYmFzZSkNCj4gPj4+ICAgIHsNCj4gPj4+IEBAIC0yMzksNiAr
MzgyLDggQEAgc3RhdGljIHN0cnVjdCBxY29tX2ljZSAqcWNvbV9pY2VfY3JlYXRlKHN0cnVjdA0K
PiA+PiBkZXZpY2UgKmRldiwNCj4gPj4+ICAgICAgICAgICAgICAgIGVuZ2luZS0+Y29yZV9jbGsg
PSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsIE5VTEwpOw0KPiA+Pj4gICAgICAgIGlmIChJU19F
UlIoZW5naW5lLT5jb3JlX2NsaykpDQo+ID4+PiAgICAgICAgICAgICAgICByZXR1cm4gRVJSX0NB
U1QoZW5naW5lLT5jb3JlX2Nsayk7DQo+ID4+PiArICAgICBlbmdpbmUtPnVzZV9od2ttID0gb2Zf
cHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwNCj4gPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInFjb20saWNlLXVzZS1od2ttIik7DQo+ID4+
DQo+ID4+IFBsZWFzZSBkcm9wIHRoaXMgcHJvcGVydHkgYW5kIGluc3RlYWQgYWRkIGFuIHNjbSBm
dW5jdGlvbiBjYWxsaW5nOg0KPiA+Pg0KPiA+PiBfX3Fjb21fc2NtX2lzX2NhbGxfYXZhaWxhYmxl
KFFDT01fU0NNX1NWQ19FUywNCj4gPj4gUUNPTV9TQ01fRVNfREVSSVZFX1NXX1NFQ1JFVCkNCj4g
Pj4NCj4gPj4gbGlrZQ0KPiA+Pg0KPiA+PiBib29sIHFjb21fc2NtX2Rlcml2ZV9zd19zZWNyZXRf
YXZhaWxhYmxlKHZvaWQpDQo+ID4+IHsNCj4gPj4gICAgICAgICAgaWYgKCFfX3Fjb21fc2NtX2lz
X2NhbGxfYXZhaWxhYmxlKF9fc2NtLT5kZXYsDQo+IFFDT01fU0NNX1NWQ19FUywNCj4gPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFFDT01fU0NNX0VTX0RFUklW
RV9TV19TRUNSRVQpKQ0KPiA+PiAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPj4N
Cj4gPj4gICAgICAgICAgcmV0dXJuIHRydWU7DQo+ID4+IH0NCj4gPj4NCj4gPj4gWW91IG1heSBw
ZXJoYXBzIG9ubHkgY2FsbCBxY29tX3NjbV9kZXJpdmVfc3dfc2VjcmV0X2F2YWlsYWJsZSgpIGZv
cg0KPiA+PiBzb21lIElDRSB2ZXJzaW9ucy4NCj4gPj4NCj4gPj4gTmVpbA0KPiA+DQo+ID4gVGhl
IGlzc3VlIGhlcmUgaXMgdGhhdCBmb3IgdGhlIHNhbWUgSUNFIHZlcnNpb24sIGJhc2VkIG9uIHRo
ZSBjaGlwc2V0LA0KPiA+IHRoZXJlIG1pZ2h0IGJlIGRpZmZlcmVudCBjb25maWd1cmF0aW9ucy4N
Cj4gDQo+IFNvIHVzZSBhIGNvbWJpbmF0aW9uIG9mIGEgbGlzdCBvZiBjb21wYXRpYmxlIHN0cmlu
Z3MgKw0KPiBxY29tX3NjbV9kZXJpdmVfc3dfc2VjcmV0X2F2YWlsYWJsZSgpDQo+IHRvIGVuYWJs
ZSBod2ttLg0KPiANCj4gTmVpbA0KPg0KDQpPa2F5LCB0aGF0IG1ha2VzIHNlbnNlIHRvIG1lLCBJ
IHdpbGwgdHJ5IHRoYXQuDQpJbiBmYWN0LCBsb29raW5nIGZvciBvbmx5IFFDT01fU0NNX0VTX0dF
TkVSQVRFX0lDRV9LRVkgaW5zdGVhZCBvZiBTV19TRUNSRVQgd29ya3MgYmV0dGVyLg0KQW5kIHdv
dWxkIHdvcmsgZXZlbiB3aXRob3V0IGNvbXBhdGlibGUgc3RyaW5ncy4NCkFzIGF2YWlsYWJpbGl0
eSBvZiBRQ09NX1NDTV9FU19HRU5FUkFURV9JQ0VfS0VZIHdpbGwgY29ycmVsYXRlIHdpdGggVFov
ZmlybXdhcmUgaGF2aW5nIHRoZSBuZWNlc3Nhcnkgc3VwcG9ydC4NCg0KPiA+DQo+ID4gSXMgaXQg
YWNjZXB0YWJsZSB0byB1c2UgdGhlIGFkZHJlc3NhYmxlIHNpemUgZnJvbSBEVFNJIGluc3RlYWQ/
DQo+ID4gTWVhbmluZywgaWYgaXQgMHg4MDAwLCBpdCB3b3VsZCB0YWtlIHRoZSBsZWdhY3kgcm91
dGUsIGFuZCBvbmx5IHdoZW4NCj4gPiBpdCBoYXMgYmVlbiB1cGRhdGVkIHRvIDB4MTAwMDAsIHdl
IHdvdWxkIHVzZSBIV0tNIGFuZCB3cmFwcGVkIGtleXMuDQo+ID4NCj4gPj4NCj4gPj4+DQo+ID4+
PiAgICAgICAgaWYgKCFxY29tX2ljZV9jaGVja19zdXBwb3J0ZWQoZW5naW5lKSkNCj4gPj4+ICAg
ICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FT1BOT1RTVVBQKTsgZGlmZiAtLWdpdA0KPiA+
Pj4gYS9pbmNsdWRlL3NvYy9xY29tL2ljZS5oIGIvaW5jbHVkZS9zb2MvcWNvbS9pY2UuaCBpbmRl
eA0KPiA+Pj4gOWRkODM1ZGJhMmE3Li4xZjUyZTgyZTNlMWMgMTAwNjQ0DQo+ID4+PiAtLS0gYS9p
bmNsdWRlL3NvYy9xY29tL2ljZS5oDQo+ID4+PiArKysgYi9pbmNsdWRlL3NvYy9xY29tL2ljZS5o
DQo+ID4+PiBAQCAtMzQsNSArMzQsNiBAQCBpbnQgcWNvbV9pY2VfcHJvZ3JhbV9rZXkoc3RydWN0
IHFjb21faWNlICppY2UsDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgYmxrX2NyeXB0b19rZXkgKmJrZXksDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICB1
OCBkYXRhX3VuaXRfc2l6ZSwgaW50IHNsb3QpOw0KPiA+Pj4gICAgaW50IHFjb21faWNlX2V2aWN0
X2tleShzdHJ1Y3QgcWNvbV9pY2UgKmljZSwgaW50IHNsb3QpOw0KPiA+Pj4gK2Jvb2wgcWNvbV9p
Y2VfaHdrbV9zdXBwb3J0ZWQoc3RydWN0IHFjb21faWNlICppY2UpOw0KPiA+Pj4gICAgc3RydWN0
IHFjb21faWNlICpvZl9xY29tX2ljZV9nZXQoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPj4+ICAg
ICNlbmRpZiAvKiBfX1FDT01fSUNFX0hfXyAqLw0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBHYXVy
YXYNCg0KUmVnYXJkcywNCkdhdXJhdg0KDQo=

