Return-Path: <linux-arm-msm+bounces-29521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C37495FE3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08811C20E47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3B64C83;
	Tue, 27 Aug 2024 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gEHgkBtv";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hwJNRRy1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sl45wT+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E544A2D;
	Tue, 27 Aug 2024 01:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724722044; cv=fail; b=qadzDq1Jq29H2Dkpohqi202BTm7VB9Upp69kiXaI/ikH2NdzzVsbj9oudHuJQr2ut8Ge1ovW+6m3P1eo0NnK///krHNqApBDpS6zdBR2PZaInMN9vvAlpFzLOOqgjulQxXgWbaRk0QzjVpG2gtafD47jZMyO9qIGfuLwHWUDkpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724722044; c=relaxed/simple;
	bh=7J7j8RghlOlG3WX0AMxh5lyv6uS8ZaLnErHUL+oogWE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rbSid706n5TaHfdDW6Gxi6vRkAezfXYx4jilRDlLYidv02EfDPb8uqDENJAD92L0n0jJoRt7q1nAXF9MBL1hxebwcm9Wa/GlFD+pU7r+QsGvC4vmmOu/jxKNu/NkWbBGO1PLEKCNlP71XK9b/+WcBm+WDBNec82WQ4Bl8JTpXxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gEHgkBtv; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hwJNRRy1; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sl45wT+P reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQALd020766;
	Mon, 26 Aug 2024 18:27:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=7J7j8RghlOlG3WX0AMxh5lyv6uS8ZaLnErHUL+oogWE=; b=
	gEHgkBtv+aZkcNPEAkROQMdeFkL9NNJxqk0HY8TlUwHgilM3hjEfd/m2q1bR1NZG
	Dnl+NWEXFMy4o4uFO0rv73+cqkAF1DJJQ+xxbzwrXZNwrRui4OhuBYpmKAycHstP
	LFz2mDE4tCyhNhPRopITyarPiyOIbFcE+7XQObJbtnGhHdSQO26DG8zxCFlZ461m
	S7QH7AsaRQtyB8Cg0yQ5G46aZQ80QCqIwjb+pIbyn3nAdz+aHvuWynsAM0ciN5sa
	002tJc2ngcH4ZiD/l6TS3SuhFU2wIQ3qYkawSVyvP+ZirPNGrHGPzwY+FtnfdKBF
	OMWPrm0KOk2WjnzfzxkSkA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417es7tfsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724722021; bh=7J7j8RghlOlG3WX0AMxh5lyv6uS8ZaLnErHUL+oogWE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hwJNRRy1BIFjJy+zrkPwLoaQi3MyO2eNXIbxWT8QPLJzkofnd8gX4EwtGMJPs/n63
	 Y2mEGhsrC/Sqqsw0sXkN7P5tHt62l6GFQnZiJaMGaJC7v9Qk1nRp4HsegraV7MxCsR
	 aZyeW/F62f7+k3W35AUuKE6VeT08qBnitLUM+nOlv+LAYatWQnZl+B4q7IJcKJEj+Z
	 0prZTWL05gR7qv6W0Vzn9+mhajc57BJYHaFpbwtun47GhS7fEpn8B1COE3fKJdZfe1
	 nw8tuVgKtBBRTWVRI9Y094cxF9SiFPoK1a8im+vzbO8Zm6ZOjnclhzB25l7bw+J3he
	 btpYjFfYfD7wg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8DC7140407;
	Tue, 27 Aug 2024 01:27:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BFE60A007C;
	Tue, 27 Aug 2024 01:26:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=sl45wT+P;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 513EE40562;
	Tue, 27 Aug 2024 01:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAGrAIEOz7LBMt2xgDi9vi2vPL7/3DrVy9UXDUpwNHilGWuAYKMxGTifsj9HAGtOqQWX3rCfHpE2CuhbSbmR72BSNVuNppESsfC/AWgpp/njGFpl5s3kiiVpP2FbFMsKu5nbEO6fjS4lMx4tvaFHIxK5Udf1Zjfp+VHlC47YQluLJbZ0lsScuQxcO+hmp9ZLJci/9GocegnkPsRffOHlUsa/XIr6f7ErvIxm5xtrC+WPFEgaL1WW6CATNnE0QyRUB2eX+9xoGPJkOoad9iQCMubCO7AFITEuW/ZupJodP9NTKD1mPnFQo1C8zjE861+z8oyT7E8Le3mbZV2LH9rISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J7j8RghlOlG3WX0AMxh5lyv6uS8ZaLnErHUL+oogWE=;
 b=CaATZMZhJtse/BOF4EMebKINP/os1lEgAjqhv8CscA7/aOFY5czmnFfG+GemXufZhgXzXAM2EEuqC9e2pFVo7WCaKwSzn4dbmA+9aF5PcnEMtJGl+vUSC1F4ojJJyHFee8EF3KXktFUOzX+JGGGkoRorgcehrb9oIhj3jb4J3pK68PQ4fSqDbCJhMCya1jkYleQWExLJdP3ulI/DJb12UUcs6CFD/kXlj1I7GEaXyY4IiqDiOMy+1UD/lnpIBqbzRvL/aq1rkSkAPwIR6J7Zt88Pz53yf5RXGoA6YW4piY8sj1yVR1NGr7P+WluUIbaVo00gwTSar1VMc0kQqVDYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7J7j8RghlOlG3WX0AMxh5lyv6uS8ZaLnErHUL+oogWE=;
 b=sl45wT+PciSizPMMMbU06nKdwe3QFKzo/76pbwShVlOGUI0j5ES1CzF+Af5Eu7fKSgfAbOlHEvK4LKdNR66J7aQzGXgHj9/JBjJvOwcR+qKcgCRDQx75tp7f8RPqinfPISOVYMa2bTKypdvddIWlx7YZ/479PYvSs9zCRdyaXPM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 27 Aug
 2024 01:26:56 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:26:56 +0000
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
Subject: Re: [PATCH 04/11] usb: dwc3: imx8mp: simplify with
 devm_clk_get_enabled
