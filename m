Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3837E6E7490
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 10:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjDSIBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 04:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbjDSIBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 04:01:37 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DCFAD2A;
        Wed, 19 Apr 2023 01:01:35 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J7M4E8021310;
        Wed, 19 Apr 2023 08:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=GpRi0AS1pEWm7KxwouggdzOmWgVhD57ViwSjWNr5mpM=;
 b=GF+F31hnvl7VZw4/KXPeKB3hFjrjtK4YUYyVR5G4lvCvCGLOm/5nvv/5O9SqX83cp8kt
 RQ3R5eTRoWWru52/552PwoMZ/Inxizda0QN+PWY9yNQ6hVGWE7xNy74y1N95AqpjNCFS
 dojsjkYy+pSW8UT2t3BXwm+Bf8+k47p5ny4NTekMHvrHJ3aIWYmnUbEOQh9gY7lX0Fj0
 I9n9ca99qAF1JJCveHQQWEu+6Md3YTGExT9Llb0Q8Tj73m8/rZACdtdC5OA75lwfT6fO
 6dy/DS4h/KtN89bDi1YRLAtv44lRIFsXErbCdTsiWGmupi7mcHe8XHj6jCS+6rF+BV5U XA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q25kwrr26-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 08:01:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33J81IjW006583
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 08:01:19 GMT
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 19 Apr 2023 01:01:18 -0700
Received: from nalasex01b.na.qualcomm.com ([fe80::1ef7:220a:9af9:7946]) by
 nalasex01b.na.qualcomm.com ([fe80::1ef7:220a:9af9:7946%12]) with mapi id
 15.02.0986.042; Wed, 19 Apr 2023 01:01:18 -0700
From:   "Tim Jiang (QUIC)" <quic_tjiang@quicinc.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
CC:     "marcel@holtmann.org" <marcel@holtmann.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>,
        "Hemant Gupta (QUIC)" <quic_hemantg@quicinc.com>,
        "mka@chromium.org" <mka@chromium.org>
Subject: RE: [PATCH v3] Bluetooth: btusb: Add WCN6855 devcoredump support
Thread-Topic: [PATCH v3] Bluetooth: btusb: Add WCN6855 devcoredump support
Thread-Index: AQHZcnBgYgV73uElJkSMssWBPQl/968yr+UA//+UBRA=
Date:   Wed, 19 Apr 2023 08:01:18 +0000
Message-ID: <1c0d5bcb9d724b86aa15fc84c00a68fb@quicinc.com>
References: <20230419033805.27356-1-quic_tjiang@quicinc.com>
 <a26a1b41-dd6b-4b01-696e-79e195787958@molgen.mpg.de>
