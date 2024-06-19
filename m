Return-Path: <linux-arm-msm+bounces-23302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6A290F8BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 00:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF17F1F222B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21287F7D3;
	Wed, 19 Jun 2024 22:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kJO3/KM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C06F2E4;
	Wed, 19 Jun 2024 22:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718834571; cv=none; b=cDJHguYpmIG3cJvmZi+ZcKbBJPkqcN3zscBlb9Alt6h1n9DbpQTEDnB5nyXIGD2v15pE9SWjDJSdH8V+Anou2P/Ib6s3ggKL4Z6Ebzrof+H5EhQTksh7xsImt44/QSFS0DcC8lL+4PpgKMf19pfG9JKuJWtR7mlUmGtzz7VN4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718834571; c=relaxed/simple;
	bh=Ij5tRDsLnhbLTZrdfPTCHB2pd8WI9KorU7C5SeOjyO4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mIV6lNHu3VDcCV7Gsj+VQiNwlMMHAjKbTu1GxxI+GJkNCvSAMmn9fGACzzzpJZB4JdJsQ84Qt+a7s9Y7DY8FVhj1wjArlPz2fEwrJUwzpRYM7ddh3sEhF1wyxCVrgiEa2gvavqOnscjcjGNxeDHAI04n+ucWX6TZVhpSDginNs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kJO3/KM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JLNtPr001108;
	Wed, 19 Jun 2024 22:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ij5tRDsLnhbLTZrdfPTCHB2pd8WI9KorU7C5SeOjyO4=; b=kJO3/KM8xEZ2kAKA
	rjNLxRwd0JcJuUwbvTHTKqFaZ+hpLrvterXwV0pnCnQdTZ6XMMSyF6DJvFQijKsc
	G/3v3y5j3xuIrV+XrOTnx7ts34v+XK6HtWheAGXbRYtfd7uEIXLEDaz26/cvmphN
	mO/JCPjZRjFhT6ma3EiK3WvI0PeDVLpUj0JTY1XfS2am4zKlOl9mYxsIpeIbngS5
	TNw9EwLJoHMvxu+1b6zGn/6OkXLj5RafR6hwBmgPWJhIjeDNsq8G5XF+xarX/P7I
	YZOIsHD2+Pp0MGxhmdYqJuw/pdkwwvu2QKrh6KR8smzKqz6Zcx+I+oSXdhJpuWWp
	g+e9vQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja2auhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:02:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JM2Wmf016758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:02:32 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 15:02:28 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Wed, 19 Jun 2024 15:02:28 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Gaurav Kashyap
 (QUIC)" <quic_gaurkash@quicinc.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
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
Thread-Index: AQHawFGQ2Cb4IdeC1UawBk8ySHD6CrHNksUAgAD6HQCAAIg+gIABCFPw
Date: Wed, 19 Jun 2024 22:02:28 +0000
Message-ID: <9dc6cece90294657a20384b894b9aff8@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <ad7f22f5-21e4-4411-88f3-7daa448d2c83@linaro.org>
 <51a930fdf83146cb8a3e420a11f1252b@quicinc.com>
 <24276cd6-df21-4592-85df-2779c6c30d51@linaro.org>
In-Reply-To: <24276cd6-df21-4592-85df-2779c6c30d51@linaro.org>
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
X-Proofpoint-GUID: zbzu7TO1iGTGfZEuVoBrK6eN6gxRi5kG
X-Proofpoint-ORIG-GUID: zbzu7TO1iGTGfZEuVoBrK6eN6gxRi5kG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190168

