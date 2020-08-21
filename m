Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7CE24D0F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 10:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgHUI4c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 04:56:32 -0400
Received: from mail-am6eur05on2061.outbound.protection.outlook.com ([40.107.22.61]:9153
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726062AbgHUI4b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 04:56:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp2RoALP2M0FfVcVCMFUUmF16vjRmhYu2qdA0p+o40laHlzjnz4vk//9oID77Y6OE/B4kAdLJxLEYeUR0KVEd+dEJmjLVw5tot6qKjqBOJu0z7DFk4Qu/8VSz87UlkNxRxCBnRrfnfrHcHvCeerqMjaYPdfiXTS//fDTRVGQHZqSs8essZFpj9Q8dH20sBbt81DHhfw1/w3/vAqshQgOXv/etkEsbvbOo/l+X3FuGZiWB7fpwsSm2+lZQH0/pAQCL4xgC9MQIfHjK28Cp6PWM8v1dkKzRlJQ3LAWsRVMBzEHfYvdcn4BIosDjwJeie0kWiFcbdt2dQiQ4VU1G0SOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoZVJmHaxcxM/yquir8Gv7IZl44GedOW6ttldyJbhAs=;
 b=HSQMxq9QGHE/yms+i03r+wy0JaRNSYOTYBdPEhpne5zd5S4AtZMUKb9XLZteD5UoleZec87Ez6VrCu2d+qQ3lzDMrKztm/QUPT+5n3uaGNn7CJNoWXFICurtJgmBkzWxAp3nJ/rbTN1eVoUNXxfySXOvtk2SJz7yN9WFVVOCaxZYyeiJOrRbAwemasz/UGy6fy7nQgSLDQsNLrsSS/H0RlBjjVysjpxIT6U+ZbSqoUASvRff94e08uz502inWMDhFMjtDEEsYUMV2zO233vB0JAJH5/pJvEr5uY9jc+r3TbdVAjdjzeKqyb6W7y1GjpafS+jxeW5UEXu8/WWXJ97vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoZVJmHaxcxM/yquir8Gv7IZl44GedOW6ttldyJbhAs=;
 b=eChKAwyFU41ym2+ESBp1m9Mk/eQkK+m9YlRJryge0r8e/h4rEDOg5KUSAqk1Xq4UjNor+6L58LpDCRR/dfoHnIx9G1H1iw0pt62E1MWctyHSo1C2SJoSFUgNo30ltqeVePsalPbN1soSy285YlT7Vv2EmnlgJdgfCvk5d0OmxmY=
Received: from AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::13)
 by AM6PR10MB3381.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:d5::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 08:56:27 +0000
Received: from AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b96f:25df:bfa7:a0f7]) by AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b96f:25df:bfa7:a0f7%8]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 08:56:27 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Icenowy Zheng <icenowy@aosc.io>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 02/15] regulator: da9210: Fix W=1 build warning when
 CONFIG_OF=n
Thread-Topic: [PATCH v2 02/15] regulator: da9210: Fix W=1 build warning when
 CONFIG_OF=n
Thread-Index: AQHWd2pG4n0wk+djqUyS0DawTc8ueKlCQphA
Date:   Fri, 21 Aug 2020 08:56:26 +0000
Message-ID: <AM7PR10MB36406A5BE84EF21CDC2783D8805B0@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
References: <20200821111135.0b958d3a@xhacker.debian>
 <20200821111235.14473a88@xhacker.debian>
In-Reply-To: <20200821111235.14473a88@xhacker.debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: synaptics.com; dkim=none (message not signed)
 header.d=none;synaptics.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e54fe59-3dad-47e0-270a-08d845b016bd
