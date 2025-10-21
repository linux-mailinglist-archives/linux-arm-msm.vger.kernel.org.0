Return-Path: <linux-arm-msm+bounces-78220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED31EBF9071
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 00:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC264043CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 22:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0777529BDAA;
	Tue, 21 Oct 2025 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MP9/pCoQ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FHmNu3if";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AR6kJB6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768E267AF2;
	Tue, 21 Oct 2025 22:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761085114; cv=fail; b=OUIbdAAKbKbg98arLNO4iUlumLqySl1UrGgElJQV8UpaiSuGR9KDGyk02CWfucjwcB1/+AIH3SZ+cm6EOH7kowtoPdTa8TfEL1Pqh8kXK6GW4RebWNS11aq40iZQfVXyZ6S1cwzgMdZ3UAkMlReNMWmmSajSUpI9qm0b6T6SznA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761085114; c=relaxed/simple;
	bh=u40giPcaahqk7tf3EpY4ils+uFaSGcDjF5iqbcp1MMw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QHNBw6VY+oClaQQanThXMuM/y93lIOOiorHmwwL8uY5RCHt/kDqId9q3bFB/CO6ser0xuN+hNwPH3cv3OvN4NqUFcf5PJR+UMt+YaWHkhT4LUMOBtTcnY+x5klEvYw5O+wgtgI2uPdUWJVWgFPkqYHOfi704S4jrjuQFUgWHTlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MP9/pCoQ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FHmNu3if; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AR6kJB6/ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LIxjVB001131;
	Tue, 21 Oct 2025 15:18:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=u40giPcaahqk7tf3EpY4ils+uFaSGcDjF5iqbcp1MMw=; b=
	MP9/pCoQFEvPHb8QHclkyAeaVBUk7Av0t9roYUX36RSuyYs+7GsKtz4gbdZaGdDf
	blK1mjhWsy1x69V0cGUPtXxjPapkJpzOBsM3OKui+naem3+YMn4PReOhIwT+H/Qk
	fWHXYDoROIqbmBdFDs/IW8gDMImtASRJINBWlCHgqU19qMUT/Nbxyv/IaR82k5eF
	NogYrJwGTBNlOsshjroeca1pXH1T7JTA/Ksl73Vdvwi/996/gdBo0flwEzpbpWIf
	VMGLwn0PYlEM3TPwfzl89CQzCrOx0bewPBcn74u3Qj9DobpFxEm8q+GKsBmQNJFE
	qyIEz0DpRDtUEFSv2TrCAA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 49v9hf6n9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 15:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1761085096; bh=u40giPcaahqk7tf3EpY4ils+uFaSGcDjF5iqbcp1MMw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FHmNu3ifQMEk5pantd9RKXTKRQ/zSzRmzkGGH8UBiYCCkjkEtQ5eewie7cvsCL56o
	 1thNjHFFD6k9IpdA7JsesJPZKBRjBffQo+Mlo2Y+jQdoIuFFR/H6lumOeKF9B2QAz1
	 4C3+E+lr6BUDG/f2Nuci81/iP29ZuUHi2fir+dSyvuKB4OtcBaSgRXro/8Q8EY1VPs
	 KaEouTvaLSx8VbE4isxnw+GQYS9l7hux9rFuyK2gC5SFohXTtxLKtABtDQRPlRmoCu
	 NmnkazMJAso45lxUYeXhSGu5acQIaw2Si2dXdgwBxENax37ISxfqtWdcQ3DtQXHnhs
	 G+1fZ8nG60Zsg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B20B8401F5;
	Tue, 21 Oct 2025 22:18:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 128F8A006F;
	Tue, 21 Oct 2025 22:18:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=AR6kJB6/;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00601.outbound.protection.outlook.com [40.93.23.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3C1C5403AE;
	Tue, 21 Oct 2025 22:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ayfxm0dEa8RzO8yx0aQpAUD8u8hGePTCuj2tcbBbS30ddDItH/juVpnGdnjl18lks4JUvSUweXTF4hsWMebwsxguRLXGgXZ7YEV2xKsjAAzXx5qHH2a3djq4JesNJ3SexpkF+nrt60TuDsUfW66NatOCKTPMzWb22Yyt6T9WHv5Co5arZOYJ67l7XPHbmc7sx19LZbEYrcjB6/gsF7ei9WIeQiNuoW7upvbb1RgHtjwgMUo6D5nVQBkC8pYiTgFbCvwk5jY90iPLpE3sA0H7LrPcIVYGTr189FuLu85jblE/JELi4l+5sTHuify+ZYFMUT6ZpSpE2NNhnt3szKYAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u40giPcaahqk7tf3EpY4ils+uFaSGcDjF5iqbcp1MMw=;
 b=PZ1tpvVk0ZvkfWICnRikO2948VjKnQBCojGgrGle8/n2xRjSbW0swMxmsbr9GESUqD9G5w1HkGaqLzcNoIS8LXyiVaxv8fVi1wMP9w449gUazRceYMYAFPoegYwjo+Fs7g5h7yKBgDWI2kuDm3sHIY4yvmVF3VXerZYqU7IhW47wjP8lTEYvce2qBorrPlYtF7Z3P+YMHGipw7NiHs3wk8LhLqbBdmBeNDL1pg8zpyhRJklXSZVuqX4L14ps/YkuzvIN3liso/KY4enhKIHE+FypjAEAe7IBcb1AG3zUrCBExk2Mm1RqkmjgrgMJOx+hDZBVlmT00kdChzHhLWYVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u40giPcaahqk7tf3EpY4ils+uFaSGcDjF5iqbcp1MMw=;
 b=AR6kJB6/6GstQXNdItE4WHCkWB56BtA0asg0oD35O+T4oGfKpfgfnREjp8Y5arBb5FVc/tffco4zQLOP6twWE1MEm1zmLGzPya3HO1j0yJCZfW2J1soiyZjTQP+u5NisDLD0dURDCpyypKQS4eKebYSj6+XI7ztU4JNSo/34ocM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 22:18:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 22:18:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Markus Elfring <Markus.Elfring@web.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Anand Moon <linux.amoon@gmail.com>,
        Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] usb: dwc3: qcom: Omit a variable reassignment in
 dwc3_qcom_probe()
