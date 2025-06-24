Return-Path: <linux-arm-msm+bounces-62233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1439DAE6D15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 18:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7701637F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 16:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA562E3372;
	Tue, 24 Jun 2025 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="EYZYpCw2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="K5rPqnt4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta28.messagelabs.com (mail1.bemta28.messagelabs.com [67.219.250.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286F2E6118;
	Tue, 24 Jun 2025 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.250.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784243; cv=fail; b=Ku7Z32l7Z7DCjdHZPHFNUvrNr/zhnoJs2xTc072MogTYIsMx1x5JomFwbQqEgjNDuTpqGeAdGUAhashB3P6l4Er/Q3dzy+obd3DXtpNfOk2l1tOK+U714zRKuo50/mjy94UIbvMliAQL9FSOv8unvJw2rTErJjlMjgnxMInFjSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784243; c=relaxed/simple;
	bh=TolZh8jA4RGBGmo8uBAOMDd4ExuVb66TJIKXfIYxlYI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C1DbWmH8dnIunHfVYPrWMYbUjmBbHsN+A7A3W3Ifp7PQ/e7mRKGXnULZ3Qtjhw8QuOu0W/HUZaepn2KTMtr3jsMD+KiZ/VHUeP+arwHBOzu7JuifWtOESUVlDDQZTed4iXSNzVTy8LI8Ji0VDsoWlaqxoXT2z0oSupS167OoN4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=EYZYpCw2; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=K5rPqnt4 reason="signature verification failed"; arc=fail smtp.client-ip=67.219.250.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1750784239; i=@semtech.com;
	bh=TolZh8jA4RGBGmo8uBAOMDd4ExuVb66TJIKXfIYxlYI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EYZYpCw2Q9PlmX2p5DwHT0D/nx8VfHtPWmL7mN6fxBrEJKXgcuyLTgiMM3GFPb9Zf
	 qcVF5sQdJmjXcsrl5DMQeJfS9GicTtTCgouX3IvU3juMK6Uty62PrRpM8uTpUF/Zqw
	 smkELiLbM7Rr9D9XlXloPq6ahq1jSnWkjilHcFfTRqe7L1xOzhH8qwjfTOFA6IF8hw
	 yBaoPbUz5k6gfdt87K3OMsoOMQKxnU1PifNl19tZ4cU8DiVlOzOVJApBg3Y1cieIx6
	 7re86YwEgnpGTODHUBYTY8Vp8SZ1H92kN5TjZw9TbWcEJUnLx3aQ8QNEoj3W4cBk/O
	 LjGGTLR+chzIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTf0wTZxjHeXvt9WAcOUqR1zIgbeLiiFTYop4
  mRBY3Pf9QYcumIRI84KDVtnS9IsVFBJk6hgwliMj40Vg0DDRsJUzqGCKwhB+ZOiY/wug6fkwQ
  BqOAdglbWa+Huv33ed7v932e712eF0MkBWIZxpiMjEFHaxSon3DziaRjUfMjiaroujUZWXt1G
  zlnu4GS9Tnk5Xs/ismf71ahZMdiAyDtnxaKyGLnVyjZ1RFBllimEPLJT7NCstl6BSEX3FWCOJ
  yy1JeJqN8mRxGq5tYnlK3SLqasDYUoNTbUhlILDx6IqZnma4C63JZLLVvD4/0SRWpdSqbpmEg
  1aH9b744wfd1YCfJAT8TnwA8DxE0EtgyNi/jCIoKfOcyAL5oBPF+V7yl8MSFxB4EVPdmcICHM
  Ajjb+gzlCweA7VN9Ys6FEnJ4bqVfwAlS4jyARRec3l4IMSiEVst1lHMFETlw2j2IcCwlTkHHv
  Hmdd8E7rnqUn7cJFjhsIo5xIgneH7MJOJYQJrhSUuqd5kschI0tj7wMiA3Q1XfL60GIEDg6Ve
  tlSBCwru0hwnMwfDrpFvH+LNj/dF7In4fBgdoiwPNu+OXqzDofgEvVlnUOhw3F4+v+CFh+/U8
  xz4eh+4tOMfeRkPglCA63nBXxxRMAS5fa1m9Ew5rn3SjPI1J4e82TDvMkfRM23d16CWyp/E/u
  ylcKfyyHZUXj4krvrwiEvdemhGYgbADbWMZwkjFExWxXphjUGSqjllZrlPSpKFqZxUZlM6wxR
  pmRqlcyLKtkc7SpmjSljjFagWcf/RbJ6lZwsbdgayfYiAkUwbjDkqiSBKRkpuWoaFaVbMjSMG
  wneB3DFBDf71lcSaCByWBM6WqNZ6tfyBDzV0jxbq1Hxlk9rWXVGbzUB6Iw1/3e7xGJUJepY2Q
  hOBj2mAjOpMrSvWzx4m0MgDBZEA58fHwk/nrGoFUb/6/PghAMKILwQq6Lv1pnfDlp1hNC4AnR
  s3SEC2GkX0myPMHe5A8z80fteyerS6jU7RumE8I1YRO26gHre+gFCpd+59hnjsxVZX28m5mpk
  AdOb+kIX5Ttn6PzdqZ/81rM32M/7DoxUvb+fPwB+1vf7nNi+oU41wf/6B5G+/okPCdXY9diy3
  XS43/VRYcu6bucIT3Gd0JDLh49shIcW/Ho19BzBQltLvnytN2WrLUOXllMa8mtCcrYcfKMtcO
  06fHx4TjZaXrc3HWwfc/tPbUJWOOhodOzI5ceZ+P+H/m0Y38Un+1+lj5RYr1xZqcLDfh95Y3o
  d4+uOuMVteFxYEfOcum0QF7e1FRoDhg6VDzX3hTXstE90++sjsxPr7mn07feDParm0hSCFkVH
  ROJGFj6X01gHM6WBAAA
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-15.tower-945.messagelabs.com!1750784236!381834!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 27414 invoked from network); 24 Jun 2025 16:57:17 -0000
Received: from mail-dm6nam10on2096.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) (40.107.93.96)
  by server-15.tower-945.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2025 16:57:17 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUmjtAaLB+Ta4X2SitPfNiM4gThlMRPkBW0MQ83QiSGTMwYl7hV3NdcDegbgTlTAYH0PLZrUa4gDOvbCQmc0cMdt7c9pj+u+rZYcD+ck5JXtXN/GyPhEqdQhTCZmHE5saTyZYv7vKz5hoq1/zT2TADTEXKVOvH8jtKa2Xy2Mw6/xtWTUNvoqfRp3YT5JQQL6GQIFEJrnGrpmD5Jv3O4QNg/NR4T0JaDGShj6PY9ElE+9pZojJBy0L/lWWLJCQM8+RFQybkzr+tTDWT740xz94NbM4pst8nS0Hq7VqlgQ8pIHEx4orXMxQc3GOe6qI1HW1Vi0tLQvOzKsCFlF76RWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QnSOaSe9OvEv3NwFh7VN8k0qzg/ZGxw3pJ34FIGnXU=;
 b=Q0FEpxbAfNOeAo4UuLwLdpUxQPtbY8izCycXKTX0e7cdhmkqwjZ3SdhFoW1v4ZC1bjmZ7Lqtv/Tvg2/V1nG/HQUN3WwcaTmnzUKHtMH1V5D7fhDZqYGxk1abOXvCCgYUZH95fsBE4BSDIfS/FDTQMFrA6RSjyhJXWHkcI8g7Z1jIrtP3G3uSEv0WEMC6Cxye7aoc6JBukXdCzsjSdVZJBKMee6bquAMipZhEl7mcZ0yQ+/45EQbL3XATnIEHEubDS614IpEJZEQ9XBKAOQRhlpqSC2N7PTN6kT2xXgIh0JgB/Cr2ZMYpBVvLNh4J9jaBj38IcIG8OdXlv4XkShG2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=semtech.com; dmarc=pass action=none header.from=semtech.com;
 dkim=pass header.d=semtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QnSOaSe9OvEv3NwFh7VN8k0qzg/ZGxw3pJ34FIGnXU=;
 b=K5rPqnt4PVxwd8a1lfFPx6vCUIK2tLv0gu2uvVUyDL643cT3j6FDyteCqFhiQdiTgUajtShuC8980Rt7JIbMi9tIgoKBDxfSCMCdW9z/txK69UEer98SrgTcBnrDzhYx44pTne0umeZzVYP2EbnvphGFwIcVBNKdZNGKJtx+9C8=
