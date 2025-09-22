Return-Path: <linux-arm-msm+bounces-74388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2859BB8F177
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAE107AB671
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 06:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD282EFD9E;
	Mon, 22 Sep 2025 06:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="ES+rXzAW";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="gMfnU+8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2E2ECEA7;
	Mon, 22 Sep 2025 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758521783; cv=fail; b=fDvjDVSPClXcJVb1sTAEXVzTO9czlWHk+Fq1De4uqeGLBATCHfUKxf56tOYRfGbSr1uu7uGQ4t078qTxHvLxUlQQhx3aiylGmowm3esEo3l0h++dGDaz5do6CVEdHxG4W72CbKJ8Fn4eRp9Qwn0o96nSB32D0S8uyfY7adXLTtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758521783; c=relaxed/simple;
	bh=NacBBp/6kKaPjfAkPdxa66suVcfmrfScFa2IdfsHb80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MHFeW4JymSfNSczwkJ6WAzNa3QzRfSW312UWeAdDOC95w6S0gTdntlhFLv34wke7R67Obsh7mAuzThYWLEayCc+rH1MRMGObJPMZZNyqZVnHlcGg+v6NWS3tsBLbq3RTT6hsSKi3B2z5S6GlGBSFUTrJupDw/jT0G3xsuVK3c1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=ES+rXzAW; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=gMfnU+8a; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58M0EIMF351962;
	Mon, 22 Sep 2025 08:16:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	8p9/Yuz9yhGTaoHh+l5vKyMavKdm26MYjWkIUTH1sn8=; b=ES+rXzAWnYAk474o
	m5Wqn5PXBl5okUCi6gII3Vh6DxjtY7O/Pkuj8BpjUuYxZ2kseaESutEcIlid+H+A
	l+0jjp+EkCmXpVZ07GWnvg4fwhNuJfs/LdRkNJb8XPlrMCz7aKAAljHK4d4nVViF
	os/VFTfoJJtT0q9OegLKgeqodYAH4rbkKM4gKSrzN00mnbfFoWL/UwwWxEXyQu5P
	xr6JJUlTVI3/cOkyYM6zOwgC3oJHl9n/zVMyZMLx/x/+fiVRuW0EBGBIJhj0JxcF
	qV/DozlP21Fh3xb7PDmV4nhs0T2I6H8kAaLPuERxh7+fleuhz/+WuRf6sXiwo2UI
	c1vG0g==
Received: from eur03-vi1-obe.outbound.protection.outlook.com (mail-vi1eur03on2134.outbound.protection.outlook.com [40.107.103.134])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 499g8y1mj9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 08:16:01 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrlm02CXkDlWdmx+/2u5CEARngm3xko1cRLZNA/EdTvrnQ4yNv9KRoKmzO2COSWB2cM5EA8NZWjo0u4xYIAptCsKkgCO4AUmfMyrHrgmaU17iJ86XXh35wLENMksnFiJi15Savyhx6cKVfZaWXY3p3BlOJ7qmtmPHmoPAHPtx+3Hmabt0/gQrVl63RdVbDWOo63tA7tFGrTHlLqS2cMVe0Y+S53uO2qU8EoW/naZ+G88AdF9iDlV+8gNOcT+HyECQnHWm8Bv3t/dl6nWCyKIoDyjishwkZvt3mPv99ums24Tx+Ilkb3U514r7CmC8pgPlt7UmY7YPa9glJGxrqIW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p9/Yuz9yhGTaoHh+l5vKyMavKdm26MYjWkIUTH1sn8=;
 b=aqeJHtGeN2bqx+LlHNtesSv4BDfu6UfoQci0vDM55CWVwmDwpLDcXpcSkR+qp5rETdl1gFTZd5PES9q7bSw7TTtQN5/JgK4q5Fgy/Mp9zCDLltMO1G4tkg1jffqteD81rae5OarRsB/EvqfQvmPIBFY/cvVPn3OKRhfo2UjK8rlOt/hTAc/RH+PXQjv18NKZj9pLwfxUnMifAujhLPvBHcae/FRyJ4GYxWlHrtuYdk+V67ltikTzO31SegmVkEjmVwd0ph/UNRHQJuxsYpFmX4LNcC6Qp1bgHfUDSBQaVUEKBMazJ4gPqg7ITvT9vnBWaAgGdqbIoxg0wBgFA5hEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p9/Yuz9yhGTaoHh+l5vKyMavKdm26MYjWkIUTH1sn8=;
 b=gMfnU+8aOpOKJZPkIz2Kcx/q6xYmpq/uWuRKzxRQ2uAjLTUrI7vHen8kEMu/ErcycWdeMcrEkvbWg46D8tUFv96m3L+6ec6wNbLyeAZLIc9Pw9tNs3mdpInv7khkYLZEcCox5HmPpC5u5EjBpFJzux700P9slyRLrbOFm/rXKEA=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by DB9P192MB1827.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:39b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 06:15:59 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:15:59 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] soc: qcom: preserve CPU endianness for QMI_DATA_LEN
