Return-Path: <linux-arm-msm+bounces-34905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 054399A38DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 872771F2150B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14F018E763;
	Fri, 18 Oct 2024 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eCUKCO9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF61718E742;
	Fri, 18 Oct 2024 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240932; cv=fail; b=tbyRfgb9q31xLMu5tWmoU08Ft/HL0qGsl04I9GeYd3aR4a2mHgqoR8WCzye4QVDTDZ9FeW1FxjmiE5uHjh0Svv519/c3+tYXPfSP+uHSPzvdCnyrzrnTUjYtKDfG1967XHFsnL/fS4Sq70HnG71cJFArSaGI/jLPiC+z2dJZ3iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240932; c=relaxed/simple;
	bh=1djrh/9ANdwT91IfmE7CBDT9tGdYDFrZjaCYIld/tXU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MIgxu8mX8+XRCsFqyqLzyugRuM9PuWA5ETlecs5MCxSlgzMMbHFh0NO3LgMLxF2zTx7JVDlZzrK7Ln4LKRJYVdX+4o+we7ip+d2UI3zZj8tS53NLhLpkECoturjCKUzEWeQH+3FRCayo8cPqjzNDBtKDgkDd6hsqu0xC40PkqXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eCUKCO9F; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5EalO029405;
	Fri, 18 Oct 2024 08:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asdJ5nGenRwxrRIAbhl5L93Go38Wy4VKuNm63noNFKg=; b=eCUKCO9Fh0+bhwi8
	JSq8Jg+XQdnGqEzADHimJcyr8qbG3LsH2Rsonh7x2GBpmEkVmuxldmfbJ3htLSFD
	2noy2xGJ4ypEBkAWb0cMhryMlKuFHKuhJWB9SHDOrFU9a1BdTkBid80sTDZhJ05z
	TNFRE4keS6GZ0M95T3cudVZGwIjWNUetp1ar6PEyznYl8eKI3eiKIYZjsGx3Xvcv
	PNE1vbPaPUgsxzZ4mrHbsDdaV424xU9+iEwYmEhc/YBb0lFrY9UkdEXMb8o6T3YB
	XMz++H1t1gOjD0L12DjwgQq1oWZIpt4p2ubVemKrGsRk4CIZcf5tCUp1afdnQ2f5
	oz9how==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013076.outbound.protection.outlook.com [40.93.6.76])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bhbq8jaq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 08:42:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ldg0OLaCU5FSidpZKvFfHIUrVBe8WyHn3MKmmreqsk4z4NLTr5g/hvYLds/s4mBM98iWYxfkP9YlnCPwlMfLjNBtY3KpNOAXEpbQJPVwnVsRf9aq7VpXHnOLeRxwyFzpLgEroYUiJhXYh+IVlc+r2EfuMp5NVlPKvAD4B7G6jct6ihjdXTVptTzJ7FFPqg/5NKcZFL8qTO0YPJ2Gm0Oh9vh5Z4mBJCVC44Dxpme3Eq71ni2GF2574XpIvN5x8kZx3qCqlWae1QgguVCkVF7YeSJXw/t82qFiuREsxii8pUguiebKwPsf+t9yV/Vf1JjgZFxhDL1bAM58A62A03Wnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asdJ5nGenRwxrRIAbhl5L93Go38Wy4VKuNm63noNFKg=;
 b=Syw9fvyBXoh2s85NM0wHFDUBQjJ9/ZYOKXGfCs+Fx0hSXYKaceb0MSIf0FnJ3bqpOHWre4zkEK3I8HCaq779/Ojqc7yqnAY3Dg4PZyCbw/frhK5quMUJB8ntdkWH5iXHntUhP0Rv/Jc1r/bcYt/+V7AffIkiDmMfY5EVZ85jyVPpqZ34xIhzKV2/ZtLrQrf+n97WBXAnSoeELuqP6X6pJLNSl4neUZYhXLLBTLtLbYwReEECvOnMakRvKfEKJezRKFJh/B7uwVLFvy3jyXMD582PjGl99deWm6NB+TmQ42RY1cW4ucINOa1rZPnaLTvz1Ru7n1Lin//60RpAyvwsQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from LV8PR02MB10239.namprd02.prod.outlook.com
 (2603:10b6:408:1f8::20) by SJ2PR02MB10097.namprd02.prod.outlook.com
 (2603:10b6:a03:566::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 08:42:00 +0000
Received: from LV8PR02MB10239.namprd02.prod.outlook.com
 ([fe80::74c9:19a5:f76d:407a]) by LV8PR02MB10239.namprd02.prod.outlook.com
 ([fe80::74c9:19a5:f76d:407a%3]) with mapi id 15.20.8048.017; Fri, 18 Oct 2024
 08:42:00 +0000
From: "Balaji Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Balaji
 Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
CC: "andersson@kernel.org" <andersson@kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        Kalle Valo
	<kvalo@kernel.org>
Subject: RE: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Thread-Topic: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Thread-Index: AQHbH9MDNLSLgkrY7U+b4sDG0PQr2bKLiF+AgACrKcA=
Date: Fri, 18 Oct 2024 08:41:59 +0000
Message-ID:
 <LV8PR02MB102398337D13C6E0160E0FD14E7402@LV8PR02MB10239.namprd02.prod.outlook.com>
References: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>
 <mvzwlbeopenn5hpll3rmkdwcc7r7ir263nwvlh2hiy73qeipl6@nh4angyrt5p2>
In-Reply-To: <mvzwlbeopenn5hpll3rmkdwcc7r7ir263nwvlh2hiy73qeipl6@nh4angyrt5p2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR02MB10239:EE_|SJ2PR02MB10097:EE_
x-ms-office365-filtering-correlation-id: 1b23ba1b-28f1-4f82-70d2-08dcef50bb68
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j2DISSNkFC1WltVMChBuIwnJ+V1oydxtGgdcTfBs2EXDx4ezClg1NYJ7N9ra?=
 =?us-ascii?Q?fuUOwQ2SBfk8jv8gSIosT7soFVTDcgzIDz6aVC/weQPSWrd2gBzh6CSYvyxk?=
 =?us-ascii?Q?ol9MM/gnCyqcCUIoxlm7SB2hpVjgohy4x0tTgevwqA9dYY1qFHnvqfnl8WiE?=
 =?us-ascii?Q?n5PDu+DudlUoaIp98U9mfILwnVdoduW9Bbn2a5bGP+X3EZh6Ut82TaXlj9+K?=
 =?us-ascii?Q?w1jEEhU9WkTdoq9UnmigxuFxIb6siRA/aZrbySR1cmHkrA5Ikg57UQa6brjp?=
 =?us-ascii?Q?c/WyV3Ixoytsa2TRDAlSjjUYFj5U4P2hjwywzBXEpm49y1O6j1QylCD3Y+0q?=
 =?us-ascii?Q?7tTO0BbbUvrvMo8OByiLKQvsNTZg9K4+sJMAtP7aP0r2C7dvMwGSqHSLtrb3?=
 =?us-ascii?Q?rsQbdjdHYzUj+b8FR3Ja3YiskA/FxLD5VouA7r+y3q8cy1nFMsS7TKN8XE8P?=
 =?us-ascii?Q?lqu491T2Pi7NVjQ9B8T9E7jRM+qXsjRrEvq7cO5KiiytdcMttMoUDdobAISp?=
 =?us-ascii?Q?HZ214Mzh27Ke0L+xWd/VHwiapoGl7df9c7Oc5ktKsExIymxaeZOZoiMYwuAr?=
 =?us-ascii?Q?NndkB6ikZRnVnk6RRFKRRQUoGt8L7rhQFrywbpvYDDvnc2IOgnU9WaKEKcMQ?=
 =?us-ascii?Q?DxOEcO9V5mC5QLgLKjT5cmR3dii/zQxuItT4v8G1FuAoe1vclTAsjQoJ2twt?=
 =?us-ascii?Q?XV6hXzYbu9UjPinjNz5TNl/q+4+rYoTWyAszrdYzKANxjUWwy/ypq7OnHvvD?=
 =?us-ascii?Q?/ghhFujEzFj9piq/I77jcDm22AITCycVhjnOxkU4Uqu0tHOAPaJOZc9RT/cQ?=
 =?us-ascii?Q?c9+zHsJAOiW3yOu18lxAu5lg+yyELr4hXYWnwEbiSN2vKl8RjB897cDWYKtv?=
 =?us-ascii?Q?WyOXcKkCtr5hK09QiSR6v2ABCrYrK4RFTL99fk7cjKjblhSQyGKFTXTuFL0T?=
 =?us-ascii?Q?VLEZsQlZMN1rFWyVpxsJYfthCCnMp11JblszQ6w081roi2DvBu7luYcAbeEF?=
 =?us-ascii?Q?mwwdNSllskjoX0ACEFUyQWY0QJutOGjCCewa2WWMiYfbosdMrdVuaxGQWAy9?=
 =?us-ascii?Q?5dQvpsE7V9zRp4EgGB+WK6CeXU04UP61FtTioMnnYVtVXVvjkXhMBQGxLquQ?=
 =?us-ascii?Q?Iv2wPrI9+EAFjR3fwQXc72WTW1CFzESpwK3XYW0nrjbmdpi0NdH3byYRrX/2?=
 =?us-ascii?Q?X+GsDSf092xlqiVnGV3PGr/wSUioYWEqciJqmmp3ThPrizn+c2EV1dq7v4it?=
 =?us-ascii?Q?8WkHl+LbERiBpf0nchwmfhBjk0g1lkHkZKaWbVBTYWXBt+9KNvUw8w7PB3a2?=
 =?us-ascii?Q?J5WKZM6cQ+ydqkTUIfBvWoC0m1YQLETTRhiE+ETCbECuB242gjpcrNLFhAtE?=
 =?us-ascii?Q?HV52cTk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR02MB10239.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IDMoqwjBbYZ2f7S/8B4xiC3fFAPb6xBTEuKjOihjBNntl7j9Q3hpPKsmZFuu?=
 =?us-ascii?Q?rcDOb89A7U256y0AoDLr6z0WQVDNqrgPNjRhzcxdxkEyobwOH4faiiXregYO?=
 =?us-ascii?Q?kH415XE0ymcYA2vZGnKuoHgOUKqZNu7K6jg1fYGI0NU+egXRU2EZp1Q6i0TK?=
 =?us-ascii?Q?IwUMM78vY0fdLm1jndlpGQvxDvoN4kAu8+ufnZNT0mBkp1933+WSwK9J1+WG?=
 =?us-ascii?Q?TK4X0ZvyoyBj/S3hU5REjKfXYAjep+9IEQWc90zskwjA3GptPmILy/TnaFvw?=
 =?us-ascii?Q?MSkbMrS8y3iVRs+tw6JPbAX5mR34e9XtNj4NbWPIwPMTb7nJMoz6J0aNGnUe?=
 =?us-ascii?Q?3q7a/vvf+VArmTyPd45WT5EAquKH9srDyAtOTklr9xaPkS+DdqtTpCl/q97u?=
 =?us-ascii?Q?ix3eGJKyaIhi5WfqkbUBKLjIELdSI4baRHTNdpoK7okkDSu+wtzKSZZy09Ic?=
 =?us-ascii?Q?dYz/aRjjgw5GCwR2ICU8LASR4rPamOE1BAf5zF0BZAp4nYBwGwu4ZyELXBzV?=
 =?us-ascii?Q?SkjScDCkuUIiFPc+qUDfAac7YeHmGb+e1/BEz1zo+nEziMhDvgNmI/q3CiSC?=
 =?us-ascii?Q?ytghUB6oWjQHzUVyoYCyKhrUSvxTS5SadsUYGfYEL1cz0NHYOlV8SaXZl6WK?=
 =?us-ascii?Q?dFqQpsQY3z7/OWzWO3VSgq75TKx7ANAe/FgGmVEn9p8h9/8koyDO797Zp6xP?=
 =?us-ascii?Q?hINDqj5lHfE5Efax+/InXOvxHXWa1xfrqwYD5hPz5Tjp/otYIxaUGH0OvnQL?=
 =?us-ascii?Q?uvPDAlLwhN1AOUz8zr0gFAT2YHfUHDDfQwPobTrcD8gzNXm5ASm39LqSIkxa?=
 =?us-ascii?Q?QzH8r+wH4ojW1WccHc75B7UJcAtDGWcJeS84QnB3ZsDUTVkqAmretV8MmsjE?=
 =?us-ascii?Q?9fwsGa65HLig+tHZU/d3WUoNiOkhqwnhocAB1Yq4dVVxIN5356M7cjEzpTsZ?=
 =?us-ascii?Q?gllW44tXIA/+S6FCy1EpQgkIW7szNg+etXsAoNf7QI432kiHG/tEpq0ndVe0?=
 =?us-ascii?Q?zaqduGD6E4mb7UMfYo5tMT9jOP9GNjLqnTNShjv78oo7WNI1kGr84d1Adl3Z?=
 =?us-ascii?Q?Rf6fsX7IlOy2vcVWznvajPxm5bvuitvPdPDV5D/83saBcnxPqTeVlGIEyuR3?=
 =?us-ascii?Q?yXKf69lucq7F8osefPEEgXXaOx1Ve4R8xEdSVOjd9s0xXEqk9dcURk+4uEP5?=
 =?us-ascii?Q?N978PnuJP9fcutK1IQ4xBNdPi+snooD6Y7WKXfZlh+Sc4Z6KyRt+uTOUQo6U?=
 =?us-ascii?Q?sWBMFvZkOLcpD2t53JqT0Q/irKuCZi2T6YP4EQsV2aUm2suNBoKqK2sPJjpy?=
 =?us-ascii?Q?OetDejyYRE+nfxLNrS08qZSUTiGP87xlF9jqjZlTkrJYjUUXV3oIirJBVugF?=
 =?us-ascii?Q?WqALOj0x075ALF+P15zVwagQdwulCQHvR3OPMXjas3QoQR1nYr2dDccEf169?=
 =?us-ascii?Q?qKtDoNJo28loOfkptNN1rBhZNf6K7cNCUb/V+eBtkZSnV46oqhGC8ocB3Mjw?=
 =?us-ascii?Q?0oQ9Y45cFfS1FbC4ube1+684gwLoHRIWkL2SH6LlzjYzc4hKaXnYz3o0+6yi?=
 =?us-ascii?Q?ibcvEgFKDSQQzn+oExxcOgAQXBBvqgbSkmQM7Yob?=
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
	eOFWwBKO1BTQjD1fr24W9wrJXdbFdAvcuDWLckN1ojT0Gf11ZXfcZOvOpCkkTGQUkWGjSnjT/glKUuaRy8Sdhvyn6KfRmG0QA0uNLrdrtoic1w8ac5F38C0uY//S+DTJypjXtGV3WbwAqE3E9arEEohGdA5hhOTMN+TXdFQRHx8rNL3jKtx9Ltx7eIzWIBuLrFrAb+ocpSY69x99hYEUDv+n9+fw3RpsPFYi4wz+Z/PvKZow7CTtxoY8kHat+5RFOLYc/O5wzODe+zAjyBedJIwvNB5nfG7eNvPJvNeXqV7YW1VGijIkgUiLQ6+YBFMyMfc2ojyun5tTj6+8NBc1XGVPRgJOTHK/2/hHvqXr4PyVZM1p3T42XxTzqvIiyCMVZaafDgRmEXxwDvIbu91jXtB7+q/jz6Zrg4VMCidybBaPCD4AqOB68NOiqtYsXz2Ka8oFKdDiWksP3K+UCLOSd/wOJlinYUNyEJn37oyJMyMwsmIMBxCWPnzUKFlJ1zT8crlDFwjy6KNJOkp7bd6pBD6W0oXeyri6qWqvkp1uIQK+JfzS/OnoxytRAPrOmGX0fqwOggr83R1trcSBJmZ+rTuohtZh0eE2qovJKIoR9zvEl6G+Cd3qNlmMjj6ZNNuB
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR02MB10239.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b23ba1b-28f1-4f82-70d2-08dcef50bb68
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 08:42:00.0104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PL4q3GPXSjjXgnufysrgYdHesuJakCx25S8tDiTKoJ9jW/3hT1+5g9O6KIcOarIwxG8utBB/f9qAG7jrbm1L6wDCUmRG7LGHzB3EzfzTI0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB10097
X-Proofpoint-ORIG-GUID: 1wqnIYOijh2X9TQQmY756tBpUea_RqiE
X-Proofpoint-GUID: 1wqnIYOijh2X9TQQmY756tBpUea_RqiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180055

> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Friday, October 18, 2024 3:59 AM
> To: Balaji Pothunoori (QUIC) <quic_bpothuno@quicinc.com>
> Cc: andersson@kernel.org; mathieu.poirier@linaro.org; linux-arm-
> msm@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; ath11k@lists.infradead.org; Kalle Valo
> <kvalo@kernel.org>
> Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wps=
s
>=20
> On Wed, Oct 16, 2024 at 07:24:09PM +0530, Balaji Pothunoori wrote:
> > auto_boot flag ensures to take the firmware and boots it up during the
> > wpss remoteproc start.
> > wpss host driver would like to control the load and unload of the
> > firmware during the load and unload of the driver.
> > Hence, disable the "auto boot" for wpss.
>=20
> Which driver?=20
ath11k_ahb.ko

What is the reason for manual control?
> The board seems to function properly with the ath11k driver, which doesn'=
t
> seem to require manual control.
>=20
The rproc "atomic_t power" variable is incremented during:
a. WPSS rproc auto boot.
b. AHB power on for ath11k.

During AHB power off (rmmod ath11k_ahb.ko), rproc_shutdown fails to unload =
the WPSS firmware because the rproc->power value is '2', causing the atomic=
_dec_and_test(&rproc->power) condition to fail.
Consequently, during AHB power on (insmod ath11k_ahb.ko), QMI_WLANFW_HOST_C=
AP_REQ_V01 fails due to the host and firmware QMI states being out of sync.

Therefore, this change disables rproc auto boot for WPSS.
> >
> > Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> > ---
> > Cc: ath11k@lists.infradead.org
> > Cc: Kalle Valo <kvalo@kernel.org>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> > b/drivers/remoteproc/qcom_q6v5_pas.c
> > index ef82835e98a4..05963d7924df 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -1344,7 +1344,7 @@ static const struct adsp_data
> sc7280_wpss_resource =3D {
> >  	.crash_reason_smem =3D 626,
> >  	.firmware_name =3D "wpss.mdt",
> >  	.pas_id =3D 6,
> > -	.auto_boot =3D true,
> > +	.auto_boot =3D false,
> >  	.proxy_pd_names =3D (char*[]){
> >  		"cx",
> >  		"mx",
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry

Regards,
Balaji.