Thread-Topic: [PATCH] usb: dwc3: qcom: Omit a variable reassignment in
 dwc3_qcom_probe()
Thread-Index: AQHcQdbk3If326f3RUmEgb0LbAJs4LTNLXUA
Date: Tue, 21 Oct 2025 22:18:07 +0000
Message-ID: <20251021221804.yixk2wqyttcfwqqr@synopsys.com>
References: <344709b3-2c86-402c-a2ee-5f88ac3e2397@web.de>
In-Reply-To: <344709b3-2c86-402c-a2ee-5f88ac3e2397@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6243:EE_
x-ms-office365-filtering-correlation-id: c7910cd2-10fc-4728-4a32-08de10efb631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RjVzVUNhMXJqRjJuc01SUW5idW5tcWF5MzVJbCtUVERGeHo1NktNZ0xhZnNU?=
 =?utf-8?B?V05UWHB5UTE3eWZOaU5Qc0FmcGoxRnpBaUloZnNWQ09oR3B6clJhMkMxUmdl?=
 =?utf-8?B?MVFTTXREV1NhcCtpTE9tRkdDY0lyNXZqYXhwd0JLNzgrVjdSS3JZNy9MbjY4?=
 =?utf-8?B?MUhCSXlUUWIxZEZkWGF2am9kWC9pdmt5eUVBeDFmd0V4emRUNm5PcWJPV1Ax?=
 =?utf-8?B?dGVqMVd6QThXYllSZU92R1FjZFpKNlBWZTVKVVdpMzJSZ2hmekN4TytTMUtS?=
 =?utf-8?B?aTJ4Z2dPT0YzRFI5b0pGM3hpZGlEZmM2Y0t3UC85VENoSTRObTRsUW1sL0hK?=
 =?utf-8?B?bW1ZbFhMa0dFYWhCdWxmOE56UXE2U3pTQVAweTlZcFU4dmhubXg5TXl5L3ZG?=
 =?utf-8?B?NHdRL0lSYVUrMkZsdUU3cUpLQ2VYWWYxL1hEdTRxdmtGdWtWdVdtbktUb0p3?=
 =?utf-8?B?WERVMDVRQ3g0VXQrcGR6dkVUVVBGS0JsQys3clFJVTlBZXFNZlViUldpVDZ5?=
 =?utf-8?B?aFpXYmRLQXFqUTVnaXZEQlh1bE84Vlk5VVJRRUhrVEN1YW5tZUdBWFBSMGw2?=
 =?utf-8?B?UURPOS8zR0t0RGhPV3Z3ZXM5MnkrVDNQMy9IRnp4bElWOTdNL0lzS3gxSXlR?=
 =?utf-8?B?K09raUo1WmdxMlBUUGNJdklzTEo0STNYSTJ1dkV5YWhiRUlTM0IzNzhyajY1?=
 =?utf-8?B?aDNCa25heUc1VFlaZ0RnN0Y0ZjVuYmNveitNK3lsUlpuMWRkUmlwSGV6VHR4?=
 =?utf-8?B?Z1lGcXhpS3BEbXRVWm4wWVZPZnJVVXdhUWFla21FZmk1VDRUcHlRUmdXdXB2?=
 =?utf-8?B?MnVpYSttSGhKVW9DWFdoS09yc1FoblN3YTJQLzE1dGNLNXdHcDdxRW1rMm44?=
 =?utf-8?B?UEMzY1hoWGlCWjFmUDlEUERsKzBOZUNhSDVHL3FuVzNBWkN1WTVTYWg0aFNG?=
 =?utf-8?B?dEZJTGRTUzhzLzZOOVQrek13aDRaeGtkNmV5THNzbHAxY2xxRnFDZkRwb0t0?=
 =?utf-8?B?QVhMOGVGMDJkWVlLYWxPTUhvdS9aU0lVMTA0RWt4MGdTbGlEYmJFYWhQRFhB?=
 =?utf-8?B?WjR5V1Ztb3VGbm4ydFYwa2hBaXdtMlFmOVNRQ256WHdvSVFZbUIxQzhiclRz?=
 =?utf-8?B?YzMxbWtib2xXRmwvNmhwMjFyVmdua0lucnBRRUxZQTErNlF5N3EwM2NLcndY?=
 =?utf-8?B?dnJXWGdYdFRaVWpQNFgxdTcvV3VPUWRXVkZlZnFtY01EMGEwT1NyMFJvSTRD?=
 =?utf-8?B?TXpHelMrREVmdXljbUxoU0pZN2VFcjBMU1FQNTFQbjR4UGwrK3NLZU1rdW95?=
 =?utf-8?B?ako1Z1dyUTlEdk9KTGM0OGZOVHZET2NkTVhpUWhQUjJLaXZuZ3NWUUg3MVRr?=
 =?utf-8?B?Yzh3aHdLNzVaSS80aGR3Nko2REJGVHRCQ28zRnVLNm9lNlFJMTF3M0ljb2tq?=
 =?utf-8?B?TGZ1TEJScFIzNmRPazdIZXVFMDd1TkY2a1NtWkM5Y29Jc1lFdS9qdTdsT2Vo?=
 =?utf-8?B?TU8rSlE2SE9MZUV1KzRzUHNRQk1EbkdPNTRvUnVVc1Z3Z2V1NUFXemlaK0dE?=
 =?utf-8?B?NmtwbEFIRFJMSXcxd3F1ZktUS2VENVMvQW1PNGRIaGNhZ29jUytnK0hjUHdP?=
 =?utf-8?B?OVUzanQxWVFoV0poa2dLQWF2ejhmMVJ1MUY2Mkp5VlByTUFtYk1QME9ZMGFU?=
 =?utf-8?B?VzRTYncvTEtpa3E5dUF4TzBpK0RTRCtxVUFEMzVHS2s0cEJ6dkR1cis1ZERZ?=
 =?utf-8?B?YjhRSE9rNFcrZjVNdWtITkNHTHNMbXVMWlhkcG9IQ2NYYTd2QzdUbnZGZ1RL?=
 =?utf-8?B?ekNLWDhFemswOEp6VWk0cUN3eGU3Rjl0WEUyQ1cyUnpTVmkyOTg5WVRqYXV6?=
 =?utf-8?B?UVNGVXYxK1F4WHo3M0h3ZHhac2dQTDNFOUg2UnVKN2pSRlZNU291Z21xalBY?=
 =?utf-8?B?cVk1TlZ0SWkzZ2JqOUhSZ3BmNXdqY25qOUgyZ1hVZjgvZU5SSVJiSGoxa3pL?=
 =?utf-8?B?Tmo4cEgxdUtZblFMb3BiM1VxSG5hdUlFNm1kZVFZcFAyZUx3V0dwSTdwSHFv?=
 =?utf-8?Q?/CqvmL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RGFGRlh1OXprdGc2dnRVYnFWRFVZWmFqb2ZCbTN5ZWpDZEFBSDdpYXVjdTZy?=
 =?utf-8?B?ZWdvS2tFV3FPWUM1Nzkrck1zQXhBOGw2R3lqL2dra3dJSlRNYUxnbGVFejl3?=
 =?utf-8?B?MTVZUWh1ZjFWWUxmT1dCb2pPQTVCcG5uV0VQSmVqRW5DZ1FrbEpXZnhNZ3lB?=
 =?utf-8?B?eG82R25VaXBla29zZ3piV05QeURYNHI3R291c3lLOThsTEU1MW1ROSs1dWwr?=
 =?utf-8?B?V1lkTmNQeWMzNi9raU1oMnVIQUh3Nzh1d29hekQzZFpSOWlKcDNDdGxNTEhx?=
 =?utf-8?B?ZXdMK1lpR1doT0JCdE5JY0VEblMwdXlDaTVUeWxEaHN5US9kNEJCQU5PUWoz?=
 =?utf-8?B?Um5taFhFdWI2SHc4cWpTM29iaXZWWWcwdDZGekFvOHlRdytGM1hHMlBGZi8x?=
 =?utf-8?B?QlBwUW9aMGRMU3E5UjhETm5tdkg2N1N4SThZYkIwVXduVHF3VkthNktGUVdj?=
 =?utf-8?B?MEdhTGVTcUNYWDJlTjlmOFA0Y1dOTmhybHlXWUR2S1BJNS9hOGwzY1hiVUdR?=
 =?utf-8?B?MEZpQ3p1QWtWT2dYaVE2NDVFaFFNdmNCNFJ2VndlSkY1WEpxVXB2S2RvUlpx?=
 =?utf-8?B?TDREd1hBc1BmRHc1M3FOM09rWG00bjZ3THI4cldPQnpWbGxnMmRaUkFJSWpm?=
 =?utf-8?B?UE14dVBGNzJkc25kaHBPOUlmcUZjN05wL1BHeTJvdTBGTnB4YTY2cTAvRExm?=
 =?utf-8?B?U2loREthK1JRbzVBdTE3RkVvVmxDZUlRemtyMEJLRm14MlQ1VU40SithOWJC?=
 =?utf-8?B?Tk9HZ1MzYnNSNkZDRG9xYjhvS3BpUlJGU3VkMDZLbUMwNjNYWVphbEpwRnRw?=
 =?utf-8?B?Yk1yeGtaZ0Z0RVB5ZWZ4VHV6czdCUU9yb0U5ek10ZnMvOVpKcDdrZWQrK05L?=
 =?utf-8?B?Q21rTEZpbk1ZcUpHZy82UnErYk82VE9pbHFja3NlbW4rT0VPSUZiZjZscTdj?=
 =?utf-8?B?dlRSWW11cU1UZUUzc05WK3krdFN0dEQ1dnpFODUzYXFSMXJIRmtQUzdIVm93?=
 =?utf-8?B?cmM5aE5JTTN4Yzk3b0p0TTBtY2s3Y1RVYUVaRjhxcVRqZHFqNXFaSjQrVDZL?=
 =?utf-8?B?bFZUeXA5MEJWL0NBQ3lXcndVdEdsWk1PWmtNKzdzd1lQWWtUYlBCdFdHMm9t?=
 =?utf-8?B?WWlYb0xSL0Y2SVl5eG9adG1heVJsM3NlTjhlUG9McWJVK3JaaEI0cldrL05Z?=
 =?utf-8?B?VWJUc1k4TWk1U3dpQ21ZZThFR0lTNmtIekRXeUx3YUxmbW1CSWtFdTVIU0JX?=
 =?utf-8?B?QTNoZTEvamIvWjNwM3ZIdVMvRS9CVlJLRTF0ckc2WnlpVnVUb2xRMFdCNDc1?=
 =?utf-8?B?YjVxeVl5NXRvdmVmcDY1MkJmVjlTejA0b1ZFdjdleTNRSkFnU0dzVHh6YnNB?=
 =?utf-8?B?Rk9wa280b216Y1IyOGNLdHFyYU1OZDkybm05RGg5VDd0VU1ZcFoyVzh2RWc1?=
 =?utf-8?B?cFF4UHhObTd3Um52YStnTllCZ0pKWG1iOG1LbkI5TmFiT0lkK2diRUpiTVJq?=
 =?utf-8?B?UitSTHc3Ky8xelgyaC9rMUoraldTY0FKZWFGN1FzaXJZbUdWY0s5dEdoVlpS?=
 =?utf-8?B?am1JVnVoWit6dU1YVTVYR2xIQzRaWWVUSk84UGtDOG9SZUxwUVd5dFVMT1E1?=
 =?utf-8?B?Sjc1REh4S2E3U3QvRjBwdDk2SDNmVUthcHZmSGIxaVNWdVh3dnVWNTJxdC9F?=
 =?utf-8?B?Y3B6bzFrMGx5ZzRHTG9icUduYjVndXVKNG9uTElucytFRWhBeWJMRWZaTHlU?=
 =?utf-8?B?THdpOWNETGM3WEkxSmZOMzREalV3YWVDSUhvQ1VmWmtkdFpLYWJQdGlhZFR4?=
 =?utf-8?B?ZEtWTTdWK2RwQTlJa0lPTzMvSjlnQnRyQjdtV1BEd291T1VpZElWRUF2b2U3?=
 =?utf-8?B?MTZHR0IvYUtxMk1ZNGVOQy9qeDJZb0gvUTFUWVpVdEpWL0ZKUHpnSWx0WVg0?=
 =?utf-8?B?aEVHNjNWWHpHOU1hck5KcjM4VjY2dUQ5V1poYWhGaTNlL1d6NzRIQTZaMW94?=
 =?utf-8?B?UUZ5SnZqWGhXNXRZL2FYUTl1bjRPUVpqWnFobW95QmMrU2xxamVoRk1YeVNS?=
 =?utf-8?B?WXl5SFhGSnMzVTVULzdRNjdvY1BORWZDVmp3QzFZQkYyOUxIRjBSMXVCZzZw?=
 =?utf-8?Q?FrPfVP54d4D1xXKYe+/3EDTKZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EE13C4D8E517C4484D3F935E7E49C02@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8wLYx1C3HIEu7zG3Ov+zirgyuKmqiZRBJtXguYvaEXiwcP4NIBlmPymBYqVIJiZAh9dvmtSeMTuKccIdfXnGU9qzBFT1Dsgxz2a8/HjlnDny4R0Ej1HbHxDgdujQFI+PTBaCz4bpW0wydyFufF2pUo6CH/D9nKSF9xHndgtQtl6AU6Q511LblPp4GcH0OEzf2l0tA5xZrX9c2lbMSq+kFvMQyiqHTo+xDd2J/q6N87IyIZBog1kNQnQUu/skoAbuMhWP8kmMVWdF0V0rbY4H8R/sVfS1bRu+rCfRBLm/0qcXNMJWfsJNtpBmO7AUQCmwTeQE2Y6JYfeHzOMIxRwGmOPilwJQEMEEyUiaRttye7wkou0GLOq3pVSTEplWEDicTncPi042xpRETylUVMI0iP6YnoGlVzpUZPWfMLwxVBxau/h9FaG7/v0CF6faSXXpij2NbVKbDL1F2xtzMcwtQBKlk8/Rw280nZzCstzvNB//n4fkM/7YAjw6dqEaQvDqmx04BPuI8NWH/PNTRpBjxtrn/dr7pdA87Qthm3p96rLQB4vX2OfLwHaVXzFfSJb/BX42Gr6GKlVp2YtUX/X2oif2ke18uBvBT07SEP1ETwZCtPTBnTlMqvAOx2mJilezsZDQfwvO+AyS9MUGkU8b2g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7910cd2-10fc-4728-4a32-08de10efb631
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 22:18:07.2850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDGc5OC4y4WajEC7OwqcUR5aKRbGQrY1RNP/+QZGixx/9J1j4fbbI7msYt6DW0RIxblekee0K53j0MUTe1Q1mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDA3NyBTYWx0ZWRfX2yK288mHhb8D
 gVi8rwnRKfAdplMDi7/vARtM6E7gcu1GeTKCMKK7SLNsEGUkqKXivAwmxVuEYYIskS2CVegQGxW
 77yr2MvoDiS19IkkMhTtxbuyftJzT8OsdirfNONNvOcEO+VcNv+PiTzuwlkADTrpydhK7OEUXsF
 tkbP25oY3/jGYin2OTejlcFgX2VwuojRsoFoNGPSqt3NEFjN4Yu9S1VM5DVELXSBNbH1EytSIY/
 GV442OswMcRfnAQc/ZC1t8qOzeU7GaAnxYbbP3dG08Hi+1tYyzbzQi0OBdxlS2ZUqoBwh3DrrDV
 B0GHbs6fEP7RnsnjdZtp3CVYOHH7P++1M8w2CP61RWzl4irPcmTgVJxNJ90g2cd+19hH5VdgjFr
 GvYli3aYwar9y1rzcrdIGPbwVScf5Q==
