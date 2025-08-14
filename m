Return-Path: <linux-arm-msm+bounces-69187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DFAB26182
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719633BB256
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10082ED876;
	Thu, 14 Aug 2025 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bU6z0b9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A22EAB72;
	Thu, 14 Aug 2025 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164907; cv=fail; b=phcJ/3WWAhWTBqFfVzvrkOjomArRGIcE0i+lwTrkNoGD7ACt+DMpnhUNXZ70SWcQpWWAsPV1B9Uwo14PArEWf9ezzbq+uBFegfhOEHHvvab7uAF6uneNAQQBhmm4RXTffWPxC8QIaUok4KvTq3OEt+RF/YGI7lTVo986V1+0zqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164907; c=relaxed/simple;
	bh=2sn+J14k/d0g2FyrGRVOWmuQMGv+Zr9tUqOXYEFRBqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jNiOK9+iHeE1fLY0ISn36lF90pMOmUDZtUHItHrWNivYMJSHLvi8WRFlEymBLkuX3Xt0xe30/TxXwrGpDHwEe0OyUh6FKcG8VKH6HFE6VuNnnX3ctc+FIm3+AzB41gEoGuGqArGdS3OWlvcWBLjPfkEQm2a2DmzRdMdVG0oR004=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bU6z0b9E; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9J5F3020811;
	Thu, 14 Aug 2025 09:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2sn+J14k/d0g2FyrGRVOWmuQMGv+Zr9tUqOXYEFRBqs=; b=bU6z0b9EiYUt9rM2
	j7ZWXW87qw8mIG49/xFgyh+BysRsbwno+no73x9++aZEqZMeEOopPX4QIfeRsy6j
	3FSYBe8+vO0gD+075hkFsOXuCLo2UtCi96uwYlZJ7S0afaUpNFLe+If2N2LqjYTP
	9dBy+JDFJRAn1bG7I9EMunXSz2ZXZgRlVXoiC/I0gIUbev9Ncm2GE2fDSiugNsdz
	EiyAphgTX8CJCKL5PnkUGS0E0Glebe3lPaQPA2nuApRe7VpkmWkLPvagFKuZlDM+
	KTnismOgw8bPeE0ZWVIbhLzVqvq/oJb4KHbI6ZYoEgUrmjEw3SCNxuIDrM8mAzdG
	Jqa4jg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9syekp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 09:48:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUPHspRO5hpSZXgvKvtSEo3naywSAkk8e+1ccJ5AaSzOUeCLP3kifeQLkI3teI1jkKcorewzP9f+uxhXyuQA8w+LE2MHyNDSmBju7iNTeK7zVYtzvi+6ehiJ37putl/zwu1D0XGXxwYN2xQdVbhS55eD4pX1Uou0PkI+WLERuAgcZTBnbob9ofxF3gmlSCHZRVLwkkM6I06ItcHsKLlKKvjQ2Qd5bZPKJ8880eiuxpoibOYbUMsvqGQvvQXdEu2A4HqM13cK7qX++ILJL6UGaY++jY6rNx251Whatcq0iswciJtHwoGBpd7uIpZ67VBvzCHVDGRJy/egrxV/eWkJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sn+J14k/d0g2FyrGRVOWmuQMGv+Zr9tUqOXYEFRBqs=;
 b=FAjlpyHUvdjjdkY2PbB2o+4Docyv4/iVV4Yh1OqbgTSC9fonfxo1QapMYZbcRzG4aplu3pSQR+bRT7EHFFPd6GJJn2r7cxJ8umseN66fgVl+HCFX9p8Gfbn0zdpzQbA2mqCiQDHuUEhGkn9Hs/DJu0uKV8HjJ9BwtrCh/H2PckCrPHdQiIyX6H8feNxDTMyaNC+7zWMafGEAf/KMfwbvop9U+jyU8jWKZp55dMhbuUdMUwrfpqxWDyXnW4CF9ruDKA6se+jZvCCZLQmIRYun07QK2+7Q3gkq6bHLd4bMd+HdbTYkGpt3APbx+AX6FFnuKvGzTIEs19kqsd2mY9riJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MN6PR02MB10629.namprd02.prod.outlook.com (2603:10b6:208:4f3::6)
 by LV3PR02MB10666.namprd02.prod.outlook.com (2603:10b6:408:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 09:48:20 +0000
Received: from MN6PR02MB10629.namprd02.prod.outlook.com
 ([fe80::786b:71e9:584:fa3c]) by MN6PR02MB10629.namprd02.prod.outlook.com
 ([fe80::786b:71e9:584:fa3c%7]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 09:48:19 +0000
From: Quill Qi <leqi@qti.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for
 Hamoa-IOT-EVK
Thread-Topic: [PATCH v2] arm64: dts: qcom: Add initial audio support for
 Hamoa-IOT-EVK
Thread-Index: AQHb/4+LLEN6JHBSw06gYWiH00Kh+rRHYOKAgBqOlYCAAA4iCg==
Date: Thu, 14 Aug 2025 09:48:19 +0000
Message-ID:
 <MN6PR02MB1062943D66036348728930990E335A@MN6PR02MB10629.namprd02.prod.outlook.com>
References:
 <20250728-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v2-1-58aa30b60c7b@qti.qualcomm.com>
 <172f1a38-d7a8-4799-ad44-f3eea69f297a@kernel.org>
 <e6e06ab1-6744-4730-a2a7-be8c66bf74a3@kernel.org>
In-Reply-To: <e6e06ab1-6744-4730-a2a7-be8c66bf74a3@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR02MB10629:EE_|LV3PR02MB10666:EE_
x-ms-office365-filtering-correlation-id: 14ed1381-2233-40a6-915b-08dddb17b37d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?L3mPyvfRZopx8zTlec8v/SKFl2pv+lpdrD1W2YnGgEyvD6s7cW0iDbfEFo?=
 =?iso-8859-1?Q?zb/T0oGXAKJjm8rmsjKer9RNy8EZXwXB/fu3Wx0aZGMj+1tqqgSKi69hvR?=
 =?iso-8859-1?Q?EYFzF75Cvvh9/Fzhc2NvF6JNnSJdAtuBA/SMGZYPirIJVwEaL7PvJ9ZQw4?=
 =?iso-8859-1?Q?Zq+/QN9Y1nhwzH3WI6vYaDCffnqDeef/hzaaHCzEVaklhrsUdzs/R7tvc6?=
 =?iso-8859-1?Q?1DolsiVYT/9BxT03fo9lZUj1DDuP1Gs4aPOCZINGhtlpWFGqH8X8UvSuaw?=
 =?iso-8859-1?Q?lYPvfVS6Ky9A2kykJ5nORMQ0dKHh6sUL+M9gnttAViSFKc8IHu/j4/ekq9?=
 =?iso-8859-1?Q?YHPQVA4lxqmMw9h9V3dZ4cXMCwz+WZJydEKvZrDH2oInCDZk/aPLDvR48F?=
 =?iso-8859-1?Q?3GlmovvqAEuzeMbOoJmdAdKamS0K8ATQ6CIn0ab1V1UJTccv3G0Z0Mv7fn?=
 =?iso-8859-1?Q?6cD5AW0vzLUdPr+l99fpkmYBzAh1VZc5UCjmiRtavNqzWggU1cZxApTpDV?=
 =?iso-8859-1?Q?BJCZhYVI3u4oedOrCsYP2PILImQkdsehZNLoKsYiRSZZITSO6aDA2FMx6N?=
 =?iso-8859-1?Q?/OmdAniP+lnIkatq+XRIlwjvfdaLVgDrC05Qx9kiLRd2DZD7eXpDN/lhlz?=
 =?iso-8859-1?Q?7Eyb47dwciS+e+fAdV6XdR0ZF2rvT1f+xGs6U4ONdOAiHNQR2Gka/DknbJ?=
 =?iso-8859-1?Q?R5e39jnGpaH8scO1rFdbdThp/F1nbF5BfLnLZVlt7nSUlvkSA1QcBEEXUp?=
 =?iso-8859-1?Q?ozIfUOSGJGPv6aouj6L8hKJEvghCxgygMXHfBrb6TYe/96s2KEKbZMNLzO?=
 =?iso-8859-1?Q?9mejVvMzNEuhOuSKHrdrMmz/KOcr+PhbD4OiWgan1GEfYxBrygurPU0VMo?=
 =?iso-8859-1?Q?yPMODrazKISeTLFiTT/buixhqAr3HAopHiMwcqy7SPpaYTxWYUmMukSleJ?=
 =?iso-8859-1?Q?S/QREufJRxr5C9KqXVld8BJ865Yd9FKwwKJDB8v3QUY3RzY7yBcSHmM5qO?=
 =?iso-8859-1?Q?iMXfwK08btr5wH+aBFJKUBc4V29FoymAPH4lEM10skcrj+8nKwLULulZoc?=
 =?iso-8859-1?Q?W1vgPAuSIGfL+M7LLl9SNXnCnbQair0hMqwZ3RK+fzZ5i+pVD4NeCPEkoE?=
 =?iso-8859-1?Q?S2ZvbdX6yIIx7OtSJMFeJvX67xRntCSpuy2fI8ICKKB2cxJHpSctDFqJkc?=
 =?iso-8859-1?Q?APWVioR9y+pBBOCAbLn7wGNA0fglKD7RWEM71OVAE2OKhcMSGWQY1Wp8iY?=
 =?iso-8859-1?Q?u8pv2atDg3FRE53qzQPn5TeS7G5XY9yf7HGjvgJs6GAbYFC6/a24sCqCyh?=
 =?iso-8859-1?Q?QFh/FvudL8qH1lUKaSO6GMvzatZQ4ZWjjN+alTsHFSLfmB/zbDXGaqStTn?=
 =?iso-8859-1?Q?o+Fc+HnCj8RedZq5FRc+L3LGBWLdebZbYFYF/pSYAeW5JyBa5k5pkRhc8Y?=
 =?iso-8859-1?Q?xBhIQ51ykn3q6V4JwjjDb0hhQbteaczNOwdZ3ftLB+hdI911WGWIZDrsTN?=
 =?iso-8859-1?Q?sv3VtZA/TPTDdTLgwSuMC24jGqf8XfjBDJ8DBhQ2kcOrnwS7EppLEQldKU?=
 =?iso-8859-1?Q?AnrDM5M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR02MB10629.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ELpvqmAHHvSJqKu4P81psrUsRkE/u8Zh5M9/IdH+aH4eHRHH0x10v2OSQn?=
 =?iso-8859-1?Q?Vu+oQOi+uPuxhMckRFrl+ok9Z2zvQs62VkOted0BQkVaGFpCpWPWhAWucG?=
 =?iso-8859-1?Q?jlYr3uVNRmcwv6qFMUMMEos/H86wHVwEfeBdp4mEUXGaqXYCz2z/Wexscf?=
 =?iso-8859-1?Q?iHfhQL0J+fMs2y5cf0iXpochXM0Yd9+3PVoXRGp2vtHbR2ICWegVTn6s5K?=
 =?iso-8859-1?Q?XLRPpbrmkBiBUS7AN76V+EaeiwbHwIZOFTYaqw9yU9B1vR9MSPvqXSFKfG?=
 =?iso-8859-1?Q?IbXEbPuQly0RzWPAUoXaSp5KUhLS6NEgQWj1/TxPE4AA4tqTdUij/5iN+T?=
 =?iso-8859-1?Q?tIqqpocl931hppsi6ljARcUq6p3043cP/fOOyI0jQoODukQ4TGpvGIxjqR?=
 =?iso-8859-1?Q?oURxIM1sg+RLIiP1ZduTCHI/kEU7OhRHZwyZGHLzonLghZNvvPnOSlrdA6?=
 =?iso-8859-1?Q?LVeyNLdqZENKP8VWL8Y/fJNJ1E7URXfdsqJ2pOiegRwtIGKQFCKXG7RxIV?=
 =?iso-8859-1?Q?h2mz1NRjb+8XlH6vBZNYUmAL4Q/+DRI0+iVJQVh6cOXgkOzIAbllgt0POI?=
 =?iso-8859-1?Q?Za9DCR5W2lQ0uVZ61fp4F/WxXOd6UJwG6zkmSNtWNf3Xvbqnvry7BvyRGD?=
 =?iso-8859-1?Q?dCSy+otCxQN8Oms1UsNz8K0Ne1Omc6GfZtIiN7aY152qquB7ff36cQTMhJ?=
 =?iso-8859-1?Q?JDVWkI4ZTyjuMkG7Cyy/QmBS4saHZkJYX8vejFzF0JAxrVFaD57wEIkOUN?=
 =?iso-8859-1?Q?lbJ1dzlKJeHHNg3iZ1RaKZFjN1m3PVGFSWguPNzCpm6xlyoialNMedRZVS?=
 =?iso-8859-1?Q?v71V/4tcUDFcm1g9Ba4meFMhy0SXJdTxhGcTcgObPdZHGwXm5UqeVmW9tA?=
 =?iso-8859-1?Q?PlD8ZY8EN/Sw3LvwDB9vTObXSdgJ57K87II44T8439JC4nvUQAd5ZXshRO?=
 =?iso-8859-1?Q?0/S+ZCliNXKnHdJ1fIzLnXgc22Obwk8VTECSJWxilfRsZ5Z4NwtrbVVC7U?=
 =?iso-8859-1?Q?h6015sDXnHgbMYb+i8iMajcZqrmSWaEg/2r7oV0vYWy0Mu6yBqE0y6QN7c?=
 =?iso-8859-1?Q?8RVWP/Y26lXNd77ktjc83H3xGq1ai0a/m28yhMq60EP72JAzPzaPnomdE5?=
 =?iso-8859-1?Q?GVqTd5YUfvn+xTJEpjyC+o4RPsqcmXxZ5lgqkbgtzt00RDgwce4foKm8Fa?=
 =?iso-8859-1?Q?29yYO7i5U138qKRmcUYa3vtYLXyk/dXi1M0vZe5UDHpv6SOW+WmCoGMZTh?=
 =?iso-8859-1?Q?0G49PCxShijb8m3pRxCnZCnL/qAtJKgacgCovbNDYt0MDyZNMMpDW3iDzA?=
 =?iso-8859-1?Q?Az5697glNSOG77lhU+AcxbY8mPd8PoyJ1vDcLdYMxCZ7xX6UVjweU+lAZ6?=
 =?iso-8859-1?Q?8SG3VhfLGPiTVbCgdYN0JQ0L0K5JxWBFoChbGCIrxNXP8om7mn1qx7v+BG?=
 =?iso-8859-1?Q?OB14ne+d0AuMJ1/tEV/WnRXF/kaqrT14Ij2LQ1ggQSC2SPkj7aAITuCpds?=
 =?iso-8859-1?Q?fS8xKsC41DSBJeHAmYvlHdcftfD5LbIK46hO9gk4S2btH0Qznn+QnVuH/y?=
 =?iso-8859-1?Q?yVEO9pnBnO0AjfFymdvLtg/OrWrW7BUAMYnt2PL9bRyO4hXqH9fCG3fUTL?=
 =?iso-8859-1?Q?pbhFKq1t84L1wnVhI9yHejKKzQhI3gx4on?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AeM066ZYSXrwnylob0jEhmmSkx/yANCimdEKn1XZt/5iRfme59qyXezfN4XYW6GgWN9HQUi3TxNbqt6TWYHRpoKrKed4KiJkU1moMj+f0+rOX4r5mJ35x/UtditcCQVjXI+0i7MlpOjSzvGoqR1x6gb1c1oT02oJjKhWMME4FNUormgakl6SYiSwQLLmCo1EUq1DDfNPtZJPQcHPDSPxcc0ZCAsU4Oziq6yfe8+cYLyjwM+ddmoB/x+W7517p7N/OyMo7pPJ/KoA+Nj3eAt6raCrMgkDqZ9X4JarKQfXwE5UmckrOXAxcYFY5SYf4at0JDKy9iAJtycn4Ks9tSADbvBpGy0RhgdYVSpR0ZmjDmoUB/mk+gP+sbZhxTgd3fc7EJxkOSdC0Lr/TS+PuvRwuCe8iywv4Y1X4PcMVX7zKeWF9d7JoR8DmlmwamqOkX9IY1VlrPU50Dd8+EjJCpZUrG75avuste1qwzjEH7m4QAh4JbVs3VqENVe6Wl1+g3tIw1pKVVw5J/o//AhQykmJyZqWGNtDM8Y2NtCwacso0h0samJu3Y9xC2cC+rPNv598yxZZ7TwSGpRxzitVr+ww+OXbk/mOq0r0Aet3fhugPZgR0tZZTEyPmijID0w2o7Ev
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR02MB10629.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ed1381-2233-40a6-915b-08dddb17b37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 09:48:19.8365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1UnWsXwru7pGuUr+GDJX78WQDYI0vq6HYeO7EuTOEh+qTpIV1sDVxOCt6P9aN/JM9MjmhNegB7B6J4ZQzEp0zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10666
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689db0e7 cx=c_pps
 a=p6j+uggflNHdUAyuNTtjyw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ldHsddx3bQhR2zsS9lUA:9 a=wPNLvfGTeEIA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4qN2WAexRslsX4Cy2S6Ki1Y4px0gvb_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXyWf1yFHNbJki
 RzqAXg1smk0aB2z5/VG6+cnLOnWmlEMMin0XiZcXXL+6UDBVnnExUcYZuv38dckcYLbOt6A9hjA
 nJs3BwLyv6d3YLWIbpPxe+Enzo/z1HTMs8kTM4L55AqGC14PYou1Ye9vmUVWUxkiXzil4EQLDfi
 EgZHVKvYbS3L91/XumRE1SZR6H5J6CeK9GkbFaHPYC4sdrF+T0OXz7g+XrP/wCmyp5EyHJ8F3TQ
 2yZhUqFBD+3vXfgFxbLcGp+ZlLAKKo9qguv8XBZ/v/5Nbwj1qEAySBpgV3l0lmbUzxLN3q7h5IC
 u8vjEVQLIAHYSHHgGTaFSm4Lur5HO1RE41GPan0LXlU6LrXmCccPiYYnn7YssVH/0O15e9dq6jE
 M3bai8Sa
X-Proofpoint-GUID: 4qN2WAexRslsX4Cy2S6Ki1Y4px0gvb_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1011 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

From: Krzysztof Kozlowski <krzk@kernel.org>=0A=
Sent: Thursday, August 14, 2025 4:41 PM=0A=
To: Quill Qi <leqi@qti.qualcomm.com>; Konrad Dybcio <konradybcio@kernel.org=
>; Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>; K=
rzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>=
=0A=
Cc: linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>; devicetr=
ee@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.o=
rg <linux-kernel@vger.kernel.org>=0A=
Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for Ham=
oa-IOT-EVK=0A=
=0A=
=0A=
>On 28/07/2025 13:08, Krzysztof Kozlowski wrote:=0A=
>>On 28/07/2025 09:16, leqi via B4 Relay wrote:=0A=
>>>From: leqi <leqi@qti.qualcomm.com>=0A=
>>>=0A=
>>>This patch adds initial audio codec support for the Hamoa-IOT-EVK board,=
=0A=
>>>including WCD9385 configuration, micbias voltage settings, GPIO reset,=
=0A=
>>>and power supply bindings. It enables basic audio functionality for=0A=
>>>further development. Basic test is good in Hamoa-IOT-EVK board.=0A=
>>>=0A=
>>>Signed-off-by: leqi <leqi@qti.qualcomm.com>=0A=
>>>---=0A=
>>>Changes in v2:=0A=
>>>- Updated author email address to leqi@qti.qualcomm.com.=0A=
>>>- Clarified that audio is validated with this change.=0A=
>>>- Link to v1: https://lore.kernel.org/all/20250723-initial_audio_support=
_for_qualcomm_hamoa_iot_evk_board-v1-1-816991701952@quicinc.com/=0A=
>>>---=0A=
>>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 232 ++++++++++++++++++++++=
+++++++=0A=
>>> 1 file changed, 232 insertions(+)=0A=
>>>=0A=
>>>diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boo=
t/dts/qcom/hamoa-iot-evk.dts=0A=
>>>index 843f39c9d59286a9303a545411b2518d7649a059..91618e22e86c46c698b3639f=
60bc19314705b391 100644=0A=
>>>--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts=0A=
>>>+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts=0A=
>>>@@ -124,6 +124,94 @@ pmic_glink_ss2_con_sbu_in: endpoint {=0A=
>>=0A=
>>=0A=
>>This was not merged, was it? Same comment as other patch, when you have=
=0A=
>>entire code ready send entire board. Not chunk by chunk.=0A=
>>=0A=
>>You are not following properly release early, release often.=0A=
>=0A=
>Why this is still not included in initial submission which happens now?=0A=
>Either you work Linux style (release early) or, if you decide to wait=0A=
>till everything is ready, you submit board as one patch, not everything=0A=
>as 100 different patches.=0A=
=0A=
Hi Krzysztof, this audio change initial test is good with sound output and =
record fine. But with further test in Ubuntu gui only=0A=
2 speakers have sound output. I am still seeing why this issue is happening=
. I thought to solve the issues before replying=0A=
and merging this, thanks.=0A=
=0A=
>Best regards,=0A=
>Krzysztof=0A=
=0A=
--=0A=
BR=0A=
Quill=0A=

