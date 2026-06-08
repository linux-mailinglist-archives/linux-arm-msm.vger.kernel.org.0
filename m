Return-Path: <linux-arm-msm+bounces-111827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nV/EIn6cJmr+ZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:42:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925E6553D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:42:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=HJja5Qta;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=HU441TV+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111827-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111827-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1834E3030532
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AF538888F;
	Mon,  8 Jun 2026 10:31:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C37337B87;
	Mon,  8 Jun 2026 10:31:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914665; cv=fail; b=Q1JfatA9WAzHRcURY1ty90xo7Qz60N0qLlvzaOlsqIYeyWDOE6wGMv2xUjiWThovQc+BocIZN8UdAvqkPhOpxBENCuuRLG4T4w6ls4svoUWwWEW6GNbCE+zls2K3P/sm45cU6N6aMRuyaJkBQNBzu1U9+ZJ0iA1u5Tbkj8AOKuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914665; c=relaxed/simple;
	bh=QwvIZhq7oV1cRRog9pjTb60R+LwnOA734EgMeWQHV+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H4fB2tvW7NUWRVlFCGym3a4QUssdwWmmezQa9MD8S3HkmwXm3Gq4aHptPg6I/59udJazNXn+5sOqU0CwT+i4dX2o5Sk5/O5BubHPKQ5wGS/1W7MmnpsE+iO5ZlAGsXh+qWpcDOZnFOoZbPcSLxNpNIXXl9m5v3PVcnvxyjbTAz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HJja5Qta; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HU441TV+; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6584NIxx1807595;
	Mon, 8 Jun 2026 05:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cLyRM7K+cAQV9GqJ/Q1RszKeEGE20ly8Ot88i5GWWW8=; b=
	HJja5QtaKynOjjtNEANAqZzyJu6txxQ07TkaNKGiXjlhfI3kO0s5kSnUXLAuVorH
	rKjw82GQL/oMBQ51NaLp/yDn+kc5C2whNNFbvcF2yLx2UeqWmkUmQlMrdZ8H7HbA
	LI5GToXYn0BzptDrtFeugKXTg425YBaL4ARuEsfEyO/rNDdnm0iaNyr/xAMewd9I
	0k+c21MrnYBvJkm0mP+eD+5G+oMAfWPgX0K8aDJ+iKEmmRENnC9b2uW84vA/uFP6
	pfzJ9vkriHM7F3vq7L0Qd9OvtX/zx8iAzJRU6ASRNsCGQBUkLJKSQmLgcS1WeYSQ
	W+nYLIR1oKuAGQh2Ify+BA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020095.outbound.protection.outlook.com [52.101.61.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyga9f6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNB/axKoKlMZ7lhbIWqKHYxmmjHmA+oyfUNX2hgLdMkhEHzwwKWFO0DDLJaakB4TZUn2LFhkdC6pmDTdjvdXPS828CvBLavUIjGt0/3hJE6wXZc9mCWR7pK30AFBwH/IjCTFzza1xSygiqNrdii28fzx9GxBwl3Un7wjZ38rPNwKBQXTS1XCS9rndGwLIV2Mr/MSqc+9Xqv7u4PIv+HODjwCfLAiJpLHo5D3GIorVQdSE7EsgVDnUxLwkNTy2UfjcyIVxl/jwPsGhwEsuJpiWaF6xEwOoKyM58/UImlinPHU4eE99t7ttC5MLJSQVOsFUSsJ7WLv/ZTfPLAr/nBnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLyRM7K+cAQV9GqJ/Q1RszKeEGE20ly8Ot88i5GWWW8=;
 b=sagjTbBH/ejaei8HESXlRcfrjI67SL/iZPkTn7kvu5dQL1IIhGB+vMc5vGRnaiQdvyCZO6O3m949eu+gQt13cBP0FrUGLJx1QhLm8QzisUivMJGk30EaI5EOY6gbZHNgSo6q+EY3QkuWOPK/hVhmGReLrm721UD+ajRxMqh7+ThxUuC/DmI/OBLLve5Xj0cD8Gkd4orNbcHocCKHipL6/T8DvFrodWBPXKWu759TrJ1btFg6NWbo/Vj3PKtuFU/yFHWpa837L7DD6xYjE3iA+86p7JKtqtDMA90ujfAMtYedObhn6DuGCY+GmMGnKJpQ35ZZLjhsab7Usnu8uUfTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLyRM7K+cAQV9GqJ/Q1RszKeEGE20ly8Ot88i5GWWW8=;
 b=HU441TV+2kGraGT0qsMBMCYge0YjtyB6WRTW4OC/uxyqGn45oAm3jqNCtFpIE+APOm+WOebOlmJZsjpPv+D1LrMpbc7/KZ54L38YT47NqgXbHx2jNMMQx6uDHQDoXsowCaPA4M8d+U90L9cqDRdb3dJ8XY1IGTHOOoO/puUhj78=
Received: from BY1P220CA0040.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::16)
 by MN0PR19MB6405.namprd19.prod.outlook.com (2603:10b6:208:3c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Mon, 8 Jun 2026
 10:27:22 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::7b) by BY1P220CA0040.outlook.office365.com
 (2603:10b6:a03:59e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.12 via Frontend Transport; Mon, 8
 Jun 2026 10:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0D2EA406557;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0D45822542;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 03/10] mfd: cs42l43: Use new SoundWire enumeration helper
