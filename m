Return-Path: <linux-arm-msm+bounces-29525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA395FE51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF356B20FF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFBD748F;
	Tue, 27 Aug 2024 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Qimzh4FF";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JL1Q85kH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Lx9GsrV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2221446B5;
	Tue, 27 Aug 2024 01:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724722490; cv=fail; b=We6Sp0sYvgwjgTWA7Q4kiwZXFGF6DqqxjjPFflQpA2swOgWsM9uma/LuBj5OFQgsajv7NxFXHudhmaytZdXPMtb3dM4fwGX97jo/2q7kcUAzp33odMP5kTvwuEvXTXy69E5gXY3iT6PwViK7a0VkazYt3boqDoopHfCfso3w3Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724722490; c=relaxed/simple;
	bh=zWkuwUw8ng51yRARt0nS/FVeOmS5/vP/+2+98gvAhWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=by1AUbHe5VeQtqngUTubbqvTL0Rnd6yNCuy4tC2jKFA2ccOQ8J1x5VSG2JczOUSN9D1TDKT7MnynaXamc82GyaTMGFV7jEC/2lWO+444buM9Pe1rjLKrUh4cves+Vb4y6ulzSu5CcKkrzTWWC7kaGHuTy+OqayiNTGIM0rgv0mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Qimzh4FF; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JL1Q85kH; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Lx9GsrV8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQA5A020762;
	Mon, 26 Aug 2024 18:34:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=zWkuwUw8ng51yRARt0nS/FVeOmS5/vP/+2+98gvAhWs=; b=
	Qimzh4FFI7ISEcHx6paP8a4R9McsdJ9zLrvUcK7FTrU5UFPT7MoORB/3BuNqZcNT
	asO2V41KX6ArJDP0uIleH/dh70ZpwphQQvpf0OlLvig21lbz3APCxE2Jq6PIyDji
	307t+dNrLOs197txSr9F5sD4cemnUWmtPvJ4oJ3BBCyb8WuL7tk1QQXHf5deBKPa
	Aa1b4eUlHbwV5MbDkYb25CNdKOTDU5T1XQnVOWJ+cgfTVZgOoTxCXTygnHF9JmqS
	mW1+/zrtDXhK3qEKQ3wXSDWNbSL1/aUFH7Ae5YwtdsUhA4v6HmSjd7APnZOnXG5U
	ULhRw27/eHc2LX8BSnaLsg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417es7tgfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724722462; bh=zWkuwUw8ng51yRARt0nS/FVeOmS5/vP/+2+98gvAhWs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JL1Q85kHeaciwBptWNpmdXe4EsCjoC4XlZ8dWrh23Ug/0VGqVpEkSDt7qENRYH9VP
	 OSs4gnzSh9rWOC7sL1p2XUTsYEsRkCggQrnxchnR5uoUpbkpaCTq3hMdEKGeOyzD2m
	 g2CZtTKDUQyyDtRJ+DOlEBu/N/VA7BxxNkIxu0BYhPYPqOsH4YoxdXVIKuAxCVhmVW
	 Qg8Zomr7JsQ3Uma7QFJAznQvsF9knmjBECrE1rXNy+qMKcz+xS+2v+58tNWze1eR7+
	 SthU4m1SueD+cfxkcSwHnU0dKzMRhl0P1V4Wz4FDLKLGpzF1R3+TS6rmXNP3/IesYb
	 ktuzghWH0UyEQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F17E740130;
	Tue, 27 Aug 2024 01:34:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 49B3EA0095;
	Tue, 27 Aug 2024 01:34:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Lx9GsrV8;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C5E6440211;
	Tue, 27 Aug 2024 01:34:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzVZ5/BaGE5h13Cru28/F2i7o3/7MqOfOJKazsxOGB9bac2q5czThzui6nBrvmieotYy/FeGJu/MbzH1dQ291oZ9hBYviEiA0bxMGJf1KyTQtyi70INDQL2LTo0n9srDBgJxQT9srssn5l6IVirdJ3zL1KhDUYugm9yyY6WW2pwJjhjR4ZcL8Voun/bitq6uukrxfSpOtFo5ri63ONpuFfdscMd2/CfvzNW22gqOqpA6bPw6VBrSB4h9MZhQwRzZdOHEFQ/q4W/fqdYOmboj7dPFmoaUldK6wzrF+dxTOwkxO71oXdJRBdgVdWEI6K5EGoz0ZqoG1V9fSVkmhIV6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWkuwUw8ng51yRARt0nS/FVeOmS5/vP/+2+98gvAhWs=;
 b=cgzggDJodX8+fARA0c3zYjN8C3g1OsHYiYiTkroLtiD2vXK1OuF+K67javgJG/lwMZ9AchMjwLnXTOmhyKyuc1xPnbZlClf2clUtEp59DAaj6C21kCW/8P2qHqfwjCuDiW3OeFrRDR9GGzlt2CEER3ka60iigfjFYseS8MmwFvIH7EKtNrUO8qCG4kyDeFVWtt5ECBFIDMi/Ic83kPvJHNPFfjkLZEKIAO7JV54GD+x/syXX8uIpsNS6bYenSGjtqNkQmzvc78ytdu+XErZKPY83mn1aCV/mgt/Tllb+ja0/qUvgPDAzuPB+cXv3YhSmmC9s4ISPxxZB2cOdCmR4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWkuwUw8ng51yRARt0nS/FVeOmS5/vP/+2+98gvAhWs=;
 b=Lx9GsrV8wHtnDT+mDRCP2/voo657iTHTp+4umRersNsrHfq/Sx9g+7CM1BYJNzR0Qd+SjoOLYRGr0q5D5+PYfVPM4aMVyrZRi/WhSa7E50aWBiRLFe3sbr2czLEtw9MZPDMNtroYJIMevl5oA2K1svTw36nRvS8vsozax8TdSY0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 01:34:14 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:34:14 +0000
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
Subject: Re: [PATCH 08/11] usb: dwc3: qcom: simplify with
 devm_platform_ioremap_resource
