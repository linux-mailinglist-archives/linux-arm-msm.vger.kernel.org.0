Return-Path: <linux-arm-msm+bounces-110197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN1+JDTfGGrZoQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 02:35:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E72495FBB84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 02:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AEF63038C47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 00:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52911346AED;
	Fri, 29 May 2026 00:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="buW7ku25";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OJtTSNZT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M//g1Mo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525F61D555;
	Fri, 29 May 2026 00:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780014897; cv=fail; b=IIc17dEJPzqEtl1Q00TTaivd1waut2giz8PBYzgj4E40IDWkAkaT4blmmrrqlvOO+URtCJ78kfRDYCHT4NGj6GEKEtCCMNGd+c15Xv+b9xdrGP6QSNs4manJfb6aQppPm7xywP4SMwIDjK0NCXcJ1haoRk9gIlvGUpA+LiaCyJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780014897; c=relaxed/simple;
	bh=knN/cmU5fNjoTrPxBv/g7Ene2QIpoPMhTxcRnYuOdv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nIDgDcQHwdtrH9z5S0+mPJdZwcTCvPuDHO+adJicFpUxTY++8Y6MexV56Q4FBZOz+i8b1RXG9jaXoxTAEhmcaQHdODENQifZ7h0INevhJW0MUduGJ9lAk0VNG6fkIRaJf/MleiCgiuQUi3S1NdtXmtJ/CMPCa84Br2WERj+J4pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=buW7ku25; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OJtTSNZT; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=M//g1Mo0 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SLt0R41107925;
	Thu, 28 May 2026 17:34:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=knN/cmU5fNjoTrPxBv/g7Ene2QIpoPMhTxcRnYuOdv8=; b=
	buW7ku25vpZiv/mlr59yqUqfF9qHy7AmJgDcXle6NU0JhAPKZIdsZ8wtm/Fc152i
	RI3C+ncpxC94HEIDq53fdWfthEGmUQkNo7yHNc/+g/iiP+l/zhlZlrci70GJ9QXf
	lLuEvnYhq8YVV8En/mB+jyiy9WDvog3rMRry3uHfthwIqjS2Bifp7CCDs4kc0wIJ
	UAruHy+u6VymHbfnNYFbeOgsKEyuEEU9fY7GB65Ot306adcSwakuq33sg+UiDvPf
	UK2F17DvaRPDN0C6dvVxaqFMdStF20nmXj3hDwBuNa/tyibSAN+eNApd4c7hWFUw
	/GG2f+OAuX+CipB0DZtvDQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4eerntbpjx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 17:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1780014885; bh=knN/cmU5fNjoTrPxBv/g7Ene2QIpoPMhTxcRnYuOdv8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OJtTSNZT3VYz2PYQq2cGeHHr7G0f4mdn7y6+V+3f9v22sbcXfRN6/AI4gUwJGEDnF
	 BXWsuh2S8AbB5pmTFhe/x4AZRQKXpyZo7Bg0W+MQMlZk9WK99nUxDfIL54ObrRmiLq
	 f5MQjA1yTTL7V0vpKW/GrQ1zige41dNWTuadC9x4Hzcu5nljdoDJAXZDXOPIpWbiRF
	 YI0w7v12j44aLwYf/1iaaT27UvUWlAKiF0IkdrjzP8XBY1P8lqFOhj/soOeUbJZbXs
	 +1QpRJkPAnynOl3Irw+N4PK/X6qRtZNg4gBXKM11OH75dWlJYvBQk9DFdn3FHAi824
	 jepPk+RUhhILA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 12871401FA;
	Fri, 29 May 2026 00:34:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id ABBC5A0072;
	Fri, 29 May 2026 00:34:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=M//g1Mo0;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00102.outbound.protection.outlook.com [40.93.14.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D9E3940ACA;
	Fri, 29 May 2026 00:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZjQKT03csLWfSBSpvpk2TzZgyi6LGINBkWNwbDAhJmXvdhRD8YarLyh2clio3wq7UuRn3mc+LcBQn03bSSXIKtlbZaR94XtqdGGgwrUMa6o3BIXSEVq98myTMqqzJKY3XV/+SLtZmF9U8bfiMpqiywE0XBUSvX/tdSo88Vo55LYD8SSOw33gjtSaVvWCZlC/JkfbibxzToBBXB4ekE+y9WIoRZ8qyGyNJN669Z9yuMNGd5ufOuUwjQwsAUf+c9w10TQkqb+HMIge8L5hCP+lLdlsp+H60B917xSOuMfPXc+ZOcIRlM6rp0T8wYJZ7VaiXWTmXTc8hx6Q9ZR2d2HHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knN/cmU5fNjoTrPxBv/g7Ene2QIpoPMhTxcRnYuOdv8=;
 b=f5sNtMLAAX1Nyr0a+15JSbe5amrOa9VxpTxFd0odkR9K2DFjeKDRh43ILgADG74UjFpj7WHbVzz+Nycm0BNUw0E+nZ7mgnJr5fLi1VNvuSokqy8hmz91fNGUh80ZtN/zQ0r5g8e6uEQkIv+gckwrskLI8UjnZuQvN/vLQzNVqrq824v2nt00wqrzud0oZ9VEmSEasI4ll5qqV5Tfq0YiwGGOtk8oWH0c8rf4QLbCV8ZzmScaNHQ/S7+3BDFC0L5o82PILrpO3w3xpJtgu/pkTEOP3/MKPL81TxLFFnC98BF+vbGp8caoMRWuI2vBYNiZgRTzV6/alZe/DoxFw1y4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knN/cmU5fNjoTrPxBv/g7Ene2QIpoPMhTxcRnYuOdv8=;
 b=M//g1Mo0yr6WVwBujCP96M+JdN5b1VyhO8SZgbl5nakDM2L/127TWGCNRQYGUEpEooYh/uTMQwDvl9rTP6LZ76jGQb74BoIOa9c1lWcFJDJItzwYojOLsJTyQ+zWevIpMK0o/f2J84lWsk13JrtAGwD3fcxv01t/hNG1SFHQwlg=
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::7) by MN2PR12MB4255.namprd12.prod.outlook.com
 (2603:10b6:208:198::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 00:34:39 +0000
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61]) by CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61%6]) with mapi id 15.21.0025.020; Fri, 29 May 2026
 00:34:39 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Topic: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Index:
 AQHc4SrI3SfVExEMhk+zm6OnMWCdurYMcYEAgAvaCQCACldXAIAAEbwAgABRkwCAAT1VgA==
