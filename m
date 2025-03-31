Return-Path: <linux-arm-msm+bounces-52886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A82A76C35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 18:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3933A9E87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 16:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB02215040;
	Mon, 31 Mar 2025 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="iYhEEnMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com [148.163.137.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7A78F4F;
	Mon, 31 Mar 2025 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.137.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439745; cv=fail; b=rZQGltjb+BJQHh351uqNpI9xk0WxT+mMNTlHsMGHOhyVVZvtaaCqid4b/+8tPy+sX9GJY3rB3KxFO0q4sxc6JRFrabq/K6PiW2lycstS1Q7r39XWVkTaxQzb4vLOThE5f7wIOZBQX8cepMnOeRtg+Ia8CXAz67Qy1kYgoQ66aeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439745; c=relaxed/simple;
	bh=HR3V9A5d7Tp4kpX/bq14iXvHgYAehKxrOjeZiIJsvgU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WkrrrRgGfJdRZK2PgxcIOKo8tAL18dghSFuaD/BW79mVFbTZoh3mkpWJFa/yYfn/D6KxUQrKJlR43xWUyQWrxdhfUMFtaKCz1a2AXvfnbxmMcHghuZtBs+d2yacouwyASeyGQ26G9b0xROjRw/MRS1F1yBUs3cPQ34VG26Pwg8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=iYhEEnMD; arc=fail smtp.client-ip=148.163.137.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
	by mx0b-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6CYw5019147;
	Mon, 31 Mar 2025 09:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=m
	QOj348p2Ar/vQEcRrDwUfZagV04Vu98Wjbeai9n5sg=; b=iYhEEnMDGKqVQ+kk5
	dOMaEANWj34Q94J9At8nftmJqVQlPE4INWzfBUOzAIoOzApT7cF4lZZO7/4QgKFW
	Os1h2dQKmz63HRNTd1foVU6E3xJO0mUxURU7WSHKfYkFe5oH/8VtFKtQUbTWtc4k
	3/RrTnx1xS26U0rSokYpFMWdEZDH/gbMjOcvmtZhA3mffYTc4BzFVHSiN7RjZfvB
	3+OG0r1fn++JQw5TZsYIh2PbOCeg2X5lgSA1afYQGIV7V3oJyNHtKSpGqJNHwcZf
	C/yn4RB0yYOMu+KTwfIpr5HaFjB2K/lTJjvfAFZ7KrXU3XT+BJCHAzevscN/eeWG
	R040g==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 45pcpxxews-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 09:22:38 -0400 (EDT)
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VCbxrc008254;
	Mon, 31 Mar 2025 09:22:37 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 45pngmr103-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 09:22:37 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x28v415FLAyziKSyTSjCMSQADI4H0fQPjuqEgptIM1R21hJgREPWvtrtyDTQYHVntKqAqKBsQWsauWASfX+j084/qcweGQ6hshCSeO/WVB6THTBZW6AFCylaRUqF8UyWgDS4qTYydq8+UUd7FUeDiSVcZa+1IVuMUbx0yqgNq8t0HSiIqpVwABb+1PfliPA0RzlbVtYlqs/JipigSalYoFDaaoso25saGUoOwS8Y5ByZJ1IPCv1ObXyKa82oikdcdglBiqW1TmkYGMzKpGoTIoun6Z3UnYOjMmv+xqLwL31YzweLdhBfMIRM5S+1W/zPHw/XdL8YxrxlIP4Iha3qRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQOj348p2Ar/vQEcRrDwUfZagV04Vu98Wjbeai9n5sg=;
 b=kIowWqOXSYMgwIM3GgDf0Uo1VkHYJJgDEymyRC0+e4JyNfqqT/a1LI40exa/ZRYDvJCMxwdts7E0VyA4+K9+yJi8iMphZxdOJFxjY1gfa5jv/uA/P+AaY9ty8ew0BRYWXASL4YGIaw3JzXBDzDQhJ94rxl1pdUF33VXNJAg9eDePn/gGcxQJANU0PznhbSFUPOEZNHyJ/9DMfIza2J8CRpXWyGM7VWLmn7w2nrLtxcapF2K0MSPD6GJ0M2pIgyjRKY/h9moqya0Uv7l23sppAU5iZy8ASdEG0GzlsHNbo7y/cQEOCvTGXNUsE2DZKgDZkca7QkkO9J6Oa0PLquFhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from CY5PR19MB6147.namprd19.prod.outlook.com (2603:10b6:930:c::14)
 by MN0PR19MB6336.namprd19.prod.outlook.com (2603:10b6:208:3c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 13:22:32 +0000
Received: from CY5PR19MB6147.namprd19.prod.outlook.com
 ([fe80::d390:13bd:b078:f743]) by CY5PR19MB6147.namprd19.prod.outlook.com
 ([fe80::d390:13bd:b078:f743%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 13:22:32 +0000
From: "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
Subject: RE: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
Thread-Topic: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
Thread-Index: AQHbog9cm8heXXI6S06rByyf1K+eFrONOl+A
Date: Mon, 31 Mar 2025 13:22:32 +0000
Message-ID:
 <CY5PR19MB6147747DD6A8183253EFA751BAAD2@CY5PR19MB6147.namprd19.prod.outlook.com>
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com>
In-Reply-To: <20250331073423.3184322-2-alex.vinarskis@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ActionId=8a0c526d-da8b-4ba8-992a-a4611f82b04a;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ContentBits=0;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Enabled=true;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Method=Privileged;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Name=Public
 No Visual
 Label;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SetDate=2025-03-31T13:19:28Z;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Tag=10,
 0, 1, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR19MB6147:EE_|MN0PR19MB6336:EE_
x-ms-office365-filtering-correlation-id: df6e6e08-9f71-4d96-9ca9-08dd705717f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hpPGcUMj5vpI1VHS4EbLQWqQrk3aws2HXKO6NLG58VZwYbenAby8fZY0rqOh?=
 =?us-ascii?Q?YWOrIs75XAJLz+FcoToGpVtpdzgnxysYyLTwnuVUEy/aQoOC4l26eTblhS9+?=
 =?us-ascii?Q?TbUNJA27mGOTGKWn4MDkeGOJEdDfzTt9ixqOzn4Gt2sPCRuOfEk587w2sadb?=
 =?us-ascii?Q?cJnyorsjpzgV4ePzuyBNFNloYwYNzxR2/FFNIk5bNv+kGThnKHlU9L19hYrE?=
 =?us-ascii?Q?FZZWOvkvBDjfH7kAEozkBl6J4+MkpFTGU8XB+ppwr0fldrkyV3Xo6AijYQrI?=
 =?us-ascii?Q?NrudjOtR8wgRNPuMo9Zxjn2bXBSzC52rBjUfQvc9FvJ9lSGN3dmrXI0Dwyc6?=
 =?us-ascii?Q?Hagn4glOflQqteE2DgHXUdVahDfTMBeMl+6UIj7Q0Uawb3nHQYe7Qxr6Jwr4?=
 =?us-ascii?Q?oKvD+9LzSY3X+c+ZlegCYpLmUAMVdr8GyuAdvpbSFEOOpQD7DXdRDB76+2zX?=
 =?us-ascii?Q?qokHxKDTJhZRQLkBP+1UdXU3hRJVrTuv98ikruf1k0VWS80u7MHzL7yKar0W?=
 =?us-ascii?Q?F8B/uzCyvl3PiakEMNJO9A88sf8El+aoXZHublhecKsunvzxj0oi9nU1YPd5?=
 =?us-ascii?Q?ZmlNtasDodtr3RB9J8bvwwp2F8gyZNB6+AkWlMUBN77fJ2Vyx65YIbSzWAKG?=
 =?us-ascii?Q?xCGb4fx+JtPxcfxQq9nvNp74yZ2leAaXqHyxeu4d7J+wWXPti9kv2N5IWI7J?=
 =?us-ascii?Q?7LCSBWAriNPQf7KOdwjmKr7Fz6cf91tsNV56/RKBtdxubLmP5O33nAVTbwIP?=
 =?us-ascii?Q?4u4MhmrcMRlQU40cy1yOLABsZYwN/NS8NFzXXBPEMWZ4W+eDBfZrRCibbdWP?=
 =?us-ascii?Q?O5cYS9Lxwmve1pa0ue/UuU7+o5cDmPgYyOsD+kL/1YhqeMCvGs0VuFyaMAQX?=
 =?us-ascii?Q?E7jUju/T6mvrp7HaYebZNP9gOQmSgVOy5Q/3flrWy+4eLVrdFBAaqi+IjuXR?=
 =?us-ascii?Q?wM7LgpOtnE5GTgO8UPkaj1lVdFu7syEYr5TPcx7OxAYXBM0Vekz0RrQ1EESG?=
 =?us-ascii?Q?XSWrTlGAytdaf5T992D4y7wrcqHJYkesyz05SL0zNreJ++O7/vYrF4Prvpe2?=
 =?us-ascii?Q?yBMTZRVY+Y3FgGxETgEZmVxCKeeUYvEA50A4rQUavdvDQj/zhiI6Ek5751CH?=
 =?us-ascii?Q?0eF354O/W8D715mWkCWaNMlLL7qG/pJc277bDF/+sRUpTR4QUI98VeSXP4+z?=
 =?us-ascii?Q?bUQoKIIg9kPMxFkIkXm3DXzIN8RrnI0Nl552OYE65RO70/L00gMrNECjQ4aa?=
 =?us-ascii?Q?4lvSyppKe9L2wqXStQAlRE8Lkx5F7m0tPKEt2JJPFx2qD+toXn09y5JuMYKz?=
 =?us-ascii?Q?Td/gK1zHqrmJtjtmsPxuX+3C3ql7N5Uk0Trs6GVeYAW6erIspAk7q1OJuLy+?=
 =?us-ascii?Q?GbWk+qnlmm8WDeYMfxUSgnWkTyocrcvgXOm2N+LiZpMIyEYZ4PdWXlPP1APU?=
 =?us-ascii?Q?GyN4xqvwGn2Tf/qPrDaUTi8kdwJxUd0L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR19MB6147.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qf230lL6u3JLgUjCiytYHYGmw0IeqrB+iAFfce1LfQpAaBLSyHlleosPVqKd?=
 =?us-ascii?Q?UAdOQBqekB7XmCz8WnstWK708wCGYZ7rtVZDXjL1g0M0hHNDHjl3Wa28y8k0?=
 =?us-ascii?Q?QeNOIs7iFfO17eygAHAvIAOQSoZ+M5JAKGjFs1frxwypT3xk3+X+UXdwUrhK?=
 =?us-ascii?Q?JxDrr9Tcgc1RHX9lfwdZyBLGW8i2WE2JTjMdj2lgcRP9mvYDwHKzI7ZwU2s4?=
 =?us-ascii?Q?VgjOP1OTZPnn8STXkjKHmFNkpr3RiMmdiDJyc2Byi96etWX+eIK0eDgEpMPT?=
 =?us-ascii?Q?p7ZabXB0XpOG74jptAPwzmTQWVwxpPngTTAHAasGByzp1EGiSq/IUVUEbugW?=
 =?us-ascii?Q?jlKfcRaLEoedcYE9G/MC7y2AkfoIYwVBOD4tWFG7fZWPRO9c7gtesY1SqPib?=
 =?us-ascii?Q?Y61wG3lqJ+URaL2FWo9bh+HIqEFofi5XwEKs2ZULEaZrdTG5i5vpxUPRrC2v?=
 =?us-ascii?Q?BIUN2T22iyN6TrrQWJz3hzUJyu618fcYWe/8UvIrCY68M7c5g7yJvnyU2zxB?=
 =?us-ascii?Q?n33sqLpjIaul7zIE+L2g+CGkx+/frAjHVd6ZfeXEwbBolq2M9kEeS/bZh13J?=
 =?us-ascii?Q?F+141uQJS1dwEtlmeIwvwQzwkatlam0G97yaQMlF/xB2StUIKiBKtbPMWnnu?=
 =?us-ascii?Q?a10UZ+0tEsqUVum66ondpUDjM2CuhevCJZH9ZoM5M0KB7WaF0FIBzYGv403U?=
 =?us-ascii?Q?2cbrbJ3pDJuSlOsCQ7svkuato3+OjlxnPKC0i0UiTh/wx5uTwfqNrxUganAI?=
 =?us-ascii?Q?VOff0J7SxI8E4UPc2kbne+/eF6egurFGad/gqsxoDbvCE2EG5Y/8bt4yMQjD?=
 =?us-ascii?Q?tm8zGKTG6YVUEdlyikG8BjaPOvCeTyG+BvzAGeDTEobGXnngNCtt2cIh2u0x?=
 =?us-ascii?Q?YkaLgS7/6twpdLjzzz6Tln5HtyyhrleOA5NFcG8jha/eongaxRZJ94KRmIGd?=
 =?us-ascii?Q?KtPcrQ6ccMHiMb7s39azsM/Pk2fOlc2INKuIyWzwacUTAtZKuqY52kknFCcf?=
 =?us-ascii?Q?8+NrhARz1EKABXgtXZh5A8vfPJr5BaqTgqENPWel+mCdy7Pb1XO2tWDcXGFZ?=
 =?us-ascii?Q?dYmhIwqSYKxALK2ECBoFgAqvgTdIvISXlNlFKZQnldS0Dza5Qem43LY+R4Ap?=
 =?us-ascii?Q?JRYt+TVTyp4T2VzRSHL4wAR/A9Zt+/BmUuYyU2kilos4wDjBqNZn9uN6Kb0Q?=
 =?us-ascii?Q?NuBS3IhTo/GgYHkNYz7sR/cxud9sttjbhvku/gKxuwnJmfwQWTSePnwIld8g?=
 =?us-ascii?Q?2heSWTh1+g16nBGcC15WSphVWmAr8pDrTdG3sRkn+Nhc1bdmBILbiAoACLjZ?=
 =?us-ascii?Q?wbdl8LRttsXHBFvXwUMn1zKi4cEmr26H2OpotdY++sKRER0aOIJilXrO9sMM?=
 =?us-ascii?Q?XnmaeU/6I/GoWL4+2jLq3+wH5dly70wk2XRLmbyuzQQJH4i1kU7EmZgVKy9n?=
 =?us-ascii?Q?K1jIgVnA0MZdELoz8KVU37cqqWBA68NRyGT59fMPoQ3GqtQI4Xat6VQICfMp?=
 =?us-ascii?Q?WQq5hXX7TZmXMh3PXow8VfxHYyvzg+Ki8mwFv36Q6Hu8pNPTybREcYmeaG4m?=
 =?us-ascii?Q?dHDUjKEXSTZFZ9lUJc9uyW1FSiTvYqYUevplmTG7cxwq/6cS7b+GAg+p1j9+?=
 =?us-ascii?Q?dVAdVUOMb/yXiWcxQ0vLqw98vftAw7R3sFahXbSzlTg8ahDuc58mY0rWWb5R?=
 =?us-ascii?Q?HLwvgw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR19MB6147.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df6e6e08-9f71-4d96-9ca9-08dd705717f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 13:22:32.2417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 14uVH2+g8pe1eOficpH91bwP8vFu7Xxs0x88hxMcRVQWmkDomUJ8rL6FMgx+l11MzMTBRKeJ3GqVbBdTzz3IxxyZphH1n5DuYCMuxWRUFDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310095
X-Proofpoint-ORIG-GUID: Tl55ocgB7oZaaPjl5fi5Ys10x0Fe70uK
X-Proofpoint-GUID: Tl55ocgB7oZaaPjl5fi5Ys10x0Fe70uK
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310095


> -----Original Message-----
> From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Sent: Monday, March 31, 2025 10:34 AM
>=20
> Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> combo chip using the new power sequencing bindings. All voltages are deri=
ved
> from chained fixed regulators controlled using a single GPIO.
>=20
> Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> WiFi/BT pwrseq").
>=20
> With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for X=
1-
> based Dell XPS 13 9345")
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Tested-by: Laurentiu Tudor <laurentiu.tudor1@dell.com>

Thanks for taking care of this, Alex!

---
Best Regards, Laurentiu

> ---
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index d259a0d12d7b..c924f2a67939 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -22,6 +22,7 @@ / {
>=20
>  	aliases {
>  		serial0 =3D &uart21;
> +		serial1 =3D &uart14;
>  	};
>=20
>  	gpio-keys {
> @@ -288,6 +289,101 @@ vreg_vph_pwr: regulator-vph-pwr {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	vreg_wcn_0p95: regulator-wcn-0p95 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_WCN_0P95";
> +		regulator-min-microvolt =3D <950000>;
> +		regulator-max-microvolt =3D <950000>;
> +
> +		vin-supply =3D <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_1p9: regulator-wcn-1p9 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_WCN_1P9";
> +		regulator-min-microvolt =3D <1900000>;
> +		regulator-max-microvolt =3D <1900000>;
> +
> +		vin-supply =3D <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_WCN_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 214 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&wcn_sw_en>;
> +		pinctrl-names =3D "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	wcn7850-pmu {
> +		compatible =3D "qcom,wcn7850-pmu";
> +
> +		vdd-supply =3D <&vreg_wcn_0p95>;
> +		vddio-supply =3D <&vreg_l15b_1p8>;
> +		vddaon-supply =3D <&vreg_wcn_0p95>;
> +		vdddig-supply =3D <&vreg_wcn_0p95>;
> +		vddrfa1p2-supply =3D <&vreg_wcn_1p9>;
> +		vddrfa1p8-supply =3D <&vreg_wcn_1p9>;
> +
> +		wlan-enable-gpios =3D <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios =3D <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 =3D <&wcn_wlan_bt_en>;
> +		pinctrl-names =3D "default";
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name =3D "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name =3D "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name =3D "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name =3D "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name =3D "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name =3D "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name =3D "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name =3D "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name =3D "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name =3D "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>  };
>=20
>  &apps_rsc {
> @@ -861,6 +957,23 @@ &pcie4_phy {
>  	status =3D "okay";
>  };
>=20
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible =3D "pci17cb,1107";
> +		reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p8>;
> +		vddpcie0p9-supply =3D <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply =3D <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
>  &pcie6a {
>  	perst-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
>  	wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>; @@ -1127,6
> +1240,37 @@ reset-n-pins {
>  			drive-strength =3D <2>;
>  		};
>  	};
> +
> +	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> +		pins =3D "gpio116", "gpio117";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	wcn_sw_en: wcn-sw-en-state {
> +		pins =3D "gpio214";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +};
> +
> +&uart14 {
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "qcom,wcn7850-bt";
> +		max-speed =3D <3200000>;
> +
> +		vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p8>;
> +	};
>  };
>=20
>  &uart21 {
> --
> 2.45.2


