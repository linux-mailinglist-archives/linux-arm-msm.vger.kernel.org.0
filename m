Return-Path: <linux-arm-msm+bounces-110028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGlSBa+BF2ovHggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 01:43:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 227995EAFCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 01:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CFD93019964
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 23:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376A03CA493;
	Wed, 27 May 2026 23:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uiKid6+X";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VVbxsGOG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vbJM7nHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303AD3B102F;
	Wed, 27 May 2026 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779925418; cv=fail; b=TsQHnRJ92KW3+HTozNRnuJ+JLAoELXrzCc324P8HA2B9g1OCvSn5IYyP1Oh9nSJtjPDkcKsYjJxbiaF2HdNMPji6zj5lPSiazkUGtz5JZIaK0bpNky/UW48+HrywfbaCbwv1SsQsYqm7lwgxGUsPncvIzsETQfJiSaRpp+hmxR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779925418; c=relaxed/simple;
	bh=foEplgFzBCZBzwVz7exMb67tR2Ah5mzRD16N5CnCFhg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ujhMlWRNE2ZBb8h5ABOzA0XakEf2a1PU5OAJ4ySv8cG6V3wWsb3EoBQxadoxmdP/0eMzRUX3eAF0tit+kjWPF3aoUmKQajuD/gcv/7Fi5b3UGxvAPYT+v2lig7Fu/HNWiKtaa27yAucTsmPpJLpfJwUbLHgX5u4FmBP6rCaQXtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=uiKid6+X; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VVbxsGOG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vbJM7nHU reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RMlRYF2656565;
	Wed, 27 May 2026 16:43:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=foEplgFzBCZBzwVz7exMb67tR2Ah5mzRD16N5CnCFhg=; b=
	uiKid6+XiNZwwzjdlD06VnWkgxVGz8F+f43sNpVRkU3SmU9kAyFx+gtU+Hp2MR2N
	soDw8q6vApzIlT93s6ZrWehsumIu1c+vyyYUxgbWI1tPxMGSdwBCZkUVv9joA9E4
	WP9aM7QYx141fJobR3cIJenNeV+nSgRnr0bLk6CuTfmgtEzl3zYpIN1vj49Etf93
	q2OvKsQXaiod5h2lmmDOc3fcDnzc9S8S0h1OcHhuPS08iIg1xDJWkUz1PD0h16yF
	qoPTFQ5DhvCjW2ahAzUZ/ZhvxlX4b5+859ZwJAYzF2XoCcRDtaQhUdOSfdPvIHaP
	ArjMwhyHOQjCCtUNfbaIUA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4ee7xr8qg9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 16:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1779925411; bh=foEplgFzBCZBzwVz7exMb67tR2Ah5mzRD16N5CnCFhg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VVbxsGOGihpgkFPPu/jS0kKy8TFRwoa3hFWj3Ks1W7iXlgwhZrLrq4PzALX6jlUaN
	 mF3acbXcMEN6p4DerakTQZ1gVVag0bSSHyF3qzP3VqTfmM+ualidGFUNQ/w1WCPRFh
	 FxNJd2FJtx63VuxDKBlk4Ik8Grs+BMlrGGjY6ow215dR1Oh5Nl7c3nSmUewWU0pbpf
	 s3Wv/kiagB+WW5ergj0z18bCTj8LGdd2b5AMAlLagOGfiu6FPEvN/TO9rzHk4bB4nt
	 VO41L6lgyLe1r0ht6jUHbMengyRESaVIvwxmq4U4fz42+LHZNAzzUCMt8zigJEWw9Y
	 Dm0DrC9Pn5nLw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 757E7401CD;
	Wed, 27 May 2026 23:43:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0343FA005D;
	Wed, 27 May 2026 23:43:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vbJM7nHU;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00101.outbound.protection.outlook.com [40.93.13.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 612B040BEB;
	Wed, 27 May 2026 23:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWaRwvxybpVl/2Ghee2Xpoip/4fHQAb3BPbVr7E0vrT0iJ3yQGor/764BkkRPFvPSEJmI8vv7vh5dqUkbOrvQPjXf07hFJub53g4lhDvlrMJ1lH0Wo36C+0GmN+E6qVarRiYocxc90nr8sG96CS5pqP8vJZbzLZCVKSPPqqkJUCfwf7f68oa9s95vgxb2MC6jB9/zEycRDfmtdKqwCWiPX4DqSWks+JoUJrefgkv/5EHfpMOQl7+n5q6DYw4IigLjRyZ0SmGDM+UP948E3XbuAggsiM+zsr+ue8rtJwFfmc5Rui9z0+fCN/qG5EmarEkFQZ3quSJTVX++dpSKw9gvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foEplgFzBCZBzwVz7exMb67tR2Ah5mzRD16N5CnCFhg=;
 b=E81xsgq74iwtHfwqcWR6XoNIFnUvUgo4fK9hki1emiOFP+vTOmejjW0l7qGo/c9ZU9lEyvTqfDcrcQvvvNuk/N1WKNKVxYnbZWiq1/n7i+2ev/MRnnFwelcYyn8NEPesZPlWjedkuSSCkaA9WPehsK3E3qE9BrloShEnE7sNyP0jy0V9tDLKeJPMFOVizAotrcYtzvp+SV6nGq9aOiVjXeEs8qPdBrWJNk6xIz7xT5lDexkSyaU2CKTz16sGRjCU9oGy1pmIHLtoDrUTjFjGkqTC7V6111Kmn+oFQ9U3S43JUm+0P6IvrkYNJAOy02Vq5T2/nqIZv4rZ2GxsG7kuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foEplgFzBCZBzwVz7exMb67tR2Ah5mzRD16N5CnCFhg=;
 b=vbJM7nHUs+xYfsz3EW7shMLEv/J0lCEHIbukQVGav6JNryJDQ7EH5FmHVCDCkElrOpwlAhDEtL0Nan+faJne+kzV4eb61ZoZBBQ0pTDlP/u7M9W9dmueFz1xBARZzLygqLKQnmRqPM4/dT3X2+8k7oUWio+mInQlHxLEVkDoGw0=
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::7) by BY5PR12MB4323.namprd12.prod.outlook.com
 (2603:10b6:a03:211::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Wed, 27 May
 2026 23:43:25 +0000
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61]) by CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61%6]) with mapi id 15.21.0025.020; Wed, 27 May 2026
 23:43:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Topic: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Index: AQHc4SrI3SfVExEMhk+zm6OnMWCdurYMcYEAgAvaCQCACldXAA==
