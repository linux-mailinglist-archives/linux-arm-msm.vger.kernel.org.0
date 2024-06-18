Return-Path: <linux-arm-msm+bounces-23143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64B90DEFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10AF61F21373
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42AF17838D;
	Tue, 18 Jun 2024 22:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RrJ6AqjC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026501779A9;
	Tue, 18 Jun 2024 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718748579; cv=none; b=kjDjeeezQnXI2FXlonDtZKvp4aKUCNNfV7x+Xs4ZQGU4qtG57aAEtGlqKa6UqLJpwwbAKv45RQW320XmqGbZTGmQdTWKT5A0LKjG3UIo4Twb6D+wpou+iaow/R+2Y3ITCTHKUDtt1jOCBPCQE15iRqf6Ua8YMxu10fZb2ml4rJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718748579; c=relaxed/simple;
	bh=PWGOGozLMtJhVMETTDmiji7zuTD1rFRALd+eUfcOm8Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d8y3YUW5/U6qID1b5fFi0fSVcZGLT8F4v5HSJYLcIBpt5WaFwWnbjIEcksA+3x+CcRtWfeoEJ4qG6tWRD3hYq/deYkAKABG544QZixnfoEjbSAMyCC+JUTYUAxBKQmZcI2KFSlmcRb0w7834hUt3lwHI8BZKDoeue6/VsIld+K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RrJ6AqjC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILas31015872;
	Tue, 18 Jun 2024 22:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWGOGozLMtJhVMETTDmiji7zuTD1rFRALd+eUfcOm8Y=; b=RrJ6AqjCjOv2dNNK
	++hZMic6jh13sx4AmfgiUmEsxT1L4X++Yt5jEQGU3xbam8OD74w94yAD83PYYyki
	yQLJciSc9QbScVKfr/0yqHYufP0KLNTmRjtyVaFdXlwYbIG4csXTa3g47cHisxKq
	eKTSNlL//iQ00mdGdnKdKoMlIdrGXMsgU39w6miIqD1Bge+YBZmxvyuYNu9Z4qJg
	blP1h70Pg7Chu8DOC4eL0s15P4/2kUv0qc51HALyfCTAgY9UGnX9jJMdY4S1b3xW
	hr5tOYgGNrUTOaYR4Ug2zyeIE9yVLqAiuxzpY7Yf+HXYlHHchpOzuYIuu7uvqP56
	muUtmA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9x01jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:08:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IM8ot1007221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:08:50 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 15:08:47 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Tue, 18 Jun 2024 15:08:47 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "Gaurav Kashyap
 (QUIC)" <quic_gaurkash@quicinc.com>,
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
Thread-Index: AQHawFGQ2Cb4IdeC1UawBk8ySHD6CrHNksUAgAD6HQA=
Date: Tue, 18 Jun 2024 22:08:47 +0000
Message-ID: <51a930fdf83146cb8a3e420a11f1252b@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <ad7f22f5-21e4-4411-88f3-7daa448d2c83@linaro.org>
In-Reply-To: <ad7f22f5-21e4-4411-88f3-7daa448d2c83@linaro.org>
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
X-Proofpoint-ORIG-GUID: JxKF8SOPsiuJR8yLLJB468w6P8Zu9X4j
X-Proofpoint-GUID: JxKF8SOPsiuJR8yLLJB468w6P8Zu9X4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180162