Date: Mon, 22 Sep 2025 08:15:46 +0200
Message-ID: <20250922061549.11407-4-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922061549.11407-1-alexander.wilhelm@westermo.com>
References: <20250922061549.11407-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0102CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::17) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|DB9P192MB1827:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d8ddf3-8a28-4cc0-69f8-08ddf99f7fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jbSV+OGKxH9UBtkTWNb+zjDiYmSHAajv4LvBfbFlC4WhDWd3gkPyXaLB/GVS?=
 =?us-ascii?Q?Zza0uzzO5hUrnmvQkwO9D7z84EmaqWNlcoFHhxuNIAvKR8byYI1bCE1J74cA?=
 =?us-ascii?Q?Nb3w86PkqJH44xTKX83v0cceivUXSZndC5aOJNdsI7X0rPSjj0Q4EgzQTOIr?=
 =?us-ascii?Q?8ocppcFAihejVXc7KSpg3UAgIhEWbooulzw0bHjfAUM6KNi1wzmiZjzHtuXT?=
 =?us-ascii?Q?5inWgcTlP/kpAH1NlrHtjhB+EU/vacWGUpiNUEA3S7uBaEC/MmiMb3nC0Hom?=
 =?us-ascii?Q?kuOO5DkKwDPOrFf85r/rXZDAlkvxAg3f0VSy2SlMP8ip/kk4poBbljovR5Na?=
 =?us-ascii?Q?anDTXGgajEtjJo8WVQl5TdRSNoGoe85Yt1g8w+anyP91Px8KQiGdkTuTieas?=
 =?us-ascii?Q?o8IRX7LrmOsRMwR2+RMXZgyPxbLLlWVWf8HPOOTM3CkLjDwPs4YvjqA69O/6?=
 =?us-ascii?Q?VXD+vxIkp0hLtg4C42OAd4w7g85wj27hzrr/sFhEb4/ZwMupLpnp4xxx1vtk?=
 =?us-ascii?Q?k8Yb5xWV/dYtQuvmZ0CvsWnsUiXLIN8cZkY65J8OJ0q+HA/Uu/F6+KAEJf/k?=
 =?us-ascii?Q?9f0rzrKudNhln3tUtuL/OPj4UCKmvSRJLi/xQ4+fazb5MQFnveVxnbqLR68D?=
 =?us-ascii?Q?gLCi18BWlx4PXOBEsDLFJ4pH/+CdQ5oAgb0VRdunUjjPV0IrlsZIW3R+ohLw?=
 =?us-ascii?Q?HXOpqkQJd+kQUNsNiKFwaBHIzZpdTS1a541TuYC9hA/m+I2W4AHjxnlrESAc?=
 =?us-ascii?Q?oKTIyXVf0Apj/RDISNc6b/sWwCWpbE+KQQrBqLub0YuCz26j/GAmeIwwYNdO?=
 =?us-ascii?Q?HsDACY12TwdoX+oAMl6CycAxZDojDAw0+k2CcOegVlck68FbwFhTz8uE3y83?=
 =?us-ascii?Q?fKq+yJ2T0FQhLUUKE8yxjdXanZXpVIFB2EIJ6p82v51HUv78cKXDRmmJxHtB?=
 =?us-ascii?Q?5f2eOUAT03tOG+CvnEIKN9G5ZBHpxDHhvEif9jumTKHNiSm/aG9Nq/bJFoLj?=
 =?us-ascii?Q?1tUM3BgcBDYw7dTu3U/CV2f9ORgJPBnw6QM2jYKRr8plR2r4idLL/B7COhqt?=
 =?us-ascii?Q?/bRsbL1h9McudVKvmM2eLDeFTVrH1MKxusfVHM/01njsnKJtZzV8eDWnRfQ0?=
 =?us-ascii?Q?Zpz8rwq0lP5iwyWgxJKtN5PQpuLjm5UKWZv286n3qMkv48aHDWdkHEpRYs6s?=
 =?us-ascii?Q?Pq+irG+CO9TbujbSmru/HibKhmqgdVOvLuNFkzKSIx7hzulrYgRgKnoKVDN9?=
 =?us-ascii?Q?2FF171OTMtlBXb/+xrusVA58Jb72L1K6d0cO1T/sPYScouljMWOK/s9soOwX?=
 =?us-ascii?Q?sZUNsuK+iZOdBgneckFyXbTnhNN2g+spMsJQVTJPWIDiaXGWcGGLu2IBnN/G?=
 =?us-ascii?Q?LWya+UOFKncZ5s+7dBUuWB/Z4toHVDo5VGa769Bi1MvRbhMsjnth4fbIbixe?=
 =?us-ascii?Q?WLSqqq1ziOw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XW+R9N+XWXrouLYK51uyeeJ9s0YYz9Wh4bufcLIdbb1xkzx7GcywlpCOy5Nk?=
 =?us-ascii?Q?ZXK/GBxSHSq3BpMVkiDkQntTAoWkKueB9vinc8IPJnp318czhKIyyKTdvgsH?=
 =?us-ascii?Q?C3DG9vkc8pt4wTiXRulkgM8/JrOjFcZJmNkUqw5D92wRyPTR1YLMfFYIi+lz?=
 =?us-ascii?Q?1LrxJL0r3LoImKuhBHJdKCp6lFJHsE56ihUx2vJu7RK+wULrnqD+pPqAtpje?=
 =?us-ascii?Q?9A5BoUKaLvLVGTb+MhfMJPNrTR/fU0cBnClMC1aK/7IIhVhgc1NwPuYD5lDp?=
 =?us-ascii?Q?FL9fcMZGEfP4Qqv3nfZoenFEP8INBQ+F1B1iMmV+Q53UCw74eaF5Pvnd2LaO?=
 =?us-ascii?Q?Xt3s31sPckzgPLnOEcCsujDqfgsu86iK/rjt0z8q+tQWZK7hvjNrsFxSC1c7?=
 =?us-ascii?Q?UnuSp1p3B5wC2ft/GIInzL7NU1pphaVflAWs5ArFodvi/qI5Q5TTLjCxlpby?=
 =?us-ascii?Q?4ZRNMbiwZiYqEEiVGUWEQZVP9+uY8Jc+MXZYEkNo7vWbBe9eS9Y4KU60I/Ts?=
 =?us-ascii?Q?IBfGwdE+NfU6Mb2qajf64QmFCL0iAUyFfs18kyeZ5C/uLHQ3GkmYn0NnkNLy?=
 =?us-ascii?Q?hZkebpUMnMaqxHws9LCzWbs0whNZ2chRR9EEgU+g8akFGDjyuogDpgViRAts?=
 =?us-ascii?Q?ov5wf/1yXDVyTcZHJB4GlEI2oT5dV+LCFLhUo01xDF9XwK5pPJOaS25Jkb34?=
 =?us-ascii?Q?39BC19zsj3wC7ibrHgH75A1Gg41EHwUJ6DKY+IKWViI/Jx6BkcrFfFdlh18b?=
 =?us-ascii?Q?OJ6uIyqf4/1JIQz6zu5sQu5sDg+5Ej1IdjVzrY+OUuss6uScxSrtRIOmAQL0?=
 =?us-ascii?Q?JrMf/qMYDgvRv9TGAX4eYv9y8yQdYXWjwUXwYkfTpuxI7Dph6ps9wcSM8v+b?=
 =?us-ascii?Q?73U3Ac1kJvJn0XkIdJQnIXCwH7eA1tO78nuJsZYz5GI5bL5fU6YHndlndijX?=
 =?us-ascii?Q?TLV+vMMrHAldMgkTW9gk/NXFI99l0zx6a9MeAZacJIpd/970Kjbq/Jg4fWha?=
 =?us-ascii?Q?gSWk4hb9Fg5Hlv1mDMJIfKgcLl/DEv0MhOvvgvr/WqX8Ax16V8izz8QuxqX1?=
 =?us-ascii?Q?ZfIZLeN5iCKGsdUdtTPqDcJaHuqREd4xD935BceCrg3aAOGnL/x7zjjdhyqt?=
 =?us-ascii?Q?65+cHqrWyKJTDi+gsn4tQdokjFdGchCKNyuQlXApZNDBwoevBrSqzIpogInW?=
 =?us-ascii?Q?cSJXME28eIJWCPqjugp12rBNma3YiibLQdWotU24Ps3dt0LB9pwg5BJVcLKg?=
 =?us-ascii?Q?znY4cYB/jV79MIF7qUYp5B8HeopgrkZVm/u6R11mTgqvmyLeNo3ATaFr/Xg/?=
 =?us-ascii?Q?5PDPOoRLbfYLRkIYy3V0vz0ZLKEmKbsPv3gPYRkrMvXYL7J5IrFxH30Ckbhm?=
 =?us-ascii?Q?2zaMHjYjP4XQmf10dTz94wvfAIXqJUc4+mTGGRkzVhkBAR96gdcu4mZaxBMg?=
 =?us-ascii?Q?ZPpDjWICzlr6ntqKDRwDSjKVg8tf+X97GPvpATbx11c4S1zHMC+gCZjKmCo2?=
 =?us-ascii?Q?aRZHnk8UDp9yP9Y0GnPPDvR5S80iyvXZs8efOCVe212L1p4nopibBeUutf5y?=
 =?us-ascii?Q?1C9If+uhvrRZeDUPGWCLocRYfIKD7D5+zkiAsyVi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	72CW3qQrwP1b1DQK+81KOkICAvY2ZB/dq5cfoVp5p76dOTdoYNz0DM9VeZb4kJy/3NsFzlQ56aBXn41/9lgqdoLP9jODEP8zl0uTyj6EB2+ePlpwU+RJv61rtuAyD+uFhdqgCa6c0uWt5gbfomFcdg7ShoxqKYWj9WoXxhCnRrfrCSe9D4PWt9vrqb8/4fLszN/xaDOqHOH3myjzWjhybQoF0BkqbNZOq9EMIKfnVUDO5bi8nmv+xaeLJAZZcYZV5oZkdvSwmuR/RI7sKcZ1gsgGl5WI/eKplmaT/+GpH/rQ/KsrJUOCGC8TzHFa85sKzwEoj4S4Drxp2F5vgY6Ho1qwKTZhfx2cP/y8u7hC+VLqZa2LGmSvdxVeV6vvF11aZxxCMmQZlYSdzUAcK/xk7IT9x1bpjss4faBSrAC40wW4Kf4w/adcorQPiDUgrRJN/oFbcaSFDvjnpcZiZEsr7QK79vmACSpvphJBq1NcbZ7cvsghOGxNKwq0P0x/cmvQgpY9yYasPrx60X+VqyQHytqHKRUQkirrnrTI6h3juQzgalL1eRZUUNqq8jUntDa3ORLmS3WNMro7TyaXOOenwqU4p5CE4EoMv13xxHSewdV1m5SxYPMBX2RpUEDVmqfd
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d8ddf3-8a28-4cc0-69f8-08ddf99f7fee
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:15:59.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikCI+uqSQIGzMAmtRJvzewo30RavpFlyY/5DqNURjqMiMUjvv2TMmj8IYHyRc2YX2L4hNbXXT+ha3B63CDo+cA==
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
X-Proofpoint-ORIG-GUID: jVTtpcDcGKp9lcpiVUyso66n9HC2-21V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA1OCBTYWx0ZWRfX2vrWdZVLksBm
 P4KfbAT7cakDLkjKepM5HpZdQYJbR9Q9NVKVMtnIMccVnjF95I6eu45UIkjZEqjgDaub/cNceNs
 Q11HCZLYQdsjsrGe1Z8p1vd5OiZCMOmVgglCM/zi3v9ATtkgTXE8zhHU+3na9EBtNvBtaYxsNih
 daIxFpLDIYs6g6VF80NjAN4aBPkoZrf4sHdHHbQHXgyfzHgi72w8C3BfQ0ICG5UivBokR+WvHxY
 04ByBKjjBPV7QrHwT6cYgtPWhbU6KWRL14AdMzoO5KSjdufIXjnuPVVB4Ite/oihKcZfHfgS+Xg
 /BK5a7LoeM8luZ1nLw4P4YAHOphakT7nVafri6gGyMgjUXMu8VlqThW97PbhCQ=
