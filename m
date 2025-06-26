Return-Path: <linux-arm-msm+bounces-62690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E26AEA798
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 22:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A48E7AF725
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 19:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2EB2F0E45;
	Thu, 26 Jun 2025 19:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="JSYfG9bL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="kU2LS6Ck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta40.messagelabs.com (mail1.bemta40.messagelabs.com [67.219.247.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24052F0C4E;
	Thu, 26 Jun 2025 19:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.247.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967953; cv=fail; b=iBItADBT13TNlwkM6ibv+EKIBn8VDJ9zjuvoXvIYs7ymFk4WpL4gB6SZ+mNVsZI/qz7qo8CSZcZi/q/cW8nT7SB8IswCZhgS+GP7SBwwLo6XnNaIX9ErcXPv34yr4ix5dMf2PvosXXFxMdg/2k9bH1MI9Bc94lI3OoKOc8ku+Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967953; c=relaxed/simple;
	bh=3cz+Nrp5UFXrSrZuPGNxE7bPZbZijDJxv1krI2D6BGs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M88Y1fUDq3VUmxdkAMJ17tRfRBFOF0YPwdcLrfkTTe6mAD3j5AU5FTTt6FP8jY9nSJ2wnlCKFHcFjkn5bCT8wNXHlB4k4ai08jiaiZB8Prm8jJ7ob5TzC6pJuCCrjwvIR8Co0mLVl2n7TgJtTo6XSbqCQXXjm7sqXgHVAkNHzVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=JSYfG9bL; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=kU2LS6Ck reason="signature verification failed"; arc=fail smtp.client-ip=67.219.247.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1750967949; i=@semtech.com;
	bh=3cz+Nrp5UFXrSrZuPGNxE7bPZbZijDJxv1krI2D6BGs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=JSYfG9bLub2xg8yoK1vvkx/7ErdXucpgWXT1aNoObzEKRxZRXtn6kO/mx37o7yqpf
	 XthkkGxlAdePTD4OXYreIHp20VE4wCo6lcQ+Y3/g6732T9fsT56WbKi0nMoNh0m0sM
	 hMcENCwGShSDU6LMjEgj7ALzHTA5/8lU58tlEZwG3hlJhtzKxYT/sxeCF6yb56oZ4J
	 UPBXLRtLfgJFAHsR/FFFV8hYsfdDAFeEEv8g2KmYxdDdAAZx6vS1lUFX+hpOzQ+68P
	 avQMmiyz0c1zIz82O9Tx88lqt4LELyj7qpnwxJvR6KHMt4NrAUGeQEKNxcP6HXubkg
	 hZFkc5IU8i8eQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTa1AbVRzFudlHFkrqEgJcYynTjAaxJZQ66Hb
  6oVqrk6po/eConQJu6EIiITDZpBLQTh/SB7RjqURKBnmlIE1xqqFYCLSlFadDirwKFZCCSIQA
  EohUqjOIZrO01W/n3N/57z33zl0CEecLpQSTY2D0Olorw4PQpzPScmILa5PUm80tAqqiJIGab
  a7BqToTVXTtByF121GGU20LNkDd/eQERp3ynsep79qiqE+tLoSa7J1BqQa7GaE8K2WCF0RKa1
  0xpvx5YhhRltfnKZstd4VKu+0Erhy504orPV1dQqW7oRQoi1oPKBft63cH7cE0OlVWzvuY+sy
  F57Nt0TkjYyvgIHDLC0AQAchaBLY4inHeWDE4X/UZxpsGAI+WHQKcQcnLCBwvOY9wRkxWCmB/
  a+WqGQPQ01nkmwkkcHIDzL93S8ABCXkUwMJjXv88Qg6g0G6txrlUKGmCUysDCKclZC4cm6tc1
  Ttg34JLwGmUfAo2fOMQclpEJsGvDtswfjsngL9fLfUBgggkk+HY3yyXAWQ4vO+s988iZAQcdl
  X4NSRJeK61G+F1GJyeWMH4vBHemp5D+fVI2FdRCHi9HV6ral/NJ8Lrx29ivF4PbafGV/NR8PP
  qeSGv34G/nmn2XwUkfwqF7Q2XhLyZBLDI2oPzqc2wfKkd58GgBJYO9eLcCRAyBl50xJ0Gmyz/
  KW55RPjlDbC4cFxo8d9FCOwodaGVALWBBJbR72f0sVu2KFR6TbrakElrtAo6N1alMLKxDM0a4
  hXpqdkKhmUVrCkzVbtPoWMMduB7kUEL7yY0geqOI3E3wOOEQBYmWjQnqcVrVVn7TGqaVafojV
  qGvQHWEYQMihrP+ViInklnctI0Wt+7foAhESyTiKItPixis+lMVpPOIyeIJe5f77iCiFFdlo6
  RRohMFb4QyYXURt3DTzz4O/pApDRUBAICAsTB2Yw+U2P4P58BEQSQhYpKuCbBGp3h4U4zvhIC
  Xwl2ai9XwkA/QtKDgo9jyv9UbHtz9C/dt4cc9/LstpNLX2+f1dllu053tg4WWievvjh688hGI
  rERe/aXqq0TBVlDa+gax4413R+pzza69OG9h0t+fGzqOflvSZo9+UmSKzHfgwONuVjK6HxIbf
  /ccuBufUv48ZVLnW0Zs/1hf7w21CTeeMc6UBC3rr+0xFXwks29za1CBd6z7Rkawy4vTA2alpt
  rsMHhhEBq4snOoTfMF/LSrPKq6A82vSeLXqyreV0aln0R0t26neF93v0pAuSLeO/b/8h37h14
  2WOSfCmSNI10fBhzrImJ9JJd9Vvzk3H5ZI/WbXsiOV28drBn6XbUK4knjW85l1+t9yxfdspQV
  k3HP4PoWfpfojl9FpgEAAA=
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-10.tower-929.messagelabs.com!1750967945!488066!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 11480 invoked from network); 26 Jun 2025 19:59:06 -0000
Received: from mail-dm6nam04on2120.outbound.protection.outlook.com (HELO NAM04-DM6-obe.outbound.protection.outlook.com) (40.107.102.120)
  by server-10.tower-929.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jun 2025 19:59:06 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTnXn3Jge+233rNaHXEb/5QcZB/oeDwVgjqAl+PyH7MAD8DlCotiDh1De8sbqfv1CGp3GqC5liXugH7FfIcrNpp4o4CHVy9ltfFK3lDKyhNCwUZgquT+D+Tz36K2pbz0DBV0l3bynOtxtvdc7RUCVLEmiXROReEzuVuNWoHgaofEMbpu8rHLVvLPAF0k73mOXZJBpdC7GyAKO1VEn9SmBGrKiaIQXOtHd4oVF22e3/6OfPZoRjKpn5QYktodeFxAfm0DkuoCachTmV96S2FZeTA1CXriLSQa9gQMCbo4MUujsXfX4H3SU/GjR5qDEdalndaTKa8RCxIGA+SL9RbFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcQoka2dCgezc8R5rcDmmlWBFFrCiQgXDDacVDngiCo=;
 b=aUtYuK4aOHBeA7pFVQFvOcHlOl9jbZVhfsLC6Srk799V4nxR7yD1nGsRJp6thUViMkOL9/tXZ3aRvMh8KL7e0JhklVhu+eiQTF2Ed+t/U+ubkq6euWNLYp4pl6Y9FVNP/IgROua5NQ9rgeOn7axYqwdeqEFRu+YGaZ1OEzatFeoGISfoCk/EtHmMBMkeFqLDZT8hDwaw2Onijd03wuigvLUmYMn2j0iCiDj2XSg59ZuSggWlec5XJGbuM/q76HA0HMVsxaCFtrzeazSGlIZBn5XR7aboSSYG110fXFsOmb/uS1n7CFJPd412uqYRHqaAhROgXuafPgLFRXrAY3aQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=semtech.com; dmarc=pass action=none header.from=semtech.com;
 dkim=pass header.d=semtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcQoka2dCgezc8R5rcDmmlWBFFrCiQgXDDacVDngiCo=;
 b=kU2LS6CkSlIeI8vkV2EsFFy5vDc0roV/J35UpGtgiiK6+zfSgFkqcNJDyV5wro9f7LvhhB51ru2miJmnir9C5Gf91OSbGOrE3k0BjaXQB3vp9thXPfFIlLicoBRQEwgmCZQsjCvVG0ZPL0FB8b+FAuJ31NMaOhcTGUef+ghQiPs=
Received: from CY5PR20MB4867.namprd20.prod.outlook.com (2603:10b6:930:21::18)
 by IA0PR20MB6813.namprd20.prod.outlook.com (2603:10b6:208:405::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 19:58:50 +0000
Received: from CY5PR20MB4867.namprd20.prod.outlook.com
 ([fe80::1107:de62:e17d:a1de]) by CY5PR20MB4867.namprd20.prod.outlook.com
 ([fe80::1107:de62:e17d:a1de%4]) with mapi id 15.20.8857.019; Thu, 26 Jun 2025
 19:58:49 +0000
From: Adam Xue <zxue@semtech.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Thomas Perrot
	<thomas.perrot@bootlin.com>, Aleksander Morgado <aleksander@aleksander.es>
CC: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"slark_xiao@163.com" <slark_xiao@163.com>, "johan+linaro@kernel.org"
	<johan+linaro@kernel.org>, "quic_vpernami@quicinc.com"
	<quic_vpernami@quicinc.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
	"quic_msarkar@quicinc.com" <quic_msarkar@quicinc.com>, "mhi@lists.linux.dev"
	<mhi@lists.linux.dev>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Iulian Mocanu <imocanu@semtech.com>
Subject: RE: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x
 and set MRU to 32768 for better performance.
Thread-Topic: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x
 and set MRU to 32768 for better performance.
Thread-Index: AQHbz/pRmk2bEjbGOUCvCkmNwzHUFbQHNAyAgAt9T/CAA1gCoA==
Date: Thu, 26 Jun 2025 19:58:49 +0000
Message-ID:
 <CY5PR20MB48671EEF395AC1824F16E0D9C67AA@CY5PR20MB4867.namprd20.prod.outlook.com>
References: <20250528175943.12739-1-zxue@semtech.com>
 <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
 <CY5PR20MB4867E63E4B5107728904826EC678A@CY5PR20MB4867.namprd20.prod.outlook.com>
In-Reply-To:
 <CY5PR20MB4867E63E4B5107728904826EC678A@CY5PR20MB4867.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR20MB4867:EE_|IA0PR20MB6813:EE_
x-ms-office365-filtering-correlation-id: a37d64c4-bc95-4298-590f-08ddb4ebde7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUkxTTZTTTZ0MHFGbUZBbDQ1U0ovVmlDZ3ljcG1NQ2tCVTRXcWlNZGh5MElu?=
 =?utf-8?B?cC95SGFzMDhDZncvbVEyZzJOV0c4THdwSjNCRENIUjRDYmUrMmwyMkltUVYx?=
 =?utf-8?B?c3pvQzdsTVp2MmdoZWpCeEliNHh0UVEveG9YaWlUN29XS2Z2SlhydHhCWEVs?=
 =?utf-8?B?YWl1ajJOZndhY20zL0p0YVBsZXIwV3NyYlM2dHdzak5LdHd6RGVhekt6SDFV?=
 =?utf-8?B?bS9hVko4WVBkS0ZpVVppSXlPVWRTMUtERXd2bUJERjdjY3YvVUJ0OFhPQUN3?=
 =?utf-8?B?bi9vcjJaNUl5WEFoYzIxSFFlK2VSWXhxL1dtWWgvenJiYTE2M1pjTmhKcnRP?=
 =?utf-8?B?L2hrcWEzU1d3WWg5L1o2RVhkWmY4azJrT2ZlZm03ZU8rdTZnTE1samg2SmNG?=
 =?utf-8?B?Q0xZQzMvYUJDNnlxU1hZWmsrcTh4S2p4YVprWGp4L2YrSWlJS3Zzb1NxVUtW?=
 =?utf-8?B?dG94SUl2cjdQUkVpZTNkajB6R1VxS0ZWQkFVeFFkQ0k3bkxaejQ1NENQLy8y?=
 =?utf-8?B?RlFlYUNJVlB0WW1BVUE0clBUQWk4RUNwQ1JEa3lNa2xNYk52SW9kUkRXUUhX?=
 =?utf-8?B?Z1RQMlVuL1JHUDBsMzBpNXYwZTRCK295azJ4TFh0ZDRVc2dRUXgzelpQdENS?=
 =?utf-8?B?bUlTU25CN21Wb0hPVUtSSGlYUkM3T2NGendFN2xqTmdMZldUTDVXdW82ZU9j?=
 =?utf-8?B?Y2ZrVGt6VlBIM3lOTVorOGlZVVhSYUcwSjFWQXdlVDNlc1JFakdhblROK3Az?=
 =?utf-8?B?bnpYcU5SRWUvTm8yMTBWSk1ibVh5YnBXTi81ZjdzR1dwNVFpTkRPQ1JnY3V2?=
 =?utf-8?B?anB4YnRQeEU3M1NyblpiZS8zTDlDVElJL3Z4ZjVjSG81QmxBR0JJVHR2bzE3?=
 =?utf-8?B?NElwK1JxWUJJUmpyNUdhUFJ2OW10ZytvbWY2TXlWK1hEcWFadTJsa1JJYzZr?=
 =?utf-8?B?TzhtZnJyY05xOEEvVzJSaThkc1psZk0rSzd0UExCMGFNb1dJamhjejdwYXJV?=
 =?utf-8?B?NnpOWEFQWUVwMkFuS3ZrRkYzVWc4T2NQUnMwQkkvTm13dEQ3a3d1ZFJ0bUUz?=
 =?utf-8?B?TXBXRTlGV2tVdWRpdFhzaWtobkl3NVVOS3VHWXl0ZjlLRXRLdDZpU3pZbXFm?=
 =?utf-8?B?ZTVscTZvUGdCSGQ3UXBFZVhxUVJyQ0srYk5UcVlaaVh5bEQ3Snh1Q2k5Nk5y?=
 =?utf-8?B?N3dEVlh6VFg0Wldvc1dHaVNORURYb3dpWVNPellURWx6YjZWaEZTa2ZCcEx1?=
 =?utf-8?B?dlMyNDl6SzFiVWpXWVBMazlWZmNqNUVzT3liTW55bmFmb1pGeVBBMVNxNzB3?=
 =?utf-8?B?Vjl1aWdVV2tHRnZjVmoyS01tRERIcDFXR0V6bWJkRnJOUWliUnBGL3BlbENR?=
 =?utf-8?B?RXI5WXptaytHa3NYU1AvNlJPTlJLYndMQm5oTTZFZFg3cDg0SGJIZDhUMnJS?=
 =?utf-8?B?SHNUVFZKZHo1L3ZwdGVjZ3BHSXE3OHBaMHNIcUw3a1BOUXc0eitONGhUeGJR?=
 =?utf-8?B?OUZJUWh0azhZLzJLcWswbUgrZWNYb2VXY3BnVTVWYUhWVTJVeWJlMVBzV1hF?=
 =?utf-8?B?MVFUdFljK001aUkwcUZoYW9nMVljRFRqa0RCSmNycFJxNC9tUlNFZUdXTkZ3?=
 =?utf-8?B?ZE9laUJuZE1xRFE2VElWQjVwYUNNVE1pR204TXM2MTJGWDkxUFlTTzJiWVRS?=
 =?utf-8?B?ay82dEtUUXYxaWNZa256V2ZZMldXSzljRmJSQVpOenFrcm5aU1BHZUxtdHRE?=
 =?utf-8?B?dFhNSUl5WWhmSXNBemV2a1p6MUNiR2Nidjhjd0EzdFJMTTZiRktyZ1liUEFV?=
 =?utf-8?B?ZTVXdTQ0R242S2pOeXNtTlJ3TmwxWmRFV3BmUXgrd0J1MVd0QzNWTVNLSzdk?=
 =?utf-8?B?OHhQZkpVRXNzWUZqdkE1djZxRFN3U0NvelpzdGZYVVFEbm5uQ3pEcThxQVJ0?=
 =?utf-8?B?dkNVN3Jhd0tLc1FNM0RqL3Y4SXdtM1NHUllkb0hSM1BDQ01sUDQvRUVUNk8z?=
 =?utf-8?Q?bKAJNQdZHq1L+D7BD2xckxuEVFNulU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR20MB4867.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enlPNnFaOFJSSWxsRTNMZkVkUCtGZk5ObndFeWZ6NUJsKy9HN2V2TmZtMEVp?=
 =?utf-8?B?S01vbGdRc205QkFNREdWY2poL29yV3pZL1dRNFhKYkJRUFpjNHBMRjYzbGUz?=
 =?utf-8?B?bTVUSlNDaC9jdDQ5dU55M2N2ZnBLSXZNVC9jZFRnUGwyVGRZK28yMHdQNW9D?=
 =?utf-8?B?MEU1OEdOTFg4YVRHSEJrOFViNDNGc2hlVnh5aFZBWWRreDh3YnJjeCtnK3lY?=
 =?utf-8?B?b0VrT1NqUTdEWmY5OXBTNGVQV3doZHdNbUZ1NVJaTWxXME42S0dia3crZkZZ?=
 =?utf-8?B?M3Bsb0FwU0lCemFvUWUrNEx6aHpZLzhYNTg1SXc3UXlraHBNRmo1WUUzdThx?=
 =?utf-8?B?ZERENGtCQlhGWWY1d2N6dGxFektrRDFSYTdxNEt5M09oK095S2dONko0RFFQ?=
 =?utf-8?B?S1V6emdCWmREZjBQMnlaRGNqNjhJMVVSR2hkSGZqSkpkdDZHb1g0RjZHVDdz?=
 =?utf-8?B?R05pNm9Zcjdzd2x3eTFVbGgycmQ3STlHMnBRRW9leUNIZnVROUZiV2tlSWsz?=
 =?utf-8?B?ZkxLUFZnbG1DVENrQVd3bm1TOUE4aVR3VHlrRUhxdTVVUWZvSjcxN3lwb2sx?=
 =?utf-8?B?S251MzlkU1RmQzF4UHpuNGFPUlZpaFNpTVluWkg4Mmh2aWtGSmJIblZ2TTNr?=
 =?utf-8?B?Y04zRThCR1FwaXhkWUF1WjR4cFlnN2dlSFh3Q3VDbkhHdVI2bmlXdDJxMG04?=
 =?utf-8?B?MDlFYTZJU2RsbUxqYXAvOTZGcjdMU1IyUEJWbmF4ZCtoR0RVUDZ6SFIyUjhT?=
 =?utf-8?B?S2NEZ2tWaytmZmQ3NFNxWXhsNXBPQlNIZGNRcDM0VTFWRFhiNzVldUxINnhD?=
 =?utf-8?B?OGF4T2FNMmtKOEw4dDZiQ1FIUW1HYldVUlZQTUM4dlROWGpUamJ3RW9hZkdl?=
 =?utf-8?B?dmQzeDk3QnhpUVNKZXhwNG41aGswMWJGUW1QSEFmbkdJS2x3OW5TanJIZVlx?=
 =?utf-8?B?NHdSZUVwWmxBbVplS2VUa3pNYVZ5UlIzTnJna1lMY0oyMkk2aXk4cWN6bEJY?=
 =?utf-8?B?K3BqbmhWSGkxZ2RaVUhIeUhuYytNdmpmSkRUMUE0WFRsK1ZzYUJWNDh1b1lk?=
 =?utf-8?B?aHVidERFZUJ6NFJJQWRRWE5TKzdpU0gyNzJaalRFYTVUeHY3d3hhdlJ1ZjJh?=
 =?utf-8?B?ckZ3U29kRExPSWRRQnFiK2gwajR6TTIrTVozRWZ0NUNYWHNodzRTbDdTLzJG?=
 =?utf-8?B?SUFwSzJsTFNpVVBKa3lQZDhXNTd1azNLTWR5UzFrREdtZ3l3VUw5dWFCNjFU?=
 =?utf-8?B?alc0WlNMLzYrYnA3SGh3NFQ1RnU4NDBiNjJnK1RPNHNiQjkvS3lQNVh6UG5V?=
 =?utf-8?B?ODNlSGNzUHJJUnFXQURKYVpzcGlCTHZkQWFlTHVzZnhUWTQvL3BwTU1Jcng5?=
 =?utf-8?B?TGhXUkRPSUNoeERPN2FzcTh3aS9JMW9yalFyK25iOWoyQm1RQjhMV25EWjJG?=
 =?utf-8?B?eTlUeUcyaTJGdUJ4bVFBSzNNYjVaOXNvU3V0ckV4Mk1JbUJPOUVRVFp5RkE5?=
 =?utf-8?B?NnV0RGg4Yis3cnNBNUEvOEpXaG9yeExUak1UWWxqVGJ3Y0ZjRlpPb2Z4Q0pF?=
 =?utf-8?B?YVIxRFN5SHUyaVlpZWVjS0hQVGtrSk5PZy9hSEYyQWNHRzdDN2lNNUtNdVU4?=
 =?utf-8?B?YWVodzhLbitnZFVEN1R3SlI5M0EyaTNTY1pRWG5OWGxnVHBXY0s3blh0bWNv?=
 =?utf-8?B?czRXWS9jcWQ1NVcraitzNWJzYmpoYUNXUjhFZ0NBYmJnK01VemllTkRSSjVJ?=
 =?utf-8?B?MzRBaVh1eVFIYkFteTd1RVNPbHFxbkV2RzNVcVIvNEIrUDVBUFlLT1EwTUp6?=
 =?utf-8?B?cTBSemVvQzBWcVlER3FsYmRjN2tNU3RaNFJSTW5tNmsrUDVrL0dSRC8xdzNq?=
 =?utf-8?B?VUxXdHBLLzZHRWU5NUFTY3gvRDFxRUdhZ0g1QU5tSzBvSUppOXVPVlpOQkwy?=
 =?utf-8?B?RFo2UGFlamVURk95MWZVL055TWdKYTdmdG5VNUcza293cUxYMVpvNmxXcTlr?=
 =?utf-8?B?RGcvcnBPdGtRS205RXJpOWl4T0FJdUJUbm1zTWxHZkkvYXFjT1RHaG9tY2dJ?=
 =?utf-8?B?NE5QaEFYQmMraW8xTnNNa1lUVXR6QU1oVGtiN2pMeTA0WVZPSTFDcTAyOWtY?=
 =?utf-8?Q?UhVo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR20MB4867.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37d64c4-bc95-4298-590f-08ddb4ebde7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 19:58:49.9361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+MflMNI8XPmhQBrvpKmGuWZ1fKYDdEAn2LWI7w778wLjsoDQCyb5ZqN5SSjHe995/H1izlf+GiXCIJ4kOguAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR20MB6813

QW55IHVwZGF0ZSBvbiB0aGlzPwoKVGhhbmtzLCAKCkFkYW0KCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCkZyb206IEFkYW0gWHVlIDx6eHVlQHNlbXRlY2guY29tPiAKU2VudDogSnVuZSAyNCwg
MjAyNSA5OjU3IEFNClRvOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz47
IFRob21hcyBQZXJyb3QgPHRob21hcy5wZXJyb3RAYm9vdGxpbi5jb20+OyBBbGVrc2FuZGVyIE1v
cmdhZG8gPGFsZWtzYW5kZXJAYWxla3NhbmRlci5lcz4KQ2M6IG1hbml2YW5uYW4uc2FkaGFzaXZh
bUBsaW5hcm8ub3JnOyBzbGFya194aWFvQDE2My5jb207IGpvaGFuK2xpbmFyb0BrZXJuZWwub3Jn
OyBxdWljX3ZwZXJuYW1pQHF1aWNpbmMuY29tOyB0Z2x4QGxpbnV0cm9uaXguZGU7IGZhYmlvLnBv
cmNlZGRhQGdtYWlsLmNvbTsgcXVpY19tc2Fya2FyQHF1aWNpbmMuY29tOyBtaGlAbGlzdHMubGlu
dXguZGV2OyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgSXVsaWFuIE1vY2FudSA8aW1vY2FudUBzZW10ZWNoLmNvbT4KU3ViamVjdDog
UkU6IFtQQVRDSCB2MV0gYnVzOiBtaGk6IGhvc3Q6IHBjaV9nZW5lcmljOiBBZGQgc3VwcG9ydCBm
b3IgRU05Mjl4IGFuZCBzZXQgTVJVIHRvIDMyNzY4IGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UuCgpI
aSBNYW5pIGFuZCBBbGVrc2FuZGVyLCAKCkkgbWF5IGNvbGxlY3QgdGhlIGxvZ3MgaWYgcmVxdWly
ZWQuIE9yIHdlIGNhbiBzaGlwIGFuIEVNOTEgbW9kdWxlIGZvciB5b3UgdG8gdmFsaWRhdGU/CgpU
aGFua3MsIAoKQWRhbQoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogTWFuaXZhbm5h
biBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+ClNlbnQ6IEp1bmUgMTcsIDIwMjUgMjoyNyBB
TQpUbzogQWRhbSBYdWUgPHp4dWVAc2VtdGVjaC5jb20+OyBUaG9tYXMgUGVycm90IDx0aG9tYXMu
cGVycm90QGJvb3RsaW4uY29tPjsgQWxla3NhbmRlciBNb3JnYWRvIDxhbGVrc2FuZGVyQGFsZWtz
YW5kZXIuZXM+CkNjOiBtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZzsgc2xhcmtfeGlh
b0AxNjMuY29tOyBqb2hhbitsaW5hcm9Aa2VybmVsLm9yZzsgcXVpY192cGVybmFtaUBxdWljaW5j
LmNvbTsgdGdseEBsaW51dHJvbml4LmRlOyBmYWJpby5wb3JjZWRkYUBnbWFpbC5jb207IHF1aWNf
bXNhcmthckBxdWljaW5jLmNvbTsgbWhpQGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLW1zbUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEl1bGlhbiBNb2Nh
bnUgPGltb2NhbnVAc2VtdGVjaC5jb20+ClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIGJ1czogbWhp
OiBob3N0OiBwY2lfZ2VuZXJpYzogQWRkIHN1cHBvcnQgZm9yIEVNOTI5eCBhbmQgc2V0IE1SVSB0
byAzMjc2OCBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlLgoKQ2F1dGlvbjogVGhpcyBlbWFpbCBvcmln
aW5hdGVkIG91dHNpZGUgb2YgU2VtdGVjaC4KCgpPbiBXZWQsIE1heSAyOCwgMjAyNSBhdCAxMDo1
OTo0M0FNIC0wNzAwLCBBZGFtIFh1ZSB3cm90ZToKCisgVGhvbWFzIGFuZCBBbGVrc2FuZGVyIChm
b3IgRU05MTlYIHJlbGF0ZWQgcXVlc3Rpb24pCgo+IEFkZCBNSEkgY29udHJvbGxlciBjb25maWcg
Zm9yIEVNOTI5eC4gSXQgdXNlcyB0aGUgc2FtZSBjb25maWd1cmF0aW9uIAo+IGFzIEVNOTE5eC4g
QWxzbyBzZXQgdGhlIE1SVSB0byAzMjc2OCB0byBpbXByb3ZlIGRvd25saW5rIHRocm91Z2hwdXQu
Cj4KClRoaXMgYWxzbyBhZmZlY3RzIHRoZSBFTTkxOVggbW9kZW0uIFNvIEkgd2FudCBlaXRoZXIg
VGhvbWFzIG9yIEFsZWtzYW5kZXIgdG8gY29uZmlybSB0aGF0IGl0IGRvZXNuJ3QgY2F1c2UgYW55
IHJlZ3Jlc3Npb24uCgpSZXN0IGxvb2tzIGdvb2QgdG8gbWUuCgotIE1hbmkKCj4gMDI6MDAuMCBV
bmFzc2lnbmVkIGNsYXNzIFtmZjAwXTogUXVhbGNvbW0gVGVjaG5vbG9naWVzLCBJbmMgRGV2aWNl
IDAzMDgKPiAgICAgICBTdWJzeXN0ZW06IERldmljZSAxOGQ3OjAzMDEKPgo+IFNpZ25lZC1vZmYt
Ynk6IEFkYW0gWHVlIDx6eHVlQHNlbXRlY2guY29tPgo+IC0tLQo+ICBkcml2ZXJzL2J1cy9taGkv
aG9zdC9wY2lfZ2VuZXJpYy5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5j
Cj4gYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4gaW5kZXggMDNhYTg4Nzk1
MjA5Li45YmY4ZTc5OTE3NDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNp
X2dlbmVyaWMuYwo+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPiBA
QCAtNjk1LDYgKzY5NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5mbyBt
aGlfc2llcnJhX2VtOTE5eF9pbmZvID0gewo+ICAgICAgIC5jb25maWcgPSAmbW9kZW1fc2llcnJh
X2VtOTE5eF9jb25maWcsCj4gICAgICAgLmJhcl9udW0gPSBNSElfUENJX0RFRkFVTFRfQkFSX05V
TSwKPiAgICAgICAuZG1hX2RhdGFfd2lkdGggPSAzMiwKPiArICAgICAubXJ1X2RlZmF1bHQgPSAz
Mjc2OCwKPiAgICAgICAuc2lkZWJhbmRfd2FrZSA9IGZhbHNlLAo+ICB9Owo+Cj4gQEAgLTgxMyw2
ICs4MTQsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgbWhpX3BjaV9pZF90
YWJsZVtdID0gewo+ICAgICAgIC8qIEVNOTE5eCAoc2R4NTUpLCB1c2UgdGhlIHNhbWUgdmlkOnBp
ZCBhcyBxY29tLXNkeDU1bSAqLwo+ICAgICAgIHsgUENJX0RFVklDRV9TVUIoUENJX1ZFTkRPUl9J
RF9RQ09NLCAweDAzMDYsIDB4MThkNywgMHgwMjAwKSwKPiAgICAgICAgICAgICAgIC5kcml2ZXJf
ZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9zaWVycmFfZW05MTl4X2luZm8gCj4gfSwKPiAr
ICAgICAvKiBFTTkyOXggKHNkeDY1KSwgdXNlIHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24gYXMgRU05
MTl4ICovCj4gKyAgICAgeyBQQ0lfREVWSUNFX1NVQihQQ0lfVkVORE9SX0lEX1FDT00sIDB4MDMw
OCwgMHgxOGQ3LCAweDAzMDEpLAo+ICsgICAgICAgICAgICAgLmRyaXZlcl9kYXRhID0gKGtlcm5l
bF91bG9uZ190KSAmbWhpX3NpZXJyYV9lbTkxOXhfaW5mbyAKPiArIH0sCj4gICAgICAgLyogVGVs
aXQgRk45ODAgaGFyZHdhcmUgcmV2aXNpb24gdjEgKi8KPiAgICAgICB7IFBDSV9ERVZJQ0VfU1VC
KFBDSV9WRU5ET1JfSURfUUNPTSwgMHgwMzA2LCAweDFDNUQsIDB4MjAwMCksCj4gICAgICAgICAg
ICAgICAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpIAo+ICZtaGlfdGVsaXRfZm45ODBf
aHdfdjFfaW5mbyB9LAo+IC0tCj4gMi40NS4yCj4KPgo+IFRvIHZpZXcgb3VyIHByaXZhY3kgcG9s
aWN5LCBpbmNsdWRpbmcgdGhlIHR5cGVzIG9mIHBlcnNvbmFsIGluZm9ybWF0aW9uIHdlIGNvbGxl
Y3QsIHByb2Nlc3MgYW5kIHNoYXJlLCBhbmQgdGhlIHJpZ2h0cyBhbmQgb3B0aW9ucyB5b3UgaGF2
ZSBpbiB0aGlzIHJlc3BlY3QsIHNlZSB3d3cuc2VtdGVjaC5jb20vbGVnYWwuCgotLQrgrq7grqPg
rr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpUbyB2aWV3IG91
ciBwcml2YWN5IHBvbGljeSwgaW5jbHVkaW5nIHRoZSB0eXBlcyBvZiBwZXJzb25hbCBpbmZvcm1h
dGlvbiB3ZSBjb2xsZWN0LCBwcm9jZXNzIGFuZCBzaGFyZSwgYW5kIHRoZSByaWdodHMgYW5kIG9w
dGlvbnMgeW91IGhhdmUgaW4gdGhpcyByZXNwZWN0LCBzZWUgd3d3LnNlbXRlY2guY29tL2xlZ2Fs
Lgo=


