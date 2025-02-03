Return-Path: <linux-arm-msm+bounces-46827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4EA265F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 22:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2060B1885575
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 21:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61669200121;
	Mon,  3 Feb 2025 21:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MMCYrqEY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G42Duz99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76893201246;
	Mon,  3 Feb 2025 21:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619112; cv=fail; b=jeD5CxxMpjgWnPmaLOOowxwfVFo3YhOR26B9EKPe3jWvdz92Q77h6XZQNDS3o0azJJi4Io9NrVLeKiO9sjn+BCUMLpnKFxt2/7XO92zonf0C1mt8P4bmezosfnv43xYTX6YmIAq0sxKpEuRmoHfZrdiSd1qAYqF8wE2Fc5nfI24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619112; c=relaxed/simple;
	bh=t1YRvnyLgYotm5ZltPY0npIiAHZho4dTRfN+3z/seAw=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=e4k5gKGe1cGhHd+jiraWzXnQISYlQz44ZFSyxuiAWuDS+lDjaqZ57LpeeJf4Srs0IvWWW0OqU2/yiFlwkmDYnTeqqNHuAZN6PRTQbl6IoyZFwqElfJanIsDdSK6yrCCuq6A6EZ3SbuJrljHjiUkWHwAyk7uWFXjdodOe05TnQD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MMCYrqEY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G42Duz99; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JMuKv009139;
	Mon, 3 Feb 2025 21:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=BnPP0tynD0HlAxTVN8
	4r/a9ci/chwvPH7bCl5xD/sos=; b=MMCYrqEYK0NLC8CZdzznHNJT+qhrKWhuAO
	JaL5AGO5NjjN/s2GqanHHHvZ39WgfzRwd8xL/00OgwKw1iR32aU9FaHjUteZsA8o
	BuREQaZX3oVlU1JwJ1DPHgDLpcReKqojUl1VisE+2X2BcVgRVzTwMJvqZubEV+m6
	nvTUl4Nn9Ok62wQeEUPT97diu754AkmQhEP/wVUgLmSIDgJH/FVmfvLpzDp3jiIH
	cgm68KoqSjjrUPfpZJ63qgSsi4kXB1z+hsjvKYQdyONVzBFnV7MdTW3wlRUJW7/5
	86R5DOFY0kUeu9tNSV2OiebhrG218/te84c1qYir8tN7Qe0a2Usg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhbtbpt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 21:43:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 513Jf1TX039126;
	Mon, 3 Feb 2025 21:43:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8e6xde2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 21:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Np1iSHnBu+7eeGrfbon6/n4qgV6+cnQVo/RbeE92D5lh4JCFpTo4FNEwuSp6uzctqhUxmbg3BIrKDSI+CCmfPup5vTVuUSmplXph+k6wPYPzOl84Ba1Lo+hks426BMrmHnkFlbOPvsSfgOP8CMbxXc4cWdz6g7b7sIRsNDIVN30WNYCHoRnNse9/iyBkfa9fkEZqXXWkYxxdk19yhyWbVOCRn4hKjZdbzaK/a6iJrJVJSSlXzRVfLPcMEX9vidd3a/ccD7vxJtCrlJmPzTMrUps0SOm4qIJPbeAjytdenPuj+54LZ8XhaF6a8lfyH8CtecGxUinQSVGAqsZAsULwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnPP0tynD0HlAxTVN84r/a9ci/chwvPH7bCl5xD/sos=;
 b=sFd8AIEHt1IJL5VcO/d035lZiehaYdvkSkoHCqB6n5PKhnZjzyxpoDwUoJqioo17CFOVCDic2dwFIN4u1juUhy7KVVGViJmQAflSR/j3LFICSCxK4hCZIyqHs0R5HhggYwhvNZ8ws64Q7lWOuEtB739TnrUdxmYRcT842LFc05Ng1iIg44zPQ94k4swLL2w5A3CWb3FyXzeMxh4yaFuM31lDH+5TochHlU9zCgnwTm69VFfAeqzlfrPXhyk3Eq/Y31RHeCZqrKRo2Zt9fLLVlmAbigEuuj1kRlKH9Vh8FUswLHv8A8VXPdZ9gzvUUsKB8JhmEV6M1zuBuxxKZJAaKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnPP0tynD0HlAxTVN84r/a9ci/chwvPH7bCl5xD/sos=;
 b=G42Duz99R/z/sQ/BqaYxK1posGemgzOP9bvaIVNk3fWC1iGV6yry8c6MXmW7CHSH2T9rcLiLoXq9sBjF2Pz86jwKppWYu8WngKLbLCAYMHZWE+ch9CAJiEkopBDSQ07ZAfUrb5npUAWb9FjgYAuKmUD9xvXr9YgtK9+vudLywf8=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by IA0PR10MB6724.namprd10.prod.outlook.com (2603:10b6:208:43e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 21:43:55 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 21:43:55 +0000
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian
 Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
        Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Eric Biggers <ebiggers@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, andre.draszik@linaro.org,
        peter.griffin@linaro.org, willmcvicker@google.com,
        kernel-team@android.com, stable@vger.kernel.org,
        Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 3/4] scsi: ufs: qcom: fix dev reference leaked
 through of_qcom_ice_get
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-3-1ffa5b6884cb@linaro.org>
	(Tudor Ambarus's message of "Fri, 17 Jan 2025 14:18:52 +0000")
Organization: Oracle Corporation
Message-ID: <yq1wme6hfgc.fsf@ca-mkp.ca.oracle.com>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
	<20250117-qcom-ice-fix-dev-leak-v2-3-1ffa5b6884cb@linaro.org>
Date: Mon, 03 Feb 2025 16:43:53 -0500
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|IA0PR10MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: f5bbb939-0614-467c-50bc-08dd449bdbcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yJWoi5HYORdOOvS8/8rFT5ZybkLoBiir9TlCqyPYl1ywtbNImWY/Kqu1/V8j?=
 =?us-ascii?Q?je9JB0lzHKYIIWk0ShZ6AdDV3GReePxn8DpHzoFJOUP+U4JyQdGKzng4+1l3?=
 =?us-ascii?Q?NfbC8fhZmUArAyNANwNP4lKi5yfkLRindQPrhuVX7iy35vYCM+fiit37MXgt?=
 =?us-ascii?Q?vMRG0374D266qa49WtRjRtS7LGF6wwZ5jC566osfd9ANnVF3byxEj0BE+5Z9?=
 =?us-ascii?Q?fbwj99HJdlnB1YfQCvezbY4rvx3bnKxh+ePM/zPYjoHzMR6FDp3XqfXlNMZW?=
 =?us-ascii?Q?I8VVEOyCHO26bFPgY0Oz2JXSPeX9A6+QSXEAnPbTND36pbGmweZKwD/9TzwL?=
 =?us-ascii?Q?Q7ymwd4VVWB2zSVVx7LYeyKIw8rGm+xj+aSuXHq7AWv5k0cHoH3afZrqwA75?=
 =?us-ascii?Q?r3spNVXP4fDhOmf0f69T0mo231hyyxvLyu/1AEFCvJst5FxA6gFhJcgGwfF0?=
 =?us-ascii?Q?plSsZuiu3RQ5sNmJ6u6zf7tJu8rG9x1w/krX8YqdLzsgsyclLdRqurWbhyET?=
 =?us-ascii?Q?ugRPWHiyY7vHX0UCjeNhv06hRHLZ1Zs1g2XmBwW7OPBGHpYZw6LzSCA97CUu?=
 =?us-ascii?Q?DLf4Rebc5K/fwrIhHLV9Zi2qxH170sd+Ev15A/F1JM/nxqogaMOQzERSKzBT?=
 =?us-ascii?Q?OTzSpzRud7L+tWbtNBuuJymsppSZMQOh7sgEQKOlGXLsSSGAdIriKl5E8rxL?=
 =?us-ascii?Q?t2flwZn7SXI0PpNamHXxfvwVQFc+viIH1ZR5gOX4B1ob94k81N5afuNm1g/I?=
 =?us-ascii?Q?fxckcEc2oeaiCdyqiL94f9RTi9MqnvpTQWgNAa5wbMLQBrcwfa23JEiqDDqo?=
 =?us-ascii?Q?08nbeI9H81zAQZccqDtE8l4it7QOQdm5KjGh+BL8lGEnzskNEQwz2yp10tjG?=
 =?us-ascii?Q?8Qj9hgchBIyMnAKx9nhRq2XRDmydLe+W+GzINhFMqezHfk3racKxmQF9e4oX?=
 =?us-ascii?Q?q2cdg3uMj4QTFwuzcYDlRIwsabPilaizmx3Y35fmDuVSqcwkuBS6X/kmq+B2?=
 =?us-ascii?Q?WZELOrHanPssCPsRK855MAQr9hJgYIlJV8BHRa+agE5Gzv8qxks4pT6JBXKq?=
 =?us-ascii?Q?cGL77/nnmqBszRYVDuQkZ34EpP++5CKNchxvSWgLHrqkBt4cq+MgQvyq0EG7?=
 =?us-ascii?Q?pztlRYeVsnQ1fm4WsEJtQWoPDCvD3HyjYd1+LOSze2IaueWC6tmQsbGUPMM4?=
 =?us-ascii?Q?sNLg3dK5wLN47v1cTaIDwpi1S3M5dorETTSErkBlj5+J9cNolzWbk2v7klL2?=
 =?us-ascii?Q?84u/KoWeerZoVPYr4C21OCqZNVHJ5XaNB3ZkfurCh/W85MSyhYuJjmhgd/+2?=
 =?us-ascii?Q?PRkish3SdUz/daP0Wh8ZHrfxJvLrqC5irRcxtSDT0TGheMMMSWi+d6UV6Te4?=
 =?us-ascii?Q?vzYAcMJSE2YzMxtLli4LaLjUlClx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BwpFxP/RhkebkwBO5OIzLNpkp4sVvq8JnEXbE5ylAZKRdGw1AuF0KujWnyQv?=
 =?us-ascii?Q?v3GjTJrvqyaJZzvi4FcfyehNQ/5Yt/5JmNqOtWT3HXouiSEBSVKOq4WPSzUI?=
 =?us-ascii?Q?CLzxvSAYq3i35+4Vr16o94461PPWqSrpfG4XWaNxd7hSs1P4FFxsQ7S9Cqyb?=
 =?us-ascii?Q?X0vLyIbmRezrjdtUpNrHVEjREZ/BG0GXkZmXl64SzU/hpKspIAFru5ZTlSLB?=
 =?us-ascii?Q?UAk3tEjfrK+4iwf8Mz65Tc+Ts+AqidjvROAqe8y8LdvhFfUL2H0W484tnUOE?=
 =?us-ascii?Q?ViJYd2A0c1CjqPDo2kcg3KAL3upqskjwBVdufQql1cxbzyxQ+qxZRlvpVwQl?=
 =?us-ascii?Q?WBG5UniK2HrRpac2wMcE/tOmSp/RklnByOCN0zMGh8SKoZm9E4RW4iMsKvul?=
 =?us-ascii?Q?h/mQZ/ukxPVCw0qF/M0yddd51gaxA+eOG5k2/b294AoumSUpQNqeL+TDHJ3M?=
 =?us-ascii?Q?W0Am5HJsQSnQzALyNBlzH8KeQr9VPchdwp6Fm7v1RsNl0RmGflWiJ88ALJ+d?=
 =?us-ascii?Q?kBEKJC+rytzKEXuYI6Z11pqGXMyRZwL13s/2dGfTt8IbaTJgloFCINkMcTaV?=
 =?us-ascii?Q?6WfluUYrwiZ4PAaoHZljKOQe8zApxned/Edb7iakXV0Mj0BwVK/eX5/aDrh0?=
 =?us-ascii?Q?KU0yAX0SmIHgij5VkjIxgKcEiSanvdKIq73Xih1tZF8S2oF1DFh9TenNGGE+?=
 =?us-ascii?Q?k1mOB9MJzK+w4YD3RVoTFyymrQqggbGS0j3mWgEsSbmQsLUn0nzjq4+J1OB1?=
 =?us-ascii?Q?x5mIYOYI1GDSQyRmX1epGJ8+0rani62pUQz5WNqA+cKesh/J3prv8jwi0GN9?=
 =?us-ascii?Q?EYdwohqL+K/vGgNi6OoQwbVjJiFA3Ytfek1W5l+9+K1JMHx3pfoPIdkKNL1B?=
 =?us-ascii?Q?CMRh5qawBmVZOLH5+CLKHEY8QyfMJjY1sae3pTR4l5DRDHxq/O1Jeqd3y6tZ?=
 =?us-ascii?Q?zTwWtFfbHPvEp3JbNjiS4JGDSNe8lmwwQT3i7qHLhxpnJzePG5AdRmGKNwNv?=
 =?us-ascii?Q?l/5NFjGZN3VACTu9DgGmjmqICfD7jhWkCqlouLQ82TV8E2Ngj0sxIKZuOhgs?=
 =?us-ascii?Q?aeLFjh8WRY17HyNMJYoN5HY3Npyeuw+5MkVrjT5Z6lKlJySvdEfKDzCaTfkC?=
 =?us-ascii?Q?mvx3kV6sZDKuLj4VjE2MMK5AWWrQA2GYqxcLXt2s3uFfcwy7feuZOT8iqdZ1?=
 =?us-ascii?Q?21KVvaUkhO2U36p+4yr3Fl7PsGx3kJHUcwB1k2gYxNvOgWVl01IdrLXhPkn9?=
 =?us-ascii?Q?fzHiewe2qGVk9Z/AHSMPuSPNhk7qwRzIS4uSvNU+t+3ZZoI+N9otB+qXhpiY?=
 =?us-ascii?Q?pFdG759+IgA1TB1MIxZzB+fQLSQ/pCGCSlJIE3K+SRCR3Gqj3vAJB/+TI33e?=
 =?us-ascii?Q?KtSUvWUs1t6gyXjv+OMDAIdPNdmh8CLlIsZ7ZeVq8vYFP2992hOv7EOkuUyQ?=
 =?us-ascii?Q?XRDHZisN0wqfH8fh0pU/IoKq7bNryP8llME6gAQC64A9OpfBLzsjKBqMO6Cl?=
 =?us-ascii?Q?6B13wuzpNq4yzg6mm3nblF3biZt3jvixouz6WTMjW8WvtW2dJ7LLFQlXNmrp?=
 =?us-ascii?Q?QftPX+AfzcJtRGxwwEHe4KyVlmOfahT9ZqaPAz0Egys8Jbrvs3g+LZievjEV?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EmhDTazztoJgZEu2bxPD+yb5ri7J5MW/LyV1s9LjI8dY8HDypPPTr/sUi7yZWGIGWVaGLnNmRBWjh8TjMyin/0R5DSV90AW+418mLhwIAtv+x99A5ORljFEFejMyaZLKSDtgEkPM552f0yK+DC7AGdEnIK31uvdtfV9BaK9c46NEaFpvCLgMuFR8emWvYCI6ZJpDSeJiCqyhEj0KrEf97Y2E27Bhv6coOmLLEfhTD4LlpvxyIpYNA20M4xtInr642DADdnKiRDTeSr4DYuugEnxdnJwA2LhiYu1Nq6mTXWZpzr6nARxsmmaVq4FBbUMZWi4/WzxUVCFP8eqlP2wkDF97YT8c1wejWp2BfTUzi8Gfmnv73FsQ3LjPw3eQ/1UCsVRBcc63zRjAE/waKeaeQ/UpqwgIo1YdLowVRpSDOjhhi3kQp+Ccf/D1FpYjkrSPp4WBpvSIAlSJRJf8YXLiEv0FM/guG0dFcrWadDvUWilY/V5DgbzcW7i7yz3/eXz6egE+bNyulTygo6txdKL8LgkWmzHS3dp6ypeyqsCDdbv0PjDSjqfV3chZfxxsXTw76otK7Dn4vKed+tRNm9Mn6Vmc+sg+6+5EfM1GWjvuPmc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bbb939-0614-467c-50bc-08dd449bdbcc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 21:43:55.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdmr/mvvHjW3lLfALsgoEjy5Q89LDw1DTKmnIq3lde3s6vv3vCGjwYuYFpLtjFwj3rlj9t9jLHGBnQNdtIrCmm0wTPWeA96QKRdMyOaBd6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6724
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502030158
X-Proofpoint-GUID: kVs80eU01yNp2ZiR2Vh8Gr0fQ8y8F57q
X-Proofpoint-ORIG-GUID: kVs80eU01yNp2ZiR2Vh8Gr0fQ8y8F57q


Tudor,

> The driver leaks the device reference taken with
> of_find_device_by_node(). Fix the leak by using devm_of_qcom_ice_get().

Acked-by: Martin K. Petersen <martin.petersen@oracle.com> # SCSI

-- 
Martin K. Petersen	Oracle Linux Engineering