Thread-Topic: [PATCH 04/11] usb: dwc3: imx8mp: simplify with
 devm_clk_get_enabled
Thread-Index: AQHa7jXIMjXWSMkEXEK+oYX/qZI55bI6Y/aA
Date: Tue, 27 Aug 2024 01:26:56 +0000
Message-ID: <20240827012651.j2chqblkjha2vene@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-4-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-4-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7731:EE_
x-ms-office365-filtering-correlation-id: 5a629af0-ae32-470a-0fca-08dcc63756c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K2F5ZE83aVRPN2pPTWE1cFZTYlVudG01bDIyMU1wa2E5OWlJVjBwajBad0Rm?=
 =?utf-8?B?UmdyR3BLV2c4QUp5Uy9abUxoUEtlWGwxTHVIY0ltc3JHZ3ljMFl0MkdGMlc0?=
 =?utf-8?B?YzVQRmlYSWh4RUNSUXZTbzhieHZRYjN3ZUQ1TzZ3WVk3N056UkpmaHdWWkVn?=
 =?utf-8?B?c0loeXdsV2xrWEswcFk1TFdiamtYY2gwbTlDdUtVZmkzL1RkYlkycDdpUVk2?=
 =?utf-8?B?NGpnc2cyT0FpWHkvSFVoZ0VtYVB4U1hYRnNoRDFjTklvUk82d1RLWDBtdzh5?=
 =?utf-8?B?NmZ1c1RWeFJaRHVVNjNxalNtaXMzdWtRVmZVd0Z0MjlaLzlZL0M0THRzbnNE?=
 =?utf-8?B?UE9SUnpYOXk1K2JqcTQ0OXF3RUhIOUttSnlkL01YRkNxSWNMOGYwVDdYTXNQ?=
 =?utf-8?B?VUJLeHFMVFZ0MTNDT3NmT0hGaWYxQjNxeGRVRVoxeDVoblhwcG1oOFlEb2JC?=
 =?utf-8?B?V0NVSzN6ZTBzeDhYTDBmK0RsOHdtcXJyN0c0b0lnOUhWbWJvQm1RRGk0dTRl?=
 =?utf-8?B?RTFtb1NMeGVEdnY5TnhhK3ZaZEs5U0ozSTF2dkxma2R3dnVuWnQxeUhzM0x3?=
 =?utf-8?B?VUpSWEVUT0Y0QVFlZDA3dTY3ZEtZTHBUNWIzL1lhZ2dzaUlUNUFOQWlIRWg0?=
 =?utf-8?B?bjhtenUvSFRUWDJlV2dFR1o0eTh6SndyQ0hhWGc1S0lHSVFBWFhWbHpnVHE3?=
 =?utf-8?B?TW8vMFRKZTNyTk13bWZSNjl2UHZJNjRhUUhyMmYyRk9JSHBoaXB0cStmWmFn?=
 =?utf-8?B?L2NFMk1pdmNJWVk5ZmZiWnNjMG9lUlJ3ZW5JVithTVY2eFRrcnVWS0krZFN5?=
 =?utf-8?B?MFRtalR1RzZtVGgvVzVjRXplZGpSU0c5N2ViWXdBYkFVQ3lmY2RuNVpQZEZq?=
 =?utf-8?B?WERZOFdRclpNaHlJdHFPTlM0bVVMaEhLMWJTeWpjYkpCWi9vUWpDbXB4N3J3?=
 =?utf-8?B?Rm5FdEpvU2NBVlNJL1dVUmdZOWR2M3o0WEVjSS9SK2dsaFE5MHNVbzd1NkRF?=
 =?utf-8?B?emd4cWFnRURBdGMydWdnY1IvMnVGVk9adXBackcvWlpydUxCQ050SUJmcHFV?=
 =?utf-8?B?T3F1b0IydTVheXpCVWpNS1BRcFprMHI3ZUR3MTI0UzVXclJBOHZnalhzR2sx?=
 =?utf-8?B?eUt1OHc2emo1ZUl5TjVUVWk4V0xZT3RnemRSZHhjb1BJUkduMzB4ckRKT3RE?=
 =?utf-8?B?SGMvdlpWUlhkdDBMMEtDYnNzbG53TjB5Z0ExeHphZ3NOUmR0MTF3VUpHOTJY?=
 =?utf-8?B?R3YrZHo3UTVzWHJhRHlTUjFsNS91M054amNsNVl6dkJlRHoyVmxIeU1nQ3Zi?=
 =?utf-8?B?VVF4clpCbWxjNFNKSkIyUVkxdzRuVExYWXR6ZDFvLzVQNjdHWVd2WU9Mek9q?=
 =?utf-8?B?VTNxYTNwbTJRMWJFdWxZTnBXQmxQMFhZQXFkb3d1T3BvWXcrL0loYzJjQ01i?=
 =?utf-8?B?Y011QUtOMDlyOG5aV3M4WGF0b29JVHhpZWlBVVN5UXFpakpkblVKekJtUG9k?=
 =?utf-8?B?RTZMUi8vOW5KRlBBUHJRaEFrZjlqMTg0cGc4dmxDR2JvdnU2TmNXL3hqQ1p1?=
 =?utf-8?B?eFdIYWlZWVJmOWthT3pycS9lRFZYQkMvOG00V0RiWjJvVHZsaVFsdGtHZFNl?=
 =?utf-8?B?SEQ0alBtV292NUorVUxBS3pSTllhZlMvWG81VnpkMllaNnVkcjVVVWp0Ukhz?=
 =?utf-8?B?R0lYSlUwL1hEd1VIdWxYTTM3VjFvZk9JaGRBQTc2L1ZPbVVhRWsrMUZOQnB3?=
 =?utf-8?B?eFM0K0Y0OGxkeGtMRnYvZURjTzgzYUFuOTNybzg3ZkxTVXIzUVZTbE1IbmE5?=
 =?utf-8?B?Vkt5MVZ2TWlkUExka3M0SGQyaEQ1OEtzbHhIT2pwWHNZYjd4bjMvRkR5S0wr?=
 =?utf-8?B?aWdjR3RyM0x5a2RXVE9wdDljdkNLRTVsWHhRSWlOdGRpV2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXZYZlhuV0JHTWsrYzM3U0c5dGhUdy8rMGpvVlAxN0ZtTFRYUFFYcGhGVlJG?=
 =?utf-8?B?T3ptN2pSb1p5ZGV3c2hhN0FlbXlab2FhTFVEY1poSGgwbDJGVmIzV2gvZ25X?=
 =?utf-8?B?V0FHdzFXZHBlb01nZVA5ZEZvbk5vZGdWV09xNU55SzFNekJKQ2VubU92SWxz?=
 =?utf-8?B?bGdZYzZTa3VkSFkzY3ozSFRmaFdnckxHWnlKVWtVTE1ITXU3MjJMWlZWVE1Y?=
 =?utf-8?B?SEZlRWh1TklhM2lwOTJjSEV3TTIwRnZteHBSMUxPdDN3cmF1MFludGZ5SnB1?=
 =?utf-8?B?enVkWWZna2RaQWMxMnNnakVXYVJwbFB2RzgrblRiakN6ZjY3a05hUHBmNEpW?=
 =?utf-8?B?aXZzd3lVaGdVN082cllJbkpoeG4wSmR2d3RpVzZVS1oxWUNCc1hKSk1OL2dw?=
 =?utf-8?B?MXRRbC9Ydnk4STQrdVo2eS95QlVJRG9tN0FrdlNGazVWcnpFNllEZ0FlOFBK?=
 =?utf-8?B?WlR2Nzh6RUVleVZXNlhhU3J3R3lWTmxhZ213Z0xVd2wyU2t0bXkvRm82ZDFY?=
 =?utf-8?B?RnNEWVFZQmpkWFlNUkxlcFNCbTlGaUlmQkFPZWgrM0dsUVlUSjluRmpiS1Z6?=
 =?utf-8?B?SGVXU1JDam9jcENrelFua2ZkZXhCdzNodTltUmV6NDBockFxOS9xV3QzQ0Yr?=
 =?utf-8?B?K0hYVzJpSS9zUWkySWI4QkNqNWZ2MU9hbGhCTDc2aUpuSXlWczBWRUxGTm8z?=
 =?utf-8?B?Skl6RHM5ZkdxNVNWZjEvZWlFc3NEU1pUQndOMStOeG1UMmU3b212S3hLbVM3?=
 =?utf-8?B?SURCbHJQWXZBWnhHS3JOVDZwaVh0ajVwYkJrT1FYS0RrY0RGTStObS9hRnRE?=
 =?utf-8?B?dGNKaiszR0hqT3RFS29QcEZrUUtKcTI2dFRBTXpJRDE4ME9yVWhmcjg1WkZi?=
 =?utf-8?B?bmtIY296NHNHQ3ZNenMxTlQrQVhTTTRrMzU2N044MzRYZko0UUFPbXdyRW4w?=
 =?utf-8?B?YzJjNUZGUDd6WkJyQ2ZkMVBIUnkxWE1ZZy9uMFFrYzZITnJwU0NpOVkyVE4w?=
 =?utf-8?B?VWxYbTV1TCtEZDFEVnJOeHE2SWxPZXJURUVEQkJ4MWJKWEQ2UUE2eUpxUktI?=
 =?utf-8?B?WTZoaFpDbU9XV3JwenI3T2pPN01tZXovaHlZTS9RbWZDeTEwKzBDdjZrSHFX?=
 =?utf-8?B?L3J6MTBoRkFmN1ZpeTkxVnl1TDh5dGRybStxWU9NQ0RTUHluWEoyL0RRRlVp?=
 =?utf-8?B?VGFXNnJya0FzcDA5cldUc3YvRVB4NUw0UEtkaDduVXc5cEZRREdreUlhMGpp?=
 =?utf-8?B?cFVHcUhwYkxWUlpjaExGL1BTcVQrTXJxcmxUREZ6VG5TalFIRWJMUVFjOFZI?=
 =?utf-8?B?OTYwdytsNzN1MDIyTE5kdmQ5WDZKSU9HU3ZDQXZNOVNQd0VndDB6Y0txOFNJ?=
 =?utf-8?B?ZnpTSWl5VmpqWi9LUmxvd0FSdFBiSHhkZG1VR2d6Y1NQb0VPU2N2U3RiSG4v?=
 =?utf-8?B?L3dZSXB1T283Q2dDci91SzRZZklFOWZPMWFVazZvbEVMdjlKY214Vm5XekJD?=
 =?utf-8?B?K2lHN1BER1VLUURYcmVkNjB0bXFSSW9ZeE56aXdVb1JTS0QwQ29kNnA3c0Vy?=
 =?utf-8?B?Y3k5eVVKSno5ZmpxWjBSenNXRGRTMnByUm9wUUpFaHlRQWlVQ1k2ME1UNktM?=
 =?utf-8?B?cEpNbGZCa3lMNlUxODRVSkRpaHE2d3dIdmpzVlF6NXFqSDl1ak41VUgrcFJq?=
 =?utf-8?B?S0FQMzYyZUhzMDI4K1JMZ2t4NWozUHhvZHZmYXZoZ0s4L25MVll1dDM3WWtZ?=
 =?utf-8?B?UXlWSERNUWt6RlJyNjlrSE1hN3pQaEIrKzUwdkNLcnBLNEhiTUo3QmhjOVla?=
 =?utf-8?B?Z3BVUlVtdS9GU3BEUjc5a3BPN2dYcHZER0VCdENDdDl6c2JKTXI3ZVFaSm15?=
 =?utf-8?B?MHR0amhpRVpsMTRCWEd4OW82S2g4N05oTjlsMGNKdVFMdUxIWEpPY3RCZkUy?=
 =?utf-8?B?TWs4UDNpeWtoVFJkWHl4RHRmM3grdjZWQnYyZkt2QzRYcmZYTVJqakgveE5B?=
 =?utf-8?B?b3ViVlVWZlRkRVZ1S0N5b016enlpZCtEWCtYVDJMaU5BMUc2R0dYTDduQnpq?=
 =?utf-8?B?NisvTk5UTnc2Q3hCVmZjTG4zRm00T3p0QVlMSDU3dm5IR010NTBncGk5T1h5?=
 =?utf-8?Q?BVyAff3sDi6ic8+qXrrVfiBnP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE4ECC50B5E1854CA21F76F9955827A2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UlckeVhtSmHueTtcdJpT8HELxBsgjaxaIs1t9NfE0h9Ke7pDOlZ/Lao/E0JDVg8mRuVXHJFGg5PboYfpCAwFmAI+gdBSTdO+L57iYzEDwxw1ZbByDlD3KDv266Qx79bgF47XPxVfDCIPS9E9gSKLD/kCYZ6BZoiB/XOGBUxs4oAXnxeNDKajhTHUVmbtlbXr88rKfAt0aoJ+9h4xvLs95306gavAUCyLJSeKZ82cvP1Q9kLj0VQoDlZ50CapVazwSNj9qMVLInXqxRiLaFh2VGy+qIPyotmh/MD3vCOzCapHh32TcxGtRcTZKPTaY/WnEkGUCJToLrBI6PbM9f8MFQkAamPeAWoAjCwRi0EJvhGSvfWJUi8/DieF8jMiWhNFYRAzCuQ3+kRdoYJpukF+fslXVDcp8zbwxaPRQsMUT9aVskdgfiF7GRh1d8XEqsrlgCBKTtpy70HcyfUlJSfbXawRvNOoiQo09TL78g8Zx+GckN0NdvyW9NL/y3chYQt5ENGvGzH/mr9ki4WjULRwwFe+oqKXceAFsiKCKrnqfsWPaR2CdL/zvXOZK2W30PxBg7cfUCYtpqeJzKcWEWDEin11DpBJCqOs0pVf8KaV6LN9q+JZWLq1MqJaWggnEh123FvbNGTjOAHnZczMZqvFSw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a629af0-ae32-470a-0fca-08dcc63756c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:26:56.0796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQfIMqVu8s8Mhi2+IfXeURiDLf4pyo1lwVhlwR9uvUapDAS9J8i1f6vJpRlFqTsn/w3nyZ3Ga6V2ZP4KKZCLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731