x-ms-traffictypediagnostic: AM6PR10MB3381:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB33814F9639001DE99A418300A75B0@AM6PR10MB3381.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:489;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJdkVY8PRTbF1o8wKQEc/JjpoywXDTqv3ELftDxpuh07GaefbDCCZJHnCK8DJhpDzRzpfudRkB8yiqB1O2HPAcd3gxMuAcsLujUac7lU2ZGhDCUeGJZLE87x04E7H508kRhHsr4kzRtmz0njXXALh+rmBHntFaBrQ+PmWFbZlPEoLAM3jl6qdZ71FAC0lHCM2j68+9bFF9KOafJpNjF/2GNpjOqp+u4aVd6rBFmIqhVYYJXHR1azp9XSP46xjEPOGeynued4MY/EPNjlUmTX9rRDJDfZdyWO0Hg9tGGaYtuOWVPA1T2Lh0b3qiUjtvEtdtatdf2uGCp4Qn/k6iSnRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(76116006)(71200400001)(7696005)(26005)(86362001)(33656002)(66946007)(66446008)(5660300002)(64756008)(478600001)(66556008)(316002)(186003)(52536014)(4326008)(2906002)(8676002)(9686003)(55016002)(66476007)(7416002)(83380400001)(6506007)(53546011)(4744005)(8936002)(54906003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: o5vj6sVODyBv2Dv+V+bQEMw4jbs1JnbUoKIrqCujt+xo8IEfV0tiPp2WmXMzqF5q/Gy/Pd3WK0UWvYskwLPW+3igH+2Dc5MwlfMTVV92RynyvSWwET0Puxw0KmHIN/Rkmd5IZdilVE4CuSwaOZ9N1aEzLmOw0jlkeuS+sUWRE6E7hwid6Q0K3tB/5CRm2s/wITmdWmBvhVhIszqq4XZHXMxH9GzCKscquvkcixZ+pk3b6+iJXIQuOTJuYW215Qr0HKH3nd81H7gfak5jKJFnmlVaPIyOYCPw/c2hivw350zP02GuQ1z5irzkPSaOXv6EMX4KJuTM8tvcGN9SVpI5bV3A9iTjqhniGgwALKq6MBYvYTyVkpP/wErsqlUjILqfU8NUOZ9hMB9i+hgo6TtWo1V94fjNYHj7/GowRl0przDNn48a4VnRPwBhZm8quf+1gSwpjRFTnMu5lYUeEvvUf5g4Moln1Er605tbBmyWbzxgzk/ySc/0gyNlzK63f+QzrybQUo2VxmkA+ew9dTivePmL3eYpL7Qqu2ELrY6kUVJyMuUplDTq5x3F8IKPeFfzR9Q1fir/GVdfgxaWow7tXFk3LIcBQwnBB9OvMLyPEcFI3Yp8e3uEuSmrSlEbObeWu2CF9FFniqH26yyAiDFn3A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e54fe59-3dad-47e0-270a-08d845b016bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 08:56:27.0064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 21suTestwR4ANcJ4s/I/dyJoV7mXGKVtXk/5BE42kd6/Vq+ZmH7/IEfRn2uPWYRrdMJJN5/oITHmNAG4Wpkg4DS8JIZeyDx9nWuf5wldYlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3381
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gMjEgQXVndXN0IDIwMjAgMDQ6MTMsIEppc2hlbmcgWmhhbmcgd3JvdGU6DQoNCj4gRml4IGJl
bG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoNCj4gDQo+IGRyaXZlcnMvcmVndWxhdG9yL2Rh
OTIxMC1yZWd1bGF0b3IuYzoxMjg6MzQ6IHdhcm5pbmc6IOKAmGRhOTIxMF9kdF9pZHPigJkgZGVm
aW5lZA0KPiBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0NCj4gICAxMjgg
fCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkYTkyMTBfZHRfaWRzW10gPSB7DQo+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRp
Y3MuY29tPg0KDQpBY2tlZC1ieTogQWRhbSBUaG9tc29uIDxBZGFtLlRob21zb24uT3BlbnNvdXJj
ZUBkaWFzZW1pLmNvbT4NCg0KDQo=
