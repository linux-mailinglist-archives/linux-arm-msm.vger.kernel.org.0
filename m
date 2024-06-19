Return-Path: <linux-arm-msm+bounces-23304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C7390F8C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 00:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58B9328364D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF8F152792;
	Wed, 19 Jun 2024 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ineXzvDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E613E78B4C;
	Wed, 19 Jun 2024 22:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718834871; cv=none; b=uVHizGY+hPYRCQb4BlZ36ZfaOGT+8vnAZbsdU17jO1PJrK3WRF6zBcSbaTeFR3S0cwVR6j4apwoxivW3u0dU69mecqZPfLhrVMoe+ss0S+kBlMJycVrcMDPcS6UQJcKniCyHt31HlEs/75lCFoUVHk3y0f6ux70iZbaUXXJSnBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718834871; c=relaxed/simple;
	bh=QbmJ5/IWBHBHs1jGOrSoUFKBLnYq2yfQ2zvratAJOtw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NvDpTHF/W5WSdmZXjyJLAfb23J78eIcvY9b27uQIikxKVEJcoG/eDt9TfoGWNVxxQ4P8TFt5tEUFpRBv/m9ya4VAiAoBA4viVGa/qJQnL1DV7gzvu9MmLiJrSWi8XTYRrqjw+gE5rgP46JNWMqcTgAIDHxlP0LjOyK7J/YdiQq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ineXzvDC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JLraFo000702;
	Wed, 19 Jun 2024 22:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbmJ5/IWBHBHs1jGOrSoUFKBLnYq2yfQ2zvratAJOtw=; b=ineXzvDC9gKifXSr
	s7D3ujM2q1zKIN1ejyrmVYc3XhW76ZCZXc2LfLwySlSZamM1TwVdjb6mGCeYBfUP
	u0goe3rrzkAa50azEZdZzYheV+BUbUYo/m7lPEvMmb6ubdf8+96y/FY/o8HLq546
	ddv37F+wevgEFQ10cR7tuWADrG6R0NsIpR+Plko/O2WjnJ7mQ2bxfq5CaEkZp8hC
	+iC3a8M0TRo6OIO2NjiAH1kfxqmbxH4azDsm0ms5kxW+pt+300lgWF2cd4xRU6ID
	t99X8OUO1nron5F34FV/KhGhp7BF+FcbG2JLvzYhsBKkHTvFIbIkl2PX0sR0vlbT
	n38riQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujag2t42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:07:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JM7acC023219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:07:36 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 15:07:33 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Wed, 19 Jun 2024 15:07:33 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "ebiggers@google.com"
	<ebiggers@google.com>,
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
Thread-Index: AQHawFGXatdRamw0hEaj/PQeSvaH7rHMAUqAgAEiYECAAGMaAIACIjng
Date: Wed, 19 Jun 2024 22:07:32 +0000
Message-ID: <4e316ef01ac440dfb9f978cf66239f14@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-14-quic_gaurkash@quicinc.com>
 <a9d8606d-fb4a-4394-bab6-3304e1f8b9e5@linaro.org>
 <af1df42efdb4497cb174bc664c692651@quicinc.com>
 <b0f52816-8a9e-4f6a-8b48-18e77ed5dfaf@linaro.org>
In-Reply-To: <b0f52816-8a9e-4f6a-8b48-18e77ed5dfaf@linaro.org>
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
X-Proofpoint-GUID: EznPN-MrCcVvztQ9yvN4epjqcuIU9-FW
X-Proofpoint-ORIG-GUID: EznPN-MrCcVvztQ9yvN4epjqcuIU9-FW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190168

