Return-Path: <linux-arm-msm+bounces-29527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4137795FE70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85A60B20921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ED38BEA;
	Tue, 27 Aug 2024 01:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aBK8+oBA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NodcfcIe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YG0ipJKr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546979F6;
	Tue, 27 Aug 2024 01:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723048; cv=fail; b=MTtc3WBIWmQOf8YLQPDZ73L1mjFBGsww2GIYbm+l97w2/UFwWqEkoHc8qhJTtBEpnIX7xDaTG7Vcj+0mDfQO4hUrpUL0uHyyJbFKFnBya0KeAg3xJOs7w5rONOG8vDAGYoim1r7PlUFDy+4u+BJIbfRsz0ZE8qotGUxInaOWRAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723048; c=relaxed/simple;
	bh=8cFRZquWtMpyJcAH4nl2pKkl7sPz70P7OV7TEgAxAKM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kxCcfZlL4/IbM+EM727sOVZJmC04k7rR5+pqjTE1B+qkHkBGuS6gxMtzC86DjWZPEocVUQ5cZ5122yfbV2fuAlyQK/dpCaQt9aUzjIGjub3JfvuiVaiS0XwYeoEVRuLhg1+RVHoyF/D70RW8Kc7Pbh9Zpf27Qa7tZTZsD+Dvtqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aBK8+oBA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NodcfcIe; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YG0ipJKr reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQCnD002815;
	Mon, 26 Aug 2024 18:43:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8cFRZquWtMpyJcAH4nl2pKkl7sPz70P7OV7TEgAxAKM=; b=
	aBK8+oBAD0UlKUdA/z6Ryi/jYJ+QL/zD8MfZRYKsli+cEN+LPkPsD7XMXJMdc2Qh
	SE6WCnZX4iz0v491Id1NYjxQGGg2BpDddr9YFgPEndSJWPs3nS6jsVz2P00vVOef
	rKi/af/kbML4yO7PJdfiYmylj33snXq5IKCJHsUiThdx38hdRhtvyw+f2Ip9DzBY
	cvPc3r7/+MbjPm3bOch5T/V/+OkMUkov3l5FlKGMRBkMw0kjimcP85RO63mTsNyN
	+HdrQpczpW4wcxqFEX6tuqY4Zehz8KyANAYDtG95W7AsistZgNJCpQULEzDK8Iz8
	XIYKB/nEoaoTGTeShuBp6g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417eevjn96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724723025; bh=8cFRZquWtMpyJcAH4nl2pKkl7sPz70P7OV7TEgAxAKM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NodcfcIebVJIoFG0FHXyEnkJp1BlhmcsshygalUMHFKWAJA5jc74/s6hXRYFLfTM9
	 s0a7/2FwMihIJfmqOtqJJsySIesUe2V50DTsiXzon9GDjiQOdyJ1J9t6b4Wy5vqKiJ
	 r53/jwe/6ypoRI5mQ6NvcCQhgRxFibbJQuvzEbk+SHertMsN3SxSqMrnJXL0z+aqMG
	 1FII4PrsSajGvykNmBSATe4yszabbbeHfgB2sGaeHQW6dria4cjtozolke7Vcv26AY
	 w57Bh09yqiFAWyRqpr2lBAiuFwcsCJSQpltbJu/K4j0SejREzEqDeuSb+UuQoCqX4N
	 pwTJSkhxiu9GA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B07384045D;
	Tue, 27 Aug 2024 01:43:45 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 73055A009D;
	Tue, 27 Aug 2024 01:43:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YG0ipJKr;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D03E140211;
	Tue, 27 Aug 2024 01:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIiIMXgBDyFaU8vlm66rBO2fKta/Chk/ouWvWIcoVoe9ddM8yE37Id/l2t282Afw5FfRrkiXW4zUicjnzV6xS4OHXhllxB44APZI6ZhiUlqci3MGsXZiGUIAIs+Nt5nIcK4Obs+5zvueXo6r/P39r2kaimZD2uIBlo//JD0SaG7B+FonaYXYD325GOuMk7+SYIBlmfRROGXaHIaDyRwjclKtYRbsg/vbOcnP2TRiw9aaOtL/jjazPFHhlNku8ncWrCvrVYdl/r7TdS4z9ojYGGHK1QoLLX8om2SqMK7mvdVnd2Eu60JI9OAy78aKFjQojw6P7cm/UUhdwmcxZ6StZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cFRZquWtMpyJcAH4nl2pKkl7sPz70P7OV7TEgAxAKM=;
 b=SBJpfj2GOTcMaN5mo72lh8Cnzyt+QR/4hq0VJ/dWDK+fYH5XLh3FgDQRuTzgExCvh50PlSdxmnz/rORJiDEiK6dXFmhqIwyfIHbfdS+4MZ2C4LTuTV/OeqXRoHBizrwPtd6sTXGT6dfQMIbHNlp6juvh66Nq4Tljn/FWy4sx4LI7VSbhC/qrj6aBZS5OX3ePBI4+CPG++0bACEcQN8DUVnHQDzm7LfdXrI0MginMvI4I8SSGC9mjZqdhZJP6uMsqRfgAa8Ve5O2GwNNJwtfqpodsl852sVdS08P6niKpf349zL7bIxfk5BC4QDdyaQnrEeBP88f7J3ouE6HtAJPD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cFRZquWtMpyJcAH4nl2pKkl7sPz70P7OV7TEgAxAKM=;
 b=YG0ipJKrypUldC6tu0cIenu5hSQCIDoeodkg8pDnOESBYgrvks3lqKjVXMmFZCs1WQKWMrld76scEnM1y6KveZzd4we0QZI8TbciQBoBe3ED2E8Wo3feWoOEF64BM16KqHMyLi2sDLX95ITlzAOnzjKvLd7oFL9erI6Jc+NlOE8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 01:43:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:43:41 +0000
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
Subject: Re: [PATCH 09/11] usb: dwc3: rtk: use scoped device node handling to
 simplify error paths