In-Reply-To: <a26a1b41-dd6b-4b01-696e-79e195787958@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.253.79.29]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UBm_b59Y872GJBzqUeMZW44VtfgWGxhh
X-Proofpoint-GUID: UBm_b59Y872GJBzqUeMZW44VtfgWGxhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_04,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190072
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgUGF1bDoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBhdWwgTWVuemVs
IDxwbWVuemVsQG1vbGdlbi5tcGcuZGU+IA0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxOSwgMjAy
MyAzOjIzIFBNDQpUbzogVGltIEppYW5nIChRVUlDKSA8cXVpY190amlhbmdAcXVpY2luYy5jb20+
DQpDYzogbWFyY2VsQGhvbHRtYW5uLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
bGludXgtYmx1ZXRvb3RoQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmc7IEJhbGFrcmlzaG5hIEdvZGF2YXJ0aGkgKFFVSUMpIDxxdWljX2Jnb2RhdmFyQHF1aWNp
bmMuY29tPjsgSGVtYW50IEd1cHRhIChRVUlDKSA8cXVpY19oZW1hbnRnQHF1aWNpbmMuY29tPjsg
bWthQGNocm9taXVtLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCB2M10gQmx1ZXRvb3RoOiBidHVz
YjogQWRkIFdDTjY4NTUgZGV2Y29yZWR1bXAgc3VwcG9ydA0KDQpEZWFyIFRpbSwNCg0KDQpUaGFu
IHlvdSBmb3IgdGhlIHBhdGNoLg0KDQpBbSAxOS4wNC4yMyB1bSAwNTozOCBzY2hyaWViIFRpbSBK
aWFuZzoNCj4gV0NONjg1NSB3aWxsIHJlcG9ydCBtZW1kdW1wIHZpYSBBQ0wgZGF0YSBvciBIQ0kg
ZXZlbnQgd2hlbiBpdCBnZXQgDQo+IGNyYXNoZWQsIHNvIHdlIGNvbGxlY3QgbWVtZHVtcCB0byBk
ZWJ1ZyBmaXJtd2FyZS4NCg0Kcy93aGVuIGl0IGdldCBjcmFzaGVkL3doZW4gaXQgY3Jhc2hlcy8N
Cg0KUGxlYXNlIGdpdmUgYW4gZXhhbXBsZSwgaG93IHRvIGNvbGxlY3QgdGhlIG1lbWR1bXAsIGFu
ZCBtYXliZSBldmVuIGhvdyB0byBmb3JjZSBhIGNyYXNoLg0KW1RpbV0gZm9yY2UgYSBjcmFzaCBh
cyBmb2xsb3dpbmc6DQpzdWRvIGhjaXRvb2wgY21kIDNmIDBjIDI2DQogIGNvbGxlY3QgdGhlIG1l
bWR1bXAgLCBzdWNoIGFzIDogY2F0IC9zeXMvY2xhc3MvZGV2Y29yZWR1bXAvZGV2Y2QxL2RhdGEg
PiB+L2NyYXNoLmRtcA0KDQpQbGVhc2UgYW1lbmQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGRvY3Vt
ZW50IHRoZSBzcGVjaWZpY2F0aW9uL2RhdGFzaGVldCBuYW1lIGFuZCByZXZpc2lvbi4NCltUaW1d
IHdoYXQgZG9jdW1lbnRzID8NCg0KSXMgV0NONjg1NSB0aGUgb25seSBkZXZpY2Ugc3VwcG9ydGlu
ZyB0aGlzLCBvciBjb3VsZCBvdGhlciBkZXZpY2VzIGJlIGVhc2lseSBhZGRlZD8NCltUaW1dIG5v
ICwgc29tZSBvdGhlciBxY2EgZGV2aWNlcyBhbHNvIGNhbiBiZSBzdXBwb3J0IHRoaXMgLCBJIHBs
YW4gdG8gcmFpc2UgYW5vdGhlciBjaGFuZ2UNCg0KPiBTaWduZWQtb2ZmLWJ5OiBUaW0gSmlhbmcg
PHF1aWNfdGppYW5nQHF1aWNpbmMuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2JsdWV0b290aC9i
dHVzYi5jIHwgMjIyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDIyMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ibHVldG9vdGgvYnR1c2IuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMgDQo+IGlu
ZGV4IDIzMDNiMGE2NjMyMy4uZjA0NWJiYjBlZTA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Js
dWV0b290aC9idHVzYi5jDQo+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMNCj4gQEAg
LTczMyw2ICs3MzMsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJ0dXNi
X25lZWRzX3Jlc2V0X3Jlc3VtZV90YWJsZVtdID0gew0KPiAgIAl7fQ0KPiAgIH07DQo+ICAgDQo+
ICtzdHJ1Y3QgcWNhX2R1bXBfaW5mbyB7DQo+ICsJLyogZmllbGRzIGZvciBkdW1wIGNvbGxlY3Rp
b24gKi8NCj4gKwl1MTYgaWRfdmVuZG9yOw0KPiArCXUxNiBpZF9wcm9kdWN0Ow0KPiArCXUzMiBm
d192ZXJzaW9uOw0KPiArCXUzMiBjb250cm9sbGVyX2lkOw0KPiArCXUzMiByYW1fZHVtcF9zaXpl
Ow0KDQpJ4oCZZCBhZGQgdGhlIHVuaXQgdG8gdGhlIHZhcmlhYmxlIG5hbWUuDQoNCj4gKwl1MTYg
cmFtX2R1bXBfc2Vxbm87DQo+ICt9Ow0KPiArDQo+ICAgI2RlZmluZSBCVFVTQl9NQVhfSVNPQ19G
UkFNRVMJMTANCj4gICANCj4gICAjZGVmaW5lIEJUVVNCX0lOVFJfUlVOTklORwkwDQo+IEBAIC03
NTIsNiArNzYyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJ0dXNiX25l
ZWRzX3Jlc2V0X3Jlc3VtZV90YWJsZVtdID0gew0KPiAgICNkZWZpbmUgQlRVU0JfV0FLRVVQX0FV
VE9TVVNQRU5ECTE0DQo+ICAgI2RlZmluZSBCVFVTQl9VU0VfQUxUM19GT1JfV0JTCTE1DQo+ICAg
I2RlZmluZSBCVFVTQl9BTFQ2X0NPTlRJTlVPVVNfVFgJMTYNCj4gKyNkZWZpbmUgQlRVU0JfSFdf
U1NSX0FDVElWRQkxNw0KPiAgIA0KPiAgIHN0cnVjdCBidHVzYl9kYXRhIHsNCj4gICAJc3RydWN0
IGhjaV9kZXYgICAgICAgKmhkZXY7DQo+IEBAIC04MTQsNiArODI1LDggQEAgc3RydWN0IGJ0dXNi
X2RhdGEgew0KPiAgIA0KPiAgIAlpbnQgb29iX3dha2VfaXJxOyAgIC8qIGlycSBmb3Igb3V0LW9m
LWJhbmQgd2FrZS1vbi1idCAqLw0KPiAgIAl1bnNpZ25lZCBjbWRfdGltZW91dF9jbnQ7DQo+ICsN
Cj4gKwlzdHJ1Y3QgcWNhX2R1bXBfaW5mbyBxY2FfZHVtcDsNCj4gICB9Ow0KPiAgIA0KPiAgIHN0
YXRpYyB2b2lkIGJ0dXNiX3Jlc2V0KHN0cnVjdCBoY2lfZGV2ICpoZGV2KSBAQCAtOTA0LDYgKzkx
NywxMSBAQCANCj4gc3RhdGljIHZvaWQgYnR1c2JfcWNhX2NtZF90aW1lb3V0KHN0cnVjdCBoY2lf
ZGV2ICpoZGV2KQ0KPiAgIAlzdHJ1Y3QgYnR1c2JfZGF0YSAqZGF0YSA9IGhjaV9nZXRfZHJ2ZGF0
YShoZGV2KTsNCj4gICAJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbyA9IGRhdGEtPnJlc2V0
X2dwaW87DQo+ICAgDQo+ICsJaWYgKHRlc3RfYml0KEJUVVNCX0hXX1NTUl9BQ1RJVkUsICZkYXRh
LT5mbGFncykpIHsNCj4gKwkJYnRfZGV2X2luZm8oaGRldiwgIlJhbWR1bXAgaW4gcHJvZ3Jlc3Ms
IGRlZmVyIGNtZF90aW1lb3V0Iik7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gICAJaWYg
KCsrZGF0YS0+Y21kX3RpbWVvdXRfY250IDwgNSkNCj4gICAJCXJldHVybjsNCj4gICANCj4gQEAg
LTMyOTQsNiArMzMxMiwyMDIgQEAgc3RhdGljIGludCBidHVzYl9zZXRfYmRhZGRyX3djbjY4NTUo
c3RydWN0IGhjaV9kZXYgKmhkZXYsDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gKyNk
ZWZpbmUgUUNBX01FTURVTVBfQUNMX0hBTkRMRSAweDJFREQgI2RlZmluZSBRQ0FfTUVNRFVNUF9T
SVpFX01BWCAgDQo+ICsweDEwMDAwMCAjZGVmaW5lIFFDQV9NRU1EVU1QX1ZTRV9DTEFTUyAweDAx
ICNkZWZpbmUgDQo+ICtRQ0FfTUVNRFVNUF9NU0dfVFlQRSAweDA4ICNkZWZpbmUgUUNBX01FTURV
TVBfUEtUX1NJWkUgMjQ4ICNkZWZpbmUgDQo+ICtRQ0FfTEFTVF9TRVFVRU5DRV9OVU0gMHhmZmZm
DQo+ICsNCj4gK3N0cnVjdCBxY2FfZHVtcF9oZHIgew0KPiArCXU4IHZzZV9jbGFzczsNCj4gKwl1
OCBtc2dfdHlwZTsNCj4gKwlfX2xlMTYgc2Vxbm87DQo+ICsJdTggcmVzZXJ2ZWQ7DQo+ICsJdW5p
b24gew0KPiArCQl1OCBkYXRhWzBdOw0KPiArCQlzdHJ1Y3Qgew0KPiArCQkJX19sZTMyIHJhbV9k
dW1wX3NpemU7DQo+ICsJCQl1OCBkYXRhMFswXTsNCj4gKwkJfSBfX3BhY2tlZDsNCj4gKwl9Ow0K
PiArfSBfX3BhY2tlZDsNCj4gKw0KPiArDQo+ICtzdGF0aWMgdm9pZCBidHVzYl9kdW1wX2hkcl9x
Y2Eoc3RydWN0IGhjaV9kZXYgKmhkZXYsIHN0cnVjdCBza19idWZmIA0KPiArKnNrYikgew0KPiAr
CWNoYXIgYnVmWzEyOF07DQo+ICsJc3RydWN0IGJ0dXNiX2RhdGEgKmJ0ZGF0YSA9IGhjaV9nZXRf
ZHJ2ZGF0YShoZGV2KTsNCj4gKw0KPiArCXNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICJDb250
cm9sbGVyIE5hbWU6IDB4JXhcbiIsDQo+ICsJCQlidGRhdGEtPnFjYV9kdW1wLmNvbnRyb2xsZXJf
aWQpOw0KPiArCXNrYl9wdXRfZGF0YShza2IsIGJ1Ziwgc3RybGVuKGJ1ZikpOw0KPiArDQo+ICsJ
c25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIkZpcm13YXJlIFZlcnNpb246IDB4JXhcbiIsDQo+
ICsJCQlidGRhdGEtPnFjYV9kdW1wLmZ3X3ZlcnNpb24pOw0KPiArCXNrYl9wdXRfZGF0YShza2Is
IGJ1Ziwgc3RybGVuKGJ1ZikpOw0KPiArDQo+ICsJc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwg
IkRyaXZlcjogJXNcblZlbmRvcjogcWNhXG4iLA0KPiArCQkJYnR1c2JfZHJpdmVyLm5hbWUpOw0K
PiArCXNrYl9wdXRfZGF0YShza2IsIGJ1Ziwgc3RybGVuKGJ1ZikpOw0KPiArDQo+ICsJc25wcmlu
dGYoYnVmLCBzaXplb2YoYnVmKSwgIlZJRDogMHgleFxuUElEOjB4JXhcbiIsDQo+ICsJCQlidGRh
dGEtPnFjYV9kdW1wLmlkX3ZlbmRvciwgYnRkYXRhLT5xY2FfZHVtcC5pZF9wcm9kdWN0KTsNCj4g
Kwlza2JfcHV0X2RhdGEoc2tiLCBidWYsIHN0cmxlbihidWYpKTsNCj4gKw0KPiArCXNucHJpbnRm
KGJ1Ziwgc2l6ZW9mKGJ1ZiksICJMbXAgU3VidmVyc2lvbjogMHgleFxuIiwNCj4gKwkJCWhkZXYt
PmxtcF9zdWJ2ZXIpOw0KPiArCXNrYl9wdXRfZGF0YShza2IsIGJ1Ziwgc3RybGVuKGJ1ZikpOyB9
DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGJ0dXNiX2NvcmVkdW1wX3FjYShzdHJ1Y3QgaGNpX2RldiAq
aGRldikgew0KPiArCXN0YXRpYyBjb25zdCB1OCBwYXJhbVtdID0geyAweDI2IH07DQo+ICsJc3Ry
dWN0IHNrX2J1ZmYgKnNrYjsNCj4gKw0KPiArCXNrYiA9IF9faGNpX2NtZF9zeW5jKGhkZXYsIDB4
ZmMwYywgMSwgcGFyYW0sIEhDSV9DTURfVElNRU9VVCk7DQo+ICsJaWYgKElTX0VSUihza2IpKQ0K
PiArCQlidF9kZXZfZXJyKGhkZXYsICIlczogdHJpZ2dsZSBjcmFzaCBmYWlsZWQgKCVsZCkiLCBf
X2Z1bmNfXywgDQo+ICtQVFJfRVJSKHNrYikpOw0KDQpXaGF0IGRvZXMg4oCcdHJpZ2dsZeKAnSBt
ZWFuPw0KDQo+ICsJa2ZyZWVfc2tiKHNrYik7DQo+ICt9DQo+ICsNCj4gKy8qDQo+ICsgKiA9PTA6
IG5vdCBhIGR1bXAgcGt0Lg0KPiArICogPCAwOiBmYWlscyB0byBoYW5kbGUgYSBkdW1wIHBrdA0K
PiArICogPiAwOiBvdGhlcndpc2UuDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgaGFuZGxlX2R1bXBf
cGt0X3FjYShzdHJ1Y3QgaGNpX2RldiAqaGRldiwgc3RydWN0IHNrX2J1ZmYgDQo+ICsqc2tiKSB7
DQo+ICsJaW50IHJldCA9IDE7DQo+ICsJdTggcGt0X3R5cGU7DQo+ICsJdTggKnNrX3B0cjsNCj4g
Kwl1bnNpZ25lZCBpbnQgc2tfbGVuOw0KPiArCXUxNiBzZXFubzsNCj4gKwl1MzIgZHVtcF9zaXpl
Ow0KPiArDQo+ICsJc3RydWN0IGhjaV9ldmVudF9oZHIgKmV2ZW50X2hkcjsNCj4gKwlzdHJ1Y3Qg
aGNpX2FjbF9oZHIgKmFjbF9oZHI7DQo+ICsJc3RydWN0IHFjYV9kdW1wX2hkciAqZHVtcF9oZHI7
DQo+ICsJc3RydWN0IGJ0dXNiX2RhdGEgKmJ0ZGF0YSA9IGhjaV9nZXRfZHJ2ZGF0YShoZGV2KTsN
Cj4gKwlzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiA9IGJ0ZGF0YS0+dWRldjsNCj4gKw0KPiArCXBr
dF90eXBlID0gaGNpX3NrYl9wa3RfdHlwZShza2IpOw0KPiArCXNrX3B0ciA9IHNrYi0+ZGF0YTsN
Cj4gKwlza19sZW4gPSBza2ItPmxlbjsNCj4gKw0KPiArCWlmIChwa3RfdHlwZSA9PSBIQ0lfQUNM
REFUQV9QS1QpIHsNCj4gKwkJYWNsX2hkciA9IGhjaV9hY2xfaGRyKHNrYik7DQo+ICsJCWlmIChs
ZTE2X3RvX2NwdShhY2xfaGRyLT5oYW5kbGUpICE9IFFDQV9NRU1EVU1QX0FDTF9IQU5ETEUpDQo+
ICsJCQlyZXR1cm4gMDsNCj4gKwkJc2tfcHRyICs9IEhDSV9BQ0xfSERSX1NJWkU7DQo+ICsJCXNr
X2xlbiAtPSBIQ0lfQUNMX0hEUl9TSVpFOw0KPiArCQlldmVudF9oZHIgPSAoc3RydWN0IGhjaV9l
dmVudF9oZHIgKilza19wdHI7DQo+ICsJfSBlbHNlIHsNCj4gKwkJZXZlbnRfaGRyID0gaGNpX2V2
ZW50X2hkcihza2IpOw0KPiArCX0NCj4gKw0KPiArCWlmICgoZXZlbnRfaGRyLT5ldnQgIT0gSENJ
X1ZFTkRPUl9QS1QpDQo+ICsJCXx8IChldmVudF9oZHItPnBsZW4gIT0gKHNrX2xlbiAtIEhDSV9F
VkVOVF9IRFJfU0laRSkpKQ0KPiArCQlyZXR1cm4gMDsNCg0KSW5kZW50YXRpb24vYWxpZ25tZW50
IG9mIHRoZSBzZWNvbmQgYW5kIHRoaXJkIGxpbmUgKGl04oCZcyB0aGUgc2FtZSkgbG9va3MgY29u
ZnVzaW5nLCBhcyBpdOKAmXMgbm90IGNsZWFyLCB3aGF0IGlzIHRoZSBib2R5Lg0KDQo+ICsNCj4g
Kwlza19wdHIgKz0gSENJX0VWRU5UX0hEUl9TSVpFOw0KPiArCXNrX2xlbiAtPSBIQ0lfRVZFTlRf
SERSX1NJWkU7DQo+ICsNCj4gKwlkdW1wX2hkciA9IChzdHJ1Y3QgcWNhX2R1bXBfaGRyICopc2tf
cHRyOw0KPiArCWlmICgoc2tfbGVuIDwgb2Zmc2V0b2Yoc3RydWN0IHFjYV9kdW1wX2hkciwgZGF0
YSkpDQo+ICsJCXx8IChkdW1wX2hkci0+dnNlX2NsYXNzICE9IFFDQV9NRU1EVU1QX1ZTRV9DTEFT
UykNCj4gKwkgICAgfHwgKGR1bXBfaGRyLT5tc2dfdHlwZSAhPSBRQ0FfTUVNRFVNUF9NU0dfVFlQ
RSkpDQoNClRoZSBjb2Rpbmcgc3R5bGUgaXMgb2ZmLg0KDQo+ICsJCXJldHVybiAwOw0KPiArDQo+
ICsJLyppdCBpcyBkdW1wIHBrdCBub3cqLw0KDQpQbGVhc2UgYWRkIHNwYWNlcywgYW5kIGVsYWJv
cmF0ZS4gSSBkbyBub3QgdW5kZXJzdGFudCB0aGUgY29tbWVudC4NCg0KPiArCXNlcW5vID0gbGUx
Nl90b19jcHUoZHVtcF9oZHItPnNlcW5vKTsNCj4gKwlpZiAoc2Vxbm8gPT0gMCkgew0KPiArCQlz
ZXRfYml0KEJUVVNCX0hXX1NTUl9BQ1RJVkUsICZidGRhdGEtPmZsYWdzKTsNCj4gKwkJZHVtcF9z
aXplID0gbGUzMl90b19jcHUoZHVtcF9oZHItPnJhbV9kdW1wX3NpemUpOw0KPiArCQlpZiAoIWR1
bXBfc2l6ZSB8fCAoZHVtcF9zaXplID4gUUNBX01FTURVTVBfU0laRV9NQVgpKSB7DQo+ICsJCQly
ZXQgPSAtRUlMU0VROw0KPiArCQkJYnRfZGV2X2VycihoZGV2LCAiSW52YWxpZCBtZW1kdW1wIHNp
emUoJXUpIiwNCj4gKwkJCQkgICBkdW1wX3NpemUpOw0KPiArCQkJZ290byBvdXQ7DQo+ICsJCX0N
Cj4gKw0KPiArCQlyZXQgPSBoY2lfZGV2Y2RfaW5pdChoZGV2LCBkdW1wX3NpemUpOw0KPiArCQlp
ZiAocmV0IDwgMCkgew0KPiArCQkJYnRfZGV2X2VycihoZGV2LCAibWVtZHVtcCBpbml0IGVycm9y
KCVkKSIsIHJldCk7DQoNCknigJlkIGFkZCBzcGFjZXMgYmVmb3JlIHRoZSAoLg0KDQo+ICsJCQln
b3RvIG91dDsNCj4gKwkJfQ0KPiArDQo+ICsJCWJ0ZGF0YS0+cWNhX2R1bXAucmFtX2R1bXBfc2l6
ZSA9IGR1bXBfc2l6ZTsNCj4gKwkJYnRkYXRhLT5xY2FfZHVtcC5yYW1fZHVtcF9zZXFubyA9IDA7
DQo+ICsJCXNrX3B0ciArPSBvZmZzZXRvZihzdHJ1Y3QgcWNhX2R1bXBfaGRyLCBkYXRhMCk7DQo+
ICsJCXNrX2xlbiAtPSBvZmZzZXRvZihzdHJ1Y3QgcWNhX2R1bXBfaGRyLCBkYXRhMCk7DQo+ICsN
Cj4gKwkJdXNiX2Rpc2FibGVfYXV0b3N1c3BlbmQodWRldik7DQo+ICsJCWJ0X2Rldl9pbmZvKGhk
ZXYsICIlcyBtZW1kdW1wIHNpemUoJXUpXG4iLA0KPiArCQkJICAgIChwa3RfdHlwZSA9PSBIQ0lf
QUNMREFUQV9QS1QpID8gIkFDTCIgOiAiZXZlbnQiLA0KPiArCQkJICAgIGR1bXBfc2l6ZSk7DQo+
ICsJfSBlbHNlIHsNCj4gKwkJc2tfcHRyICs9IG9mZnNldG9mKHN0cnVjdCBxY2FfZHVtcF9oZHIs
IGRhdGEpOw0KPiArCQlza19sZW4gLT0gb2Zmc2V0b2Yoc3RydWN0IHFjYV9kdW1wX2hkciwgZGF0
YSk7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKCFidGRhdGEtPnFjYV9kdW1wLnJhbV9kdW1wX3NpemUp
IHsNCj4gKwkJcmV0ID0gLUVJTlZBTDsNCj4gKwkJYnRfZGV2X2VycihoZGV2LCAibWVtZHVtcCBp
cyBub3QgYWN0aXZlIik7DQoNCldoYXQgaXMgdGhlIGhldXJpc3RpY3MgYmVoaW5kIHRoYXQ/IFNl
dHRpbmcgYHJhbV9kdW1wX3NpemVgIHRvIHplcm8gZGlzYWJsZXMgdGhlIGZlYXR1cmU/IFdoZXJl
IGlzIHRoaXMgZG9jdW1lbnRlZD8NCg0KPiArCQlnb3RvIG91dDsNCj4gKwl9DQo+ICsNCj4gKwlp
ZiAoKHNlcW5vID4gYnRkYXRhLT5xY2FfZHVtcC5yYW1fZHVtcF9zZXFubyArIDEpICYmIChzZXFu
byAhPSBRQ0FfTEFTVF9TRVFVRU5DRV9OVU0pKSB7DQo+ICsJCWR1bXBfc2l6ZSA9IFFDQV9NRU1E
VU1QX1BLVF9TSVpFICogKHNlcW5vIC0gYnRkYXRhLT5xY2FfZHVtcC5yYW1fZHVtcF9zZXFubyAt
IDEpOw0KPiArCQloY2lfZGV2Y2RfYXBwZW5kX3BhdHRlcm4oaGRldiwgMHgwLCBkdW1wX3NpemUp
Ow0KPiArCQlidF9kZXZfZXJyKGhkZXYsDQo+ICsJCQkgICAiZXhwZWN0ZWQgbWVtZHVtcCBzZXFu
bygldSkgaXMgbm90IHJlY2VpdmVkKCV1KVxuIiwNCg0KSeKAmWQgYWRkIHNwYWNlcyBiZWZvcmUg
dGhlICgg4oCTIGFsc28gaW4gb3RoZXIgcGxhY2VzLg0KDQoNCktpbmQgcmVnYXJkcywNCg0KUGF1
bA0KDQoNCj4gKwkJCSAgIGJ0ZGF0YS0+cWNhX2R1bXAucmFtX2R1bXBfc2Vxbm8sIHNlcW5vKTsN
Cj4gKwkJYnRkYXRhLT5xY2FfZHVtcC5yYW1fZHVtcF9zZXFubyA9IHNlcW5vOw0KPiArCQlrZnJl
ZV9za2Ioc2tiKTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwlza2JfcHVsbChz
a2IsIHNrYi0+bGVuIC0gc2tfbGVuKTsNCj4gKwloY2lfZGV2Y2RfYXBwZW5kKGhkZXYsIHNrYik7
DQo+ICsJYnRkYXRhLT5xY2FfZHVtcC5yYW1fZHVtcF9zZXFubysrOw0KPiArCWlmIChzZXFubyA9
PSBRQ0FfTEFTVF9TRVFVRU5DRV9OVU0pIHsNCj4gKwkJYnRfZGV2X2luZm8oaGRldiwNCj4gKwkJ
CQkibWVtZHVtcCBkb25lOiBwa3RzKCV1KSwgdG90YWwoJXUpXG4iLA0KPiArCQkJCWJ0ZGF0YS0+
cWNhX2R1bXAucmFtX2R1bXBfc2Vxbm8sIGJ0ZGF0YS0+cWNhX2R1bXAucmFtX2R1bXBfc2l6ZSk7
DQo+ICsNCj4gKwkJaGNpX2RldmNkX2NvbXBsZXRlKGhkZXYpOw0KPiArCQlnb3RvIG91dDsNCj4g
Kwl9DQo+ICsJcmV0dXJuIHJldDsNCj4gKw0KPiArb3V0Og0KPiArCWlmIChidGRhdGEtPnFjYV9k
dW1wLnJhbV9kdW1wX3NpemUpDQo+ICsJCXVzYl9lbmFibGVfYXV0b3N1c3BlbmQodWRldik7DQo+
ICsJYnRkYXRhLT5xY2FfZHVtcC5yYW1fZHVtcF9zaXplID0gMDsNCj4gKwlidGRhdGEtPnFjYV9k
dW1wLnJhbV9kdW1wX3NlcW5vID0gMDsNCj4gKwljbGVhcl9iaXQoQlRVU0JfSFdfU1NSX0FDVElW
RSwgJmJ0ZGF0YS0+ZmxhZ3MpOw0KPiArDQo+ICsJaWYgKHJldCA8IDApDQo+ICsJCWtmcmVlX3Nr
Yihza2IpOw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgYnR1c2Jf
cmVjdl9hY2xfcWNhKHN0cnVjdCBoY2lfZGV2ICpoZGV2LCBzdHJ1Y3Qgc2tfYnVmZiANCj4gKypz
a2IpIHsNCj4gKwlpZiAoaGFuZGxlX2R1bXBfcGt0X3FjYShoZGV2LCBza2IpKQ0KPiArCQlyZXR1
cm4gMDsNCj4gKwlyZXR1cm4gaGNpX3JlY3ZfZnJhbWUoaGRldiwgc2tiKTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIGludCBidHVzYl9yZWN2X2V2dF9xY2Eoc3RydWN0IGhjaV9kZXYgKmhkZXYsIHN0
cnVjdCBza19idWZmIA0KPiArKnNrYikgew0KPiArCWlmIChoYW5kbGVfZHVtcF9wa3RfcWNhKGhk
ZXYsIHNrYikpDQo+ICsJCXJldHVybiAwOw0KPiArCXJldHVybiBoY2lfcmVjdl9mcmFtZShoZGV2
LCBza2IpOw0KPiArfQ0KPiArDQo+ICsNCj4gICAjZGVmaW5lIFFDQV9ERlVfUEFDS0VUX0xFTgk0
MDk2DQo+ICAgDQo+ICAgI2RlZmluZSBRQ0FfR0VUX1RBUkdFVF9WRVJTSU9OCTB4MDkNCj4gQEAg
LTM2MjgsNiArMzg0Miw5IEBAIHN0YXRpYyBpbnQgYnR1c2Jfc2V0dXBfcWNhKHN0cnVjdCBoY2lf
ZGV2ICpoZGV2KQ0KPiAgIAlpZiAoZXJyIDwgMCkNCj4gICAJCXJldHVybiBlcnI7DQo+ICAgDQo+
ICsJYnRkYXRhLT5xY2FfZHVtcC5md192ZXJzaW9uID0gbGUzMl90b19jcHUodmVyLnBhdGNoX3Zl
cnNpb24pOw0KPiArCWJ0ZGF0YS0+cWNhX2R1bXAuY29udHJvbGxlcl9pZCA9IGxlMzJfdG9fY3B1
KHZlci5yb21fdmVyc2lvbik7DQo+ICsNCj4gICAJaWYgKCEoc3RhdHVzICYgUUNBX1NZU0NGR19V
UERBVEVEKSkgew0KPiAgIAkJZXJyID0gYnR1c2Jfc2V0dXBfcWNhX2xvYWRfbnZtKGhkZXYsICZ2
ZXIsIGluZm8pOw0KPiAgIAkJaWYgKGVyciA8IDApDQo+IEBAIC00MTE3LDYgKzQzMzQsMTEgQEAg
c3RhdGljIGludCBidHVzYl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwNCj4gICAJ
fQ0KPiAgIA0KPiAgIAlpZiAoaWQtPmRyaXZlcl9pbmZvICYgQlRVU0JfUUNBX1dDTjY4NTUpIHsN
Cj4gKwkJZGF0YS0+cWNhX2R1bXAuaWRfdmVuZG9yID0gaWQtPmlkVmVuZG9yOw0KPiArCQlkYXRh
LT5xY2FfZHVtcC5pZF9wcm9kdWN0ID0gaWQtPmlkUHJvZHVjdDsNCj4gKwkJZGF0YS0+cmVjdl9l
dmVudCA9IGJ0dXNiX3JlY3ZfZXZ0X3FjYTsNCj4gKwkJZGF0YS0+cmVjdl9hY2wgPSBidHVzYl9y
ZWN2X2FjbF9xY2E7DQo+ICsJCWhjaV9kZXZjZF9yZWdpc3RlcihoZGV2LCBidHVzYl9jb3JlZHVt
cF9xY2EsIGJ0dXNiX2R1bXBfaGRyX3FjYSwgDQo+ICtOVUxMKTsNCj4gICAJCWRhdGEtPnNldHVw
X29uX3VzYiA9IGJ0dXNiX3NldHVwX3FjYTsNCj4gICAJCWhkZXYtPnNodXRkb3duID0gYnR1c2Jf
c2h1dGRvd25fcWNhOw0KPiAgIAkJaGRldi0+c2V0X2JkYWRkciA9IGJ0dXNiX3NldF9iZGFkZHJf
d2NuNjg1NTsNCg==