Thread-Topic: [PATCH 08/11] usb: dwc3: qcom: simplify with
 devm_platform_ioremap_resource
Thread-Index: AQHa7jXUtnVpc8+o60aQ4EvRgBvuLbI6ZgOA
Date: Tue, 27 Aug 2024 01:34:14 +0000
Message-ID: <20240827013411.rzg7emx6zosp5krx@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-8-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-8-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ0PR12MB6711:EE_
x-ms-office365-filtering-correlation-id: 699e3711-5519-48de-fbfa-08dcc6385c15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b1NxMVZGN0RtQzZOMmpwVHgvWmJLNGR4Z1Zxb0tPbVlEUEhLVGZxTEVBdVFB?=
 =?utf-8?B?dXNQcmQ4cjczVWErN3RsRWVoNzFoblJYaHpMUWF5eUpxU2g2K3lOMkl5NFZx?=
 =?utf-8?B?TGZoTU5CZXlaUkRQVmFtNVg4V2xCYUZoaDhaSTVwd2lsdWJpdHQ2UitiMzdM?=
 =?utf-8?B?anBMcytZaDBGc3VVYWkvRmlBU3VzVXN2MmR0SUsrMmxXd3RzMmdzdFZDWjZj?=
 =?utf-8?B?eDJqRjBwRnM3a1NrUlZUaE1HRDlSdWltd0EyalIydi8rYmRZSjVQOUNiTzdo?=
 =?utf-8?B?TkpQWU5XK0hISUJWdENkbWhnSmFwR1RsNWhPaHJheGdDRWFsRCtsVi80c2s2?=
 =?utf-8?B?aXhOZ3g2dGRLdE1BcnlqMVlFdFJseDlEZDhTbEVHbWo2bzQzSFN6Mm9yUVBs?=
 =?utf-8?B?MitJQmluYXF5dkNYT2xmZDgwMW9wMDlGV0FycnlPcVhoVWtMTEpqVEIxZHB6?=
 =?utf-8?B?V3BsdXBoZTdhbkdHOFkwUEROL3ltRVJXeVlqc0l0WHdyK2hKNXhWUi9jQmRK?=
 =?utf-8?B?UEtGZGlXREJTbThQUEQxaUh5OWxta0IvakdWV3BRSVRWTHhBeUt1Q2txMU82?=
 =?utf-8?B?Vmg3RC9uSzdaYWM5YkQ2TlpYQ2pKNlNtLzJwYlNMRXdXd1FtVnp6L2h0SWVa?=
 =?utf-8?B?cTgrNUpkd0I2WEtsTVkzSnlNWlhZU20yRzZncGRFWU5nZnNWdnY5UC94Sjlr?=
 =?utf-8?B?Y0lZK0Mzd2dZQVk3QXhvZVgzaW1vbTZ4elpySmx4MXFKdm8vUjFBUWNWLzhO?=
 =?utf-8?B?NGVoQmhYZWNiN2hXdEhpS0FCYjhOSzBJOVR5aHU2NlJVcG1tejEvRzJoWWxk?=
 =?utf-8?B?UTU0dzBFQ3JEZ0NMRUVuZWZ3cnZvMnBrM2lMT0RhUlNtRFYvNUh6N2x2UkF4?=
 =?utf-8?B?WnR4UHN2dWVBWCtyTFo0WmJVS0hDZnJrd3NYMWFXZHd0Qy9XZUtjenBmam9K?=
 =?utf-8?B?ajQ1Q0oyREtvRmZnOHNaMzJ6M3haUzlsNjkrY29QWFFCYXllOWd3QjdFMDVD?=
 =?utf-8?B?TjZmbHNPK2ZUNTV4UTh6SGRCM0RkV0lwcWt6dFhDaENIVkR5QkJVZFM0SFk1?=
 =?utf-8?B?TlBsbjlHMEdETC9qUm9QY3RSK1dKc3lUN3k3M29abTVTekp3OE43bEJvYmhn?=
 =?utf-8?B?NmxsS2ZBSS83dHIwa1k0SnVsZmVObE9lTCtVenU0eVQ1ZUF1azQ5aGpLL2Rk?=
 =?utf-8?B?SWE1QUUrVCtWUmJ0a0hxZVo1RDRpV09Gb3J1bTRKRnE1ZVUvR0E1MmkwWUVU?=
 =?utf-8?B?eDdpS2c3TlhPRjFoUkpnWkg1MFRDVHhCcVlqV3ZXZHgvN2I2VHkveERCNWRJ?=
 =?utf-8?B?TEZHeU5hRU54TEtEb1RiNVM4ditENU81aWFmQzFwQUJQS0RYa1hlYUdsRUM2?=
 =?utf-8?B?M0J0N0dQSEd2dTdKbjB1dXRMY3l6dXZuUjBsTW1TWnVRTC9vSG5vRTU5STdh?=
 =?utf-8?B?aVp5UFdwV2E3OHBXVmJGTXFmeVg1RmlZQ3BDOWphTXVWVE5OVHBBdGx5dDVi?=
 =?utf-8?B?ekRQUHRTTThqdnpNTzVvbWZiQjZSMk94QXFkUDBWQmNyMStVbktMUlhmTDJK?=
 =?utf-8?B?SG5nS25VNGhkQ3hjRldZdTdSU1FvVlBkbGd0eFpCR1pBQmIvdFpzQzRCMHYr?=
 =?utf-8?B?VkhJTXMvd3JUeklyL1VjZWhmVU5UbGUwOHp4bGlsUVBaR2VmVml1NE1idEtH?=
 =?utf-8?B?bFM2ZjVBeFozYk9OWFVlR1FIV3VxUHZvNnFaQzBocXZDMWZVeWxpREtsSHVI?=
 =?utf-8?B?T1VFaGdjR092NVRNcXltMzFVUVp5Rzg3aFdnN2dVYSttaEhFNHBEQzNaZHVz?=
 =?utf-8?B?MnMwUWlwT202L2JlV0VrTy95R3dFbktreVA0S0RUcklIM2pLK2xrRGsvWlhH?=
 =?utf-8?B?VFpNQjdqVkxEN0lVeDhja3k0QktvWmZJbVdWYUFzMlJJSGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2xkcU52cDM0d1NidTYzektCdjJCYVIyOElmZ0pRZzRRUGlOYlhmTHV3WnVi?=
 =?utf-8?B?YlBtZG8wak14eGw3dnAwM1E4VDlyMSttWmVLSG8weXUrYWpBSzZoa01RTm5K?=
 =?utf-8?B?N0MweTdBTVVjRzNBZHVZTks2WEoyUVlqVEZjdDRuRU1WMnVnZjZDTE96cE1Y?=
 =?utf-8?B?U203SjFpRTRLVGEzQlN2SmtPdXRtYVJmbFVDOGVtSXpZN2V1WlhXVloxT0dv?=
 =?utf-8?B?Z1VHd0pwYUtHRXNrZjZPZkFUM0JGNXFmb3NHMWhrUVQ3YmNLSUNYM2EwZWhN?=
 =?utf-8?B?TEpWS2tuNitYeFJOeWYySjNjN2lCQmFWS0wyUWhKdTVBSm9XRFVwWXpFWThY?=
 =?utf-8?B?MEsySTRHM2N2OTJqN1U5NHk4YmJLTVRFQ2NNRHF6bDJkdnlxemVBcUxsY0V6?=
 =?utf-8?B?K2M4ejFzN1RZc2lHb0xEUUZiZDdHOWZONXorZDh3RWNvMW9SR3NPc0hzOERF?=
 =?utf-8?B?dTAwY2crcGJGMnJnZnd5bkZEMDNldU00aXJwdDk1WlNYd3g3MGJKdG93a1Vi?=
 =?utf-8?B?Wk9qS0srbDVzMmErVE1uQmVaR0w0NSs3ai9LbnliVEYxRHRqNkF1djhLRm8v?=
 =?utf-8?B?ZkxmYlAzM1ZaUER5WUg5QkNWMlU3QS8yd2tOUmc4K3h2cFNxckMwYzgvZnNJ?=
 =?utf-8?B?SUQ0ejhyWG16bXNJY1N6aFF6WUlnMVhTU1g3VkkrR0Q0ajFNQmg4YzJqaGVy?=
 =?utf-8?B?TUU5OEpUdzJhdnhDMXlNb3EvdEJPeWFvK3pmZWRnNGhUblo4aHVta3JXeVJs?=
 =?utf-8?B?Vk1jbTMyZVBxUkQwdExwM2ZKaC9vRFpVdWNQQ3pUemFvWVA3Ylp1UkRSODAy?=
 =?utf-8?B?eFVZMW1nM0NiQ2YrRENaOWg4Um1saHBjeUgrSjUray9wMnBXbGxwVHAvWDFQ?=
 =?utf-8?B?Q1hQRHN0N0FPZ0UxN3FkaWJXZFA5amtCUytZbUMveVBtUzFhVXJmTGRoaGhx?=
 =?utf-8?B?dVVieHZVNEozVFJLb0V3aThMYXlMZEpyRGFIejhDMVVCZ0tGN25JODZ3cVNF?=
 =?utf-8?B?TFFMc2I4ckdrbkVjUWgyWm1SYlpZZ25JblJmZWUyT3ZuYzV5VHpocnNVTWly?=
 =?utf-8?B?cjAzM0NlNkRoTU9GUXMxZGs3OTlxWVZvdHdvNCtPL3IwcU85R05MQldkREkr?=
 =?utf-8?B?Zm1mWXNld21UMTRVNXBEVXVVeENhcE03K1ZPMFc3TmROM3VlVkI0bndlcVRw?=
 =?utf-8?B?R210YWUrVWlNeWNIMWVqVEM2MGxiYjg3Q1NqdHlqTXBkSis1cVM1UVdMY25F?=
 =?utf-8?B?UEs2blVpLzFlRWdERk02SjMzZ0VZdVBEbFJaRTFqU1d4S2k2cjNEZG9ZZ05r?=
 =?utf-8?B?UEhPSkFGTWVyZExzVitrRFBMRGhObWZzODU2dFc4RU42Q2xIUDBvM1NsNjFM?=
 =?utf-8?B?bXFoQ1ZIeldyOTRtN1Z6UTB4WXRqdk1Ja1NoQnY0MDNjbzR3TlNmOFVmeGcr?=
 =?utf-8?B?VS9LK2tTUlVDakRpNUFDTXpXWmwxRzMxTWQwNGxRWFN3eXFpZTd6ZXdCUEMw?=
 =?utf-8?B?TlVLR1p2YlZOaVVnK1BveWNqQU1ObnI1dGNsYUV5VzZjenhJRERpY0VjQWox?=
 =?utf-8?B?dEdVMmE1eUxPM21uWGpDZ3VyMXhFc0tWV0piUTFnMzJHaXVDL1l0eHZPZStW?=
 =?utf-8?B?N2RWcExXSEY0SWo0emtRbWxxU0E1eGhKWnB0R09oSmxlT2Q2NmpGV3ovZzdG?=
 =?utf-8?B?OEpzcEJDeGEyV2s3L0lmTk5jYlJoaVhLSXo4Tncvd0thM1kra2dsSVhZdER0?=
 =?utf-8?B?aXNpeXk3L2hXeGUwUnB1QnV3VC8rWXFKZDh4clNCVjkrRnM3ZWdCaDUrR0pm?=
 =?utf-8?B?Yk4xSGprMDFya01XeHROY3YxVU1EWTRvMW5mR21oWi9yRVlWVzFIU3RONW9Q?=
 =?utf-8?B?ekh4eUZqT0s1RVI2aFUrMFBQQzJjNCtYNG5GS3NIT00wenhRY2pXWVdCRW9U?=
 =?utf-8?B?WERFZTdwRUJlUitPRitCcWVWYkNjMksyWjJkN3BWSDZtNWRSYkVjeFhla2p1?=
 =?utf-8?B?WnJ4dzFtT2FNOTJ1NWhXa0UydFdpU253V001VUxEbnB6MnBvUmlDNld3akJo?=
 =?utf-8?B?QTNhM0xGc0dLS2RMY0ZYU2ZnaFJydHlxMnZZUVhxR3lhcVhPbGh5c20rK3Ux?=
 =?utf-8?Q?ieuvohJJuNDilot/sIqEUuR7c?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9A95380934E3E43BE0B0428FD6E1C95@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B5LlTcFIbh0yPveYZ5o8q5i4+wePIfR/u9osBBdAfc/xzEx4buIB1tq8H1hyBfp1nREWFwpo+OA+LfllDyxoP6jftyl1kl5cvN8Z2HcsIz5ILps8K/fQyXp12YBRy6YiGFg3+BdcYJoDd90IA05GdakGDasB0p6bmb1etGDHZZ5+B8kqLRYDGVVzK27gwPnaZlZUaSYZwV0/engLzseNSdbPetlsAf7oN4cR8EEh7ulqh2ja+OmpKmaqNxXfOnHryZrKxIDNb4/wgY2PjpQ/VKh4r6+YLbX+Da0QjNYFiCTD/zNCdm1zByc/37N2gAoHMECeUADd2mk6p+nuRUKzq7jH0vJGHKR5HylvqypCYOuwn7Wy9kxSDN/gmpteW1JyN+8K9+vKAtPlwSyPpsxcB/T0Ic9GrflXbQ2Pllv+1CcjPVPhh46vC8ST4osnwWdTE92SfQjKQTWJQfo2Pw8XRaRknNMmKWwjXzGJOhFpxQggePMfUO2ul30eH89uWkpQcoeu+yRMDLEbuoa//VUke0eKt+eeDnL/HxH7WBOWW2lS/tYppm70p3gl7HxJL2QkbGKCo+8ksX8UC8f2enqrN4tZDjQEZCqjYAkfMgA0JSgGk6/qYMtG3ND2ySxEu83BcpPrFeKh0Lgvim3tmP8oVw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699e3711-5519-48de-fbfa-08dcc6385c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:34:14.4630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hdSQB7kDr9cRNnWu2SL7Z2QmspfXo07Tc/7UhG24e4g4/q9VVCkU586mUgc5irRe59QVtiHcl9XoSNiv0zxxTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711