Thread-Topic: [PATCH 09/11] usb: dwc3: rtk: use scoped device node handling to
 simplify error paths
Thread-Index: AQHa7jXMkD0fdgXw0EWh+qddhz+4ELI6aKcA
Date: Tue, 27 Aug 2024 01:43:41 +0000
Message-ID: <20240827014338.o3hjjxhwd5x7cbly@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-9-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-9-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ0PR12MB6711:EE_
x-ms-office365-filtering-correlation-id: 5c31fb3c-30fb-4f36-82d9-08dcc639ae24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WktzZGw3cENHSlpOVmY3VHhYZDZ0VERvR2hVQU5VQVg3bWlLL0cvTm9EeERV?=
 =?utf-8?B?NDFrMU8xRTRPTDdPSGhlbXZMdGlCZTJxRUhlekovUDBOU0oyd2dOWCtDaWV2?=
 =?utf-8?B?TVR0OVVFRU13aXFmK0xEK2t6TTFnSDc1WTVnZllzZXdLdGFxbE40VWdpQnNn?=
 =?utf-8?B?M2dqWTQ2UVErcUNTYU9La3NJUXVCdnNnUkhMcjRZQVcyVGJLZHN6S1ZkSHQz?=
 =?utf-8?B?RDFiWGIyQmVRYUlPREhUNnJxSlh1ZmJiY21LN1RFMlU2WDVIWFliejhId1Jk?=
 =?utf-8?B?WVFmVy9UMFBZdHFpVHc2V3ZrUUYyZ3hjZmliYW9NSEdEOUhBWEU0WlZ1RU4v?=
 =?utf-8?B?YUJGMlRLem9WeFpNaThxYVpjUU9kNXVUOTcra2hiRTBmbnhBV3BQOXRLTnZm?=
 =?utf-8?B?emIzdGp1SS9tSlFIWHZ1L3gwcHllcUVqWVhDNnk3K25nNk9YYnpQNWo1dFRl?=
 =?utf-8?B?bUxSYkNocWdMbnVtMmsxTnlzZzBTdVNCUUlSajJjMlRUamhhY1A1bGY0QXdT?=
 =?utf-8?B?cDhZWXZDblJrTDcvNmxkUjl6WWorZm9IVXVxVXBvdzdhMVFBQjdrNDhOc3ov?=
 =?utf-8?B?cjBTS2N4cm1zQWUzZ240REFSZ2dBTFp6c3NXQnM2YWh5alJIc1VNUTNrc3RK?=
 =?utf-8?B?Nm9QWDVwZE1mUHAzSDMrcmEyUDl3eUhvMlo0NzgySW5ZQmdMVURKSmxQUzFO?=
 =?utf-8?B?ZCtpQzJKTE5QWmpKd3BpbzhVajBiTVJnOG1lSVkzakNvbCtrWmtMNDZZbTkx?=
 =?utf-8?B?SWlhdUtVNnVRajlDK3BmNW9PWnF5dmhPbDNpdzZBdnBjc0JQczVxQWwxVnZY?=
 =?utf-8?B?VTlJWU1rbUlxUng3bTc3S0ZVV3FtMjBUc2MyUnRpa1ZWWnJkcXVKMksrYUs1?=
 =?utf-8?B?RmZsTjUxdzBJUWNFRzMzRnE0RDhnTmpzS2NvRUV4VTBOekZReUVpSFcvMjB3?=
 =?utf-8?B?ckpnWTZSeFFGTEhUUEpyZ2gzSzBOUEt4djdERzhyWWlqUXU1dzdPWUhqTS9p?=
 =?utf-8?B?cEFpb0JUTkxGMm9mMlJ2eCs2R3BXOGpXaGMxNy9yYldZM0FGeHk1a2tiVkVo?=
 =?utf-8?B?NlczVlluV3JsUXAydmRTVlpSSVNiYy9SUHhUaUNWTGJhaHVXQTBTb1I0WWJR?=
 =?utf-8?B?WjB0R0ZVNWo5K29CbHlZOERNMlZzWVpuMHNFbkxNWHhtdTVaVk1jLy9DeXIr?=
 =?utf-8?B?MEtGc2czZW9IY09pZHFhdHk5RG1zVE1POTRhb1Flb0lpbEMxcGxOQUVTOFR3?=
 =?utf-8?B?a2MyVTY0SGZZZkhnb3ROSlJUMFM0bkR5Yys3eVFHb2xpMlJpNk1ZMXBaZWF5?=
 =?utf-8?B?UkwxTk1hdEpMNEpad3BtTUhObmtrU0R1a25wU0V6RW41NTBZNUd2Rk15d0xW?=
 =?utf-8?B?ZldaZXI4ME9KaHI1b3AvZnVUbzQ2eFZTSkNMLzNtb2hkUjlkMXZsTHA2am1i?=
 =?utf-8?B?d1hYM01JSUsxdVhmY2NQeEwwWkFnekJDNUNIRFJiZ0hHQnEwQzNkUG9ESDcw?=
 =?utf-8?B?ZEE0Mm03TzFnVVRyc0VhZTJWWGhVRG0ybCtJWjZRZURVUWNQTnprRi9TYXcw?=
 =?utf-8?B?cDBMbVd3MStJc1BMeGFSTTl5dnVWZ0p2ajI2RVhDSVlaczA2MmcrY1lNc3lE?=
 =?utf-8?B?V3RXTUhFTFRwNkkrbE11Ty96TXg3TTVYMTVVVkdyTUpZWHhaZ2p2TmwwUE5U?=
 =?utf-8?B?c0ZHbGpndldYTkpKdFRIdnRBaGt4S2lqY3M5cGg2a0ZGenBZME5LZkUwZHhq?=
 =?utf-8?B?VW1HeVlmR2p6bWptTVNKOENmNSsyZEgwbk5BQUlKb09LSjM4b2pOOUMwODg1?=
 =?utf-8?B?Y2kvT2tPSXBtUnBmQmhrV1dIbkdrcGpMZXQzYlY1TWpFWHZJVXhGdm96RFJ1?=
 =?utf-8?B?VFVNYmR6R0p1TjhQVXNnc1JYa2hVOFdUcGV5blNRa3NTUUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkVOSER1RGVNaEFPbG1iMTdZYTh2dXplMGlKWEttQi85dXNZc3BqRXBwM21B?=
 =?utf-8?B?emtVcko5cW5UN2NKSTBwYVZpSkJidUFmMjFmSDBlMGFXV2N4VXEyaXRERzdO?=
 =?utf-8?B?dm0zUHM4Y1ZhVlJnUXZFekp6NGxxcGdCUEE0T1VKRkxJdjlIUzAzd2c4OU1a?=
 =?utf-8?B?SFVMOXBEdks3ajFPTGg5dzJ0a1llYnRxU2Z2RjljTENjVUNGaURoZk9JSXVs?=
 =?utf-8?B?Q1poZUlRcXVLTG03TEQvTTB5NUtLK3Rua0ZjZTdoUU9kNzhXTGVOaTBya0N6?=
 =?utf-8?B?eTVKbDd0T3BndFNYYzVtMzkybDhXdGsrZURSdjB5LzByYmV3Y1ViTzNVT1gv?=
 =?utf-8?B?d1BJaU9WL3ZmR1RTVHhYelNyVVpINEowdTB4TWw3NzRhMHlSTGd5WEE0c2hq?=
 =?utf-8?B?cElqNEZjS0dFNFNQQUFDVnZpbGlFVUpzMEx0ZmtDRld0NERWNndmNTNHMlhi?=
 =?utf-8?B?YVdmS1I0Vm5oQnN5T20xeFZ5cWVkYXFEWG15dGFrZFFUb3Y1TXZ3ZzVWUk1t?=
 =?utf-8?B?MDJiQkp6Y0FOVDl4OGdMQXI2VnBVSVJDOXBIQkdyUU1vWTJQQW9oUkJXc1RJ?=
 =?utf-8?B?M1JQYnZXR1l0Mmdwdmp5dEJnc2hIdU1yNTU5dWt0WnFTTG1zdWZBanYxYUFW?=
 =?utf-8?B?alZ2Nyt3UUY3dm5hU0JCTXk3d0lqakx4R1NRNGkxS1FtVzZiZEZwZ1ZWOU4w?=
 =?utf-8?B?OW1PMEVkVTllODhyUFVCbnlvd0VJUWFXVlJyZm9ySXI5anc3WHdMdUlxdzBY?=
 =?utf-8?B?SUppMmN0MXlTclVzZWFwKzhpdEdseCthR1FWY1prdzBUWVVUVUw0OG83Nmpl?=
 =?utf-8?B?TjBRcjV5VVdRRDNrcUMzNjJtSkgxWWtBK3JuempWazZWVm9yY0dybXlKRHVY?=
 =?utf-8?B?ajczb2FwV2Y4TE1USGpWVE9RcTJ6NE5LNDVWZm5PRVJETmlRR2JSaUFXVWUy?=
 =?utf-8?B?SzQwUU9nd0lXS3lQQUtBYm9PVVVCVDI4NGdaa2RENjg1N3RKcGNBSzZDWFRU?=
 =?utf-8?B?aG03Z25VSnptTHAydnRzU2FvejQwY2FVYkNxSitNZTA0WnYxNHE2MXU5WnE1?=
 =?utf-8?B?MXlIMXd5WFVrOFJSY00zSXBQcGh1TmVGNk5UT3YxeXNKRzlFVjh2a25pV3Rl?=
 =?utf-8?B?bVMrS2JBV0ZCblNDelM1U2ZJb2hKdE9lelVBL3pGYlNkQUxsWnJMb2prS2lH?=
 =?utf-8?B?VFhxeTRlNHEwZTh5S2tCRGhzaGh0a3c1MUp1VmNZdmtGckwwUlVZRGFHYytL?=
 =?utf-8?B?Y0ZqcUhJd1FHRi9WTk90QXlRZGNXNnJvbEpsaFF3b2pzcFVYS2MwRVJWbWEx?=
 =?utf-8?B?bTJKYnZLQXRra3lHSmtkUnE0elM2Ync0b3NYVXh2UytDV0Z2KzRxYTRoRGlj?=
 =?utf-8?B?K2JmZW9LN3JKdVN2d1pKcWc1dEwxQmhGQ0w5ZjlmZGlGcjlCQ3dqNmQ2cm1m?=
 =?utf-8?B?R0hXeUx2UGJhdG1KSitlWlJhOUViM29OV2NXT0MxcVdqL2QzWStsQ0RGdXAy?=
 =?utf-8?B?VmdWNm5kR0xQMG1jR3ZOZVl4Wll0QThZMWpLWENQTVVQS2ZSd09jUGRKcUNZ?=
 =?utf-8?B?cWpIZzEzaTJMU08vZXJWMXBSM0NPbngySHdmK1NKU0E4YVFXWGxXSGx4U3FT?=
 =?utf-8?B?YWQ4QXlYSmF4TlZlanEvczIwalpPVFZ2dFl3SDcxR1haMkFLYTdubGVhdG1W?=
 =?utf-8?B?cllQby91cnhDdUlZc3IwdU0wRlYrOVJ3K05FQzJFeEpjWDVlbEJ3cXROVWtT?=
 =?utf-8?B?TVlsaUhyTWkzQTlpMDIwNEVSU0RLM1RXell6bzY2R29YSERjZ2F0bXU4MVQy?=
 =?utf-8?B?T1dJMlZOQ2szb2JtSCt1ZkZCZkdBTVNNdWpKRjBUaHpxUVpib09HaTNCcWxq?=
 =?utf-8?B?NzFuMjhucFRwTWMvRmpKUDVVamQyMExYVDZ6WmFnazZnVnhaalMycmVpMUFO?=
 =?utf-8?B?Z05HeFpod0FoT2Z0dUg0WUVFOFpmZmFYdGtSUXBEU3Rkc2pnTFNEQ2JhN1Bp?=
 =?utf-8?B?OHNmcGd4R1J2emdwemh3Yk14Y2VPaVpkT1J6Q1dZWDVwYk5DUm1xMEE0LzUx?=
 =?utf-8?B?QmRjL21BNi84Z3NwS3Ywck9uQTZISm5IYUhqR2RzRjYwM0lGeGxHTE1yYUVt?=
 =?utf-8?B?eTZ5YkEvMHBWT2dSV3NkK0NVcEhYTi9uSEYwcGVoYWwwMllsc2xDVjhKWjB3?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9D249B83493A642BD01DDB45142C438@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q2onucNRgmyS34r+YSaSfV+ePbFxXF9V/glcpzZRH+sixuB/75RXiMWh8CLgaUdTdqjx2C94T03Jii7PfqLoR55gP0pQTAuJtLpwzgjr3+HbrdNCM+y9kYUI2jfIngWo5AKu229xg9BqjoahEyDeDTD8ry2zG7HM29brE4ivKPv33K1w1J+1wrLPyrxiWTbXGO8kgf2zlWbGL1eRqfUdAzVZJ1KONpCscDh3PlsVDEt8yC/SxtRsdXwLyhVo1THbGb80b7NZg7e113IJQnP/csH1NwRwSFeJZFAHG4o8oHPoqzCJdl1KyIv86Hw9xr1djh94so9MuGA31LpnQet33xOVM99W982m1gvH8kdsI+EapflR9EktPRHu5lpP0tGe91JQjxv9lg4XQ0w3xuybcP/E6QjKhNgq3/GRvKxoe4zRF8BObQyR2kxq11iTEoJJMQZ34hJgrcJu5luQN7zGYFuk3l8iE1gdtYIVt/YdfzGlm2HwL1PgEl04Z9lIKygG0yoB5CIVq4vb5WOgfKDCf8eq2Bako8i+Q8BRx8jGeY8m4VCmmK+KidVY+qWekJAo3sXLGH8DGPj3aW851LyCYMZ+AWb8LRncnoYipvi9jvjFkdUQpYmP4Uvn7BCuq3IODX491+AKgdI2E3UThyQ/Pw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c31fb3c-30fb-4f36-82d9-08dcc639ae24
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:43:41.6449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdCTjxc42WMMnDCM1bYQ7r33K9eDbnNd+P5ToY82JpLW0aXBXdWq8H3HDPP2/BcegpkUPtH3pr90cp7fG7qOVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711
X-Proofpoint-GUID: cj9W2TRYMTVzgLp4kngU19kXZx5LO8sS
X-Authority-Analysis: v=2.4 cv=Se6ldeRu c=1 sm=1 tr=0 ts=66cd2f53 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=Njybt7sDLDQGxXTDlc0A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: cj9W2TRYMTVzgLp4kngU19kXZx5LO8sS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270011

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9idGFp
biB0aGUgZGV2aWNlIG5vZGUgcmVmZXJlbmNlIHdpdGggc2NvcGVkL2NsZWFudXAuaCB0byByZWR1
Y2UgZXJyb3INCj4gaGFuZGxpbmcgYW5kIG1ha2UgdGhlIGNvZGUgYSBiaXQgc2ltcGxlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcnRrLmMgfCAx
OSArKysrKysrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtcnRrLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcnRrLmMNCj4gaW5kZXggM2NkNmIxODQ1
NTFjLi4xZTNlYzIwODQyODYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1y
dGsuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcnRrLmMNCj4gQEAgLTYsNiArNiw3
IEBADQo+ICAgKg0KPiAgICovDQo+ICANCj4gKyNpbmNsdWRlIDxsaW51eC9jbGVhbnVwLmg+DQo+
ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+
DQo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+IEBAIC0xNzMsMjMgKzE3
NCwyMCBAQCBzdGF0aWMgY29uc3QgY2hhciAqY29uc3Qgc3BlZWRfbmFtZXNbXSA9IHsNCj4gIA0K
PiAgc3RhdGljIGVudW0gdXNiX2RldmljZV9zcGVlZCBfX2dldF9kd2MzX21heGltdW1fc3BlZWQo
c3RydWN0IGRldmljZV9ub2RlICpucCkNCj4gIHsNCj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmR3
YzNfbnA7DQo+ICAJY29uc3QgY2hhciAqbWF4aW11bV9zcGVlZDsNCj4gIAlpbnQgcmV0Ow0KPiAg
DQo+IC0JZHdjM19ucCA9IG9mX2dldF9jb21wYXRpYmxlX2NoaWxkKG5wLCAic25wcyxkd2MzIik7
DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpkd2MzX25wIF9fZnJlZShkZXZpY2Vfbm9kZSkgPSBv
Zl9nZXRfY29tcGF0aWJsZV9jaGlsZChucCwNCj4gKwkJCQkJCQkJCQkgICJzbnBzLGR3YzMiKTsN
Cj4gIAlpZiAoIWR3YzNfbnApDQo+ICAJCXJldHVybiBVU0JfU1BFRURfVU5LTk9XTjsNCj4gIA0K
PiAgCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGR3YzNfbnAsICJtYXhpbXVtLXNwZWVk
IiwgJm1heGltdW1fc3BlZWQpOw0KPiAgCWlmIChyZXQgPCAwKQ0KPiAtCQlnb3RvIG91dDsNCj4g
KwkJcmV0dXJuIHJldDsNCj4gIA0KPiAgCXJldCA9IG1hdGNoX3N0cmluZyhzcGVlZF9uYW1lcywg
QVJSQVlfU0laRShzcGVlZF9uYW1lcyksIG1heGltdW1fc3BlZWQpOw0KPiAgDQo+IC1vdXQ6DQo+
IC0Jb2Zfbm9kZV9wdXQoZHdjM19ucCk7DQo+IC0NCj4gIAlyZXR1cm4gKHJldCA8IDApID8gVVNC
X1NQRUVEX1VOS05PV04gOiByZXQ7DQo+ICB9DQo+ICANCj4gQEAgLTI3Niw3ICsyNzQsNiBAQCBz
dGF0aWMgaW50IGR3YzNfcnRrX3Byb2JlX2R3YzNfY29yZShzdHJ1Y3QgZHdjM19ydGsgKnJ0aykN
Cj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBkZXYtPm9mX25vZGU7DQo+ICAJc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqZHdjM19wZGV2Ow0KPiAgCXN0cnVjdCBkZXZpY2UgKmR3YzNfZGV2
Ow0KPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZHdjM19ub2RlOw0KPiAgCWVudW0gdXNiX2RyX21v
ZGUgZHJfbW9kZTsNCj4gIAlpbnQgcmV0ID0gMDsNCj4gIA0KPiBAQCAtMjkwLDcgKzI4Nyw4IEBA
IHN0YXRpYyBpbnQgZHdjM19ydGtfcHJvYmVfZHdjM19jb3JlKHN0cnVjdCBkd2MzX3J0ayAqcnRr
KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgCX0NCj4gIA0KPiAtCWR3YzNfbm9kZSA9IG9mX2dldF9j
b21wYXRpYmxlX2NoaWxkKG5vZGUsICJzbnBzLGR3YzMiKTsNCj4gKwlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKmR3YzNfbm9kZSBfX2ZyZWUoZGV2aWNlX25vZGUpID0gb2ZfZ2V0X2NvbXBhdGlibGVfY2hp
bGQobm9kZSwNCj4gKwkJCQkJCQkJCQkgICAgInNucHMsZHdjMyIpOw0KPiAgCWlmICghZHdjM19u
b2RlKSB7DQo+ICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGZpbmQgZHdjMyBjb3JlIG5vZGVc
biIpOw0KPiAgCQlyZXQgPSAtRU5PREVWOw0KPiBAQCAtMzAxLDcgKzI5OSw3IEBAIHN0YXRpYyBp
bnQgZHdjM19ydGtfcHJvYmVfZHdjM19jb3JlKHN0cnVjdCBkd2MzX3J0ayAqcnRrKQ0KPiAgCWlm
ICghZHdjM19wZGV2KSB7DQo+ICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGZpbmQgZHdjMyBj
b3JlIHBsYXRmb3JtX2RldmljZVxuIik7DQo+ICAJCXJldCA9IC1FTk9ERVY7DQo+IC0JCWdvdG8g
ZXJyX25vZGVfcHV0Ow0KPiArCQlnb3RvIGRlcG9wdWxhdGU7DQo+ICAJfQ0KPiAgDQo+ICAJZHdj
M19kZXYgPSAmZHdjM19wZGV2LT5kZXY7DQo+IEBAIC0zNDMsMTQgKzM0MSwxMSBAQCBzdGF0aWMg
aW50IGR3YzNfcnRrX3Byb2JlX2R3YzNfY29yZShzdHJ1Y3QgZHdjM19ydGsgKnJ0aykNCj4gIAlz
d2l0Y2hfdXNiMl9yb2xlKHJ0aywgcnRrLT5jdXJfcm9sZSk7DQo+ICANCj4gIAlwbGF0Zm9ybV9k
ZXZpY2VfcHV0KGR3YzNfcGRldik7DQo+IC0Jb2Zfbm9kZV9wdXQoZHdjM19ub2RlKTsNCj4gIA0K
PiAgCXJldHVybiAwOw0KPiAgDQo+ICBlcnJfcGRldl9wdXQ6DQo+ICAJcGxhdGZvcm1fZGV2aWNl
X3B1dChkd2MzX3BkZXYpOw0KPiAtZXJyX25vZGVfcHV0Og0KPiAtCW9mX25vZGVfcHV0KGR3YzNf
bm9kZSk7DQo+ICBkZXBvcHVsYXRlOg0KPiAgCW9mX3BsYXRmb3JtX2RlcG9wdWxhdGUoZGV2KTsN
Cj4gIA0KPiANCj4gLS0gDQo+IDIuNDMuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

