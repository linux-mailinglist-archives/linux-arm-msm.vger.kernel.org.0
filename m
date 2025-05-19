Return-Path: <linux-arm-msm+bounces-58363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7DDABB4DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29D55172317
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 06:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BAC226D03;
	Mon, 19 May 2025 06:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="XENGCy78";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="buwtFSSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BA12253BA;
	Mon, 19 May 2025 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747634990; cv=fail; b=T4GZqpYEBk+EOHqvL3fLKVMYrq9xbyMW4uxsqx8ovWhELpIfTRtwzoiQvB+hyo6D2ICG0OTMPfQOiHq8/iK2cMTFZoC2FWRiTDDHEmjd9q6OKWwuiUYVpoj7vLLhQGcQmkRzjuRibztVfzNQgxLb8HTNfX6jwm9QtU0q3djRPkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747634990; c=relaxed/simple;
	bh=spcuDV5htW+s94rfHlxolVrmfs/DCEkh2flElior/ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PZdnWjpHrMt2Q5IFo0Kz83xrapN7g4DfXX724VWqsODnxGzxh1melkK/l78CyMZm//FexCKm3Tp2E2i4LRZ/fnQdli8SwEattwwZpGGsvwmCqOhwdFlLE185f+4qTNy6JRB66RMs06UmpP7dlP3PRB+kYxh8kvOjduhex6e/jHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=XENGCy78; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=buwtFSSj; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J5010O009350;
	Mon, 19 May 2025 08:09:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=8X/c9YdsxFlZvTSjDpdYfGr9
	KGHfMqTMq4chOoJOUbQ=; b=XENGCy784UTAn8PDVO6eR6MTVBnOMR5r1rQ5Ztwq
	pc5IovoWwP447L3ou/2Z8AYXDWYgTMxenSubtYa7vCkTcTDPksHmbD3+EXygb63A
	KhSr82CENkbFJYidBX8h1gmvEl6/3PewOL7AYDDr/nqaDAMUPHM2XU6Q7RAiL6so
	8B4egJ6iuBtlnSXUAwM4exN6xnI9CN0SnbYrXAQqhHfMRow2HZZjfVX3S5J2EHN3
	Dk2wr8DHEP8ltFA6qRoH4lWvavw+zeDwtGWKJFvnH7TtL0/m0gH0T5wYQYL7rUUP
	zJJ1Bg+2+T/7xmnfc2qJvqMFmb7jY7xG+Z+29XooxIdwZA==
Received: from eur03-am7-obe.outbound.protection.outlook.com (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46petdhvqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 08:09:32 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W79Yh33IFqFaoUJGEsSKbtMRN7b8frSJkK3g/9A94w9nZONoC0lNMunTK1g4vWasBq1fmKn9+Hl68GtOF10kef/8G0bLNjVJ3q23hiITVSnObCdbX1uYVkUj0fbENdqyHvePQXJdoHC99wYRpSecfWWxnTqUdj2dJK/95cj11TgZHOnPhxGpvr+rNIEiR4OCD72BYlDMYYvCQaJCSzsqC3WVX6Vf0w9JuHIGR/wmVmouOrDcJvHva5viKbFqMgMnIDRwUWlbCTk911PSwmfBoAUZLfeRv7EshVRUsy4b5y1Kel6ol21hVd8uT+P04dQ6dmWegk+j+RnvdyHBk68Kcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8X/c9YdsxFlZvTSjDpdYfGr9KGHfMqTMq4chOoJOUbQ=;
 b=fKu9Sbx21zrtECMdoWPsKtpDNHgOXGDn73LDqGJS+JmEb5TSfM6hf2vo/gQltNrjk4SHYqH8ChgkpjA08UPS3ZaPtbd+b3gl5+5UnKTR82j2mfhinaWkItdS3B3vSJfFnXn5Y9OLq32knoI2QPNPDXTl1zeGlhh0FavdHloLfdWXgR0u9nGaCwBmZ6pkLXPXLVHc0bZP3bdErbmHmw7PN6QzvOQ+RYEDKYqhCT7SGZ+9TgSx3UNa2H6lRoa1oR4DClFR+9F4TJOJox4G2JHgJCyWwcckz38TR7URwgRTcWgBsrRRvhUbp/0i2TJyYUBJQtIK6OiQbapOoPPRBeYH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8X/c9YdsxFlZvTSjDpdYfGr9KGHfMqTMq4chOoJOUbQ=;
 b=buwtFSSjPfjHYjk/GGt1tMmjO1ccAIf51Nr6aeFdLDwNZuBAzCSzyVERipxizy6x3odAhowyHdgjxey3siLsDmidJ9HSTOpW2eFQq5IlJ62EoxyUisMS5Q8yxnDY7fzlVCYQUg2vLH/V4MVfoPTuorprV97AbpXwonH9V84sh+s=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PA2P192MB2372.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:41d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 06:09:29 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Mon, 19 May 2025
 06:09:29 +0000
Date: Mon, 19 May 2025 08:09:26 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: fix endianness of BHI vector table
Message-ID: <aCrLFtPJIgh8/zRx@FUE-ALEWI-WINX>
References: <20250515095517.1867846-1-alexander.wilhelm@westermo.com>
 <fa6e5f45-a6d9-4f31-ab5a-7c47200a913c@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa6e5f45-a6d9-4f31-ab5a-7c47200a913c@oss.qualcomm.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: GV3PEPF00002BA4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1b) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PA2P192MB2372:EE_
