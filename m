Return-Path: <linux-arm-msm+bounces-100036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMwwF93WxGnk4AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 07:49:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0283300BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 07:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 317BE30099BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EF534B662;
	Thu, 26 Mar 2026 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="YLUwqlMd";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="axTseKru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598452F5328;
	Thu, 26 Mar 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774507528; cv=fail; b=OOXL+5UtqQzv2jiXIwLwxs5J77VaUDDOkfAla6fDNrAtuu6HLi9QLgQWIAC5mMkv3OKlcBd5N9BGLl7zhMHw6/N8qngJVpBBGYK2RrcajbnSs8W9LsftCp0mZ1yrNicYvG+rov/4ILfxjQ6DpB7WZATrDQmue7pcfE/A0lzrYGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774507528; c=relaxed/simple;
	bh=2a4BZ0Uy+cNWZZV+5U2PV1c8UTE8by6u7xJzjLTWDCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ekvsKbWAM4XGzAR3ji3wxtieLMhznxXGzQroP3O3XrK/a9NDQ8qu78kJlY55ablO1WM7YlUBA+T4wO/TVfi0G3h2CVWyJwMkldBKMI7nMDdP5YeQiioan/afzx6q8LYsKF2vU7YvmgB0Q/fPO3OOFTt3c/oeFPDRUYoVBoUYGxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=YLUwqlMd; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=axTseKru; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6BksI3770347;
	Thu, 26 Mar 2026 07:45:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	pmcL6ax/wOKc0qi4J4vXDVwwOn6khAwzhLEXlAJIusk=; b=YLUwqlMdKEXh/E4u
	X/zoOcv+9rCQqTp19XcrmgGpfZVQabZTosMfVTa3Sc76yDpfvagQZDmffm5iMaW3
	iJFibSz2ONOVcF/Ocpg9dvyMkZ/7PHTl/FGUKEuKmWDBJWXmkyDwkn6K5xu/apvH
	lAcEu31uh1WIxTinhhkpo2LEK6Ei0xwL3d4o7JAzHpJh3JeEuI9J3yWNjLA0GDTT
	aYVFKjwpXZJqhNFv05UNE8yNSb/f0d+JCrU/fo/02UruUtinkV+875GFzpnurzyu
	fQ/GSe0Yl1N28dDUPC8Q5AgvMce8pMGdieEYC9iH0kLlqUmx47JLCtwQzZse0aem
	6vUc7Q==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022088.outbound.protection.outlook.com [52.101.66.88])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4d1gjdd1sf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 07:45:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoWgddGJB9X7ogKT7z7kd9MCs7n1y7rTjrbHocLxnducqGvrrIqXUAAw3PHec5B5lY8pE6szGNOT3da+U7qdACZcY74YHPf6PsOQNUShHIMbIq9UHK4q+I8wDxUsuN6KpWjJ8K1+JWnaxT+oYiK4XVwconSJSSD180+r9yKMTRjE+PsYgoT76zbA6FDjfazY5mRAraw/JfianxAjAWQRIHnAa14EXnUsf7UTw82rpmfTsfuvNmE7lIB6Z9yrqQI2+o+6Dz+w/6XJ7apxsymM8ZsvxQbibgTD8rQ57nSMc1TLkx7OG2rs2UJLcaCLYqgPj+wBMAUqcO8N0YMR17FOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmcL6ax/wOKc0qi4J4vXDVwwOn6khAwzhLEXlAJIusk=;
 b=EnJXVoN1HJVFRinEe5iyi7TelZsqvE1uhrrWLDvhI66bTinFydCphSgUUvW/+es8L/iV4oo30aaSP7bCpyjCnTgN8+rTk3lVElcyVFp5QqaPYdtABRhoNhSnU6T9rtrkBHEJf44GVUzf5pmOJzWUKYnDagCfiGx8zmLFbidFAVgB7kyNDxAgCCEP9CCgQ866gP83exNn/LwNCdeb7Sw0oZc+usOUDxiLeamtCrzmJtB4BWUXToIX7K14tw9ztPw+qHnVoKuV0433WJ5Vfar8nFPmkBgQw4S0o7h6yy2zOuZH1CULq7gdIliKGWRYVD/dOTl2Q9jgEbIUECzGRsPhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmcL6ax/wOKc0qi4J4vXDVwwOn6khAwzhLEXlAJIusk=;
 b=axTseKruhX/hsbeBEFd+AxTz0JqLMQc0Xt6LTw0hukLD2ZnE9hFj220KUtvpHwXVYNfv64h4aLJlWX9ZzOiTbszNUswzIW71DqsmVDwYv+rEVFfdh5Hh6lvMxER4oPJQGi1D5Hik48fnWWfptwrfXKyfp/EULF4HIUHI/sImgIw=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by AS2P192MB2195.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:64a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 06:45:11 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%5]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 06:45:11 +0000