SGVsbG8gS3J6eXN6dG9mDQoNCk9uIDA2LzE4LzIwMjQgMTE6MTcgUE0gUERULCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOg0KPiBPbiAxOS8wNi8yMDI0IDAwOjA4LCBHYXVyYXYgS2FzaHlhcCAo
UVVJQykgd3JvdGU6DQo+ID4+DQo+ID4+IFlvdSBtYXkgcGVyaGFwcyBvbmx5IGNhbGwgcWNvbV9z
Y21fZGVyaXZlX3N3X3NlY3JldF9hdmFpbGFibGUoKSBmb3INCj4gPj4gc29tZSBJQ0UgdmVyc2lv
bnMuDQo+ID4+DQo+ID4+IE5laWwNCj4gPg0KPiA+IFRoZSBpc3N1ZSBoZXJlIGlzIHRoYXQgZm9y
IHRoZSBzYW1lIElDRSB2ZXJzaW9uLCBiYXNlZCBvbiB0aGUgY2hpcHNldCwNCj4gPiB0aGVyZSBt
aWdodCBiZSBkaWZmZXJlbnQgY29uZmlndXJhdGlvbnMuDQo+IA0KPiBUaGF0J3Mgbm90IHdoYXQg
eW91ciBEVFMgc2FpZC4gVG8gcmVtaW5kOiB5b3VyIERUUyBzYWlkIHRoYXQgYWxsIFNNODU1MCBh
bmQNCj4gYWxsIFNNODY1MCBoYXZlIGl0LiBDaG9pY2UgaXMgb2J2aW91cyB0aGVuOiBpdCdzIGRl
ZHVjaWJsZSBmcm9tIGNvbXBhdGlibGUuDQo+IA0KPiBJIHN0aWxsIGRvIG5vdCB1bmRlcnN0YW5k
IHdoeSB5b3VyIGNhbGwgY2Fubm90IHJldHVybiB5b3UgY29ycmVjdA0KPiAiY29uZmlndXJhdGlv
biIuDQo+IA0KDQpJQ0UgdmVyc2lvbiBhbmQgY2hpcHNldHMgYXJlIGRpc2pvaW50LCBtZWFuaW5n
IGZvciB0aGUgc2FtZSBJQ0UgSFcgcHJlc2VudCBpbiBTTTg2NTAgdnMgU014eHh4IHRhcmdldCwN
ClNNODY1MCB3aWxsIGhhdmUgbmVjZXNzYXJ5IFRaIHN1cHBvcnQsIGJ1dCBTTTh4eHh4IG1heSBu
b3QsIHRoYXQgaXMgdGhlIHJlYXNvbiBJIHdhcyB0cnlpbmcgdG8gaW5kaWNhdGUgYWxsIFNNODU1
MCBhbmQNClNNODY1MCBoYXZlIHRoZSBuZWNlc3NhcnkgVFogc3VwcG9ydC4gVGhlcmUgbWlnaHQg
aGF2ZSBiZWVuIGEgbWlzY29tbXVuaWNhdGlvbiB0aGVyZS4NCg0KSG93ZXZlciAsIGF2YWlsYWJp
bGl0eSBvZiBRQ09NX1NDTV9FU19HRU5FUkFURV9JQ0VfS0VZIHdpbGwgZGlyZWN0bHkgdHJhbnNs
YXRlIHRvIGhhdmluZyB0aGUgbmVjZXNzYXJ5IGZpcm13YXJlIHN1cHBvcnQuDQpTbywgSSB3aWxs
IHB1cnN1ZSBnb2luZyB0aGF0IHJvdXRlIGFuZCB1cGxvYWQgYW5vdGhlciBzZXQgb2YgcGF0Y2hl
cyB0byByZW1vdmUgdGhlIERUIHByb3BlcnR5Lg0KDQo+ID4NCj4gPiBJcyBpdCBhY2NlcHRhYmxl
IHRvIHVzZSB0aGUgYWRkcmVzc2FibGUgc2l6ZSBmcm9tIERUU0kgaW5zdGVhZD8NCj4gPiBNZWFu
aW5nLCBpZiBpdCAweDgwMDAsIGl0IHdvdWxkIHRha2UgdGhlIGxlZ2FjeSByb3V0ZSwgYW5kIG9u
bHkgd2hlbg0KPiA+IGl0IGhhcyBiZWVuIHVwZGF0ZWQgdG8gMHgxMDAwMCwgd2Ugd291bGQgdXNl
IEhXS00gYW5kIHdyYXBwZWQga2V5cy4NCj4gDQo+IE5vLg0KPg0KDQpBY2sNCg0KPiBCZXN0IHJl
Z2FyZHMsDQo+IEtyenlzenRvZg0KDQpSZWdhcmRzLA0KR2F1cmF2DQoNCg==

