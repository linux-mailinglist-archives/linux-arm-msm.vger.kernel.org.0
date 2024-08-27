Return-Path: <linux-arm-msm+bounces-29523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EA795FE4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22439B208C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB8D322E;
	Tue, 27 Aug 2024 01:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MjBss1Oq";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DLNkXkm7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="c1EMwsPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B34C1FDA;
	Tue, 27 Aug 2024 01:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724722261; cv=fail; b=sjwwOciYTdFVJ7aGiosjniarPInwDQzrjR76fAEaWccYDRRv1nYRrbtTMc3/YIZuN0lSdI6ebAvHtKCNOFYWqaiwIlz9qg98kdrAA6+eziONZhjlNB7BQw7c00DDmuQc7xBkQ8zyHiMdFOX/rTZ8VE73gbBhRMUp9zIGlM4prZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724722261; c=relaxed/simple;
	bh=vmVu+6kU67YPFluBvx3Et6WN6b2DaJtVDwcYkyFPzOI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uqzT8BfTUtGUYXH8Cfob++luWtmhFsUXIFTxmFNjBqrEmvf4s00NeTijkyQ7RcKb8ONMrxxmJJnzxgWnl0IhQEWb2LhHSxFOAnzmwQr0/oS6+/gLH23xfRrVoFDS6pwWjrn+c04JzpbOeVZ2WfBuRs/sKB7CMcVDgj7B7eXSW4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MjBss1Oq; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DLNkXkm7; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=c1EMwsPK reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQIu9003033;
	Mon, 26 Aug 2024 18:30:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vmVu+6kU67YPFluBvx3Et6WN6b2DaJtVDwcYkyFPzOI=; b=
	MjBss1Oq9C/6t/jVT/1iMekRvhOAVMxr+jpHt9xu4f+HztSyALXPAEiKjPVZT5ua
	Zk6dc5ESq/cb3pnGN/hdQY+YJVwU4/DPfSKn+T4OKkcMkrBCoQfpizum0p7OhXi3
	Bn3RK8H/bbCQgantRAhCFNXFIClx6Vc8DBHZrn51/56MZzIh0Pt6CoqVUKv6/3Fc
	XrNs6lQ/eJACN6XeFIKRYOAMsztKRtKLWb2qAYVC/UftkyLQAMLceG+h8dBJDW1P
	lG2hz2mC//CZCdHxIIiIZlF4N2bdlKmjfjvRuPbXrg/h7yCGCig8n58A/6yk2MIc
	1Wi4L0L2WFn3KDH9VKeQEQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417eevjkuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724722241; bh=vmVu+6kU67YPFluBvx3Et6WN6b2DaJtVDwcYkyFPzOI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DLNkXkm7jbhnRWC1mV/Hk307Rzqgzc4WHVMq0J/XjQjxlVQZGxNT9FGLvFyODPEL0
	 mdHGlJj1eEVqyKklvYNcvJ97YFLDeYT/9FWRcyJH3VNg7ozKyGEkkxDZZNtLn4/Io3
	 UnrDE1K9BV2NgsHpiNHbnqkOl4wcTqKTUyNZ0AfRv0ekDanvtLWu456Dd9Q+dtCdR4
	 ZWMzsZFpnVBldLUMOzLq28CsJlUoYQnjNKJhCCmJnSKVl8ChB2ghCR9B14qe1kzSZC
	 tau+SWB/CyyZhNwFAteYtgdb+bQYyNzrR/hnp/OOARlPCw8jpq65B0dzcu8SsVnvew
	 fHlkf7OdEYpVw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CDE4D40130;
	Tue, 27 Aug 2024 01:30:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 257FDA0095;
	Tue, 27 Aug 2024 01:30:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=c1EMwsPK;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CEA28404B0;
	Tue, 27 Aug 2024 01:30:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2Z61N1YUmMoLlz+vkiQm6cECnMfrvjYMwfWS2z1MiGCulEUk+oCBeimM9zqy1/Ki/MTLwNkAS0zC3w1G6HtABhr+NSELKrqiuvQS8YvDT4Miv8V1vocziJyCv0t4u8kJUap+oM5YzLKjaEzuyIRaFzCL1zgmzoW9Wv4WCKO5sguCFS1oMFra8yYfsBgbtLuatWs+MbfSoZM1pSQPU3ATNSWzE/nZole/f/bfY+N3NxbgyWHsIYz/58Sc8vXxYwMt7i20iSMUezGoj7c76VHQw8JwOj1lte2cew2Db13Tv9i6vH0kcQf5tCa7aHA6W25iEOQlkCM0gyFldTszgQyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmVu+6kU67YPFluBvx3Et6WN6b2DaJtVDwcYkyFPzOI=;
 b=jYjjfzuCJf19TMlEfacJkBvFMRoOdaGCaWc0zyXfEc+AGkcgkkywQlYOH6pAYLJ6hdnBjfDbvtb4ZRxsUpgyDtlCD4KOB+djoFYvACUI8IGsolJesQ5ovBq/21eCcF8nAL+9AH6iMUpl6SpaUCZPyrqe1NcnxdhxGg/ZjAHfU/9PSvZx11Qw9YuIJEtNVKgnOaOlOHV7lBv6ECjXgp3LnwHz95aBD7POjRfH0ikdk126cjknT7Yr9XxsrxrLXH5T+gIaEEmnR5p3kYWhVMR7UUvpv0IIaQDUYckQJKzPIOwiLYV5H9qbfMBgENRzgNf9CE+fMlxkhivha75oyZMGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmVu+6kU67YPFluBvx3Et6WN6b2DaJtVDwcYkyFPzOI=;
 b=c1EMwsPKOGlSFF1C3HWka/RnUOQ4o7AV/k5H8PpvWqgIq7dw0Cf+TdsU5pZZfZUYn9/rQmePCuqq+bK0s6+wyUhHQJtBaVXvyDvzrtSMZXmUUb4IF/4+jZjEIDjC7la9dPeHWFHxSsQvaFSH+9S3Q6CJF268F1emKnzDBi0l6FM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 01:30:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:30:31 +0000
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
Subject: Re: [PATCH 06/11] usb: dwc3: imx8mp: use scoped device node handling
 to simplify error paths
