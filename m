Return-Path: <linux-arm-msm+bounces-74385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5FB8F161
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55790178F8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 06:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADA5F9C1;
	Mon, 22 Sep 2025 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="NBPSd/rv";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="eFO9nKL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E60534BA39;
	Mon, 22 Sep 2025 06:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758521775; cv=fail; b=ubRnm+bnpUe+dORuhNXR4AkPkofNSclda1OKTDFVuf9tHR0lyFOpdkDhMh8RZjW2WyomV47tqUaa3Ey9RlSjqqrPA3RDoeOHIrZ0eYrXGeEoAaY9STdq3qYXMAoUMGt+w25cwEgB9L0v6JaYH7fZQ2Mjmd2AmF5+vV7pm5ts1+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758521775; c=relaxed/simple;
	bh=iBsiS6cJaX+UFDGxd+cpg6XiZOBczGH4xKEbK2RmaFg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bLVqRRPCfkUk/ALja7HVrhxtCGfvS3SW/Xff4hnLsEZcMYC3Ea0eGV26kNwqyWsGZhVsrLI7chHlrL53CftCanh5OlolgJiBXJ7Uqj+6vYsDmTPrI+QGLhws81I6aPDGeb5bBvf+K0cZUacA5ZVeHqAMlrmqBmTPifsPogy8Twk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=NBPSd/rv; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=eFO9nKL/; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58M4F1gc3909647;
	Mon, 22 Sep 2025 08:15:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=/A8XBsgMhkuz2oS3HUcXj5
	OoZchIczlU188wr6lhdmA=; b=NBPSd/rv9zFkkwKWT7buXN/yCPz76h5v7O/c34
	+e1GsOJBvBr7EubeQdRZPQMCvDqQb4H0evvZUw3J1Vn5VgnnAMAC78P5m1Q5v7Md
	HLZPOWuPobGQ9nbhyXHcxKkcAX+sOgHcNNDx8XxhSsAg8iSvQi7a7yh7Inx0GGWV
	gN4YXCf5Ro6VSK6Xf39GYjIIdNiz6qIC3ucJUA7yVfAxafo+aBO4wyxLWlLjT3lo
	++Y1L0VSF659927n/7+JD/bFAnLjPKPNLgu60gXZUM6P9w23c0VCIXptNE6PD1QS
	4bssIQuAQHsp0/Hv8b0smnTQLf8hPTxzaFGq8rubPD1uB3Jg==
Received: from eur03-vi1-obe.outbound.protection.outlook.com (mail-vi1eur03on2099.outbound.protection.outlook.com [40.107.103.99])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 499gm89t7s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 08:15:55 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA2/PvZgmNg+fh+h68elO+V5u2gPkPfnvXT5FVELuoLVxGNfbm9x9rykM6i6zFD9c3ItMTR4fQFRerZGRQEJutypwMpnu1fTnY8Q5nGizydrBvVQ7jwmMLRZC6Ys2MtRLbP45ZXg0py4v/G/HtWCoj9oDZK4YN383fezE3KsEsDvLsb2u/AxIo51Qz0btczocAJgOIer4sz8hL4SAbeMZsfqfo4Z0exrjdeHxnbY0vWiFu8ByjzRq3RyWi20QdavCOvQT4xo4ck39LiiZ73FcSMSMFy+IVj0hKOPzB6m0s3y+hChd/sg4EU/jpJL3UN8ncVhS1Bd6flOGt4+rNJG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A8XBsgMhkuz2oS3HUcXj5OoZchIczlU188wr6lhdmA=;
 b=AOiEg5WN4SZf9/66FC43J0YS4Hfaxd8pri7QEHDl9AV/XdenfldksAzoZnPVhXnejxWSFrluwcTMktZe6Lscq/tMlmaRxRvrmRqPNfKBOVEvjMF2hI5/AaMcCb+yS8K6lRWOSU3IRW928mjB6l/fMO4DInoH5xheAOe1/9UAfuvqhl/BKm28pO5ej5E6QAzyvJg3GeoM+FeSURP49W65CvnwHQRIAWedy6x0y0zZmpYxSOZxfDUhSNqQfzwhImlkQ+yW1s+S3PuRgznDLk2/K2WLYu5eAaiW6md373SVDf4ncac6xRYQB6lhN6OVo4IPi/AGlcZYGbD8YMMQ+1rNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A8XBsgMhkuz2oS3HUcXj5OoZchIczlU188wr6lhdmA=;
 b=eFO9nKL/3YJIDhHd+C7BpdyMDtcDtiBg5+3yShLIA6HXgQyRU/YuYOtPGTRoziucy9/TWUBwDk7xZq3WxWxMLWjfQ4AZdrQZCqp6KwOOsjyYokTA46CdyaeKjtF0Ym5ANCZzayv6zdl3HtmQC63y9RaSBM8DdsbiCYmT7OPd+Mw=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by DB9P192MB1827.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:39b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 06:15:54 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:15:53 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] soc: qcom: extend interface for big endian support
