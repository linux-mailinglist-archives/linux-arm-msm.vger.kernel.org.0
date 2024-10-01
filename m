Return-Path: <linux-arm-msm+bounces-32815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914CC98B190
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 02:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C0541C21A80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 00:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B84A07;
	Tue,  1 Oct 2024 00:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="Ha9KOdwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB943E56E;
	Tue,  1 Oct 2024 00:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727743668; cv=fail; b=OGOXlDWpdzd/mUXUd81xoabZeuHJDdBgQM9n1krFboknY21E9XZq/TzpDhsPmW8FbZr03xnwJ4IpZcvUCSkifsd+O+BRD/T9IHrfDxzSoBNyBaRS3wssorrtDsR4le7vXBYzD42oahmBUV/E1NCrZUR7jtn0c9KX6kSl9trEL8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727743668; c=relaxed/simple;
	bh=+X5nFlIwU3SQiHvN8jujmj0tn2sqUZ1W0Y2T9GjGZ/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FEOj8+iYGTazChdCIEPZJoH2AMQMGpduNRFacgYvIJ4U7q8N87hGEN9HuQYBLCO6nrBj7gxyYKECCa7Fb4b79noJPLfyO4BSy6eX1gHJzbONVZbXhe0CZKcU93XLPurIPz3YSnAKuLu+xg/tX/yEHT1lgeJBglQB8yXgON/O240=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=Ha9KOdwS; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UK2nXl030752;
	Mon, 30 Sep 2024 20:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from
	:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	smtpout1; bh=vtGJZBGdfUjsDBO5O0SfwV37PUqzVEuTuJsJ++CcvPQ=; b=Ha9
	KOdwS0q7CXSf4Fsddgd6G9uG7/0ifE/ZdSdZWlUUOmp//bu3iwrukz30lsepxVkI
	38VL3UuAh7kq3R98IbOR3q7lIqNSF/RKxMFIOjBcOMohJXrlQYLe3nrNIO3048p0
	lp0CRMrcKMI3qLKn+Y0+0RV5Rxs3UgRTVKJcb0FCKpVzmhN34515d3LrS1SUXnu8
	PKaR9N/2Ge2YamdP9f9qaBcgXhEnE1awfwFMbE3WINZRSkLuW6wWjREG4tCY442a
	g0i56FRoB55RI7b3FtsdzyQ6cMbuV6dSql6IRmPzKldutoj7V8LUS0mxNPIFWTYf
	oawtglyRtU5leLSIp6g==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 41xcyc195q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 20:47:22 -0400 (EDT)
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49109aNu021782;
	Mon, 30 Sep 2024 20:47:22 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 41yd09hk1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 20:47:21 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsdK1UFySk8AmLBwvJJ7n3Ghen2eS8iS22GCKOG2GJq4ZU+eLNzMOoyf5h3ZrXVR6CofFNAMkEmUINlBN7FxkMInwKjTSrlYZfmeeoVCgSkIycst8gbQar56LDvxIgVrISOeaII2Yag0Wnj2CiE54uMhRKaBg2OUW8QOhv8r1Zr0yQeRUvhG5sYkrTzN04J01baDty6T0g7CYYemS2Nzp/Q5oIjNUMBfPlWA3bwyWbj/DMWjX4SJWXt0BRL1HctMW30F85tHNdBkFW0U5r8nzLBPuXLKGKV49jmnjUin4fslXD/cQ0ZHFRA1R3D9qks7NXSKDpC51WkAPY4gXijY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtGJZBGdfUjsDBO5O0SfwV37PUqzVEuTuJsJ++CcvPQ=;
 b=V9P9tirIf9llf9WcJxDbVLEg234e1CL26VAroRBY5Pc5nQGTlFqe6aZEbefIoCRTN8kWN0TdYQvUfMcHfxgcbekeJ7d3fZ1GOcglh9cD6VdM7cKhnAQaKDZule52ThKqJLWunuzC93GqORjEcLKtHI0bt50EZ+dw95a+Pra2rH27iDSBgRoUZBLiqklvbJCDfgEevW38yB97hnkYCOvaJA6ZlJZtV9h3xquIWA9wontFUXW5PRb5nTuJ0MQzMdWvkFW6KKd+wgvtVldWESUQE7/4oY/hBGtDed9Hsar0fa0YAMmN5eBPHycYI5Sque+lS/uDINUo2/QXI74vmd3/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from PH8PR19MB7071.namprd19.prod.outlook.com (2603:10b6:510:221::13)
 by SA3PR19MB8217.namprd19.prod.outlook.com (2603:10b6:806:39d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 00:47:15 +0000
Received: from PH8PR19MB7071.namprd19.prod.outlook.com
 ([fe80::4df6:612:289e:429d]) by PH8PR19MB7071.namprd19.prod.outlook.com
 ([fe80::4df6:612:289e:429d%7]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 00:47:15 +0000
From: "Kemp, Bryan" <Bryan.Kemp@dell.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Laurentiu Tudor
	<tudor.laurentiu.oss@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Tudor, Laurentiu"
	<Laurentiu.Tudor1@dell.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Peter de
 Kraker <peterdekraker@umito.nl>
Subject: RE: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
Thread-Topic: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
Thread-Index: AQHbE2ZHfRoWU1Xhv0mgDA+JnMsaJbJwtbUAgABNFhA=
Date: Tue, 1 Oct 2024 00:47:15 +0000
Message-ID:
 <PH8PR19MB7071756BFAFA1BA3E92AF3C09E772@PH8PR19MB7071.namprd19.prod.outlook.com>
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
 <20240921163455.12577-4-alex.vinarskis@gmail.com>
 <f9997a19-5aae-41c9-9ca2-c847d8071230@gmail.com>
 <CAMcHhXohz6kquH_JT9eAKMntxxyjDt+oZUB_kfAO840oJ5=LPQ@mail.gmail.com>
In-Reply-To:
 <CAMcHhXohz6kquH_JT9eAKMntxxyjDt+oZUB_kfAO840oJ5=LPQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=d5667968-2d87-4e54-a5a7-efe3ef4c72e4;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=0;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2024-09-30T23:59:33Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR19MB7071:EE_|SA3PR19MB8217:EE_
x-ms-office365-filtering-correlation-id: be7d645a-15d4-4b63-0576-08dce1b29837
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-7?B?b2hTKy0rLWdtUDFVUzFoQmd0Qm5ETEpOMThwMy9KNW1aZ1dOWE9uMTRLNHJK?=
 =?utf-7?B?NDkzRVZtam14UVNOdnN4SmxtOSstU1VkaVZlNkYrLUl4RzRzaDF1YWp3OHdF?=
 =?utf-7?B?NlJYVFRVTTZDNHAxRlJBTTRmSkV0M2krLWlSTFBoNnpOdXFta3ZLbDQyZjN4?=
 =?utf-7?B?Y2xhamtpSXNTRFJnUGZLenVXanZvY29GQ1BXdUsveG85T2E1bmdpdnA0Qyst?=
 =?utf-7?B?SGhtdkF2MXBnRGIrLTl2cVo0Y1JjSkNTeEpUTFhXVEV6L3kxQVh1OXhJa05I?=
 =?utf-7?B?bTR2MEd3Ky1YMFQyWXpOampJQkk0RHVWSXYrLS9iNzlpTlBnZEVDME5pKy15?=
 =?utf-7?B?YnlEaHF5S3dndEJjVjRiU1FEMHZXVWpab3VuRlMwTUlNeTQ5YmJzd0cvQWRB?=
 =?utf-7?B?OWYrLW1UVVowUURnY0syYjVxdllVeFRkRnZPcVFmMCstQTQvTFRHYzIwQjBm?=
 =?utf-7?B?ekJ5aElxYzZzbUdrbzBsMXkyTzI0ck9pMVIvazVhSEwxWlJsd0llMW5kNng4?=
 =?utf-7?B?bDd2S2krLWROaEh2L0RWOTdTYmI2Ky1LcXRybkhtRFN6bmR1SWFtWURNOVlj?=
 =?utf-7?B?azVhZVBQZi9IMVJnaWl4NC82SjhES0pmbFk0eVZ4dEt2R1FYR01VKy1tTHA4?=
 =?utf-7?B?Q243UTg1ZjNILzRQYlVpdWdKdCstTkpha1J2QkdzY1JYMHhVYWhZMkU2ZVpU?=
 =?utf-7?B?QnZiLy9BT2UwOHRNbG5zS3pMczU2M21PRW9PS1IyV3FERE0zYjdXVmc5eVhU?=
 =?utf-7?B?WFNLYTBOL2pCOGZRNkNWSW5yeG85V3VoKy15U05RZHdZR08wMWFPQ09NNWdZ?=
 =?utf-7?B?MnNDc0JkOW05cUdmc2x6YmhSd2RmOUk0U2Vwa21LV1BOSE9JVnBIREl4VE1N?=
 =?utf-7?B?SE1ZYTdyQzI5T25qYjkyaFdxVFdyQnBCV0JnNjB6NHY1OVdibTRQMGRTR3E0?=
 =?utf-7?B?c05YVkEyQXkzUUR4VTNhcnMwQkg3Z0x2emE4N0RudVl3R091M05mVjd1eklG?=
 =?utf-7?B?RUFzSnp0YVZESWd1ekFIWkNoYThqWnJPZ1VkclJlelJQSXVkNnBRajA0dkZk?=
 =?utf-7?B?eGtPVkJWU3c2dmRaZzdUKy00Q3dIQjlvREZkQm5sa2lLL1NWVW5CZkd0MnR5?=
 =?utf-7?B?bWdHWGw3ZkJSMEdwWlp4Z2c0MnYrLXNXaHV1anEwQ0pyTEZBYzRDWW5ZVWZu?=
 =?utf-7?B?V1pkQkhBWlRucTBWdXNFU25hRVlJY3FwZlBLdlFXWWsxaGIwY29WSGU5dVBZ?=
 =?utf-7?B?cHBZTVlmdUtlSEg4U0FYL2luLystZTdXclBnejRvR3Jic1pZL0lucEhURS9j?=
 =?utf-7?B?TSstWkZSZzBIRm41VllIYnNHRUNxR3htQVZsUXBEN3hJWFpjTW5aYjEwVnNl?=
 =?utf-7?B?YXFsUHY4b0Z6akxzaHBGbzNIM0NnN2pDR1NFWW0wbW41SFVJVUNKT05RWTJp?=
 =?utf-7?B?T1lNejNlbVMvQm55Ky16ektFbzVvUjNNbkFvWE5oZGxwRW1qVkRTUzVvaHpV?=
 =?utf-7?B?SmxSTnhsVnBnT0hxTUoySU50Z3ZMN2RFeGI4QU5sTzVjeTJCZmNvbndGcHJU?=
 =?utf-7?B?NktkTEpKV2JJMmhqdld1YUpqM0JneDA3dWQvWGlUQzZsWTFCSWVIMXNRUjA2?=
 =?utf-7?B?Z2ZXTXQ2ZEp0Z0FCOWIxWHR1TkwrLWNJNmNlck5vYnBiMElOWDlnOXl5Zkpq?=
 =?utf-7?B?TXVubTB4a3JFRk50Y2NPVXQyMVFqMnl5ZG9SQ2UvWGNLZ1E5aXNKNElqR3Bo?=
 =?utf-7?B?dy8yYjB3bmgyS2dxWlRQa1JJQWdPeHJGYlEzWXJhMW5saGhiTFIxQXhxSlFX?=
 =?utf-7?B?L1gvTEJpd1p1eHZ0R2lydE1LcUJXaGplcWlsQzNtbGhmRzZZeW1yZW5hNHVj?=
 =?utf-7?B?dHBna1hPckNqKy1xckR0emlUR1lmWk8xMVlTM1ZFSmpkdUxENm9OR1NSTkVm?=
 =?utf-7?B?WXZoZGlINDdKZWdrNlErQUQwQVBRLQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR19MB7071.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?V2NXUzg1aDF3RmFLaTVmOU9MVzFRajRKUndnUXVPaHYxb0xwbFdiV09uUmp4?=
 =?utf-7?B?cTlSTmdtSThjTXNZTjB3TDhKT2krLWVjR2ZtVFBEdnJCalhjYW1nU2t5bGhS?=
 =?utf-7?B?Vk16Vk1JSWFvWkRZTDZjcWEyYjNvNVZTZUU1MFNaZ2FUckJ0U3ZMYVlFaVU2?=
 =?utf-7?B?eU9teGxBUHh0bmpORDRpUUR5SDBrSUFtMTBSM3NuQ0IzY2VBZWpmSVJSKy16?=
 =?utf-7?B?VG04T2Q2bXpKWmdWV01YaXR0MGpabjhuNmVlVHBVcjRtQm1LUXZ2UEtKTmRj?=
 =?utf-7?B?QkZSKy00dy80Qk0vUmN1ZFR1US82VGoxaEJVQmZEdzdtNzNOQm1FWXhqTEFs?=
 =?utf-7?B?TDFNMjRtU1V1dWhYemJTYystdXhBVGV6VXRFaENrQWhVZEhIbWI4SXlTNFVw?=
 =?utf-7?B?am5LZ21qVnJmZ2laT3VGRGc0NnF0eER4dVY4dUdmbURNVEoxSHBYMEUydm9K?=
 =?utf-7?B?TzZEQThzUUMrLTYrLVpxNllmeVRDV1VOWmR2cDk4R3l3b2FaZ3M2dktUT1du?=
 =?utf-7?B?QVZRVjREVGU5VjE0Mk5SdSstSjdMeHB3dzBGU2FJcTMySldTU3ovc29YWmtn?=
 =?utf-7?B?OTduKy1WNG8xblFPNXg5WCstQkJNOUNua3Qxb0ZFa0M4MWpYQlJXS0tsaThN?=
 =?utf-7?B?YkJ3YWRFdW4vQ0xQOFlzd2tOaUR5QXRiSkxLMmhsL0tpNistSXVFbG1WQUUy?=
 =?utf-7?B?NjVCUlNYdTJkZlpNdDV0dDRncUpNVHBCaVBLWDN4Y2Z3ZXVzdUU3UG1RZ3N0?=
 =?utf-7?B?bistTjNleHhMQUowWVRFT3hSVER6TXE3NzBTUS9TY29hNFo1MHB5UjlEKy1J?=
 =?utf-7?B?c0dXQWVPd05pdDFqd0t5T28xelE1dU9qd0IxNkV1TDZYV0NPdndSaGpYZnZh?=
 =?utf-7?B?aGZLSDFiRWFmMUl0N25jZkg1dzlDRDh0d1hQbGY1ZzhkbCstbjdQbW5Sd0U1?=
 =?utf-7?B?WTB3WHlCeVZsVWFCdGllSmt2WVZZdjg2YVhJN1hLWFc1bldIMzhKUUlEWE90?=
 =?utf-7?B?amlzc2xWdVRWT1JINGsxRWhFNzdPd2M4UWZlQmI2VEd2OTVLR1AzRlFUKy1F?=
 =?utf-7?B?eFJLV1VjV2QrLU5CRDFJMDJlbXVwVVcvMjcvRGxURXcxdDIyeVIyOXJMa0hP?=
 =?utf-7?B?TkJqZnM2QXJpRk9XZUVrS3JpbjdmOHlUY05VeG5BWTV5YUw5Ky1PMy9IemR2?=
 =?utf-7?B?enJDdXBKY3pKRkxIMEo4NE5CdThRUEtBbkJYUXRWVGVHOHJ6elAvbHpBY1JX?=
 =?utf-7?B?amliZG9FMmt1ckhicmF1M3FZSlVIbTUxeG1MNEpjRHZWTzhRNVo2S3orLThZ?=
 =?utf-7?B?NE1YTUhKVGoyMWVCdHV2UWdTM2tsdCstQSstOTV6UUVpQkJnSnJaSFBTYk0=?=
 =?utf-7?B?Ky1PbkxoY1M4NWF4djlVcSstWGlqQTRkWC9IOEhnMFpYcmRhKy05b3B6QmU=?=
 =?utf-7?B?UFArLWRDMmY1c3NVN0EzMmdoMW54OElKTjR6TWNOaEtzYzBiZndPWjlORkE2?=
 =?utf-7?B?UEwvZXpNOFQwYkNNR0dFdHRHWG5yM2IrLUVuQTB4Y3hwTkN3MU04eEhrTjhO?=
 =?utf-7?B?Q2VUWW1KYmpwcHJqUXhPZ1U4ak1zVHhEeWdkd1Fmd0NSRGZUZEMrLTNkNC9x?=
 =?utf-7?B?UW1HV3NJanZxWVN3Z3Fhc294anpQN0VoekM3L21ySDd6aGRNV1Zmaks5b3ZW?=
 =?utf-7?B?SHI2SFpGMmdIbW1YKy16ekZHdXNlKy1EUnVRbkQ5YllHWFF4cDdvNXhDZVdJ?=
 =?utf-7?B?WWVYSUNaU0dkbnl5aEdONFZuWGE0N2VaYTgvLy81Ky0rLW1RSXBmNVFRRlJr?=
 =?utf-7?B?QkhqUzh1cFZJbGNnSzI1SC83M3p3VzhTekM5MXM1TC9JVHF0d28vaWk3aGxQ?=
 =?utf-7?B?QTBVSk15NXpLbUsrLXZKeDVzS0FIbSstbjM4YzYzTlNjSUlYQVpGc0lpUG9S?=
 =?utf-7?B?UTlrdU1WajFMbEM1TXcxMnB4QkIwbjlLVHNuTXhRQ0M4VEtDblJXN1k5SDU1?=
 =?utf-7?B?MlpXb3hjQy81SThRR3dTaVRESWhBS0IwSkJlZXd3V1ZkamNQRlFFVXBMTFZn?=
 =?utf-7?B?OEI2QWtsWkhBaistRlZtdHVOTzVheEJHVE5wOGN2cldoVmFFcXIzUmRzNWNj?=
 =?utf-7?B?dmZ2OGxTazFTV2JKR1Zrc1NLTDRyMUxZRDIyV09lMXRPRGsxbG5FQTVWMUZZ?=
 =?utf-7?B?UExMcEY1RUVTVUsvTUI=?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR19MB7071.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7d645a-15d4-4b63-0576-08dce1b29837
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 00:47:15.3784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jCtX6bvPC9wMjzrScWQNnuy0OdvgWuh1hfqKA10d/N8B13AbCIdy7pLoHfK+PXcuZO1IvOTGVcgeVFO4nAaPng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB8217
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_01,2024-09-26_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010002
X-Proofpoint-ORIG-GUID: 00rBuoRL6RvlBdmWICvIi0_Pw3aD5L52
X-Proofpoint-GUID: 00rBuoRL6RvlBdmWICvIi0_Pw3aD5L52
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010004

Fascinating topic. First of all, thank you Alex for the explanation of your=
 logic, and thank you as well for the work on the device tree for the XPS 1=
3. I understand completely how the Dell naming/numbering scheme is confusin=
g. The shortened version down to just the model number could also be confus=
ing. For example, there is an XPS 9520 as well as a Latitude 9520. The 9 ba=
sically translates to +ACI-premium+ACI- not a specific line of business. Fo=
r what it is worth, I would prefer the dell-xps13-9345 naming and I think w=
e can have to be mindful to avoid a naming collision in a decade.


Thanks again for the support.

Bryan Kemp
Architect - Linux OS Engineering


Internal Use - Confidential
-----Original Message-----
From: Aleksandrs Vinarskis +ADw-alex.vinarskis+AEA-gmail.com+AD4-
Sent: Monday, September 30, 2024 2:24 PM
To: Laurentiu Tudor +ADw-tudor.laurentiu.oss+AEA-gmail.com+AD4-
Cc: Bjorn Andersson +ADw-andersson+AEA-kernel.org+AD4AOw- Krzysztof Kozlows=
ki +ADw-krzysztof.kozlowski+AEA-linaro.org+AD4AOw- Dmitry Baryshkov +ADw-dm=
itry.baryshkov+AEA-linaro.org+AD4AOw- linux-arm-msm+AEA-vger.kernel.org+ADs=
- devicetree+AEA-vger.kernel.org+ADs- linux-kernel+AEA-vger.kernel.org+ADs-=
 Tudor, Laurentiu +ADw-Laurentiu.Tudor1+AEA-dell.com+AD4AOw- Konrad Dybcio =
+ADw-konradybcio+AEA-kernel.org+AD4AOw- Rob Herring +ADw-robh+AEA-kernel.or=
g+AD4AOw- Krzysztof Kozlowski +ADw-krzk+-dt+AEA-kernel.org+AD4AOw- Conor Do=
oley +ADw-conor+-dt+AEA-kernel.org+AD4AOw- Rob Clark +ADw-robdclark+AEA-gma=
il.com+AD4AOw- Peter de Kraker +ADw-peterdekraker+AEA-umito.nl+AD4AOw- Kemp=
, Bryan +ADw-Bryan+AF8-Kemp+AEA-Dell.com+AD4-
Subject: Re: +AFs-PATCH v2 3/3+AF0- arm64: dts: qcom: Add support for X1-ba=
sed Dell XPS 13 9345


+AFs-EXTERNAL EMAIL+AF0-

On Mon, 30 Sept 2024 at 20:26, Laurentiu Tudor +ADw-tudor.laurentiu.oss+AEA=
-gmail.com+AD4- wrote:
+AD4-
+AD4- Hi Alex,
+AD4-
+AD4- Thanks for this+ACE- Comment inline.
+AD4-
+AD4- On 9/21/24 19:33, Aleksandrs Vinarskis wrote:
+AD4- +AD4- Initial support for Dell XPS 9345 13+ACI- 2024 (Tributo) based =
on X1E80100.
+AD4- +AD4-
+AD4- +AD4- Working:
+AD4- +AD4- +ACo- Touchpad
+AD4- +AD4- +ACo- Keyboard (only post suspend+ACY-resume, i2c-hid patch WIP=
)
+AD4- +AD4- +ACo- eDP, with brightness control
+AD4- +AD4- +ACo- NVME
+AD4- +AD4- +ACo- USB Type-C ports in USB2/USB3 (one orientation)
+AD4- +AD4- +ACo- WiFi
+AD4- +AD4- +ACo- GPU/aDSP/cDSP firmware loading (requires binaries from Wi=
ndows)
+AD4- +AD4- +ACo- Lid switch
+AD4- +AD4- +ACo- Sleep/suspend, nothing visibly broken on resume
+AD4- +AD4-
+AD4- +AD4- Not working:
+AD4- +AD4- +ACo- Speakers (WIP, pin guessing, x4 WSA8845)
+AD4- +AD4- +ACo- Microphones (WIP, pin guessing)
+AD4- +AD4- +ACo- Fingerprint Reader (WIP, USB MP with ptn3222)
+AD4- +AD4- +ACo- USB as DP/USB3 (WIP, PS8830 based)
+AD4- +AD4- +ACo- Camera
+AD4- +AD4- +ACo- Battery Info
+AD4- +AD4-
+AD4- +AD4- Should be working, but cannot be tested due to lack of hw:
+AD4- +AD4- +ACo- Higher res OLED, higher res IPS panels
+AD4- +AD4- +ACo- Touchscreen
+AD4- +AD4-
+AD4- +AD4- Signed-off-by: Aleksandrs Vinarskis +ADw-alex.vinarskis+AEA-gma=
il.com+AD4-
+AD4- +AD4- ---
+AD4- +AD4-   arch/arm64/boot/dts/qcom/Makefile             +AHw-   1 +-
+AD4- +AD4-   .../dts/qcom/x1e80100-dell-tributo-13.dts     +AHw- 860 +-+-+=
-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
+AD4-
+AD4-
+AD4- Could you please use the marketing name for the device tree file name
+AD4- +ACY- machine compatible, e.g. +ACI-x1e80100-dell-xps13-9345.dts+ACI-=
 for the dts
+AD4- file and +ACI-dell,xps13-9345+ACI- for the compat? I'm thinking that =
this will
+AD4- help people to identify it more easily.

Hi,

Even though I agree that it may be easier to identify for a non-developer, =
I am a bit skeptical as Dell has a pretty weird naming convention which som=
etimes results in the name being non-unique.
In particular case - 9345 - 9 stands for XPS series, 3 stands for 13+ACI-, =
and 45 would typically be the last digit of year +- 0 (so 40), but with the=
 introduction of last year's ''13 Plus+ACI-series they added a 5. At presen=
t, this is unique, however in 10 years it may not be.

I have recently hit this issue when working on Dell XPS 15+ACI- 2024 (9530)=
, which has the same model number as Dell XPS 15+ACI- 2013 and led to huge =
confusions. Only way to distinguish them is by codename ('fiorano' for the =
newer one), or using a complete name including the year... The codename on =
the other hand is easily searchable both in the source code and online.

I tried to browse the source code for existing notation, but didn't find an=
ything strongly supporting one or another way, so decided to follow Microso=
ft Surface's example with codenames ('romulus').
Codenaming is also imperfect though, as in Dell's case it typically refers =
to chassis, rather than +AF8-the+AF8- particular device, which typically la=
sts several years. Typically throughout chassis generation internals stay +=
-/- the same, but we can't know if any of the changes would be breaking. Pe=
rhaps then, +AGA-x1e80100-dell-tributo-9345+AGA- and +AGA-dell,tributo-9345=
+AGA- respectively, as this would be the shortest yet most complete descrip=
tion? 'Tributo' already implies its XPS 13+ACI- and chassis variation (touc=
har, hidden trackpad etc etc), '9345' implies XPS 13+ACI- of 2024 (?) and i=
n combination with chassis variant pinpoints the model.
Otherwise, if it's strongly desired to use marketing names it can be reduce=
d down to +AGA-x1e80100-dell-9345.dts+AGA- and +AGA-dell,9345+AGA- altogeth=
er as
9345 implies it being both 'XPS' series and 13+ACI-, and we can hope that b=
y 2034 Dell won't repeat the same mistake with naming. Curious to hear main=
tainers' opinions as well.

P.S. I've sent the V3 version of the series, it probably makes sense to mov=
e this conversation there for visibility.

Alex

+AD4-
+AD4- ---
+AD4- Thanks +ACY- Best Regards, Laurentiu
+AD4-
+AD4- +AD4-   2 files changed, 861 insertions(+-)
+AD4- +AD4-   create mode 100644
+AD4- +AD4- arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
+AD4-
+AD4-
+AD4-
+AD4- +AD4- diff --git a/arch/arm64/boot/dts/qcom/Makefile
+AD4- +AD4- b/arch/arm64/boot/dts/qcom/Makefile
+AD4- +AD4- index ae002c7cf126..111c589d6bae 100644
+AD4- +AD4- --- a/arch/arm64/boot/dts/qcom/Makefile
+AD4- +AD4- +-+-+- b/arch/arm64/boot/dts/qcom/Makefile
+AD4- +AD4- +AEAAQA- -271,6 +-271,7 +AEAAQA- dtb-+ACQ-(CONFIG+AF8-ARCH+AF8-=
QCOM)   +-+AD0- sm8650-qrd.dtb
+AD4- +AD4-   dtb-+ACQ-(CONFIG+AF8-ARCH+AF8-QCOM)     +-+AD0- x1e78100-leno=
vo-thinkpad-t14s.dtb
+AD4- +AD4-   dtb-+ACQ-(CONFIG+AF8-ARCH+AF8-QCOM)     +-+AD0- x1e80100-asus=
-vivobook-s15.dtb
+AD4- +AD4-   dtb-+ACQ-(CONFIG+AF8-ARCH+AF8-QCOM)     +-+AD0- x1e80100-crd.=
dtb
+AD4- +AD4- +-dtb-+ACQ-(CONFIG+AF8-ARCH+AF8-QCOM)      +-+AD0- x1e80100-del=
l-tributo-13.dtb
+AD4- +AD4-   dtb-+ACQ-(CONFIG+AF8-ARCH+AF8-QCOM)     +-+AD0- x1e80100-leno=
vo-yoga-slim7x.dtb
+AD4- +AD4-   dtb-+ACQ-(CONFIG+AF8-ARCH+AF8-QCOM)     +-+AD0- x1e80100-micr=
osoft-romulus13.dtb
+AD4- +AD4-   dtb-+ACQ-(CONFIG+AF8-ARCH+AF8-QCOM)     +-+AD0- x1e80100-micr=
osoft-romulus15.dtb
+AD4- +AD4- diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.=
dts
+AD4- +AD4- b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
+AD4- +AD4- new file mode 100644
+AD4- +AD4- index 000000000000..ec04b64f9558
+AD4- +AD4- --- /dev/null
+AD4- +AD4- +-+-+- b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
+AD4- +AD4- +AEAAQA- -0,0 +-1,860 +AEAAQA-
+AD4- +AD4- +-// SPDX-License-Identifier: BSD-3-Clause
+AD4- +AD4- +-/+ACo-
+AD4- +AD4- +- +ACo- Copyright (c) 2024 Qualcomm Innovation Center, Inc. Al=
l rights reserved.
+AD4- +AD4- +- +ACo- Copyright (c) 2024 Aleksandrs Vinarskis
+AD4- +AD4- +-+ADw-alex.vinarskis+AEA-gmail.com+AD4-  +ACo-/
+AD4- +AD4- +-
+AD4- +AD4- +-/dts-v1/+ADs-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACM-include +ADw-dt-bindings/gpio/gpio.h+AD4-
+AD4- +AD4- +-+ACM-include +ADw-dt-bindings/input/gpio-keys.h+AD4- +ACM-inc=
lude
+AD4- +AD4- +-+ADw-dt-bindings/input/input.h+AD4- +ACM-include +ADw-dt-bind=
ings/leds/common.h+AD4-
+AD4- +AD4- +-+ACM-include +ADw-dt-bindings/regulator/qcom,rpmh-regulator.h=
+AD4-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACM-include +ACI-x1e80100.dtsi+ACI-
+AD4- +AD4- +-+ACM-include +ACI-x1e80100-pmics.dtsi+ACI-
+AD4- +AD4- +-
+AD4- +AD4- +-/ +AHs-
+AD4- +AD4- +-     model +AD0- +ACI-Dell XPS 13 9345+ACIAOw-
+AD4- +AD4- +-     compatible +AD0- +ACI-dell,tributo-13+ACI-, +ACI-qcom,x1=
e80100+ACIAOw-
+AD4- +AD4- +-     chassis-type +AD0- +ACI-laptop+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     gpio-keys +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-gpio-keys+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             pinctrl-0 +AD0- +ADwAJg-hall+AF8-int+AF8-n+AF8-d=
efault+AD4AOw-
+AD4- +AD4- +-             pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             switch-lid +AHs-
+AD4- +AD4- +-                     gpios +AD0- +ADwAJg-tlmm 92 GPIO+AF8-ACT=
IVE+AF8-LOW+AD4AOw-
+AD4- +AD4- +-                     linux,input-type +AD0- +ADw-EV+AF8-SW+AD=
4AOw-
+AD4- +AD4- +-                     linux,code +AD0- +ADw-SW+AF8-LID+AD4AOw-
+AD4- +AD4- +-                     wakeup-source+ADs-
+AD4- +AD4- +-                     wakeup-event-action +AD0- +ADw-EV+AF8-AC=
T+AF8-DEASSERTED+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     leds +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-gpio-leds+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-             pinctrl-0 +AD0- +ADwAJg-cam+AF8-indicator+AF8-en=
+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             led-camera-indicator +AHs-
+AD4- +AD4- +-                     label +AD0- +ACI-white:camera-indicator+=
ACIAOw-
+AD4- +AD4- +-                     function +AD0- LED+AF8-FUNCTION+AF8-INDI=
CATOR+ADs-
+AD4- +AD4- +-                     color +AD0- +ADw-LED+AF8-COLOR+AF8-ID+AF=
8-WHITE+AD4AOw-
+AD4- +AD4- +-                     gpios +AD0- +ADwAJg-tlmm 110 GPIO+AF8-AC=
TIVE+AF8-HIGH+AD4AOw-
+AD4- +AD4- +-                     linux,default-trigger +AD0- +ACI-none+AC=
IAOw-
+AD4- +AD4- +-                     default-state +AD0- +ACI-off+ACIAOw-
+AD4- +AD4- +-                     /+ACo- Reuse as a panic indicator until =
we get a +ACI-camera on+ACI- trigger +ACo-/
+AD4- +AD4- +-                     panic-indicator+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     pmic-glink +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-qcom,x1e80100-pmic-glink+A=
CI-,
+AD4- +AD4- +-                          +ACI-qcom,sm8550-pmic-glink+ACI-,
+AD4- +AD4- +-                          +ACI-qcom,pmic-glink+ACIAOw-
+AD4- +AD4- +-             orientation-gpios +AD0- +ADwAJg-tlmm 121 GPIO+AF=
8-ACTIVE+AF8-HIGH+AD4-,
+AD4- +AD4- +-                                 +ADwAJg-tlmm 123 GPIO+AF8-AC=
TIVE+AF8-HIGH+AD4AOw-
+AD4- +AD4- +-             +ACM-address-cells +AD0- +ADw-1+AD4AOw-
+AD4- +AD4- +-             +ACM-size-cells +AD0- +ADw-0+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             /+ACo- Right-side USB Type-C port +ACo-/
+AD4- +AD4- +-             connector+AEA-0 +AHs-
+AD4- +AD4- +-                     compatible +AD0- +ACI-usb-c-connector+AC=
IAOw-
+AD4- +AD4- +-                     reg +AD0- +ADw-0+AD4AOw-
+AD4- +AD4- +-                     power-role +AD0- +ACI-dual+ACIAOw-
+AD4- +AD4- +-                     data-role +AD0- +ACI-dual+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                     ports +AHs-
+AD4- +AD4- +-                             +ACM-address-cells +AD0- +ADw-1+=
AD4AOw-
+AD4- +AD4- +-                             +ACM-size-cells +AD0- +ADw-0+AD4=
AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                             port+AEA-0 +AHs-
+AD4- +AD4- +-                                     reg +AD0- +ADw-0+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                                     pmic+AF8-glink+AF8-ss0+A=
F8-hs+AF8-in: endpoint +AHs-
+AD4- +AD4- +-                                             remote-endpoint =
+AD0- +ADwAJg-usb+AF8-1+AF8-ss0+AF8-dwc3+AF8-hs+AD4AOw-
+AD4- +AD4- +-                                     +AH0AOw-
+AD4- +AD4- +-                             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                             port+AEA-1 +AHs-
+AD4- +AD4- +-                                     reg +AD0- +ADw-1+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                                     pmic+AF8-glink+AF8-ss0+A=
F8-ss+AF8-in: endpoint +AHs-
+AD4- +AD4- +-                                             remote-endpoint =
+AD0- +ADwAJg-usb+AF8-1+AF8-ss0+AF8-qmpphy+AF8-out+AD4AOw-
+AD4- +AD4- +-                                     +AH0AOw-
+AD4- +AD4- +-                             +AH0AOw-
+AD4- +AD4- +-                     +AH0AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             /+ACo- Left-side USB Type-C port +ACo-/
+AD4- +AD4- +-             connector+AEA-1 +AHs-
+AD4- +AD4- +-                     compatible +AD0- +ACI-usb-c-connector+AC=
IAOw-
+AD4- +AD4- +-                     reg +AD0- +ADw-1+AD4AOw-
+AD4- +AD4- +-                     power-role +AD0- +ACI-dual+ACIAOw-
+AD4- +AD4- +-                     data-role +AD0- +ACI-dual+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                     ports +AHs-
+AD4- +AD4- +-                             +ACM-address-cells +AD0- +ADw-1+=
AD4AOw-
+AD4- +AD4- +-                             +ACM-size-cells +AD0- +ADw-0+AD4=
AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                             port+AEA-0 +AHs-
+AD4- +AD4- +-                                     reg +AD0- +ADw-0+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                                     pmic+AF8-glink+AF8-ss1+A=
F8-hs+AF8-in: endpoint +AHs-
+AD4- +AD4- +-                                             remote-endpoint =
+AD0- +ADwAJg-usb+AF8-1+AF8-ss1+AF8-dwc3+AF8-hs+AD4AOw-
+AD4- +AD4- +-                                     +AH0AOw-
+AD4- +AD4- +-                             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                             port+AEA-1 +AHs-
+AD4- +AD4- +-                                     reg +AD0- +ADw-1+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                                     pmic+AF8-glink+AF8-ss1+A=
F8-ss+AF8-in: endpoint +AHs-
+AD4- +AD4- +-                                             remote-endpoint =
+AD0- +ADwAJg-usb+AF8-1+AF8-ss1+AF8-qmpphy+AF8-out+AD4AOw-
+AD4- +AD4- +-                                     +AH0AOw-
+AD4- +AD4- +-                             +AH0AOw-
+AD4- +AD4- +-                     +AH0AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     reserved-memory +AHs-
+AD4- +AD4- +-             linux,cma +AHs-
+AD4- +AD4- +-                     compatible +AD0- +ACI-shared-dma-pool+AC=
IAOw-
+AD4- +AD4- +-                     size +AD0- +ADw-0x0 0x8000000+AD4AOw-
+AD4- +AD4- +-                     reusable+ADs-
+AD4- +AD4- +-                     linux,cma-default+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     vreg+AF8-edp+AF8-3p3: regulator-edp-3p3 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-regulator-fixed+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             regulator-name +AD0- +ACI-VREG+AF8-EDP+AF8-3P3+A=
CIAOw-
+AD4- +AD4- +-             regulator-min-microvolt +AD0- +ADw-3300000+AD4AO=
w-
+AD4- +AD4- +-             regulator-max-microvolt +AD0- +ADw-3300000+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-             gpio +AD0- +ADwAJg-tlmm 70 GPIO+AF8-ACTIVE+AF8-H=
IGH+AD4AOw-
+AD4- +AD4- +-             enable-active-high+ADs-
+AD4- +AD4- +-
+AD4- +AD4- +-             pinctrl-0 +AD0- +ADwAJg-edp+AF8-reg+AF8-en+AD4AO=
w-
+AD4- +AD4- +-             pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             regulator-boot-on+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     vreg+AF8-nvme: regulator-nvme +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-regulator-fixed+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             regulator-name +AD0- +ACI-VREG+AF8-NVME+AF8-3P3+=
ACIAOw-
+AD4- +AD4- +-             regulator-min-microvolt +AD0- +ADw-3300000+AD4AO=
w-
+AD4- +AD4- +-             regulator-max-microvolt +AD0- +ADw-3300000+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-             gpio +AD0- +ADwAJg-tlmm 18 GPIO+AF8-ACTIVE+AF8-H=
IGH+AD4AOw-
+AD4- +AD4- +-             enable-active-high+ADs-
+AD4- +AD4- +-
+AD4- +AD4- +-             pinctrl-0 +AD0- +ADwAJg-nvme+AF8-reg+AF8-en+AD4A=
Ow-
+AD4- +AD4- +-             pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     vreg+AF8-vph+AF8-pwr: regulator-vph-pwr +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-regulator-fixed+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             regulator-name +AD0- +ACI-vph+AF8-pwr+ACIAOw-
+AD4- +AD4- +-             regulator-min-microvolt +AD0- +ADw-3700000+AD4AO=
w-
+AD4- +AD4- +-             regulator-max-microvolt +AD0- +ADw-3700000+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-             regulator-always-on+ADs-
+AD4- +AD4- +-             regulator-boot-on+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-apps+AF8-rsc +AHs-
+AD4- +AD4- +-     regulators-0 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-qcom,pm8550-rpmh-regulator=
s+ACIAOw-
+AD4- +AD4- +-             qcom,pmic-id +AD0- +ACI-b+ACIAOw-
+AD4- +AD4- +-             vdd-bob1-supply +AD0- +ADwAJg-vreg+AF8-vph+AF8-p=
wr+AD4AOw-
+AD4- +AD4- +-             vdd-bob2-supply +AD0- +ADwAJg-vreg+AF8-vph+AF8-p=
wr+AD4AOw-
+AD4- +AD4- +-             vdd-l1-l4-l10-supply +AD0- +ADwAJg-vreg+AF8-s4c+=
AF8-1p8+AD4AOw-
+AD4- +AD4- +-             vdd-l2-l13-l14-supply +AD0- +ADwAJg-vreg+AF8-bob=
1+AD4AOw-
+AD4- +AD4- +-             vdd-l5-l16-supply +AD0- +ADwAJg-vreg+AF8-bob1+AD=
4AOw-
+AD4- +AD4- +-             vdd-l6-l7-supply +AD0- +ADwAJg-vreg+AF8-bob2+AD4=
AOw-
+AD4- +AD4- +-             vdd-l8-l9-supply +AD0- +ADwAJg-vreg+AF8-bob1+AD4=
AOw-
+AD4- +AD4- +-             vdd-l12-supply +AD0- +ADwAJg-vreg+AF8-s5j+AF8-1p=
2+AD4AOw-
+AD4- +AD4- +-             vdd-l15-supply +AD0- +ADwAJg-vreg+AF8-s4c+AF8-1p=
8+AD4AOw-
+AD4- +AD4- +-             vdd-l17-supply +AD0- +ADwAJg-vreg+AF8-bob2+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-bob1: bob1 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-bob1+=
ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-30080=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-39600=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-bob2: bob2 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-bob2+=
ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-25040=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-30080=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l2b+AF8-3p0: ldo2 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l2b+A=
F8-3p0+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-30720=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-30720=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l4b+AF8-1p8: ldo4 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l4b+A=
F8-1p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l6b+AF8-1p8: ldo6 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l6b+A=
F8-1p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-29600=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l8b+AF8-3p0: ldo8 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l8b+A=
F8-3p0+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-30720=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-30720=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l9b+AF8-2p9: ldo9 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l9b+A=
F8-2p9+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-29600=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-29600=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l12b+AF8-1p2: ldo12 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l12b+=
AF8-1p2+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-12000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-12000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l13b+AF8-3p0: ldo13 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l13b+=
AF8-3p0+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-30720=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-30720=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l14b+AF8-3p0: ldo14 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l14b+=
AF8-3p0+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-30720=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-30720=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l15b+AF8-1p8: ldo15 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l15b+=
AF8-1p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l17b+AF8-2p5: ldo17 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l17b+=
AF8-2p5+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-25040=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-25040=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     regulators-1 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-qcom,pm8550ve-rpmh-regulat=
ors+ACIAOw-
+AD4- +AD4- +-             qcom,pmic-id +AD0- +ACI-c+ACIAOw-
+AD4- +AD4- +-             vdd-l1-supply +AD0- +ADwAJg-vreg+AF8-s5j+AF8-1p2=
+AD4AOw-
+AD4- +AD4- +-             vdd-l2-supply +AD0- +ADwAJg-vreg+AF8-s1f+AF8-0p7=
+AD4AOw-
+AD4- +AD4- +-             vdd-l3-supply +AD0- +ADwAJg-vreg+AF8-s1f+AF8-0p7=
+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-s4c+AF8-1p8: smps4 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-s4c+A=
F8-1p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-18560=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-20000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l1c+AF8-1p2: ldo1 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l1c+A=
F8-1p2+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-12000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-12000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l2c+AF8-0p8: ldo2 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l2c+A=
F8-0p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l3c+AF8-0p9: ldo3 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l3c+A=
F8-0p9+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-92000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-92000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     regulators-2 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-qcom,pmc8380-rpmh-regulato=
rs+ACIAOw-
+AD4- +AD4- +-             qcom,pmic-id +AD0- +ACI-d+ACIAOw-
+AD4- +AD4- +-             vdd-l1-supply +AD0- +ADwAJg-vreg+AF8-s1f+AF8-0p7=
+AD4AOw-
+AD4- +AD4- +-             vdd-l2-supply +AD0- +ADwAJg-vreg+AF8-s1f+AF8-0p7=
+AD4AOw-
+AD4- +AD4- +-             vdd-l3-supply +AD0- +ADwAJg-vreg+AF8-s4c+AF8-1p8=
+AD4AOw-
+AD4- +AD4- +-             vdd-s1-supply +AD0- +ADwAJg-vreg+AF8-vph+AF8-pwr=
+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l1d+AF8-0p8: ldo1 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l1d+A=
F8-0p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l2d+AF8-0p9: ldo2 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l2d+A=
F8-0p9+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-91200=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-91200=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l3d+AF8-1p8: ldo3 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l3d+A=
F8-1p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     regulators-3 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-qcom,pmc8380-rpmh-regulato=
rs+ACIAOw-
+AD4- +AD4- +-             qcom,pmic-id +AD0- +ACI-e+ACIAOw-
+AD4- +AD4- +-             vdd-l2-supply +AD0- +ADwAJg-vreg+AF8-s1f+AF8-0p7=
+AD4AOw-
+AD4- +AD4- +-             vdd-l3-supply +AD0- +ADwAJg-vreg+AF8-s5j+AF8-1p2=
+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l2e+AF8-0p8: ldo2 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l2e+A=
F8-0p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l3e+AF8-1p2: ldo3 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l3e+A=
F8-1p2+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-12000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-12000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     regulators-4 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-qcom,pmc8380-rpmh-regulato=
rs+ACIAOw-
+AD4- +AD4- +-             qcom,pmic-id +AD0- +ACI-f+ACIAOw-
+AD4- +AD4- +-             vdd-l1-supply +AD0- +ADwAJg-vreg+AF8-s5j+AF8-1p2=
+AD4AOw-
+AD4- +AD4- +-             vdd-l2-supply +AD0- +ADwAJg-vreg+AF8-s5j+AF8-1p2=
+AD4AOw-
+AD4- +AD4- +-             vdd-l3-supply +AD0- +ADwAJg-vreg+AF8-s5j+AF8-1p2=
+AD4AOw-
+AD4- +AD4- +-             vdd-s1-supply +AD0- +ADwAJg-vreg+AF8-vph+AF8-pwr=
+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-s1f+AF8-0p7: smps1 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-s1f+A=
F8-0p7+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-70000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-11000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     regulators-6 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-qcom,pm8550ve-rpmh-regulat=
ors+ACIAOw-
+AD4- +AD4- +-             qcom,pmic-id +AD0- +ACI-i+ACIAOw-
+AD4- +AD4- +-             vdd-l1-supply +AD0- +ADwAJg-vreg+AF8-s4c+AF8-1p8=
+AD4AOw-
+AD4- +AD4- +-             vdd-l2-supply +AD0- +ADwAJg-vreg+AF8-s5j+AF8-1p2=
+AD4AOw-
+AD4- +AD4- +-             vdd-l3-supply +AD0- +ADwAJg-vreg+AF8-s1f+AF8-0p7=
+AD4AOw-
+AD4- +AD4- +-             vdd-s1-supply +AD0- +ADwAJg-vreg+AF8-vph+AF8-pwr=
+AD4AOw-
+AD4- +AD4- +-             vdd-s2-supply +AD0- +ADwAJg-vreg+AF8-vph+AF8-pwr=
+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-s1i+AF8-0p9: smps1 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-s1i+A=
F8-0p9+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-90000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-92000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-s2i+AF8-1p0: smps2 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-s2i+A=
F8-1p0+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-10000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-11000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l1i+AF8-1p8: ldo1 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l1i+A=
F8-1p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-18000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l2i+AF8-1p2: ldo2 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l2i+A=
F8-1p2+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-12000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-12000=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l3i+AF8-0p8: ldo3 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l3i+A=
F8-0p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     regulators-7 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-qcom,pm8550ve-rpmh-regulat=
ors+ACIAOw-
+AD4- +AD4- +-             qcom,pmic-id +AD0- +ACI-j+ACIAOw-
+AD4- +AD4- +-             vdd-l1-supply +AD0- +ADwAJg-vreg+AF8-s1f+AF8-0p7=
+AD4AOw-
+AD4- +AD4- +-             vdd-l2-supply +AD0- +ADwAJg-vreg+AF8-s5j+AF8-1p2=
+AD4AOw-
+AD4- +AD4- +-             vdd-l3-supply +AD0- +ADwAJg-vreg+AF8-s1f+AF8-0p7=
+AD4AOw-
+AD4- +AD4- +-             vdd-s5-supply +AD0- +ADwAJg-vreg+AF8-vph+AF8-pwr=
+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-s5j+AF8-1p2: smps5 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-s5j+A=
F8-1p2+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-12560=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-13040=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l1j+AF8-0p9: ldo1 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l1j+A=
F8-0p9+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-91200=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-91200=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l2j+AF8-1p2: ldo2 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l2j+A=
F8-1p2+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-12560=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-12560=
00+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             vreg+AF8-l3j+AF8-0p8: ldo3 +AHs-
+AD4- +AD4- +-                     regulator-name +AD0- +ACI-vreg+AF8-l3j+A=
F8-0p8+ACIAOw-
+AD4- +AD4- +-                     regulator-min-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-max-microvolt +AD0- +ADw-88000=
0+AD4AOw-
+AD4- +AD4- +-                     regulator-initial-mode +AD0- +ADw-RPMH+A=
F8-REGULATOR+AF8-MODE+AF8-HPM+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-gpu +AHs-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     zap-shader +AHs-
+AD4- +AD4- +-             firmware-name +AD0- +ACI-qcom/x1e80100/dell/trib=
uto/qcdxkmsuc8380.mbn+ACIAOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-i2c0 +AHs-
+AD4- +AD4- +-     clock-frequency +AD0- +ADw-400000+AD4AOw-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     keyboard+AEA-5 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-hid-over-i2c+ACIAOw-
+AD4- +AD4- +-             reg +AD0- +ADw-0x5+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             hid-descr-addr +AD0- +ADw-0x20+AD4AOw-
+AD4- +AD4- +-             interrupts-extended +AD0- +ADwAJg-tlmm 67 IRQ+AF=
8-TYPE+AF8-LEVEL+AF8-LOW+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             pinctrl-0 +AD0- +ADwAJg-kybd+AF8-default+AD4AOw-
+AD4- +AD4- +-             pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             wakeup-source+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-i2c3 +AHs-
+AD4- +AD4- +-     clock-frequency +AD0- +ADw-400000+AD4AOw-
+AD4- +AD4- +-     status +AD0- +ACI-disabled+ACIAOw-
+AD4- +AD4- +-     /+ACo- PS8830 Retimer +AEA-0x8 +ACo-/
+AD4- +AD4- +-     /+ACo- Unknown device +AEA-0x9 +ACo-/
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-i2c5 +AHs-
+AD4- +AD4- +-     clock-frequency +AD0- +ADw-100000+AD4AOw-
+AD4- +AD4- +-     status +AD0- +ACI-disabled+ACIAOw-
+AD4- +AD4- +-     /+ACo- Unknown device +AEA-0x3b +ACo-/
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-i2c7 +AHs-
+AD4- +AD4- +-     clock-frequency +AD0- +ADw-400000+AD4AOw-
+AD4- +AD4- +-     status +AD0- +ACI-disabled+ACIAOw-
+AD4- +AD4- +-     /+ACo- PS8830 Retimer +AEA-0x8 +ACo-/
+AD4- +AD4- +-     /+ACo- Unknown device +AEA-0x9 +ACo-/
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-i2c8 +AHs-
+AD4- +AD4- +-     clock-frequency +AD0- +ADw-400000+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     touchscreen+AEA-0 +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-hid-over-i2c+ACIAOw-
+AD4- +AD4- +-             reg +AD0- +ADw-0x0+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             hid-descr-addr +AD0- +ADw-0x1+AD4AOw-
+AD4- +AD4- +-             interrupts-extended +AD0- +ADwAJg-tlmm 51 IRQ+AF=
8-TYPE+AF8-LEVEL+AF8-LOW+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             pinctrl-0 +AD0- +ADwAJg-ts0+AF8-default+AD4AOw-
+AD4- +AD4- +-             pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-i2c9 +AHs-
+AD4- +AD4- +-     clock-frequency +AD0- +ADw-400000+AD4AOw-
+AD4- +AD4- +-     status +AD0- +ACI-disabled+ACIAOw-
+AD4- +AD4- +-     /+ACo- USB3 retimer device +AEA-0x4f +ACo-/ +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-i2c17 +AHs-
+AD4- +AD4- +-     clock-frequency +AD0- +ADw-400000+AD4AOw-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     touchpad+AEA-2c +AHs-
+AD4- +AD4- +-             compatible +AD0- +ACI-hid-over-i2c+ACIAOw-
+AD4- +AD4- +-             reg +AD0- +ADw-0x2c+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             hid-descr-addr +AD0- +ADw-0x20+AD4AOw-
+AD4- +AD4- +-             interrupts-extended +AD0- +ADwAJg-tlmm 3 IRQ+AF8=
-TYPE+AF8-LEVEL+AF8-LOW+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             pinctrl-0 +AD0- +ADwAJg-tpad+AF8-default+AD4AOw-
+AD4- +AD4- +-             pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             wakeup-source+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-mdss +AHs-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-mdss+AF8-dp3 +AHs-
+AD4- +AD4- +-     compatible +AD0- +ACI-qcom,x1e80100-dp+ACIAOw-
+AD4- +AD4- +-     /delete-property/ +ACM-sound-dai-cells+ADs-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     aux-bus +AHs-
+AD4- +AD4- +-             panel +AHs-
+AD4- +AD4- +-                     /+ACo- 1920x1200 IPS panel is SHP1593, P=
NP09FF compatible +ACo-/
+AD4- +AD4- +-                     compatible +AD0- +ACI-edp-panel+ACIAOw-
+AD4- +AD4- +-                     power-supply +AD0- +ADwAJg-vreg+AF8-edp+=
AF8-3p3+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                     port +AHs-
+AD4- +AD4- +-                             edp+AF8-panel+AF8-in: endpoint +=
AHs-
+AD4- +AD4- +-                                     remote-endpoint +AD0- +A=
DwAJg-mdss+AF8-dp3+AF8-out+AD4AOw-
+AD4- +AD4- +-                             +AH0AOw-
+AD4- +AD4- +-                     +AH0AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     ports +AHs-
+AD4- +AD4- +-             port+AEA-1 +AHs-
+AD4- +AD4- +-                     reg +AD0- +ADw-1+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                     mdss+AF8-dp3+AF8-out: endpoint +AHs-
+AD4- +AD4- +-                             data-lanes +AD0- +ADw-0 1 2 3+AD=
4AOw-
+AD4- +AD4- +-                             link-frequencies +AD0- /bits/ 64
+AD4- +AD4- +- +ADw-1620000000 2700000000 5400000000 8100000000+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-                             remote-endpoint +AD0- +ADwAJg-ed=
p+AF8-panel+AF8-in+AD4AOw-
+AD4- +AD4- +-                     +AH0AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-mdss+AF8-dp3+AF8-phy +AHs-
+AD4- +AD4- +-     vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l3j+AF8-0p8+AD4AO=
w-
+AD4- +AD4- +-     vdda-pll-supply +AD0- +ADwAJg-vreg+AF8-l2j+AF8-1p2+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-pcie4 +AHs-
+AD4- +AD4- +-     perst-gpios +AD0- +ADwAJg-tlmm 146 GPIO+AF8-ACTIVE+AF8-L=
OW+AD4AOw-
+AD4- +AD4- +-     wake-gpios +AD0- +ADwAJg-tlmm 148 GPIO+AF8-ACTIVE+AF8-LO=
W+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     pinctrl-0 +AD0- +ADwAJg-pcie4+AF8-default+AD4AOw-
+AD4- +AD4- +-     pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-pcie4+AF8-phy +AHs-
+AD4- +AD4- +-     vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l3i+AF8-0p8+AD4AO=
w-
+AD4- +AD4- +-     vdda-pll-supply +AD0- +ADwAJg-vreg+AF8-l3e+AF8-1p2+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-pcie6a +AHs-
+AD4- +AD4- +-     perst-gpios +AD0- +ADwAJg-tlmm 152 GPIO+AF8-ACTIVE+AF8-L=
OW+AD4AOw-
+AD4- +AD4- +-     wake-gpios +AD0- +ADwAJg-tlmm 154 GPIO+AF8-ACTIVE+AF8-LO=
W+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     vddpe-3v3-supply +AD0- +ADwAJg-vreg+AF8-nvme+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     pinctrl-0 +AD0- +ADwAJg-pcie6a+AF8-default+AD4AOw-
+AD4- +AD4- +-     pinctrl-names +AD0- +ACI-default+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-pcie6a+AF8-phy +AHs-
+AD4- +AD4- +-     vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l1d+AF8-0p8+AD4AO=
w-
+AD4- +AD4- +-     vdda-pll-supply +AD0- +ADwAJg-vreg+AF8-l2j+AF8-1p2+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-qupv3+AF8-0 +AHs-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-qupv3+AF8-1 +AHs-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-qupv3+AF8-2 +AHs-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-remoteproc+AF8-adsp +AHs-
+AD4- +AD4- +-     firmware-name +AD0- +ACI-qcom/x1e80100/dell/tributo/qcad=
sp8380.mbn+ACI-,
+AD4- +AD4- +-                     +ACI-qcom/x1e80100/dell/tributo/adsp+AF8=
-dtbs.elf+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-remoteproc+AF8-cdsp +AHs-
+AD4- +AD4- +-     firmware-name +AD0- +ACI-qcom/x1e80100/dell/tributo/qccd=
sp8380.mbn+ACI-,
+AD4- +AD4- +-                     +ACI-qcom/x1e80100/dell/tributo/cdsp+AF8=
-dtbs.elf+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-smb2360+AF8-0+AF8-eusb2+AF8-repeater +AHs-
+AD4- +AD4- +-     vdd18-supply +AD0- +ADwAJg-vreg+AF8-l3d+AF8-1p8+AD4AOw-
+AD4- +AD4- +-     vdd3-supply +AD0- +ADwAJg-vreg+AF8-l2b+AF8-3p0+AD4AOw- +=
AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-smb2360+AF8-1+AF8-eusb2+AF8-repeater +AHs-
+AD4- +AD4- +-     vdd18-supply +AD0- +ADwAJg-vreg+AF8-l3d+AF8-1p8+AD4AOw-
+AD4- +AD4- +-     vdd3-supply +AD0- +ADwAJg-vreg+AF8-l14b+AF8-3p0+AD4AOw- =
+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-tlmm +AHs-
+AD4- +AD4- +-     gpio-reserved-ranges +AD0- +ADw-44 4+AD4-,  /+ACo- SPI11=
 (TPM) +ACo-/
+AD4- +AD4- +-                            +ADw-76 4+AD4-,  /+ACo- SPI19 (TZ=
 Protected) +ACo-/
+AD4- +AD4- +-                            +ADw-238 1+AD4AOw- /+ACo- UFS Res=
et +ACo-/
+AD4- +AD4- +-
+AD4- +AD4- +-     cam+AF8-indicator+AF8-en: cam-indicator-en-state +AHs-
+AD4- +AD4- +-             pins +AD0- +ACI-gpio110+ACIAOw-
+AD4- +AD4- +-             function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-             drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-             bias-disable+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     edp+AF8-reg+AF8-en: edp-reg-en-state +AHs-
+AD4- +AD4- +-             pins +AD0- +ACI-gpio70+ACIAOw-
+AD4- +AD4- +-             function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-             drive-strength +AD0- +ADw-16+AD4AOw-
+AD4- +AD4- +-             bias-disable+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     hall+AF8-int+AF8-n+AF8-default: hall-int-n-state +AHs-
+AD4- +AD4- +-             pins +AD0- +ACI-gpio92+ACIAOw-
+AD4- +AD4- +-             function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             bias-disable+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     kybd+AF8-default: kybd-default-state +AHs-
+AD4- +AD4- +-             pins +AD0- +ACI-gpio67+ACIAOw-
+AD4- +AD4- +-             function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-             bias-pull-up+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     nvme+AF8-reg+AF8-en: nvme-reg-en-state +AHs-
+AD4- +AD4- +-             pins +AD0- +ACI-gpio18+ACIAOw-
+AD4- +AD4- +-             function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-             drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-             bias-disable+ADs-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     pcie4+AF8-default: pcie4-default-state +AHs-
+AD4- +AD4- +-             clkreq-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio147+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-pcie4+AF8-clk+ACIAOw=
-
+AD4- +AD4- +-                     drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-                     bias-pull-up+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             perst-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio146+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-                     bias-disable+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             wake-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio148+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-                     bias-pull-up+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     pcie6a+AF8-default: pcie6a-default-state +AHs-
+AD4- +AD4- +-             clkreq-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio153+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-pcie6a+AF8-clk+ACIAO=
w-
+AD4- +AD4- +-                     drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-                     bias-pull-up+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             perst-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio152+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-                     bias-disable+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             wake-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio154+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-                     bias-pull-up+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     tpad+AF8-default: tpad-default-state +AHs-
+AD4- +AD4- +-             disable-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio38+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     output-high+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             int-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio3+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     bias-pull-up+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             reset-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio52+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     bias-disable+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     ts0+AF8-default: ts0-default-state +AHs-
+AD4- +AD4- +-             disable-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio75+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     output-high+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             int-n-pins +AHs-
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio51+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     bias-pull-up+ADs-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-             reset-n-pins +AHs-
+AD4- +AD4- +-                     /+ACo- Technically should be High-Z inpu=
t +ACo-/
+AD4- +AD4- +-                     pins +AD0- +ACI-gpio48+ACIAOw-
+AD4- +AD4- +-                     function +AD0- +ACI-gpio+ACIAOw-
+AD4- +AD4- +-                     output-low+ADs-
+AD4- +AD4- +-                     drive-strength +AD0- +ADw-2+AD4AOw-
+AD4- +AD4- +-             +AH0AOw-
+AD4- +AD4- +-     +AH0AOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-uart21 +AHs-
+AD4- +AD4- +-     compatible +AD0- +ACI-qcom,geni-debug-uart+ACIAOw-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss0+AF8-hsphy +AHs-
+AD4- +AD4- +-     vdd-supply +AD0- +ADwAJg-vreg+AF8-l3j+AF8-0p8+AD4AOw-
+AD4- +AD4- +-     vdda12-supply +AD0- +ADwAJg-vreg+AF8-l2j+AF8-1p2+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     phys +AD0- +ADwAJg-smb2360+AF8-0+AF8-eusb2+AF8-repeater+=
AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss0+AF8-qmpphy +AHs-
+AD4- +AD4- +-     vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l3e+AF8-1p2+AD4AO=
w-
+AD4- +AD4- +-     vdda-pll-supply +AD0- +ADwAJg-vreg+AF8-l1j+AF8-0p9+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss0 +AHs-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss0+AF8-dwc3 +AHs-
+AD4- +AD4- +-     dr+AF8-mode +AD0- +ACI-host+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss0+AF8-dwc3+AF8-hs +AHs-
+AD4- +AD4- +-     remote-endpoint +AD0- +ADwAJg-pmic+AF8-glink+AF8-ss0+AF8=
-hs+AF8-in+AD4AOw- +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss0+AF8-qmpphy+AF8-out +AHs-
+AD4- +AD4- +-     remote-endpoint +AD0- +ADwAJg-pmic+AF8-glink+AF8-ss0+AF8=
-ss+AF8-in+AD4AOw- +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss1+AF8-hsphy +AHs-
+AD4- +AD4- +-     vdd-supply +AD0- +ADwAJg-vreg+AF8-l3j+AF8-0p8+AD4AOw-
+AD4- +AD4- +-     vdda12-supply +AD0- +ADwAJg-vreg+AF8-l2j+AF8-1p2+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     phys +AD0- +ADwAJg-smb2360+AF8-1+AF8-eusb2+AF8-repeater+=
AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss1+AF8-qmpphy +AHs-
+AD4- +AD4- +-     vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l3e+AF8-1p2+AD4AO=
w-
+AD4- +AD4- +-     vdda-pll-supply +AD0- +ADwAJg-vreg+AF8-l2d+AF8-0p9+AD4AO=
w-
+AD4- +AD4- +-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss1 +AHs-
+AD4- +AD4- +-     status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss1+AF8-dwc3 +AHs-
+AD4- +AD4- +-     dr+AF8-mode +AD0- +ACI-host+ACIAOw-
+AD4- +AD4- +-+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss1+AF8-dwc3+AF8-hs +AHs-
+AD4- +AD4- +-     remote-endpoint +AD0- +ADwAJg-pmic+AF8-glink+AF8-ss1+AF8=
-hs+AF8-in+AD4AOw- +AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-+ACY-usb+AF8-1+AF8-ss1+AF8-qmpphy+AF8-out +AHs-
+AD4- +AD4- +-     remote-endpoint +AD0- +ADwAJg-pmic+AF8-glink+AF8-ss1+AF8=
-ss+AF8-in+AD4AOw- +AH0AOw-
+AD4-

