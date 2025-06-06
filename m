Return-Path: <linux-arm-msm+bounces-60427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A2BACFA54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 02:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF493B005A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 00:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E299517E4;
	Fri,  6 Jun 2025 00:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KCzV8eyS";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GPeyPPH4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LRKSs1P0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF1FA41;
	Fri,  6 Jun 2025 00:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168726; cv=fail; b=QOUKhI3C88ZbGN8cqhK3CQCQSJjT0dEMMALEUZtqWxJ1vlGwnO4oAOFjChFN1f33wlUkX0vEOn2MJIbWHNPXT1Ziu0226ZUdgureL7B+8RjpMO03aWJh+3Slvg8d+tqLNbFN3AXoWEwSDQXx55bgJNuYqpLALWWFEWfc/jnjc8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168726; c=relaxed/simple;
	bh=RZvwLStXboLrY00AUPJpViy1A7dUj0OigbJWr9YgWMA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CvfpE5dHx2lnblrY5Oj13apT5yNvIYfbh4qxMP7sNzrkiuSiM8ke+aVkXd5R/rPK4o409++j6voOY8u2ErmFmzDqpTfHhfbb2oWAKCAYmXr747lbl7lX4uzRH9YABAqB4n3vfNrVnFoG+Yrbzc3PspHY76xmKSRkSy4+VqhNZ+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KCzV8eyS; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GPeyPPH4; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LRKSs1P0 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555MuGch022958;
	Thu, 5 Jun 2025 17:11:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=RZvwLStXboLrY00AUPJpViy1A7dUj0OigbJWr9YgWMA=; b=
	KCzV8eySEFnA5CcQyEFF+jwaQkv/3Su0jyFTVFZTrMoNCVRH6KMG4BkfBrx741oH
	VVA3yEO3+mim23b82h9Q1vPD+OKG7xO/bYVgnQy8T92K4uLgJljrjidRSpKZaV76
	WiMjVmvA3zTBePIRwR0qoXEoYPuwNWweqEr1cVNbR28PfUJhKFdTw98psn0z4KGq
	hK6nOMyW4KInDhNsAHSwXb2SiGsSDtpqXGyEUmAzQnJUwrNXAj6JM7vqpmIOGgkz
	g30JR/V5daiLNapwANC2YuaRv+0yuPnjmVnIjfpl/jU6h6f0upa5VLFx3eFlcWXt
	XItKqzOdcVkXYWI6NsukXw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 471g9k23pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 17:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1749168716; bh=RZvwLStXboLrY00AUPJpViy1A7dUj0OigbJWr9YgWMA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GPeyPPH4sM428vbc7gep3mWDJ0iQWp/nDZ+AGuOAd2AvXNrhEQMPcpykRZy3zH7MY
	 LfmzvKm8Ldb67q25hVAvjQbGybQbQJGyAb+onXsWiBE3sFHhwFDQ05kiPX86dNSolN
	 5ueEYF1p+oFMeoPA4oEq1tXf4sx1Scg2qqQBiiwQM6p3Zd710gpmRPSbvQn1SCz9O7
	 NZna8q/J85wlwADB+tSvplJkUFRiNF2dOTA8q7yHIJYPooj6CHJdAzdd660txudaa9
	 t3eAylLe2PaeivYWslyWmMZAj4qJoU0qwgEyKFa/Ntd2W/hvJWAzU92Bozwa6wWJEl
	 U/f/OziQr+ENg==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 190554054B;
	Fri,  6 Jun 2025 00:11:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 140A5A006F;
	Fri,  6 Jun 2025 00:11:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=LRKSs1P0;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 11E3D40144;
	Fri,  6 Jun 2025 00:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPqzh2RAOz8xm0lBn8uK65wJe5bfFaBOoVA9BUop0md3tGPnx6AxEFwwGGIQ+Xh46tUrgupYVEn9k6ee42vHA7p9HITCJsWai+QNBV+onAeEXKpisWTHw+oFrN47eu3sI6Y1Zqm+ExIkOEVLKu0H1STtch6Am87rDH7u9ikFXr6oqACYXwNnlEK3mt2wVvHlhx4NlqAm7O8VYOfD3PPpO7FeoM7QRvJxf4yPVM42fpmY0vnDo+4Kllraj7sV2VML7X5U7DaPNZLc95e7sJcGK16Q4Ouj2VNOPVldYyHtvUjVPMUpoiLYjUy6EGfGtuGAVsftTauK+8xCP4kKxClP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZvwLStXboLrY00AUPJpViy1A7dUj0OigbJWr9YgWMA=;
 b=VidkU7IrUcaAClm8J/9m6mWNLG+V6D5YxLVjeRMC7VJ0SbBSuKjT55X046YIugOsKl+7Ww9r5E2jlibFbkPBHcXKqfYBse1oDjBQo2p2TQHFIvcf0wTMX/C6BXWW7bqkiKsg8GWfBtXEuBtiU9fkbEPXdiFaE8PQtKVxQo08R6BZAOnqLzWGZNdzZue709KfOwNSD5LEil3COwl0I2b3tLCQBougSv8sluaFXeCQWxmXYXh0ix1M+cycyoatkVgkFlxvjmUPAFG2ARBD/IzlfYAPhaoaQ4gL+MlbtdcNRuypKCMtdlXe96YtZ6gItc40MLrjkDn+1DW+1h/6RTmMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZvwLStXboLrY00AUPJpViy1A7dUj0OigbJWr9YgWMA=;
 b=LRKSs1P0PHUr2CZ2AWQoev2/PRyZa2SWh6DdzTu6Ln3z9RNDV91MyMuru54asnTvsQvA3R6HOaq0PvYKSn+Ov1iRVkon5FbKumGDDr36wdYaVMbkK3Fos75B2VgC7pN7vOqztXFGWjJ50aIvzainxVXLKhx4n3LCr0fYnrrKPHc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 00:11:49 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8792.038; Fri, 6 Jun 2025
 00:11:48 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
