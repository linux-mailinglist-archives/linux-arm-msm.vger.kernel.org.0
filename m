Return-Path: <linux-arm-msm+bounces-58868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC7EABEFBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68DB27AED4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFCF23E354;
	Wed, 21 May 2025 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="AzBERjlm";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="xGc7oOAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53EC23D2B0;
	Wed, 21 May 2025 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819589; cv=fail; b=ckvgznAec5UXatr9p+QHFXtz+vePC8fxZ2tPxl8g+DNSzQp56lDptkBHXCoCyMUqyVFy+XKVSybg1k/sF01A295XhHQaWvvSS1xI++hx3VHLoob8vQVEW2YIkfXS44bg6MRSetgSwkoBWfxjyVGcB0K6/IbN6NsIh3OQwI4NeMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819589; c=relaxed/simple;
	bh=5qgea70rGrTTIjlYyA0eWh67Fw0jHHIAg7fYLnJ5xyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QZu0Wj1mOd2CrtArnqm8hRZLh+P9e9LmWvmjTByAKGTHWihOxY+ZQQn6gPRg7jva3HCjUFMNK1wBVyV3l4YCcmkX/bDsHsj7jTmPzTfKVHeOLC6zwQEy3xKX0S3vhfP4YLHSChK8Cwh11gUHTBv9rXIqFfvpiYh4XMCkscLxTwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=AzBERjlm; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=xGc7oOAE; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L6i20N021072;
	Wed, 21 May 2025 11:26:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	kvNSxGLAPZ+em+piTeXsu4BndQTyaUK52Wymqo9g69Q=; b=AzBERjlm/rjPLFhQ
	0UGcckal7Q8TRyUGmih/i+pumDQlzZWGgH06u6KfOPGLpqaoV+xqaYe3fIWTGPDg
	mqS6fcHRcYwh+Rm8LTmU2gFYU9ZGNZsq3uzfdF8fGUZhzFjZ2QdQOyDVfdP96IXi
	rgH5Q3nfrZoxfEsoUAbc4oJGBkWfbqjQbTj3ZoJP7qy+uKFpqb5RFwmloVfGHKW0
	4IW08xxFzXdDZ48t+sed2vO8aNSZCKHc8RiZNUlzJ3rUbHDCID59kSWH2X5Ukaa1
	ouZGCwhZAyyP5Kxt7cmnHOYcapTCIhDCCPWhVY/dAcgbTU//NcnHpt8YRS9awnUt
	Thpr0A==
Received: from eur02-am0-obe.outbound.protection.outlook.com (mail-am0eur02lp2241.outbound.protection.outlook.com [104.47.11.241])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46rpf3haj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 11:26:10 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIs94u2JfFocA9exJ3hSvTUzXOLsiayJOZxAZCdtfzPj/GYTAS2RgDl6mfG3X/nAkRxEDYd0gsIql6bGNn7J+OKLwrFxmdNu4Uzx4gnqTZ2g1zUjuK5LSzbxdByNe/hjiItFCrcpW5EU9oAzQmsSg/5Kp2wRTqcc7pGOrOlHxFWloDvI6on0LDns8hKZLJCEya+yS2xoI0S3553tpQlRFIVcwLso3xsWSNR6Q348V37VcrvU0DZIXgIfWwz6pdSiXmTd61bVl9sog4/DR/Tsi+Xa/218oKaGnEHMt+VyPAE1ljd0oL+ThEzoRR9AybZQqUDamytFWZpMauRFY7s7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvNSxGLAPZ+em+piTeXsu4BndQTyaUK52Wymqo9g69Q=;
 b=PcTJIfpJ2EFLqWVcwZNOHgmnab+SFYeuiEkv+Pp9fa8snETyuOadjPPOwUTL2q2cHmiJv4REoysXgwvtmmeFLGEsMiSacYfGCasThFtWujrfNST8MLuHDbhwQPJfDR7w55j6I5ai9IveAyWbG8osjAFPxAuFLxEEzZUO9NDglaaXkvm4Ji37ehnq+oAh63NJZQVGZNFVrbucpeUhjhhvaJ0blt3DJ8Stq57a+upZzRaRV20XHJCD940KaTZCthHyGIwWQtSA4U5CHqvX5LJMVs98PpFkjcempQ9f5MpJqdARW4jfMo/vuOAXIkx0hpEceDH6iM0HALdLana5yiel7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvNSxGLAPZ+em+piTeXsu4BndQTyaUK52Wymqo9g69Q=;
 b=xGc7oOAEszj0ycCzKkZc8c6jsIE1skIstezpHHVvRpWgbf5ChP77KNarceFqMrH1SFHxIbpNRpvx3Awzkfey5VDmEGaToODMwxsDIHTcYtkcktGkXWejTjD4Jt7HS+8sqtEoEvrVm31hS7fQcuWBXD9boqfqcqplDvtHbo4TF5s=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PRAP192MB1481.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:29c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:26:09 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 09:26:09 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: fix endianness for QMI header