X-Proofpoint-ORIG-GUID: FA41AqaQTNlo1wQARpRX8iqteZzhMRBo
X-Proofpoint-GUID: FA41AqaQTNlo1wQARpRX8iqteZzhMRBo
X-Authority-Analysis: v=2.4 cv=A4ph/qWG c=1 sm=1 tr=0 ts=68f806a9 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FP58Ms26AAAA:8 a=jIQo8A4GAAAA:8
 a=j1eU3IOuBTCdWUeygCwA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2510020000 definitions=main-2510180077

T24gTW9uLCBPY3QgMjAsIDIwMjUsIE1hcmt1cyBFbGZyaW5nIHdyb3RlOg0KPiBGcm9tOiBNYXJr
dXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQo+IERhdGU6IE1vbiwg
MjAgT2N0IDIwMjUgMTc6MTc6MTggKzAyMDANCj4gDQo+IEFuIGVycm9yIGNvZGUgd2FzIGFzc2ln
bmVkIHRvIGEgdmFyaWFibGUgYW5kIGNoZWNrZWQgYWNjb3JkaW5nbHkuDQo+IFRoaXMgdmFsdWUg
d2FzIHBhc3NlZCB0byBhIGRldl9lcnJfcHJvYmUoKSBjYWxsIGluIGFuIGlmIGJyYW5jaC4NCj4g
VGhpcyBmdW5jdGlvbiBpcyBkb2N1bWVudGVkIGluIHRoZSB3YXkgdGhhdCB0aGUgc2FtZSB2YWx1
ZSBpcyByZXR1cm5lZC4NCj4gVGh1cyBkZWxldGUgYSByZWR1bmRhbnQgdmFyaWFibGUgcmVhc3Np
Z25tZW50Lg0KPiANCj4gVGhlIHNvdXJjZSBjb2RlIHdhcyB0cmFuc2Zvcm1lZCBieSB1c2luZyB0
aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZy
aW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtcWNvbS5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gaW5kZXggZGVkMmNh
ODY2NzBjLi5lODEwMTFlZjEzMGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1xY29tLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiBAQCAtNzA3
LDYgKzcwNyw2IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICAJcmV0ID0gZHdjM19jb3JlX3Byb2JlKCZwcm9iZV9kYXRhKTsNCj4g
IAlpZiAocmV0KSAgew0KPiAtCQlyZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVk
IHRvIHJlZ2lzdGVyIERXQzMgQ29yZVxuIik7DQo+ICsJCWRldl9lcnJfcHJvYmUoZGV2LCByZXQs
ICJmYWlsZWQgdG8gcmVnaXN0ZXIgRFdDMyBDb3JlXG4iKTsNCj4gIAkJZ290byBjbGtfZGlzYWJs
ZTsNCj4gIAl9DQo+ICANCj4gLS0gDQo+IDIuNTEuMQ0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5n
dXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA==

