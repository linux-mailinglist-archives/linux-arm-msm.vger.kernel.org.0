Return-Path: <linux-arm-msm+bounces-69303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1064AB2769E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 05:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42587688A3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 03:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445A329BDA3;
	Fri, 15 Aug 2025 03:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Cr9ylydc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hEwMstxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F9029B78E;
	Fri, 15 Aug 2025 03:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755227665; cv=fail; b=RAwpkqceCHaJvHl5dLgxCm1fZ/3B8iP4yyaBcpbXic1KBjt4q7yWcbTOtyaNM52VGLEYspubKgI56yRQpma50VLmNky9cpAKDuyVDbjt2xuTFAQiJZ4KPGLCBTcvmhy62+WQeI+FgiEKnS981YXtdMYAH3tyBv+JsgB21Qw2+k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755227665; c=relaxed/simple;
	bh=ABtKi9HxXmJosbUc1mY6sALeU48J+wwWe3JLPBTM6cs=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=lF9THXPMGS2hWKnRObKjfRwu6im2Dwz/LXJQPabY5L/QwOa4oBoMbx7Q+Wc8DQ/ZjGyo2BKBBAqZnPojuE2PcbbVIerpWag++J4HfY+XpiJOsJlhUrzIPSftpcf0fvvVwFVruwMZKiWkvEUj4/eykMDrs05iiNeJwL2C6CfKxeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Cr9ylydc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hEwMstxW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfprm011952;
	Fri, 15 Aug 2025 03:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=s55qKsv61VzQ8gXjcv
	R6ae3KcQI+fldP7bFixaMEO0g=; b=Cr9ylydcPIUWJNTkX1KHJ4eA3hVuoGaOon
	PbUTZDFGWm9yn3EgsF3U26k5PHUmmTb4Vgg5Wz3TqX/Gfa5kXMS3J+95ckh+qoUi
	GPQ42jXOIT/wGQOIqpRaPw1fN0OkIJ5cTgO03gjSy6sllq/0xKY+KQUnXdwqbnhy
	wwwxOjYFKu2F87y0wGTX+Wx6naeD7v74oQ7ls2SNwIR5PwGrsPSzKovJMwILzhMC
	UqXbit0MeqwZYCKJWamG4DMQkUGxGHqW1siQxc+qBRoQSsypGykE3sJ/Yx5Lwe4b
	jxvvynsJEv1x/k8rzzrc711WF6E1yOyzqQXJlt52Dcgv68soru4w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4kb07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 03:14:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57F1dPwA016805;
	Fri, 15 Aug 2025 03:14:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsdhgec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 03:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGVprQVmasgUrT2FGIwFUX35cg5V2jsChVVxgb6i+yZtioZOGXw2bUgKsn2W607O/shSobobAKcWzzHlo3UhWj+JYk/0oBFq+rN8uydPrqy6h339CfoBVOghozpOlHQhD/KVB60ojCXHsgeZmbD8KOQMOrdYCdsPA7/4rBzUlLY+EJPH7QSs3PWS1F/f4lzc1cnG9fM3y+6Z/fll3BFRrQmYaEsdutwBDjKLlgkYHSUiNb61haisRtuBf3S22oWHNQ0hRId/QJtPqoCxxHYPf7x+M92rIWAEKuhR7UyGWykB/fEG5DCdjyslnxPt4HGQacxBUdV3QEH7K5nk4bKm2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s55qKsv61VzQ8gXjcvR6ae3KcQI+fldP7bFixaMEO0g=;
 b=PG6X9CjGTbUXKRAWlVVjyed5Fz0mWtusL8hg5jpqy5+2pjm1putaJTaUWSkPFzGK2FvlPgIrP8dLX/2Mj1D3ncOKGCi3168JO/RugFs7iAfu+/w3yIj9BEt+8rr6W9f8ql5hn7WTcnlvRoI8iNmjYhpLYCxB8if3XoRcujbiNA2CvUQGsNjeUJV708fYVhl6tuGRixtcdnerqVCVKkl0Yx1pmtKT69ngMvec30jV/ZEdPqVhrSsl4pdZcHqQ4iE2Wx27vyMtfyy1zYZF3gC16BRUvGqJOGJ/FGxtl8x+Z3LtzQTVGZTjEq72cZNzZvKaKlZctnc89Hx/OIE4qKgahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s55qKsv61VzQ8gXjcvR6ae3KcQI+fldP7bFixaMEO0g=;
 b=hEwMstxWZQf/n5tSo+/xHPHzGJ1I/rjHLMMYkWR0u7TOiVSSw167zoqju5vLur5w2nEcPZQZkFej0NLUaiCbCAplcKM5mNLAdCPX51IaTwt6JiVbY9U5c12/Z1Q0eK7jIxh2qT1t9DaEfkBbyDD090AC5SadOVY3cE10A9Q0Jsg=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CY8PR10MB6516.namprd10.prod.outlook.com (2603:10b6:930:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 03:14:01 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 03:14:00 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ram Kumar
 Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH v2 0/3] dt-bindings: ufs: qcom: Split SC7180, SM8650 and
 similar into separate file
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
	(Krzysztof Kozlowski's message of "Thu, 31 Jul 2025 09:15:51 +0200")
Organization: Oracle Corporation
Message-ID: <yq1ms81qnxa.fsf@ca-mkp.ca.oracle.com>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
Date: Thu, 14 Aug 2025 23:13:55 -0400
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF00013317.namprd07.prod.outlook.com
 (2603:10b6:518:1::7) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CY8PR10MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 58520670-ddc7-47d7-6fae-08dddba9c6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W+YA/oC3B7w5hZD9tC53BBv6JUokmgOQltaDuLIxIOGWHRNLHiKzhx2avoST?=
 =?us-ascii?Q?HjzrNbl15rfOaC28Bt692KJNn8BDcr0jrl8QVXepcKt5c5obezBu4Wyq7oU1?=
 =?us-ascii?Q?sLKyKwP1NjaNjf09fz0WHtLB5VoygY06/cgaOFI1ZwkYjF/U+j1kwh9++a36?=
 =?us-ascii?Q?miWxdcSCrHvj/ebShDpuOhvuiHmdhJlbHFg4nEnPGs/vVxqey8KBfkSnTPkO?=
 =?us-ascii?Q?7pm/cCqufM7OnjFHWZGKom5Di3Tp0gknwcka9wiCMcjxAK+Xfa9nJ7aTZ9H4?=
 =?us-ascii?Q?OeCylkVK+JhK1hfBxBjC+WNx49dWV6QMm5sJD4G6niy9X56P+QKlg/R8PECZ?=
 =?us-ascii?Q?oWPx617wD6B98l+dMJX9sJDiMa8nRUCk/DTeW/YHlzX5HbKaOARUV9zvMOYV?=
 =?us-ascii?Q?hjI1oxgdD8BAUGrrQm0ijtJPMD6VcKYYQks++KPU82fxmyXrI2PRlOnamlqi?=
 =?us-ascii?Q?vXkV53BRIvFe/XMWmxBEDOhHLoJygC0kodmI6Ov8gBHj55g5fb58dSzAB9Al?=
 =?us-ascii?Q?IG9IGoejiiXUlV7pl2DZJYswcJ4WFPpnw5hqocc84EoyyBrwymUvXQM4y8gt?=
 =?us-ascii?Q?bq7l4kb/PDwIMWWwaNjU3BjLxQN3uWjv3wD/RNpk/hKpFXZvBmoAxgSgs/Uu?=
 =?us-ascii?Q?hDPGuMb/UpXAODekGT3Z0gFmOvotinKPrcn90OaAyP1+vIUUcd4tiy4fcOk9?=
 =?us-ascii?Q?QCNYJoQBFbeVn+C8fyKEjtEnwHDo87ZzP97pwS69zKpPpnEEM4qMXvgfUMzg?=
 =?us-ascii?Q?SEM8F42C/CMq3LbIJQjF75bFRtUqt7WXl8c9JVSaDx8BadBYhc0rnEiEvlwg?=
 =?us-ascii?Q?Ocmy1cS46HiVPQ1QbJV/yn5ycFNiBgMz3FEMF0XIYtMrsIgi3NkNvJj3cBtT?=
 =?us-ascii?Q?rH2bHKtbOMyKAvUPO2MfTeMqfZloy9UIqL5XKvOf93mreSAJztqOh7hEMiin?=
 =?us-ascii?Q?iuuedg0wJTDU8KRiL9miB46c8eAwFNrlFvi4b/AUPbSGmcbdYKzQhyMOE7IQ?=
 =?us-ascii?Q?4rXanLBIUL5pehu75USjuPTwt0WeDZjLhtqIlT4rYNqBTBymHg/2cMfRpqgl?=
 =?us-ascii?Q?1lYElxfYx7BhNr3cK4ePZeYpLB11IDPhrfilNUSEEhAev9lVO6OsqR4CvBKg?=
 =?us-ascii?Q?q4JwZ1Lds9YZ0zGKXU3ZiuvLDNsqHw3hNnZrvCZlzO41MAfZMFdpbS9U6Ziy?=
 =?us-ascii?Q?WRR6r4itrTyM3APCcM8HO4LIi5qt+JD2eLmUYs5/JeHrz9xLLsNlZAlbg0zj?=
 =?us-ascii?Q?8WTObzeFUx3pwEYCpk9xvZcWuFmji1EkcHFYkiDtw1MH1bPiHtjGTmvB4Axz?=
 =?us-ascii?Q?1VUz3jTH1c0sf0eOZQK/fXJp72pprbyagwOixUZIUBW2lXk7pTGvXerpDrfq?=
 =?us-ascii?Q?mBOdiTw8FPglMjKh5yOaLYhgHBpglBZ4MHb1dwhWQAsAS15WWm9XAvJLm+M7?=
 =?us-ascii?Q?ibgf+HbexaE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e4lI1tJnlxMWUyxZLs1eJteXr0sGfJdALRuuH6rJkw4YtYg+cJfLjAyaVISJ?=
 =?us-ascii?Q?eeaGXMYvH1vGmdNBs+58MLuIEncj/L85+FJ7qm2GJwpQHR5vksbKADHXj86y?=
 =?us-ascii?Q?m7TWVZBdydqaSWnpFgah/iWpTgXgJiPJ+CrG8XHeDQ/HD/Moj81Gou+03fj5?=
 =?us-ascii?Q?wJlZMn5o5SNLUK/TQxuvY5ub+0e++louiZngUpOkEopErv1oLGIBXVtGcEcO?=
 =?us-ascii?Q?aww68NyLOOT1prSqVqAHNAijYdHcnkmt/Vs+qHndYhyCS9uNqolpS3unIafr?=
 =?us-ascii?Q?nLpAT46XnZ+NFZlxGO3EOWj4LVQVLkvjbhkepDHv5NB3JeS4i/F/Hi8J0Btb?=
 =?us-ascii?Q?qF54e8wG62xr/st1MIyDRvh/Ryzs6wJ1U2e0gsrILB3Gt1v9QKz2gIhbjlb2?=
 =?us-ascii?Q?0RRkNjoxTk2YZ7IhHbdCi+/G/xyen6Xp7BEfc05ggZKs/zHPNauH83Lwph27?=
 =?us-ascii?Q?10S+0mZ5x0mBe/xeRkidG7pJ/bwXcuWidHYVAAADuDZOw3hYp28bUW+uqaeO?=
 =?us-ascii?Q?YIYsAbr7kzmME1KZ+3xk9meFx791G2GZJjrOFIrRJQ2Zz6lgkVWMBWyp3Av4?=
 =?us-ascii?Q?HJ9RuyRVyh0qSroSR3qdNkxy/BQ9S2ImGk/DwvnT9NWbGluTTWXj3p7Frj9X?=
 =?us-ascii?Q?7X+9OBOkbP+E8BLYTlrh3nNEO7FEoWZE8MWi4UWl2gjay16HetzDednhGzoh?=
 =?us-ascii?Q?5a2TQhr/v5LBTUfMoEGmVWZcm/AFaBE3T+Pt+CHTMTiaJ1VaQaFFEoCfVFVP?=
 =?us-ascii?Q?95IJKvkK56rfeKTQlaLui6omMzm8hbc+LhmTAuzYqdhEcdEPdEdsam6lpU9T?=
 =?us-ascii?Q?+CfB0GKT+AYmKawT7BouEEq6OTu3bf10IbXMUwkhhbRZDwJUDzCOMUjyO3E9?=
 =?us-ascii?Q?OYOszb/6sZkgGRk4EcyaCliPM9eEAtAVn+yp+LaqIKa6rD08mbi9x4WmF1nO?=
 =?us-ascii?Q?P41AB2IvIWXq0xrZtzkiFlc1j0UkDHkjTJGkyy/QIEbq8D8TSNfnDAaI6QU8?=
 =?us-ascii?Q?KtZMWPyShS4LsxXZabQG49/NgEu+vgFuMbD6ub71hQDXqO5aMKA8w+OROhDr?=
 =?us-ascii?Q?221eXw/RQ38w4CmaxQ2qk4QiUJ5hNWKF2z0rVK1wOZec9Hdwn/1nhnwQ+I5v?=
 =?us-ascii?Q?/ZUNJdDzhy3BfUVr/u/UPb3KHy0wgydKiWcMTr/S8ep/gXUA5AAgxGPr9vDn?=
 =?us-ascii?Q?nJR3guV81cStRAkI3gjjh4+l1l/e638+Ur7dZ20Ni/MPLovpLxwIn2hwzCvL?=
 =?us-ascii?Q?TVKtMOekuZTTEWz1sSvSVhnRUGdJbKaKFRIl6IuqLmpbnKvU/FIc6PWRcM0c?=
 =?us-ascii?Q?0Eoc65r9m83HD6OiYbeaODoSmPSa0cipgdLZEa02gmdsst4s2KvrSaMgmk20?=
 =?us-ascii?Q?gKle9bZ4I4mYO6dp4iCBpwpqUnTH19ZIX6vP5i4e6jSkBGlJDq2nY2oOEwPV?=
 =?us-ascii?Q?csKJBor7Wgg8PVSpeGAUtyQUKSKIyrTRPZ+IAHIPifDxwzKlyXuCaLdztCb+?=
 =?us-ascii?Q?Wq1h2TUwxjuFUgyvWVD6kPSI2AExsRPCnhaETWs2CCmjMsqPYWWF89sFCRw4?=
 =?us-ascii?Q?nSQxoJAF6CLv6Gyx1z74fWPOohY41PzBVcFnGkKrohAGUhmJdzoaZ/sonbo/?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hq4/7yW0iFBUapTgCkJbBsui3STA6IiTQuXH8p+Q8Ik4JoYqivus8g+xZty9423/yLrCVjRretKhuMVRVkUKHXgNO3+QDzER1bnLTePA+qLDP+QCaY2OpK8bleICRxSCcUrpyZ8Og9Hk4mZvmeFguvmHjYUSlkHx3+tde4KDv9z/FPvEGqj9HgUypMFwKylgZc7R/DjF9GMLUKXOIrv/h08Y2J+MbQ06297vREAlR4XItDFE5sFDMNvEqCU3X6WGm8IwghUQNrX6aAJnuTqM/jO/TZ2YrdZdchi5vtZhCfY6yMJyVGRLiGzdfYuJnhUC4FfhRFeseSky6LgNZOXl6fCAIoHsU5SJumC8O8dzIkPuy/SohEise7C69VSBnnsRYdGUOjSrSfoAJhjDe4WSz1Vl+yR7058t9tZPhgjSQyUgARwL/YBJ4Q4lV2M6ziQMlJoU186UBeiZ8AZkfSUxqs9K9aCYAxtNcG0PAxeV92yPs99J8gPrHhF3vMCXdc1Goy9VoZuwX2C/RP+MxgAEm43tChdbdU/FZVC6ChqZPfPl4gEBwXofWpu6aPu7ZCRjLMGSlN5nuRaT+SPFUCfNknRTtF4dl+GlYhCSL05D+/A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58520670-ddc7-47d7-6fae-08dddba9c6ba
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:14:00.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dm8+JB0BrOOOgtWgW8GdZF8LquH3Ygqo/8OGUPcjGtrgHDyySTHtDqEIaNou7NeoMERbRIkAvm+84zxS7/B9NhVcUnNfrk1pabJs0Y/BQgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6516
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508150024
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDAyMyBTYWx0ZWRfX7x27tSsKK4Ec
 xGMWjjS7Y6x9iPhXQpUUQSI+LtubeT25dSpiEtGpkcvE3MxnTrupcuBBR+d5EyTLnbKoFv3o8We
 6w4i1M6wpgIksvUAHcEYy1Wbz74+m27e+LM+m90mvlv0/xkw/h0AjQcRwvPhcbmThX/cf/wmiIL
 DpqpS44FfGaVQ9Vz0ZjhSSChJXwj/MsU5aQd4lv0kiWgFOcXtyvKYJhmBNF1BVLvsKYbTPUqFgr
 YwDudaVNguLwoXFEu+thhWUlkNu09Am64Q/35K6jVmIBtQxic3fYrHkEgSlzvm6DRtvx5wBsOTY
 iozwuMgP2z89OKYF13PeamAJPFFfxJlrxDfTmPe+vHCrl10V9Cu08RWBJYtXFnMLzDywTugmBQv
 qFhhXU1Eu/LFYzwNWZveIun8ICMgjoAwlSpj8/JYyYsihV55yCLa2FIiRHZSnV8pLDNQ/AKV
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689ea5fc b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=3naVu_GUDoUUrRWhfsUA:9
X-Proofpoint-GUID: IHQxxnL6fOueAoB5g8Nr1p9wvhtS1TvA
X-Proofpoint-ORIG-GUID: IHQxxnL6fOueAoB5g8Nr1p9wvhtS1TvA


Krzysztof,

> The binding for Qualcomm SoC UFS controllers grew and it will grow
> further. It already includes several conditionals, partially for
> difference in handling encryption block (ICE, either as phandle or as
> IO address space) but it will further grow for MCQ.

Applied to 6.18/scsi-staging, thanks!

-- 
Martin K. Petersen