Date: Wed, 21 May 2025 11:25:54 +0200
Message-Id: <20250521092554.1026716-3-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521092554.1026716-1-alexander.wilhelm@westermo.com>
References: <20250521092554.1026716-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00007564.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3fc) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PRAP192MB1481:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5536e6-538d-4487-7305-08dd98498576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RMEgO7+eI5peAbMYTluOHZdhqbKSw6y3Y2F765b9qgkoMbEeSyD2E/75RIR6?=
 =?us-ascii?Q?pM6d2YXRK5Ny+1kwf2ICtWDwOodkn/hVU8+JTxHysEeF+36pHjoWS1srY2to?=
 =?us-ascii?Q?LitAf+N7I1wJjTIuYTf9nzlLMvRSmGE2xLyMEvq1J78Q61fTqqtGdwIFCzIn?=
 =?us-ascii?Q?QjqFqlqHYq1BR9rceDh8jSpLQCE6LBRQZDVZN82EDTIezH2LDD5XkGUY5rlR?=
 =?us-ascii?Q?CVaQgooWQg+HOX9ty9ml6wjjHLcp9G6HcRleg5F+ZXfXqjODt1tB8s3k+AOy?=
 =?us-ascii?Q?1LBSlq/5H4BJRX7oqloMlW1GJkrvaD76JshP1wTWsFebbRJTF8o3+r4MJ0/8?=
 =?us-ascii?Q?+qNUAdOL2m5ZZRnjfO4vrnsVFjA4jic4HlWc0nJmoqj5nMJpfRorsADSxiYU?=
 =?us-ascii?Q?gjkwtN8DrfULiURGb/PceHZafV8Ckf/sn3Z/ZXIHBHsQJhftnLE/SqBUI2Q4?=
 =?us-ascii?Q?QArLRbjaZhNS/1EMs31pH2LCqdRoUwuftcPQv/5eDPvvA5XMOSj9CWa11cgg?=
 =?us-ascii?Q?wPRKdkLeYoKe9tNfwSIsTNC1tB+7AUu9DgyqTA37HPOVE9b72xhlQFg7DmfG?=
 =?us-ascii?Q?Nt5RyBs/QQLIOpOS2gFgeu7sy6StYjW9tUyr45l4WvjdtwnV2LEgYMAYpRtR?=
 =?us-ascii?Q?XEE9kKOzm10EFvkRjDiuFfanKLFFkaJmwKfm9XuH/RWdsGG761M0KCizQRrj?=
 =?us-ascii?Q?ZLVC/DkPeiiV/q2qYnP1tHAX+0q7mElwGgOJ4GLBQ6ywUCjT6AReR0L9XOGX?=
 =?us-ascii?Q?MsHC8++IBfa3L1gB5yp5o+QUEYIpOpJtX6CEu6KZr5QISfwUjSnbMhyRcUc/?=
 =?us-ascii?Q?cRtmkO3/5Kx2kUdJMZQf7Dz0iVuGGKtr2EOjcK/7Wzfyc03ZKLredRpr3Qdc?=
 =?us-ascii?Q?yy+6ihLpaLtlp1aNkCCVr1wIDqY9WEZqDTyfbs3eIQhuZuj1VWg6H2SeUMdi?=
 =?us-ascii?Q?vOs1OW58DEICLEPqNu8p42Je7g/LeQlXG0HzyYQ9dehaRAhnfJkfkCRMAdhg?=
 =?us-ascii?Q?SC/BVcnMaTAY1q/d/Yh7GGvtlV8/bAMV3bX1XK7xbkhqR2ZwjrX4p9wFF5cP?=
 =?us-ascii?Q?snKN47PIy1+z2pquZBUZpuxg0nyQ5uaRdM25YM6uD1kgcMbiU1EzIAZ638LY?=
 =?us-ascii?Q?2cC51IdGtZkDaTLBYAzOPaeV53blhY2wUjAoIH9B0YphiwmtNKLOhNUu54kt?=
 =?us-ascii?Q?HVFrGCIKSl2UgC/iuf/wxDTFgapxpLcNXjfGGKi5S9c2wx75qdU34hOLjaCC?=
 =?us-ascii?Q?5jRDba1bRLCAidC5mi3wHLHWenPFxPc4Fl5iBc0aYwPZiLdkZZGbulXU+Qeu?=
 =?us-ascii?Q?86il+mjOrSuQxxxGQdTC0NfqOPlNTfXBPtY1gHVw8Lr+5AelS8YYeDTmv/h+?=
 =?us-ascii?Q?YROamedpHdAtAGvJi5nj44xggW3nSMMD8kQXztd9JxYIaGTrwBA0cnZul3iY?=
 =?us-ascii?Q?0T/ooCRwATQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6xhXLrmIeOQTY89CFIjYaC3qx2eLF9IkakrbYu/HkYgG9VgMC/ZM3gpmLAAB?=
 =?us-ascii?Q?LThOfLBDQB9u4CulbDRmuQnH0kJHftDVAGJ0lqcERW/88EzqXt84+KxZbfHB?=
 =?us-ascii?Q?dMbV3tiAZPsQLXLdVOKE0r8Nw3LU8mHeWdY2JiqoFhr9/0axqwUfNEtDIzYk?=
 =?us-ascii?Q?GmJmuSLB7gvgWDKiezRrfSP5Rto7Aljl5CeuhfEuL4XFtWeicB1CDkK7ZImT?=
 =?us-ascii?Q?YOT+8MtMyEMUiR/Dx72Xkd5P0ALp5RydLS1jQXUv9Jb6vl8KeMZIuKj0ZFJS?=
 =?us-ascii?Q?kUIbZg+xSg9JqLd6sVGFMv/ZCnhKq/I0S/wkmh0rH41PMy1uctnK71nTJy8L?=
 =?us-ascii?Q?Avo/+ZqGdEy8FNRFZZiUqrzwg4ls4tUEN2AfSQdnRWw0uO7QvR/bnCapKxGd?=
 =?us-ascii?Q?BCfAaARd2lI0Nbrt3Nuv5lamv8p7NCJ/JawAXaM9VBiBDndvKVQ0rgB8zC3M?=
 =?us-ascii?Q?lEgk24+xFKp19jg4c5F4M+N2LOstc/paVkJOrOw0fkur+lX7E4+yHaHQffjF?=
 =?us-ascii?Q?jof99ACAIrwqPadrMg8uZ+hLW+VxYZwJntnZTr+dgf3Q4+aWNqqTuqVH+Drx?=
 =?us-ascii?Q?r3tH1DzrtSyQ4+HpTj48IW6UKCP/1c60vIuXNqFVru0jKkyHR9uxplxIqKmQ?=
 =?us-ascii?Q?H8NI8dyFwEIzsR9hRLEvq9iew5NHP6ibv0D4SDlcPR6QdczHu2G+e6XF9dUW?=
 =?us-ascii?Q?a+c0UC2LGv5Jrv020sHifxx80i/O66zgGliqKPDGknduuyvVBx8hE4jt3u3Q?=
 =?us-ascii?Q?Hv84OCDisk+KBJLBOHGbzrenkMc98TuD0EHm+i9J1zqYhxFrscdw2tUeIPx3?=
 =?us-ascii?Q?rCrTdMsD3GiE+I0XdKdRgOFQT4d6nYJgz5ubsO/tuD0VhYKUICcWM+OtEkLn?=
 =?us-ascii?Q?VXFMrS8YMizK+u3JuNTZhemV3NBOnsq/3tEeAipKDAJRaP4nkij7Z0cqopRh?=
 =?us-ascii?Q?SlCG22hx1FxG7ChdQixvLVSxS8JT9tCVTFErqZ/jTiRyJET61W/ztZZRDf3/?=
 =?us-ascii?Q?YX/WnhI3IFd1z96Ed7iJTW6sJSY4EwF42bhUUqGV1O2LUvm4E5t1qAk9p8KX?=
 =?us-ascii?Q?g3KYX2Q1g2JQivNxukY3c4XvBeAh/Ps0tOWXfBHGmu4DKY+kB1bnorrSv8YZ?=
 =?us-ascii?Q?1WVeFX2MQH4qnVWJbQO8LTgyjY5PQauH43Qk/zqUBBXU2YI6nffZNJvA94Vf?=
 =?us-ascii?Q?G6OZL+b5ZtvZZow6znquum9BtYRYjzqMDauIEPmummTreePL/Wbw7uuLE657?=
 =?us-ascii?Q?YDW8kBOT18ymFOPD10asTlroSOdjUtGCnkaOo9dyHqgv4T7nA54YZ9chhigo?=
 =?us-ascii?Q?HDHjfBGZOcUc87Ov6E8oFJBIKWP76l02xhmfe374IxGHn+tPhr8qqN28e5rI?=
 =?us-ascii?Q?TMGpRxdJ+5vsGHydqqFTCYH3h6Jm68vVV7diOi4ts6lq5bX1PTbbrw7GoSDF?=
 =?us-ascii?Q?kxOyac2TdUelqtqLYCVEd2ktaWhKdsN+eOGA2iqs63hED+/ud8ENsTTuSKP/?=
 =?us-ascii?Q?IY0dQWPWwUSHfNRtFluxh1QrPYetwr/9oOdTeSdRd7gxcHOiK6OLAayYzAkz?=
 =?us-ascii?Q?buw+JWENeqE1136kEACeyE0HjhLd3Q/30YgOFCrb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BU8pSgpKosjFn6frYPuFWiMFf6HfAhGYg1ZXWRy+2ch0YVlsNW4lyE4VeU69QO8NfQHXWOce3U0JS3G9/1x/D24Zrycs/gvkKbyhWSXdOdGi5s/voudH/15iZXVHVYjBoxCxoOz7GtZVh12A6s7rRvcdxHQRXOaqStwkUKbQUsUCWgCItzsmaAeiHQXUqjb70n8LMWKRfkfZvDKPHw6FyniKj5JZ803oINGE5JLtaOXpfWZZGD32SE1dhg/CQjP2mKwto4UeGXj2lJPS3pVjQxZEwzWJjC4zn9QmgL/icnJ9Z1mNXb2XEarIkWlQ/R0jqY41BSEOyTysmX10QfF8tyxpzWKbRN8I5Qmn82mvvWJMuOX3CqTPxrvWDCbycuH37la0i+s3+IGCnr2VN1h81eBhYkt5XySxisPXfxJVjZlFsjp/Pe/Q7MpktwnL56s7vn7CN3M3/0yNfpYyW2Y6Fu5KmgONQar5PbApOHdNpLEAh/fyy5yhZlHlNEG9kuUKmCle9+cvbF7j8jf9FqoQahv+slzKxNlUIz9wcoZoMF60uARogABKtAeJoK22YxygY5PdE08QivIJvndHE8+Gbckfpxa7iRv/N/2SkITzCn5bU1kxv8EEqTuxpOiuTmkm
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5536e6-538d-4487-7305-08dd98498576
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:26:09.6397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zbhtgz3h+/sAOgAIyRVQ4AJ/yfgwX07abwJGNmCac7ZbV9pfRacRm+byEa+oG/93AqEmMtiFmFC3Oyc0uF4hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP192MB1481
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
X-OrganizationHeadersPreserved: PRAP192MB1481.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5MiBTYWx0ZWRfX3XObJKsiFkE9 SzXN27kkRgBjoTXe8AQ6vPJFf4Ue0+NlkZl+GZx4uIML0bo96vgwnj5PH5DfeYawj7uX25pn/q9 n+vNg1XNtIKaRpO5YezuMkyTzoUtlVSzUfxp0nTZkXUKvbLd4tuKS3JAxnFE8sWQVHeYwGTvUEg
 ZMgYH6wM/lC0o5SzRKNpymCjyDMb62yoHQqeZCVOna+zZMkcYLgrKoNdIJMkKw5gw86aPA4p9ee nFLSSY50IFmz2rgrREh0pm8LqTs2f31wFWZckS7CKUIRW9Imf29/Xr0oqZz7Edvnry8JS9wjJ4K 3VBuxSjaWZ51l803qXjIN8qGQJ4bVNkLPUQkSuEh6x4HNyPbzfuv8gG+loFbh8tbaUT4UAns1t1
 bFfCGW9s9Zj8phYqjovAalzcW+/hw+/fwq6M2mwg+25fn0POPfXwHX6RyVcQ3LK4DTsPwmu7
