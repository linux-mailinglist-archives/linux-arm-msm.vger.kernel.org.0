Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7B3C6A689D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 09:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjCAINj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 03:13:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjCAINi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 03:13:38 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C2A44B8;
        Wed,  1 Mar 2023 00:13:36 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3213RR9e021906;
        Wed, 1 Mar 2023 08:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=BRHFoWIj+8F0fcbTP5Rvc6mNgEWgB8Dk9Uhh3agYKng=;
 b=Sk3Vnlfcn6zaNzjschDA/RfuN8CSAXHA5YewB0NaXAYbnvfhDAVFCpSOmK1/MynLArPu
 OuLJRZq6nuEot0r58LW1t/9RHPsj7w4CSnT/iv/uHnZZBI2QxZAAM95H75apc+vPyRur
 d4lgXgmrtoTXY0sjeBBxUPVqWW8Begwti0F5Rd6xHMZeMrhiXuzh15v3XLVubpA27j2P
 rWpfAW+FNLMqMkI/u0y6A27UmmD7WZrPu7fdC76Le+x18gCAqc3d6fwupwU151Diq8qh
 bG7Iuom03JHtx/6iJvqM7w/Cj9JU7/sKJdMgTIthkQpRURdyhM7wazIzxSOVP/9+5cH2 aQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1n0tj54t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Mar 2023 08:13:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3218DVcG011208
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 1 Mar 2023 08:13:31 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 1 Mar 2023 00:13:30 -0800
Received: from nalasex01a.na.qualcomm.com ([fe80::96c7:affa:94e1:ece3]) by
 nalasex01a.na.qualcomm.com ([fe80::96c7:affa:94e1:ece3%4]) with mapi id
 15.02.0986.041; Wed, 1 Mar 2023 00:13:30 -0800
From:   "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To:     "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "Bjorn Andersson (QUIC)" <quic_bjorande@quicinc.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "Vishnuvardhan Prodduturi (QUIC)" <quic_vproddut@quicinc.com>
Subject: RE: [RFC PATCH 1/2] drm/msm/dp: enumerate edp panel during driver
 probe
Thread-Topic: [RFC PATCH 1/2] drm/msm/dp: enumerate edp panel during driver
 probe
Thread-Index: AQHZR467FssNTZzZyEK1D3A6Ue8YH67dJcgAgAhN8vA=
Date:   Wed, 1 Mar 2023 08:13:30 +0000
Message-ID: <72b9c34357a443df8cbb55c6eddd8a21@quicinc.com>
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
 <20230223135635.30659-2-quic_sbillaka@quicinc.com>
 <CAA8EJprGzCBcWVkHHJxAtVOTuH5DeyYwKw-hHp+T1QvhvHXjsA@mail.gmail.com>