T24gMDYvMTcvMjAyNCAxMTozMSBQTSBQRFQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+
IE9uIDE4LzA2LzIwMjQgMDI6MzUsIEdhdXJhdiBLYXNoeWFwIChRVUlDKSB3cm90ZToNCj4gPiBI
ZWxsbyBLcnp5c3p0b2YNCj4gPg0KPiA+IE9uICAgMDYvMTcvMjAyNCAxMjoxNyBBTSBQRFQsIEty
enlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+IE9uIDE3LzA2LzIwMjQgMDI6NTEsIEdhdXJh
diBLYXNoeWFwIHdyb3RlOg0KPiA+Pj4gKyAgcWNvbSxpY2UtdXNlLWh3a206DQo+ID4+PiArICAg
IHR5cGU6IGJvb2xlYW4NCj4gPj4+ICsgICAgZGVzY3JpcHRpb246DQo+ID4+PiArICAgICAgVXNl
IHRoZSBzdXBwb3J0ZWQgSGFyZHdhcmUgS2V5IE1hbmFnZXIgKEhXS00pIGluIFF1YWxjb21tDQo+
IElDRQ0KPiA+Pj4gKyAgICAgIHRvIHN1cHBvcnQgd3JhcHBlZCBrZXlzLiBIYXZpbmcgdGhpcyBl
bnRyeSBoZWxwcyBzY2VuYXJpb3Mgd2hlcmUNCj4gPj4+ICsgICAgICB0aGUgSUNFIGhhcmR3YXJl
IHN1cHBvcnRzIEhXS00sIGJ1dCB0aGUgVHJ1c3R6b25lIGZpcm13YXJlIGRvZXMNCj4gPj4+ICsg
ICAgICBub3QgaGF2ZSB0aGUgZnVsbCBjYXBhYmlsaXR5IHRvIHVzZSB0aGlzIEhXS00gYW5kIHN1
cHBvcnQgd3JhcHBlZA0KPiA+Pj4gKyAgICAgIGtleXMuIE5vdCBoYXZpbmcgdGhpcyBlbnRyeSBl
bmFibGVkIHdvdWxkIG1ha2UgSUNFIGZ1bmN0aW9uIGluDQo+ID4+PiArICAgICAgbm9uLUhXS00g
bW9kZSBzdXBwb3J0aW5nIHN0YW5kYXJkIGtleXMuDQo+ID4+DQo+ID4+IE5vIGNoYW5nZWxvZywg
cHJldmlvdXMgY29tbWVudHMgYW5kIGRpc2N1c3Npb24gaWdub3JlZC4NCj4gPj4NCj4gPj4gTkFL
DQo+ID4NCj4gPiBBcG9sb2dpZXMgZm9yIG5vdCBhZGRyZXNzaW5nIHRoZSBwcmV2aW91cyBjb21t
ZW50cy4NCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvOTg5MmM1NDFiYTRlNGI1ZDk3
NWZhYWE0YjQ5YzkyYmFAcXVpY2luYy5jDQo+ID4gb20vDQo+ID4NCj4gPiBNYXliZSB3ZSBjYW4g
Y29udGludWUgb3VyIGRpc2N1c3Npb24gaGVyZTsgIiBTTTg0NTAgYW5kIFNNODM1MCBRQ09NDQo+
ID4gSUNFIGJvdGggc3VwcG9ydCBIV0tNIGluIHRoZWlyIElDRSBoYXJkd2FyZS4NCj4gPiBIb3dl
dmVyLCB3cmFwcGVkIGtleXMgY2FuIG5vdCBiZSBlbmFibGVkIG9uIHRob3NlIHRhcmdldHMgZHVl
IHRvDQo+ID4gY2VydGFpbiBtaXNzaW5nIHRydXN0em9uZSBzdXBwb3J0LiBJZiB3ZSBzb2xlbHkg
cmVseSBvbiBoYXJkd2FyZQ0KPiA+IHZlcnNpb24gdG8gZGVjaWRlIGlmIElDRSBoYXMgdG8gdXNl
IHdyYXBwZWQga2V5cyBmb3IgZGF0YSBlbmNyeXB0aW9uLA0KPiA+IHRoZW4gaXQgYmVjb21lcyB1
bnRlc3RhYmxlIG9uIHRob3NlIGNoaXBzZXRzLg0KPiANCj4gVGhhdCBkb2VzIG5vdCBtYWtlIGFu
eSBzZW5zZSB0byBtZS4gWW91IGVuYWJsZSBpdCBmb3IgU004NTUwIGFuZCBTTTg2NTANCj4gbm90
IFNNODQ1MCBhbmQgU004MzUwLg0KPiANCj4gPg0KPiA+IFNvLCB3ZSB3YW50IGFub3RoZXIgd2F5
IHRvIGRpc3Rpbmd1aXNoIHRoaXMgc2NlbmFyaW8sIGFuZCBoZW5jZSBJDQo+ID4gY2hvc2UgYSBE
VCB2ZW5kb3IgcHJvcGVydHkNCj4gDQo+IFdoYXQgc2NlbmFyaW8/IFNob3cgaXQgaW4geW91ciBw
YXRjaGVzLg0KPiANCj4gPiB0byBleHBsaWNpdGx5IG1lbnRpb24gaWYgd2UgaGF2ZSB0byB1c2Ug
dGhlIHN1cHBvcnRlZCBIV0tNLg0KPiA+IElmIHRoZXJlIGlzIGFub3RoZXIgd2F5LCBJIGFtIG9w
ZW4gdG8gZXhwbG9yaW5nIHRoYXQgYXMgd2VsbC4iDQo+IA0KPiBUaGF0IHByb3BlcnR5IGlzIGp1
c3QgZW50aXJlbHkgcmVkdW5kYW50LiBJZiB5b3UgY2xhaW0gb3RoZXJ3aXNlLCBzaG93IGl0DQo+
IHRocm91Z2ggcGF0Y2hlcy4NCj4gDQo+IFRvIGJlIGNsZWFyLCBzbyB5b3Ugd2lsbCBub3QgcmVz
ZW5kIHRoZSBzYW1lIGlnbm9yaW5nIGNvbW1lbnRzOiBOQUsuDQo+IA0KDQpBY2ssIG5leHQgc2V0
IG9mIHBhdGNoZXMgd2lsbCBoYXZlIHRoZSBwcm9wZXJ0eSByZW1vdmVkLg0KDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQoNClJlZ2FyZHMsDQpHYXVyYXYNCg0K