X-Authority-Analysis: v=2.4 cv=d9f1yQjE c=1 sm=1 tr=0 ts=682d9c32 cx=c_pps a=3hF9YV8LYO5BdlMZjsfr1w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=T0L45qBzl8X6T0AR6ckA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: itrQdAdlAgdzZsm8bV0qJZxfGe4hZKtf
X-Proofpoint-ORIG-GUID: itrQdAdlAgdzZsm8bV0qJZxfGe4hZKtf

The members of QMI header have to be swapped on big endian platforms. Use
__le16 types instead of u16 ones.

Fixes: 9b8a11e82615 ("soc: qcom: Introduce QMI encoder/decoder")
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c    | 6 +++---
 drivers/soc/qcom/qmi_interface.c | 6 +++---
 include/linux/soc/qcom/qmi.h     | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 7e91c0b4fc52..f031bdc48eb3 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -776,9 +776,9 @@ void *qmi_encode_message(int type, unsigned int msg_id, size_t *len,
 
 	hdr = msg;
 	hdr->type = type;
-	hdr->txn_id = txn_id;
-	hdr->msg_id = msg_id;
-	hdr->msg_len = msglen;
+	hdr->txn_id = cpu_to_le16(txn_id);
+	hdr->msg_id = cpu_to_le16(msg_id);
+	hdr->msg_len = cpu_to_le16(msglen);
 
 	*len = sizeof(*hdr) + msglen;
 
diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index bc6d6379d8b1..6500f863aae5 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -400,7 +400,7 @@ static void qmi_invoke_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
 
 	for (handler = qmi->handlers; handler->fn; handler++) {
 		if (handler->type == hdr->type &&
-		    handler->msg_id == hdr->msg_id)
+		    handler->msg_id == le16_to_cpu(hdr->msg_id))
 			break;
 	}
 
@@ -488,7 +488,7 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 	/* If this is a response, find the matching transaction handle */
 	if (hdr->type == QMI_RESPONSE) {
 		mutex_lock(&qmi->txn_lock);
-		txn = idr_find(&qmi->txns, hdr->txn_id);
+		txn = idr_find(&qmi->txns, le16_to_cpu(hdr->txn_id));
 
 		/* Ignore unexpected responses */
 		if (!txn) {
@@ -514,7 +514,7 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 	} else {
 		/* Create a txn based on the txn_id of the incoming message */
 		memset(&tmp_txn, 0, sizeof(tmp_txn));
-		tmp_txn.id = hdr->txn_id;
+		tmp_txn.id = le16_to_cpu(hdr->txn_id);
 
 		qmi_invoke_handler(qmi, sq, &tmp_txn, buf, len);
 	}
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 469e02d2aa0d..291cdc7ef49c 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -24,9 +24,9 @@ struct socket;
  */
 struct qmi_header {
 	u8 type;
-	u16 txn_id;
-	u16 msg_id;
-	u16 msg_len;
+	__le16 txn_id;
+	__le16 msg_id;
+	__le16 msg_len;
 } __packed;
 
 #define QMI_REQUEST	0
-- 
2.34.1