Thread-Topic: [PATCH 06/11] usb: dwc3: imx8mp: use scoped device node handling
 to simplify error paths
Thread-Index: AQHa7jXL8WxPrmbiPUic+gi+vvfkl7I6ZPkA
Date: Tue, 27 Aug 2024 01:30:31 +0000
Message-ID: <20240827013028.dtq6twc3ze7r37ch@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-6-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-6-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6948:EE_
x-ms-office365-filtering-correlation-id: 5b075c25-2d48-43e1-89b2-08dcc637d76f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1J2b21HaTFTNFZycEh3YjRCNDN1T0ZvYWp1U3VXYzYwUllJWm02MXhBc0VH?=
 =?utf-8?B?ek5IendGelpMMnkwVHdsTTZEQk8rR2JTQmZ0SEwvV01wQXBWR2JENTVvRi91?=
 =?utf-8?B?WEkzb2M0dXhIZHpBNDg3ZlBRSWdSY29CM0QweE5nOHBZL0hQZUpNNXVKYVhL?=
 =?utf-8?B?M0dOWjY3T1dDWEZZNm0rYmsrYWgyQ1Q5MXVCMTNQQVpQOUtmUmJ2cms2dlZL?=
 =?utf-8?B?aW50MUJVR1VMY0YwVUN2QkJ0amVBdDJaU3FPcS9admZUNlFUWnRNNDhLeXQz?=
 =?utf-8?B?cHJFVmpXdmVHOC9tV0w2QVZCTXR6dU16cmE4MUJrbXNRcGlTRWttaUdoVE55?=
 =?utf-8?B?bUU3SzhQQ0t2WjI0bFZicTF0U0VyeC9XbkpXRnpJc0xDWVlyZEVJS2ZzQnpi?=
 =?utf-8?B?Vkp4THVGa2NhS1BHTWVXOUVkeFI3RmdHbnZNOVNqYzJ0R1drZzFQTi9zVzV2?=
 =?utf-8?B?YlBDN2dReUNnTUpONFdzRUtTRDBaR2U0d3pGU0tCVlp5R1JpUllFUU1CQldX?=
 =?utf-8?B?TS9ZYlFIdmg3SXg4V2lqa3g2RnJUcllkWDErUld4NFFuNVFpRWlzdHNjTFZD?=
 =?utf-8?B?cVJGTVhHbVEzWWF4c3pBTUdpSVpqaUQvbjFvTHB5aEk5SGkxbnQ5M3F0SG03?=
 =?utf-8?B?QldTVHpOR0ZuL29OMTBUcENtb3lTM2VOZXh5T2FTK0xwMFI2bEZaT3Q5eFhl?=
 =?utf-8?B?UTdPWFRLZ0wwdHZGZlZrU2tJbnJuT1BtdUszaHpWUkhpMnhGd0RwQk9NK1Jr?=
 =?utf-8?B?eGQzTG5Ud3NJZUE0alMwcnh5N1VxS2FyYnYyMmc4TmIzNmllWXNvaklVUC9i?=
 =?utf-8?B?eGtpcXFCdlJiSGRzL1p6eGhaZy9yZytGOWMvYkJqdGFSM3Fyb3dUaGRjdE5W?=
 =?utf-8?B?eDlDRG1rNDc4ZDFma2Q2WWJsbFEvRFdVNUxjVGdaRkhlTnJwYUNPSFU2Q2hL?=
 =?utf-8?B?WllRaEpmcGZJMVpkdnRBVXQ4YXhEVHhqamthS1pCT2Rkbm5uNUNtM2ZMLzBn?=
 =?utf-8?B?a29yb1BMWlZ6OWw1UFlDcHQwcTdJRm9UNi9JR0ZobUxZazlEN0FyM2l2RDBq?=
 =?utf-8?B?ckNTQXRNTUdMZVk2QWJCcG9HOEhyMzVFeHRvR2c1U0FIUlZaRWxkRkFNMzh5?=
 =?utf-8?B?Y1lEa3ZXQWc3SlhjK3pWT1RmaGdYem9UNnZxSVk2QkxEcHRMckFZMGQ5Vk5O?=
 =?utf-8?B?SXlqMllQL0g2L0NYNEwwVDVkeFhCcXU0UUpmenAvWnlPL3lUcUVWVUxUNGZY?=
 =?utf-8?B?T1hxbUEySzR2QnhEUUZNS0dzRDcwMWdjc3pNZTlZVDhrWWZ2U1dVZEJud2tG?=
 =?utf-8?B?Qi9HVkxuWmtyRUNORGpSK1JIUDI2T0pXRHJucm1iSTZFVnZvK1BjVEVjSGRS?=
 =?utf-8?B?STVXZnhEQ1kwSWNwWmpmeFZwOHU5UGM2aE0yTDBydlRIVWg3QzE4SWVKanJh?=
 =?utf-8?B?dVd6ZXVxVGdjTTVnT3M3NHhmUmczZVdpMktBSlV5bS9ERFB2K2tVbk5hNFNU?=
 =?utf-8?B?RmtreW9YTjE0TTRUQlAxRFBWTmpFVkkxcnNVb1NMMWFvQWY0TWJYRndMVDU4?=
 =?utf-8?B?UjZyY01mSEZsaEdCcmp5Z0g5a2owU0F4OXhXcDhQdlc1bXJYTHc4OXF3ZGhM?=
 =?utf-8?B?Z2JYcjdVa2R2OVlmSjUrVEtHZWd4WTcySloyV3htejJPRGFraDkwY0hJdmNy?=
 =?utf-8?B?eWx5S0tkVFVnSXE5REZaUnhOY1lZdUpxSHA1aTlFc0V5QTZYSkdLYktpOTd3?=
 =?utf-8?B?MUZhczRMZWMrNEJxbnlSVDMweTI3UlJHNXdEbzFGWGx2OGhGeTlWVEtKSmZ6?=
 =?utf-8?B?WUplWnJER0x2bEl1dlRHampQZDZnSFY2Z3lYQmNrQnhBcW9STi9WcWFEUlEv?=
 =?utf-8?B?YkhhZG9zRUlSeXlROVFzR2phaGVYSmtBVy9YWnc4NlA3dXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2lHZG5kZHp1YWJYbS9yUlcwRWdpaUoycHg3cUJOR1BxUkh3VWRrcXI3UjZI?=
 =?utf-8?B?UitZVFhQVGVreWhWUzNBTVAwMks0Znc4NnJ1ZS9aQ0ZwV2dOYmVhK1hhMCtj?=
 =?utf-8?B?cUtYZ0d6MkFmYjdVblU5WnpUVHFCako1U0JKdVFQMHFFZDR6N21NQmtFMndu?=
 =?utf-8?B?SkYvWkNTcDFjSFM4QWY2T29iM1JOMFExSG1mV2s1VHByTGJmcFlzazZWUjQ0?=
 =?utf-8?B?T3RkMlk1akg2cGYzNWtvSy95czJGc282RU9YQ2NHYU9aQXRObDVkdTdkRVdX?=
 =?utf-8?B?d0lQOVRlRzdUUTcxMXc4Z1pibkFVRzMvQUcrbnl3bU0weEs5L0RaSEp6NG1W?=
 =?utf-8?B?NDBkVEVJNEFDeXVhYlNrTm1VYlBqT2FZOWVpM1dDOWpWTEJNWjBhTVNVVUZn?=
 =?utf-8?B?VjBWTFB0RmlDdE8zRi84N0RGM0kvaHhUY1g5NjRlSjVnZ0hGWjBwWGNOTWFE?=
 =?utf-8?B?dGk1bTJIQk9CWnJwWmFnNk1IWnJPTzNuMG55YXNHZ1hVb1pQc1pFUTJ1MFVJ?=
 =?utf-8?B?Vk1xdURsOFFCc3pvV0tobXlJaHgrYTZMK0ZuQVkyaFBCbmF1eFJ3YkxUNFhn?=
 =?utf-8?B?NW1yTHB4Snd0RHlGdUFBeWZ4d2J5T3JESEJBdC85SmNjMG9HNS9OVkNRV09v?=
 =?utf-8?B?ZDQyK1BRR0ZPTW81eXNqOEZmaTJVSnI5ZnZIdktpdTdLVE1la2xYY1U1b3ZO?=
 =?utf-8?B?VVlPYkswNXV5ZE1KbjZQdGIwR0hqTFpBaldFSkVyYTY2UFFiWm51cHY3cXhH?=
 =?utf-8?B?UjdnSW5hN1NMZXgwWWRHajZsTzE1RFhrWWozQldMY2VDRzgvZzRaUTQyS01a?=
 =?utf-8?B?alYwRlVKVHRlenhjcVlJclNuUCtEM0tYcVdSOUdjRHc3WXJoQ3I5MDF1TS9k?=
 =?utf-8?B?dEtpSTVyOEJEakd0UXZpcWdJVDdjRE91cHZBcFVoYTN2Rk5pbHoyTEo5b1NV?=
 =?utf-8?B?QVp1M3hrTnNVaURXcHgweElFQmRUWkoyUWI5VkdWRGRkcCtYVnExZ1Q1TnNI?=
 =?utf-8?B?UXFLOXY1d0poOEtvNEFKdENaNUtyaVF0cWYvdW1vbXg3QVNFZng4NW84anFa?=
 =?utf-8?B?dFRwV081K2pFT0V3NkVFREFMTVo5cytmVURMUFhIK05wcjY3eFJUZnlVbktF?=
 =?utf-8?B?RHB3cmdBU0Y4UElVTUlSTzdwalIrejZ3Y0VWRTVETTFoUDg2NWZvWmpqUEs2?=
 =?utf-8?B?LzIyc2VONXJZczZvUDVBbzJES2Q1UkVKQkJhVVJBZ1ZVTklXSjNxekh3c0pG?=
 =?utf-8?B?R0xWcEdFSU8vRmphbllPSm9GOVpIMlVQQjBoSmRJZ1VFM0RxT2hldURtdVJF?=
 =?utf-8?B?aTVhbm4zazFoVGlyUUVsUjFCVzR4aGRDcmU1K1RBNkJrTUppbnhnRFpkVTFD?=
 =?utf-8?B?ZVdPRXA5bUg2SHVaY3UrZ29CR0hJMmtOemY0OVpLUkNpa0hLV3dQdkRwcDVj?=
 =?utf-8?B?L3JWZjZFQTJIM1ZsbTE4Z1RoZk8zZE41R3RwUkpKNFdZNTFVRWUyczVXbXIz?=
 =?utf-8?B?dTVpdjVhQWpjalRNdFlrTUFUV0FKV2VueU44RkI2T1pFT1NFbXhocW5GZEIy?=
 =?utf-8?B?dGRabnFqK1lkQ2lXWWxwbWR3aFBTYURnWlFtdmhaK05sN05FVmpkMVZ4dnZR?=
 =?utf-8?B?ZUNyNG0wNEU1c3ZDV2VxR1ljdTM1NExIOU5UV0RZS25FYllxNmI5WEVRMHNR?=
 =?utf-8?B?aS8vUk5PMEZ2RGdHS0NOdW9Mc1dVc1UyK2UzdVFjSjlURmNJZ3BCYnJYT3NL?=
 =?utf-8?B?M0ZqZzM4bCtLZXBqS3V2Ly9aRTdIQmtqeXhHQXpCMnN1VnJ5L2RkcjREaEhX?=
 =?utf-8?B?VlkwMVYxbVVocW0wSjJScmN4WEZPZkhjNFdPek5CTGpQblh1M1hZSXZhcUtv?=
 =?utf-8?B?eFk3RmhlR0N4SERnYTV0OUFjYmVSUWp3SDRQN1FRTW9SQS9FMlpiRnA0SG1J?=
 =?utf-8?B?bU00bTlmWWYxbmtQbCszS0FSWUdtTHp5L2FPb2dzUEdKcUNadld1cFA2UTlI?=
 =?utf-8?B?YXEzQXo0V21xbitVbllhengxQjJnWEw1UUo3bEVvWHhrRXFBMmJuTWo1KytB?=
 =?utf-8?B?akk4OU1nVU1ERHAzRXVVcEp3RGN3SytFMGhqVWVicFh1bU9zT1dwMWxmS0VG?=
 =?utf-8?Q?sT+o5DhalySRKLDIsA8sU6RtL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4715FD0A01B61E489D9F93B487FBCAD1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pGFFhkPFfywKQ8YSrfYG1OSw1vvnqLSqha5zWOPsAml+dlPmHFo6TLeIG3LMEomXtIJTVup3Xs3PUJd2dw/8WIaWGaOTUdA4ptqOwd9cJMsT9L1135871bLB9BT8+VQo6R2rJBkwQRHzalz6O3YgebhfmQ/baFL/OGPz4uRPuCZTKS32Sk6YJ2MqIDGH8DgQL/ou1gql0hEkf+yMA5j5KpSY5mKqdsqoVWhaXNwzej620cRqDcnc87WvlvC5UQOh4dS50bn+9ONfM8HzIsKRp/PcRABiPlT8nqHRxwSLan9dwfCksnByi+QV+e5flI4ooER+FSSqnwokfFuJFEpcaHWsSZZiThR4nlBvcCsoTYjwI/9xplx3MvMPWB/RN+J/J0UW2w8Fm027q+p2a+TmhD/etArfl5JXF9p9pPesRlD/P8fj2tUBmV9LN9xP6WIrzqMUEzK/aTOtZZbE7rQscmzMgOwFbDNfwZgMqZJPWqH4AFmN5I3ip987oFrLWLJsZrAEdPP9frAMVeiJnMwTMSgREMT+HsyGDKSj7XHcUq9h7NSlNL+hwOJquY3tB0YncRGRpWRPEBdKJ0ZP73TGA6o02ZzOLBQ7aoMrKwv3sqzAtMKhKv7k4VJgZFdV/rvAwzyutx9vtFG8OR2/Y3jDeQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b075c25-2d48-43e1-89b2-08dcc637d76f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:30:31.9066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OWRdaq1r8uGGZvVdSMzT5GH5Jrs3kzAYeLfRIS6Q5A+0aEOQN17CJNxwHRzrQncrgWAcFNwYCPCRela/R+TzZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948
