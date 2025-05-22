Return-Path: <linux-arm-msm+bounces-59057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDEBAC0E43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 16:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C903AA791
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577DC28D8E0;
	Thu, 22 May 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="BBeyGnCj";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="EXwLLje/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990528D8C9;
	Thu, 22 May 2025 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924558; cv=fail; b=V1h4heIFhFG0loSn1jgUBpik71NpiduVEERkbitLxlyXLJzrh/HmTwqX4GCaqWfRSFDW91ANmvVr4uFMgoY32S1891Bf3ZA1Rr5rlhQxNW8Qck2MYjgxohXt6pAWOT6Q3MYivaGc3pNacK5wpy1aSq3cW/8I22GF4F1tN+shVIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924558; c=relaxed/simple;
	bh=A93+/yXJBt6cHJJaMXDvmL0fTjvXTSYHDxm2xpAoK4I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VZzRJTt+r3O46x+8P7VYTNbHlX1HRdZurscZAuNCaVxXgWbvdTq8dnKu3EMjXK2D4M4vLQEoqozRLCmKggkGx6SSyitDATXN0l+ow2qLlftkeXnJozeVTlBjjyacCp/sxTGwvdealiY+oW7p7zYExdaVvzZaKMlEeLLZ/3NBbCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=BBeyGnCj; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=EXwLLje/; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M4j0Hw024668;
	Thu, 22 May 2025 16:35:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=snKO1CL+hfvbVVNigM0BZw
	/1iZJGopM7Lp6CBuMJy8A=; b=BBeyGnCjbSS5CFFKbLIRZaw3bYctRphklCXekB
	SLeclxjvyaelTbYMWc9mKggZmFmidiGOPbZ5HfIAuONE330xmHMQ22HDosdi58f6
	ptm54PYtq2OSjGjT9It8UAEB5e7Eg+pSIlFzk9ANq1Pi/teSxWwwypcMO61hfSht
	mVbLhUfUd68Kru9AhQTkA/QAwiB0Vs6b02HGvvlXa6asYkr/3ZPdrBr6YDcZJMKy
	DuFDX8U6kQ3LPKlG3Rp9bd4IrICKU8yL5kWgGbJiqm4MJlHKhztvo5wsMzmRPzFG
	c3gd0Ip54UIRdiBBjpzbR83DiLa4tprDZIUhXr7OvnFxzjjw==
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46rpf3ju5q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 16:35:40 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBUslJYhKz7iD5VezzH3pPTl8p0UnxcMY9SOvgWAGU/sx5Yq/kAjUBYlDrsl+fz885RMFhs1ZHrtma1bpgTvFpiCpeojof7vvRyV8Hsqbr94ClkOl36SsDZk9M93QSXty7fDvsmLIBFQSGRKMeknc6kW5jxAXJGq0AGZQ3ITNrIxQrVzOvN5tn8QFCmUE86PkTOvl2Z9IqhIeoKeenSYx9m+soB2zpn2g/2Dm3oS2WN67S9ibxm/BP01fHmPeHagnhYSQLRfKnFZXy+SGNE9AhxihuxivlnlH4ch3FMzIjCN2IjhkOpIbFYZeeSXGk4iiB+9KczRFApEs7or4KjaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snKO1CL+hfvbVVNigM0BZw/1iZJGopM7Lp6CBuMJy8A=;
 b=ix1kFfqyWK1/FwWxFdrBgFe6Y/SZlAWl6/d7HlnZCKaK5e5bsEtOtFwrb3m+yctBTdqXH4hhAjsbrE8no2o+bMm0en+7UKDNPTMUBZHe/BWaAA8shgrzNFq8HYl5crDwb60Fn3xy+ozchq9yLR8efdxyMcoP5QSJDgEXmr/ZC7aYBpZdZBuln1PzLLif0VYLddf0h9bKd1LjJB/YNVhIZHPMx6HIW8BRUOOSnX8udU8x8wb6KJK4U8AlZ281X84cS2zF36U/bNbvtSn3+dhGtdlOZf1MnZO8eUU8u8JShBefnfaC1LC2UBeQv8IHRWsic/bgly7NRGl97VmSU43G+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snKO1CL+hfvbVVNigM0BZw/1iZJGopM7Lp6CBuMJy8A=;
 b=EXwLLje/gdTIL6M0+BTykiAUCmHKIOyPZUQ49q5Il6xzM+rPOleCUc+lsu3S/rREVVBW1me6liw/+VQx4ZJdu6vZ/nnbXlV8a2PZoN9T/3dRgmMk0ymot/xso3s6HKyoOQsjefGS1NbWQ3QqpsRNa6EyEibyyf6BgUadO4BQ6IU=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PR3P192MB0682.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:2a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 14:35:36 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 14:35:36 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] soc: qcom: QMI helpers supports for big endian