Date: Fri, 29 May 2026 00:34:39 +0000
Message-ID: <ahjYwJtiMsm0BcCh@vbox>
References: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
 <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
 <3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com>
 <ahd_VjrHp-u6thMT@vbox> <aheMJFKI_kBTH3jH@vbox>
 <jwbt56rrgbishoi4bbiigjpilh2ktf47qbhbk776biji6ggtk7@pulvagfzjr7y>
In-Reply-To: <jwbt56rrgbishoi4bbiigjpilh2ktf47qbhbk776biji6ggtk7@pulvagfzjr7y>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHXPR12MB999220:EE_|MN2PR12MB4255:EE_
x-ms-office365-filtering-correlation-id: 15cc97a8-1d3c-42ca-bdba-08debd1a1164
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|6133799003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 +QIG9CTsN9UpvR3ZiW5lC5c4zqdTsM8MX7Ip+81NSL3GguNFrgmcAS4yYI8Zm7ZBlZiGlMXQWmccK31wNPm4wYpmWiWnW0ekaxJRsiqzCl34VKm4XpFd3m8KGVWMZqDibcnU7EbPfC0Oy86NgCUyqNQErBAkMiQPviGKbo0swnk9+1znmUhDUjIW6YFdtKBDIo8vNt/KGNWNT5oxgxo6pyUj7oEGnBpPHA4d51dFPk2v4zZ2OFs5EKbgCVHsX8L3EDHgUy3DXTQRxSNePIYuyTGC4wsRCl2+R3Gv+EKYvwyW4sesyuepwxWzRWJkJbdY9PYTy/pVLlHQWzwUDwQtMCQcBc+b7ZRfebp6AoIjDCEHcJ742OeWsg3BwCmv0v9e7FLYLtRfXPLGPeBwYfeaCP1p9Gfcu47UvL4C5OlU46lH0f8FEuM/Pg6T9CQim/fcWA3qEmg9KidV+aRAFoxV1Wvtez7AM59QpU6XC+yfXn8C9hf882zo4zVSh8RCcNTKs+/UyyKn+zZQzRACXOycJB4kFExhV/Y6+mzzjKWpptJJpezZJUOondil5hevS4rR8mRKJJmLE6SJOKk32ZFV3WLmKYzZaOiU21Wla6CE+SuYMcR5dkgUSF63irES2p+tCOAs1gwqMbxo/dLH5XZSN41nfgjmZ4oEO1QmTzb+XrSLrvbf1GsTuGPYyD29V6UjLpi3bv6cZw4eTJmibesIrK6rmEaOTouXbWLDUWWbhawldlfHcXsy6mPOo+U0/BEP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999220.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OTJLN0VvR3VkUUtRdldseTdQM3duRXpveXIrTU9xOVFPcys4aDhvRGpJeHc1?=
 =?utf-8?B?WUZqR0sza1grd2tTT1FnV0VseXEvRGFKb01IeFVwRytXSmdxN1ZGWkRPMi8w?=
 =?utf-8?B?MndpdVJXVTJoQm1hTnVrTDZHN29tVnZ3MERVR0d1alJzVkx3d1VSREhCamRs?=
 =?utf-8?B?N2VzMG5YVi9GSXVqZjhCVjJ6SS85bjJ5QXRoQlJoUStqVmFTZTZtN1JmZGhX?=
 =?utf-8?B?KzVGTlBTcGxDYkU4TjhpbTFpYjhRdHllNTRxdXRYVXVZeXZPbTNDSnp0N281?=
 =?utf-8?B?cC84K3NLM3ZGTkF3bDYxLzE0RVRPWnlkYUVLL0VaaDMxdWVnMGVML3JpaC9i?=
 =?utf-8?B?czBFWURSNCsxY09MbzRNM1RLdnBxV3QxekNzNVBEamVweVd5U20rejhwUkFX?=
 =?utf-8?B?YVczZGNqUG5wSmk2cHRseDVoVk41dlpiTytCOFVxQVdRWVZ4MEtnVnBleDhy?=
 =?utf-8?B?NXR0cmhKRGR2dDZDNGlDWUJvKy9CMEdVSXFObnRlLzcxaDJuMi9aZm9zQWsr?=
 =?utf-8?B?dXd4RXFpOHdFVGkwUGVqaTNhZWplemhDSFc1WTFyeVhRNk03bGNoZGp4UEQy?=
 =?utf-8?B?cHo4MnV6U2dUdFBWY3o3YnVuOWErU25uMjVyL1IzeUhqZHFYRU9Odk5jZk1x?=
 =?utf-8?B?ZWNkZ1dtUnhoRDlwK0tHZk1zeXhIeWZ6eEp6T2VSalUvY1dpeDd1VXB4c0Iz?=
 =?utf-8?B?TUIwU2ZFYVZQQ1FZOEdYemU1REdtTzdRUlRlOVUxYndBZWhCUXJ2cGR5QXdF?=
 =?utf-8?B?bXd3QUNsanhac3J0ZVJ5dm85UEJPc2syTnRMMUhUV0pwWUx4THBUaGdHbU81?=
 =?utf-8?B?bUtrK3JOT2ViQktLVEU0WkxBYmo2d3NCdzlodHk2bzAvTDcyTDJ3RTc3NUt5?=
 =?utf-8?B?K0xHajJsWkxtYkd1OFBwVjZtaDU0Z1YveDM0Q1BURVpxVlZmbEFXOW5oTzIw?=
 =?utf-8?B?OWlHYmJTQ3pJOE1iMUtxOFJCT3NwNDh5ZjQzRER3SGdRcWhOVnlUbVhLWk1M?=
 =?utf-8?B?czg5U0VNSWluY0IxUFVNTWVVeXVhNGtERlY2YjJNWmUyb3lwUmhMdTdkNkU3?=
 =?utf-8?B?SzhmRkZPR2IyWWwwNnVtYTRhclBBV0pienZkcjhGL0RNT1NCVFVRamJ0TVpy?=
 =?utf-8?B?cVFRdXZVMVlBQitIWnFrYkxEUkpTS0YzUldRN0d3ODdFK2ZTSlJqbUJWWVo2?=
 =?utf-8?B?RVltT1NEaXVyMXRnSkh0SnpId1RqcGcycXVQSWRnc2x0d2dSenliWVZTdnVI?=
 =?utf-8?B?ZWJhcHA5RjR3QVBTczNWcDRpVzVmL2o3U2Iva1ZnQkE1NGxqOFVhY1NHV3dU?=
 =?utf-8?B?a05vM0I4aUk1UmxieDkyOVRhKzJlWHJYZitvMXhldjNrTXdORy9MTVVBT3hN?=
 =?utf-8?B?MGllOXhnQkJOYkREV0ZkdzJiRGFVK2xwYXh3MG4wdERRZFJlbWhGbTZZT3ha?=
 =?utf-8?B?cjduQ3h2UTdLem5ybEt1Q0s4bGs0S1E2Wlh1eHRxUUdCNm5scmVjRVNxRXFG?=
 =?utf-8?B?ZTVVQjlyVlVFa0ZUMmdwMjlsUmloYWtxeVJQcXp1WnFNTVZQNW1oS3MwWGl2?=
 =?utf-8?B?blJrUXkzSzFLTXJPVGNnbVdONGE2Q0VDSzlhaFRTU1JSVEVra3d1ZGYxdEw3?=
 =?utf-8?B?UUZpbXVDZVQxWGttWGFuNUQySHFjeERYaUhPRDF6K3owcENrdmJZR3M4SzYv?=
 =?utf-8?B?dnRXdm5zWk9FUGl1ZnJsZTE5dzhmUlJKbHRSSThrbDA2bXVobWJaWWtHV0Vu?=
 =?utf-8?B?YTNMdWpPZUtZOWRDMHNzdDEwdWJMU0ovQnZGNlRwMjZ5bFdKN0xJVjBFcUI1?=
 =?utf-8?B?d0RjK2Z3TzBsUW04cGQzQ2tvQTduQkQvbHFKY0FJTjNQaVdJMmhKOE9Ydzdi?=
 =?utf-8?B?b0JJUS90OGl3RW5IZTZPbmtpRFFXcnJHZEdGYXk3VGZDZ1FrUTVSdUdxY3dZ?=
 =?utf-8?B?aUpHQ2pqOWxtL01qM3E5WWxLVEs5YVBxU1ZyTzl0WEo3Mm5HRUVFZGI3L0ZH?=
 =?utf-8?B?ZEgrVk5GMEJEb1U1eHU0UTd6SEYzZ0JiR3lIMWMxOWc1TXBrU2w3V0I2NzRB?=
 =?utf-8?B?b2hjbkYrOWZOQWN2bWpoTExzMFZscXYyMTlWVDJ2YUJTS2kwcXR0K3BWQVpT?=
 =?utf-8?B?TWFKRURPUHNycnovaHBXejNRYmdlL2h5VnR5bnorUHpkeStOS2cwcWZkdlA1?=
 =?utf-8?B?OXl4YTdibkdqM1lZUzA5Q0F4czYvbW1jNjRRcWVzcyt5UStmeWRzNDVRQytV?=
 =?utf-8?B?Rm5iTEYvWWhvNlRWWTgxeUtmdDlra3BXN0N6ZFAydFEwU2JUaE9YZ1AvN2tM?=
 =?utf-8?B?V1lEYzRoS2NaN3AzTmMzTWJ5SGRqajdNaDVrQVUzRnliNlVCa3N0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A61702B8E4B974EB30B3E404FAD27A1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	iwmMVroIgG9BnaJPqrEl1Id1WxBqPQZ4ohRzUj4sS2ZLOc3NBK4D6zCYIJGT37BujnGHIxYjx9ATEZ+LL8zb6bbxixXOffsNA/6FFUGuby3UzF6PFiP83cCitQTrq/Y1Y3z0vmKgHIpqnTVPPBbSMUoTHE1lwg/ERU9/LNdUWpR06k99KX4Hy0d2DPzSNwBdKtazEzhaiIKDBlBt8M6JCWA616JmHolL0NA4ACE/gDy1WlDEgGqneoze05muclfMss1PhCQGeNrDmlhxRlrmCcqiSpHGIdO60uLGGCJ6y2WqiMcPY2Y1cwls2LrtmZyjV7IfzxzrJYfo62Gr8SJ9VQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3yeNhNwCIsq+/uhBoZmmOFdtDPSK3QtMCnTDs3TPSRGcvVwAYozNbSg7VNdiM42T3NLEnNywpU8jZZ8Eh+azWZy4Ft/LuiGqk/02NRA8oM1o/hHUvUnNOTAgWE8RnbW3UqCVmmYvdVWJww7aoQfdAc7fYqQmQtbCCGBc0/6uY/ilCPbiDnag2aQxXXyCyHDYwCoBEUPibROG9fNjhxvVoDWlKnBYOLdQJRtk/g2ts7svq9vjfVb9igtpiVUOiEfDx+M5MHeUxD/xqkNi6Juqy+GRg1hFoBLRtZZOwDbj0UDO6bNf8cE1g8IsOMSGSS96QfEarFRmkoxuf/tvd/XtJ1ca6i0h+3nAW4MLwgT4jUgAVtpj/iCX525Nf1BOG56OHocgRu9DAsAllp880jLpQ+ux2ni/zdA896KMYhUW4mfQ0a+N9rt6vO5IPJWzg5tWBvQgnsFfSrzjMWhbpQuQfPA7KT9kdrdWC4zlrxHrA+vpo2ABDf08y/N+hYxpC8g1yfB+L0Fx7ntbrUTUjPUVnYLKYWbRru3Mb4CvEak0OXjPDIjiTY4622kJBT7MRT69mYrT0HgIl03bBX2zEwY+R+YiAgCi4DVvK/ysD6PSPg4yteu/Pid4aMcApw7YICR/j1HigrZQ6SgpWEItIas1gg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999220.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cc97a8-1d3c-42ca-bdba-08debd1a1164
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 00:34:39.1358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nu9IG0LgXLPm9XIDOos9NRwae8jsm9l4i7E2vMC9Z1mSPdoSGs8oklchgutY8yJaCZ7sjTJ0fX7m67af6EN0iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
X-Proofpoint-ORIG-GUID: dN5MmQCS4qnHXYuhJMgxfokLtIyKZ3IJ
X-Proofpoint-GUID: dN5MmQCS4qnHXYuhJMgxfokLtIyKZ3IJ
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a18df26 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=5g4ouSbyTQ1DZfrKBEUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwMyBTYWx0ZWRfX6Mu9EL384JDU
 y9iQRd4oqIbwGrRB/9jceAuEx0lwK35DiMxcvzzhCw4Yyidv70XVTCsBdxkNWk4bjyLlHkWedY/
 Et+3dva17/5AEWwUMc83fJ6PCbbOVAldKwGfmJqWB44H4h6nI94Q4N32uqbiTvNf7197aq65t5Y
 npfAOPD48DsXkgAGNtNfQqUy+Nhv+eXUp2N6XVJ2su5cSSga2vAReUGg8rMkfz7S2t6+pqG3kAI
 eew9gKUooZY59fHNvCHXnmtDUvYAcDM0ks4JxF45xIzaD83kvbMvOKONBRXaMEiSK9TXpGJWkh0
 Skjb7W/eWMsqswI2VFS7SC27jNHCRcePJMqBSNNL3j0PtajL14u1BVMfRdpyPdMS0pmf76Ummjn
 DULOTWVhzfCZYKw6muz6+4FD0YCOpWUqJYIeQW9JNzF85wtmIXp53bXGPLfBaveghB3lgz9c5vi
 svaVJBp/xNcMgxvFDwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2605290003
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,synopsys.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E72495FBB84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXkgMjgsIDIwMjYsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+IE9uIFRodSwg
TWF5IDI4LCAyMDI2IGF0IDEyOjQ2OjUzQU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4g
PiBPbiBXZWQsIE1heSAyNywgMjAyNiwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gT24gVGh1
LCBNYXkgMjEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+ID4gPiA+IE9uIDUvMTMvMjYg
MTA6NDggUE0sIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+ID4gPiA+ID4gT24gTW9uLCBNYXkg
MTEsIDIwMjYgYXQgMDM6MTQ6MjJQTSArMDUzMCwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4g
PiA+ID4gPj4gZVVTQjIgdGFyZ2V0cyBoYW5kbGUgd2FrZXVwIGludGVycnVwdHMgZGlmZmVyZW50
bHkgZGVwZW5kaW5nIG9uIGRldmljZQ0KPiA+ID4gPiA+PiBzcGVlZCB3aGVuIG9wZXJhdGluZyBp
biBob3N0IG1vZGUuDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IEFjY29yZGluZyB0byB0aGUgZVVT
QjIgc3BlY2lmaWNhdGlvbiwgcmVtb3RlIHdha2V1cCBzaWduYWxpbmcgaW4gaG9zdA0KPiA+ID4g
PiA+PiBtb2RlIGlzIGRldGVjdGVkIHZpYSBkaWZmZXJlbnQgZGF0YS1saW5lIGFzc2VydGlvbnMg
YmFzZWQgb24gdGhlDQo+ID4gPiA+ID4+IGNvbm5lY3RlZCBkZXZpY2Ugc3BlZWQuDQo+ID4gPiA+
ID4+DQo+ID4gPiA+ID4+IFdoZW4gYSBsb3ctc3BlZWQgZGV2aWNlIGlzIGNvbm5lY3RlZCwgdGhl
IGhvc3QgcmVwZWF0ZXIgZHJpdmVzIGVEKyB0bw0KPiA+ID4gPiA+PiBsb2dpYyAnMScgdXBvbiBk
ZXRlY3RpbmcgYSBLLXN0YXRlIG9uIHRoZSBVU0IgbGluZXMgZHVyaW5nIHJlbW90ZSB3YWtldXAN
Cj4gPiA+ID4gPj4gKGVVU0IyIHNwZWNpZmljYXRpb24sIFNlY3Rpb24gNS41LjE0KS4NCj4gPiA+
ID4gPj4NCj4gPiA+ID4gPj4gV2hlbiBhIGZ1bGwtc3BlZWQgb3IgaGlnaC1zcGVlZCBkZXZpY2Ug
aXMgY29ubmVjdGVkLCB0aGUgaG9zdCByZXBlYXRlcg0KPiA+ID4gPiA+PiBkcml2ZXMgZUQtIHRv
IGxvZ2ljICcxJyB1cG9uIGRldGVjdGluZyBhIEstc3RhdGUgb24gdGhlIFVTQiBsaW5lIGR1cmlu
Zw0KPiA+ID4gPiA+PiByZW1vdGUgd2FrZXVwIChlVVNCMiBzcGVjaWZpY2F0aW9uLCBTZWN0aW9u
cyA1LjUuMTUgYW5kIDUuNS4xOCkuDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IFNpbmNlIHRoZSBl
VVNCMiBQSFkncyAiRFAiIGFuZCAiRE0iIGludGVycnVwdCBsaW5lcyBtb25pdG9yIHRoZSBlRCsg
YW5kDQo+ID4gPiA+ID4+IGVELSBsaW5lIHN0YXRlcywgY29uZmlndXJlIHRoZSB3YWtldXAgaW50
ZXJydXB0cyBhY2NvcmRpbmdseQ0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiBTaWduZWQtb2ZmLWJ5
OiBLcmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFwYXRpQG9zcy5xdWFsY29tbS5jb20+DQo+
ID4gPiA+ID4+IC0tLQ0KPiA+ID4gPiANCj4gPiA+ID4gWy4uLl0NCj4gPiA+ID4gDQo+ID4gPiA+
ID4+ICsJew0KPiA+ID4gPiA+PiArCQkuY29tcGF0aWJsZSA9ICJxY29tLHgxZTgwMTAwLWR3YzMt
bXAiLA0KPiA+ID4gPiA+PiArCQkuZGF0YSA9ICZkd2MzX3Fjb21fZ2x5bXVyX3BkYXRhLA0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IFRoaXMgd291bGQgcmVzdWx0IGluIHRoZSBsaXN0IG9mIHRoZSBw
bGF0Zm9ybXMga2VlcGluZyBvbiBncm93aW5nLg0KPiA+ID4gPiA+IFdvdWxkIHlvdSBtaW5kIGlu
c3RlYWQgZGV0ZWN0aW5nIGVVU0IyIGJ5IGNoZWNraW5nIHRoYXQgSFMgUEhZIGhhcyBpdHMNCj4g
PiA+ID4gPiBvd24gcGh5cyBwcm9wZXJ0eT8NCj4gPiA+ID4gDQo+ID4gPiA+IEkgdGhpbmsgd2Un
dmUgaGFkIGEgdmVyeSBzaW1pbGFyIGlzc3VlIG9uIHNvbWUgb3RoZXIgcGF0Y2guLiB3ZSBjb3Vs
ZA0KPiA+ID4gPiB1c2UgcGh5X21vZGUsIGJ1dCBpdCdkIHJlcXVpcmUgZmlyc3QgZml4aW5nIHRo
aXMgbWVzczoNCj4gPiA+ID4gDQo+ID4gPiA+IDI4OiAgICAgUEhZX01PREVfVVNCX0hPU1QsDQo+
ID4gPiA+IDI5OiAgICAgUEhZX01PREVfVVNCX0hPU1RfTFMsDQo+ID4gPiA+IDMwOiAgICAgUEhZ
X01PREVfVVNCX0hPU1RfRlMsDQo+ID4gPiA+IDMxOiAgICAgUEhZX01PREVfVVNCX0hPU1RfSFMs
DQo+ID4gPiA+IDMyOiAgICAgUEhZX01PREVfVVNCX0hPU1RfU1MsDQo+ID4gPiA+IDMzOiAgICAg
UEhZX01PREVfVVNCX0RFVklDRSwNCj4gPiA+ID4gMzQ6ICAgICBQSFlfTU9ERV9VU0JfREVWSUNF
X0xTLA0KPiA+ID4gPiAzNTogICAgIFBIWV9NT0RFX1VTQl9ERVZJQ0VfRlMsDQo+ID4gPiA+IDM2
OiAgICAgUEhZX01PREVfVVNCX0RFVklDRV9IUywNCj4gPiA+ID4gMzc6ICAgICBQSFlfTU9ERV9V
U0JfREVWSUNFX1NTLA0KPiA+ID4gPiAzODogICAgIFBIWV9NT0RFX1VTQl9PVEcNCj4gPiA+ID4g
DQo+ID4gPiA+IGludG8gUEhZX01PREVfVVNCICsgc3VibW9kZXMgYW5kIHBoeV9vcHRzDQo+ID4g
PiA+IA0KPiA+ID4gDQo+ID4gPiBJTUhPLCB0aGlzIHNlZW1zIHRvIGZpdCBiZXR0ZXIgaW4gdGhl
IERUIGJpbmRpbmcsIGllLiBhIERUIHByb3BlcnR5DQo+ID4gPiAicWNvbSxldXNiMi1waHkiIHdv
dWxkIGJlIGEgY2xlYW5lciBzb2x1dGlvbiB0aGFuIHRyeWluZyB0byBtYXRjaCB0aGlzDQo+ID4g
PiB3aXRoIHRvIGNvbXBhdGlibGUgc3RyaW5nLg0KPiA+IA0KPiA+IEFjdHVhbGx5LCBpdCBzaG91
bGQgYmUgInFjb20saGFzLWV1c2IyLXBoeSIuDQo+IA0KPiBObywgaXQncyBhIGJhZCBpZGVhIGZy
b20gbXkgcG9pbnQgb2Ygdmlldy4gVGhlIHBsYXRmb3JtIGRlZmluZXMgd2hldGhlcg0KPiBpdCBp
cyB1c2luZyBlVVNCMiBvciBub3QuIEFzIHN1Y2gsIGl0IGFscmVhZHkgY2FuIGJlIGRldGVybWlu
ZWQgZnJvbSBEVC4NCj4gVGhlIHByb3BlcnR5IHNlZW1zIHRvIGJlIGEgZHVwbGljYXRlIG9mIHRo
ZSBpbmZvcm1hdGlvbi4NCj4gDQoNCkkgdW5kZXJzdGFuZCB5b3VyIHBvaW50LCBhbmQgdGhlcmUg
bWF5IGJlIGNhc2VzIHdoZXJlIGFzc29jaWF0aW5nDQpjb25maWd1cmF0aW9uIHdpdGggYSBjb21w
YXRpYmxlIHN0cmluZyBtYWtlcyBzZW5zZS4gSG93ZXZlciwgSSB0aGluayBhDQpEVCBwcm9wZXJ0
eSBpcyB0aGUgYmV0dGVyIGFwcHJvYWNoIGhlcmUuDQoNClRoZSBEVCBkb2VzIG5vdCBjdXJyZW50
bHkgZGVzY3JpYmUgdGhlIHBoeSBpbnRlcmZhY2UgdHlwZSBpbiBhIHdheSB0aGUNCmRyaXZlciBj
YW4gZWFzaWx5IGNoZWNrLCB0aGUgcGh5IHBoYW5kbGUgaXMgdGhlcmUsIGJ1dCB0aGVyZSBpcyBu
bw0KZnJhbWV3b3JrLWxldmVsIGF0dHJpYnV0ZSB0aGF0IHNheXMgaXQgaXMgZXVzYjIuIFNvIHRo
aXMgcHJvcGVydHkNCmlzIG5vdCBkdXBsaWNhdGluZyBleGlzdGluZyBpbmZvLg0KDQpNb3JlIGlt
cG9ydGFudGx5LCB0aGlzIGlzIGNvbW1vbiBhY3Jvc3MgbWFueSBxY29tIHBsYXRmb3JtcyBhbmQg
d2lsbA0Kb25seSBncm93LiBNYWludGFpbmluZyBhIGxpc3Qgb2YgY29tcGF0aWJsZSBzdHJpbmdz
IGluIHRoZSBkcml2ZXIgcHV0cw0KYW4gb25nb2luZyBidXJkZW4gb24gZHJpdmVyIG1haW50YWlu
ZXIgZXZlcnkgdGltZSBhIG5ldyBwbGF0Zm9ybSBpcw0KYWRkZWQuIEEgRFQgcHJvcGVydHkgaXMg
b25seSBhIG9uZS10aW1lIGNvc3QgcGVyIERUUywgYW5kIHRoZSBkcml2ZXINCnJlbWFpbnMgdGhl
IHNhbWUuDQoNCkJvdGggYXBwcm9hY2hlcyByZXF1aXJlIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlv
biAobmV3IGNvbXBhdGlibGUgc3RyaW5ncw0KbmVlZCB0byBiZSBhZGRlZCkuIFRoZSAuZGF0YSBt
YXRjaGluZyBhcHByb2FjaCBkb2Vzbid0IGF2b2lkIGJpbmRpbmcNCm1haW50ZW5hbmNlLCBpdCBq
dXN0IG1ha2VzIGl0IGxlc3MgdmlzaWJsZS4NCg0KVGhlICJxY29tLGhhcy1ldXNiMi1waHkiIGRv
ZXMgZGVzY3JpYmUgdGhlIGhhcmR3YXJlIHByb3BlcnR5IGFuZCBzZWVtcyB0bw0KZml0IGZpbmUg
aW4gdGhlIERUUy4NCg0KQlIsDQpUaGluaA0K

