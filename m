Return-Path: <linux-arm-msm+bounces-29524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A551A95FE4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E772FB216ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9CD748F;
	Tue, 27 Aug 2024 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QwjeqH6/";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d86Ipfh+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MAmLTMNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C13AB674;
	Tue, 27 Aug 2024 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724722384; cv=fail; b=dlBHohaqfeq465qQEPcScRqB1tNBjBCBT1vQkpYlfnaf1YwBaVLxofBbnDlsRcoDPP3Ws7AG22kiTuk+D5r/rK+TW8S85j7EOmUQMtL94nb274HbQgpWWU2Vn7CJIaGJ3AxtvJwfZRDOVYGcDQvw4/b1i0EYp3+YBpav3lzrAV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724722384; c=relaxed/simple;
	bh=mUgTEdcVNe4BMPiae6XIOLNWzcVaYbSNwoJfG+1aLEc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IxSLWFENBcNkIJBzWdE/KZboIGiUJorY0+b0TCPkgT81aEpr8jOCHGvLtbQDHMlUZQ3IPKbv5UoJAO4XwjBEUtomuWxo+P4H4Wwu3FYCtdI710tOyqj8LNatKT1xWu6AZjfwUdDz18VMilkKk6wx5gIQ57ZG/9fDMlRob/RahKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QwjeqH6/; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=d86Ipfh+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MAmLTMNk reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQIuJ003033;
	Mon, 26 Aug 2024 18:32:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mUgTEdcVNe4BMPiae6XIOLNWzcVaYbSNwoJfG+1aLEc=; b=
	QwjeqH6/Dr9vN3PAhjIqRwrn67ejQA2kZP2lK1YPNNbvHnmE14e2CMPCO4OZeL9w
	zuy3A0Ow3SUBSzDDjOIfSzmtB3dckNtn0hcEH+e8qEJmNeZnP/aXOOZq7pTCOsAh
	/Suo5cms7xENZUCZ7NgOsFrKwiU4OO1Bs4Tdc8esr3yo3v+/0pStwT8/0jpodpYJ
	ImrNm5EMoM1QHEFaF6oIYaGHhqOFnud8vznKubH7WNf/60y/giCfgTxmGzK/hhv6
	BhWE9HcqE7cT67eJ9FfSfBN/Hr97WQLmbv9R5ACxXvyJBkfb+hRc8AGFb4fQ2lpn
	3ES+dXzf35OGXZBbdor64w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417eevjm1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724722364; bh=mUgTEdcVNe4BMPiae6XIOLNWzcVaYbSNwoJfG+1aLEc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=d86Ipfh+NuKR1y0UG5yK98IqKmFxnkW1/0A+EpIFEK9WdmW2raWnAC9uCiFEYud2f
	 S2b205nPAzakNPaQd25z3Q3FeQ7Ki9XEjJzMQI6qXvA4wOb/s2IvGqE4DPoDi0aQeA
	 kHDvrnQ1WQpYyECY21193M6CE+bLmtbbynHQXTviztb3IDo3VZEF5CkaSkWq3+YOs/
	 j7kRvBjVeco1dCrcs0JHywSpULYXHXwEnUU1wwVcT7SJ4y7LHFBSvQIyFnqW4Wuf6w
	 DBIa7f4I5I62RgbTuvTb1g5ZAw/SrombxcFY0xel0SoULmsy1OZfoLztZMJyxevN48
	 w6popiuL9lVbw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7D3D04034A;
	Tue, 27 Aug 2024 01:32:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B8605A007C;
	Tue, 27 Aug 2024 01:32:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MAmLTMNk;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7F1124044C;
	Tue, 27 Aug 2024 01:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLfk3oI1WR488yRGwARo2VWCQtpm8PhOtiJ7QwzucHAZfqfLsHy3RbuN64w5gNxynQcl6gvJZs78tHX7fP8t92Ps+GZnfmF6CeStAdAowFiPhJI+o2pkOrrw8r+F7xmc2nf6608NUbR9g5t2AgGAEDdGt5C3tsMS9zHT7Y6eD1zN8t7i/lgil4QsuRu0+CPEnpcHXdnyMLmD/xpsA2C1YziooMYRnuz7UtHi82Z6fuHsMVd56ByBarMFcunURR2QjLKlDr8mkpz1hGeriMBlykXj4hi0uPHM1v9NjLzY+swU9jV1RpcxSKInDet8RKaDspFig1bI/nUF0jSLHUCjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUgTEdcVNe4BMPiae6XIOLNWzcVaYbSNwoJfG+1aLEc=;
 b=Dvhsk8eTnau2sSWVnjcpv+4SfzS6Egbn7jBavwWJ2lzWePvLrHnckbnAobpOG0xIrZHqEO8xrAOoHTj5RM3u03hawvl9fV7VMrFlxR6yix6hoKTp+b+IYz4HF5eWpNjxOINiZVm3I6Kry236OsAjaBoGMQT7vY7z0SL4zmiZnYrWAx3RnzVvjBPTZpjBiwdj/31PdIrXKIEYoLitvfZwPtfJwUytXUE6aUwGiLBJ6EYrYXsaptIPk6MilcOvucxguvcxj7ZhR83XUjQ7LCFeSJuUXuCYCzPxoEP00mN0pFqt1rw+mc6B3RTyziaIjoGWg9Z8Vhok8OOuJ992y8hhUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUgTEdcVNe4BMPiae6XIOLNWzcVaYbSNwoJfG+1aLEc=;
 b=MAmLTMNk2UQqoYsRbS5Pde4NRLIrqjxOejZnzvkN9WDbu44EHkDClYfBXXoa7FeiOg7BeiUoGr9rAqafC/x9xO/Bj4y7DvD5GIoDr/Hnmnr7OHGhQsWG/0CkN11rVGnLNSp6FNveybAw3n9S/cefvohgRdEEkL3oqXj5ydg4ZA0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 01:32:38 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:32:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Patrice Chotard <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 07/11] usb: dwc3: qcom: use scoped device node handling to
 simplify error paths