SGVsbG8gTmVpbCwNCg0KT24gMDYvMTgvMjAyNCAxMjoxNCBBTSBQRFQsIE5laWwgQXJtc3Ryb25n
IHdyb3RlOg0KPiBPbiAxNy8wNi8yMDI0IDAyOjUwLCBHYXVyYXYgS2FzaHlhcCB3cm90ZToNCj4g
PiBRdWFsY29tbSdzIElDRSAoSW5saW5lIENyeXB0byBFbmdpbmUpIGNvbnRhaW5zIGEgcHJvcHJp
ZXRhcnkga2V5DQo+ID4gbWFuYWdlbWVudCBoYXJkd2FyZSBjYWxsZWQgSGFyZHdhcmUgS2V5IE1h
bmFnZXIgKEhXS00pLg0KPiA+IFRoaXMgcGF0Y2ggaW50ZWdyYXRlcyBIV0tNIHN1cHBvcnQgaW4g
SUNFIHdoZW4gaXQgaXMgYXZhaWxhYmxlLiBIV0tNDQo+ID4gcHJpbWFyaWx5IHByb3ZpZGVzIGhh
cmR3YXJlIHdyYXBwZWQga2V5IHN1cHBvcnQgd2hlcmUgdGhlIElDRQ0KPiA+IChzdG9yYWdlKSBr
ZXlzIGFyZSBub3QgYXZhaWxhYmxlIGluIHNvZnR3YXJlIGFuZCBwcm90ZWN0ZWQgaW4NCj4gPiBo
YXJkd2FyZS4NCj4gPg0KPiA+IFdoZW4gSFdLTSBzb2Z0d2FyZSBzdXBwb3J0IGlzIG5vdCBmdWxs
eSBhdmFpbGFibGUgKGZyb20gVHJ1c3R6b25lKSwNCj4gPiB0aGVyZSBjYW4gYmUgYSBzY2VuYXJp
byB3aGVyZSB0aGUgSUNFIGhhcmR3YXJlIHN1cHBvcnRzIEhXS00sIGJ1dCBpdA0KPiA+IGNhbm5v
dCBiZSB1c2VkIGZvciB3cmFwcGVkIGtleXMuIEluIHRoaXMgY2FzZSwgc3RhbmRhcmQga2V5cyBo
YXZlIHRvDQo+ID4gYmUgdXNlZCB3aXRob3V0IHVzaW5nIEhXS00uIEhlbmNlLCBwcm92aWRpbmcg
YSB0b2dnbGUgY29udHJvbGxlZCBieSBhDQo+ID4gZGV2aWNldHJlZSBlbnRyeSB0byB1c2UgSFdL
TSBvciBub3QuDQo+ID4NCj4gPiBUZXN0ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0
cm9uZ0BsaW5hcm8ub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEdhdXJhdiBLYXNoeWFwIDxxdWlj
X2dhdXJrYXNoQHF1aWNpbmMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9zb2MvcWNvbS9p
Y2UuYyB8IDE1Mw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0K
PiA+ICAgaW5jbHVkZS9zb2MvcWNvbS9pY2UuaCB8ICAgMSArDQo+ID4gICAyIGZpbGVzIGNoYW5n
ZWQsIDE1MCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc29jL3Fjb20vaWNlLmMgYi9kcml2ZXJzL3NvYy9xY29tL2ljZS5jIGluZGV4
DQo+ID4gNmY5NDFkMzJmZmZiLi5kNWU3NGNmMjk0NmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9zb2MvcWNvbS9pY2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL3Fjb20vaWNlLmMNCj4gPiBA
QCAtMjYsNiArMjYsNDAgQEANCj4gDQo+IDxzbmlwPg0KPiANCj4gPiArDQo+ID4gICBzdGF0aWMg
c3RydWN0IHFjb21faWNlICpxY29tX2ljZV9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCBfX2lvbWVtICpiYXNl
KQ0KPiA+ICAgew0KPiA+IEBAIC0yMzksNiArMzgyLDggQEAgc3RhdGljIHN0cnVjdCBxY29tX2lj
ZSAqcWNvbV9pY2VfY3JlYXRlKHN0cnVjdA0KPiBkZXZpY2UgKmRldiwNCj4gPiAgICAgICAgICAg
ICAgIGVuZ2luZS0+Y29yZV9jbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsIE5VTEwpOw0K
PiA+ICAgICAgIGlmIChJU19FUlIoZW5naW5lLT5jb3JlX2NsaykpDQo+ID4gICAgICAgICAgICAg
ICByZXR1cm4gRVJSX0NBU1QoZW5naW5lLT5jb3JlX2Nsayk7DQo+ID4gKyAgICAgZW5naW5lLT51
c2VfaHdrbSA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYtPm9mX25vZGUsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicWNvbSxpY2UtdXNlLWh3
a20iKTsNCj4gDQo+IFBsZWFzZSBkcm9wIHRoaXMgcHJvcGVydHkgYW5kIGluc3RlYWQgYWRkIGFu
IHNjbSBmdW5jdGlvbiBjYWxsaW5nOg0KPiANCj4gX19xY29tX3NjbV9pc19jYWxsX2F2YWlsYWJs
ZShRQ09NX1NDTV9TVkNfRVMsDQo+IFFDT01fU0NNX0VTX0RFUklWRV9TV19TRUNSRVQpDQo+IA0K
PiBsaWtlDQo+IA0KPiBib29sIHFjb21fc2NtX2Rlcml2ZV9zd19zZWNyZXRfYXZhaWxhYmxlKHZv
aWQpDQo+IHsNCj4gICAgICAgICBpZiAoIV9fcWNvbV9zY21faXNfY2FsbF9hdmFpbGFibGUoX19z
Y20tPmRldiwgUUNPTV9TQ01fU1ZDX0VTLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBRQ09NX1NDTV9FU19ERVJJVkVfU1dfU0VDUkVUKSkNCj4gICAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsNCj4gDQo+ICAgICAgICAgcmV0dXJuIHRydWU7DQo+IH0NCj4g
DQo+IFlvdSBtYXkgcGVyaGFwcyBvbmx5IGNhbGwgcWNvbV9zY21fZGVyaXZlX3N3X3NlY3JldF9h
dmFpbGFibGUoKSBmb3INCj4gc29tZSBJQ0UgdmVyc2lvbnMuDQo+IA0KPiBOZWlsDQoNClRoZSBp
c3N1ZSBoZXJlIGlzIHRoYXQgZm9yIHRoZSBzYW1lIElDRSB2ZXJzaW9uLCBiYXNlZCBvbiB0aGUg
Y2hpcHNldCwNCnRoZXJlIG1pZ2h0IGJlIGRpZmZlcmVudCBjb25maWd1cmF0aW9ucy4NCg0KSXMg
aXQgYWNjZXB0YWJsZSB0byB1c2UgdGhlIGFkZHJlc3NhYmxlIHNpemUgZnJvbSBEVFNJIGluc3Rl
YWQ/DQpNZWFuaW5nLCBpZiBpdCAweDgwMDAsIGl0IHdvdWxkIHRha2UgdGhlIGxlZ2FjeSByb3V0
ZSwgYW5kIG9ubHkgd2hlbiBpdCBoYXMgYmVlbg0KdXBkYXRlZCB0byAweDEwMDAwLCB3ZSB3b3Vs
ZCB1c2UgSFdLTSBhbmQgd3JhcHBlZCBrZXlzLg0KDQo+IA0KPiA+DQo+ID4gICAgICAgaWYgKCFx
Y29tX2ljZV9jaGVja19zdXBwb3J0ZWQoZW5naW5lKSkNCj4gPiAgICAgICAgICAgICAgIHJldHVy
biBFUlJfUFRSKC1FT1BOT1RTVVBQKTsgZGlmZiAtLWdpdA0KPiA+IGEvaW5jbHVkZS9zb2MvcWNv
bS9pY2UuaCBiL2luY2x1ZGUvc29jL3Fjb20vaWNlLmggaW5kZXgNCj4gPiA5ZGQ4MzVkYmEyYTcu
LjFmNTJlODJlM2UxYyAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3NvYy9xY29tL2ljZS5oDQo+
ID4gKysrIGIvaW5jbHVkZS9zb2MvcWNvbS9pY2UuaA0KPiA+IEBAIC0zNCw1ICszNCw2IEBAIGlu
dCBxY29tX2ljZV9wcm9ncmFtX2tleShzdHJ1Y3QgcWNvbV9pY2UgKmljZSwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBibGtfY3J5cHRvX2tleSAqYmtleSwNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgIHU4IGRhdGFfdW5pdF9zaXplLCBpbnQgc2xvdCk7DQo+ID4g
ICBpbnQgcWNvbV9pY2VfZXZpY3Rfa2V5KHN0cnVjdCBxY29tX2ljZSAqaWNlLCBpbnQgc2xvdCk7
DQo+ID4gK2Jvb2wgcWNvbV9pY2VfaHdrbV9zdXBwb3J0ZWQoc3RydWN0IHFjb21faWNlICppY2Up
Ow0KPiA+ICAgc3RydWN0IHFjb21faWNlICpvZl9xY29tX2ljZV9nZXQoc3RydWN0IGRldmljZSAq
ZGV2KTsNCj4gPiAgICNlbmRpZiAvKiBfX1FDT01fSUNFX0hfXyAqLw0KDQpSZWdhcmRzLA0KR2F1
cmF2DQo=

