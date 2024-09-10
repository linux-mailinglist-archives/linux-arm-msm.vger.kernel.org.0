Return-Path: <linux-arm-msm+bounces-31413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1C9737D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 14:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CFA4286921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 12:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B37B190676;
	Tue, 10 Sep 2024 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEMfgPS7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5571DFE8;
	Tue, 10 Sep 2024 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972450; cv=fail; b=iXzeV71HFwrXjYaxXCpIwKocwxAM12HQlwja2nZhzGZeGhHj7rymSR/Wq0em2H8PKiwbmFQncZCa9vSo8yQMP3qp1mMPG8IpMzu03X6hALTlbmOvUNz117OCnFk+abDcgK2aQLLM8jQmDbjprzz0/i3N/mRcrexGB62yrRDqCDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972450; c=relaxed/simple;
	bh=rmq6nH73HMh54fGpHV8CpzJRLnmxlPRgXeSB/VISF1E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sCLKSaIZxPYxBPSZTSy+1fDQ+bfdS4MX/HYipHJzCq0+25fk6SXsK0WFVLbCGkZ6Aqm7sVVITqpLuYt6p0eBdMG/ks/LZK1gRoEAaO/FaK42/JWsH91jkTHRs3zx2SDz0ULaYFFs/KosD7f07FQAFuWMh5WUyXiiEdS9EWW+tHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEMfgPS7; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A4FwuT013469;
	Tue, 10 Sep 2024 12:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8rwwQ2H71f6acmHbbTJ/b/9XLCxv8Wya0IZpRWVCJE=; b=KEMfgPS7QuWL2+Rl
	SPqIdpHLmswLBpti1dj4pxB/bA+ES3dVoicPYZhG/+dDNMZ5BXRH/pqnaiHZVW+V
	cwz50cYZnWOinMzvEXZJ502Jht1dYmMLdf81sovxCuzeDHxdCbd7+CerYZBjKR6x
	vvsokjACUe1BPaCUJkjd4ds2xZNnTSd0+L2IXRqjJ8kyq7n4tzTU0GxsXNNmJDQ3
	pONhL32UAHo20AaqJVPkE/ji8A4m7M8i5nzqNoPKoGDDETypG8Bol8T8ElEOFUwe
	o20akeEfF/LPvsbwGbFV9QAPq3l/1iVXV8nY8gad737SfgoZQMzoXpL7wGyWj5Az
	E9ZK6A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6snxvn-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 12:47:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kt71yLk/yiPIGmOp2KuG7I3+0JjvkvkaPyt+UWDyxVxPxOl2dED9Y4giLy1yr0XB9E/d5MFOHCB2KVP+Pxz3S1+r6Hd9ASXf56p/VoD7JbjZdPq/1Swwzcm3QlHna37bgtEOanLNXtA+Q8pBuMBkyBpMqftFh8Fq6eaJIodqxDtB8pR7huMyXJen6/CA6GbO+7PkaqINSt5v0O07DqmMo2Offb1EnZ+ablL5cvi6hwIrvQ/YWPfFnNCSsBG+Vlekpytt6799ixUS9+bCgei6LM5QJ+3wn6Iqm7OptwHLLxvY/5HvmNBmhVvpsr3Ptq1UodTH99hQKFMAMWWISpcHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8rwwQ2H71f6acmHbbTJ/b/9XLCxv8Wya0IZpRWVCJE=;
 b=I5NREdpacgycqYR1W8Jqf6Tj8TyhAfzV5nDrw3TyQnxYi+ZjP41uBYFDoVc1mrIjRHTBdR12H0Jr0lNzSRNVahaasuG71C19rrW4joHnvrR2IFsfh9vRhYtMd0HUKsbtohzPO308E416v/kiIRDMonYIkZjQYrWlRvYcwnB1s9VhxjI1lDJLJX9zK11k5EuPyCXs1I7LSCj7dLuho92M5wrfwY4vtxEJVXRMkhggchJ6P/bA+MXG91gpG6O8zstPGHyVIIsBv9ymQ2Yx4cLRDcWCBLqFiBjwoDmoJaclyUknNDByg0EuNQOWd+3Romt81kuVmOlQtH1952YgfSOLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CYYPR02MB9788.namprd02.prod.outlook.com (2603:10b6:930:b9::10)
 by MWHPR02MB10427.namprd02.prod.outlook.com (2603:10b6:303:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 12:47:09 +0000
Received: from CYYPR02MB9788.namprd02.prod.outlook.com
 ([fe80::ec21:28ed:812b:5270]) by CYYPR02MB9788.namprd02.prod.outlook.com
 ([fe80::ec21:28ed:812b:5270%5]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 12:47:08 +0000
From: Suraj Jaiswal <jsuraj@qti.qualcomm.com>
To: Andrew Halaney <ahalaney@redhat.com>,
        "Suraj Jaiswal (QUIC)"
	<quic_jsuraj@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>,
        "bhupesh.sharma@linaro.org"
	<bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose
 Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>, Rob Herring <robh@kernel.org>,
        kernel
	<kernel@quicinc.com>
Subject: RE: [PATCH net] net: stmmac: Stop using a single dma_map() for
 multiple descriptors
Thread-Topic: [PATCH net] net: stmmac: Stop using a single dma_map() for
 multiple descriptors
Thread-Index: AQHa/R4ePGfgKVjZ6Uifzf7R+/RambJGo9cAgApf3IA=
Date: Tue, 10 Sep 2024 12:47:08 +0000
Message-ID:
 <CYYPR02MB9788F524C9A5B3471871E055E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
 <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
In-Reply-To: <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR02MB9788:EE_|MWHPR02MB10427:EE_
x-ms-office365-filtering-correlation-id: 6c0d09a1-2234-4285-fd88-08dcd196aee1
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oCf/cVW4c1iAb178M/lAcaYh7wOSV19QWX8FIUaZnmph+OI4eC8wy7Y143q1?=
 =?us-ascii?Q?hhIVAubfIxRULCWJi8uk+wm470m1wTdIe0GeeMPldjPhhH1ns5GY7zqUpb0C?=
 =?us-ascii?Q?WxQR0HNKVKRXp1p8jVGRIvIzDVJnAqn4QfPyuC4189UtdCPxBuuqfVGMqMVc?=
 =?us-ascii?Q?TD/95pC77UA9lo8xd7WuNe2P2frAl25t5sQ3vunpgFFAmCpWxxLUHT24MxVA?=
 =?us-ascii?Q?Nd7QWVkK23kzDqrDQgICJtcJ8kVNRnFWUpw7+zXVEwqsyQUJ0ynKXge5Yszr?=
 =?us-ascii?Q?b1jL0+b1GunohylCZK0GHRLr9L75HWvKB6xbL9HCSVU3NGH6lltYj8llzhIZ?=
 =?us-ascii?Q?yZ/1qZZEjDcJceK/4Xmk0uWtyAzPeWy8W3SnJ6hdO+x62ZWG031rFoadQwD2?=
 =?us-ascii?Q?b+tA9oo1MPkiGmvLl12MAtk9VrPoEcDjm5Cx5hVVB2712BlJ21rZLIvY6FqN?=
 =?us-ascii?Q?BftUgrvvZgmU3P02KvbNEvR0UAyZ9CaNrBJsrQg6EketouYNwzrTCWOAolv9?=
 =?us-ascii?Q?1kKX0yhM8kEIGkWffNiKpZuktDSXG9MPP9QPH5BspAM0ziYxZCStgHcldtL4?=
 =?us-ascii?Q?6zXjuHdjP5Perj2m+6tHuYyEZYKax2gN/zUMQRxatw3dDY7gH/ytwjBgCAgF?=
 =?us-ascii?Q?Rbg0N3rKqmqeQDbQWr9KOBcGD1ZlY1lPkP2uM2le3Nko88gJzhH12LjLe+WT?=
 =?us-ascii?Q?sssd6xs8OYYO56oQYEzcY+TqU0jjShyQ5tw6bcjLj8IR0R7lgkTBPvYd0X2l?=
 =?us-ascii?Q?AoJmrDCJfUdaSDTqlaJkRgyEXf6PVYfP2JExwfVhTMtBrgrem02QrmlcEJyF?=
 =?us-ascii?Q?BTJQukQcepaUxbNviL8wGZzNzEXyQLblNnMr3truavqfTYbpe2Na7kmBqLWx?=
 =?us-ascii?Q?zjB7o8eKdO2FyGggmaaQkUF3w9E1ZVRrKgCY1czOiARg4+csuLXifJgPty2X?=
 =?us-ascii?Q?kR3yitkIb7uZ/8gAAPsi5/KYITzhicfypgzf3GQ81nVPfU8ffq+nlnecOxga?=
 =?us-ascii?Q?pEFaiY0ojAw8/0dJQKbg68Rtm3YzJsFYu8JCzRYhneuo++4pIlfDQ2gryGCb?=
 =?us-ascii?Q?w1sLJvXEJzXO33/G02RVzh2U5bOU7i/HhmEhZlOQ/hbGCva/A1S9hC3ONcBN?=
 =?us-ascii?Q?jOi6eG+mTTESkx6Q1bli4UrWX84BlkxljhebCYX2PWp5MewykhWrNmNBl0rx?=
 =?us-ascii?Q?l4DwTzhNuRFyxyqsb3jOiyGQNUXiC/j2IILEUlnK49Sfc565aoyWMb/J+fwk?=
 =?us-ascii?Q?HSaqsGE2GMdqHdy7ncRaEb5lGL0IMV14jTR/HFdCh1HXrjqstdbPAgcxipxg?=
 =?us-ascii?Q?iYdd45ubvET16fixAMHWfELKat4FiEiGBfp0FGNeS7RCkyFzEMrWl/BJhqk7?=
 =?us-ascii?Q?4R4D+0x2AruecNWN84TOiM4M9k8PeXHS6VNiNvOkU2iEbyrYOw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR02MB9788.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3KCdZKeTV65yYkRW7Lf2icVkAD0SfmMMY+m+d8LkmkYCeTEoZK6pTsNEwtVV?=
 =?us-ascii?Q?GaDADTq3BBIo9iK8OiY7FkofcXY6cmw3efr4ozqxwXy08TNA/d/V14WFCWqE?=
 =?us-ascii?Q?H3SnEfmFrPi9ficUPTQUOgs7Sdk1cO9nXsOLtx4OvSGu6ocwt/+PvWLrmOEw?=
 =?us-ascii?Q?ZjmhWpRSnnEblmewqPzPlyVuOr390v6lDot12L10aONW1khvNpKcFhWKZjcT?=
 =?us-ascii?Q?P6SJ/+FL1BfLJsWZ3oe8Cf4GBEPEKxgvIO5lsJXpOQj8IXcgrX+TKJ0Owdk2?=
 =?us-ascii?Q?EyOnb2PuCdCvCCaxytpx6lvPGyu3R2OUeCUGy4CtcFMNylY92N6yCk3MMbYP?=
 =?us-ascii?Q?w3Clz3Vx1y2krMY92JOnbvglhHwYN5R+IrTjCeybWnDzId1SQucuU39GCp6D?=
 =?us-ascii?Q?n1xKELQ42Oi3W5T0ns/hRmVY4FMh1YnRsP0JU2cc1lUQ22a9oriz0CjxgPl3?=
 =?us-ascii?Q?woMndazaIn8jFsR4yeo2l4OvLPR6rFs003BBkBwGpx/kKP7umlgS8eKktmYU?=
 =?us-ascii?Q?k3N9xH3kO0JETqWpOWaDkEBeHpOdBn3kJIoZkYDUCLX/wEpswy8EI/gc+b3Y?=
 =?us-ascii?Q?W3OxeQOC7f3U8Uj1KzeIC2xiRIUxnYB5yoN/kFR1Wf8UAn6cURYrElZofp/V?=
 =?us-ascii?Q?Zv7/l43lk3naSMWEp3KUvaWVnsuJ/U1XMIwZm1gc097f7wjUJcwCY9olT64y?=
 =?us-ascii?Q?JdXnG6aRfztlu/CnWL01kD6aPWdr0QfNGluIR/qSgzkfrK8eVZ1hAPPk0Dct?=
 =?us-ascii?Q?9L5jusD4HK5EgZCfxGHF5VPS1LSBsnPX4sDhXi7+P4Zq6pcCbTwOJi6zaGhr?=
 =?us-ascii?Q?TKKbhCrHSgjOiVT9KSrF70GacP976n0PF8g1LAe/lMfuiJR/lmqUAYkreDJa?=
 =?us-ascii?Q?TcJkL10j2FHjoeLBXITb+JPNa4QcAiDrirUyD3FlmLXWZ+ZfmaHORtwQxB8b?=
 =?us-ascii?Q?vF4wD/MLXFYdlT3XDJopMmvhVQBnBd43UcSeWAWxw61+MZk/0oLMYsCGT5qC?=
 =?us-ascii?Q?oV4QAxtcwmasKiHFGVgO1NlrfLNYuGnfLIe22FDY6FqsbYDl3r1wnYY3mruZ?=
 =?us-ascii?Q?adA/1rIulPIM6/t0tL5UlNq4wiNPA0rWe9F5LbwLHZaF09ewmroiJ7TxBLI4?=
 =?us-ascii?Q?7u49YNOGTxcd1F3pA78kgaS2s3NDKeOIsbhC7F3snFbLc6Yyf+xv16soUllI?=
 =?us-ascii?Q?bTNnTaQD7asxVQaiLC4l4K+DcpC4LYdH+5exwsYwygp1w2/akvmV6R8hH4ag?=
 =?us-ascii?Q?KODjI42J5VHwsq8+1ihoI9E0p2krLYGV356bkEphSepX0cEN0wfR100Zl9ij?=
 =?us-ascii?Q?bNXmh36qjy1D8ALaXFGiH7iEwx1m3mMf/QIdaVHSXByMwSDJXolOuB6Vhefz?=
 =?us-ascii?Q?PHqLeWJ5bk0zZA0bdzz0/85g6Yggj+fdyQVMNIFVT1mAvKFWaQAMQPs9tEwH?=
 =?us-ascii?Q?Q2NxW6q6fQHFNwE7qC/z1oft5Wk6fxG4hyTas3oIebxwJj5f50RNZABsLfN8?=
 =?us-ascii?Q?vDKnGIBmRyvSLymtBPmHT0ypHCF1tmd+U4GSpc55JBBrSM6WfkxPo5+3+U1J?=
 =?us-ascii?Q?y6ahtRp0gHa2M0mbwUcgB3ZGkJ71eBn5L4kjedNq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kr3HPltCAs7s+tNYYWDUMqn9tLqNzxi/WJFPEaGEJu7zf1mDqSnPfcSYC6fN8HuEOqa1ry8+b+WvIA6Qs7rKx5PyXCpXINafCJVVgimdGNtEOhc60Ah28Ah5tQIYIOfnSzwDvvCcm0uQUbuRewbYfiw++aXUEzM+L/2X/sis+oLSYNhgcN5iFP/OLB73lwffWJWiUJ7Y0QH6V/+XW6w89xFSS6axHDC+iMpsDtE6uR8LwkwobRAkLE6gmkzG5iQtOel/Uz8hChFRHDiNPvSsHBxhUJ8b8rUx0gVhogLMRzp7D5jW7Fmx+7Bx/DoSj7O4AualQ5MulOJ3c7lWXPUrbsAZ3PDgPvj5ukjEHYJeO4eu3/H57g9e4hJ+jcuz7JyB3n7MiaWkd46+N6KRFpWz0ywvHhLWuDDUEPeiaWaWK7yNIXHbOrxK0qU7BAUZ7oQf8DCp/x13Hqy/6toX/9DzQAFafX0aEppw8MIWyewBYd9NWQ/8JSq7al6Ky0Dcx8fGwQYcDmsLtYvG9/MyEb3/voAg5Ci0qfqonv297j3yCOtU/IMDu6Is8i//l5rhb1NyY0sADONGXOMyFrcazEUXVxJmSM6Ur/1KDDDuYnMMkThWECOqZjOykTz6eG0/cyyV
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR02MB9788.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0d09a1-2234-4285-fd88-08dcd196aee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 12:47:08.9026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVI47RCxg2BiBetrxTe1ORTYK/1SkEAvRJ9fB9qPp0N2Z4giwB7qgY0TWurai6Y+hLZRSNKAO5mWR9AHwyhllA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB10427
X-Proofpoint-GUID: iJ4C16pqMkEpvXMKFU82DdnawfO3QslO
X-Proofpoint-ORIG-GUID: iJ4C16pqMkEpvXMKFU82DdnawfO3QslO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100095



-----Original Message-----
From: Andrew Halaney <ahalaney@redhat.com>=20
Sent: Wednesday, September 4, 2024 3:47 AM
To: Suraj Jaiswal (QUIC) <quic_jsuraj@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>; bhupesh.sharma@linaro.org; Andy Gross <a=
gross@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Konrad Dybcio <k=
onrad.dybcio@linaro.org>; David S. Miller <davem@davemloft.net>; Eric Dumaz=
et <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Rob Herring <ro=
bh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>;=
 Conor Dooley <conor+dt@kernel.org>; Alexandre Torgue <alexandre.torgue@fos=
s.st.com>; Jose Abreu <joabreu@synopsys.com>; Maxime Coquelin <mcoquelin.st=
m32@gmail.com>; netdev@vger.kernel.org; linux-arm-msm@vger.kernel.org; devi=
cetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-stm32@st-md-mai=
lman.stormreply.com; Prasad Sodagudi <psodagud@quicinc.com>; Rob Herring <r=
obh@kernel.org>; kernel <kernel@quicinc.com>
Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for mul=
tiple descriptors

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
> Currently same page address is shared
> between multiple buffer addresses and causing smmu fault for other=20
> descriptor if address hold by one descriptor got cleaned.
> Allocate separate buffer address for each descriptor for TSO path so=20
> that if one descriptor cleared it should not clean other descriptor=20
> address.

I think maybe you mean something like:

    Currently in the TSO case a page is mapped with dma_map_single(), and t=
hen
    the resulting dma address is referenced (and offset) by multiple
    descriptors until the whole region is programmed into the descriptors.

    This makes it possible for stmmac_tx_clean() to dma_unmap() the first o=
f the
    already processed descriptors, while the rest are still being processed
    by the DMA engine. This leads to an iommu fault due to the DMA engine u=
sing
    unmapped memory as seen below:

    <insert splat>

    You can reproduce this easily by <reproduction steps>.

    To fix this, let's map each descriptor's memory reference individually.
    This way there's no risk of unmapping a region that's still being
    referenced by the DMA engine in a later descriptor.

That's a bit nitpicky wording wise, but your first sentence is hard for me =
to follow (buffer addresses seems to mean descriptor?). I think showing a s=
plat and mentioning how to reproduce is always a bonus as well.

>
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>

Fixes: ?

At a quick glance I think its f748be531d70 ("stmmac: support new GMAC4")

> ---
>
> Changes since v2:
> - Fixed function description
> - Fixed handling of return value.
>

This is v1 as far as netdev is concerned :)

>
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 63=20
> ++++++++++++-------
>  1 file changed, 42 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c=20
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 83b654b7a9fd..5948774c403f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4136,16 +4136,18 @@ static bool stmmac_vlan_insert(struct=20
> stmmac_priv *priv, struct sk_buff *skb,
>  /**
>   *  stmmac_tso_allocator - close entry point of the driver
>   *  @priv: driver private structure
> - *  @des: buffer start address
> + *  @addr: Contains either skb frag address or skb->data address
>   *  @total_len: total length to fill in descriptors
>   *  @last_segment: condition for the last descriptor
>   *  @queue: TX queue index
> + * @is_skb_frag: condition to check whether skb data is part of=20
> + fragment or not
>   *  Description:
>   *  This function fills descriptor and request new descriptors according=
 to
>   *  buffer length to fill
> + *  This function returns 0 on success else -ERRNO on fail
>   */
> -static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t de=
s,
> -                              int total_len, bool last_segment, u32 queu=
e)
> +static int stmmac_tso_allocator(struct stmmac_priv *priv, void *addr,
> +                             int total_len, bool last_segment, u32=20
> +queue, bool is_skb_frag)
>  {
>       struct stmmac_tx_queue *tx_q =3D &priv->dma_conf.tx_queue[queue];
>       struct dma_desc *desc;
> @@ -4153,6 +4155,8 @@ static void stmmac_tso_allocator(struct stmmac_priv=
 *priv, dma_addr_t des,
>       int tmp_len;
>
>       tmp_len =3D total_len;
> +     unsigned int offset =3D 0;
> +     unsigned char *data =3D addr;

Reverse xmas tree order, offset is always set below so you could just decla=
re it, and data really doesn't seem necessary to me vs using addr directly.
<Suraj> done.

https://docs.kernel.org/process/maintainer-netdev.html#local-variable-order=
ing-reverse-xmas-tree-rcs

>
>       while (tmp_len > 0) {
>               dma_addr_t curr_addr;
> @@ -4161,20 +4165,44 @@ static void stmmac_tso_allocator(struct stmmac_pr=
iv *priv, dma_addr_t des,
>                                               priv->dma_conf.dma_tx_size)=
;
>               WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
>
> +             buff_size =3D tmp_len >=3D TSO_MAX_BUFF_SIZE ?=20
> + TSO_MAX_BUFF_SIZE : tmp_len;
> +
>               if (tx_q->tbs & STMMAC_TBS_AVAIL)
>                       desc =3D &tx_q->dma_entx[tx_q->cur_tx].basic;
>               else
>                       desc =3D &tx_q->dma_tx[tx_q->cur_tx];
>
> -             curr_addr =3D des + (total_len - tmp_len);
> +             offset =3D total_len - tmp_len;
> +             if (!is_skb_frag) {
> +                     curr_addr =3D dma_map_single(priv->device, data + o=
ffset, buff_size,
> +                                                DMA_TO_DEVICE);

Instead of defining "data" above, can't you just use "addr" directly here?

> +
> +                     if (dma_mapping_error(priv->device, curr_addr))
> +                             return -ENOMEM;
> +
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].buf =3D curr_addr=
;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].len =3D buff_size=
;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page =3D f=
alse;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type =3D STMM=
AC_TXBUF_T_SKB;
> +             } else {
> +                     curr_addr =3D skb_frag_dma_map(priv->device, addr, =
offset,
> +                                                  buff_size,
> +                                                  DMA_TO_DEVICE);
> +
> +                     if (dma_mapping_error(priv->device, curr_addr))
> +                             return -ENOMEM;
> +
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].buf =3D curr_addr=
;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].len =3D buff_size=
;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page =3D t=
rue;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type =3D STMM=
AC_TXBUF_T_SKB;
> +             }
> +
>               if (priv->dma_cap.addr64 <=3D 32)
>                       desc->des0 =3D cpu_to_le32(curr_addr);
>               else
>                       stmmac_set_desc_addr(priv, desc, curr_addr);
>
> -             buff_size =3D tmp_len >=3D TSO_MAX_BUFF_SIZE ?
> -                         TSO_MAX_BUFF_SIZE : tmp_len;
> -
>               stmmac_prepare_tso_tx_desc(priv, desc, 0, buff_size,
>                               0, 1,
>                               (last_segment) && (tmp_len <=3D=20
> TSO_MAX_BUFF_SIZE), @@ -4182,6 +4210,7 @@ static void=20
> stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
>
>               tmp_len -=3D TSO_MAX_BUFF_SIZE;
>       }
> +     return 0;