Date: Mon, 22 Sep 2025 08:15:43 +0200
Message-ID: <20250922061549.11407-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0148.eurprd05.prod.outlook.com
 (2603:10a6:7:28::35) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|DB9P192MB1827:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee4e631-2dc5-41ee-4b0c-08ddf99f7c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rGPAmhemLH+tqgTSEiKhxs4ygh8zrvU84Zh03JlqIdX8Eeh89dYWGeHYblhL?=
 =?us-ascii?Q?SGWi1sQUAtUHzlYhfEhtrnShadYgb8uJRnMskZo4Tf4WwjNhIj920FCKxseV?=
 =?us-ascii?Q?IBuOQgXxqLiHrqNFFFOeW5EKkf8KZNZ8JJL+rqoDVPFj7EcJqxMi93386nuP?=
 =?us-ascii?Q?bWl8LScjH1ZF5CbN+PwlSU+irlR4bpesGJPUulo2sZEATSiZbyT1BSOn/022?=
 =?us-ascii?Q?C8P3ChdFkVzPXXIiUE33WN89M9rOte1p/Dx8NKGMW/9uOqwE1EnE4xulwe81?=
 =?us-ascii?Q?CqaqhgAvVOuivas0WLwXbA6FhKF3yWa8xrWgpN27zOEvtljuTE0a5dputC0H?=
 =?us-ascii?Q?U7U3JsGx8H5QhivH189ZzZqjrptnXZjRLt5KLGN//MgijPtCrg62l1SO5XJq?=
 =?us-ascii?Q?0MAJhardn0M4jO3/TkNJ1nRggO47itcKRfsWQrYk4zhupa2wuqVQMCDEYFZ7?=
 =?us-ascii?Q?bk3Df8a/4XNqSYXRiG5o2zu1c4kQmXgauQf0X5B9N+xRSxCGDSfESuml1SSN?=
 =?us-ascii?Q?wVb9RUQN5CVwB9Y60LpJeiYXH+J4cRjoLNqCyBBBkHVWJDllK7Pru+IgYBc4?=
 =?us-ascii?Q?owPpU7wFDrO98B605FV7zkI+9GKT2REy8r93LWBbRiIASAS6haak7Ji5xB8U?=
 =?us-ascii?Q?q4H8Ie9/IDrdohKn9TqYY1L6EldPyIZ1fRktNZpcer9OI4n7OxfDjVem4a9L?=
 =?us-ascii?Q?N2slwqRpUnuc7BjrIv0mwaMTM6E2yEs7YQdhWCJhOnb1+xcUsvvuBNSzJSPF?=
 =?us-ascii?Q?F/uZu7SqSaGt5UdZcuOlC2svmAa+TncSvT6J3qSa5m3CTrPlcTTCkg2o+htW?=
 =?us-ascii?Q?H6q4t1H6tuwlpKF+WpAUJs6UDQZmqYBrF29QY5CSabpPzDI6vUXjh8qHnibH?=
 =?us-ascii?Q?+JifavaQDyfL/0UEsfu2h90C0FDy52PsIDS6b1BHwFAiq+syNFSqKuamA1fO?=
 =?us-ascii?Q?tGAeZQdzpBs+j1k23/QDq8Yid58KgRH20rM7MhRJDNq0NX21zZWawuqaT69c?=
 =?us-ascii?Q?u7xRb2KduI19tOiO8ouuAFw3dGBz+3NfBErVn6PpNnstmWxnfFGeVrDJtFpb?=
 =?us-ascii?Q?ej1oMM2Db6Rr/Ev58odNo7eE/qtNcDbDsnAaRkv4F+/Yn1W9Vw4zUpWzJ8eQ?=
 =?us-ascii?Q?XHzaq28dqOYPdA5y1ZGdhzPh6QiIl59I/77IMicfVvyh3Ig+sWw+oijljLeL?=
 =?us-ascii?Q?ES5Muip8T0yfjPBp/51aDClnpSUn5tP66QDi1gVUXhyyx7bRqhesy9r7x/5F?=
 =?us-ascii?Q?L8T7fewlAo7QioAJVsbUWUEl+9bUt4b4DKUgZQ1nuoSupwuyeE53K8j4a41u?=
 =?us-ascii?Q?nT5tx+RqP+Eo7Q10PVNJSZ5abnfsTSLDNPppZZEG/jlJU4zpDH/u/roicb4P?=
 =?us-ascii?Q?0q66Q1ub51NqKeyTt8FZMUUYkh4yLA+sEGvgM+WNXMErVqnQPHqCLNCBFRJX?=
 =?us-ascii?Q?9dhgD5AgCB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hhH5EuCXIeMo8DdVkececwX4//dqW7uKjBhFhPn+dCnuhrmTGJGi4RBhPRa1?=
 =?us-ascii?Q?89Laf1ipo+Qy8vY+4HCDhPh9fhu68TLYviViCveY9/H6y/Q7IHoq5/6Lsp+G?=
 =?us-ascii?Q?XTKEbTae8z8p6OKK1gJJaL8lUjFEWO+pdBtXJEs5Uej1Bd2nMrFH86wBGRtD?=
 =?us-ascii?Q?oi+kEWANhQXXnVHk3f2CE2uuZzc/5SxGJurkmpWlDjLMJt+x3ZtIfAZL4h33?=
 =?us-ascii?Q?mKelPQSLp5V1JElVpnCsQT8CF/EceWXEhdeK5JHFLkxWveL9iUpizEfmcElf?=
 =?us-ascii?Q?HUKHcn+fW6H/XHOwA2iBBMeXVGOXFr8FywbR3LUJP4/3UiUaPeGfrysqdr6o?=
 =?us-ascii?Q?RKaC+ocsqnqMQv5MNg3SHfEZ6lg1AuAy/F0lZUjdDnzcTXouwIfk0wQOh21n?=
 =?us-ascii?Q?Q7G6dKOwZKSN51YLs1A1/D9NT9otwYu7HKuaWFdrGtgZ2IOfCDZuSoeWxVi9?=
 =?us-ascii?Q?so5Vst6AbiJdS93r2yon1PGJ8vaCQ6RPWrj0ziHEl1PCnjNCInpHcwAASEes?=
 =?us-ascii?Q?Sk8kpp4fojPrbTl+ZsFVN+vooe/ufwM/DGMFjvceoV9lHAQiYgr5mhQmfMw/?=
 =?us-ascii?Q?etnYHzmKniwTpbuXToHhgUi162vE+i3mj0wHmCvi5WRtE4AIqmeoDTsRKSvI?=
 =?us-ascii?Q?xH84wplwIFQhuY6//TB+I2Rvn5+dmO3zpVuowH5shpuP1asSlLY/RJTjtMeZ?=
 =?us-ascii?Q?t9pI2dRecfzGWsOeC+pLSGDr0XIPg9iFH8B23ERcFJOVIYINtamq8MKsL7JR?=
 =?us-ascii?Q?0JWpYRkMFT1o9yQ289iAhMgr5nH4d/4BG9kclyGe9rM1EgISJtwq+vxzdG6Q?=
 =?us-ascii?Q?2YvEFR7qlkYmkgVuMAfDMcjf14SN4pbD9zy3SWagzjVLqZCu/gnD/OAza4oN?=
 =?us-ascii?Q?5dImr6RvhHx9flhPm77KB8dpRUVeIqZ7+7Nn2FLsLzYz6g8zPXHE5tm6rmqP?=
 =?us-ascii?Q?toqMrkp4NNqJj6YuVXYBUKY4PE5Eqniltm3a39ySiEizBnmEhdfQoLmBEvNf?=
 =?us-ascii?Q?lmEUbgLQRGGP/EcH8GM7Zrk0vRfXfcSFVbFNrTM2bXaduNp6oZTGoILlxSs7?=
 =?us-ascii?Q?4ifloRIK7Cz+dqGiyKSsC/B1vxAbfG8lpRRT3C0BjRXgxfos24sQ9OWNEA1i?=
 =?us-ascii?Q?Bxfn361cDDpHQR988YpUIEyBrXvEqTf+AN3ad1+ayo5mY9782Uh9HgB+C+R5?=
 =?us-ascii?Q?lMG1jmznK66H5x7Ht3DELsqH0Wz2cPfvSmCW1ODsWtr+dpdDTysVFPBPSVcr?=
 =?us-ascii?Q?IVKS8LU3y5t165SHKX99xMUGMIPl3akSdG/KFYAo2o3tpbQ2nPNTHva2Rk/s?=
 =?us-ascii?Q?o/oj6AOnEE2OLQcx53fjVZKD2FAUuPOCo/BaskiQ88BU0BoTmAzbPafN865W?=
 =?us-ascii?Q?JIDnxTfZhENA0T9smNg4U3grfDf7ynaUIrpS/fL+hvFT4ebQZTEwzwn1KKBS?=
 =?us-ascii?Q?R6FqutsqRiwZWXNcWbwD0mKHpvL1G9pQbzB0NRcAvyOE7DfxNpRQN1DQdkty?=
 =?us-ascii?Q?esqWCw1eRuiZ9pNZmjPcOvzGee5ghVkRc6zWGPwfw/9XoNGUmjpXTjylRkJQ?=
 =?us-ascii?Q?aOYCf3MOEXodzaFyCd0qCYvpj2x0DeSv0wIMPYL3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vDrDs3cAKf95i979oI+x65IsIpRc5Nk46m0dZaDsbZRkCvGEDUvvCNAvKyFBOYNjmwBiV4StSs95KsdBSUxhiccqafd2cWsa+WeFA0zg4S4WZmmLLIKDoVzA1BkkAkAULLmXxOI6mrbol2RVwBXh0TUOBIP7VDyI632hRuMZJ19P2dCMwvoiQblW1vnipwSwiPz30R3tDU3hCdwGM2HveRmrvxhmIGMbuKyWynKzb5RXj6nr1ZQOPm2vYhALhuElGsW8LOO9BttHx28Z7h40V8Klzs453dSXq9BIgQqiabfS1wZVxcsy0Hm4LVimWk2OCALaufykHBhK+mIJ+J4aYI1YgPgHDnU+OKYJAjcTU+8FymAAO5eaWze29zgwbVTlyrqSI267uJQ0OCJh3Y5OTaS2xrOQJgVc9s4jtX5R5gcOqw8W8jZsPgY5WBzr5eiUxSdYc+9Du/dC+eOjhIKU0B5HtAICf3ZMsff5p81TrQOkGpUVAUb9DyhT+L+7DJVmp+FRpdA1pzTOevs5AHFUd1avt0aU8tTtigjb0P/68PWE3GVAuMlWQgBrzfYzMSNWV2apF5o/IDXkJdaHjPaceOBv87c4FQxeS8uYjbSDGzUF6JJGf6Jrg0TPMv73VQbL
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee4e631-2dc5-41ee-4b0c-08ddf99f7c60
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:15:53.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kSVU6J/xrXG1qf3BXDru7LwEno4Es9USZwMrYDQwiUJASQtfp3vzTuztJ1eth7xWKdMkQAnoueBXyBYcDsACg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1827
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: DB9P192MB1827.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: hbiPNHx-bebhWtwuF31cmBuo0E0aeVoA
X-Proofpoint-ORIG-GUID: hbiPNHx-bebhWtwuF31cmBuo0E0aeVoA
X-Authority-Analysis: v=2.4 cv=B/W50PtM c=1 sm=1 tr=0 ts=68d0e99b cx=c_pps
 a=ClQ4dI3pA3eYk+DjKaMeNA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=8gLI3H-aZtYA:10
 a=80erYkVLYjlaHgj1FhUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA1OCBTYWx0ZWRfX3bo29u4v+FuH
 tZ458pLKye92Fw4dURxKNC8nk/6uaxBGi5uj0KQXNGXpNH/s2PQYH/zRU4UHD6az7e0mo705u2D
 WWl32659iGi4QjwtW1CurCp4kYdpaXiLkkOo7BmzkcTDsrzL0IBIJF/m1jfJS4nKUYf39QCwI7k
 tTC55uagU6wTdwJWGCeTl3cpDUL8eBTP3GuwqBZCKwXxFtFB3yPVTfCivV7t4l0dmDP1N6P0Bnp
 mmeSjdBuU6bBj9jLSsgz0UPtzxKyTAJK7WsZWUxbW5YnIQP+xZuJlujihLdcEr+KFyZVU8BMQ7G
 qc0L58gDm6cv12xstAsXy1qViSnOFH4rSLsJErPF/Xn6jlMO+6JspG26ZZBqaw=

Currently, the QMI interface only works on little endian systems due to how
it encodes and decodes data. Most QMI related data structures are defined
in CPU native order and do not use endian specific types.

Add support for endian conversion of basic element types in the QMI
encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
ensure correct interpretation on big endian systems. These changes are
required to allow QMI to operate correctly across architectures with
different endianness.
---
Changes in v4:
- Rebase on latest ath master.
- Drop ath12k patch to make a standalone one.
- Remove `Fixes:` tags as big endian is not yet supported.

Changes in v3:
- Rebase on latest ath master.
- Using a generic encoding/decoding macro causes sparse to complain about
  type violations. Use separate macros for each basic element type instead.

Changes in v2:
- Handle QMI conversion within the QMI subsystem instead of the driver.

Alexander Wilhelm (3):
  soc: qcom: introduce new QMI encode/decode macros
  soc: qcom: fix QMI encoding/decoding for basic elements
  soc: qcom: preserve CPU endianness for QMI_DATA_LEN

 drivers/soc/qcom/qmi_encdec.c | 101 ++++++++++++++++++++++++++++------
 1 file changed, 84 insertions(+), 17 deletions(-)


base-commit: 38cf754c15eeb0d80fbf52c933da10edb33d7906
-- 
2.43.0