In-Reply-To: <CAA8EJprGzCBcWVkHHJxAtVOTuH5DeyYwKw-hHp+T1QvhvHXjsA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.216.29.118]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZTk6mXIPw_o_x7O7vIaNFf0jFLF7uwG3
X-Proofpoint-GUID: ZTk6mXIPw_o_x7O7vIaNFf0jFLF7uwG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303010065
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pj4NCj4+IFRoZSBlRFAgcGFuZWwgaXMgaWRlbnRpZmllZCBhbmQgZW51bWVyYXRlZCBkdXJpbmcg
cHJvYmUgb2YgdGhlDQo+PiBwYW5lbC1lZHAgZHJpdmVyLiBUaGUgY3VycmVudCBEUCBkcml2ZXIg
dHJpZ2dlcnMgdGhpcyBwYW5lbC1lZHAgZHJpdmVyDQo+PiBwcm9iZSB3aGlsZSBnZXR0aW5nIHRo
ZSBwYW5lbC1icmlkZ2UgYXNzb2NpYXRlZCB3aXRoIHRoZSBlRFAgcGFuZWwNCj4+IGZyb20gdGhl
IHBsYXRmb3JtIGRyaXZlciBiaW5kLiBJZiB0aGUgcGFuZWwtZWRwIHByb2JlIGlzIGRlZmVycmVk
LA0KPj4gdGhlbiB0aGUgd2hvbGUgYnVuY2ggb2YgTURTUyBwYXJlbnQgYW5kIGNoaWxkIGRyaXZl
cnMgaGF2ZSB0byBkZWZlciBhbmQNCj5yb2xsIGJhY2suDQo+DQo+Tm8sIE1EU1MgaGFzIG5vdCBi
ZWVuIHJvbGxlZCBiYWNrIHNpbmNlIDUuMTkuIFBsZWFzZSBzaGlmdCB5b3VyIGRldmVsb3BtZW50
DQo+b24gdG9wIG9mIHRoZSBjdXJyZW50IG1zbS1uZXh0Lg0KPg0KDQpPa2F5LCBJIHdpbGwgbW92
ZSB0byB0aGUgbXNtLW5leHQgdGlwLg0KDQo+Pg0KPj4gU28sIHdlIHdhbnQgdG8gbW92ZSB0aGUg
cGFuZWwgZW51bWVyYXRpb24gZnJvbSBiaW5kIHRvIHByb2JlIHNvIHRoYXQNCj4+IHRoZSBwcm9i
ZSBkZWZlciBpcyBlYXNpZXIgdG8gaGFuZGxlIGFuZCBhbHNvIGJvdGggdGhlIGRyaXZlcnMgYXBw
ZWFyDQo+PiBjb25zaXN0ZW50IGluIHBhbmVsIGVudW1lcmF0aW9uLiBUaGlzIGNoYW5nZSBtb3Zl
cyB0aGUgRFAgZHJpdmVyDQo+PiBwYW5lbC1icmlkZ2UgZW51bWVyYXRpb24gdG8gcHJvYmUuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2Fua2VlcnRoIEJpbGxha2FudGkgPHF1aWNfc2JpbGxha2FA
cXVpY2luYy5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2F1eC5j
ICAgICB8IDE0OQ0KPisrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4+ICBkcml2ZXJzL2dw
dS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYyB8ICAxMiArKysNCj4+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2RwL2RwX2NhdGFsb2cuaCB8ICAgMSArDQo+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9k
cF9kaXNwbGF5LmMgfCAgODAgKysrKysrLS0tLS0tLS0tDQo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAx
ODIgaW5zZXJ0aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfYXV4LmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
cC9kcF9hdXguYyBpbmRleCBjYzNlZmVkNTkzYWEuLjVkYTk1ZGZkZWVkZQ0KPj4gMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2F1eC5jDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2RwL2RwX2F1eC5jDQo+PiBAQCAtMTEwLDcgKzExMCw3IEBAIHN0YXRpYyBz
c2l6ZV90IGRwX2F1eF93cml0ZShzdHJ1Y3QgZHBfYXV4X3ByaXZhdGUNCj4+ICphdXgsICB9DQo+
Pg0KPj4gIHN0YXRpYyBzc2l6ZV90IGRwX2F1eF9jbWRfZmlmb190eChzdHJ1Y3QgZHBfYXV4X3By
aXZhdGUgKmF1eCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1f
ZHBfYXV4X21zZyAqbXNnKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGRybV9kcF9hdXhfbXNnICptc2csIGJvb2wgcG9sbCkNCj4NCj5XaGF0IGlzIHRoZSByZWFzb24g
Zm9yIHdvcmtpbmcgaW4gcG9sbGVkIG1vZGUgcmF0aGVyIHRoYW4gYWx3YXlzIHVzaW5nIHRoZQ0K
PmludGVycnVwdHM/DQo+DQoNClRoZSBtZHNzIGludGVycnVwdHMgd2lsbCBiZSBlbmFibGVkIGFu
ZCBjYW4gYmUgdXNlZCBhZnRlciBtc21faXJxX2luc3RhbGwgZnJvbSBtc21fZHJtX2JpbmQuDQpX
ZSB3YW50IHRvIHBlcmZvcm0gYXV4IHRyYW5zYWN0aW9ucyBkdXJpbmcgcHJvYmUuIFRoZSBhdXgg
ZGF0YSB0cmFuc21pc3Npb24gaXMgZm9sbG93ZWQgYnkgYW4NCmludGVycnVwdCB0byBpbmRpY2F0
ZSBzdWNjZXNzZnVsIHRyYW5zbWlzc2lvbiBzdGF0dXMgYW5kIHJlcGx5IGluZm9ybWF0aW9uLg0K
DQpBcyBpbnRlcnJ1cHRzIGFyZSBub3QgZW5hYmxlZCwgSSB0b29rIHRoaXMgcG9sbGluZyBhcHBy
b2FjaCBmb3IgYXV4IGludGVycnVwdHMgZHVyaW5nIHByb2JlLg0KDQo+PiAgew0KPj4gICAgICAg
ICBzc2l6ZV90IHJldDsNCj4+ICAgICAgICAgdW5zaWduZWQgbG9uZyB0aW1lX2xlZnQ7DQo+PiBA
QCAtMTIxLDEwICsxMjEsMTYgQEAgc3RhdGljIHNzaXplX3QgZHBfYXV4X2NtZF9maWZvX3R4KHN0
cnVjdA0KPmRwX2F1eF9wcml2YXRlICphdXgsDQo+PiAgICAgICAgIGlmIChyZXQgPCAwKQ0KPj4g
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pg0KPj4gLSAgICAgICB0aW1lX2xlZnQgPSB3
YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmF1eC0+Y29tcCwNCj4+ICsgICAgICAgaWYgKCFw
b2xsKSB7DQo+PiArICAgICAgICAgICAgICAgdGltZV9sZWZ0ID0gd2FpdF9mb3JfY29tcGxldGlv
bl90aW1lb3V0KCZhdXgtPmNvbXAsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtc2Vjc190b19qaWZmaWVzKDI1MCkpOw0KPj4gLSAgICAgICBpZiAo
IXRpbWVfbGVmdCkNCj4+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVUSU1FRE9VVDsNCj4+ICsg
ICAgICAgICAgICAgICBpZiAoIXRpbWVfbGVmdCkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRVRJTUVET1VUOw0KPj4gKyAgICAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgICAg
ICAgIHJldCA9IGRwX2NhdGFsb2dfYXV4X3BvbGxfYW5kX2dldF9od19pbnRlcnJ1cHQoYXV4LT5j
YXRhbG9nKTsNCj4+ICsgICAgICAgICAgICAgICBpZiAoIXJldCkNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGRwX2F1eF9pc3IoJmF1eC0+ZHBfYXV4KTsNCj4+ICsgICAgICAgfQ0KPj4NCj4+
ICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICB9DQo+PiBAQCAtMjM4LDcgKzI0NCw3IEBAIHN0YXRp
YyB2b2lkDQo+ZHBfYXV4X3VwZGF0ZV9vZmZzZXRfYW5kX3NlZ21lbnQoc3RydWN0IGRwX2F1eF9w
cml2YXRlICphdXgsDQo+PiAgICovDQo+PiAgc3RhdGljIHZvaWQgZHBfYXV4X3RyYW5zZmVyX2hl
bHBlcihzdHJ1Y3QgZHBfYXV4X3ByaXZhdGUgKmF1eCwNCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGRybV9kcF9hdXhfbXNnICppbnB1dF9tc2csDQo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgc2VuZF9zZWcpDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgc2VuZF9zZWcsIGJvb2wgcG9sbCkNCj4+
ICB7DQo+PiAgICAgICAgIHN0cnVjdCBkcm1fZHBfYXV4X21zZyBoZWxwZXJfbXNnOw0KPj4gICAg
ICAgICB1MzIgbWVzc2FnZV9zaXplID0gMHgxMDsNCj4+IEBAIC0yNzgsNyArMjg0LDcgQEAgc3Rh
dGljIHZvaWQgZHBfYXV4X3RyYW5zZmVyX2hlbHBlcihzdHJ1Y3QNCj5kcF9hdXhfcHJpdmF0ZSAq
YXV4LA0KPj4gICAgICAgICAgICAgICAgIGhlbHBlcl9tc2cuYWRkcmVzcyA9IHNlZ21lbnRfYWRk
cmVzczsNCj4+ICAgICAgICAgICAgICAgICBoZWxwZXJfbXNnLmJ1ZmZlciA9ICZhdXgtPnNlZ21l
bnQ7DQo+PiAgICAgICAgICAgICAgICAgaGVscGVyX21zZy5zaXplID0gMTsNCj4+IC0gICAgICAg
ICAgICAgICBkcF9hdXhfY21kX2ZpZm9fdHgoYXV4LCAmaGVscGVyX21zZyk7DQo+PiArICAgICAg
ICAgICAgICAgZHBfYXV4X2NtZF9maWZvX3R4KGF1eCwgJmhlbHBlcl9tc2csIHBvbGwpOw0KPj4g
ICAgICAgICB9DQo+Pg0KPj4gICAgICAgICAvKg0KPj4gQEAgLTI5Miw3ICsyOTgsNyBAQCBzdGF0
aWMgdm9pZCBkcF9hdXhfdHJhbnNmZXJfaGVscGVyKHN0cnVjdA0KPmRwX2F1eF9wcml2YXRlICph
dXgsDQo+PiAgICAgICAgIGhlbHBlcl9tc2cuYWRkcmVzcyA9IGlucHV0X21zZy0+YWRkcmVzczsN
Cj4+ICAgICAgICAgaGVscGVyX21zZy5idWZmZXIgPSAmYXV4LT5vZmZzZXQ7DQo+PiAgICAgICAg
IGhlbHBlcl9tc2cuc2l6ZSA9IDE7DQo+PiAtICAgICAgIGRwX2F1eF9jbWRfZmlmb190eChhdXgs
ICZoZWxwZXJfbXNnKTsNCj4+ICsgICAgICAgZHBfYXV4X2NtZF9maWZvX3R4KGF1eCwgJmhlbHBl
cl9tc2csIHBvbGwpOw0KPj4NCj4+ICBlbmQ6DQo+PiAgICAgICAgIGF1eC0+b2Zmc2V0ICs9IG1l
c3NhZ2Vfc2l6ZTsNCj4+IEBAIC0zMDAsNiArMzA2LDEyMiBAQCBzdGF0aWMgdm9pZCBkcF9hdXhf
dHJhbnNmZXJfaGVscGVyKHN0cnVjdA0KPmRwX2F1eF9wcml2YXRlICphdXgsDQo+PiAgICAgICAg
ICAgICAgICAgYXV4LT5zZWdtZW50ID0gMHgwOyAvKiByZXNldCBzZWdtZW50IGF0IGVuZCBvZiBi
bG9jaw0KPj4gKi8gIH0NCj4+DQo+PiArLyoNCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIGRvZXMgdGhl
IHJlYWwgam9iIHRvIHByb2Nlc3MgYW4gQVVYIHRyYW5zYWN0aW9uLg0KPj4gKyAqIEl0IHdpbGwg
Y2FsbCBhdXhfcmVzZXQoKSBmdW5jdGlvbiB0byByZXNldCB0aGUgQVVYIGNoYW5uZWwsDQo+PiAr
ICogaWYgdGhlIHdhaXRpbmcgaXMgdGltZW91dC4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgc3NpemVf
dCBkcF9hdXhfdHJhbnNmZXJfaW5pdChzdHJ1Y3QgZHJtX2RwX2F1eCAqZHBfYXV4LA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZHBfYXV4X21zZyAqbXNnKSB7
DQo+PiArICAgICAgIHNzaXplX3QgcmV0Ow0KPj4gKyAgICAgICBpbnQgY29uc3QgYXV4X2NtZF9u
YXRpdmVfbWF4ID0gMTY7DQo+PiArICAgICAgIGludCBjb25zdCBhdXhfY21kX2kyY19tYXggPSAx
Mjg7DQo+PiArICAgICAgIHN0cnVjdCBkcF9hdXhfcHJpdmF0ZSAqYXV4Ow0KPj4gKw0KPj4gKyAg
ICAgICBhdXggPSBjb250YWluZXJfb2YoZHBfYXV4LCBzdHJ1Y3QgZHBfYXV4X3ByaXZhdGUsIGRw
X2F1eCk7DQo+PiArDQo+PiArICAgICAgIGF1eC0+bmF0aXZlID0gbXNnLT5yZXF1ZXN0ICYgKERQ
X0FVWF9OQVRJVkVfV1JJVEUgJg0KPj4gKyBEUF9BVVhfTkFUSVZFX1JFQUQpOw0KPj4gKw0KPj4g
KyAgICAgICAvKiBJZ25vcmUgYWRkcmVzcyBvbmx5IG1lc3NhZ2UgKi8NCj4+ICsgICAgICAgaWYg
KG1zZy0+c2l6ZSA9PSAwIHx8ICFtc2ctPmJ1ZmZlcikgew0KPj4gKyAgICAgICAgICAgICAgIG1z
Zy0+cmVwbHkgPSBhdXgtPm5hdGl2ZSA/DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBEUF9B
VVhfTkFUSVZFX1JFUExZX0FDSyA6IERQX0FVWF9JMkNfUkVQTFlfQUNLOw0KPj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBtc2ctPnNpemU7DQo+PiArICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAg
LyogbXNnIHNhbml0eSBjaGVjayAqLw0KPj4gKyAgICAgICBpZiAoKGF1eC0+bmF0aXZlICYmIG1z
Zy0+c2l6ZSA+IGF1eF9jbWRfbmF0aXZlX21heCkgfHwNCj4+ICsgICAgICAgICAgIG1zZy0+c2l6
ZSA+IGF1eF9jbWRfaTJjX21heCkgew0KPj4gKyAgICAgICAgICAgICAgIERSTV9FUlJPUigiJXM6
IGludmFsaWQgbXNnOiBzaXplKCV6dSksIHJlcXVlc3QoJXgpXG4iLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgX19mdW5jX18sIG1zZy0+c2l6ZSwgbXNnLT5yZXF1ZXN0KTsNCj4+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAg
ICBtdXRleF9sb2NrKCZhdXgtPm11dGV4KTsNCj4+ICsgICAgICAgaWYgKCFhdXgtPmluaXR0ZWQp
IHsNCj4+ICsgICAgICAgICAgICAgICByZXQgPSAtRUlPOw0KPj4gKyAgICAgICAgICAgICAgIGdv
dG8gZXhpdDsNCj4+ICsgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAvKg0KPj4gKyAgICAgICAg
KiBGb3IgZURQIGl0J3MgaW1wb3J0YW50IHRvIGdpdmUgYSByZWFzb25hYmx5IGxvbmcgd2FpdCBo
ZXJlIGZvciBIUEQNCj4+ICsgICAgICAgICogdG8gYmUgYXNzZXJ0ZWQuIFRoaXMgaXMgYmVjYXVz
ZSB0aGUgcGFuZWwgZHJpdmVyIG1heSBoYXZlIF9qdXN0Xw0KPj4gKyAgICAgICAgKiB0dXJuZWQg
b24gdGhlIHBhbmVsIGFuZCB0aGVuIHRyaWVkIHRvIGRvIGFuIEFVWCB0cmFuc2Zlci4gVGhlIHBh
bmVsDQo+PiArICAgICAgICAqIGRyaXZlciBoYXMgbm8gd2F5IG9mIGtub3dpbmcgd2hlbiB0aGUg
cGFuZWwgaXMgcmVhZHksIHNvIGl0J3MgdXANCj4+ICsgICAgICAgICogdG8gdXMgdG8gd2FpdC4g
Rm9yIERQIHdlIG5ldmVyIGdldCBpbnRvIHRoaXMgc2l0dWF0aW9uIHNvIGxldCdzDQo+PiArICAg
ICAgICAqIGF2b2lkIGV2ZXIgZG9pbmcgdGhlIGV4dHJhIGxvbmcgd2FpdCBmb3IgRFAuDQo+PiAr
ICAgICAgICAqLw0KPj4gKyAgICAgICBpZiAoYXV4LT5pc19lZHApIHsNCj4+ICsgICAgICAgICAg
ICAgICByZXQgPSBkcF9jYXRhbG9nX2F1eF93YWl0X2Zvcl9ocGRfY29ubmVjdF9zdGF0ZShhdXgt
PmNhdGFsb2cpOw0KPj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIERSTV9ERUJVR19EUCgiUGFuZWwgbm90IHJlYWR5IGZvciBhdXggdHJhbnNh
Y3Rpb25zXG4iKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXhpdDsNCj4+ICsg
ICAgICAgICAgICAgICB9DQo+PiArICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgZHBfYXV4X3Vw
ZGF0ZV9vZmZzZXRfYW5kX3NlZ21lbnQoYXV4LCBtc2cpOw0KPj4gKyAgICAgICBkcF9hdXhfdHJh
bnNmZXJfaGVscGVyKGF1eCwgbXNnLCB0cnVlLCB0cnVlKTsNCj4+ICsNCj4+ICsgICAgICAgYXV4
LT5yZWFkID0gbXNnLT5yZXF1ZXN0ICYgKERQX0FVWF9JMkNfUkVBRCAmDQo+RFBfQVVYX05BVElW
RV9SRUFEKTsNCj4+ICsgICAgICAgYXV4LT5jbWRfYnVzeSA9IHRydWU7DQo+PiArDQo+PiArICAg
ICAgIGlmIChhdXgtPnJlYWQpIHsNCj4+ICsgICAgICAgICAgICAgICBhdXgtPm5vX3NlbmRfYWRk
ciA9IHRydWU7DQo+PiArICAgICAgICAgICAgICAgYXV4LT5ub19zZW5kX3N0b3AgPSBmYWxzZTsN
Cj4+ICsgICAgICAgfSBlbHNlIHsNCj4+ICsgICAgICAgICAgICAgICBhdXgtPm5vX3NlbmRfYWRk
ciA9IHRydWU7DQo+PiArICAgICAgICAgICAgICAgYXV4LT5ub19zZW5kX3N0b3AgPSB0cnVlOw0K
Pj4gKyAgICAgICB9DQo+PiArDQo+PiArICAgICAgIHJldCA9IGRwX2F1eF9jbWRfZmlmb190eChh
dXgsIG1zZywgdHJ1ZSk7DQo+PiArDQo+PiArICAgICAgIC8qIFRPRE86IHdoeSBpcyBmaWZvX3J4
IG5lY2Vzc2FyeSBoZXJlPw0KPj4gKyAgICAgICAgKiBJZGVhbGx5IGZpZm9fcnggbmVlZCBub3Qg
YmUgZXhlY3V0ZWQgZm9yIGFuIGF1eCB3cml0ZQ0KPj4gKyAgICAgICAgKi8NCj4+ICsgICAgICAg
cmV0ID0gZHBfYXV4X2NtZF9maWZvX3J4KGF1eCwgbXNnKTsNCj4+ICsNCj4+ICsgICAgICAgaWYg
KHJldCA8IDApIHsNCj4+ICsgICAgICAgICAgICAgICBpZiAoYXV4LT5uYXRpdmUpIHsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGF1eC0+cmV0cnlfY250Kys7DQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoIShhdXgtPnJldHJ5X2NudCAlIE1BWF9BVVhfUkVUUklFUykpDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRwX2NhdGFsb2dfYXV4X3VwZGF0ZV9jZmco
YXV4LT5jYXRhbG9nKTsNCj4+ICsgICAgICAgICAgICAgICB9DQo+PiArICAgICAgICAgICAgICAg
LyogcmVzZXQgYXV4IGlmIGxpbmsgaXMgaW4gY29ubmVjdGVkIHN0YXRlICovDQo+PiArICAgICAg
ICAgICAgICAgaWYgKGRwX2NhdGFsb2dfbGlua19pc19jb25uZWN0ZWQoYXV4LT5jYXRhbG9nKSkN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRwX2NhdGFsb2dfYXV4X3Jlc2V0KGF1eC0+Y2F0
YWxvZyk7DQo+PiArICAgICAgIH0gZWxzZSB7DQo+PiArICAgICAgICAgICAgICAgYXV4LT5yZXRy
eV9jbnQgPSAwOw0KPj4gKyAgICAgICAgICAgICAgIHN3aXRjaCAoYXV4LT5hdXhfZXJyb3JfbnVt
KSB7DQo+PiArICAgICAgICAgICAgICAgY2FzZSBEUF9BVVhfRVJSX05PTkU6DQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoYXV4LT5yZWFkKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSBkcF9hdXhfY21kX2ZpZm9fcngoYXV4LCBtc2cpOw0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgbXNnLT5yZXBseSA9IGF1eC0+bmF0aXZlID8gRFBfQVVYX05BVElW
RV9SRVBMWV9BQ0sgOg0KPkRQX0FVWF9JMkNfUkVQTFlfQUNLOw0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgYnJlYWs7DQo+PiArICAgICAgICAgICAgICAgY2FzZSBEUF9BVVhfRVJSX0RFRkVS
Og0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXNnLT5yZXBseSA9IGF1eC0+bmF0aXZlID8N
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFBfQVVYX05BVElWRV9SRVBMWV9E
RUZFUiA6DQo+RFBfQVVYX0kyQ19SRVBMWV9ERUZFUjsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOw0KPj4gKyAgICAgICAgICAgICAgIGNhc2UgRFBfQVVYX0VSUl9QSFk6DQo+PiAr
ICAgICAgICAgICAgICAgY2FzZSBEUF9BVVhfRVJSX0FERFI6DQo+PiArICAgICAgICAgICAgICAg
Y2FzZSBEUF9BVVhfRVJSX05BQ0s6DQo+PiArICAgICAgICAgICAgICAgY2FzZSBEUF9BVVhfRVJS
X05BQ0tfREVGRVI6DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBtc2ctPnJlcGx5ID0gYXV4
LT5uYXRpdmUgPyBEUF9BVVhfTkFUSVZFX1JFUExZX05BQ0sgOg0KPkRQX0FVWF9JMkNfUkVQTFlf
TkFDSzsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgICAg
ICAgIGNhc2UgRFBfQVVYX0VSUl9UT1VUOg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0gLUVUSU1FRE9VVDsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAg
ICAgICAgICAgICAgIH0NCj4+ICsgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICBhdXgtPmNtZF9i
dXN5ID0gZmFsc2U7DQo+PiArDQo+PiArZXhpdDoNCj4+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZh
dXgtPm11dGV4KTsNCj4+ICsNCj4+ICsgICAgICAgcmV0dXJuIHJldDsNCj4+ICt9DQo+PiArDQo+
PiAgLyoNCj4+ICAgKiBUaGlzIGZ1bmN0aW9uIGRvZXMgdGhlIHJlYWwgam9iIHRvIHByb2Nlc3Mg
YW4gQVVYIHRyYW5zYWN0aW9uLg0KPj4gICAqIEl0IHdpbGwgY2FsbCBhdXhfcmVzZXQoKSBmdW5j
dGlvbiB0byByZXNldCB0aGUgQVVYIGNoYW5uZWwsIEBADQo+PiAtMzU1LDcgKzQ3Nyw3IEBAIHN0
YXRpYyBzc2l6ZV90IGRwX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eA0KPipkcF9hdXgs
DQo+PiAgICAgICAgIH0NCj4+DQo+PiAgICAgICAgIGRwX2F1eF91cGRhdGVfb2Zmc2V0X2FuZF9z
ZWdtZW50KGF1eCwgbXNnKTsNCj4+IC0gICAgICAgZHBfYXV4X3RyYW5zZmVyX2hlbHBlcihhdXgs
IG1zZywgdHJ1ZSk7DQo+PiArICAgICAgIGRwX2F1eF90cmFuc2Zlcl9oZWxwZXIoYXV4LCBtc2cs
IHRydWUsIGZhbHNlKTsNCj4+DQo+PiAgICAgICAgIGF1eC0+cmVhZCA9IG1zZy0+cmVxdWVzdCAm
IChEUF9BVVhfSTJDX1JFQUQgJg0KPkRQX0FVWF9OQVRJVkVfUkVBRCk7DQo+PiAgICAgICAgIGF1
eC0+Y21kX2J1c3kgPSB0cnVlOw0KPj4gQEAgLTM2OCw3ICs0OTAsNyBAQCBzdGF0aWMgc3NpemVf
dCBkcF9hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXgNCj4qZHBfYXV4LA0KPj4gICAgICAg
ICAgICAgICAgIGF1eC0+bm9fc2VuZF9zdG9wID0gdHJ1ZTsNCj4+ICAgICAgICAgfQ0KPj4NCj4+
IC0gICAgICAgcmV0ID0gZHBfYXV4X2NtZF9maWZvX3R4KGF1eCwgbXNnKTsNCj4+ICsgICAgICAg
cmV0ID0gZHBfYXV4X2NtZF9maWZvX3R4KGF1eCwgbXNnLCBmYWxzZSk7DQo+PiAgICAgICAgIGlm
IChyZXQgPCAwKSB7DQo+PiAgICAgICAgICAgICAgICAgaWYgKGF1eC0+bmF0aXZlKSB7DQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICBhdXgtPnJldHJ5X2NudCsrOyBAQCAtNTM1LDYgKzY1Nywx
NSBAQCBzdHJ1Y3QNCj4+IGRybV9kcF9hdXggKmRwX2F1eF9nZXQoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgZHBfY2F0YWxvZyAqY2F0YWxvZywNCj4+ICAgICAgICAgYXV4LT5jYXRhbG9nID0g
Y2F0YWxvZzsNCj4+ICAgICAgICAgYXV4LT5yZXRyeV9jbnQgPSAwOw0KPj4NCj4+ICsgICAgICAg
LyoNCj4+ICsgICAgICAgICogVXNlIHRoZSBkcm1fZHBfYXV4X2luaXQoKSB0byB1c2UgdGhlIGF1
eCBhZGFwdGVyDQo+PiArICAgICAgICAqIGJlZm9yZSByZWdpc3RlcmluZyBhdXggd2l0aCB0aGUg
RFJNIGRldmljZS4NCj4+ICsgICAgICAgICovDQo+PiArICAgICAgIGF1eC0+ZHBfYXV4Lm5hbWUg
PSAiZHB1X2RwX2F1eCI7DQo+PiArICAgICAgIGF1eC0+ZHBfYXV4LmRldiA9IGRldjsNCj4+ICsg
ICAgICAgYXV4LT5kcF9hdXgudHJhbnNmZXIgPSBkcF9hdXhfdHJhbnNmZXJfaW5pdDsNCj4+ICsg
ICAgICAgZHJtX2RwX2F1eF9pbml0KCZhdXgtPmRwX2F1eCk7DQo+DQo+SG93IGRvIHlvdSB1c2Ug
dGhlIGF1eCBhZGFwdGVyPyBJdCBzaG91bGQgbm90IGJlIHVzZWQgYmVmb3JlDQo+YXV4LT5kcm1f
ZGV2IGlzIHNldHVwLg0KPg0KDQpUaGUgZHJtX2RldiByZWdpc3RyYXRpb24gaGFwcGVucyBkdXJp
bmcgdGhlIGJpbmQuIEJ1dCB3ZSBuZWVkIHRvIHVzZSBhdXggZHVyaW5nIHByb2JlLg0KDQpUaGUg
a2VybmVsIGRvYyBmb3IgdGhlIGRybV9kcF9hdXhfaW5pdCBmdW5jdGlvbiBzdWdnZXN0ZWQgd2Ug
Y2FuIHVzZSB0aGUgYWRhcHRlciBiZWZvcmUNCmRybV9kZXYgcmVnaXN0cmF0aW9uLiBTbywgSSB1
c2VkIHRoaXMgZnVuY3Rpb24gdG8gZW5hYmxlIHRoZSBhdXggdXNhZ2UgZHVyaW5nIHByb2JlLg0K
DQovKioNCiAqIGRybV9kcF9hdXhfaW5pdCgpIC0gbWluaW1hbGx5IGluaXRpYWxpc2UgYW4gYXV4
IGNoYW5uZWwNCiAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsDQogKg0KICogSWYgeW91
IG5lZWQgdG8gdXNlIHRoZSBkcm1fZHBfYXV4J3MgaTJjIGFkYXB0ZXIgcHJpb3IgdG8gcmVnaXN0
ZXJpbmcgaXQgd2l0aA0KICogdGhlIG91dHNpZGUgd29ybGQsIGNhbGwgZHJtX2RwX2F1eF9pbml0
KCkgZmlyc3QuDQoNCj4+ICsNCj4+ICAgICAgICAgcmV0dXJuICZhdXgtPmRwX2F1eDsNCj4+ICB9
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY2F0YWxvZy5j
DQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY2F0YWxvZy5jDQo+PiBpbmRleCA2NzYy
NzlkMGNhOGQuLmNjZjA0MDAxNzZmMCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfY2F0YWxvZy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Nh
dGFsb2cuYw0KPj4gQEAgLTI1OCw2ICsyNTgsMTggQEAgaW50DQo+ZHBfY2F0YWxvZ19hdXhfd2Fp
dF9mb3JfaHBkX2Nvbm5lY3Rfc3RhdGUoc3RydWN0IGRwX2NhdGFsb2cNCj4qZHBfY2F0YWxvZykN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjAwMCwgNTAwMDAwKTsgIH0NCj4+
DQo+PiAraW50IGRwX2NhdGFsb2dfYXV4X3BvbGxfYW5kX2dldF9od19pbnRlcnJ1cHQoc3RydWN0
IGRwX2NhdGFsb2cNCj4+ICsqZHBfY2F0YWxvZykgew0KPj4gKyAgICAgICB1MzIgYXV4Ow0KPj4g
KyAgICAgICBzdHJ1Y3QgZHBfY2F0YWxvZ19wcml2YXRlICpjYXRhbG9nID0gY29udGFpbmVyX29m
KGRwX2NhdGFsb2csDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBk
cF9jYXRhbG9nX3ByaXZhdGUsDQo+PiArZHBfY2F0YWxvZyk7DQo+PiArDQo+PiArICAgICAgIHJl
dHVybiByZWFkbF9wb2xsX3RpbWVvdXQoY2F0YWxvZy0+aW8tPmRwX2NvbnRyb2xsZXIuYWhiLmJh
c2UgKw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSRUdfRFBfSU5UUl9TVEFU
VVMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGF1eCwgYXV4ICYgRFBfSU5U
RVJSVVBUX1NUQVRVUzEsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDI1MCwg
MjUwMDAwKTsgfQ0KPj4gKw0KPj4gIHN0YXRpYyB2b2lkIGR1bXBfcmVncyh2b2lkIF9faW9tZW0g
KmJhc2UsIGludCBsZW4pICB7DQo+PiAgICAgICAgIGludCBpOw0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY2F0YWxvZy5oDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfY2F0YWxvZy5oDQo+PiBpbmRleCAxZjcxN2Y0NWMxMTUuLmFkNGE5ZTBmNzFmMiAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY2F0YWxvZy5oDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuaA0KPj4gQEAgLTg3LDYgKzg3
LDcgQEAgdm9pZCBkcF9jYXRhbG9nX2F1eF9lbmFibGUoc3RydWN0IGRwX2NhdGFsb2cNCj4+ICpk
cF9jYXRhbG9nLCBib29sIGVuYWJsZSk7ICB2b2lkIGRwX2NhdGFsb2dfYXV4X3VwZGF0ZV9jZmco
c3RydWN0DQo+PiBkcF9jYXRhbG9nICpkcF9jYXRhbG9nKTsgIGludA0KPj4gZHBfY2F0YWxvZ19h
dXhfd2FpdF9mb3JfaHBkX2Nvbm5lY3Rfc3RhdGUoc3RydWN0IGRwX2NhdGFsb2cNCj4+ICpkcF9j
YXRhbG9nKTsNCj4+ICB1MzIgZHBfY2F0YWxvZ19hdXhfZ2V0X2lycShzdHJ1Y3QgZHBfY2F0YWxv
ZyAqZHBfY2F0YWxvZyk7DQo+PiAraW50IGRwX2NhdGFsb2dfYXV4X3BvbGxfYW5kX2dldF9od19p
bnRlcnJ1cHQoc3RydWN0IGRwX2NhdGFsb2cNCj4+ICsqZHBfY2F0YWxvZyk7DQo+Pg0KPj4gIC8q
IERQIENvbnRyb2xsZXIgQVBJcyAqLw0KPj4gIHZvaWQgZHBfY2F0YWxvZ19jdHJsX3N0YXRlX2N0
cmwoc3RydWN0IGRwX2NhdGFsb2cgKmRwX2NhdGFsb2csIHUzMg0KPj4gc3RhdGUpOyBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMNCj4+IGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMNCj4+IGluZGV4IGJkZTFhN2NlNDQyZi4uYTVkY2Vm
MDQwYjc0IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jDQo+PiBAQCAt
Mjc1LDEzICsyNzUsNiBAQCBzdGF0aWMgaW50IGRwX2Rpc3BsYXlfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdA0KPmRldmljZSAqbWFzdGVyLA0KPj4gICAgICAgICBkcC0+ZHBfZGlzcGxh
eS5kcm1fZGV2ID0gZHJtOw0KPj4gICAgICAgICBwcml2LT5kcFtkcC0+aWRdID0gJmRwLT5kcF9k
aXNwbGF5Ow0KPj4NCj4+IC0gICAgICAgcmMgPSBkcC0+cGFyc2VyLT5wYXJzZShkcC0+cGFyc2Vy
KTsNCj4+IC0gICAgICAgaWYgKHJjKSB7DQo+PiAtICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJk
ZXZpY2UgdHJlZSBwYXJzaW5nIGZhaWxlZFxuIik7DQo+PiAtICAgICAgICAgICAgICAgZ290byBl
bmQ7DQo+PiAtICAgICAgIH0NCj4+IC0NCj4+IC0NCj4+ICAgICAgICAgZHAtPmRybV9kZXYgPSBk
cm07DQo+PiAgICAgICAgIGRwLT5hdXgtPmRybV9kZXYgPSBkcm07DQo+PiAgICAgICAgIHJjID0g
ZHBfYXV4X3JlZ2lzdGVyKGRwLT5hdXgpOyBAQCAtMjkwLDEyICsyODMsNiBAQCBzdGF0aWMgaW50
DQo+PiBkcF9kaXNwbGF5X2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpt
YXN0ZXIsDQo+PiAgICAgICAgICAgICAgICAgZ290byBlbmQ7DQo+PiAgICAgICAgIH0NCj4+DQo+
PiAtICAgICAgIHJjID0gZHBfcG93ZXJfY2xpZW50X2luaXQoZHAtPnBvd2VyKTsNCj4+IC0gICAg
ICAgaWYgKHJjKSB7DQo+PiAtICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJQb3dlciBjbGllbnQg
Y3JlYXRlIGZhaWxlZFxuIik7DQo+PiAtICAgICAgICAgICAgICAgZ290byBlbmQ7DQo+PiAtICAg
ICAgIH0NCj4+IC0NCj4+ICAgICAgICAgcmMgPSBkcF9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoZGV2
LCBkcC0+YXVkaW8pOw0KPj4gICAgICAgICBpZiAocmMpIHsNCj4+ICAgICAgICAgICAgICAgICBE
Uk1fRVJST1IoIkF1ZGlvIHJlZ2lzdHJhdGlvbiBEcCBmYWlsZWRcbiIpOyBAQCAtNzg3LDYNCj4+
ICs3NzQsMTIgQEAgc3RhdGljIGludCBkcF9pbml0X3N1Yl9tb2R1bGVzKHN0cnVjdCBkcF9kaXNw
bGF5X3ByaXZhdGUgKmRwKQ0KPj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyb3I7DQo+PiAgICAg
ICAgIH0NCj4+DQo+PiArICAgICAgIHJjID0gZHAtPnBhcnNlci0+cGFyc2UoZHAtPnBhcnNlcik7
DQo+PiArICAgICAgIGlmIChyYykgew0KPj4gKyAgICAgICAgICAgICAgIERSTV9FUlJPUigiZGV2
aWNlIHRyZWUgcGFyc2luZyBmYWlsZWRcbiIpOw0KPj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJy
b3I7DQo+PiArICAgICAgIH0NCj4+ICsNCj4+ICAgICAgICAgZHAtPmNhdGFsb2cgPSBkcF9jYXRh
bG9nX2dldChkZXYsICZkcC0+cGFyc2VyLT5pbyk7DQo+PiAgICAgICAgIGlmIChJU19FUlIoZHAt
PmNhdGFsb2cpKSB7DQo+PiAgICAgICAgICAgICAgICAgcmMgPSBQVFJfRVJSKGRwLT5jYXRhbG9n
KTsgQEAgLTgwMyw2ICs3OTYsMTIgQEAgc3RhdGljDQo+PiBpbnQgZHBfaW5pdF9zdWJfbW9kdWxl
cyhzdHJ1Y3QgZHBfZGlzcGxheV9wcml2YXRlICpkcCkNCj4+ICAgICAgICAgICAgICAgICBnb3Rv
IGVycm9yOw0KPj4gICAgICAgICB9DQo+Pg0KPj4gKyAgICAgICByYyA9IGRwX3Bvd2VyX2NsaWVu
dF9pbml0KGRwLT5wb3dlcik7DQo+PiArICAgICAgIGlmIChyYykgew0KPj4gKyAgICAgICAgICAg
ICAgIERSTV9FUlJPUigiUG93ZXIgY2xpZW50IGNyZWF0ZSBmYWlsZWRcbiIpOw0KPj4gKyAgICAg
ICAgICAgICAgIGdvdG8gZXJyb3I7DQo+PiArICAgICAgIH0NCj4+ICsNCj4+ICAgICAgICAgZHAt
PmF1eCA9IGRwX2F1eF9nZXQoZGV2LCBkcC0+Y2F0YWxvZywgZHAtPmRwX2Rpc3BsYXkuaXNfZWRw
KTsNCj4+ICAgICAgICAgaWYgKElTX0VSUihkcC0+YXV4KSkgew0KPj4gICAgICAgICAgICAgICAg
IHJjID0gUFRSX0VSUihkcC0+YXV4KTsgQEAgLTEzMzgsMTIgKzEzMzcsMjkgQEAgc3RhdGljDQo+
PiBpbnQgZHBfZGlzcGxheV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4N
Cj4+ICAgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgJmRwLT5kcF9kaXNwbGF5KTsN
Cj4+DQo+PiArICAgICAgIGlmIChkcC0+ZHBfZGlzcGxheS5pc19lZHApIHsNCj4+ICsgICAgICAg
ICAgICAgICBkcF9kaXNwbGF5X2hvc3RfaW5pdChkcCk7DQo+PiArICAgICAgICAgICAgICAgZHBf
ZGlzcGxheV9ob3N0X3BoeV9pbml0KGRwKTsNCj4+ICsgICAgICAgICAgICAgICBkcF9jYXRhbG9n
X2N0cmxfaHBkX2NvbmZpZyhkcC0+Y2F0YWxvZyk7DQo+PiArDQo+PiArICAgICAgICAgICAgICAg
cmMgPSBkZXZtX29mX2RwX2F1eF9wb3B1bGF0ZV9idXMoZHAtPmF1eCwgTlVMTCk7DQo+DQo+WW91
IHNob3VsZCBwYXNzIGEgcmVhbCBkb25lX3Byb2JpbmcgaGFuZGxlciBoZXJlLCBpZiB5b3UgYXJl
IGdvaW5nIHRvIHJlZmFjdG9yDQo+dGhpcyBwaWVjZSBvZiBjb2RlLiBUaGUgZG9uZV9wcm9iaW5n
IHNob3VsZCB0aGVuIHNodXQgZG93biB0aGUgcmVzb3VyY2VzDQo+YW5kIGJpbmQgdGhlIGNvbXBv
bmVudC4NCj4NCg0KSSByZW1vdmVkIHRoZSByZXNvdXJjZSBlbmFibGluZyBwYXJ0IGZyb20gcHJv
YmUgaW4gdGhlIG5leHQgcGF0Y2ggd2hlcmUgSSBpbXBsZW1lbnRlZCBwbV9ydW50aW1lX29wcy4N
CkkgbW92ZWQgdGhlIGhvc3RfaW5pdCwgcGh5X2luaXQgYW5kIGhwZF9jb25maWcgaW50byBydW50
aW1lX3Jlc3VtZSBhbmQgY2FsbGluZyBwbV9ydW50aW1lX2dldF9zeW5jIGZyb20gYXV4X3RyYW5z
ZmVyLg0KDQo+PiArDQo+PiArICAgICAgICAgICAgICAgZHBfZGlzcGxheV9ob3N0X3BoeV9leGl0
KGRwKTsNCj4+ICsgICAgICAgICAgICAgICBkcF9kaXNwbGF5X2hvc3RfZGVpbml0KGRwKTsNCj4+
ICsNCj4+ICsgICAgICAgICAgICAgICBpZiAocmMpIHsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIERSTV9FUlJPUigiZmFpbGVkIHRvIGluaXRpYWxpemUgcGFuZWwsIHJjID0gJWRcbiIsIHJj
KTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyb3I7DQo+PiArICAgICAgICAg
ICAgICAgfQ0KPj4gKyAgICAgICB9DQo+PiArDQo+PiAgICAgICAgIHJjID0gY29tcG9uZW50X2Fk
ZCgmcGRldi0+ZGV2LCAmZHBfZGlzcGxheV9jb21wX29wcyk7DQo+PiAgICAgICAgIGlmIChyYykg
ew0KPj4gICAgICAgICAgICAgICAgIERSTV9FUlJPUigiY29tcG9uZW50IGFkZCBmYWlsZWQsIHJj
PSVkXG4iLCByYyk7DQo+PiAgICAgICAgICAgICAgICAgZHBfZGlzcGxheV9kZWluaXRfc3ViX21v
ZHVsZXMoZHApOw0KPj4gICAgICAgICB9DQo+Pg0KPj4gK2Vycm9yOg0KPj4gICAgICAgICByZXR1
cm4gcmM7DQo+PiAgfQ0KPj4NCj4+IEBAIC0xNTQ2LDQwICsxNTYyLDggQEAgc3RhdGljIGludCBk
cF9kaXNwbGF5X2dldF9uZXh0X2JyaWRnZShzdHJ1Y3QNCj4+IG1zbV9kcCAqZHApICB7DQo+PiAg
ICAgICAgIGludCByYzsNCj4+ICAgICAgICAgc3RydWN0IGRwX2Rpc3BsYXlfcHJpdmF0ZSAqZHBf
cHJpdjsNCj4+IC0gICAgICAgc3RydWN0IGRldmljZV9ub2RlICphdXhfYnVzOw0KPj4gLSAgICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+Pg0KPj4gICAgICAgICBkcF9wcml2ID0gY29udGFpbmVy
X29mKGRwLCBzdHJ1Y3QgZHBfZGlzcGxheV9wcml2YXRlLCBkcF9kaXNwbGF5KTsNCj4+IC0gICAg
ICAgZGV2ID0gJmRwX3ByaXYtPnBkZXYtPmRldjsNCj4+IC0gICAgICAgYXV4X2J1cyA9IG9mX2dl
dF9jaGlsZF9ieV9uYW1lKGRldi0+b2Zfbm9kZSwgImF1eC1idXMiKTsNCj4+IC0NCj4+IC0gICAg
ICAgaWYgKGF1eF9idXMgJiYgZHAtPmlzX2VkcCkgew0KPj4gLSAgICAgICAgICAgICAgIGRwX2Rp
c3BsYXlfaG9zdF9pbml0KGRwX3ByaXYpOw0KPj4gLSAgICAgICAgICAgICAgIGRwX2NhdGFsb2df
Y3RybF9ocGRfY29uZmlnKGRwX3ByaXYtPmNhdGFsb2cpOw0KPj4gLSAgICAgICAgICAgICAgIGRw
X2Rpc3BsYXlfaG9zdF9waHlfaW5pdChkcF9wcml2KTsNCj4+IC0gICAgICAgICAgICAgICBlbmFi
bGVfaXJxKGRwX3ByaXYtPmlycSk7DQo+PiAtDQo+PiAtICAgICAgICAgICAgICAgLyoNCj4+IC0g
ICAgICAgICAgICAgICAgKiBUaGUgY29kZSBiZWxvdyBhc3N1bWVzIHRoYXQgdGhlIHBhbmVsIHdp
bGwgZmluaXNoIHByb2JpbmcNCj4+IC0gICAgICAgICAgICAgICAgKiBieSB0aGUgdGltZSBkZXZt
X29mX2RwX2F1eF9wb3B1bGF0ZV9lcF9kZXZpY2VzKCkgcmV0dXJucy4NCj4+IC0gICAgICAgICAg
ICAgICAgKiBUaGlzIGlzbid0IGEgZ3JlYXQgYXNzdW1wdGlvbiBzaW5jZSBpdCB3aWxsIGZhaWwg
aWYgdGhlDQo+PiAtICAgICAgICAgICAgICAgICogcGFuZWwgZHJpdmVyIGlzIHByb2JlZCBhc3lu
Y2hyb25vdXNseSBidXQgaXMgdGhlIGJlc3Qgd2UNCj4+IC0gICAgICAgICAgICAgICAgKiBjYW4g
ZG8gd2l0aG91dCBhIGJpZ2dlciBkcml2ZXIgcmVvcmdhbml6YXRpb24uDQo+PiAtICAgICAgICAg
ICAgICAgICovDQo+PiAtICAgICAgICAgICAgICAgcmMgPSBvZl9kcF9hdXhfcG9wdWxhdGVfYnVz
KGRwX3ByaXYtPmF1eCwgTlVMTCk7DQo+PiAtICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoYXV4
X2J1cyk7DQo+PiAtICAgICAgICAgICAgICAgaWYgKHJjKQ0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBlcnJvcjsNCj4+IC0NCj4+IC0gICAgICAgICAgICAgICByYyA9IGRldm1fYWRk
X2FjdGlvbl9vcl9yZXNldChkcC0+ZHJtX2Rldi0+ZGV2LA0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2ZfZHBfYXV4X2RlcG9wdWxhdGVfYnVzX3Zv
aWQsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
cF9wcml2LT5hdXgpOw0KPj4gLSAgICAgICAgICAgICAgIGlmIChyYykNCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gZXJyb3I7DQo+PiAtICAgICAgIH0gZWxzZSBpZiAoZHAtPmlzX2Vk
cCkgew0KPj4gLSAgICAgICAgICAgICAgIERSTV9FUlJPUigiZURQIGF1eF9idXMgbm90IGZvdW5k
XG4iKTsNCj4+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+IC0gICAgICAgfQ0K
Pj4NCj4+ICAgICAgICAgLyoNCj4+ICAgICAgICAgICogRXh0ZXJuYWwgYnJpZGdlcyBhcmUgbWFu
ZGF0b3J5IGZvciBlRFAgaW50ZXJmYWNlczogb25lIGhhcw0KPj4gdG8gQEAgLTE1OTcsMTIgKzE1
ODEsNiBAQCBzdGF0aWMgaW50IGRwX2Rpc3BsYXlfZ2V0X25leHRfYnJpZGdlKHN0cnVjdA0KPm1z
bV9kcCAqZHApDQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+PiAgICAgICAgIH0NCj4+
DQo+PiAtZXJyb3I6DQo+PiAtICAgICAgIGlmIChkcC0+aXNfZWRwKSB7DQo+PiAtICAgICAgICAg
ICAgICAgZGlzYWJsZV9pcnEoZHBfcHJpdi0+aXJxKTsNCj4+IC0gICAgICAgICAgICAgICBkcF9k
aXNwbGF5X2hvc3RfcGh5X2V4aXQoZHBfcHJpdik7DQo+PiAtICAgICAgICAgICAgICAgZHBfZGlz
cGxheV9ob3N0X2RlaW5pdChkcF9wcml2KTsNCj4+IC0gICAgICAgfQ0KPj4gICAgICAgICByZXR1
cm4gcmM7DQo+PiAgfQ0KPj4NCj4+IC0tDQo+PiAyLjM5LjANCj4+DQo+DQo+DQo+LS0NCj5XaXRo
IGJlc3Qgd2lzaGVzDQo+RG1pdHJ5DQo=