X-Proofpoint-GUID: fR7MABW5KV_urJp4fBySEVNbvqX2BeUQ
X-Authority-Analysis: v=2.4 cv=Se6ldeRu c=1 sm=1 tr=0 ts=66cd2c43 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=po_nPgrHg7Q0x3m0hhAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: fR7MABW5KV_urJp4fBySEVNbvqX2BeUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270007

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9idGFp
biB0aGUgZGV2aWNlIG5vZGUgcmVmZXJlbmNlIHdpdGggc2NvcGVkL2NsZWFudXAuaCB0byByZWR1
Y2UgZXJyb3INCj4gaGFuZGxpbmcgYW5kIG1ha2UgdGhlIGNvZGUgYSBiaXQgc2ltcGxlci4gIFNj
b3BlZC9jbGVhbnVwLmggY29kaW5nIHN0eWxlDQo+IGV4cGVjdHMgdmFyaWFibGUgZGVjbGFyYXRp
b24gd2l0aCBpbml0aWFsaXphdGlvbiwgc28gdGhlDQo+IG9mX2dldF9jb21wYXRpYmxlX2NoaWxk
KCkgY2FsbCBoYXMgdG8gYmUgbW92ZWQgZWFybGllciwgYmVmb3JlIGFueSBnb3RvDQo+IGp1bXBz
IGhhcHBlbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3
YzMtaW14OG1wLmMgfCAyMCArKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDht
cC5jDQo+IGluZGV4IDg2OWI1ZTdjMTVlZC4uOGI4ODY0OWI1NjlmIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLWlteDhtcC5jDQo+IEBAIC01LDYgKzUsNyBAQA0KPiAgICogQ29weXJpZ2h0IChjKSAyMDIw
IE5YUC4NCj4gICAqLw0KPiAgDQo+ICsjaW5jbHVkZSA8bGludXgvY2xlYW51cC5oPg0KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+IEBAIC0xNDcsNyArMTQ4LDcgQEAgc3RhdGljIGlycXJl
dHVybl90IGR3YzNfaW14OG1wX2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpfZHdjM19pbXgpDQo+
ICBzdGF0aWMgaW50IGR3YzNfaW14OG1wX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICB7DQo+ICAJc3RydWN0IGRldmljZQkJKmRldiA9ICZwZGV2LT5kZXY7DQo+IC0Jc3Ry
dWN0IGRldmljZV9ub2RlCSpkd2MzX25wLCAqbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gKwlzdHJ1
Y3QgZGV2aWNlX25vZGUJKm5vZGUgPSBkZXYtPm9mX25vZGU7DQo+ICAJc3RydWN0IGR3YzNfaW14
OG1wCSpkd2MzX2lteDsNCj4gIAlzdHJ1Y3QgcmVzb3VyY2UJCSpyZXM7DQo+ICAJaW50CQkJZXJy
LCBpcnE7DQo+IEBAIC0xOTMsNiArMTk0LDExIEBAIHN0YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJcmV0dXJuIGlycTsNCj4gIAlk
d2MzX2lteC0+aXJxID0gaXJxOw0KPiAgDQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpkd2MzX25w
IF9fZnJlZShkZXZpY2Vfbm9kZSkgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChub2RlLA0KPiAr
CQkJCQkJCQkJCSAgInNucHMsZHdjMyIpOw0KPiArCWlmICghZHdjM19ucCkNCj4gKwkJcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVWLCAiZmFpbGVkIHRvIGZpbmQgZHdjMyBjb3JlIGNo
aWxkXG4iKTsNCj4gKw0KPiAgCWlteDhtcF9jb25maWd1cmVfZ2x1ZShkd2MzX2lteCk7DQo+ICAN
Cj4gIAlwbV9ydW50aW1lX3NldF9hY3RpdmUoZGV2KTsNCj4gQEAgLTIwMSwxNyArMjA3LDEwIEBA
IHN0YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIAlpZiAoZXJyIDwgMCkNCj4gIAkJZ290byBkaXNhYmxlX3JwbTsNCj4gIA0KPiAtCWR3
YzNfbnAgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChub2RlLCAic25wcyxkd2MzIik7DQo+IC0J
aWYgKCFkd2MzX25wKSB7DQo+IC0JCWVyciA9IC1FTk9ERVY7DQo+IC0JCWRldl9lcnIoZGV2LCAi
ZmFpbGVkIHRvIGZpbmQgZHdjMyBjb3JlIGNoaWxkXG4iKTsNCj4gLQkJZ290byBkaXNhYmxlX3Jw
bTsNCj4gLQl9DQo+IC0NCj4gIAllcnIgPSBvZl9wbGF0Zm9ybV9wb3B1bGF0ZShub2RlLCBOVUxM
LCBOVUxMLCBkZXYpOw0KPiAgCWlmIChlcnIpIHsNCj4gIAkJZGV2X2VycigmcGRldi0+ZGV2LCAi
ZmFpbGVkIHRvIGNyZWF0ZSBkd2MzIGNvcmVcbiIpOw0KPiAtCQlnb3RvIGVycl9ub2RlX3B1dDsN
Cj4gKwkJZ290byBkaXNhYmxlX3JwbTsNCj4gIAl9DQo+ICANCj4gIAlkd2MzX2lteC0+ZHdjMyA9
IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUoZHdjM19ucCk7DQo+IEBAIC0yMjAsNyArMjE5LDYgQEAg
c3RhdGljIGludCBkd2MzX2lteDhtcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiAgCQllcnIgPSAtRU5PREVWOw0KPiAgCQlnb3RvIGRlcG9wdWxhdGU7DQo+ICAJfQ0KPiAt
CW9mX25vZGVfcHV0KGR3YzNfbnApOw0KPiAgDQo+ICAJZXJyID0gZGV2bV9yZXF1ZXN0X3RocmVh
ZGVkX2lycShkZXYsIGlycSwgTlVMTCwgZHdjM19pbXg4bXBfaW50ZXJydXB0LA0KPiAgCQkJCQlJ
UlFGX09ORVNIT1QsIGRldl9uYW1lKGRldiksIGR3YzNfaW14KTsNCj4gQEAgLTIzNiw4ICsyMzQs
NiBAQCBzdGF0aWMgaW50IGR3YzNfaW14OG1wX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICANCj4gIGRlcG9wdWxhdGU6DQo+ICAJb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZShk
ZXYpOw0KPiAtZXJyX25vZGVfcHV0Og0KPiAtCW9mX25vZGVfcHV0KGR3YzNfbnApOw0KPiAgZGlz
YWJsZV9ycG06DQo+ICAJcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQo+ICAJcG1fcnVudGltZV9w
dXRfbm9pZGxlKGRldik7DQo+IA0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpBY2tlZC1ieTogVGhp
bmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