Thread-Topic: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
Thread-Index: AQHb1RX9tnj/30jCdE2ccXfdzWCvKbP1RPmA
Date: Fri, 6 Jun 2025 00:11:48 +0000
Message-ID: <20250606001139.jaods5yefjccqni2@synopsys.com>
References: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ0PR12MB5635:EE_
x-ms-office365-filtering-correlation-id: d90e6d9b-8b8e-4ac7-68e1-08dda48ebb05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDJrUGRBaUFKeUg4WWpsczh0NjhzZCswSy9UU1c5azFoZVRkdm05eFovZDJo?=
 =?utf-8?B?K1NuRVRUZmtqOTF2TUhwODE5NS9nK0thVFpjcEw0U3dTOVM1dVZDNWxnamQ5?=
 =?utf-8?B?d0RFLzFCS2RvS01QNDFRTEIvTEljdHVaenpaTGdJT0wxTlpKaitUVUF3K2Ju?=
 =?utf-8?B?N0sxTlhtSjlzdHY0QnhMYUxaNmhjQWJKcVdqV3llbmlDVHFhOW1wUVV4eTU3?=
 =?utf-8?B?Wk1rMkJ1eHVvd1pzbk1pMTNkK3VIbE51dElWbS9wTEo3UkVKYWdkSUt4N0Rm?=
 =?utf-8?B?dlRHMzkzTUtCSEVGSEhWMzBoYjh5c3JjVG1xVXZFdk54TWRCYUhXTTZQWEVy?=
 =?utf-8?B?TnRoRlozTDhXTVlOOVpvOFJ1QTQzQnVJK09GaWEwanQrTHFTQ201dmFoWkFG?=
 =?utf-8?B?d2xXdk14bnR2bGNqS1pqSGFpTW1qTi8vZ3BvOWRKK1hmd0lKVzFkeHlHZGVo?=
 =?utf-8?B?eCsycE5WS2VZVWg0TmxXQ2hEZlVtYlBiY3E4RXh0QUhkdkl6WWwrdHVMYk1Y?=
 =?utf-8?B?Wm9YZ1pUbVUrMUtXUUZrcGdoR2x2T2JweVBMSXZUNFV2QU9QejdVdTYvazE4?=
 =?utf-8?B?aEJ5K21WNllCcDBEZmlTQTF2UDk3TlRsZTc3MVFQSFcvZ3B3QytlU1haNk1N?=
 =?utf-8?B?N0J2MjBxSnBMS3dsTlhGU09aQnlDVWVZZHB4UDBKaTNabHQzazlQenVHbWhH?=
 =?utf-8?B?azBBVXcxZm5BRWthQmllRWNPT04xRU1nU0QyWGJUUmo0SnB0TzZndzczREdh?=
 =?utf-8?B?ajZWS0RTM1g1Ym1haFFTZVJGS2E2dU91anpxaG9hc2ZrRzFMbEhQWWtNTnI3?=
 =?utf-8?B?NEVCc1c0WmtubWFTdUdTbitMOG11ZDFDeDJBODNBOFNEU2dpUEJvQ21XODUr?=
 =?utf-8?B?MEY4bEI3dGhNL01mY2U3Uk1VczlkTTVoS2tndjNIRHorK3NxTS8rVmVQZ1Ur?=
 =?utf-8?B?Z3MxSmR5bnZHOGtlWXhoditWU0Q5QVJBSXhDRUliOFJaSWc1WFJoNWR3clYy?=
 =?utf-8?B?bm5NNFhiZHNYOE82L2N6dGtMRi9oOEhZd21WTHljRnZoR2EycUJBTFhHTXR5?=
 =?utf-8?B?b1hTTjZIOUp3UDFRU2V4ODJpcCtKQURySWlXWlNsRGkwTlZXQXFYZ1craGp0?=
 =?utf-8?B?bVRub0ZBSHhWVmE1ak9CUHhaeStjRFFxbytMOGJpODBQeXAvSEpGV1RLNTNz?=
 =?utf-8?B?N0xOU1NNQW05Q2ZhZVJIcUlSbTJCRDE0QjNRaTg2b0NVTWlDNjdYdVp1Rk5a?=
 =?utf-8?B?QkNqc2RobXdZNDZiZ0JQUUk0ZUpHZmFZM0hNOFJGczFjZkViUWxFcnpNN0xy?=
 =?utf-8?B?WHdIZEE0emxSdTNKRW90bWNXMW9NeXNoN1E0RHpmdmlkTGtkL1lsLzhKVmty?=
 =?utf-8?B?TFdNQ0ltKzBkc25hN0xwbjgxVjdzZWx4dytpVXA1SFhDRUxua1VMNStYcVN5?=
 =?utf-8?B?OEUwdlNZSmRCT0FDNmxGNml5U3J6czVxeEVob09uVEgzVXhTUXpUUkxneTdl?=
 =?utf-8?B?M0NkQWM3MzJ3NDJYR0RZN3kySmIwb1QrNFppZFBvV2xNMzByMWk3TGsrQ0pB?=
 =?utf-8?B?dm5hblRsc2RBWWI3c1NWTENEdEdtTDU5ZVJxSUhNRXNCWEhKeFJUV0pPVnc2?=
 =?utf-8?B?NVB3YkQvOXRyVk02RHd0SmhRUmhtYmNQdmtxaW5zMjBBZDVLTjVrQ2llK2JJ?=
 =?utf-8?B?STZZcFZQRURSMWtNazIwY2JsY2VFUUdIcHN2QStmNFJPb0RRZXhPelR0QTZi?=
 =?utf-8?B?cWdEWWV3cFo4WVI3LzF4bEFRS3BndjEyeExMTm5OWFg1QWM3TTA0dE1VM0J6?=
 =?utf-8?B?bTVKWXhkdUVLUW5JWXMxc2l0TTZkSW1tZ2ZtSHlPNm9UaUw5VXJMSHlXZjVF?=
 =?utf-8?B?VTRheUhUVzVMb3N1clZWRE1HOVZ4MkpSMVlLRzJkLzFjaGx1QWJ2T2p6YjQx?=
 =?utf-8?B?ZUx1ckFPaGgvZEVIRUhCYXdBcHEycElRaUkyVzgzSnYyWmY1SnhBVytVTmI0?=
 =?utf-8?Q?8RTtjDwnDqlRUt5wfiGcZIFSMkfzu8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzV3YlhFekFqUTdma2tubDdnaWc1dzdNUVJjNHV5bW4zQUx4MzY3WVN3OHh3?=
 =?utf-8?B?MmltaG1WYXViNjFwa01wUEt6WFc2UzlRL0htMDRFY3NpZTVxdnp3OUZEVDdG?=
 =?utf-8?B?YVhkUkNEbG1Wcm0rbXRxQkcxN2tIMC9SMXBKelEwaE4zeS9KUUIrMlh5UHJQ?=
 =?utf-8?B?dWcrSGVZODlTaWtwejRuY0dueStDMk5vdkQxM0txTk5Gb09IeWlNZkFzVnJr?=
 =?utf-8?B?Tnl2WmJNcEVHTTZZNW9QMElOS0hMNWxBaUNoUDkzN1ZCQkVUVlRvMWM1Z3JT?=
 =?utf-8?B?cmZERmp3dTJNZkVJWVlpcjdUaHJGdkxodmtkbkpXcDluRG5oYjhWQXdwb2lY?=
 =?utf-8?B?ZmZMeGRqUWt5STdLc1B1eDZxd3R5R2VSaDdOV29SRGs3Z0ZDZXdORlh1TTN3?=
 =?utf-8?B?UmN0OU9nUUlJdmw4SCtPNkFuODZJLy93WUxFQUlrK2F1UHF1ZGE4enFFK2da?=
 =?utf-8?B?MXdLSVJWaG54TjZSNEhISDAwckwvT1J3NWZJejA5eXowNjdBUFUxbEhUQ3pQ?=
 =?utf-8?B?V0JLdzlBK3BRNDdyZzNsanFKU04yeTJzdHRMcGhkNy9HRVFXRW1OREpIR2dF?=
 =?utf-8?B?U0ZqUHRJWEJuS2RUell1VFBoTHFscDd5ZzI5SVZNTUxwV0V2dWJUbUFVakQy?=
 =?utf-8?B?L3R1QUZaT1R6ZUxVbFhoelFEVXlBaXBqZXJDaGZWcDV1ZVNrVWZzM3R1Rzg2?=
 =?utf-8?B?OTRKeURpYVc4b0VGZ0t4eTVwL3BPOC9oRjdMblVqZzZPcFU3cDRjN2VIWC9M?=
 =?utf-8?B?b2hmU1FyQmVUaU4xd1NhMkduQ0c1ZVJ4WUFYOW82V25zQTV3RDM2S2QyMEov?=
 =?utf-8?B?ZVNHZEluQzZWcnplWjNNQ2czTEtudW52WFl1cU1vZW9YZmFkR2hrRUlBODdp?=
 =?utf-8?B?cjc0TlVRcEkxK0xpeDQ0ZmJUUjlsaWI0Ynd2QS84cTVtTDIwUjRzZDJLMUpL?=
 =?utf-8?B?bXhBd1dzQ2d2WUdZOXFYbjUrYnJIeFJhczNMbnFMMUtvdFFiKzhEMnFLaVJ2?=
 =?utf-8?B?OHl0U2srRkVsZXE1b0NrditwMHZUb2I5QzlJdDVhU1VZZmtBVjNFUW96Z2Ux?=
 =?utf-8?B?cVRhK1dEQUw2M0EyNjRySlMrNFd2QVdqQlhVTnVRNHRUbUJZTUhBOTJUeE5W?=
 =?utf-8?B?c1ZqVXFBaGNSRGVkMkpQdmRVTHVrV2Q4aVhmVnhXUkxQMU9PSGlaSnM0dWtY?=
 =?utf-8?B?dDJuYWtxRU5WSEszblp6NHpaNHpnVUxLYi90NmFyZkttMm9MZjlRVlVmN2xz?=
 =?utf-8?B?ZTd0TDNoeE9JenZmcytiYWNGWXl5cTRwVzZBVjhvY3V4eHJZS1Y1dE12L0xX?=
 =?utf-8?B?amozVGo2ZXdrdWRyLzNQUk9LZ0dYWVVxR3MxM1hLM3U3VWNBQzV3R3dBOS95?=
 =?utf-8?B?TDNHUmVMYWJZM0hGbTNvL0dCbmpOTlQ3b2VGeDNBMWNSR2t1ZDZ0RUxWYWRT?=
 =?utf-8?B?S3BzbUlpRWRKVVBGM1VkVDBxTkJYL09aNVRBemFvUWJLS3dLNGdTdDFoRmYw?=
 =?utf-8?B?RUo1S0xFaEpMWXk5Y3VCTlB4ZStyaXVvZVZaMm10aGhhdXVtUldoWHlZS2Vo?=
 =?utf-8?B?Y2ZSNnlrUFpTck42U1YvdFNxTDRzR2dMczZJNWlOZGcyRFM4OGJaR2dMYTBR?=
 =?utf-8?B?K3Q4QkF2OW1zSU55MStlKzFwYzF5RkdNQ2dJdzdYSENXd2dKKzJrSTE4NnlX?=
 =?utf-8?B?cjQxL3dTdEJrQUJxNmlDdkkzOHNrQVkrZUdRbXQzNFRZWHd5WDErdUd3WElZ?=
 =?utf-8?B?czAzcmhsSE1PdDdjUUdybzVHTXMrTU5aeU02MElBVDgyVnZESnUwdnJNTlpE?=
 =?utf-8?B?a1hyOUhOZy9McE1hQXJTa0REckpGZmFCNFBncWt1cHlWZHVlMTFBeW5Lbjc2?=
 =?utf-8?B?MEhpV25VZDB6amNMMWZ0dmloNWVlVzc1VHBCU09id2pqMHZIaGExa2RlSm93?=
 =?utf-8?B?WkNMN0dYbjN4M0hOREFUKzBHRmhmY0ttUmZOQnIvV2h3Z3h3aHdpWXE4cmZn?=
 =?utf-8?B?U05FeERjQlVXS0JPOTdEK0grdWwyR1dJSnM4YSs5bVo3QzBHb1JwN3Fnd1RZ?=
 =?utf-8?B?eGRxeWRiWmgyUVFCQmV4VVMxT0dVVElxZzlleTdSbEtURzhRWVJjQnhuaDdM?=
 =?utf-8?Q?RtiD1B9Q+gZq9P2a9NCsXW6sq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53349488F3654B4588E6D31A31D68761@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	drM+zVsbezIFpeKuw6+YEgMjlGga/v+48ZMJIK5Q0QTE+iyW3Wo44+2AtkN95SZpJEe0LVa+d1xCzxQv4R3L0uU4aNTjPp2icL+b3ZAGx1tFE4QVggNI6RVUnd1DCEk3P61Yt9JyaRgLaSE4Ri7NFLGREpALv+62sHII6mhpLXzqo6VPMMUZSguZKzjZq/c++AFo1JgpppHCNSWcNdS3m/4gKuWd4NhbsLC/xvgpAfittwqXBDx6B7xkCwJmZcM0Tmo/xW0dWhCvjnu+2NIywrIb6c8bxd01IOb4oKhoZgXc/P7QsLvU063XiEJnwhxaZ1zBDLWlpRs5W7a20zSt0IqKbcisslIbLqW6x8i75kLj7FE3MRd9Q9HFcCTxUmyA42L5T0vitpSyvBdrOsYBKYgWgryeY/J+8UvfyaB5vbN5ucLa1+FSbz3uGSSZj+a7qKYk7W3K/yZx+K8cNg4J9zSr/4xxS8W7fH9mxH7M+FG1j3kkBLHpN2fWcHYaqzwHPkPHdxlLPzWy2qygwgIOQo3Sl5V8ETp5yJHKHrpaqC6Cus72q1qdkBzCJKEKdD7tYf4HTTaOEERrxJ14DM56mkuyc0HeG6GY1Wsymghv9OnJgww1Vr4QXI/DK/rwh30GYc7ETe/Pa3enuJ0cflbZBQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90e6d9b-8b8e-4ac7-68e1-08dda48ebb05
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 00:11:48.6355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KdaY7ujtFigyW31lEeXefjTq2g6D4CF1WhZqF/CVeNPKfHR2fRJKS8Vc7bRbaOBFzivLnqpUAICU/7lC7/Or+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635
X-Proofpoint-ORIG-GUID: TnAnKdYSKBAQ268wZuEPPiqV-DhEdm-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAwMCBTYWx0ZWRfX18YjeW/cVmvG
 FpkSZXaMuFhqH+d+dkUa8UMyrGI9Q9Lt9WILHKLR9zJNl3DplwhzebkOaezd1Gyq2vJscYVLhr+
 XAeaRPgBTFCoM8gpYocuShXmhNFTTpxlzwW1uOGE7D489iqyy+RGIu9n4t5tOiJBUSmzAMy8thm
 e3mrKWy/h/skIJYCx9CspAhoFGfqKJTzRzrCOFZfXYiTeyFlj13Dnx3gRcwJP0t089Rj67WLVVG
 1Xqm5gvJsBygY5UI7dTgE8+vuPobS/e3v0/Yqer2Z6Cg7iV3EJx09UcOyRUKNPZX6HcgnREr44V
 OYeTtAKeLpwcgbF8H1Em4NENbrdiMK02LW8xHSa0uuLxUONkJHLjB7Evg5QP/LKHAlgpjpFIUpI
 MR0/Y2fmqCb0PIKZ0IofUh9rlDXyzPsd4uJQeQtVVrMuXNrjipQaD2dBGCnekxdTasze7QXB
