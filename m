Return-Path: <linux-arm-msm+bounces-44356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6AA05985
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389B91604DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 11:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0F41F8671;
	Wed,  8 Jan 2025 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nXjm1dXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FE1F76D0;
	Wed,  8 Jan 2025 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736335178; cv=none; b=OMmKOOnAtm6/NG7lIh4NnfTleo9K/GEpCsxEmHpBXkxo1VA+0jw6W1w17GU52YSUUG0exko0dZJQFjyZX638EvQsq6HOOWUe6oo2p8df+l1WPcGZFyPlK61BHYeIF+RtV1gLuSuz0q3u4S4HfLj+V4QEa28dcVh5dQ3VQuCdB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736335178; c=relaxed/simple;
	bh=BeXxIz0de9XddAG8TQB5W4B0y7FQJj5fiuTudwx+zXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lUCY66tCPc2jGhQHj1kqpWYswq0fanJS91kiVU48jttkFuwsYA5svSXacRNsRz/k7/vo/kv9Jw4e/ow2KhOnlzE0axbX90YZ89Y2bCh1Y+VNr5bQOwpnCf8h9yTxzjYd1H6Iwy2EYMcS/DBWabJaLVPZ1rKgY1+iQEcSlZ+GHQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nXjm1dXx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508AdZJD012721;
	Wed, 8 Jan 2025 11:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeXxIz0de9XddAG8TQB5W4B0y7FQJj5fiuTudwx+zXc=; b=nXjm1dXxH4LUNARi
	Fdo3AwFdcOXYHwKhVSs5ZXJ7zEMlAO7OrDzcwKDo7Eo0sDDlUXY8AeJ+nZ9DYJq2
	quvzoeuuHjEK/KpUvEYbMK/crGjXg5CTz1QEynCwgGz2abvKOwhoKMey5nDFxOn1
	HovgR2jv5T0ZyG7Ylz8//kaJS4VbDv14pauthyGZwXm3hxzPBzHdf3VPciODKODJ
	Kn1X+aIyASkRvUeUYV2Kb/zxbns80Io6Cxl347uZymGKCx3LqjWtvHklDx59o9Z7
	l2jBHhvKCDUBilXaNjf1+0H9n3ulTajSMYDVpQRez4OArrJmqE28AOuxhwHu0Sek
	wlPMsg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441phg8ba9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 11:19:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508BJWJA006153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 11:19:32 GMT
Received: from nasanex01c.na.qualcomm.com (10.45.79.139) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 03:19:31 -0800
Received: from nasanex01c.na.qualcomm.com ([fe80::d28b:c308:bf27:8c82]) by
 nasanex01c.na.qualcomm.com ([fe80::d28b:c308:bf27:8c82%13]) with mapi id
 15.02.1544.009; Wed, 8 Jan 2025 03:19:31 -0800
From: "Gokul Sriram P (QUIC)" <quic_gokulsri@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "andersson@kernel.org"
	<andersson@kernel.org>,
        "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>,
        "konradybcio@kernel.org"
	<konradybcio@kernel.org>,
        "Manikanta Mylavarapu (QUIC)"
	<quic_mmanikan@quicinc.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>,
        "Vignesh Viswanathan (QUIC)"
	<quic_viswanat@quicinc.com>,
        "Sricharan Ramabadhran (QUIC)"
	<quic_srichara@quicinc.com>
Subject: RE: [PATCH V3 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Thread-Topic: [PATCH V3 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Thread-Index: AQHbYO1WRi1cDUkl3ket5j1QDVDWGbMLwboAgAC8GJ+AADMVIA==
Date: Wed, 8 Jan 2025 11:19:31 +0000
Message-ID: <f9059c312a2948568fef6d4f92c97cae@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-3-quic_gokulsri@quicinc.com>
 <pjm5wrxnfutixopeeqzgb6q75z6cilpgfcd2maigqlu4i34mta@2k6trubvrkp2>
 <f0eef19b-8497-4e7d-bed1-882cdb8c1ab1@quicinc.com>
 <0bcdbb63-e1a4-4e34-a038-218f843993e0@kernel.org>
In-Reply-To: <0bcdbb63-e1a4-4e34-a038-218f843993e0@kernel.org>
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
X-Proofpoint-GUID: 5FndvHRvjVlvvg8JrtSSU-_tHL0rvHRw
X-Proofpoint-ORIG-GUID: 5FndvHRvjVlvvg8JrtSSU-_tHL0rvHRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=995
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080092

T24gMDcvMDEvMjAyNSAxMzo1NiwgR29rdWwgU3JpcmFtIFAgd3JvdGU6DQo+Pj4+ICtleGFtcGxl
czoNCj4+Pj4gKyAgLSB8DQo+Pj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4+Pj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svcWNvbSxpcHE1MzMyLWdjYy5oPg0KPj4+PiArICAgIHJlbW90ZXByb2NAZDEwMDAwMCB7
DQo+Pj4+ICsgICAgICBjb21wYXRpYmxlID0gInFjb20saXBxNTMzMi13Y3NzLXNlYy1waWwiOw0K
Pj4+PiArICAgICAgcmVnID0gPDB4ZDEwMDAwMCAweDQwNDA+Ow0KPj4+PiArICAgICAgZmlybXdh
cmUtbmFtZSA9ICJhdGgxMmsvSVBRNTMzMi9odzEuMC9xNl9mdzAubWR0IjsNCj4+PiBOaXQ6IC5t
Ym4NCj4+Pg0KPj4gDQo+PiBIaSBEbWl0cnksDQo+PiANCj4+IEl0cyAubWR0IGZvcm1hdCBvbmx5
IGluIG91ciBjYXNlLg0KPj4gDQo+IFRoZW4gcHJvYmFibHkgeW91IG5lZWQgdG8gZml4IHlvdXIg
Zm9ybWF0Lg0KDQpIaSBEbWl0cnkvIEtyenlzenRvZiwNCldlIHVzZSBzcGxpdCBmaXJtd2FyZSBp
bWFnZSB3aGVyZSAgLm1ibiBpbWFnZSBpcyBzcGxpdCBpbnRvIHggIHNlZ21lbnRzIHdpdGggLmIw
MCB0byAuYnh4IGV4dGVuc2lvbi4gVGhlIG1ibiBoZWFkZXIgYWxvbmcgd2l0aCBzaWduaW5nIG1l
dGFkYXRhIHdpbGwgYmUgcGFydCBvZiB0aGUgLm1kdC4gVGhlIHNlY3VyZSBhdXRoZW50aWNhdGlv
ciAoVHJ1c3Rab25lKSB3aWxsIGV4cGVjdCBtZXRhZGF0YSBhcyBwYXJ0IG9mIC5tZHQgYW5kIHdp
bGwgYXV0aGVudGljYXRlIHRoZSAuYnh4IHNlZ21lbnRzLg0KDQpDZXJ0YWluIG1zbSBwbGF0Zm9y
bXMgYWxyZWFkeSBzdXBwb3J0IC5tZHQgZm9ybWF0IGFzIGluIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3Fjb20sc202MTE1LXBhcy55
YW1sP2g9djYuMTMtcmM2Lg0KDQpSZWdhcmRzLA0KR29rdWwNCg==