Date: Thu, 26 Mar 2026 07:45:07 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Simon Horman <horms@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: fix endian handling of confirm_rx field
Message-ID: <acTV86xU6piDih4B@FUE-ALEWI-WINX>
References: <20260324-b4-qrtr-fix-confirm_rx-on-big-endian-v2-1-674fb3f4865b@westermo.com>
 <jwqcbxfhnzbxn3iwvoe3shtfttio2pjsah3pkwknzqvjx4xfp5@nmfkkgrjxkhk>
 <20260325180737.GM111839@horms.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325180737.GM111839@horms.kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GV2PEPF000239A4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::225) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|AS2P192MB2195:EE_
X-MS-Office365-Filtering-Correlation-Id: 618a345b-6b75-4e7b-9d20-08de8b033a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G7Uw9ML62yEAYwtM3Ics8yi1JwnR8bUiXQKR2X6QsIj+L8tPFYGGFOSLUmPoOQSJQD8+2JZRP5VOlivAyB339VngC4O0kX94g15RHLn4tHWfWgND7h+JaZDr5aZgRLeW8LxpH0fNmGQRKaLX2Ze1fKIVwGruEreP0KxNR4wL7ytgyQRMz9XvrModd8LaOPu3D1E7Keq6uapSzgoSNnty0hKqGEvfu7Xcrdn0jlHHg3YWiqkn1EkDGWEdkZMLxAI7Mz99lbbjR2u2LZWaUpU6nYEko0U0yZEfjNwM6PXFI0bk6ryIId2JACKbohnBVbm0HO6vMRG+85jGVBjn/EVi8zpGJ6rl13VNRpt1OdWovQ8p00Oy9nuV8m9r/qrMpZ0ZYt+sLx859Tj9S1qA/WVOf/eSn3t+JydULi9h/oiOxf9yosR3g9ZDS+idRYCuI/bpr5XGKxCtVfWMBgR8DM3xFx5hfOXelrVt3K/4y2W3VUYxEmFo4edhO04Kh6rec6JokGa3yHfBnLo4GQh8ILnb6s7s1GEDiW0yH/cq4hZYnHhDsv73t1sACxvueAx+4WLWdOOuW/AHtL7niAObOnS58jcSMZRCkKfZ/wQJgj+ebUrAe+4mV/TbOMlHlbhafvlUYAZxf76aZhCZaLcHM4MbYT2U18DRAuq/XTgRwMMtJWExsPz78wMbR1YfB8lcggAAp5TKQYUDq51y4ze+i+Q/VgZK3Q6SvS1ihltQVvWxvuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWErODRXb0lQT1pyblorV0M1ZS9nbmhsL2x4YUtJczFlU1ZlSEFYenJUQUtP?=
 =?utf-8?B?MFB0QlprdktTeEFqMUZHeW1La0s4MUlLdCtucmJDT2xSK29kdlExM2JKS3E3?=
 =?utf-8?B?dXprZWFZTUoyRDlsbDJselV4ZzhiOFJsSDNuNTBwNVFyOWh3Q0x3TWM4dmp2?=
 =?utf-8?B?R1pPc0ZRTVBKWHdUb0Q1YUhoYXpGNEZGaEQvVFROT3JIam53bFYrd0NFNlhs?=
 =?utf-8?B?dWRPcVV0clFNOXkxOHRHZG1ZdnlMam1Zdm1mL2daQXo5V1p5OFVBcHlac2VG?=
 =?utf-8?B?QzBIdEM1NFExcGg5UFdHdFdwRG9QMnZFdk9GZjh3dlU3QUtXVlNMTnBJNzh5?=
 =?utf-8?B?TTdwSjhCMktBZXVQT2w4OERsd01YcVd2WktORVdLT2U3WmpxWUJiR1k2Mi90?=
 =?utf-8?B?dmg3Z0ovcjM0THE0TXpObEdobzh6ZnZPellnVXBjUDNGSmhsMTJVU1FMQkhP?=
 =?utf-8?B?VmdpNnJ0Znl4MEZVQlJLTWY0M2hPZ0JhT3ArV0k0TnorSmlzWTdpalIwb3du?=
 =?utf-8?B?R3doSzNyamxnbitEdDBEa3NGVU94eGY2WEpISldFTjlYcHZud1lzamZ1eGNC?=
 =?utf-8?B?aFBlci81dnl5Y1NOSWh0Mk5CclV3eU9POUxvd3NJVllUbXE1SUYvS0dDTjdV?=
 =?utf-8?B?VzBNaHltYllnYXZLa1htaXBCRXhCWmhHODlRdE5TLytueHpZamcvYWJYb3lX?=
 =?utf-8?B?ekJoZGJoSmMyZ3JpclJ6c1hqbTZlYkdRcmpOVEpmSnFrdmU2eTRKUVJKR0hm?=
 =?utf-8?B?UExLNEVGRS95dndQeTVrb3lDTFk3Z0FSMEU2bHBmYitpYWIyQXVQc2ZGUDBO?=
 =?utf-8?B?OGttVG5aTW1iekpKT2pmY05kVWJSLzFmYjF0ZlJtaTY3MFZCUEpSTVJpN2JP?=
 =?utf-8?B?SWw2UWZrZGtyWlBoNmRRTDNOY21oMTNKQVA3Rll2UTFjZjEvMDd6aFR3Q0s4?=
 =?utf-8?B?Szd3ZGNPQ3dFbit1R1dpUzJ3M3VZSHRuVlBKVjV2OUpxYzZMZ2Y5TmdlQkc5?=
 =?utf-8?B?SWEyejl1Y0ZzaTNGbHU1bmhYbzJYTnZ5VkFXdHBPYzg4aSt6bnhOYnVhbE85?=
 =?utf-8?B?V2VkbjdoQjcwSXpVN3hYcVJONXRsbERITmhSQUpJbzk3b1JNcXpUUjR6MXBI?=
 =?utf-8?B?aWhoUEo3bE9Yc25odk01UVR0WTNsSzRXZVR1eUdYZHNQM0tSdkExeHUwMGdW?=
 =?utf-8?B?UmZVM2ljODhjQ1ZQdXF1d2U1QkZic09ybDR2b1pHZ1krdExiTEgySDBrT1lM?=
 =?utf-8?B?b2pJUW90S1hvbzJaejEyZmNjSVBaWmpvTmk1NHNFLzU0WjdSa0hDL2RXSGFY?=
 =?utf-8?B?ZmdzVmZlK0VSYm5mWDRmKzNlZkJDdW44bEFlK05HY3kvc1FmMk5DcHBNK0I3?=
 =?utf-8?B?cXNnNlVNNjh6aEVyekpzSFIwMURFdFFNazJPRGQyRkwyTTZsaDR6OWZLTkZO?=
 =?utf-8?B?K0Q4THNEK1RJNUJEandvYjBXZ2RPdkoyaEV0SHRtdUlOL0xDcXJGb2pJSDg2?=
 =?utf-8?B?U0c5MXRSTXpLWFpzL0RadE5vbzlTQUI4NGVVRG4xcWtyQnEyZW1ubG1KQXQ0?=
 =?utf-8?B?cTZlaEg4SDVsajdwZm0vYzVieWxJeDlZTno3OHZZa1lVeTFNYTdyMVhpaHE1?=
 =?utf-8?B?R2pvSzlHck9obS9hZ0doVW52WGNIY1NJeVpEdHpySU9LUzltTGtQVmJkVjZP?=
 =?utf-8?B?T3QxS1ZWZnJXRHFmTXpSVCtsZ0pITTJyWTFma1h0SG1QcWo0cTFTdDV6OVpD?=
 =?utf-8?B?TlhjemRLdm1tMzF5WUtLS2pmNVF1bHFvTXU1ZU9YN3p6aTNKb0s0anJGbWRq?=
 =?utf-8?B?d0hzdjBydzM3bE0wYXZuazBkdkZEdnh5N203cXJwSGt4VElzaTlKQ3ByYS9z?=
 =?utf-8?B?Y1E0WVp5c2pZa3pRVG5rZVVUV3NpSDNqS1JDM1RSa0VsblhnN05VV2J5TjR4?=
 =?utf-8?B?OW51RWVJcFlsL3VGRWtQTzdNenlEZGx6SHdrT3RGWXNCMHNQVXN3MjJRdU55?=
 =?utf-8?B?UVAyTDYxQ0ZId2FMc2Z1N0RLTjlueHU1Y3dHUmJmVlZ5QStRTm9YMTkwWFZ4?=
 =?utf-8?B?YzhPcm05ZjZEN0s4aXNxMW95UVl4b0hkS243Sml1RTFoY3dwRGJ1bUZLRkpW?=
 =?utf-8?B?dzBPeXZDb0V0K0wwMnc0d2orK0I0ZGVvTGtDK2puWGRnZjdweExWVlovSHAr?=
 =?utf-8?B?WWhOeUlNTk53OS9RZUIwVHU4Q1czRENSdENYcXM2d3NwQzZRdEdyQ1VzVW9U?=
 =?utf-8?B?cE1zQVYzck1FUWcrKzRwWnVxbnpUOHNYaXVzR2tDMDZ0MzFsL1hUN2RwaXBt?=
 =?utf-8?B?aDdnbEVrQVQ0TUxvVmt5SC9HWHc5YnNENWRiVXJ4eXk2Y2V4WGowQT09?=
