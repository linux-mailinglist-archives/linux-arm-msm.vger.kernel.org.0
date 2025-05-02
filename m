Return-Path: <linux-arm-msm+bounces-56502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C9FAA72D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E8A13B2FEE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE92252905;
	Fri,  2 May 2025 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Cc7DKhCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2095.outbound.protection.outlook.com [40.92.23.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D59742049;
	Fri,  2 May 2025 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.23.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191116; cv=fail; b=DgQbdsYOoc0VnSKsyBCxZF4dgyg9j2FzYWDMgCGVBATeffrz9Ym77dOC4mqCNOS7zbdo9JokiKexK66hevzEVInuB+R8e5pdRbWTQgWfF962SouSW4pPD1eLBwWbYG2WVo76jglOqmHAV207PFm8ZSQ6+Uz1gxSbXINeTsJ2qUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191116; c=relaxed/simple;
	bh=+VsFbsFEyhyCF8wP6OvBwiRG2kG0hrPbs4SCSkG1JuQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YiL+Ax22CSTIq+ZBF9E/l2UGf7hqRvQLKadbtgmF40982popVO19on68K+3b76ohlX5XqAGf57WNyQeel8DIVJZrW0Pc1VlhtuS6TP9wU2CpwjHjTufDEaqqlNaUotjDr6V1RoKYqHxaz2rjdMNQQYuUiBoIbopxR2GlN7jPVeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Cc7DKhCs; arc=fail smtp.client-ip=40.92.23.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d32KZTVNyL5j6mD8rndiwAd8j55JpDJJDzhsErLjT/JGuFAvX/RmPAv8NF9uxpvGdQL7gehAv7tApG4xLEAk0im4B1by7jBJVn3gE4RImau35AeiwZMFKqnU9HTJAxJ49wtmmQmbJN+4Nin3nsF33VGXEPfBWQQYxXVljPWMVILtq6U8znWN2Zp2wdmvu0sICqAzc+MI9SxGGuBq/4UcSjWxhqCWc8S/YSug6rBZK6LCTV+LONt0ucj7JszP4XSNOCmcakIGw9RuWhkCu0oZENqjdj31I/ZV7c5SQtDDafDJW7BzKjM6uVT1/d5+TjdPHqx+6S5Lu8YFGTKrYbz7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2b0VgahZo5gNqlT2AaGOuQMjNynJjvdfCbSlgfFfOgY=;
 b=A55r65U5fWwiJgYWJRLtHSwPTH2aPmClUrYgg4VkhjteKQdXR6EvkTkwNqpSk468lfX5t5t24i0+IvYoqItOGDaauvCc0zgdIRParCW9EUAjghT2HmjPyht99RUwYNnB/bcPMp8/4aYkJoyDdtc46u9Bq9KDM51aY/HsMm1pw/vy9dL2LRBDtwTxqWWhILiSGLf8KjLv1o2esSTHs1jQxi2VCOFwpQO2obtjVGo/Ri7Z0EFhkO1rx71Mc6x7IUe0fhsuV0iw9V093JU9jMqP++zzRFz+86IglMqsxTYXmHlaphlLLnIk55CRQjmqUQv4ED3aCrRlnAge5nvy1UDxLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2b0VgahZo5gNqlT2AaGOuQMjNynJjvdfCbSlgfFfOgY=;
 b=Cc7DKhCsOM54t/iakfhUEGHNL1jtkrjCLbkKLV+Fmk7ZZk8WfKiOCQHf9zer3xZWtHplY3DeorTnBG+/AfDZJw1ffg6uz6uPtF9XVyGmrdRaQkoG8tu9ZBYLRUHFdGm/A2Zlby8yErR1CjVvZ/nNbTeuF3fqB5gf5QpxtEXl1Oms5aduxifDJvX40DiBAV666Zw8h0TgbCQiVsRNx3XGjxrIxPIqeBilyEU7egVyUW/0vkUWXgb0nS2tMBtvQAZi/vlZUFh+zvBVh4rdWzvPkVQWci7vFtpcsw2SziJeszaH3tpYp39elwYfcrwe4KguBI9I7I0tgx74veneLMj+Vg==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BL1PR19MB5770.namprd19.prod.outlook.com (2603:10b6:208:392::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 13:05:11 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 13:05:11 +0000
Message-ID:
 <DS7PR19MB88831E73F6787E04E0C43AB49D8D2@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Fri, 2 May 2025 17:04:59 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-3-27902c1c4071@outlook.com>
 <bd1ce180-1282-45f1-a893-5cc097eb6613@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <bd1ce180-1282-45f1-a893-5cc097eb6613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX1P273CA0003.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:21::8) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <c46873c7-0c3e-4760-b4c2-863bc1665023@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BL1PR19MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 2923797d-777a-41e0-b1fb-08dd8979f805
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBu6m38okHpoNWln7NSyvc1V4RV7IStopBCO0JxMIgByn8zCEN28paTNt8VLsI1npach7rlId+fRyxH5O6sh8Jz8YVVajFlF32qiOucV6PwUQ1H0BwGOfewpJwswPbhFCQ59HA8a0g6Kd6+JxDmzyo2gGsA492FQiS5zfnQPBb3uGXpYOLvmIudFdPgzqS79NwesOWlyAK00HSV+udhTbDvhs0q3gUcmKx5LeIiHHb4kt+1ujNqNh9GSH/lX7x+Im1qpsbsRQ9mDlPdSfqYI42GQ5hiUW0fC3OaXEe/W2f0Vg3HOSClXj5MSoHFYiuYNa1ibafIraNEAKv9J20lVyXA213fUu9TPMu4fz/j3VSjbKGcVyvuPCal8rxoFS8daqJNyzQAcYi1cJiSM3ORxgN0E9+y263bX5Q7UEymONJgV7OCVo8KHvbWrdOam358gzQirjq6WVtW12naovybBk83LMi0/1cWwPp0aPDkOqfk+EQi9mP/OP96bMDvzw4pTEUOyholG4x+b5/wELFxRbkPcrqdpfGrakPQ7SszqJ9dFzGarn1fFwKJn8qk7v2xLUA0TeCcIW+o3vunMrjnwURxV3XVmGQFEGvsyCOvA2J2dxa98Ddotpdt6oEhhEKLGImyT4BNNM57vgVC2nE+ltleyEA2KDl5fJ6wpw/5/WrzipmKpziUuxWDVPae/T53UZljK8nhwlIr6cBLkccxywv7kvoVIcoaJEWSwLNxkhnrh4gPZVJjopVVQKiy1UAayJpOX+oe05Yptmg1GmzMnU+V8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|7092599003|15080799006|8060799006|19110799003|6090799003|461199028|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U29vazNubVlnYUdPbmp5THNUYUc3dEF4MkFpMGJFVWsxK0FGenFzSjdjMmZI?=
 =?utf-8?B?Yk1IU2N2dWQxa2hRNEg3RVZPUUZNMzdtNUlTYUVZKzZBbVpBMFNPZWg4RC82?=
 =?utf-8?B?M0NZYWFudEtpamtsVXJMT3pIOUR1RW5uOHp1QVQ2eVkwL1ZsYnE0Q3VjR3hF?=
 =?utf-8?B?YlRRY0xHL25qOHllbHExUzM5WTZWNmNCNTBSOUpOcFpIOTdxR1ZyUFdiQlZ4?=
 =?utf-8?B?ZHVpL2dHZFhEajFkQnZNcTFVUWI0TzVMSU5ldkpDRnRhMWRseElSUGJpL0tI?=
 =?utf-8?B?NjhEc2VRM2hZV1grMXVkZmU5a0QvMEpQODFLc0xaaXEvUDZyUk4wOFJ0ZXhn?=
 =?utf-8?B?ZFZGaFpSank0NVVPSTU2dlN4RWNIZ3lvYUZyWU5zTWdwWWwyb0htSC93QUVo?=
 =?utf-8?B?T0FCN3d5bVlJSHlFQ1ZaK1Axcnd3NXc3SmlQUW9YR2xPajZjdEl6RmNIVEJQ?=
 =?utf-8?B?T0Zoai9uRkt3RTJQbytQSzgyU3dHSnNiUTI0cHl1WkRUeEZ1RnMybHlYMDRH?=
 =?utf-8?B?VzZOZnlseU8yN0hJYW00WDJaN2x0L0RDV3hBbXNvVmF4OThKZy9pMjIyWmFH?=
 =?utf-8?B?QWpYdFBKKzZDMlMrbjk0TURTZlN0Q2QvZHZTQVBsOVNJTUpGNEt6bDUzNWQr?=
 =?utf-8?B?cXNTUmZqYlBXU3ArU045YzlZVHB1MlpUSjdKQ05kejNCSDltR2pMNkozbkNn?=
 =?utf-8?B?OUxZNDdQYjZxbGRUcmVGK1ZBWFQwZE1hYno0SFExRWJZLzZwWCt6aFFDdng2?=
 =?utf-8?B?U293aytveGpKdWVzWXNRNHFPUFNUMXZoSkJSQUFxeC9Fc0xNaGJsWCs1bnFh?=
 =?utf-8?B?bjUzVnM1Tm1rcVRKL3h4LzlrU0hCa3pNczdWTHZpNDQ0MzA5Vm5HWUMvTU1V?=
 =?utf-8?B?ZGNSUlVlTVdMKzhvN0FiTGJUR2tiTXBMQ05CNmIzeENSNXdXYmIxUUZBdGNU?=
 =?utf-8?B?bkpLNE5lYXJteW1jU2tDdTkrOGRRVndxdzBSbmF3TjVMWDZxOFdpZncxVkpx?=
 =?utf-8?B?OEZIYmVsUkRGNHkwYm10Szkybms3TnRvbmFxOGZwSFRhM242ekxjWGJXUHN0?=
 =?utf-8?B?SWZkeE5IenFjMXJiQ2hxbk9xb2FyYldqeThLNzJyVUYvSUdNZGlxSll6aXpa?=
 =?utf-8?B?WnRtRzd2UzlJR3ZHcEJYM2I2Y0NWcWhiaCtmQS81SUNkV1dTZGFCcUxySXRC?=
 =?utf-8?B?S0UrQVlzdmJLbDRMaXdCRytLT2p0QUo5YkRLR0RSL2dhZnJTd1V5dWNYVDNU?=
 =?utf-8?B?VDA5akhsN2ltU0pOQ085RDVmSnFIVFNNeG5lRlhLU0Rib1diZG8xbFJzVTVn?=
 =?utf-8?B?ZWI2R0l6TkpiTEJuZ05obTcwSkRTeXVzSTNobjJ0VENBbitSaFZ3Zlg3Y3VN?=
 =?utf-8?B?aXlHZG5uOFdiVFBhL2xzTDdOR3cvaGFhdGNxTitiVnF2SEozMzRTOWpjUnJH?=
 =?utf-8?B?QXBiZ0YyK095RmZzN2Q5UlJKQ1BmdHdyUVppb1hmWkZCMFVubHRKNnIrSFNC?=
 =?utf-8?B?Ui9zQ1ZZUG5mMm1OOWlsRzNZUWJHZCtaaXJmTWlSb3hvZjBTQWpsK25hV2J5?=
 =?utf-8?Q?19P2VR0Ze/O2xRYoKDBJbh+Ek=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJNamZNR29iMSswUVVBMzFlNXZBT3FWQ3REZFY2QzFqM1o5cXdzRmhraVBo?=
 =?utf-8?B?VzBadi9GTVpKYjJ2bnIwa2hjWDZndnQwek5qeHNVcE9tUkZadHcvZW9UOGs0?=
 =?utf-8?B?ejVZWTBPRGJFM3djaUhzdDliaWpoYjJjUnN0eXo0VGhxc05KTTFUSnU0YlRD?=
 =?utf-8?B?VzB3OCsyS2FzMGJ0eTE5T3oyVDFZSUVDbE5DaXdoZnZRczdUeWVuOUlLNG5s?=
 =?utf-8?B?UTh6RTFXZmZQanpPZFcrNW82N0M5bis1aktTajlKZUc0OUlzTkdJSU84N2J4?=
 =?utf-8?B?dTN4TGZDNW5IMC9ZbkFtUm5ZMithZllobjVGYy9XQ2R4Q2JMaTRqMnpTTER3?=
 =?utf-8?B?SlJjNlJKeHk1ekFkeW1lNmJPWmdTeE44RU9jRStUTVhQeHlCY0duZzJPajR3?=
 =?utf-8?B?eTBCakc2WHdCTE5jZi9sYlFRUDdDOGdJMFUxWkdFa0NQQXRnZWhidUhOMUpa?=
 =?utf-8?B?ZkZnZlhZWDVYKzJxUUlNWlphNVdQWDQrZ1pnbXlQRGlFeUM4WDFQOFBvanAx?=
 =?utf-8?B?ZklvUXhSWHRyMWI5ZjRveklIczVGeTFvZmtVWTBkbmF4UVYxM3BtV253Y3Q5?=
 =?utf-8?B?ZkNkVlpuSXFGaExXMGZIUDVZaks4MzlHNmtEc1c0Y20yUlAzTmVEWDhBRVlX?=
 =?utf-8?B?NWc1dU5Mb0JoMXB0ekJVOGRyeFFwb3RHYzZIMFVEbWErZ2lZc3c1V2NJZEpL?=
 =?utf-8?B?VWU0eVFacGJBajlQRTE5N2Z6WEdCclZ2bDRoWXJaVTJGdlZvNWhGcDNPellF?=
 =?utf-8?B?bDJNb1FLTWxCamxOOXVCLzE4N0MrNmJJRDliWGdzczkydy9DVi95dGdFTThk?=
 =?utf-8?B?YzlmWVBlRTl6NVZuQi9qU1lGczBsZlVwZDJCQk5vSGpVUUYybzlMNVlseHVz?=
 =?utf-8?B?YitSQVZXVnRtSFpXVitXTUQ5UGczektPZVk4QjM1ckVoMUNyb2pMQWRlZVBm?=
 =?utf-8?B?NGUrblE5SmR5eEliZFBlYll5cmJGSEJldlJxVXd3RlRnT3huckt4YzJDaklp?=
 =?utf-8?B?L3NmVjIwWFdaOFpkZDhjT3poRUNUcTFrQVJydVpWMEErV2hNU0JKeVNJbnBB?=
 =?utf-8?B?cmcyemdqcDRFcjhmNSt5RUFvaGduYktPa05CbUVaU1hkM2tUbW5UWG9Uankv?=
 =?utf-8?B?OGF3eEFadFk1a3hoTTc1bkFFU1Z5TFMyUTQ5MENWbnpoZ1lJWlAxVFAyanV2?=
 =?utf-8?B?UkhpNWRDQnkwRHZJY3U0dWkyN25ueVZpN3R2a1paOExscCtVWlFORlRkY3Vy?=
 =?utf-8?B?d0JvVG5lWU01dWxUamNsWElTRk1uZnVQQjU1Nlc1UlBydC9WcS9MYXhzZzA3?=
 =?utf-8?B?dG5MTHBWTzI3UHYzeEJMSEtWK0tiNEFKNXM0clVkNUl4UGRyUzEzS2pwRXF5?=
 =?utf-8?B?M0ZzVDNQaDZET1F5aUxRdnE3U0ROZnlMWVdPaG1GVjJmRHFIQ2ZRS2dNdjRE?=
 =?utf-8?B?UU1qaGZFS2psMEEycjlkSGs0NERPV3pCcUEzaWlXMFdSZnMvU3FvR1MvbWwz?=
 =?utf-8?B?Uis3QjZkMzBhWDRSNW9Ya3ZGTTZ0ckVNc0Q4c0pKT3JxUDh1Tkh5MUwrR1g5?=
 =?utf-8?B?Z2lDdHdqaXljcm1QemlIcUQxWit4OHlvZkdQdjZ2aVdQcFhERkVBTWdpY2c5?=
 =?utf-8?B?VFR0MGhlU3NCaU9NVVo0ejFYd2tzMGhuQnlZSllnOGdKcTh2eURGWExQUm9z?=
 =?utf-8?Q?gRkju/jscslpUKOfieIv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2923797d-777a-41e0-b1fb-08dd8979f805
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 13:05:11.0199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5770



On 5/2/25 14:38, Konrad Dybcio wrote:
> On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The CMN PLL in IPQ5018 SoC supplies fixed clocks to XO, sleep, and the
>> ethernet block. The CMN PLL to the ethernet block must be enabled first
>> by setting a specific register in the TCSR area set in the device tree.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> [...]
> 
>> +static inline int ipq_cmn_pll_eth_enable(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	unsigned int cmn_pll_offset;
>> +	struct regmap *tcsr;
>> +	int ret;
>> +
>> +	tcsr = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,cmn-pll-eth-enable",
>> +						    1, &cmn_pll_offset);
> 
> So we have syscon_regmap_lookup_by_phandle_args() and
> syscon_regmap_lookup_by_phandle_optional(), but we could also
> use a syscon_regmap_lookup_by_phandle_args_optional() - could
> you add that in drivers/mfd/syscon.c?

Yeah, sounds like a good plan. This was basically doing the same but it 
would be better to add it to the syscon driver.

> 
>> +	if (IS_ERR(tcsr)) {
>> +		ret = PTR_ERR(tcsr);
>> +		/*
>> +		 * continue if -ENODEV is returned as not all IPQ SoCs
>> +		 * need to enable CMN PLL. If it's another error, return it.
>> +		 */
>> +		if (ret == -ENODEV)
>> +			tcsr = NULL;
>> +		else
>> +			return ret;
>> +	}
>> +
>> +	if (tcsr) {
>> +		ret = regmap_update_bits(tcsr, cmn_pll_offset + TCSR_CMN_PLL_ETH,
> 
> I think it's better to just pass the exact register that we need,
> instead of some loosely defined subregion - especially given the
> structure likely will change across platforms

Will do.

> 
>> +					 TCSR_CMN_PLL_ETH_ENABLE, TCSR_CMN_PLL_ETH_ENABLE);
> 
> regmap_set_bits()

Will do.

> 
>> +		if (ret)
>> +			return ret;
> 
> You can initialize ret to 0 and return ret below, unconditionally
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	int ret;
>>   
>> +	ret = ipq_cmn_pll_eth_enable(pdev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Fail to enable CMN PLL to ethernet");
> 
> Fail*ed*

Will fix the spelling.

> 
> Konrad

Thanks,
George