X-MS-Office365-Filtering-Correlation-Id: fd54b6f7-730c-4510-91df-08dd969bb6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DOOg2PhIWRt+NEYGbsC49lc4lntmBoDjKbFg2SwseRMlkZA05P9tR4/TMLhX?=
 =?us-ascii?Q?Msma1DsSBXaNsnMHql6aS53g6S8vhVnHnMcXJ3z0f1/QGaoundTAtmXd4kiB?=
 =?us-ascii?Q?1ouG6c60zXZlPgu7O7z5H+gt1ZK32MWL2Jvu8t1wNGMRIE+zSe5C6PEEwJyu?=
 =?us-ascii?Q?/Ct9X35nFxMCOmy79Xhdgj8xhaVR/+vL1FlDgYejvp2cvhjzkBAA/Sg14dv2?=
 =?us-ascii?Q?G4jKGnyKXFMBa6smNLdSmdRRtGFrkioZfMwHpWFnszHkZb2sLWwMv2n/5kPL?=
 =?us-ascii?Q?2PQ5v327vMUI6kPC5n6zAFloPrBW7cJxWwC4UevyjQKoVsyaMT1yvQyYX/KR?=
 =?us-ascii?Q?0nRWzTpPEsY1cFtGk5l9tuUfhenC/hU9KoHVTBuxIiqJC3fNHsB6n+onWhnS?=
 =?us-ascii?Q?qYxB8Gp900XWgrE/xxieGrM+VzopSTxYFK48m1ckG53I4J2rl1QONkTkkoGY?=
 =?us-ascii?Q?305IvTK/CRkaDYk9CBr2x4oHzZ40TV8u8hVoMy6VYszF2jyjhz8kHAypEhNh?=
 =?us-ascii?Q?2Zq3tBoXieP1VRqTwQh1V/AscZSrxBrnNCxUUsNt1lY0bRPHZlZZicNaOnAy?=
 =?us-ascii?Q?Pw6Xi+/32wknW0PRvCP9h9m/YBUAzIhBz+R1nXBfP0MzapzBvqTcvUhELnYZ?=
 =?us-ascii?Q?+nEFSGo4iDN1I45ao2D1Vs8QEeEFg+pwJwE0XyG8JYmQvHMZwSdcS7s7x/hm?=
 =?us-ascii?Q?mJ+OOKPNC+3E484007XPW9b1Xn3r9NcWK03tP0zgXhrcZumYT158vu9jyRJ5?=
 =?us-ascii?Q?CT5QFLwbCeGVwtHG0LJZuZK8thbjomWlYezIoSSiIt/igS4I398pFBOw1dxT?=
 =?us-ascii?Q?c96Bi3x+oveHtj65Oqfp3XCtB+jtEYfiCFY842Mzl+DW/4XYqcShyZe9pCZt?=
 =?us-ascii?Q?zqi5nUYouK33yqNWE0xw+VjrJU9xjWx7ZgpL3ACDxZWNNrvbJcQRVhkx1R5B?=
 =?us-ascii?Q?IH41yTPId08tzx92J6oXSRoORuNT702bMkpZ5DHwHnKbcGSgY/XJt4pMM5YV?=
 =?us-ascii?Q?Fv7TH5ILkGB32a1z3ETSPDI7HuOgOLn9ns50t/PDHgVmL3X9XA57deYFZsw2?=
 =?us-ascii?Q?aaGMaG6MKgvobz/a2w+fTUj41GQkVkcl24CJUK8XFflCHwQzFoWp30txdo3Z?=
 =?us-ascii?Q?mer6fD1wuW3cSujEPQDWEWfz+vHWDg3+lKs6jaDy23Er8ag98G1XLMeaigtM?=
 =?us-ascii?Q?FbQZQAEaiANCPyFsCJcqQ6wyf+zTMLvPTLROXS9CWSZE7IPeulCANBSqijD9?=
 =?us-ascii?Q?33PNXV82pONs2MzXixAVDxb89cwzD15AlFTRSA8s8lXiCkvf3CQXA6Bv1sPb?=
 =?us-ascii?Q?6yx0ZG+unhRgasSh/lQ4jhoBAuqh9atzyl1Q8FLf/s94eUdCW6+cGW3OQCCV?=
 =?us-ascii?Q?zQOYv2H5F3xFvCf2nVUjxQutNsfc5YkQwEhzOvCBbA6+qxfuDwFNVVyrL9Np?=
 =?us-ascii?Q?zH+K7iVe69E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CrxIc2WgLJEX2c06VrtSPGVO+HJDfUxn5pMyO+uRTuZx4UsVyzu8pHKYUgC0?=
 =?us-ascii?Q?eHsfCPDllnzbhyzl4/3Nejc7/jcs/UL19QH35gpTiS/FF1lUBq9NyIb0FZEM?=
 =?us-ascii?Q?9PH1mbzK8PTh2/3Rjbl9UZAzf4Sm6A3ezZiU74fXJKKbZMSNgPuBdCSioKYs?=
 =?us-ascii?Q?n2lLz2T88SMXQY37IqCvho3OqoEPo5lbahpNsET1FVlF2TKkaID7cj2leYKl?=
 =?us-ascii?Q?ApCL5gTF+1CgcJrVYLgrjOEpf+/7avBdO6nEd4ro77i0lFzlAZ6jKQTSApzD?=
 =?us-ascii?Q?eNrPd7prf4exMFPbtRgLzvvAtQpOGAoFFit86yU+efAtL+/hk/O91KrOK0m8?=
 =?us-ascii?Q?3pLP0Xtiq2FzuGMWMIu5/egWeIl8LkAjaF6LMv5hItDLMKZixLDQql+GnAUf?=
 =?us-ascii?Q?GFRQbJ3Al1j8DwX2oUnMX1KQkQ1Dudi9v0jXlRbGAHrLgWaG78u2bkKXtyY4?=
 =?us-ascii?Q?xYTzx371VFyAYl/9rE0JZ3gDZXV+TkywKTpBWw81qsJLecRg20JR/ov5k0SP?=
 =?us-ascii?Q?UtArFRRB61G6Rgpo2sJHy4uZ5cY17JDKZTxkE5pRLT6app/0xtWH6FJO/Xtl?=
 =?us-ascii?Q?fcapNQ/4U56u84tlk6+YnFjrF3EYRHOo0oTb1HyI0t3u3AtEd0ZAmAH/mXQh?=
 =?us-ascii?Q?/fHtf7fqJmFdme8bFocg7ldcm3dDnQlQcnEBlvtkJycYy8CWyyKaE1NAPK+I?=
 =?us-ascii?Q?8M2JC6oWU1cvI2wexHsuRiyoAMtFMAkFLmcVhnS68ePQ+iqbRkCCFS4VtOAq?=
 =?us-ascii?Q?8jCDUvm/xM1/RUAyCtYT+Oun/Dlh5sw1wg4PqTSuET+NZ9Yt8FdNd95WmmnR?=
 =?us-ascii?Q?KLz6lG9GygvaLVCBP0cFctdQrFW3+ZvblL20TXZWTw9vuAbb/9NsJvqJJ6+w?=
 =?us-ascii?Q?gP8OQGG8yEsNySZSKy/kCY/Co8tT0Jzzmy431Wht7T9fowO/TgjkxsTJq3ak?=
 =?us-ascii?Q?Wjm+7ZBxPNeya5gQEVrzAGDakpZPQ1NOOdaat4oiFfw0xxiyRV0WVwbIn2Gd?=
 =?us-ascii?Q?heg/snCp5/j1qaMqAqSoJ6o+xHep7I2ejjh6Ip8wQN1gcQrFhzJBWEtpLkfr?=
 =?us-ascii?Q?ACvoSa7dA4TGrx/6L9c/BmYoexSMpp9rotGMsi7nVE8SnteEubrucQdRSsXJ?=
 =?us-ascii?Q?9UFYxpXmmyqwuaib44S2UK1rlgfgOyjskOuaYmt9ry+huUHW6MHi7t5Ac9a6?=
 =?us-ascii?Q?/kCc5MfBuvMgnbgKesAVnO74E66q8UIRF61a+W6/0h0xScyLGFUaoZkE9eSd?=
 =?us-ascii?Q?83BL9NxWiE9fTCGkGhhIfWtv/dPsRMoonFxQDQlWnoac3L/kMC3A/X92SbY7?=
 =?us-ascii?Q?SG9oML/G8/w+lu55GdmM8Er9AvMigKxmqHclUwGV/JvcbCegtPrRLrxwxPjB?=
 =?us-ascii?Q?/nGY+EpZET9w2cEHp396pHcv1mvCIa3OPdXqHxn2mGYGlypZj02BGo0wrMv7?=
 =?us-ascii?Q?jIw6aqiTJ4R/1cMFgpf8idZ8K+Rge/VWJ+R64UFAYuqqyBOAasR3q8aV9pd7?=
 =?us-ascii?Q?XBHG/lJooJQ/ya6npD15jL18qe2xzmSgeJPgqMlkS5V41hTOYmE+RqdQJ7dS?=
 =?us-ascii?Q?IgCC7IpLhVLD4rpezhFUylizPlvpviw9On3Z/wAd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RAmqs4IofpB0Kn2evkCOV8d+jdJwaepjP+wh+pspUUV4BhOrT3TFjuQDJXLHWMCyXqkWxWY/2tp2RqXUOLfi7EyfIRERBfSs0RJRegeRGFVT6nTjmkP8f1Q2vr7ZQaCNPQ+T0PrkOdwiJmaofp58OaT6XIr2X2dRhB7O3GWo/AcXr4M/l2EHY0ru3ZHRysbAHvMuydnosaQbAhVR/h8btscH2epNVts7Pb5QmRfQNNG2nuCmj2rT0pQ8oum7qrgHHwFmaSooqgI4oleXKeanZTzDHi21nZb3eKSbU4xqFYtJx5Z6cx8QezRAU2EwNATAMtEzECLy8PKpp5SEnzEDyoE5x3HBBF6AyfzTdwUZBTfGlU/2bf4vCF1wnMYMsSsAXYLcy0nCUNt8KkexauI0Dq79pJNOvgJUGRRGr86V+MPDkfBUMcqVzAY16gtdtGjAcS1ojx4yF43EDicSvradYbQOnLSu1nq76kVhobIpZiP4sDgBrbKoL6HoOdH4kfw+y8yUmIpULBt17jdZCIA0UkJCjojU+6Ssr3Wj40cRmWZyDE11eYrlMCvpcPcqdymVgMVHM4stvubExrmsbJo868LFzVjD2TvGZ28unqxLxMgaAUTzT8eq64TTUT37x5O0
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd54b6f7-730c-4510-91df-08dd969bb6ef
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 06:09:29.0963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3K6lMbuN6ffbLYc4/+wO2bmbT7b0btkmcH7k0+noP1U7AWtJ/bN8LVyRrIxOyjkRXNU3rQRmzdVn7z+rCqU8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P192MB2372
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PA2P192MB2372.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA1NiBTYWx0ZWRfXwM3YvNmPa9r1 hu5BgPHkQXfINe3TPHCjwQ6XHNYzcNxIjzReIlgPBXGq23T9GYqEZiaDZqtMS4L8sSZdxNzL26H thIr/rc7we/r9QSw+7CTzTF60h2X+/db0VCpXhJShz+EXZs3Dbz81RwrdOAOc2F2UejP5SC/hf1
 EVZssSurAOsIAS1/y+net0RtjvRg2zBWJp2nW1pbD6aatZn5RSqbZNQ7A92qrVlgQuqxEAjNKpX zaZm2hCMtSXap2mSVUBi4n4KwvhbhKg6xh3BIvjdf0MxmUVq5PzI7juNo2cEc5pX4btfH3Juida /lBY6TWdSewy5JChkSEfbtiNEk8eDDnabNzOB+Uwuq+C0+Ni4/iAjtnKl9NUZQWm1kHmtzsaYwx
 moUeVoWmJFXSrbZgFaMGOWnc10TDa4iLd7m1R8J4CfxTbB6Y0nm6A0WHYtRmebaGQGZX4wSy
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=682acb1c cx=c_pps a=QRoYqyLXmD/jTdENOd4DaA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=NzcaUS6rk3g4BAHRJagA:9 a=CjuIK1q_8ugA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: kkol37HLowcpO26pYJfA_2GQU0rjO1Ek
X-Proofpoint-GUID: kkol37HLowcpO26pYJfA_2GQU0rjO1Ek

Am Fri, May 16, 2025 at 09:13:46AM -0600 schrieb Jeff Hugo:
> On 5/15/2025 3:55 AM, Alexander Wilhelm wrote:
> > On big endian platforms like PowerPC the DMA address and size are required
> > to be swapped. Otherwise the MHI bus does not start properly. The following
> > example shows the error messages by using qcn9274 wireless radio module
> > with ath12k driver:
> > 
> >      ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
> >      ath12k_pci 0001:01:00.0: MSI vectors: 1
> >      ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
> >      ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
> >      ath12k_pci 0001:01:00.0: failed to start mhi: -110
> >      ath12k_pci 0001:01:00.0: failed to power up :-110
> >      ath12k_pci 0001:01:00.0: failed to create soc core: -110
> >      ath12k_pci 0001:01:00.0: failed to init core: -110
> >      ath12k_pci: probe of 0001:01:00.0 failed with error -110
> > 
> 
> Fixes?

Yes, it does. But I see know that the commit message is not clear enough.
I'll fix that.

Best regards
Alexander Wilhelm

> 
> > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> 
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