Date: Wed, 27 May 2026 23:43:25 +0000
Message-ID: <ahd_VjrHp-u6thMT@vbox>
References: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
 <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
 <3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com>
In-Reply-To: <3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHXPR12MB999220:EE_|BY5PR12MB4323:EE_
x-ms-office365-filtering-correlation-id: a5d8b179-3646-428b-55e8-08debc49bf03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|18002099003|22082099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 DjOd4rhbA18GwrHLHR+Qz/UqytQ2IchQxW59yYcsG73vmoj8EXKpaNoGmf5WVqzO8ABAnGU5OeeSPvxYbuUPW18EWXZY6nPEDE0W0rUKe8GNdi7coAuzt4/h1R20Li0FzjPdhOoeOkR1G0V25ADBmjYpiWPmjyuyb1s18xxDfUUvf5O/pNN4VLw4lasWYQ29DENx96XZEmGi78smi/KauN7x7PO3ImZbxS1TH2bFbGFD4XYzfgH1RQ522h39CnNoUA1+YfzE8a6MOhJBBAtHsyIM/MdUBtGDtgOKyWO9Pz98AWkLcXsc0v2CFhxPQLTgIkVDze6KqRFPWCuhevpCpnrbzU2R4OZZEqtCy8HaaDWuYSvhwYwD3n8GNKdF+yJYPOgBk0hxRAt3f5E8wzbZaSrAwH9CgCnoI82HUd1BsygIVwTDojyNGTi5N18TPZLcv+Om4p1mNpQu7PyFod+a+GvBwQY5MDU9iR7IhGqIM2GYAV4ErU3BAdhYnQcNaqNhSfQFRsmkiNQthdqtUi6/FXxQ7PdnWD0wuqv0fBqgQhJIkujTQ4akpkIwTBeJ7bUYf16cU1HCd3b9rJjxEZuY3GMbg2pd7yp87S3QrYGaJA8tk3QW49PeMIY500X8TIxLsw1VTVA7Lt08qSo4xIytXcTj3Cxom696DdBrGPjqrrCKROtDoMAFNIozVXqDEIl05oE8i4RQ6qjV/IOfxItnPBjSUFQ8Mqks/bLbX0L19vwrE/brYtJJzN2U8fut0MJh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999220.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(18002099003)(22082099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aytUVTFuOHBFUDRlRUYwNy9yK1Z2YzdVeG43aVQxMzY0WkI2ZjJjNGZpSmp2?=
 =?utf-8?B?Sm5oK3lxb1dBTEJlcWN6VE1xYmY5R0pNUUxpeFk5L0JTZVJjZXRTMyt5cHBW?=
 =?utf-8?B?OUJOTHNsZmVUeC9nY3plT0FFOGh4UktNL1NzZzBha0FHZEpZakVWOCtBaUxM?=
 =?utf-8?B?WXZueFh3ZDlQK2FVdDQ3TVNjZEdvZUdtUWFRdVo1Y0JPV2EzdFRVdjdiTDh1?=
 =?utf-8?B?R0FwN04vazIwNEJMRDFzeFF4Zm1VZ3dMOHZSNlN3a2JRbjRoWm9HcVFZb2Ez?=
 =?utf-8?B?c1p2eEw4ZzZkZ2pTTjhIdGVMWG5HMUF1TWZ6M0sxOEVBaGpUVUQ5VExaV1NR?=
 =?utf-8?B?TFpJcHZoSDRkcmRrWmRHOFRicitTTFlabmY3dTdvOXMzcmpWRjNQaHNGVDdR?=
 =?utf-8?B?bXdyaTRORWEvN1Z3S0tibHNWT1U1WElsWjRHalNobnNLejdjOU4yOE9NNitW?=
 =?utf-8?B?Nk5kelkrK2hjejcrR2l6VGFZSzM2TGphOGdCM2UydlVVR0lIWlp0YXhqUkRQ?=
 =?utf-8?B?c3JIay9hVmlIb3d0QmlnWFV0Q3Y0dWJiOGM2YkswZXNxczVOTE1sYVVmenZr?=
 =?utf-8?B?RnpmeVRKMTlIZm1BM0JWQU9mMlR3NUlBR0ZYTW5YVlZRN0hFdkpKNjgzVEVP?=
 =?utf-8?B?S2ZFQzFNL0dPRWxhWjlZWm0rZHBVZXh1Zzg5dDhkV3k1NjZzNVM0WUtEZGxG?=
 =?utf-8?B?RDkxQjdDcjRtNUpwNjllYTVUQmNMNHZjcUYwclR6SmVqNDJXUWgvemhxeDlZ?=
 =?utf-8?B?dlM4WmpkVk8vQ25MeUFldDE2MjJyRE9Za3gzeVJxd3BjekZCNGZzU0VIbEJH?=
 =?utf-8?B?eWU4U0QvbkJsQStNVXc0MzdqMk02QzNuS2gzektKUTQwSTMrbGk3NksvaHZl?=
 =?utf-8?B?WHNHTFJLbGMrNkwrKzY1VVpveGNnK0FaOEtjZGN2T3E4azM4VnljbUhlakM3?=
 =?utf-8?B?d1JsQ3kwUlllODZYUnBBR1ErMkxNQ0xuUXJ6VjR5MS9VbzdJMlR0d09OeHlq?=
 =?utf-8?B?SzBFV3ErUFMyRy9jZEtSNlhWWi9hWFUxSnRoUXJSbjllSjVSQ040U01JUXRQ?=
 =?utf-8?B?aEVHazlkRU1LSTRqakZaME9Za0JnRDBFSkdrMXlnWXlwN0srS0cvUitKeE90?=
 =?utf-8?B?UEFlbCtHTk43THJ5OFJuV3RLbmo4WVBuZ2U1dnNLQm04dmx0RGZnSFY2Q3B5?=
 =?utf-8?B?M2F3QWpFVDBiVzJWQlUzSkl1Q0dSam9TblFBRXdXQkQxSWhQUjBuUnJNdTlM?=
 =?utf-8?B?SndDdlpxcXJOUTBNWWZPOHZ1UU5KblJ1akJhNU1QWkkwYi9TRGk2djlFN0FE?=
 =?utf-8?B?ckp1b29mTmM5QnBMRE85a2RuZnFwQlliT3pkcEFoNFBlSmN6c0RRRWpvdDhF?=
 =?utf-8?B?OEg1djlCSXFka2pNRzZURGlGekRGYlRUelBZcGJPb3FaMHRXUTM3elNjTGth?=
 =?utf-8?B?RjJPR2dlaHB2NVlFNU9FWWZadXM2Mm9sSWY1T050YmZubFhkek1ZS00rZUww?=
 =?utf-8?B?NWx6NEZCeDYrQTdjU3QvYXpYY3p2akhMNmpIWEFycENRMThOY3ZUU3ZKN0Ns?=
 =?utf-8?B?MEJsQUJMVjM2NGo3VHlmK3ZCOE84WElackpEVmZnMGhYN1NDNEJHVXp2b1Er?=
 =?utf-8?B?ODBNWWEzNXQ0bEtaVWthd21QVFlPdXZBYWUxQjR5cmZ3ZWlNdzJlRGg1THZa?=
 =?utf-8?B?OGJCRmhPcmJPclBVMDlzK1oxdy81ZXNxamdZcGlyYW9sSkhVM0hFRHQwN3R1?=
 =?utf-8?B?R0pKanA5MEQ0VUVpMHdqOWh4UnZWSm1ITERhdUIxdC96NEdBZDJoU1RnaTM3?=
 =?utf-8?B?WkpCY3J1VUhHL3RHd3RwV0lwL2hLMnFDaUdId05MVjJ5M2J6bHVNZ0k1bCs0?=
 =?utf-8?B?NWJwZ3NReitmYTUrOEpwZFQzU2NERkFpNmd4cHY2L0xBM1Jnd1JseENWZnFo?=
 =?utf-8?B?c0NaRzF4L0lPM3JDMlEwT0JHU3VoTENIN0lndkRvbmxvZzlmV3JRQlBiWlNH?=
 =?utf-8?B?TnpLQnl3RUlJVnJkZjdSZ2taT09DSHBDYTRLT2VWNlVibCt5dUhDcW0wd3pr?=
 =?utf-8?B?QXhmNnFzdW9YcTJib2RKSkNja1BOcHIxTGdwRlQ0Nk05a3JXdHRuMWZhS2pN?=
 =?utf-8?B?SzZDSWwwSjdMeEpra2F6NHBIMjhkUUtSVk5PSlJKQTMzTkpCNnVzSTBwM0lK?=
 =?utf-8?B?a1RJbjVVUFZuZnhNaTVuVFlWQlI2YzFNRDNFOGI0VW5vQjZRbmdkcVZMb0NJ?=
 =?utf-8?B?NE5iSmw2cDZRT2J6Vy9POVZSazB3bk0za0E0b0NpRXVtcSsvN1VhZUd2MVZz?=
 =?utf-8?B?bDdVK3dmeWpaZ29IZVJVM2lZVEhJRGNwZGVFaVVLQXBmTnhUamhHdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC2CEFD976673246A86047F946FE13D1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	owcx3+2zkURStceixslxod+K3lSKfio4ZiLjP4bDMIRWtMdRpYWDj7XwpkSnqOzcs7niNqhUd02aq0gFfh2hxxClxw8+4+bsxkr9b2ENKzwZ5YtAcqOgVVbmBuo/U9e6v3Hk+TB9G441RVx76RpNOsUcg/Qy24JetQim2hCYLpMRFSh1zdYNr+CyODz7JNqunabsM8dUJlAeuCbBVoQeKL6NkyFNnk7l5ERFgvuCZo2Y/4tLzDAdv7eM5Wx7341PQVoxDM2r1GaBG6BRc09luw0dXqT6UySJRTLbDCijJBf/VIzXSvOzso1OphvzRoRgd9RN1hlR9JKgB5EamBqKUg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QnzSCZd9p1RfrgWLRGGQilCNe4U7AixEWVb+ft/hcNbH5qp3qZaldZVABeBjIi3MUVhKQfHVe51/+yiqu6n6I5mFDt521J6+PiaMErqvZz0c/BWSy0spv7Gk813VsDbfEywlO9skDz8cNWZHdcrYyqwBdoNL4M1z9Cl2PMNuNhhzgtt1DnfYdrLEh7dAf0ol5iWhZi8TjWt0fcX7sA+VoJe79ivSwK48BjZpPjVJDBjV/SVAborKFC6NhTCMSWthgwBJlPqeoeKnAp0Rof/1FdafPUPG+WLm4U8comuQYRjGhdzUMesIyLTGIC8DcNQawL9bH2X7J9gmeYemrIAHUyRnRNkPm5SsvPT6/O6rokDvKxFwy1oemy5AzhDbfV+meBjfaTsOLWsmWSaJUtaBjyXveOPnfh/EKg8JJiSGeuJL0fwrbcsDlV4OPw2lEGlgovpntOYfgGcqqYM/RScYMTReKd2s+DZQqdUVqPAdF9eOAj2WRBo1YxmS454n1/X3fiW5tj8jN4yFwoXm0EGstQ0Hql6IxxZXymBJpmWxGMZnCuc+vMBFFjdU2tsncjv8AwVPDpZxZM0bdhV9Xt6RN94UYzE0QcfVQSo8mqdKQkXL1dpo5VrjMWkT+4+T1XtuyMluxgz9DEmo6Vfz4bdqhw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999220.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d8b179-3646-428b-55e8-08debc49bf03
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 23:43:25.5904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AN6D8CaoqQp5KhBUXAaUCUiDk2+Vc9MAg9sKFIlV4ZVxKEj4L+z1s06sOnos+TeEKYbzOpGEYzo/PX5XcJdKRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDIzNiBTYWx0ZWRfXyX6AAmABtSuq
 9v+OWqkhlGsX8W/hlj5J8/PvlF7xN89P1UYA9wmyArFU2Rz8p4zcnEJucSeKO+FP+lThVpRuLoR
 gRVHDNU4JcZTKlItgO7VkrX3GfV4M25YE6/UG72bUH2FlPVouNWGwuBlxswGgMqxLxJcqCJ3YMX
 D8bHmbkhOAzoMAl+N7FGCIkbiRW+xBRlNJEyYFkoLjXcj0kvZuUipQGBmQawZvqhfa3v3IiJbPt
 Jum1q0J2FpyV6imd62r2dS4Fc8bBaltauzhSEyMX6D9yLQHwkEMln04EGlxpZUtklBGnwKrGsvE
 w3gUk5dE9doLTDvDIYfMQKZRkL3v71V4iiqUV85GHvEvTiT/RdKmSAcwmeU+11m6DijZG4fasvM
 2zP5qD25kZ8CNM5EESPE24PGGMUSXEXzMwhbagvQA0OL1u0blS0CzpOk5kR1rS1BSmvLaAF77Az
 VQ/Mx9FmIhYQLWujRPA==
X-Proofpoint-ORIG-GUID: QRS-dmiexRkoHDu--ICp06T73rAU1WRz
X-Authority-Analysis: v=2.4 cv=A8tc+aWG c=1 sm=1 tr=0 ts=6a1781a4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=M9Mi2LvxuKlwdZ33Ps0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: QRS-dmiexRkoHDu--ICp06T73rAU1WRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2605270236
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110028-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 227995EAFCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXkgMjEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDUvMTMvMjYg
MTA6NDggUE0sIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+ID4gT24gTW9uLCBNYXkgMTEsIDIw
MjYgYXQgMDM6MTQ6MjJQTSArMDUzMCwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4gPj4gZVVT
QjIgdGFyZ2V0cyBoYW5kbGUgd2FrZXVwIGludGVycnVwdHMgZGlmZmVyZW50bHkgZGVwZW5kaW5n
IG9uIGRldmljZQ0KPiA+PiBzcGVlZCB3aGVuIG9wZXJhdGluZyBpbiBob3N0IG1vZGUuDQo+ID4+
DQo+ID4+IEFjY29yZGluZyB0byB0aGUgZVVTQjIgc3BlY2lmaWNhdGlvbiwgcmVtb3RlIHdha2V1
cCBzaWduYWxpbmcgaW4gaG9zdA0KPiA+PiBtb2RlIGlzIGRldGVjdGVkIHZpYSBkaWZmZXJlbnQg
ZGF0YS1saW5lIGFzc2VydGlvbnMgYmFzZWQgb24gdGhlDQo+ID4+IGNvbm5lY3RlZCBkZXZpY2Ug
c3BlZWQuDQo+ID4+DQo+ID4+IFdoZW4gYSBsb3ctc3BlZWQgZGV2aWNlIGlzIGNvbm5lY3RlZCwg
dGhlIGhvc3QgcmVwZWF0ZXIgZHJpdmVzIGVEKyB0bw0KPiA+PiBsb2dpYyAnMScgdXBvbiBkZXRl
Y3RpbmcgYSBLLXN0YXRlIG9uIHRoZSBVU0IgbGluZXMgZHVyaW5nIHJlbW90ZSB3YWtldXANCj4g
Pj4gKGVVU0IyIHNwZWNpZmljYXRpb24sIFNlY3Rpb24gNS41LjE0KS4NCj4gPj4NCj4gPj4gV2hl
biBhIGZ1bGwtc3BlZWQgb3IgaGlnaC1zcGVlZCBkZXZpY2UgaXMgY29ubmVjdGVkLCB0aGUgaG9z
dCByZXBlYXRlcg0KPiA+PiBkcml2ZXMgZUQtIHRvIGxvZ2ljICcxJyB1cG9uIGRldGVjdGluZyBh
IEstc3RhdGUgb24gdGhlIFVTQiBsaW5lIGR1cmluZw0KPiA+PiByZW1vdGUgd2FrZXVwIChlVVNC
MiBzcGVjaWZpY2F0aW9uLCBTZWN0aW9ucyA1LjUuMTUgYW5kIDUuNS4xOCkuDQo+ID4+DQo+ID4+
IFNpbmNlIHRoZSBlVVNCMiBQSFkncyAiRFAiIGFuZCAiRE0iIGludGVycnVwdCBsaW5lcyBtb25p
dG9yIHRoZSBlRCsgYW5kDQo+ID4+IGVELSBsaW5lIHN0YXRlcywgY29uZmlndXJlIHRoZSB3YWtl
dXAgaW50ZXJydXB0cyBhY2NvcmRpbmdseQ0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBLcmlz
aG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFwYXRpQG9zcy5xdWFsY29tbS5jb20+DQo+ID4+IC0t
LQ0KPiANCj4gWy4uLl0NCj4gDQo+ID4+ICsJew0KPiA+PiArCQkuY29tcGF0aWJsZSA9ICJxY29t
LHgxZTgwMTAwLWR3YzMtbXAiLA0KPiA+PiArCQkuZGF0YSA9ICZkd2MzX3Fjb21fZ2x5bXVyX3Bk
YXRhLA0KPiA+IA0KPiA+IFRoaXMgd291bGQgcmVzdWx0IGluIHRoZSBsaXN0IG9mIHRoZSBwbGF0
Zm9ybXMga2VlcGluZyBvbiBncm93aW5nLg0KPiA+IFdvdWxkIHlvdSBtaW5kIGluc3RlYWQgZGV0
ZWN0aW5nIGVVU0IyIGJ5IGNoZWNraW5nIHRoYXQgSFMgUEhZIGhhcyBpdHMNCj4gPiBvd24gcGh5
cyBwcm9wZXJ0eT8NCj4gDQo+IEkgdGhpbmsgd2UndmUgaGFkIGEgdmVyeSBzaW1pbGFyIGlzc3Vl
IG9uIHNvbWUgb3RoZXIgcGF0Y2guLiB3ZSBjb3VsZA0KPiB1c2UgcGh5X21vZGUsIGJ1dCBpdCdk
IHJlcXVpcmUgZmlyc3QgZml4aW5nIHRoaXMgbWVzczoNCj4gDQo+IDI4OiAgICAgUEhZX01PREVf
VVNCX0hPU1QsDQo+IDI5OiAgICAgUEhZX01PREVfVVNCX0hPU1RfTFMsDQo+IDMwOiAgICAgUEhZ
X01PREVfVVNCX0hPU1RfRlMsDQo+IDMxOiAgICAgUEhZX01PREVfVVNCX0hPU1RfSFMsDQo+IDMy
OiAgICAgUEhZX01PREVfVVNCX0hPU1RfU1MsDQo+IDMzOiAgICAgUEhZX01PREVfVVNCX0RFVklD
RSwNCj4gMzQ6ICAgICBQSFlfTU9ERV9VU0JfREVWSUNFX0xTLA0KPiAzNTogICAgIFBIWV9NT0RF
X1VTQl9ERVZJQ0VfRlMsDQo+IDM2OiAgICAgUEhZX01PREVfVVNCX0RFVklDRV9IUywNCj4gMzc6
ICAgICBQSFlfTU9ERV9VU0JfREVWSUNFX1NTLA0KPiAzODogICAgIFBIWV9NT0RFX1VTQl9PVEcN
Cj4gDQo+IGludG8gUEhZX01PREVfVVNCICsgc3VibW9kZXMgYW5kIHBoeV9vcHRzDQo+IA0KDQpJ
TUhPLCB0aGlzIHNlZW1zIHRvIGZpdCBiZXR0ZXIgaW4gdGhlIERUIGJpbmRpbmcsIGllLiBhIERU
IHByb3BlcnR5DQoicWNvbSxldXNiMi1waHkiIHdvdWxkIGJlIGEgY2xlYW5lciBzb2x1dGlvbiB0
aGFuIHRyeWluZyB0byBtYXRjaCB0aGlzDQp3aXRoIHRvIGNvbXBhdGlibGUgc3RyaW5nLg0KDQpB
bHNvIEtyaXNobmEsIHlvdXIgcGF0Y2ggaXMgY29ycnVwdGVkLiBQbGVhc2UgZml4IGl0Lg0KDQpC
UiwNClRoaW5o

