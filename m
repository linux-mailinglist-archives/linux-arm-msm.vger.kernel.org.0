Return-Path: <linux-arm-msm+bounces-44367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C2A05BDB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174891881BD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F601F942E;
	Wed,  8 Jan 2025 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O1RddWch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6F1F708D;
	Wed,  8 Jan 2025 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340277; cv=none; b=ehjk4rOXaiZJXZwY/NT5QRhPAU36k3W/MSJARYPY1G74qT8qriqHxtWW5dvlTm2QUGEnwxx/SG6c+7Svp4wKJWzXDAQIMZXpjK4A/JoKSgGMpgLhej80zEAzArdhLccZdiJ11QPDxGWA71L70UYmhridRUsPUkP75xOEycvb3nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340277; c=relaxed/simple;
	bh=/tY8tBHHLGLx90YhOoUp47XWaX26k7ffZ0UgzOeqYn4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GYVrTSOCwW+V0sCuoNSFdDUcH28BqPT5E+dcI5fBRs5OaxDd8GwpNClkK2sp2fPNM1w7dZM6UiDKrsaizfh+WxF3YjoVE2556iAxTQBt4CIpZ065XnguwQYExg6Zs9giJCnB+jzl4cbKZ8ryw2e2aE0ESHHO5fG+QushmTz8Meg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O1RddWch; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Bqr7C028926;
	Wed, 8 Jan 2025 12:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/tY8tBHHLGLx90YhOoUp47XWaX26k7ffZ0UgzOeqYn4=; b=O1RddWchVJXafVOZ
	gtaTb3m7WiOn8EcjuddMHqkgsyZK8fiE8rKr8aJdytpPJNl2Ol7asl96zWZY99/n
	XeBCierUjg5XXxlkAIgXKvenDo2sD6rZhSXdJe8NkSZu8SmKcx8Q/tMTGo0sDz2p
	k+5Jt9dx5n9V0rzNhfjxSFRslsXIO30nAZ7W+hNJDkdC+edejKMUg2zQ4luRQVgZ
	GbUBGwq2qi7/R9qhd8mpITIxb06bLQYmRq6Zm/QzzszPMLB/PTPpg5mWoNA96yZ2
	zvdMtoLzd3VcViDS2MmBrF6lu1nRzrXQvsrWqet69wV5WX6ne0qoMqU/iOWgaUxD
	P9tqFQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441rvh03f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:44:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508CiUGC019062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 12:44:30 GMT
Received: from nasanex01c.na.qualcomm.com (10.45.79.139) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 04:44:30 -0800
Received: from nasanex01c.na.qualcomm.com ([fe80::d28b:c308:bf27:8c82]) by
 nasanex01c.na.qualcomm.com ([fe80::d28b:c308:bf27:8c82%13]) with mapi id
 15.02.1544.009; Wed, 8 Jan 2025 04:44:30 -0800
From: "Gokul Sriram P (QUIC)" <quic_gokulsri@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
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
Thread-Index: AQHbYO1WRi1cDUkl3ket5j1QDVDWGbMLwboAgADzxiiAAB3TIA==
Date: Wed, 8 Jan 2025 12:44:29 +0000
Message-ID: <7a3c658a1b734b49a0e6df8ebaddfc30@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-3-quic_gokulsri@quicinc.com>
 <pjm5wrxnfutixopeeqzgb6q75z6cilpgfcd2maigqlu4i34mta@2k6trubvrkp2>
 <3e64b792-bfca-4b07-a13e-6deb966f3d4f@quicinc.com>
 <CAA8EJprxYeNGvr7zed8eRcxDFczxM_TMdJ51GK+cHshhj4C1-g@mail.gmail.com>
In-Reply-To: <CAA8EJprxYeNGvr7zed8eRcxDFczxM_TMdJ51GK+cHshhj4C1-g@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: wKMocoPN-8H5d91kfDNK6y36h52NNTZn
X-Proofpoint-GUID: wKMocoPN-8H5d91kfDNK6y36h52NNTZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=683 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080105

Pj4NCj4+ICtleGFtcGxlczoNCj4+ICsgIC0gfA0KPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPj4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvY2xvY2svcWNvbSxpcHE1MzMyLWdjYy5oPg0KPj4gKyAgICByZW1vdGVwcm9jQGQx
MDAwMDAgew0KPj4gKyAgICAgIGNvbXBhdGlibGUgPSAicWNvbSxpcHE1MzMyLXdjc3Mtc2VjLXBp
bCI7DQo+PiArICAgICAgcmVnID0gPDB4ZDEwMDAwMCAweDQwNDA+Ow0KPj4gKyAgICAgIGZpcm13
YXJlLW5hbWUgPSAiYXRoMTJrL0lQUTUzMzIvaHcxLjAvcTZfZncwLm1kdCI7DQo+Pg0KPj4gTml0
OiAubWJuDQo+Pg0KPj4gSGkgRG1pdHJ5LA0KPiANCj4gUGxlYXNlIGZpeCB5b3VyIGVtYWlsIGNs
aWVudCB0byBuZXZlciBldmVyIHNlbmQgSFRNTCBlbWFpbHMgaWYgeW91IGFyZSBwYXJ0aWNpcGF0
aW5nIGluIGRpc2N1c3Npb25zIG9uIHRoZSBwdWJsaWMgbWFpbGluZyBsaXN0cy4gRm9yIGV4YW1w
bGUsIHF1b3RhdGlvbiBsZXZlbCBpcyBpbmNvcnJlY3QuDQo+IA0KPj4gSXRzIC5tZHQgZm9ybWF0
IG9ubHkgaW4gb3VyIGNhc2UuDQo+IA0KPiBOQUssIHBsZWFzZSB3b3JrIHdpdGggS2FsbGUgdG8g
cGlsLXNxdWFzaCB0aGUgcmVtb3RlcHJvYyBmaXJtd2FyZS4NCg0KU3VyZSBEbWl0cnkuIFdpbGwg
Y2hlY2sgYW5kIGFkZHJlc3MuDQoNClJlZ2FyZHMsDQpHb2t1bA0K

