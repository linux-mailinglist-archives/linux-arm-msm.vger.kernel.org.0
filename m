Return-Path: <linux-arm-msm+bounces-4327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE780E31B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 04:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 419041F21FEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 03:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE78C122;
	Tue, 12 Dec 2023 03:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nw5/KJFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D745AAC;
	Mon, 11 Dec 2023 19:58:48 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC2epNa004271;
	Tue, 12 Dec 2023 03:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	qcppdkim1; bh=aXR8+KjQeTvZYxECadlvgP/PnixNypRyqUSXrwO4R6w=; b=Nw
	5/KJFOeKRHzk07Q7r5NX1yZyvr18G87V8OMhVV+8X2wt3xwNUdqZEB5PPdRssnPr
	G0Mr9LMm7jtgc7wGL9xX4YLeLicAkssfLRHlMxhlP3PKgTdxHE/qheG8R1lqJKtu
	wz+m48CEy8eqZninCeY8QZX0uRYrvd3bbFZpWGRj0bEU1IG5LEFlRdCzHQaEzE93
	a2L0JXVZM1NjDMSR6U1+3/93wp8g1Yeawt7pFGCC4b/jCnMYJTwIVV4RvQxIicnS
	qC3ckn26zYG03f/MudmqYewjg/v/s8/qQ9ZXwyj/Gq9uhuLMnivP33pEX2Nj9hd0
	hbIY9iIy8EKgwr+kDv4w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux25u1x4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 03:58:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkG9V6004PCpHcjXhxe8s9ac1seNj2HYxnzg8Fn5nsMIkL/OP1gzC9xHZNUijr6a2NExl6qxuuk1mkr969uu7zFdmGmThYGirCJ5bFzYcs3X6rkqYJ3iSwhInP6tGwIuCUAEa6D3gfHmErujZ9Ra6nr1C3GIT7Na5+XmBQRcU2knV8zIWWnYwbdDlbc+vNLmf0kbAyVrwx6mPQgPrJainrjAoZmCSnMapAdOzBx9MUG67pF+K6bD+g+EQ7aHx9zTwEcVgcQqcOg3GNMlYLQoZl17c27OJjM7N1sXOZlS9EyzWqtx8UAtkeZEIKERfWiTJgp3VBSfWYJjt6qHIFsIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXR8+KjQeTvZYxECadlvgP/PnixNypRyqUSXrwO4R6w=;
 b=CUbYTLfHXahnJ478YV59wwLVes7LX8SFtYcqU3FfQf1Q2j0KI8aY1ZDwhsHPYeAolEbexxewVYtzXt+tEoLXVVQWHBg2kQ24EcmeKWj6+FabSh9xO4kq9+YBVjWDF+EhKGdnmILMHiV48Rnq7U7ldzewXY7w0k1CuxClUx8d3xBNrrX42ycXN3OHg8Mnx6vgVDDrIqWNUcv+aZqp7TuG3YeYiPeNHbk+1nfm5L9fbZVjgo9Z8Mzr0TjitWU4bLPUN4iELAnkylecQhKldF+jTwMw5aUPnIjAOMmvrD+urzBaeKfOeC1MLh7C07PtO1AzVau2/ZfnTyd2YKROOIFfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BYAPR02MB4071.namprd02.prod.outlook.com (2603:10b6:a02:fc::23)
 by SN7PR02MB9404.namprd02.prod.outlook.com (2603:10b6:806:329::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Tue, 12 Dec
 2023 03:58:41 +0000
Received: from BYAPR02MB4071.namprd02.prod.outlook.com
 ([fe80::f807:ae10:1c6e:bb20]) by BYAPR02MB4071.namprd02.prod.outlook.com
 ([fe80::f807:ae10:1c6e:bb20%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 03:58:41 +0000
From: Gaurav Kashyap <gaurkash@qti.qualcomm.com>
To: "Om Prakash Singh (QUIC)" <quic_omprsing@quicinc.com>,
        "Gaurav Kashyap
 (QUIC)" <quic_gaurkash@quicinc.com>,
        "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "ebiggers@google.com" <ebiggers@google.com>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
        Om Prakash
 Singh <omprsing@qti.qualcomm.com>,
        "Prasad Sodagudi (QUIC)"
	<quic_psodagud@quicinc.com>,
        "abel.vesa@linaro.org" <abel.vesa@linaro.org>,
        "Seshu Madhavi Puppala (QUIC)" <quic_spuppala@quicinc.com>,
        kernel
	<kernel@quicinc.com>
Subject: RE: [PATCH v3 03/12] soc: qcom: ice: add hwkm support in ice
Thread-Topic: [PATCH v3 03/12] soc: qcom: ice: add hwkm support in ice
Thread-Index: AQHaHQaGEg6dgOyltkmox7SDIUO7TbCe/saAgAXRVrA=
Date: Tue, 12 Dec 2023 03:58:41 +0000
Message-ID: 
 <BYAPR02MB4071E5227676C605474F1E53E28EA@BYAPR02MB4071.namprd02.prod.outlook.com>
References: <20231122053817.3401748-1-quic_gaurkash@quicinc.com>
 <20231122053817.3401748-4-quic_gaurkash@quicinc.com>
 <4ce492fe-f0a6-41cf-8d8f-f088c4f6d59e@quicinc.com>
In-Reply-To: <4ce492fe-f0a6-41cf-8d8f-f088c4f6d59e@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB4071:EE_|SN7PR02MB9404:EE_
x-ms-office365-filtering-correlation-id: 3feb9882-0e2c-4e26-337a-08dbfac6a0fd
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1p/+zqBkPqj1q5koEf+Ct24T0aSo4NH1gNX8SSybjV793zxm/IEEgEw51PsX4ZXpPdqTOxd5WOwlHWncXC+hQ+g1UUF5RcsHFU7AUz2l9HU/1ZGvYv9FEB41x/3rVJfo9JEKsy0GhIUS4nEm5pFyrbhLhyENilkjoJ1nbOqdoB2W7sO0+rrqyq8fYmnX+LzuXvsqA3lFvlOCYe2ZqJ5E5S4fgXma8GYmGA3AgdNrwWKFmX4vPwwqzTWaen4BGDhfG2Ru36jqGlRUGysvsNRdpXTYhiQmi2uckpVB8jlwgj2GiTJtSO6HRFKXFeRvsFf4DucjoJTap/74r7DhycofAltxI88tn2+LmXlAHZafEdAaJ0hkXsfqFPnSKkFmggphRn5/7VW1fR3Pj3GctDjQA6vmC99jwJhrV0zUYOhndwzk295laabaBV4EMyJtOcqwGu9DzxfMFvZQEj1AvhPevzVSgFEs5EcNQ4/tLjr7QR8qJxk0VhNkn2/sQFrW32xSctCxWvb2ZvUoeKbrP6WLnl4ezxYbQ+TSxSScdWyMebK4whnUTz9APtC24s0p1bIF3ejdmjt32b4AXV6CxZbr3/ftPNrrfvkvajvDNauYsDi+lp+gq4SV/1xWTi9M+2Oh4nNCXPqYG34JpUiVnjD+HEBUDE6kjHc7NGI88CTSXPE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4071.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230173577357003)(230273577357003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(30864003)(5660300002)(83380400001)(41300700001)(122000001)(38100700002)(2906002)(66476007)(38070700009)(478600001)(316002)(54906003)(64756008)(9686003)(66556008)(66446008)(66946007)(110136005)(76116006)(33656002)(7696005)(53546011)(55016003)(71200400001)(6506007)(52536014)(4326008)(26005)(86362001)(8676002)(8936002)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SnAyWjByVWZqYURpMTBxZGpUMEx5MmVmQUhSZU5XQmlOUnN3aDlTWlRkUyt1?=
 =?utf-8?B?Q283SU1SMExQaklXUlBib0t2OG5QR3NOb3NYL0cyWGVWNU0wdU1CWFRuU1Ir?=
 =?utf-8?B?cmdSYnBNcFA1WjVta09weE1ucmZacnFGTzJjU1RCdFRyRklOL0hNQmY3emJ0?=
 =?utf-8?B?NVpSTVdybHM4SHNWVzNjYlJ6WlVoUGFRZ3JxT2ErY3RXRUV4U0g0ZUtjWTF1?=
 =?utf-8?B?WE1sY0tRZjdMZnJ0RC9lYnczck1ubWpNUndyekt1WklHNjVuYmw5bk02L1px?=
 =?utf-8?B?d09HS1IyblBLZnN3b1U4V2JzTCtSQmV1N1krcnphU1Jsb2dpOFladGZUSDZ3?=
 =?utf-8?B?VUphaGdlTlJWc0E0MmtCRno5WVNrc0ZXN1JiMTFkem9KaEN3WEJ4bGlwVDd3?=
 =?utf-8?B?MXVzZUxYOEo3RWxrSndNdU0yYUNLcmM2OVZGSTBBVkV2dVdVS2xBcVI2NENr?=
 =?utf-8?B?REJUNHpNY3M1V3VFNDlvRUlyOEl2Y2VMbHZJbEpwZVc0SEZJT2VmVXc1M003?=
 =?utf-8?B?eG15YzNXWWdZaWdOa1IzdFd0UTdwTXR1MnY3a0VUSDk5U0t4TXVvdUFjVmdm?=
 =?utf-8?B?dVR4SVBIYlFnczdoRUN5VUowYWhRa0ZtVW8zWnRTOXFwZVY5eVJWaUMzdkdK?=
 =?utf-8?B?MXRzOE9QZG91M3RCMTNsMTlLL1pienN2b3NRalV4UWd5b1dHYlA4NUlhTjF2?=
 =?utf-8?B?QTBDUU41ODNEMUtNMjVRTmpVQ0xLbndZWWNvRHM5bWFNWDk2V3dwRTNITXNv?=
 =?utf-8?B?Y0ZFU1lta0tPRzZZNk15Sm9NdWJybWlWRWpDQ3R1aTRnU0p1VEphMjhoVmgx?=
 =?utf-8?B?dGovVzd6bmZmUmdTM1BjY1NNS3ZVSnZMVlViVS8xM3hXNjhPKy9YbGdpVm5l?=
 =?utf-8?B?SlV2VndZc0VNdmxjSFAvRURzMVhrWmtmZkJQdlpVMEhnWU4rZnMwd2hDRytX?=
 =?utf-8?B?TEJIMnBTVll3UGlQMExsUFQwN2JqSlhsNHBzMXFGbHVMTnNKTnRIQzdLWTVu?=
 =?utf-8?B?dXRlRVphUE9lYnkvY2I1NnZxdlNWOTdkZm9JNlJualFlUkZyajMyY3FGQlly?=
 =?utf-8?B?bEcwdWdrVmdQTi9OZnJrVVJBVkVIMWJGc1RPczRvOXRlNHpwUk40TVpBTGJN?=
 =?utf-8?B?ejBDSlVlajBxSkplWERCc2ZUQ0huTEdIWGJzM0J0YThzc0szL2s2TU44d1Zv?=
 =?utf-8?B?MlFFRUpWS0VvSWxmeXkrclljOU5sd2QzaTl6R3A1Unoxck90Y1hXMVBBcm1T?=
 =?utf-8?B?MVd3Y2lLRXVOcGJXR3pLVENjUGJIdkdpalJlZzNra2c3M2RlUGlhbmtKbnlU?=
 =?utf-8?B?YXZIOUhmRm96ZnRUdDJmWTRzbGVNZHBhamJueDdWbDVUVk5DcWJmUU4xdVZZ?=
 =?utf-8?B?MDdvcmZtaU1xS1NDbHVvQWlrL0thWWNOTlNldnlHcmh0ZDVKNVh6Z2J5NWZp?=
 =?utf-8?B?U0hLVHVKelhIU2swZXJSMVZXZDhBNXY4K1hxUUcySm1HY1dRUWhYZDFVZDdT?=
 =?utf-8?B?RW1aOW5MZ3BJMlEwMjZId2VndDRJQjJvdTUxZGsyQlFadmpaY0JmT2dpMnVV?=
 =?utf-8?B?Y1RSQW9JU1ZJaVVyV1JKUXNMdlljWExXZkRnQ0NUQ0NJMFhHZ2ZIRnk1clJq?=
 =?utf-8?B?R0FuQ0IxNGV6bExKUTMxRGpOc2FVM2pEYW9hc2IwVDB4SytzNFdUSE9EWHNB?=
 =?utf-8?B?LzhLdk1yY3N5SVBsK2NqU21HM2pOYWpObFlYa28wQU1NVEZSMUdJMDYrR2VY?=
 =?utf-8?B?SGhKQ3ZRRVZHd2hBUVoxZWNIU1oxZG9qOHNTUUdKb1Rwb0NTeDNRNGt4SEhJ?=
 =?utf-8?B?ekxhVUk3eElVUVhHbmQyNmEzQWovb0o0dnZ1TkNRTCt3UHJaanA5N2ZMNWl5?=
 =?utf-8?B?NEZvUUtrQmRGNHhzbmlWZ3Z6Sy82VTB3VnZXYUFGSDQwYmFQN3NsWVllT3o0?=
 =?utf-8?B?Z21CeEZ4UUVjeWNoUDErdUVUMmFaRHdQcUwzM0dqR3RXTVlLTzRyRS9GdlA2?=
 =?utf-8?B?cjd3bFVrK1pxVVB0MFVXZHZhM1o4elUvK3RndFFuN0JCS0YwdTJpWGppSG1p?=
 =?utf-8?B?RGxSVGp4ck5FcmF0UEdNemhaSWtqeVpUTkZTTDBha3pITmV6SFRJT0U1U2FO?=
 =?utf-8?Q?7epglDaTSS5KUCWnACm7IWlrZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	W1OihdOJim/HCVf2ZuJuV2fo2fgaCjX0KyUGXmGJZNYNZBSLTelx2MCZto+/2sHx99j9mlv0uY076Ptdmbf8vH/NhfCHG5ZrYvxXczuFsH5kI8SbPUZULNbvNT98B9Qm5mnq8o9Qpzg5QY9yPmGJJyjyFljXNiFfhvdE+jJf86d+SWa7tY/iNwKpWRp2p5TCmojfLrfAv+kJRt2VvRFeDN8NtVRgH7mTMFw14aOqleNo18pSzshLm/tH7tk9DXuXjdbZ7qJ/goR39lG9cpDdYzOV+kkx11MqYYNU0k06vSI9fkCQCL20eJ/9R0Df0RFWLGnj2y6+FCZxqJvUPFOPIJ/9/5+Zerz5YrsiOC75wTwavV5Fhl+SmT9fPzbSGfN/B8xJod39CQFQ/8vY0l649L9crgkm0vUUPe8lkioWRp4PWxwMZYU/rU6X1uTEJaVaifFAwMfe8TxDSn1CK9IDBw4moPrenbyTg74t8FJL5Bs5+6vFd8s5QrExetR0Y1rfWFDDx408tiC1W0Ri3pdft1itLiigZ1LdwS79E8G6U+oiIW9jIvwLjJcuwou5ndX7RA48KI/pemfO1hT691Fkjw+kNkERBlO9/3Se7bCuzHCLDssyEJISa2KL/FeXSmH9N6gtekrqWQi8mYRBA9a5vbdytua/Oqo3b9a7C0AOTYrtBdJYRZdDE4NZcL0DrkwaJRKDAR35AKeMQMfj7gavUWPXIvfeDAVNZi5gvwu7WyB7t2Qkyj7I8jNiigK/sOe8Pk4vWix3LI04ZlR9t401ULh8JgJLuKD24rW0uxvBdaoKX35mJiRhV+JSsAhcZ+wvk0L9WHsvL6CG64wPRMEjkA==
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4071.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3feb9882-0e2c-4e26-337a-08dbfac6a0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 03:58:41.3894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X1kFO50l3XunV+EVgWZjLkNJnrsicYfqIVzeb2ywBOQCtmUIzNa04Ikw0zbQZacsR2UMceMlv/kz8HckDyolWX+L7uNnKYFVd/lZMchpIAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR02MB9404
X-Proofpoint-ORIG-GUID: weGPa1EzidweBSkOrKpaoGURtnF-ynTd
X-Proofpoint-GUID: weGPa1EzidweBSkOrKpaoGURtnF-ynTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120030

SGVsbG8gT20NCg0KT24gMTIvMDcvMjAyMywgT20gUHJha2FzaCBTaW5naCB3cm90ZToNCj4gT24g
MTEvMjIvMjAyMyAxMTowOCBBTSwgR2F1cmF2IEthc2h5YXAgd3JvdGU6DQo+ID4gUXVhbGNvbW0n
cyBJQ0UgKElubGluZSBDcnlwdG8gRW5naW5lKSBjb250YWlucyBhIHByb3ByaWV0YXJ5IGtleQ0K
PiA+IG1hbmFnZW1lbnQgaGFyZHdhcmUgY2FsbGVkIEhhcmR3YXJlIEtleSBNYW5hZ2VyIChIV0tN
KS4NCj4gPiBUaGlzIHBhdGNoIGludGVncmF0ZXMgSFdLTSBzdXBwb3J0IGluIElDRSB3aGVuIGl0
IGlzIGF2YWlsYWJsZS4gSFdLTQ0KPiA+IHByaW1hcmlseSBwcm92aWRlcyBoYXJkd2FyZSB3cmFw
cGVkIGtleSBzdXBwb3J0IHdoZXJlIHRoZSBJQ0UNCj4gPiAoc3RvcmFnZSkga2V5cyBhcmUgbm90
IGF2YWlsYWJsZSBpbiBzb2Z0d2FyZSBhbmQgcHJvdGVjdGVkIGluDQo+ID4gaGFyZHdhcmUuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXVyYXYgS2FzaHlhcCA8cXVpY19nYXVya2FzaEBxdWlj
aW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvc29jL3Fjb20vaWNlLmMgfCAxMzMNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgIGluY2x1ZGUv
c29jL3Fjb20vaWNlLmggfCAgIDEgKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L3Fjb20vaWNlLmMgYi9kcml2ZXJzL3NvYy9xY29tL2ljZS5jIGluZGV4DQo+ID4gNmY5NDFkMzJm
ZmZiLi5hZGY5Y2FiODQ4ZmEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvcWNvbS9pY2Uu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL3Fjb20vaWNlLmMNCj4gPiBAQCAtMjYsNiArMjYsMTkg
QEANCj4gPiAgICNkZWZpbmUgUUNPTV9JQ0VfUkVHX0ZVU0VfU0VUVElORwkJMHgwMDEwDQo+ID4g
ICAjZGVmaW5lIFFDT01fSUNFX1JFR19CSVNUX1NUQVRVUwkJMHgwMDcwDQo+ID4gICAjZGVmaW5l
IFFDT01fSUNFX1JFR19BRFZBTkNFRF9DT05UUk9MCQkweDEwMDANCj4gPiArI2RlZmluZSBRQ09N
X0lDRV9SRUdfQ09OVFJPTAkJCTB4MA0KPiA+ICsvKiBRQ09NIElDRSBIV0tNIHJlZ2lzdGVycyAq
Lw0KPiA+ICsjZGVmaW5lIFFDT01fSUNFX1JFR19IV0tNX1RaX0tNX0NUTA0KPiAJMHgxMDAwDQo+
ID4gKyNkZWZpbmUgUUNPTV9JQ0VfUkVHX0hXS01fVFpfS01fU1RBVFVTDQo+IAkweDEwMDQNCj4g
PiArI2RlZmluZSBRQ09NX0lDRV9SRUdfSFdLTV9CQU5LMF9CQU5LTl9JUlFfU1RBVFVTDQo+IAkw
eDIwMDgNCj4gPiArI2RlZmluZSBRQ09NX0lDRV9SRUdfSFdLTV9CQU5LMF9CQkFDXzANCj4gCTB4
NTAwMA0KPiA+ICsjZGVmaW5lIFFDT01fSUNFX1JFR19IV0tNX0JBTkswX0JCQUNfMQ0KPiAJMHg1
MDA0DQo+ID4gKyNkZWZpbmUgUUNPTV9JQ0VfUkVHX0hXS01fQkFOSzBfQkJBQ18yDQo+IAkweDUw
MDgNCj4gPiArI2RlZmluZSBRQ09NX0lDRV9SRUdfSFdLTV9CQU5LMF9CQkFDXzMNCj4gCTB4NTAw
Qw0KPiA+ICsjZGVmaW5lIFFDT01fSUNFX1JFR19IV0tNX0JBTkswX0JCQUNfNA0KPiAJMHg1MDEw
DQo+ID4gKw0KPiA+ICsjZGVmaW5lIFFDT01fSUNFX0hXS01fQklTVF9ET05FX1YxX1ZBTAkJMHgx
MQ0KPiA+ICsjZGVmaW5lIFFDT01fSUNFX0hXS01fQklTVF9ET05FX1YyX1ZBTAkJMHgyODcNCj4g
Pg0KPiA+ICAgLyogQklTVCAoImJ1aWx0LWluIHNlbGYtdGVzdCIpIHN0YXR1cyBmbGFncyAqLw0K
PiA+ICAgI2RlZmluZSBRQ09NX0lDRV9CSVNUX1NUQVRVU19NQVNLCQlHRU5NQVNLKDMxLCAyOCkN
Cj4gPiBAQCAtMzQsNiArNDcsOSBAQA0KPiA+ICAgI2RlZmluZSBRQ09NX0lDRV9GT1JDRV9IV19L
RVkwX1NFVFRJTkdfTUFTSwkweDINCj4gPiAgICNkZWZpbmUgUUNPTV9JQ0VfRk9SQ0VfSFdfS0VZ
MV9TRVRUSU5HX01BU0sJMHg0DQo+ID4NCj4gPiArI2RlZmluZSBRQ09NX0lDRV9IV0tNX1JFR19P
RkZTRVQJMHg4MDAwDQo+ID4gKyNkZWZpbmUgSFdLTV9PRkZTRVQocmVnKQkJKChyZWcpICsNCj4g
UUNPTV9JQ0VfSFdLTV9SRUdfT0ZGU0VUKQ0KPiA+ICsNCj4gPiAgICNkZWZpbmUgcWNvbV9pY2Vf
d3JpdGVsKGVuZ2luZSwgdmFsLCByZWcpCVwNCj4gPiAgIAl3cml0ZWwoKHZhbCksIChlbmdpbmUp
LT5iYXNlICsgKHJlZykpDQo+ID4NCj4gPiBAQCAtNDYsNiArNjIsOSBAQCBzdHJ1Y3QgcWNvbV9p
Y2Ugew0KPiA+ICAgCXN0cnVjdCBkZXZpY2VfbGluayAqbGluazsNCj4gPg0KPiA+ICAgCXN0cnVj
dCBjbGsgKmNvcmVfY2xrOw0KPiA+ICsJdTggaHdrbV92ZXJzaW9uOw0KPiA+ICsJYm9vbCB1c2Vf
aHdrbTsNCj4gDQo+IHdlIGNhbiByZWx5IG9uIGh3a21fdmVyc2lvbiBhbG9uZSB0byBkZXRlcm1p
bmUgaWYgaHdrbSBzdXBwb3J0IGlzDQo+IGF2YWlsYWJsZSBvciBub3QuDQo+IGlmIGh3a21fdmVy
c2lvbiA9IDAgKGRlZmF1bHQpIGNvbnNpZGVyIGh3a20gaXMgbm90IGVuYWJsZWQNCj4gDQoNClRo
ZSByZWFzb24gdGhpcyBpcyBiZWluZyBhZGRlZCBpcyB0byBzdXBwb3J0IHN0YW5kYXJkIGtleXMg
b24gY2hpcHNldHMgd2hpY2ggY29udGFpbiBhIEhXS00gdmVyc2lvbiwgYnV0DQpkb2VzIG5vdCBo
YXZlIHRoZSBjYXBhYmlsaXR5IGluIFRydXN0em9uZSAoZm9yIGV4YW1wbGUpIHRvIGNvbXBsZXRl
bHkgdXNlIHdyYXBwZWQga2V5cy4NClVzaW5nIGEgSFdLTSBEVFNJIGVudHJ5IHdpbGwgbGV0IHlv
dSBleHBsaWNpdGx5IGVuYWJsZS9kaXNhYmxlIHdyYXBwZWQga2V5IChvciBod2ttKSBzdXBwb3J0
Lg0KDQpJbiBnZW5lcmFsIHRvbywgSSB0aGluayBpdCBpcyBnb29kIHRvIGFsbG93IHN1cHBvcnQg
Zm9yIGJvdGggc3RhbmRhcmQgYW5kIHdyYXBwZWQga2V5cy4NCg0KPiA+ICsJYm9vbCBod2ttX2lu
aXRfY29tcGxldGU7DQo+ID4gICB9Ow0KPiA+DQo+ID4gICBzdGF0aWMgYm9vbCBxY29tX2ljZV9j
aGVja19zdXBwb3J0ZWQoc3RydWN0IHFjb21faWNlICppY2UpIEBAIC02Myw4DQo+ID4gKzgyLDI2
IEBAIHN0YXRpYyBib29sIHFjb21faWNlX2NoZWNrX3N1cHBvcnRlZChzdHJ1Y3QgcWNvbV9pY2Ug
KmljZSkNCj4gPiAgIAkJcmV0dXJuIGZhbHNlOw0KPiA+ICAgCX0NCj4gPg0KPiA+ICsJaWYgKG1h
am9yID49IDQgfHwgKG1ham9yID09IDMgJiYgbWlub3IgPT0gMiAmJiBzdGVwID49IDEpKQ0KPiA+
ICsJCWljZS0+aHdrbV92ZXJzaW9uID0gMjsNCj4gPiArCWVsc2UgaWYgKG1ham9yID09IDMgJiYg
bWlub3IgPT0gMikNCj4gPiArCQlpY2UtPmh3a21fdmVyc2lvbiA9IDE7DQo+ID4gKwllbHNlDQo+
ID4gKwkJaWNlLT5od2ttX3ZlcnNpb24gPSAwOw0KPiA+ICsNCj4gPiArCWlmIChpY2UtPmh3a21f
dmVyc2lvbiA9PSAwKQ0KPiA+ICsJCWljZS0+dXNlX2h3a20gPSBmYWxzZTsNCj4gPiArDQo+IGh3
a20gdmVyc2lvbiBzaG91bGQgcGFzcyBmcm9tIGRldmljZS10cmVlIHByb3BlcnR5IGluc3RlYWQg
b2YgY3VycmVudA0KPiBjb21wbGV4IGxvZ2ljLiBUaGlzIHdpbGwgYmUgaGVscGZ1bCBpbiBzdXBw
b3J0IGZ1dHVyZSBod2ttIHZlcnNpb24gYWxzby4NCj4gaWNlLT5od2ttX3ZlcnNpb24gPT0gMCwg
Y29uZGl0aW9uIGNhbiBiZSB1c2UgZm9yIGRldGVybWluaW5nIGlmIGh3a20gaXMNCj4gZW5hYmxl
ZCBvciBub3QuDQo+IA0KDQpTaG91bGRuJ3QgdGhlIGhhcmR3YXJlIHZlcnNpb24gYmUgcmVhZCBm
cm9tIHRoZSBoYXJkd2FyZT8NCg0KPiA+ICAgCWRldl9pbmZvKGRldiwgIkZvdW5kIFFDIElubGlu
ZSBDcnlwdG8gRW5naW5lIChJQ0UpIHYlZC4lZC4lZFxuIiwNCj4gPiAgIAkJIG1ham9yLCBtaW5v
ciwgc3RlcCk7DQo+ID4gKwlpZiAoIWljZS0+aHdrbV92ZXJzaW9uKQ0KPiA+ICsJCWRldl9pbmZv
KGRldiwgIlFDIElDRSBIV0tNIChIYXJkd2FyZSBLZXkgTWFuYWdlcikgbm90DQo+IHN1cHBvcnRl
ZCIpOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCWRldl9pbmZvKGRldiwgIlFDIElDRSBIV0tNIChIYXJk
d2FyZSBLZXkgTWFuYWdlcikNCj4gdmVyc2lvbiA9ICVkIiwNCj4gPiArCQkJIGljZS0+aHdrbV92
ZXJzaW9uKTsNCj4gPiArDQo+ID4gKwlpZiAoIWljZS0+dXNlX2h3a20pDQo+ID4gKwkJZGV2X2lu
Zm8oZGV2LCAiUUMgSUNFIEhXS00gKEhhcmR3YXJlIEtleSBNYW5hZ2VyKSBub3QNCj4gdXNlZCIp
Ow0KPiA+DQo+ID4gICAJLyogSWYgZnVzZXMgYXJlIGJsb3duLCBJQ0UgbWlnaHQgbm90IHdvcmsg
aW4gdGhlIHN0YW5kYXJkIHdheS4gKi8NCj4gPiAgIAlyZWd2YWwgPSBxY29tX2ljZV9yZWFkbChp
Y2UsIFFDT01fSUNFX1JFR19GVVNFX1NFVFRJTkcpOw0KPiA+IEBAIC0xMTMsMTAgKzE1MCwxNCBA
QCBzdGF0aWMgdm9pZCBxY29tX2ljZV9vcHRpbWl6YXRpb25fZW5hYmxlKHN0cnVjdA0KPiBxY29t
X2ljZSAqaWNlKQ0KPiA+ICAgICogZmFpbHMsIHNvIHdlIG5lZWRuJ3QgZG8gaXQgaW4gc29mdHdh
cmUgdG9vLCBhbmQgKGMpIHByb3Blcmx5IHRlc3RpbmcNCj4gPiAgICAqIHN0b3JhZ2UgZW5jcnlw
dGlvbiByZXF1aXJlcyB0ZXN0aW5nIHRoZSBmdWxsIHN0b3JhZ2Ugc3RhY2sgYW55d2F5LA0KPiA+
ICAgICogYW5kIG5vdCByZWx5aW5nIG9uIGhhcmR3YXJlLWxldmVsIHNlbGYtdGVzdHMuDQo+ID4g
KyAqDQo+ID4gKyAqIEhvd2V2ZXIsIHdlIHN0aWxsIGNhcmUgYWJvdXQgaWYgSFdLTSBCSVNUIGZh
aWxlZCAod2hlbiBzdXBwb3J0ZWQpIGFzDQo+ID4gKyAqIGltcG9ydGFudCBmdW5jdGlvbmFsaXR5
IHdvdWxkIGZhaWwgbGF0ZXIsIHNvIGRpc2FibGUgaHdrbSBvbiBmYWlsdXJlLg0KPiA+ICAgICov
DQo+ID4gICBzdGF0aWMgaW50IHFjb21faWNlX3dhaXRfYmlzdF9zdGF0dXMoc3RydWN0IHFjb21f
aWNlICppY2UpDQo+ID4gICB7DQo+ID4gICAJdTMyIHJlZ3ZhbDsNCj4gPiArCXUzMiBiaXN0X2Rv
bmVfdmFsOw0KPiA+ICAgCWludCBlcnI7DQo+ID4NCj4gPiAgIAllcnIgPSByZWFkbF9wb2xsX3Rp
bWVvdXQoaWNlLT5iYXNlICsgUUNPTV9JQ0VfUkVHX0JJU1RfU1RBVFVTLA0KPiA+IEBAIC0xMjUs
MTUgKzE2Niw5NSBAQCBzdGF0aWMgaW50IHFjb21faWNlX3dhaXRfYmlzdF9zdGF0dXMoc3RydWN0
DQo+IHFjb21faWNlICppY2UpDQo+ID4gICAJaWYgKGVycikNCj4gPiAgIAkJZGV2X2VycihpY2Ut
PmRldiwgIlRpbWVkIG91dCB3YWl0aW5nIGZvciBJQ0Ugc2VsZi10ZXN0IHRvDQo+IGNvbXBsZXRl
XG4iKTsNCj4gPg0KPiA+ICsJaWYgKGljZS0+dXNlX2h3a20pIHsNCj4gPiArCQliaXN0X2RvbmVf
dmFsID0gKGljZS0+aHdrbV92ZXJzaW9uID09IDEpID8NCj4gPiArCQkJCSBRQ09NX0lDRV9IV0tN
X0JJU1RfRE9ORV9WMV9WQUwgOg0KPiA+ICsJCQkJIFFDT01fSUNFX0hXS01fQklTVF9ET05FX1Yy
X1ZBTDsNCj4gPiArCQlpZiAocWNvbV9pY2VfcmVhZGwoaWNlLA0KPiA+ICsNCj4gSFdLTV9PRkZT
RVQoUUNPTV9JQ0VfUkVHX0hXS01fVFpfS01fU1RBVFVTKSkgIT0NCj4gPiArCQkJCSAgIGJpc3Rf
ZG9uZV92YWwpIHsNCj4gPiArCQkJZGV2X3dhcm4oaWNlLT5kZXYsICJIV0tNIEJJU1QgZXJyb3Jc
biIpOw0KPiA+ICsJCQlpY2UtPnVzZV9od2ttID0gZmFsc2U7DQo+IGVycm9yIGlzIG5vdCBwYXNz
ZWQgdG8gY2FsbGVyLiBpZiBIV0tNIGlzIGVuYWJsZWQsIGFuZCBCSVNUIGZhaWxlZCwgSUNFDQo+
IGluaXQgYWxzbyBzaG91bGQgYmUgY29uc2lkZXJlZCBoYXMgZmFpbHVyZS4NCj4gDQo+IEFueSBy
ZWFzb24gY29uc2lkZXJpbmcgaXQgYXMgd2FybmluZyBvbmx5ID8NCg0KTm90ZWQgZm9yIHRoZSBu
ZXh0IHBhdGNoLg0KDQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICAgCXJldHVybiBlcnI7DQo+ID4g
ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgcWNvbV9pY2VfZW5hYmxlX3N0YW5kYXJkX21vZGUo
c3RydWN0IHFjb21faWNlICppY2UpDQo+ID4gK3sNCj4gPiArCXUzMiB2YWwgPSAwOw0KPiA+ICsN
Cj4gPiArCWlmICghaWNlLT51c2VfaHdrbSkNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICsJ
LyoNCj4gPiArCSAqIFdoZW4gSUNFIGlzIGluIHN0YW5kYXJkIChod2ttKSBtb2RlLCBpdCBzdXBw
b3J0cyBIVyB3cmFwcGVkDQo+ID4gKwkgKiBrZXlzLCBhbmQgd2hlbiBpdCBpcyBpbiBsZWdhY3kg
bW9kZSwgaXQgb25seSBzdXBwb3J0cyBzdGFuZGFyZA0KPiA+ICsJICogKG5vbiBIVyB3cmFwcGVk
KSBrZXlzLg0KPiA+ICsJICoNCj4gPiArCSAqIFB1dCBJQ0UgaW4gc3RhbmRhcmQgbW9kZSwgSUNF
IGRlZmF1bHRzIHRvIGxlZ2FjeSBtb2RlLg0KPiA+ICsJICogTGVnYWN5IG1vZGUgLSBJQ0UgSFdL
TSBzbGF2ZSBub3Qgc3VwcG9ydGVkLg0KPiA+ICsJICogU3RhbmRhcmQgbW9kZSAtIElDRSBIV0tN
IHNsYXZlIHN1cHBvcnRlZC4NCj4gPiArCSAqDQo+ID4gKwkgKiBEZXBlbmRpbmcgb24gdGhlIHZl
cnNpb24gb2YgSFdLTSwgaXQgaXMgY29udHJvbGxlZCBieSBkaWZmZXJlbnQNCj4gPiArCSAqIHJl
Z2lzdGVycyBpbiBJQ0UuDQo+ID4gKwkgKi8NCj4gPiArCWlmIChpY2UtPmh3a21fdmVyc2lvbiA+
PSAyKSB7DQo+IA0KPiBod2ttX3ZlcnNpb24gdmVyc2lvbiA+PSAyIGlzIG5vdCBleGlzdC4gVGhp
cyBwcm9ncmFtbWluZyBpbnN0cnVjdGlvbiBtYXkNCj4gY3JlYXRlIHByb2JsZW0gaW4gZnV0dXJl
Lg0KPiANCg0KV2UgY3VycmVudGx5IHVzZSBIV0tNIHZlcnNpb24gMiBvbiBTTTg2NTAuDQpJZiB5
b3UgYXJlIHNwZWNpZnlpbmcgb25seSB2ZXJzaW9ucyBncmVhdGVyIHRoYW4gMiwNCkF0IGJlc3Qs
IHdlIHdvbid0IG5lZWQgYW55IGNoYW5nZXMgdG8gc3VwcG9ydCBsZXQncyBzYXkgYSB2ZXJzaW9u
IDMNCkF0IHdvcnN0LCBjaGFuZ2VzIG5lZWQgdG8gYmUgbWFkZSB0byBzdXBwb3J0IHZlcnNpb24g
c3BlY2lmaWMgY2hhbmdlcywNCndoaWNoIHdlIHdvdWxkIGhhdmUgaGFkIHRvIG1ha2UgYW55d2F5
Lg0KDQo+ID4gKwkJdmFsID0gcWNvbV9pY2VfcmVhZGwoaWNlLCBRQ09NX0lDRV9SRUdfQ09OVFJP
TCk7DQo+ID4gKwkJdmFsID0gdmFsICYgMHhGRkZGRkZGRTsNCj4gPiArCQlxY29tX2ljZV93cml0
ZWwoaWNlLCB2YWwsIFFDT01fSUNFX1JFR19DT05UUk9MKTsNCj4gPiArCX0gZWxzZSB7DQo+ID4g
KwkJcWNvbV9pY2Vfd3JpdGVsKGljZSwgMHg3LA0KPiB2b2lkIHVzaW5nIGNvbnN0YW50IHZhbHVl
IGxpa2UgIjB4NyIgaW4gY29kZSB1c2UgI2RlZmluZSB3aXRoIG1lYW5pbmdmdWwNCj4gbmFtZSB0
aGF0IGNhbiBpbmRpY2F0ZSB3aGF0IG9wZXJhdGlvbiBpcyBiZWluZyBwZXJmb3JtZWQuDQo+IFRo
aXMgY29tbWVudCBpcyBhcHBsaWNhYmxlIGZvciBtYW55IHBsYWNlcy4NCg0KSSBhZ3JlZSwgbm90
ZWQgZm9yIHRoZSBuZXh0IHBhdGNoLg0KDQo+ID4gKw0KPiAJSFdLTV9PRkZTRVQoUUNPTV9JQ0Vf
UkVHX0hXS01fVFpfS01fQ1RMKSk7DQo+ID4gKwl9DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRp
YyB2b2lkIHFjb21faWNlX2h3a21faW5pdChzdHJ1Y3QgcWNvbV9pY2UgKmljZSkNCj4gPiArew0K
PiA+ICsJaWYgKCFpY2UtPnVzZV9od2ttKQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwkv
KiBEaXNhYmxlIENSQyBjaGVja3MuIFRoaXMgSFdLTSBmZWF0dXJlIGlzIG5vdCB1c2VkLiAqLw0K
PiA+ICsJcWNvbV9pY2Vfd3JpdGVsKGljZSwgMHg2LA0KPiA+ICsNCj4gCUhXS01fT0ZGU0VUKFFD
T01fSUNFX1JFR19IV0tNX1RaX0tNX0NUTCkpOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBH
aXZlIHJlZ2lzdGVyIGJhbmsgb2YgdGhlIEhXS00gc2xhdmUgYWNjZXNzIHRvIHJlYWQgYW5kIG1v
ZGlmeQ0KPiA+ICsJICogdGhlIGtleXNsb3RzIGluIElDRSBIV0tNIHNsYXZlLiBXaXRob3V0IHRo
aXMsIHRydXN0em9uZSB3aWxsIG5vdA0KPiA+ICsJICogYmUgYWJsZSB0byBwcm9ncmFtIGtleXMg
aW50byBJQ0UuDQo+ID4gKwkgKi8NCj4gPiArCXFjb21faWNlX3dyaXRlbChpY2UsIDB4RkZGRkZG
RkYsDQo+ID4gKw0KPiAJSFdLTV9PRkZTRVQoUUNPTV9JQ0VfUkVHX0hXS01fQkFOSzBfQkJBQ18w
KSk7DQo+ID4gKwlxY29tX2ljZV93cml0ZWwoaWNlLCAweEZGRkZGRkZGLA0KPiA+ICsNCj4gCUhX
S01fT0ZGU0VUKFFDT01fSUNFX1JFR19IV0tNX0JBTkswX0JCQUNfMSkpOw0KPiA+ICsJcWNvbV9p
Y2Vfd3JpdGVsKGljZSwgMHhGRkZGRkZGRiwNCj4gPiArDQo+IAlIV0tNX09GRlNFVChRQ09NX0lD
RV9SRUdfSFdLTV9CQU5LMF9CQkFDXzIpKTsNCj4gPiArCXFjb21faWNlX3dyaXRlbChpY2UsIDB4
RkZGRkZGRkYsDQo+ID4gKw0KPiAJSFdLTV9PRkZTRVQoUUNPTV9JQ0VfUkVHX0hXS01fQkFOSzBf
QkJBQ18zKSk7DQo+ID4gKwlxY29tX2ljZV93cml0ZWwoaWNlLCAweEZGRkZGRkZGLA0KPiA+ICsN
Cj4gCUhXS01fT0ZGU0VUKFFDT01fSUNFX1JFR19IV0tNX0JBTkswX0JCQUNfNCkpOw0KPiA+ICsN
Cj4gPiArCS8qIENsZWFyIEhXS00gcmVzcG9uc2UgRklGTyBiZWZvcmUgZG9pbmcgYW55dGhpbmcg
Ki8NCj4gPiArCXFjb21faWNlX3dyaXRlbChpY2UsIDB4OCwNCj4gPiArDQo+IAlIV0tNX09GRlNF
VChRQ09NX0lDRV9SRUdfSFdLTV9CQU5LMF9CQU5LTl9JUlFfU1RBDQo+IFRVUykpOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICAgaW50IHFjb21faWNlX2VuYWJsZShzdHJ1Y3QgcWNvbV9pY2UgKmljZSkN
Cj4gPiAgIHsNCj4gPiArCWludCBlcnI7DQo+ID4gKw0KPiA+ICAgCXFjb21faWNlX2xvd19wb3dl
cl9tb2RlX2VuYWJsZShpY2UpOw0KPiA+ICAgCXFjb21faWNlX29wdGltaXphdGlvbl9lbmFibGUo
aWNlKTsNCj4gPg0KPiA+IC0JcmV0dXJuIHFjb21faWNlX3dhaXRfYmlzdF9zdGF0dXMoaWNlKTsN
Cj4gPiArCXFjb21faWNlX2VuYWJsZV9zdGFuZGFyZF9tb2RlKGljZSk7DQo+ID4gKw0KPiA+ICsJ
ZXJyID0gcWNvbV9pY2Vfd2FpdF9iaXN0X3N0YXR1cyhpY2UpOw0KPiA+ICsJaWYgKGVycikNCj4g
PiArCQlyZXR1cm4gZXJyOw0KPiA+ICsNCj4gPiArCXFjb21faWNlX2h3a21faW5pdChpY2UpOw0K
PiBuZXcgY29kZSBhZGRlZCBpbiB0aGlzIHNlY3Rpb24gaXMgb25seSBhcHBsaWNhdGlvbiB3aGVu
IGh3a20gaXMgZW5hYmxlZC4NCj4gaWYgKCFpY2UtPmh3a21fdmVyc2lvbikgew0KPiAJcWNvbV9p
Y2VfZW5hYmxlX3N0YW5kYXJkX21vZGUoaWNlKTsNCj4gCXFjb21faWNlX2h3a21faW5pdChpY2Up
Ow0KPiB9DQoNCkl0IGlzIGFscmVhZHkgZ2F0ZWQgd2l0aGluIHRoZSBuZXcgQVBJcw0KDQo+ID4g
Kw0KPiA+ICsJcmV0dXJuIGVycjsNCj4gPiAgIH0NCj4gPiAgIEVYUE9SVF9TWU1CT0xfR1BMKHFj
b21faWNlX2VuYWJsZSk7DQo+ID4NCj4gPiBAQCAtMTQ5LDYgKzI3MCw4IEBAIGludCBxY29tX2lj
ZV9yZXN1bWUoc3RydWN0IHFjb21faWNlICppY2UpDQo+ID4gICAJCXJldHVybiBlcnI7DQo+ID4g
ICAJfQ0KPiA+DQo+ID4gKwlxY29tX2ljZV9lbmFibGVfc3RhbmRhcmRfbW9kZShpY2UpOw0KPiA+
ICsJcWNvbV9pY2VfaHdrbV9pbml0KGljZSk7DQo+ID4gICAJcmV0dXJuIHFjb21faWNlX3dhaXRf
YmlzdF9zdGF0dXMoaWNlKTsNCj4gPiAgIH0NCj4gPiAgIEVYUE9SVF9TWU1CT0xfR1BMKHFjb21f
aWNlX3Jlc3VtZSk7DQo+ID4gQEAgLTIwNSw2ICszMjgsMTIgQEAgaW50IHFjb21faWNlX2V2aWN0
X2tleShzdHJ1Y3QgcWNvbV9pY2UgKmljZSwgaW50DQo+IHNsb3QpDQo+ID4gICB9DQo+ID4gICBF
WFBPUlRfU1lNQk9MX0dQTChxY29tX2ljZV9ldmljdF9rZXkpOw0KPiA+DQo+ID4gK2Jvb2wgcWNv
bV9pY2VfaHdrbV9zdXBwb3J0ZWQoc3RydWN0IHFjb21faWNlICppY2UpDQo+ID4gK3sNCj4gPiAr
CXJldHVybiBpY2UtPnVzZV9od2ttOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHFj
b21faWNlX2h3a21fc3VwcG9ydGVkKTsNCj4gPiArDQo+ID4gICBzdGF0aWMgc3RydWN0IHFjb21f
aWNlICpxY29tX2ljZV9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICAgCQkJCQl2b2lk
IF9faW9tZW0gKmJhc2UpDQo+ID4gICB7DQo+ID4gQEAgLTIzOSw2ICszNjgsOCBAQCBzdGF0aWMg
c3RydWN0IHFjb21faWNlICpxY29tX2ljZV9jcmVhdGUoc3RydWN0DQo+IGRldmljZSAqZGV2LA0K
PiA+ICAgCQllbmdpbmUtPmNvcmVfY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoZGV2LCBOVUxM
KTsNCj4gPiAgIAlpZiAoSVNfRVJSKGVuZ2luZS0+Y29yZV9jbGspKQ0KPiA+ICAgCQlyZXR1cm4g
RVJSX0NBU1QoZW5naW5lLT5jb3JlX2Nsayk7DQo+ID4gKwllbmdpbmUtPnVzZV9od2ttID0gb2Zf
cHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwNCj4gPiArCQkJCQkJICJxY29tLGljZS11
c2UtaHdrbSIpOw0KPiA+DQo+ID4gICAJaWYgKCFxY29tX2ljZV9jaGVja19zdXBwb3J0ZWQoZW5n
aW5lKSkNCj4gPiAgIAkJcmV0dXJuIEVSUl9QVFIoLUVPUE5PVFNVUFApOw0KPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3NvYy9xY29tL2ljZS5oIGIvaW5jbHVkZS9zb2MvcWNvbS9pY2UuaA0KPiA+
IGluZGV4IDlkZDgzNWRiYTJhNy4uMWY1MmU4MmUzZTFjIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1
ZGUvc29jL3Fjb20vaWNlLmgNCj4gPiArKysgYi9pbmNsdWRlL3NvYy9xY29tL2ljZS5oDQo+ID4g
QEAgLTM0LDUgKzM0LDYgQEAgaW50IHFjb21faWNlX3Byb2dyYW1fa2V5KHN0cnVjdCBxY29tX2lj
ZSAqaWNlLA0KPiA+ICAgCQkJIGNvbnN0IHN0cnVjdCBibGtfY3J5cHRvX2tleSAqYmtleSwNCj4g
PiAgIAkJCSB1OCBkYXRhX3VuaXRfc2l6ZSwgaW50IHNsb3QpOw0KPiA+ICAgaW50IHFjb21faWNl
X2V2aWN0X2tleShzdHJ1Y3QgcWNvbV9pY2UgKmljZSwgaW50IHNsb3QpOw0KPiA+ICtib29sIHFj
b21faWNlX2h3a21fc3VwcG9ydGVkKHN0cnVjdCBxY29tX2ljZSAqaWNlKTsNCj4gPiAgIHN0cnVj
dCBxY29tX2ljZSAqb2ZfcWNvbV9pY2VfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ID4gICAj
ZW5kaWYgLyogX19RQ09NX0lDRV9IX18gKi8NCg==