nit: add a newline before return 0

>  }
>
>  static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int=20
> queue) @@ -4351,25 +4380,17 @@ static netdev_tx_t stmmac_tso_xmit(struct =
sk_buff *skb, struct net_device *dev)
>               pay_len =3D 0;
>       }
>
> -     stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags =3D=3D 0), que=
ue);
> +     if (stmmac_tso_allocator(priv, (skb->data + proto_hdr_len),
> +                              tmp_pay_len, nfrags =3D=3D 0, queue, false=
))
> +             goto dma_map_err;

Changing the second argument here is subtly changing the dma_cap.addr64 <=
=3D 32 case right before this. Is that intentional?

i.e., prior, pretend des =3D 0 (side note but des is a very confusing varia=
ble name for "dma address" when there's also mentions of desc meaning "desc=
riptor" in the DMA ring). In the <=3D 32 case, we'd call stmmac_tso_allocat=
or(priv, 0) and in the else case we'd call stmmac_tso_allocator(priv, 0 + p=
roto_hdr_len).

With this change in both cases its called with the (not-yet-dma-mapped)
skb->data + proto_hdr_len always (i.e. like the else case).

Honestly, the <=3D 32 case reads weird to me without this patch. It seems s=
ome of the buffer is filled but des is not properly incremented?