X-Authority-Analysis: v=2.4 cv=QPJoRhLL c=1 sm=1 tr=0 ts=68d0e9a1 cx=c_pps
 a=XzC4a13AuVTdFpoKR1EXtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8
 a=T0L45qBzl8X6T0AR6ckA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: jVTtpcDcGKp9lcpiVUyso66n9HC2-21V

To ensure correct handling of endianness in the QMI subsystem, the
QMI_DATA_LEN field used in host-side drivers remains in CPU-native byte
order. Remove unnecessary endianness conversions, considering that
QMI_DATA_LEN is always of type `u32` on the host. On the QMI wire
interface, however, its representation is variable and may use either 1 or
2 bytes.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 90a48fa7ecf4..b92af573e715 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -396,6 +396,7 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 			break;
 
 		case QMI_DATA_LEN:
+			memcpy(&data_len_value, buf_src, sizeof(u32));
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
 			/* Check to avoid out of range buffer access */
@@ -406,13 +407,11 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 				return -ETOOSMALL;
 			}
 			if (data_len_sz == sizeof(u8)) {
-				val8 = *(u8 *)buf_src;
-				data_len_value = (u32)val8;
+				val8 = data_len_value;
 				rc = qmi_encode_basic_elem(buf_dst, &val8,
 							   1, data_len_sz);
 			} else {
-				val16 = *(u16 *)buf_src;
-				data_len_value = (u32)le16_to_cpu(val16);
+				val16 = data_len_value;
 				rc = qmi_encode_basic_elem(buf_dst, &val16,
 							   1, data_len_sz);
 			}
@@ -695,7 +694,6 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 	int rc;
 	u8 val8;
 	u16 val16;
-	u32 val32;
 
 	while (decoded_bytes < in_buf_len) {
 		if (dec_level >= 2 && temp_ei->data_type == QMI_EOTI)
@@ -743,8 +741,7 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 							   1, data_len_sz);
 				data_len_value = (u32)val16;
 			}
-			val32 = cpu_to_le32(data_len_value);
-			memcpy(buf_dst, &val32, sizeof(u32));
+			memcpy(buf_dst, &data_len_value, sizeof(u32));
 			temp_ei = temp_ei + 1;
 			buf_dst = out_c_struct + temp_ei->offset;
 			tlv_len -= data_len_sz;
-- 
2.43.0