Thread-Topic: [PATCH 07/11] usb: dwc3: qcom: use scoped device node handling
 to simplify error paths
Thread-Index: AQHa7jXKXJzdiXVY5EyVajaa6jwNWLI6ZZGA
Date: Tue, 27 Aug 2024 01:32:38 +0000
Message-ID: <20240827013235.qycityf2yihgwwkx@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-7-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-7-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6948:EE_
x-ms-office365-filtering-correlation-id: 90a42985-2ce2-40d1-e783-08dcc63822f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eGdzREpMUHhHMGtvQXFJRTdEbXFMcTY0b3Q0UGFYeWl6YlNoaWw1TStrY29V?=
 =?utf-8?B?R2hvTS8wbkdaZ29GdC9UaFN0cW0wSVltUzdINGNrdXlZNkxNcy9KcFBiK01p?=
 =?utf-8?B?QTQrRUNzTGdqSjdmd1FyWE5DV1poS3JwZm1DN3pxQ3hBd3JmeVYvYTBJeWVm?=
 =?utf-8?B?VmxmZE5USFVEQUJNQ0R2SEVqZlZEN1ltVVd5OVI1eWNVN0s3MmtpYXZSNVZa?=
 =?utf-8?B?eTJmREs4WGxRR1craGVsdDJaMmVEZ1lMUTQ4V0tpZU9naWp3OWxHbGJwL01E?=
 =?utf-8?B?OXFlR0hQQjBWdUNBeTBUWnlJZFdTY0ZQMXhLdEo0YzM4N0JTNkdpMGFTRWlv?=
 =?utf-8?B?WlVldjNsRlBKVU9NeUduYXBqUSt4bVRYWGZvRmlrYzV6RTJjQWhJZ3c1Wk9t?=
 =?utf-8?B?SjNuaS9Ra21sVXp5UU5iVzI5NFdVWHAxby9VY2hDbjUzMUZkdS83TWR4WWVp?=
 =?utf-8?B?OTBDYTdxRUlYR2NSZGxQNlBxRU14eVBrQVMzaTZMMm4rSGtrZmtUenJlMU1i?=
 =?utf-8?B?MzI1Y2JtdkhXRXhiQ2RDTUw5d1FIVGFJZnNKdE9wTmZoVFRSSFRMQzNkdGdE?=
 =?utf-8?B?WVBSRXFrcCtvNWxzNU5hV0xMeXNjTHdiNGlGQWIvbldNK1JSOGdBNXpvTkdP?=
 =?utf-8?B?bUtxaXNJTDYya3BsZXVIZnFCS1pYaitXZWZYOWo5eHpMQjBxVW9pWjBUbHpz?=
 =?utf-8?B?VUQxb0ZzYkpFNVJWRFpZMnljSm9PSWFydVBUdzJDOXBHRkxzcW1WdEE1RjE3?=
 =?utf-8?B?YitoWkMxeEQzVnNyTm9uSll0Z2JzVG01YmtoY2ZBZmpkRjlOdTY1bUQvci92?=
 =?utf-8?B?blVhUDZveU5PT3BFOFNEdlBOaVUwZlJrRkNkMGhUY1MrQlVkVjg4R1pMd3hS?=
 =?utf-8?B?RlQ5VFRBb2pEWmR4eENtcXVaS3FFQ3RoemM3R2dMNjNtMFQrRUo1U1oyVFl1?=
 =?utf-8?B?TDc3YllkM2x5aHRlV2ZsWktiUFBIaXBkUGdNNGxCNlkwaC85VTZZY280VzEr?=
 =?utf-8?B?T0tGemNYR0JUUTUzK3MwSUpyNzliMllOSStDbXBBRzRXYXdUOFM5RkJMNi9F?=
 =?utf-8?B?OU8vRHd0MlN1UmNYYVJTUkR4MkJTUFY0T3liSjJZa3NIQ1NrUUpTb3ZyMmFR?=
 =?utf-8?B?bktLV0E1OVlLellETFBIMDdnc3o0U1NlVysyanN0R2orc09NZngyY0RoREpT?=
 =?utf-8?B?WVBsSGE3M2xWZ3lsY0dQNzRlZWVMbTZwZHZ0c2tlTjI2N2JPKzVjRFlYQTNm?=
 =?utf-8?B?NzNzcGRxcGw0VnRKdXg4dmNBNVZSUzR4YTRwQXppZGZpbk9BbHdUTmVNNUsv?=
 =?utf-8?B?YW94eWYzVEdUUzdPcE9FTXdLeUp2VEhMZk53VU55OXpZVytXcktMbzJzY1NB?=
 =?utf-8?B?VEtQaUJFZERMZDM0Z1M4cjNIejRSb2xZK2luczZhMnVVTkhGNkxGSEJzT1dq?=
 =?utf-8?B?K1ZDVGVNOUcvVmpuLzN4amtUSm5HRVhDUUJoUnc3RVNycTBUZGRpTzh2R0lN?=
 =?utf-8?B?N2FOeFpnZVo3T1NXb3p4L1hhd2UzVFh4MWJGallzTnRSL2dMOWdhY01IOUlQ?=
 =?utf-8?B?SlY0ZEI0cFJFWWQzV0xQeTJuMXpBbm1oR2VtVFUxK3hQV0VmZXlVR2ZGcDdG?=
 =?utf-8?B?dm52dDlROGtSU3lPMU1NSWZMUUtwMFVsY1VrZU9udVRQSWFHRVZvOTd1TlZU?=
 =?utf-8?B?SjJVejJGUXE4cHZ4MDBDZmk4NXA1OVdiTmdENmt1Y0RYR0dnTktRbGhKYldl?=
 =?utf-8?B?NXNNSTd2aDlpVlJpbjlUaE50cE9wZGIxTTVJaG1uQmpBMW9ndlpHbDhZakFy?=
 =?utf-8?B?ZWpNTnRpcVJyN013TVdwL0JQWWRreWJUVk05SnZCTmpXci9hbnNIUTdySUZD?=
 =?utf-8?B?a3NHcnBYNzJxK2ljWmVsMHdjK1hOTEdweGIwUVl1MldCQWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTdjNHJNa2VtVC9SeS9TeVBkcFFSQVU2cE1vVHJBaTJUQ0dqeUlUSVF3U1Er?=
 =?utf-8?B?aGR0WXorWGk4MFJrc2FmdkZQbVZHWGlQUmd3S1ZhdlJBaTJlZlFyY3dsSkVz?=
 =?utf-8?B?LzVjUXl3YmxwYmtPeXp3ZThxTzRjL282M2M4bUZzT0lHeU95ZW1QVWJ0akR2?=
 =?utf-8?B?UlBiQm9WWCsyTzlkRUw5MXlGeDJYTjRCbGJzMVNhVm1TcEM4M0hwbTRrSWRH?=
 =?utf-8?B?TkxHd0FzdE85ZXE0YUFXMW9iWHk4MDF0RittYml3R0t1S0kzY1VxSmFVYjNs?=
 =?utf-8?B?SjNqNmR3NTExaXhzL1FiWWN6ajNmVFE5eDh1SHdpcU5lOHBzQmpFWjhKTHVY?=
 =?utf-8?B?RmMzazV1N2tMak5JaVF0WVFoVy9FSlMvUWVPWk9HMExGTHRtREJYaHdvQmFR?=
 =?utf-8?B?UDFKL1VvdElsclZ0d01jbnFxUEY0WTRBOWpYTnduakV4TlNaeU52QTV5aWxz?=
 =?utf-8?B?empoMUt1YTREZUgwWm5pMytlR21NdnNnQVB3UTRtSGJUOWIwYkZYZWwrVFRl?=
 =?utf-8?B?OG9Wa0lua3JlTnhNWTNqQllkZ0FqTGt5ekphNWc1SisyRVZqQ1kvTEFwRWp1?=
 =?utf-8?B?S3E2MlJIdGttK1V2OWEwR3h5V1F1L3p0Y2NRa0UrS0t1Y1NTNUxTMHdXVFNG?=
 =?utf-8?B?VmpYNUFSYlJyWDJBUnMzaDZJVHlURWVDSENXbG1XcW1UOHhGWE56WlFXczRw?=
 =?utf-8?B?ZjJGbi9majlhR2YyeGxCSzFjTDVLaGszcEVacjNocno4Vm5LWU52dEJkb3ZC?=
 =?utf-8?B?b20rVG9Oay9RMXBpRWRGMTRoVjgwSHMvK2IvK25oRTQxOWQvSjlVd25PVGRI?=
 =?utf-8?B?ZW9JL1dvUEdBdSs5OUpBczR6WGNrZUdnMkxvQ3J2TTZHaTIvcFhhZFhYYmRl?=
 =?utf-8?B?WmJKZXBZc3UzUTQzWXZtaVlraXQ3anFsRERrNGFlR2VSQWU3SVNuWHVMQnNt?=
 =?utf-8?B?dHhDcXc4VnluaVdiZG9QYTYxQmdLN1h0cUJwUXoveTRRL0sxRlhxdGx2eVJF?=
 =?utf-8?B?eU9lNFM0Q3NiVUE0SHVjNjJhOE5NTm41bU5rVEZrR2I5UVVyM0dEcEdQdXpO?=
 =?utf-8?B?VlVhSVpKUnpXTHo3K0VBZEFOZUhIVFZ1V3JaWnVrQVhCSSs4cXFkVWdXc2lE?=
 =?utf-8?B?aWpjczBOdWdoOHNON1hINmZudjdYd0JrTVNNdmJRYktZeXpsYWp3YWIrZm1W?=
 =?utf-8?B?WlVncVdNVzNZRGdWYkhLbXd2N0pTWFZUdlhXYUQyTW82Mmg4Qmh6cnloOHBE?=
 =?utf-8?B?Z0s3T2ZxdkdmS29SMUROL3VsWHN2VEw1YmlZOGVPRVV2UDN5NGVsbGliQkZo?=
 =?utf-8?B?SEpNakkrOVBWTmlWcG1rZDJYR3JwNkxTTEF2K1h6ejRLMXVXbVVTT21mUVZx?=
 =?utf-8?B?QkxxamN2N2NvU1Bpd3Jic1hvaVF1ZWg4anBBS3RMMWxBbktuUVpRM2hvWE5S?=
 =?utf-8?B?M0JaL0N1KzhpNWc4UWQzRDkvSldGSStMeHc4OElEUGxFQUFWZmlVUG1ST0Zz?=
 =?utf-8?B?VXNpMXU5VGYwT3h4RURabjhjcGo1UGVzM1NkTHRhODZUdmtsazVtVk5ZSU8v?=
 =?utf-8?B?amtXd0JtMkJLVVJxNkhaMU9OWHVuZEpMTnpOV0Y3RjdzU0lrL2pkNncvMDc2?=
 =?utf-8?B?RjZ5Qlh2bWtvNTNnazhFSVBka2h3cVFDREoyNHNSVlZhUHJqTEdPTWs5cnBa?=
 =?utf-8?B?U2J0eWVYMmRLT0RmREMyWHMxR2daeTJXdXlwTGNlL0NOMHB5dCtoaEtvWGF0?=
 =?utf-8?B?c3Bwa3ZpbzdocDRUd2xIZTlzaHVaQUszREdDaHRnd0RQaEtDVFJlYk5qQmla?=
 =?utf-8?B?U0FCZXJzUU9xRjJpSWN5Tnk5NjJkSy92bVQ2WGxPK251YmhKWVlhZEtMK0lu?=
 =?utf-8?B?ZzZydTBmdVdiZVVqS2QwakJFd0l5WEVLc1JPZkpXM3QwbzJJSW5Bei9aUW8x?=
 =?utf-8?B?MjNyNksvNFJrRUwrZlZ3ZUZ0cEFYNUp4VHJMWmtxU2IxTUU0cmpjR3RFczEr?=
 =?utf-8?B?Zmpibk9iZEIrNDBzN2JwY1I3SzVzb2J6V3VSK2t3RG1pMUc0a05tYldPT0Mw?=
 =?utf-8?B?NFpHMm82bzlvNWI2T2JYekJicUlUbXNJTDhmalhwbFlTS01jcTZ0cTlmbHht?=
 =?utf-8?Q?RzdtFUCovRstNS0R1ENtQUIwA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <893B38E19197364C84DBF65D29C62226@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wG5bIHjKhhW0O6w6H96zr5NO/1BHepAh9jGFlhkr0c82oz1bJkEMkjBY/ZyTXZlastNBI39q8C5ozigLOfUMlNS2wI/5vDb5ppnFQcM+CrXtJjGnDXtb7IlxnnC1ouIvhdn8XbdU4xDqRmTtEEuEfSfGqtQ+OtlxVsfrIeh4AfBNSZ5ETWbW8hPoPCVcKHwLX8WvVn+1SPibtfJoeaGzpUW8+j4kKxbw3nBuTBF+mcPLLbHbnlu9c04GWt6NQE+K13grLdGLXjvw9m6QPEsxrr2ZsMJd3x5wyUJ20ZCQe1Hw+bb9g/3x5GTuf6Iswy9DMQvnmG3vWZAKTRBwjwCKwE+4CyrO3K3ygFc8J4MtNU4T6DO6uZdQgHPOwZBNHFJg4QtIndDGGDybUdos5MSx+Raee/rfb6Ywl8L8U+OF9sbld8IBN1a7GcbeLbPRJI4kVP1Y6bVst8fYYzGnSC6Vr4G/Fr7rwanc3DrfvGq439mUuUeKwqpFlpRhe5yFHnRF9yhANdB2iemy2KnrZpLVksA4tPFf9JWwBODtWTi53pkNAW2C01veylorE6d0rOMRZh8g4QihW4rmhoivZoMci7wlkHug4RXUWLKDGsgMpEgz+Lb87EZSR0v5+6gePOTjv5zktrBndvvTDKAhOGg9+A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a42985-2ce2-40d1-e783-08dcc63822f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:32:38.6448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3vtpiMoPN8G9NIguLs9AFQUAvVITGJk62qvk5arC8DFd8IZGEDjlD2Yvyj9ecMa2w20slJuCqEsSG8SCcIn8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948