X-Authority-Analysis: v=2.4 cv=VoYjA/2n c=1 sm=1 tr=0 ts=6842324d cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=PIVOp42VAEpkajzR3_8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TnAnKdYSKBAQ268wZuEPPiqV-DhEdm-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 spamscore=0 mlxlogscore=786 malwarescore=0 impostorscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506060000

T24gV2VkLCBKdW4gMDQsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IExlYXZpbmcg
dGhlIFVTQiBCQ1IgYXNzZXJ0ZWQgcHJldmVudHMgdGhlIGFzc29jaWF0ZWQgR0RTQyB0byB0dXJu
IG9uLiBUaGlzDQo+IGJsb2NrcyBhbnkgc3Vic2VxdWVudCBhdHRlbXB0cyBvZiBwcm9iaW5nIHRo
ZSBkZXZpY2UsIGUuZy4gYWZ0ZXIgYSBwcm9iZQ0KPiBkZWZlcnJhbCwgd2l0aCB0aGUgZm9sbG93
aW5nIHNob3dpbmcgaW4gdGhlIGxvZzoNCj4gDQo+IFsgICAgMS4zMzIyMjZdIHVzYjMwX3ByaW1f
Z2RzYyBzdGF0dXMgc3R1Y2sgYXQgJ29mZicNCj4gDQo+IExlYXZlIHRoZSBCQ1IgZGVhc3NlcnRl
ZCB3aGVuIGV4aXRpbmcgdGhlIGRyaXZlciB0byBhdm9pZCB0aGlzIGlzc3VlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jpc2huYS5rdXJhcGF0aUBvc3MucXVhbGNv
bW0uY29tPg0KDQpJcyB0aGlzIGEgZml4PyBEb2VzIHRoaXMgbmVlZCB0byBiZSBiYWNrcG9ydGVk
IHRvIHN0YWJsZT8NCg0KRWl0aGVyIHdheSwNCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmgNCg0KPiAtLS0NCj4gIGRy
aXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgfCA3ICsrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMN
Cj4gaW5kZXggNzMzNGRlODVhZDEwLi5jYTdlMWMwMjc3M2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFj
b20uYw0KPiBAQCAtNjgwLDEyICs2ODAsMTIgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZXQgPSByZXNldF9jb250cm9sX2Rl
YXNzZXJ0KHFjb20tPnJlc2V0cyk7DQo+ICAJaWYgKHJldCkgew0KPiAgCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJmYWlsZWQgdG8gZGVhc3NlcnQgcmVzZXRzLCBlcnI9JWRcbiIsIHJldCk7DQo+IC0J
CWdvdG8gcmVzZXRfYXNzZXJ0Ow0KPiArCQlyZXR1cm4gcmV0Ow0KPiAgCX0NCj4gIA0KPiAgCXJl
dCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKHFjb20tPm51bV9jbG9ja3MsIHFjb20tPmNsa3Mp
Ow0KPiAgCWlmIChyZXQgPCAwKQ0KPiAtCQlnb3RvIHJlc2V0X2Fzc2VydDsNCj4gKwkJcmV0dXJu
IHJldDsNCj4gIA0KPiAgCXIgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJD
RV9NRU0sIDApOw0KPiAgCWlmICghcikgew0KPiBAQCAtNzU1LDggKzc1NSw2IEBAIHN0YXRpYyBp
bnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJZHdj
M19jb3JlX3JlbW92ZSgmcWNvbS0+ZHdjKTsNCj4gIGNsa19kaXNhYmxlOg0KPiAgCWNsa19idWxr
X2Rpc2FibGVfdW5wcmVwYXJlKHFjb20tPm51bV9jbG9ja3MsIHFjb20tPmNsa3MpOw0KPiAtcmVz
ZXRfYXNzZXJ0Og0KPiAtCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHFjb20tPnJlc2V0cyk7DQo+ICAN
Cj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiBAQCAtNzcxLDcgKzc2OSw2IEBAIHN0YXRpYyB2b2lk
IGR3YzNfcWNvbV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAljbGtf
YnVsa19kaXNhYmxlX3VucHJlcGFyZShxY29tLT5udW1fY2xvY2tzLCBxY29tLT5jbGtzKTsNCj4g
IA0KPiAgCWR3YzNfcWNvbV9pbnRlcmNvbm5lY3RfZXhpdChxY29tKTsNCj4gLQlyZXNldF9jb250
cm9sX2Fzc2VydChxY29tLT5yZXNldHMpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgaW50IGR3YzNf
cWNvbV9wbV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gLS0gDQo+IDIuMzQuMQ0KPiA=