X-Exchange-RoutingPolicyChecked:
	ecK/F0ycUnhdKMstRDfBfTziyrWT1/0Wx01nTLuDh35Q2fkG07w3d6iuR7TLb0A+xI5kbyegpaAzQ8sxDLgTG6sSR5bUvZoVYNzIu+2//GQCjRNmcslWkj2nT+wmj5i6ZmWyb+xyh0L0zf/smaJuXJgob7Z9RnJNzzdM1I4Lh4JRsxRuRIl8zQ8twMgZj8Krn88LIWv8VV3ZQyF1rVuU2Q+nHDkXD8idRQE1aSVWIDj4VPtA/66EEpBg4Nfd1NrEd4E6T+U/F24kYOn5RBBLrAoZEEsLUO6Nq0EKoLlh9w7EwK0UZqb7gN90pGcv9Pqs/WlNovrXtgCh814llenp7g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mAOvduGhdTPqK7l9uWi3ZK7i8lE5Anh4naJwIjJ43JyK5U7vXDaPD/PPmEFZkL3mkCSVhZVQx8jgUcFo0i83bNm6982NqyTuefHBcR1jYeyslbx+ird/M34bzA5T03rdhBdOfPnI9bDZfqLBbToHFXo6awz6/Li77CTuC3DYcEsev1bUfdM2S+fBq1EzYouaQ+Bi1fOATQkzqGrnGSJ2Od6cLpdYHs+QSwp1STtY1g9Y8mQZmm3LHNxr7j9tD5w2y3+MCKQ3b0/D8PlhV6fGfeakViUypcQVK7mHy2Bp/liQznbD3f+x6Lg77nCJQFTrMQJNMrIUgTGjtnu1qS63IKpTDLBr7T5PECHwfdx0Al04nV53xcMCwNykSb7No/N4ESF3tkEvujPoCMK/M+1qnoixDzrE5pTsWXSHtQiwoYSR2iG9Iph9un90gKA/Yjf6GUEjXGCiToPuyQnYKsPRGjT8qG2RGsX9A5InXAHq1ZBR1H+N9Tn8yZ0hRLX5MwV1akzJVc5F5B5FXDs1h+bzbx8B9Jtl92S8zBaf67nTc+MkZGq08D1yO4DZqxSjApjtO7km9WEODjlXeWEBbsF4EYfA129HlX68SRuT3pfHDNZWQxiKpwC7JlY2TWo3la2z
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618a345b-6b75-4e7b-9d20-08de8b033a3b
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 06:45:11.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcRp5WOMsII6bcc/TNOOZ1JxkvEl/7A+paj2O4CVHoLII3kf7xeCCqXZQTwdDd8rMFH0/wKUBk/altTZAHR+Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P192MB2195
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: AS2P192MB2195.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA0OSBTYWx0ZWRfX8UqAOdkTDLia
 E0im/wfWCEGbIFFRwjDMYXBK1wjEV4+QLDdlAtYHPOHX9WQia9gE13XFBGy+RZdCt/W4svLKpmk
 rciwI6DHtjAp8GnyB1Pw0XhIUM4gyC+fPlXR+eemg6kr+zRJIY4riCQQJzJkpyiHKZNg3Ys/whZ
 lPDd6ww0CTlvL5uWZ3f7kgbCwEFkZRqEtEzfOPb5SkrabJ5hqjDCpHx+GlMBTqh4GyjGkn8NXV6
 VCqvzh1rnaDYb/yOnZ4zLybxSnBsXkjGJ3eujft0zHL9wHuf2Uw/zEJ6IMFitUBV/WCI2iV+YBF
 abPQGGlsBnnjNq0xmDsVqgVH7nnTOhSyq9YgzgRQAn4c1h34bkfRb5tsytEFn98x9DyjcW8xG6j
 85ghcPUP362QA8d19OTGXYxTLkg5so6eK/O6kZ4Yit7nAFiksPvP15UGyBWQm0Y6u7Hn7jFoAol
 BlH6lAiA0YZ+LURy36w==