X-Proofpoint-GUID: L20O0jzHG4P_oj3bv06Mrsdtknt_JiQn
X-Authority-Analysis: v=2.4 cv=Se6ldeRu c=1 sm=1 tr=0 ts=66cd2cbd cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=r6mq7VnVTGTUi1Fv46IA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: L20O0jzHG4P_oj3bv06Mrsdtknt_JiQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270010

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9idGFp
biB0aGUgZGV2aWNlIG5vZGUgcmVmZXJlbmNlIHdpdGggc2NvcGVkL2NsZWFudXAuaCB0byByZWR1
Y2UgZXJyb3INCj4gaGFuZGxpbmcgYW5kIG1ha2UgdGhlIGNvZGUgYSBiaXQgc2ltcGxlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIHwg
MTEgKysrKystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20u
YyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gaW5kZXggODhmYjY3MDZhMThkLi4w
M2E4ZjA4MDA3OGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMN
Cj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiBAQCAtNCw2ICs0LDcgQEAN
Cj4gICAqIEluc3BpcmVkIGJ5IGR3YzMtb2Ytc2ltcGxlLmMNCj4gICAqLw0KPiAgDQo+ICsjaW5j
bHVkZSA8bGludXgvY2xlYW51cC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ICAjaW5j
bHVkZSA8bGludXgvb2YuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gQEAgLTcwMiwx
MSArNzAzLDEyIEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX2Nsa19pbml0KHN0cnVjdCBkd2MzX3Fj
b20gKnFjb20sIGludCBjb3VudCkNCj4gIHN0YXRpYyBpbnQgZHdjM19xY29tX29mX3JlZ2lzdGVy
X2NvcmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZHdj
M19xY29tCSpxY29tID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+IC0Jc3RydWN0IGRl
dmljZV9ub2RlCSpucCA9IHBkZXYtPmRldi5vZl9ub2RlLCAqZHdjM19ucDsNCj4gKwlzdHJ1Y3Qg
ZGV2aWNlX25vZGUJKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ICAJc3RydWN0IGRldmljZQkJ
KmRldiA9ICZwZGV2LT5kZXY7DQo+ICAJaW50CQkJcmV0Ow0KPiAgDQo+IC0JZHdjM19ucCA9IG9m
X2dldF9jb21wYXRpYmxlX2NoaWxkKG5wLCAic25wcyxkd2MzIik7DQo+ICsJc3RydWN0IGRldmlj
ZV9ub2RlICpkd2MzX25wIF9fZnJlZShkZXZpY2Vfbm9kZSkgPSBvZl9nZXRfY29tcGF0aWJsZV9j
aGlsZChucCwNCj4gKwkJCQkJCQkJCQkgICJzbnBzLGR3YzMiKTsNCj4gIAlpZiAoIWR3YzNfbnAp
IHsNCj4gIAkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZmluZCBkd2MzIGNvcmUgY2hpbGRcbiIp
Ow0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gQEAgLTcxNSw3ICs3MTcsNyBAQCBzdGF0aWMgaW50
IGR3YzNfcWNvbV9vZl9yZWdpc3Rlcl9jb3JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICAJcmV0ID0gb2ZfcGxhdGZvcm1fcG9wdWxhdGUobnAsIE5VTEwsIE5VTEwsIGRldik7DQo+
ICAJaWYgKHJldCkgew0KPiAgCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBkd2Mz
IGNvcmUgLSAlZFxuIiwgcmV0KTsNCj4gLQkJZ290byBub2RlX3B1dDsNCj4gKwkJcmV0dXJuIHJl
dDsNCj4gIAl9DQo+ICANCj4gIAlxY29tLT5kd2MzID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShk
d2MzX25wKTsNCj4gQEAgLTcyNSw5ICs3MjcsNiBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9vZl9y
ZWdpc3Rlcl9jb3JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCW9mX3BsYXRm
b3JtX2RlcG9wdWxhdGUoZGV2KTsNCj4gIAl9DQo+ICANCj4gLW5vZGVfcHV0Og0KPiAtCW9mX25v
ZGVfcHV0KGR3YzNfbnApOw0KPiAtDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiANCj4g
LS0gDQo+IDIuNDMuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVu
QHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