X-Authority-Analysis: v=2.4 cv=NZK01HD4 c=1 sm=1 tr=0 ts=66cd2d1e cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=0J2C2xD5NG2i2N57cIAA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: rSIS-7fajbddhXZsU9qFGTLJlAQr3rML
X-Proofpoint-ORIG-GUID: rSIS-7fajbddhXZsU9qFGTLJlAQr3rML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270010

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFVzZSBk
ZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSB3cmFwcGVyIGluc3RlYWQgb2YgdHdvIGNh
bGxzLiAgVGhpcw0KPiBhbGxvd3MgYWxzbyBkcm9wcGluZyBsb2NhbCAncmVzJyB2YXJpYWJsZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5j
IHwgNSArLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgYi9k
cml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4IDAzYThmMDgwMDc4ZS4uYzFkNGI1
MmYyNWIwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gQEAgLTczNSw3ICs3MzUsNiBAQCBz
dGF0aWMgaW50IGR3YzNfcWNvbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgCXN0cnVjdCBkZXZpY2Vfbm9kZQkqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gIAlzdHJ1
Y3QgZGV2aWNlCQkqZGV2ID0gJnBkZXYtPmRldjsNCj4gIAlzdHJ1Y3QgZHdjM19xY29tCSpxY29t
Ow0KPiAtCXN0cnVjdCByZXNvdXJjZQkJKnJlczsNCj4gIAlpbnQJCQlyZXQsIGk7DQo+ICAJYm9v
bAkJCWlnbm9yZV9waXBlX2NsazsNCj4gIAlib29sCQkJd2FrZXVwX3NvdXJjZTsNCj4gQEAgLTc3
Myw5ICs3NzIsNyBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCQlnb3RvIHJlc2V0X2Fzc2VydDsNCj4gIAl9DQo+ICANCj4gLQly
ZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiAt
DQo+IC0JcWNvbS0+cXNjcmF0Y2hfYmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJl
cyk7DQo+ICsJcWNvbS0+cXNjcmF0Y2hfYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShwZGV2LCAwKTsNCj4gIAlpZiAoSVNfRVJSKHFjb20tPnFzY3JhdGNoX2Jhc2UpKSB7DQo+
ICAJCXJldCA9IFBUUl9FUlIocWNvbS0+cXNjcmF0Y2hfYmFzZSk7DQo+ICAJCWdvdG8gY2xrX2Rp
c2FibGU7DQo+IA0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVu
IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