Date: Mon,  8 Jun 2026 11:27:07 +0100
Message-ID: <20260608102714.2503120-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|MN0PR19MB6405:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f8f1290-5a8b-4d30-0936-08dec5488690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|61400799027|376014|36860700016|18002099003|22082099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	XQjNpp0Cq1hcswwQKrvuw/WCDwpG8dV4JYZHixDkqClVtVP6Fd7NjKrz8WArkipnKSQgdbVDyjkWoPBRZGgbve1MMmG/9Kiq5UawwGB7zmP6hUY+Wxzb1RHaYjUlYxAZ2e37J4E7L01V08YqA9Pupt9+Rpu4a4X2xlvskqouVHisqChy1dzEvmSWcAJ5SjT6m2fCrMOsVJ6ACYHsr+rWO9UIOADfTPoZwYW74wqVnaduyqoITqRHPdTQEc60D2c1qdFvtT55dBz8YFWxi/boj+YNlz/fQcecfb7fX2z4J/BvjoBK+B0ENgqdXZ/T5lrtGgW7UJ6y7RG4gtK/uVGa0BdlrZgljO5Grc8uPyUfLH/QOGgXsWAilNNRTg4bREguB1YSsY9CC92dna42GY0Apt1Glt+xgXdL410u0W8udQFBKh35Lfvm3g/mJ5N+UKKmFj4SoDOBJkqS1q0PhFSHkri5QMqPIBPJSLcQvTwhc5I4GdouQcJra438WWjtIi5wYquGbnObWKUNOYP2eRbIYCLC2uJGkgm80gvbWN1CtJpRaubYV1vo6UdCH+69K1SJOO+2Qm0mvbjlHCkqiKcc0JxpE8qkyXz4D0kHnTXZe5Xj0NxtHv9t26I4lYNmiJvGi8blrgqfAvsbFSyU/babfEwiku8fLiRyfGj65arEUnxbuYQdBDvr061CEMAeqz76r7TMhUBbYzJE9MvpFWSXYuFrwkiisjwuhGFEN1Iy1YA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(61400799027)(376014)(36860700016)(18002099003)(22082099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bdu1VRKthAfuj+SAApxEIpxqWKm6D+eN+dNMDl+MDR7tW39TQBQ4uJIcZJ3UsQ3VVPPvFQXFCDGXE2jl1txBlCLYmVRyX9xpjGdxjtUTxfnY3ldJUmub9BEuFV+n5GxPU8FoZeKa2fzSQVYeON3xnBDw58j3aeYFkAEtb4V5cEtiemZ1mx3PSPccDUK7JsUp+4hMRHR72Wl9VXmW4XSJ9zGPZXW1tZLZ5kS0UP2DaNOlhZXBDKy2tqOprAoPhWcCLGg2wv2WW1knuV9M2rZ8di5D313/BSif7fasnQL4IxkU2uHIuCWWwVcVM9drKzR0uD4Al4rXlyIYIaq5HHfwGPADfpHxcyxzrjRb+DRUDMPkGRniW4Fs4bc3JgcR1EO7+K04yZhB+P7gvXKYSBIRWi0R9tohXsnCh9DngWp7CAdShfZ7Zg+tTHezjwWOsmXx
X-Exchange-RoutingPolicyChecked:
	gU4YSOxCXfQAYYQ0fjaKTYF1ng8VSUbw1Hp+XkQgLU+AfT8CwRzqJuhYjD6nMDU+Mya51Hl+F33VxPPSt0Ix0iPG9G0QzdC4ok9GwoBrvkGvZLn3pWGOTxxANa1PArpOlhxtihwsN0hL18O6tI0RYgVItcoU1TWVnEL20n3vo+mtsEYFLgmG7Cc+mhZYanI7CAhfGbXQW6s0diEB5i6WwtuukRD2Pch1lBlNQKGRz+ubBVQ1i4Z/lP8KGdVKLuMoiIKRfqMwDJYnXAX+CTzJaJtus3m0YwROevSvvkdxXBOPTZnyE0tAaR6vxON8pAeGV+uTiigt/Yy1G7z0kxVnrw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:21.5803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8f1290-5a8b-4d30-0936-08dec5488690
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6405
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a26990f cx=c_pps
 a=5EyciH11kPx6gLClVK4sKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=zWJqKzWmD0Dw3pFQfkwA:9
X-Proofpoint-GUID: cuv8FODBjNj8QTYseAbxn_ISnnCD3rvu
X-Proofpoint-ORIG-GUID: cuv8FODBjNj8QTYseAbxn_ISnnCD3rvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfX5xyybhN5Lvil
 c01WUpCnvmFjrcdPZFyNDNJjYF5iIM+tphJf6Db9DiUADoYpbroaL+LTLdcCEboYsyucLLP8Cl8
 HXOqAdpgqLIgrhTDjD7bvTMCyBsGDlZfKHYd8P8vI3wKENfRyZXPAnUB5sNpNodjrkP/9yY+o8F
 97vr+FNm6lRlPs1rlWckeV+eYRNpEzRl1PFXb3U57pzq2PSLcoX0T8E1UmjqeoBEdi4aQi+7hpK
 q4KZBL9SsbgitfU8eAYEzJVjDOf5yK2DUm9YEU5D7IUdAVSJNVOYV8TUX8274NaHOjVJZjmm6uR
 huxsen/YWTS/B/PGPPaC1sqohtqNIJtMcpfl2xx3hlgbEkkXuNLxxJ4I8VgavMxQXr5y6du359S
 uCCqxr4vMCjEdJ0AMnu547olHIUgYqrGTLHPww8kWIy6XiuMZkUx07AEzAdIYfLTbqyNzEzbDHx
 mPHMtBTjXLcDuUKy5fg==
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111827-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7925E6553D9

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 drivers/mfd/cs42l43-i2c.c   |  2 --
 drivers/mfd/cs42l43-sdw.c   |  7 -------
 drivers/mfd/cs42l43.c       | 15 ++++++---------
 include/linux/mfd/cs42l43.h |  2 --
 4 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 0a0ab5e549a5a..4db452b41220d 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -45,8 +45,6 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 
 	cs42l43->dev = &i2c->dev;
 	cs42l43->irq = i2c->irq;
-	/* A device on an I2C is always attached by definition. */
-	cs42l43->attached = true;
 	cs42l43->variant_id = (long)device_get_match_data(cs42l43->dev);
 
 	cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 794c983781750..2b87ae2d79c51 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -100,17 +100,10 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
 
 		sdw_write_no_pm(sdw, CS42L43_GEN_INT_MASK_1,
 				CS42L43_INT_STAT_GEN1_MASK);
-
-		cs42l43->attached = true;
-
-		complete(&cs42l43->device_attach);
 		break;
 	case SDW_SLAVE_UNATTACHED:
 		dev_dbg(cs42l43->dev, "Device detach\n");
 
-		cs42l43->attached = false;
-
-		reinit_completion(&cs42l43->device_attach);
 		complete(&cs42l43->device_detach);
 		break;
 	default:
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 166881751e698..cb1e175586bd1 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -586,15 +586,13 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
  */
 static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 {
-	if (!cs42l43->attached) {
-		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_ATTACH_TIMEOUT_MS);
-		unsigned long time;
+	int ret;
 
-		time = wait_for_completion_timeout(&cs42l43->device_attach, timeout);
-		if (!time) {
-			dev_err(cs42l43->dev, "Timed out waiting for device re-attach\n");
-			return -ETIMEDOUT;
-		}
+	if (cs42l43->sdw) {
+		ret = sdw_slave_wait_for_init(cs42l43->sdw,
+					      CS42L43_SDW_ATTACH_TIMEOUT_MS);
+		if (ret)
+			return ret;
 	}
 
 	regcache_cache_only(cs42l43->regmap, false);
@@ -1120,7 +1118,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	dev_set_drvdata(cs42l43->dev, cs42l43);
 
 	mutex_init(&cs42l43->pll_lock);
-	init_completion(&cs42l43->device_attach);
 	init_completion(&cs42l43->device_detach);
 	init_completion(&cs42l43->firmware_download);
 	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index ff0f7e365a19f..8e993fb535e68 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -86,7 +86,6 @@ struct cs42l43 {
 	struct regmap_irq_chip_data *irq_data;
 
 	struct work_struct boot_work;
-	struct completion device_attach;
 	struct completion device_detach;
 	struct completion firmware_download;
 	int firmware_error;
@@ -96,7 +95,6 @@ struct cs42l43 {
 	struct mutex pll_lock;
 
 	bool sdw_pll_active;
-	bool attached;
 	bool hw_lock;
 	long variant_id;
 };
-- 
2.47.3