Received: from CY5PR20MB4867.namprd20.prod.outlook.com (2603:10b6:930:21::18)
 by SJ2PR20MB6330.namprd20.prod.outlook.com (2603:10b6:a03:502::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 24 Jun
 2025 16:57:11 +0000
Received: from CY5PR20MB4867.namprd20.prod.outlook.com
 ([fe80::1107:de62:e17d:a1de]) by CY5PR20MB4867.namprd20.prod.outlook.com
 ([fe80::1107:de62:e17d:a1de%4]) with mapi id 15.20.8857.019; Tue, 24 Jun 2025
 16:57:10 +0000
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
Thread-Index: AQHbz/pRmk2bEjbGOUCvCkmNwzHUFbQHNAyAgAt9T/A=
Date: Tue, 24 Jun 2025 16:57:10 +0000
Message-ID:
 <CY5PR20MB4867E63E4B5107728904826EC678A@CY5PR20MB4867.namprd20.prod.outlook.com>
References: <20250528175943.12739-1-zxue@semtech.com>
 <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
In-Reply-To: <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR20MB4867:EE_|SJ2PR20MB6330:EE_
x-ms-office365-filtering-correlation-id: ab90f044-3b9c-46f0-4a6d-08ddb3402954
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TnBIQlBUMXRIaVk3L3pKZzhaVHMwN3dyMUpvZXg1a1FPb216cWpaekFXKzBD?=
 =?utf-8?B?b2dDazNGUHlJd2lucVdGSjJkbGx0NFpMNTh1UnBQc01rY3AyazgzVk9UWnlt?=
 =?utf-8?B?M2dscjVuNnovNnJXd21BU25JeUJOeTlBZndHOWRxYkgvb2hOWEFpNVV3VmRw?=
 =?utf-8?B?eXUzRk5oWThiU3ZwUmJobCswSEZEcUxvY3BBSE51bVhEWHI1bithd011ZXVi?=
 =?utf-8?B?S2NNRCs1R1hIb2t0bmR6VlNjU0d2TzhMOWxMY3BObHU4YjdXNXN0UjVGTTBi?=
 =?utf-8?B?cEN5SllleGJBOUJNdDlyM1NxQlZ4ZFlDZFM5cG1EMGRMZXJrNFNJWE1tRFVW?=
 =?utf-8?B?dTFVQjBlZ1hhRHU0UFBRL0ordnBwRjZZQS9hZjZtQldibjRFNVdyOC81dU5N?=
 =?utf-8?B?QnZUS1U0YktoNWtLajdMSmJhYy9WUWtlbmZ5UGhobzhvbi9ML1JGTWplNlFD?=
 =?utf-8?B?L1lPMWdIQ1FGWVJjN1dSdUdJRGE0UDJzaE5NNWYxS3FDTkpaeVhkNnExcldU?=
 =?utf-8?B?QUtDN2NwZVoyamJVNDRVT0NvSmZWbkZWMDNzRy9jRGVycys4WmhFbEZXdTIr?=
 =?utf-8?B?cTNYdVVxRWg3THF0M05jM0NBT0czU3dxQjFzRHNYaWFETUR2dEY5dUU5em84?=
 =?utf-8?B?V2d1aDgyQmh2bzRQaS8wRElVd3FrZ2FEekRScE9tRFd3VW1tQ0VNRk9MM21k?=
 =?utf-8?B?YmM1MDFCemhWempzWGxtOVVGNjBRblR1ZlJ1RVBDRUErWUh2SjZ6OGV5OTVQ?=
 =?utf-8?B?S1dzUnNaSlJzMzlFQ0JaSitSQU5zb1VHVVJwTXpzSC96OHVVdFMrV0FKc3Jw?=
 =?utf-8?B?bWtUYzFXRUl0TmQ4V0RSRVc2bVp3S241VGdlMlpqczRTdHNwODIwNnM0Sk95?=
 =?utf-8?B?V3lIWmxVY2YzdUtFN0ExVGNzYldYYUlsb1ZpTk5tR2ZkcUx2SE84N2gvNzY4?=
 =?utf-8?B?Uy91RGJ1eTAydGljaTFVVThqOTZzNXJBY28wZFZxTHRvTEM4KzdHSndWdEgx?=
 =?utf-8?B?RUE4MmVuZENEcUpNenFhNnMwNlBWMmZBdSt5YnBMVm9qTENVekhrdjRIRHcw?=
 =?utf-8?B?bjFIM1NmckEvM0VxcnhUQXpCK2thMnhwK3VwbkJwTlN2RzNOdjQ1MEhoNjNv?=
 =?utf-8?B?Tk9odDhmZXVSd3o0U2FSVk9WZTlxcFpaWUxJQXF3dFhoQWJPaUJ2YkNBUXRI?=
 =?utf-8?B?UktHQVFWdjhsb3dtMW1xcEtqbEQ5ckZmNG5vbVBjb1c0ajBRSVpIeFJudElL?=
 =?utf-8?B?S01wN2NJSGZ0WElMSjlSZTZNR1VIandOa09mRzdaMnl2d1FxVEZxdExPY0Jj?=
 =?utf-8?B?b1dqYUU2eE85bTY1WkRMNmZIU2lPMHBmNzAyUzdUM081TkM1YURYZWMxQno1?=
 =?utf-8?B?eDVHdy9NL2RMV0NYUEl5UnlFeHB1T2V6MEdVbk05bWkrdWRLZGNJN21ZWEhi?=
 =?utf-8?B?QnZmS3ZCbmZWTkVSUHQ1RUIyeXlDQmRqdkRxRXhERktHd1lsSys3a1FmNHhE?=
 =?utf-8?B?R2lpZCtqeWRuZGN5OG0reFN4VS9NU1czYndPdy9xN3laUWI0ZEVYMTAwUmpQ?=
 =?utf-8?B?SjhQYVZZa1UyYXdnUDByeGVTRlZueUYvaTR3Z0ZlTVExTk1vRFhlT3Vvcjlr?=
 =?utf-8?B?V1ZpMjBZTFNBSHFnYjR4WUZ5SGRDbjRzRCs1UFAwU3o1aS9RTFhWd2ltUjVZ?=
 =?utf-8?B?ZFRBM0h1Qk1CdXVQZU1kd1NBN1BMVTNOQjB2RUk5am9RMitMVzVhQ09YeFFT?=
 =?utf-8?B?Znh1NXAvQnhoc1R4UldwbWZTUUhsZlRFa1ZNcU9PSWVkdyt3SENObnhtcExD?=
 =?utf-8?B?OGdaR05LdjFoc2lhUUN1MXZIcWpCQ2RNMTRkUTQ3UUdjYXpaNGppemo2Y2tM?=
 =?utf-8?B?MHEzblVyV2xERDB4c1N5UUllT3I5K0tMc3NDT1dCaEpXTkdkWU9mVjFrQnVJ?=
 =?utf-8?B?UUQwRmNRbTNaOE5iTThrT2VycFYyMnIzTGdrZ2ZnanZwbU9qYkNqMXBNNmtR?=
 =?utf-8?Q?phfxkO6nW2SmT0c2OisRRot0e55TUY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR20MB4867.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cEhLRHVQOUM5K0V4dGJ4OTdqemZ6eEh2TGN5TkFuTlIrcUhJVytmYmowVXRl?=
 =?utf-8?B?NFl6VFFCQVpPcXFMMUxMZjhsYkw5T1BRZXpVZEtMNDZkNXVadngxd2F1VkFy?=
 =?utf-8?B?Szd1NkZlWHUzOW1NQStiMCtsRXBxQ0xjS3h0UkVPWENxblpkZkl1bE15eUxi?=
 =?utf-8?B?L2VRV1JqUVlTVlBaQXc3b2pkRXA4Q0p1MDkyUHBmL1ZiUUsyOXh5djhNMmVa?=
 =?utf-8?B?Zm96dUs2M2JWSjRQQjkwV3JFTEZrY1RNUHNoQUxiWTdqUnY1ZWt0dEJwcUg5?=
 =?utf-8?B?NklUdmh6aFF6UnBPWVhWZm5ETnIrcW02VjZvUzNIcTBZQjRScEs3UFZYOVI1?=
 =?utf-8?B?amJhYXpIMVliaU94RE92NzlxS0NIdmJHYWZpTVRIcG1QcENiRHQrOUJGUXRP?=
 =?utf-8?B?eDZ5OUlUZ3o5N3dObHZxSU5ZSHdyeE84K0dYcnBucUxSb3I3L0pCOHpGOERZ?=
 =?utf-8?B?S3JWZVh2OFhKeWFaVzdGeGZUaXBlYWFpdmMzdWYrRE1SREhNV29sMGhjTnBy?=
 =?utf-8?B?R0JkSEExNENKSmhHZ1IzTktuYTF6ZjFGWTFHcncrU1BpTUFvSXY0bE16RWJq?=
 =?utf-8?B?M21aQ3FiNlIrVTY0YlJBK0JQeTVSZytjeVpqcTZRZFY2YTh2RStzaVQrMU92?=
 =?utf-8?B?SUdNUllqN1V6ZXVUcjBneGEzN0taRjVwd3VabCtKbERkRmVBdlg1K0ovMUxC?=
 =?utf-8?B?dUNGaGR6Ri91MWxKZHl2dGtyL0tpRUtOT0lkT1c4aUhUeDFqeVkrbHU1YjNW?=
 =?utf-8?B?cXlwVFp3WE1QVzA5Mm5nNnpDd3hDeFBremZSeHN3eHZTTmxEWmtUZ0MvNVgz?=
 =?utf-8?B?RjkvbnZYb1QzK2FBTGtpUVl0Q3NLWktDTUZ3Z2toTWdwdWF6V0ZkVDlsQ3Na?=
 =?utf-8?B?TnZ4Ymc2UUNlUy9SeHNUY1R5MUU1VGtKNnZQOE5OU2M4ckdBcy9WRmhRM0ZV?=
 =?utf-8?B?SWFOTVdZUkFiakdqTWhDKzdKN2FsYnBpTjdNeWpHdXA0LzlUY0FyTHVSa2xE?=
 =?utf-8?B?M0RoVlRkaU9JS1ZCNElUSmpzOVBpampEL3ZCK2FlV2JNbysxTyt5RFA2Z3Zt?=
 =?utf-8?B?QTU0RGc5VWdVRFkzWC9sNSt6VFhaMGhDZ1ZYNDNRbEdLZndXOXF0YUNyMkUz?=
 =?utf-8?B?cGUrSWRnOVU1NEh3RWVLL2JicytHV1R3azVrY2RKZnBNcDQ5RE5NUWw0YW9y?=
 =?utf-8?B?cHZSdVpnRnpvMlkxbU1TZHhBVUZRdWtDRS8wNlFTYVh1R1FyQWJIYkhaemNm?=
 =?utf-8?B?clJ2WURpRCtXSFJ6RDIwOWlUUzd1ZzBaZ3U0T0d1dlJ4WnFQdUJDcDJIYWV3?=
 =?utf-8?B?bGptaHZRSEVaTGZGVGtEM2NrbTlmOUR1SUlVcmFEb21YUE40ZzJmSnViRFRR?=
 =?utf-8?B?YXBuRDNQOEw2K3hia0VNOWYvMzBENThrVHNyR1Jwem5TOUVsMXJmUkxibjda?=
 =?utf-8?B?MUhJUTEvNTJIWVlWMERDL0FaSDVnelY0YUFkV3pQYVFiVG9zbkh0bWVONUUz?=
 =?utf-8?B?Rkw1Z0NDWUlOc1MxWnBpcTliK3ZLV2FKTmEwS25YdlRzS2U3QWQ0RG9aOTUv?=
 =?utf-8?B?UjRmQW1tRmowV2tiNHM5cFdUUXFJbUIzOEM4bjRtY280NTBDTTRyVVpNUDd1?=
 =?utf-8?B?R2VuMStwUXVtV2J1bEZkSGNuTmpaR05XTW4yV3QzSWk0V3lieUFLMlhvSzlJ?=
 =?utf-8?B?eFAzNjc1VVJUUzNhN050SW12cmgvNEZuWXNzYittWXNTbG5iS3ZQc1R0eHJx?=
 =?utf-8?B?MHFPMkJOYmZ3d0l1MFBtOE9pbDFYTmZsTWFHRlk4RldGMFpIbDc4MkFpbmxC?=
 =?utf-8?B?VHZwTG9NdnRZWU5UWWk1ZnE4MTdwTDk4WmwzVXFHV200Z1lqZDBJZjFHaEhZ?=
 =?utf-8?B?aTBzc0YybG9YOUFOYlMxQk5FZHVCZzJ5SnkyU01EM1ZzM0E2N1FXUExJY2wy?=
 =?utf-8?B?Q1RQdXBrbG1pL05USjFyQUJ0cGFxMlU3a0dBZkxQallodVBTcTQ0STIrR05m?=
 =?utf-8?B?ck1kZGRGMkRtenBKdEZPOVIwcWMxSDFpVlB4bFlQV2ZwcEZiS3ZNTzFUVS9h?=
 =?utf-8?B?dkxsbHA4TXlhZjJOdDlqL3VIL0NPeFoyNHRnSVRCaFJwdHFraTZMTE4zRDZm?=
 =?utf-8?Q?ZCZg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ab90f044-3b9c-46f0-4a6d-08ddb3402954
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 16:57:10.6373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZB7X9fiwJzK5yVA2k08NkFopRvZjBeYsZv6510Xq53IhEK+QE8+atsgQuK0SV1f/aNNEQUNzmC2ms+wo1NW09w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB6330

SGkgTWFuaSBhbmQgQWxla3NhbmRlciwgCgpJIG1heSBjb2xsZWN0IHRoZSBsb2dzIGlmIHJlcXVp
cmVkLiBPciB3ZSBjYW4gc2hpcCBhbiBFTTkxIG1vZHVsZSBmb3IgeW91IHRvIHZhbGlkYXRlPwoK
VGhhbmtzLCAKCkFkYW0KCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IE1hbml2YW5u
YW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiAKU2VudDogSnVuZSAxNywgMjAyNSAyOjI3
IEFNClRvOiBBZGFtIFh1ZSA8enh1ZUBzZW10ZWNoLmNvbT47IFRob21hcyBQZXJyb3QgPHRob21h
cy5wZXJyb3RAYm9vdGxpbi5jb20+OyBBbGVrc2FuZGVyIE1vcmdhZG8gPGFsZWtzYW5kZXJAYWxl
a3NhbmRlci5lcz4KQ2M6IG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnOyBzbGFya194
aWFvQDE2My5jb207IGpvaGFuK2xpbmFyb0BrZXJuZWwub3JnOyBxdWljX3ZwZXJuYW1pQHF1aWNp
bmMuY29tOyB0Z2x4QGxpbnV0cm9uaXguZGU7IGZhYmlvLnBvcmNlZGRhQGdtYWlsLmNvbTsgcXVp
Y19tc2Fya2FyQHF1aWNpbmMuY29tOyBtaGlAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tbXNt
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgSXVsaWFuIE1v
Y2FudSA8aW1vY2FudUBzZW10ZWNoLmNvbT4KU3ViamVjdDogUmU6IFtQQVRDSCB2MV0gYnVzOiBt
aGk6IGhvc3Q6IHBjaV9nZW5lcmljOiBBZGQgc3VwcG9ydCBmb3IgRU05Mjl4IGFuZCBzZXQgTVJV
IHRvIDMyNzY4IGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UuCgpDYXV0aW9uOiBUaGlzIGVtYWlsIG9y
aWdpbmF0ZWQgb3V0c2lkZSBvZiBTZW10ZWNoLgoKCk9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDEw
OjU5OjQzQU0gLTA3MDAsIEFkYW0gWHVlIHdyb3RlOgoKKyBUaG9tYXMgYW5kIEFsZWtzYW5kZXIg
KGZvciBFTTkxOVggcmVsYXRlZCBxdWVzdGlvbikKCj4gQWRkIE1ISSBjb250cm9sbGVyIGNvbmZp
ZyBmb3IgRU05Mjl4LiBJdCB1c2VzIHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24gCj4gYXMgRU05MTl4
LiBBbHNvIHNldCB0aGUgTVJVIHRvIDMyNzY4IHRvIGltcHJvdmUgZG93bmxpbmsgdGhyb3VnaHB1
dC4KPgoKVGhpcyBhbHNvIGFmZmVjdHMgdGhlIEVNOTE5WCBtb2RlbS4gU28gSSB3YW50IGVpdGhl
ciBUaG9tYXMgb3IgQWxla3NhbmRlciB0byBjb25maXJtIHRoYXQgaXQgZG9lc24ndCBjYXVzZSBh
bnkgcmVncmVzc2lvbi4KClJlc3QgbG9va3MgZ29vZCB0byBtZS4KCi0gTWFuaQoKPiAwMjowMC4w
IFVuYXNzaWduZWQgY2xhc3MgW2ZmMDBdOiBRdWFsY29tbSBUZWNobm9sb2dpZXMsIEluYyBEZXZp
Y2UgMDMwOAo+ICAgICAgIFN1YnN5c3RlbTogRGV2aWNlIDE4ZDc6MDMwMQo+Cj4gU2lnbmVkLW9m
Zi1ieTogQWRhbSBYdWUgPHp4dWVAc2VtdGVjaC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYnVzL21o
aS9ob3N0L3BjaV9nZW5lcmljLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmlj
LmMgCj4gYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4gaW5kZXggMDNhYTg4
Nzk1MjA5Li45YmY4ZTc5OTE3NDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3Qv
cGNpX2dlbmVyaWMuYwo+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMK
PiBAQCAtNjk1LDYgKzY5NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5m
byBtaGlfc2llcnJhX2VtOTE5eF9pbmZvID0gewo+ICAgICAgIC5jb25maWcgPSAmbW9kZW1fc2ll
cnJhX2VtOTE5eF9jb25maWcsCj4gICAgICAgLmJhcl9udW0gPSBNSElfUENJX0RFRkFVTFRfQkFS
X05VTSwKPiAgICAgICAuZG1hX2RhdGFfd2lkdGggPSAzMiwKPiArICAgICAubXJ1X2RlZmF1bHQg
PSAzMjc2OCwKPiAgICAgICAuc2lkZWJhbmRfd2FrZSA9IGZhbHNlLAo+ICB9Owo+Cj4gQEAgLTgx
Myw2ICs4MTQsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgbWhpX3BjaV9p
ZF90YWJsZVtdID0gewo+ICAgICAgIC8qIEVNOTE5eCAoc2R4NTUpLCB1c2UgdGhlIHNhbWUgdmlk
OnBpZCBhcyBxY29tLXNkeDU1bSAqLwo+ICAgICAgIHsgUENJX0RFVklDRV9TVUIoUENJX1ZFTkRP
Ul9JRF9RQ09NLCAweDAzMDYsIDB4MThkNywgMHgwMjAwKSwKPiAgICAgICAgICAgICAgIC5kcml2
ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9zaWVycmFfZW05MTl4X2luZm8gCj4gfSwK
PiArICAgICAvKiBFTTkyOXggKHNkeDY1KSwgdXNlIHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24gYXMg
RU05MTl4ICovCj4gKyAgICAgeyBQQ0lfREVWSUNFX1NVQihQQ0lfVkVORE9SX0lEX1FDT00sIDB4
MDMwOCwgMHgxOGQ3LCAweDAzMDEpLAo+ICsgICAgICAgICAgICAgLmRyaXZlcl9kYXRhID0gKGtl
cm5lbF91bG9uZ190KSAmbWhpX3NpZXJyYV9lbTkxOXhfaW5mbyAKPiArIH0sCj4gICAgICAgLyog
VGVsaXQgRk45ODAgaGFyZHdhcmUgcmV2aXNpb24gdjEgKi8KPiAgICAgICB7IFBDSV9ERVZJQ0Vf
U1VCKFBDSV9WRU5ET1JfSURfUUNPTSwgMHgwMzA2LCAweDFDNUQsIDB4MjAwMCksCj4gICAgICAg
ICAgICAgICAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpIAo+ICZtaGlfdGVsaXRfZm45
ODBfaHdfdjFfaW5mbyB9LAo+IC0tCj4gMi40NS4yCj4KPgo+IFRvIHZpZXcgb3VyIHByaXZhY3kg
cG9saWN5LCBpbmNsdWRpbmcgdGhlIHR5cGVzIG9mIHBlcnNvbmFsIGluZm9ybWF0aW9uIHdlIGNv
bGxlY3QsIHByb2Nlc3MgYW5kIHNoYXJlLCBhbmQgdGhlIHJpZ2h0cyBhbmQgb3B0aW9ucyB5b3Ug
aGF2ZSBpbiB0aGlzIHJlc3BlY3QsIHNlZSB3d3cuc2VtdGVjaC5jb20vbGVnYWwuCgotLQrgrq7g
rqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpUbyB2aWV3
IG91ciBwcml2YWN5IHBvbGljeSwgaW5jbHVkaW5nIHRoZSB0eXBlcyBvZiBwZXJzb25hbCBpbmZv
cm1hdGlvbiB3ZSBjb2xsZWN0LCBwcm9jZXNzIGFuZCBzaGFyZSwgYW5kIHRoZSByaWdodHMgYW5k
IG9wdGlvbnMgeW91IGhhdmUgaW4gdGhpcyByZXNwZWN0LCBzZWUgd3d3LnNlbXRlY2guY29tL2xl
Z2FsLgo=