X-Authority-Analysis: v=2.4 cv=G6YR0tk5 c=1 sm=1 tr=0 ts=69c4d5f9 cx=c_pps
 a=dbUzIFQRYww1ZHHWNiTqxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=VwQbUJbxAAAA:8 a=fOpmrFcOuqVd7k5ineQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: 2KlmEDiWGhYvc97mdY5u48G8mk6kUgrE
X-Proofpoint-ORIG-GUID: 2KlmEDiWGhYvc97mdY5u48G8mk6kUgrE
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[westermo.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100036-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,beijerelectronicsab.onmicrosoft.com:dkim,westermo.com:dkim,westermo.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F0283300BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:37PM +0000, Simon Horman wrote:
> On Tue, Mar 24, 2026 at 01:28:32PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Mar 24, 2026 at 08:50:33AM +0100, Alexander Wilhelm wrote:
> > > Convert confirm_rx to little endian when enqueueing and convert it back on
> > > receive. This fixes control flow on big endian hosts, little endian is
> > > unaffected.
> > > 
> > > On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
> > > apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
> > > in native endianness, so the conversion isn’t strictly required here, but
> > > it is kept for consistency and clarity.
> > > 
> > > Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")
> > > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > 
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> Sorry if this contradicts my review of v1.
> 
> But as this isn't strictly necessary let's target net-next
> and drop the Fixes tag.

Sure, I will rebase onto the latest `net-next` repository and send out `v3`,
without a "Fixes" tag.


Best regards
Alexander Wilhelm