X-Authority-Analysis: v=2.4 cv=NZK01HD4 c=1 sm=1 tr=0 ts=66cd2b66 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=xAhCdQpX-aGB8ux9vRYA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: A1SAtBPc2vLlqClAk-88oVOCSbkcaGOt
X-Proofpoint-ORIG-GUID: A1SAtBPc2vLlqClAk-88oVOCSbkcaGOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270009

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFVzZSBk
ZXZtX2Nsa19nZXRfZW5hYmxlZCgpIHRvIGRyb3AgY2xvY2sgcHJlcGFyaW5nIGFuZCBoYW5kbGlu
ZyBmcm9tDQo+IGVycm9yIGFuZCByZW1vdmUgcGF0aHMuICBUaGlzIG1ha2VzIHRoZSBjb2RlIGEg
Yml0IHNpbXBsZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdj
My9kd2MzLWlteDhtcC5jIHwgMzIgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYyBiL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1pbXg4bXAuYw0KPiBpbmRleCAzOTJmYTEyMzI3ODguLjhjOTFlNTk1ZDNiOSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiBAQCAtMTc4LDM3ICsxNzgsMjMgQEAgc3Rh
dGljIGludCBkd2MzX2lteDhtcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgCQkJcmV0dXJuIFBUUl9FUlIoZHdjM19pbXgtPmdsdWVfYmFzZSk7DQo+ICAJfQ0KPiAgDQo+
IC0JZHdjM19pbXgtPmhzaW9fY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImhzaW8iKTsNCj4gKwlk
d2MzX2lteC0+aHNpb19jbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJoc2lvIik7DQo+
ICAJaWYgKElTX0VSUihkd2MzX2lteC0+aHNpb19jbGspKSB7DQo+ICAJCWVyciA9IFBUUl9FUlIo
ZHdjM19pbXgtPmhzaW9fY2xrKTsNCj4gIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGhz
aW8gY2xrLCBlcnI9JWRcbiIsIGVycik7DQo+ICAJCXJldHVybiBlcnI7DQo+ICAJfQ0KPiAgDQo+
IC0JZXJyID0gY2xrX3ByZXBhcmVfZW5hYmxlKGR3YzNfaW14LT5oc2lvX2Nsayk7DQo+IC0JaWYg
KGVycikgew0KPiAtCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBlbmFibGUgaHNpbyBjbGssIGVy
cj0lZFxuIiwgZXJyKTsNCj4gLQkJcmV0dXJuIGVycjsNCj4gLQl9DQo+IC0NCj4gLQlkd2MzX2lt
eC0+c3VzcGVuZF9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAic3VzcGVuZCIpOw0KPiArCWR3YzNf
aW14LT5zdXNwZW5kX2NsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwgInN1c3BlbmQiKTsN
Cj4gIAlpZiAoSVNfRVJSKGR3YzNfaW14LT5zdXNwZW5kX2NsaykpIHsNCj4gIAkJZXJyID0gUFRS
X0VSUihkd2MzX2lteC0+c3VzcGVuZF9jbGspOw0KPiAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0
byBnZXQgc3VzcGVuZCBjbGssIGVycj0lZFxuIiwgZXJyKTsNCj4gLQkJZ290byBkaXNhYmxlX2hz
aW9fY2xrOw0KPiAtCX0NCj4gLQ0KPiAtCWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShkd2MzX2lt
eC0+c3VzcGVuZF9jbGspOw0KPiAtCWlmIChlcnIpIHsNCj4gLQkJZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gZW5hYmxlIHN1c3BlbmQgY2xrLCBlcnI9JWRcbiIsIGVycik7DQo+IC0JCWdvdG8gZGlz
YWJsZV9oc2lvX2NsazsNCj4gKwkJcmV0dXJuIGVycjsNCj4gIAl9DQo+ICANCj4gIAlpcnEgPSBw
bGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiAtCWlmIChpcnEgPCAwKSB7DQo+IC0JCWVyciA9
IGlycTsNCj4gLQkJZ290byBkaXNhYmxlX2Nsa3M7DQo+IC0JfQ0KPiArCWlmIChpcnEgPCAwKQ0K
PiArCQlyZXR1cm4gaXJxOw0KPiAgCWR3YzNfaW14LT5pcnEgPSBpcnE7DQo+ICANCj4gIAlpbXg4
bXBfY29uZmlndXJlX2dsdWUoZHdjM19pbXgpOw0KPiBAQCAtMjU5LDI1ICsyNDUsMTcgQEAgc3Rh
dGljIGludCBkd2MzX2lteDhtcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgZGlzYWJsZV9ycG06DQo+ICAJcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQo+ICAJcG1fcnVu
dGltZV9wdXRfbm9pZGxlKGRldik7DQo+IC1kaXNhYmxlX2Nsa3M6DQo+IC0JY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGR3YzNfaW14LT5zdXNwZW5kX2Nsayk7DQo+IC1kaXNhYmxlX2hzaW9fY2xrOg0K
PiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShkd2MzX2lteC0+aHNpb19jbGspOw0KPiAgDQo+ICAJ
cmV0dXJuIGVycjsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgZHdjM19pbXg4bXBfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+IC0Jc3RydWN0IGR3YzNfaW14
OG1wICpkd2MzX2lteCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiAgCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICANCj4gIAlwbV9ydW50aW1lX2dldF9zeW5jKGRl
dik7DQo+ICAJb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZShkZXYpOw0KPiAgDQo+IC0JY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKGR3YzNfaW14LT5zdXNwZW5kX2Nsayk7DQo+IC0JY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGR3YzNfaW14LT5oc2lvX2Nsayk7DQo+IC0NCj4gIAlwbV9ydW50aW1lX2Rpc2FibGUo
ZGV2KTsNCj4gIAlwbV9ydW50aW1lX3B1dF9ub2lkbGUoZGV2KTsNCj4gIH0NCj4gDQo+IC0tIA0K
PiAyLjQzLjANCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5v
cHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