I don't know how this hardware is supposed to be programmed (no databook
access) but that seems fishy (and like a separate bug, which would be nice =
to squash if so in its own patch). Would you be able to explain the logic t=
here to me if it does make sense to you?

<Suraj> des can not be 0 . des 0 means dma_map_single() failed and it will =
return.
If we see if des calculation (first->des1 =3D cpu_to_le32(des + proto_hdr_l=
en);) and else case des calculator ( des +=3D proto_hdr_len;) it is adding =
proto_hdr_len to the memory that we after mapping skb->data using dma_map_s=
ingle. Same way we added proto_hdr_len in second argument .=20

>
>       /* Prepare fragments */
>       for (i =3D 0; i < nfrags; i++) {
> -             const skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> +             skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
>
> -             des =3D skb_frag_dma_map(priv->device, frag, 0,
> -                                    skb_frag_size(frag),
> -                                    DMA_TO_DEVICE);
> -             if (dma_mapping_error(priv->device, des))
> +             if (stmmac_tso_allocator(priv, frag, skb_frag_size(frag),
> +                                      (i =3D=3D nfrags - 1), queue,=20
> + true))

Personally I think it would be nice to change stmmac_tso_allocator() so you=
 can keep the frag const above... i.e. something like stmmac_tso_allocator(=
..., void *addr, ..., const skb_frag_t *frag) and just check if frag is NUL=
L to determine if you're dealing with a frag or not (instead of passing the=
 boolean in to indicate that).

I'm curious if someone else can think of a cleaner API than that for that f=
unction, even that's not super pretty...

>                       goto dma_map_err;
> -
> -             stmmac_tso_allocator(priv, des, skb_frag_size(frag),
> -                                  (i =3D=3D nfrags - 1), queue);
> -
> -             tx_q->tx_skbuff_dma[tx_q->cur_tx].buf =3D des;
> -             tx_q->tx_skbuff_dma[tx_q->cur_tx].len =3D skb_frag_size(fra=
g);
> -             tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page =3D true;
> -             tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type =3D STMMAC_TXBUF=
_T_SKB;
>       }
>
>       tx_q->tx_skbuff_dma[tx_q->cur_tx].last_segment =3D true;
> --
> 2.25.1
>