Date: Thu, 22 May 2025 16:35:28 +0200
Message-Id: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0102CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::32) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PR3P192MB0682:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d1c99c-e435-4275-1369-08dd993dea14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M+VTLbsv4BVeOYT9bsGkECU5WBO8wWXLGutuxs6J40G1e2eTuOdc69dluIQC?=
 =?us-ascii?Q?vLTzO83DZWdBYMHJyc5lPTyQLI8QlgAIT5axsEdgosxy1e4367k5J6BIuo+6?=
 =?us-ascii?Q?n+7zNYIglwUuktbEqjfCCoGCtn5awLAzYJE9Qj+wsgtUhEc+lZYJ3Ik51Xw7?=
 =?us-ascii?Q?2rJVWVcyQMnATFJulx1gphBhOiiUfKDnXqkDutojv2EXT8LvmjGwnGJE3H0A?=
 =?us-ascii?Q?0nyvlxFfI90A6mWjyyJxFi4VNTWDUNNnPObuo3Qw7dpKK/sP9TgzErmWLDrZ?=
 =?us-ascii?Q?VcWIw9mjymoe9z02NrMcq5+Znp7LuxfKj8U/NZ5qQIspsxtoNCaeTnqVFv5h?=
 =?us-ascii?Q?szaxZYoSUY3mNK2wYAJtgc7RVVa0nLJFiDtD/hHjsb8G7sEF1QPSm6h/waXO?=
 =?us-ascii?Q?21UD9FUEeewu6zkfN/srEJgVr6ZSCvsBk2LbGe6QJ/DzKNITlyTUIZA7uYRt?=
 =?us-ascii?Q?Jz/G0d+1G5CdN2ZG+hA/9phTaVUEx3slz8MPaqkwCbK0Rjyph5Nv1TBzMggZ?=
 =?us-ascii?Q?9keRx+1ERQkj0YsKjCCUczthS25Qf/r9e1yfkXaWrtDLZBtXtE1fXti8pV0A?=
 =?us-ascii?Q?7qwQxOxvtXeI2lv4O0CqX/n0XcjFPQuL2g1eduvOdwnJdtQwPOjhuCaMLFiH?=
 =?us-ascii?Q?Cy55pmg2OtmR6Z2XueE7FZAASIQhasXL+JFtfa4bPqSrym7LkAZhVoqqmFeL?=
 =?us-ascii?Q?X17rYZ6Fzc/Fu1WXwHCQZ9pD8S6tG23/DLoj5z4epOykWr6M/fYS4PysRPXV?=
 =?us-ascii?Q?rQarcD7AOZnXCFfb4cAwK9AjZNkCZiyoZRQTt9DA7C6UCRnsEp/Iqtv8tEEG?=
 =?us-ascii?Q?Vuj2hTpJYjELMkjI+sImkQTOQm6tjQfkV9T7Jngk0y+v5DC4htH0Ndrvtm2j?=
 =?us-ascii?Q?NbbVy4jck62pKONWeYdmD+7qWQsg9yAe90LzSsSwRDcDALznu7jNkNP+1G2p?=
 =?us-ascii?Q?zRgXYlsGmuJg5ZTO8sQeWUaB3ylDREeRXgOqe0/nTPyH5Q4RIyIMwWHcNiFP?=
 =?us-ascii?Q?BUC4PP3Z7wD9sw0Mt7KvSy7KVENwiTf0AzQRthv/M2R73tyeS2ACN1vjG35G?=
 =?us-ascii?Q?zUBbPFQ08LR6FzlZg4XE6ghJZhZ419QRZdT40E13wA1Up00OKDulNTB1b1pg?=
 =?us-ascii?Q?uc5sUrXjOFnbq8zcnPKd6ZS1RRn3Z0c1y92e26bObDgS0VG7B3VrR0rv+ZP8?=
 =?us-ascii?Q?DGQOt79MBF1lpg/BS4IVKx1MZrUVmOuabFLjw6zqES9gKx0F6IaH4x4MfcDz?=
 =?us-ascii?Q?pAYRqHwOU+cTxuZ7md6C/t73yk0+gzy9CEx+qyjEslrLStJcMLf9Fo3c9RzG?=
 =?us-ascii?Q?EDTcKBQWUvWqf0XvXX+Wp2Sgelc7rWjC1e2NrQ2YakbeHdmw3BWtCh9mxVdg?=
 =?us-ascii?Q?gOXHXgnUORcbA7JyCDf/IPm/obUbaL6n41Y9rA/0bo1Zy3t1Fg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l34a3zf8fDyIEi0k3BxwTUe22yPB32Ya5Ddk5bV5A7eoot6dAfyWeXZ3/WWw?=
 =?us-ascii?Q?DQmIY2dH1uNRSXMIPJwgmRJmA3NMYVorZmawA3wF9A/pHlvMPnTrKgm6m3bC?=
 =?us-ascii?Q?CpjswQBnBlUDoDQxEJzd0No5MOQB2yJtlqo6DK+Zv7EalBu1Vtfmw0AgqzEG?=
 =?us-ascii?Q?KENc3DX3FdJGKVlaNu6NpJ7vEznVilynt5KEDe4Y/dn53JCNwB2gFO+t7saf?=
 =?us-ascii?Q?JJzlXoTQKX0q+43NeoEMT8nQTJhW1FWey6EdP+aIYdZ8msIRuAomdeJAvz+q?=
 =?us-ascii?Q?+56h89qnyfufOXr6I6SNVGiJZRyBiEJJIw2pe3wYFEHUgTlPOyQP2XUYlwba?=
 =?us-ascii?Q?e+L2H6CW77mt4TA9JWGz7/VpLM3sMWStu1RoIT9h+UzyWcjylvsR513U2LH6?=
 =?us-ascii?Q?4U47rJor0i1Pro/XmjsWhLKsq85DZ44JQVdAyzvD+BjmTm8Cb0s2Ym4E3v/T?=
 =?us-ascii?Q?ha01JT+YI5sKFY7Djyr6ay374nCNAe6qcYYxn3FByy5AbRkgoALBKooKhc4U?=
 =?us-ascii?Q?kLsC3D/41BZfTf+SjjwdC1XGDrpITjSudlsThBJEmGov8Es5YjpKr9OKSeV3?=
 =?us-ascii?Q?qKWt/yZuxBmt74gb+LoS6NnYBe6laBqWWsX9fq/v+EEXRy4MW9NCCkgP61A0?=
 =?us-ascii?Q?VI1upvjWIb/7Ra7GXhM5wd2nFOS+ig+KPhsa772GWo1f4ghXJmVn8YT2rZS2?=
 =?us-ascii?Q?n+F35XrX290c4KoWYDFOanBvUgT/dg2EacVLqXlASBKaNrKmVDDImGWddepJ?=
 =?us-ascii?Q?gZ7xCHxDnUuVr9WZBR/qc7gwtSnwK/P7bk9uJHMDrdDwJ35xommVUHsWFzJp?=
 =?us-ascii?Q?FALFeAEyozqbcByExRxX0YewzI+OxqfDoNC/RXAYBrhFQCd3SgfL9pDVgegy?=
 =?us-ascii?Q?tOgY2ie4JdWRzC3nODRPta2d3QGCth4dti8lJPFibMpph1sQL1NMZaYkezd4?=
 =?us-ascii?Q?K3tzOljKRmoBREwDXvSnH8wA3MB04Hynh014VVgab/NWL27bKjDaTv9Er6Ra?=
 =?us-ascii?Q?hEVPRAFdYXNHYCf6+AAdk18JlOlgYH5x/WNn7bCJgnmAermmafPekpRvHuI4?=
 =?us-ascii?Q?DClKQP8Ol/jVoeTMZKqjgzBds3LRklhZBDj0YSF+sFZTh2oJn+pUGVMFRHwQ?=
 =?us-ascii?Q?bL0G+xnmbijnTCUED1e8sLQR3NXMzFbctW87HpTKAY+bOakIyiFJYHKZFpHl?=
 =?us-ascii?Q?HZveCaSCNP7I+hB8wjnuuL3bBVGh0XKTPs2k5JoPUHBDCvz9ILsvmf4Iv8HL?=
 =?us-ascii?Q?Vx35vZPtC8iSa2CtrR6WiK9wNYQ1mbuvpWr52ysi0tvkpdnzxld5ueGMAJFd?=
 =?us-ascii?Q?us4HVL12vwNBNJP/JEi1pTUnQ9NoZy4xcK9D5UDVozlwQnt0HHxbIsDVdlxO?=
 =?us-ascii?Q?CtNxLD3ZZK79gyQb9pzrdfI1eCEOCROtRlTHJ1O3ppX5Ur/mFIoRl8chY4xk?=
 =?us-ascii?Q?JNq+8Dgn3C7+Rp4P2IMbBH0CjFKrTSNB2kgHvhXudHDwksBHNxecTZA5GNiD?=
 =?us-ascii?Q?ZGCM/IMjNEuQ4W/heqiWJoFDhQAD0FzKZw5HIzbXdrxmqnb2arvcjZp5oA3I?=
 =?us-ascii?Q?coEyuXrpCp1FSMZcSxxElcNFURoCT7EkqvwxCzV0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rZsgDPVEoSKpiWi9OhAZmpv04MP1ucZac2qjryaUSWJuyEk3p2QQEDxRi0ccztYiOUheqggVbHvgB+O12I51+d7Xc4gLFjeswWVdItKjUZqLSfOcVhrMq9tZcu43v9Rnowy7fK3fDMD9z/tURSKP/v1r2bcALdKgcC+sqMdcKCHTbolDwHVbuWiiqfd1hzIq+z30lwcMDYL0NQ7sxhJ2Ecas32YHUpOnh+CLu1+JDYrQA4CZDpIOsyfzAJfthzainc4YvvOddEw9uXsrYJGduK/Mzu0tZ/tbOISSlm5T+88ZeKaERZHJadmT9T0oPdbT7DgEq/6JGCTLZF348tNCQLjJbJyhRiOEEFWDTSSJhAhiBNxDUmM2rJ3ovghWHTZrogdhBFJrvKVHUljCpyguisuvEAIfpWNzAIAZM0v7fhtYEx7XlkDN7VItz3njbXgjHYlTCF4gDw8SeR7EOskBWn6bUUKmmBQ1gk6IkTn6X7CvbPAUKgDoLxpoNZiZYGXLKLZ9Yg+JoRa63Q+Lfkhsi8IKKea3pASh9AyHC4P+cPfus3wIeE+CPn1Bl38Jw8LJKIwLziN1sonEdifEeVEf06Jvrpf7rBvLdBbWzgfTjdrjjatS9k31zDuKvnFfhn7a
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d1c99c-e435-4275-1369-08dd993dea14
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:35:35.8869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7y/2u24MEepKwslYX3/sgkCgzDdt4P00BjsBIOvLvTLTSA/0urqLZphrGTXCLOZkOebgUeUfU5klkHCJdP+fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0682
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: PR3P192MB0682.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE0OCBTYWx0ZWRfX/K4kxgfk8lk+ Z5sHe8H3DRkD/qtdQP3BNo6OQ9ohjAs8AXBNg4scxoXnl4uEVyVQ27iX+LcgnpC5pC98G9gwLwH mkuvoaqoru5FLJtLkjtjIPJt2ln8JSuaARo3fAX8WOt7npmqJ1YIoAuRyvWMOdJ1pU9e9RFiWe+
 ljCXIQhUTtD36b4XsZaK6/UTqpUpxkObZM8bVL6I6a+wlluej8+3g9v0tFig16rYhsmYRyN5BMm /dqBIJOPMMvYnGCxv0gw0bedRu+Y9M6AiGWcMExS18fUX1ha1P21iFtJAl1o6G5APm5sOu/b98V 8JIKTdhqi2qyBvjxbKW0IcTU/RjFVqfXrpc5nV9J7WhtLB4lKKyoHatX8CUic1hVEKlwCUc1i7B
 nyDMyoMBavnxl8aRMKbOLecOQ+/Z8ODMvnqq/UrI7gzONp11C8AZ6gSWZzoFrgnQtDcaxohd
X-Authority-Analysis: v=2.4 cv=d9f1yQjE c=1 sm=1 tr=0 ts=682f363c cx=c_pps a=ZbF0nDb3NYyigRfKXiLIKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=KkjqMzW8FMtTQ3Q8D3QA:9
X-Proofpoint-GUID: 5w0Mipe4defjlfnQVDg8SohCL9DFikEs
X-Proofpoint-ORIG-GUID: 5w0Mipe4defjlfnQVDg8SohCL9DFikEs

Fix QMI encoding and decoding for variable length elements to support big
endian platforms. Also fix endiannes for QMI header.

Alexander Wilhelm (2):
  soc: qcom: QMI encoding/decoding for big endian
  soc: qcom: fix endianness for QMI header

 drivers/soc/qcom/qmi_encdec.c    | 52 +++++++++++++++++++++++++-------
 drivers/soc/qcom/qmi_interface.c |  6 ++--
 include/linux/soc/qcom/qmi.h     |  6 ++--
 3 files changed, 47 insertions(+), 17 deletions(-)


base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
---
Changes in v2:
  -  Make type cast explicit
-- 
2.34.1


