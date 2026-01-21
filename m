Return-Path: <linux-arm-msm+bounces-89968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGE8DWmZcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:16:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8A5430C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1D40D489BEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D90478857;
	Wed, 21 Jan 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="YmEIz0Oa";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="0TEkp8Y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865A54657FC;
	Wed, 21 Jan 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986483; cv=fail; b=dbjyO9KmjX/88wC2QTNWHwYYUSxJb5vpzRvjPCUF5TYr+7ShznkyqQAhWNGplvkDI5MfbYB8canVgqL0h+geGgpaTOjGIcs/Fk0TVjU7zss7CTycWvY2ehtcZEr2nIL3kzy2TQbszgbsWW74G7b7AFYFktvoXnVPRzdlLQ7fMTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986483; c=relaxed/simple;
	bh=LS5VmkxM+Kkfj/T1ZN3uxK82CR1faQz5qPHQjElBOs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rtZJ9sPWI7xwiY2K3y/dxZKqHSPYSIEwkqwF1SxIRwKIdp4f2tdOdQImoXDy3TWkgMEPpBtsTgJlCa2DieFjfUA3F7dzFlfDXYjTHHu+Krhaqmpzu2ONyCYS6z4nm+7kwIbvNa7uOUe0Ruz7a5TYIOUS2DQK9y0tGE2k+C98yn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=YmEIz0Oa; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=0TEkp8Y4; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L5w22b1433070;
	Wed, 21 Jan 2026 10:07:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=1BcXmbGETdZN2Hx7sDwV45G9
	IZK2IpC6pPP5phseOuo=; b=YmEIz0OaLbgQxI7F7wFxg/7joo+vLCQzmGY7/qXV
	U4M29MZibxsMrXvkN85AEqWVNfeyBnjoNqllY1bygePei9eJhwF/2xF2+sgnML69
	iErOTHuYiud9aEbsPtEudL4KWhrPXOd1xpudJkIow3nr2BFrSqPvankAoHY3yOdf
	K61VtAWndHKAQHEGCJ8fMANpHjzeGYWVdkoh3AbhQDXBYbA7wx+W5HEPSNkLcmlP
	A/+j3xJdsO0MMmiBVe6dawhT8S5WW+Vgb6hpV4LuuquyzagTqnZQguwlRRFg9N6z
	JqN/A3DRLlos6K9GHtPCEDEsE7JSakTdtKxN4mS8gXmB2Q==
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11023135.outbound.protection.outlook.com [52.101.72.135])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4btn6gg9ue-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 10:07:36 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TorN3txKv2ySWavy5BxCP1En3TdTlkwHvN144wgMpCIPTN8F0GCWAYgrRs5eyXGCj8DVVejvkqQcayQQM9BoA+mpY/WIN5HLqxOvDw62L+kZ3AhL/1s172YQi9+6+fahrVteKUurBnCEIPqeRGVpig/q9NWokcwV8VCXDxjIarAKB8tSSIHIPyPg3BNJ/3B0XCwJ0j0BByBu3AaSCnu83P0c3tcyaHVtcpbkT3uEVujteMRDCqIRYofOn20NgJ1r2PxG3JwY6rFAClFRpCOP8XMm4Kjf8+KIBYhutP2Jxw7nvU60IKEqMd+6WCr40JpRdnegI5FKUB0XAml5B71WrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BcXmbGETdZN2Hx7sDwV45G9IZK2IpC6pPP5phseOuo=;
 b=FIgeGseKs38mlewl/bV7o1IQMO1Viala16G978AIILPa2IqPWTTMznDGw6OK4D1uV6fQnhbkR/4sBVFUq5cl+hjbJHax6c30VL5OGxi/2aV2+59q29TZKCeRF7KjfhoMBseKneTb95fvMwhkZXyUA1T71cn0+YPJ2tlwe9TOimCIpyZ/1htPXYZi/JBU0f8SP7kpvQY0XLUcKneGxc8yHRuo9ukVyl/2rsTEb9HEtDvwhV5p7YQcJN+2xfEf3hHZ1jcDHW2CBC2/FZxTvJpOiBxKIB2r20RhB5u9OTJKARh3pRoKRJE74uCWamho7rchZ4SxqUfbOcun1SmKcIksYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BcXmbGETdZN2Hx7sDwV45G9IZK2IpC6pPP5phseOuo=;
 b=0TEkp8Y4p89cgtAC6E/qpMoGscfwlZWUuaJRLG3Bj6U99HVUGrkWnVRq1JoWN+76IeifNX9Po5qcTlWt3b/CquMUmXDoJiFm06qhRY3Pxlinb+A3Wd7QspAXeXJHxahmqTF6kFDMZR3tKDmhTDOaj4wXBBJj40s+f3vj2A4TkJg=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by GV1P192MB1739.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:53::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Wed, 21 Jan
 2026 09:07:26 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9499.005; Wed, 21 Jan 2026
 09:07:25 +0000
Date: Wed, 21 Jan 2026 10:07:22 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
Message-ID: <aXCXSt6_aTmoCnsh@FUE-ALEWI-WINX>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVZP280CA0076.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:274::13) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|GV1P192MB1739:EE_
X-MS-Office365-Filtering-Correlation-Id: afa45869-8845-4d9f-5303-08de58cc7eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8besI7oeu+8BDV7lxvtzswkWurODauzkFBQgnWjZ1/ZzepwqNrJ2oTopQp+O?=
 =?us-ascii?Q?gIRoGbNbCb9sj3h74qxweGUG70/JR8CAOK63OtYTmB98lfTU+qObSxu6bmrf?=
 =?us-ascii?Q?eiNMLMzPUMbMJS4h45WvTTDh5JFo1bgxXysgdD186X++miL/tKeVm/VcDoVc?=
 =?us-ascii?Q?OIoE7DiQpDy/XlLvmEebHw3BCFLXGduJtO1oZtabxbseHtiwtSDSq5zGEkNY?=
 =?us-ascii?Q?YLZk5HMEw6IPa7+WcsoYr+fmALKnnpPtpMLLZkjdGNRrVPB5L/0jp+6YRWEo?=
 =?us-ascii?Q?X1oHTALtERkCddEh0cJ4cSzCVqw4G2jA7fsRBSS+ENtvMGFcsj/+e+AzuOsY?=
 =?us-ascii?Q?8xWy/L8rHMx9plxT2eX3Ue8DxwX22Dl/h98Fc+n4cQD4DwrtXov9j+sQEq2i?=
 =?us-ascii?Q?xgKcavnoE9UAHmy/KSQB3PBYTOdwCJef+OIkgYuk8Nypw//LQ/RBQdzgxgEz?=
 =?us-ascii?Q?g/mb5mFm3mg24232j55Hn8nkv0pXNT/DJd3byjoaaJejxL5IvGu3JEY42YGp?=
 =?us-ascii?Q?0UamAcSKV5eMP87cg8Zgw8ltwnMh3y+YZIacnVI6drx3C+a6HLeuK+gsVgqm?=
 =?us-ascii?Q?T5IHmBIEGOwJD2QfVNYUrfu+M2CN4pkzCiwPlPXD/pPujaKAJa9QJPM+Iw6z?=
 =?us-ascii?Q?Yha5B6Eg4iVXA7eZ2s8r6cY+7DV5aWNlWjJXgikLdMBCTzmq1MlRWpI1N8JO?=
 =?us-ascii?Q?GgujMgrCVqxhTtItOx+2SiAMVVmRCz0PiIc8QOZr4IQAjH5XguKDv1sr3Zvd?=
 =?us-ascii?Q?dO4YggndViGq5e+QJMSdjY9Fz3uWH6Ek11SxCPLAXeFeVyhmxUa4d794a6+j?=
 =?us-ascii?Q?Sau9cEXniYRHPTpRz+zE8KxtUBH66uxKVsEANfOLyoO+7HWSO/WW7uYiNfKW?=
 =?us-ascii?Q?55g0Ht72gq9gn8MgkuEzOfUvsT0n9aQQQpaGnno7oxzMp3HkgvaXFXnRCafH?=
 =?us-ascii?Q?G78CoAJFJJwTy6TX56vourVv1eAPsdqnTfgrLWPTQgb2WjampWZGcMHbyxZG?=
 =?us-ascii?Q?nucPBeSiJrNSk7AoFkSQtYtPI91PAkTa+cuUvGdONa2d7n7MKC8LeOGy4Il/?=
 =?us-ascii?Q?2ZI6h+38dr1zk+JP3D2hwuVfKpx1nhpurMcG6USBfmzs+9f8mMLvwqWyIhcH?=
 =?us-ascii?Q?RelSKPkbAz+CHYVQBgLb41E7HDmUdIz+f3juvk8hugel0fgudtuVLpuYWc/q?=
 =?us-ascii?Q?etu26/z7j+w/A3AoA5ew2ELDORzleOg+Yb+ygTqhmbH9voT/kg8NdbvlGljl?=
 =?us-ascii?Q?fFbhcrj8toJfTAhL6DNu10A3nUAtTiXPG3XavjFN8Onl/RLsMQINgOvuCvfH?=
 =?us-ascii?Q?q9Her20pGnVnFU/xiiPLZd1mA5g3TPCPSLZiHp1vOMtZO7bre5wlm09a4cA7?=
 =?us-ascii?Q?zqCt65BfjN+CCugchbpkxvywgMQjHLzJzREgIIpwdAyuKD22LuiRUh4DWw0O?=
 =?us-ascii?Q?sVyV6fU79Kcsu3cnrjYvAQhxPLb4XGzsVSpV8uANgxt6ZY8c7+aAIAps+fH2?=
 =?us-ascii?Q?+2UETzCnrHCGGLj5mYBRmAiiQlAXpfoL7jMfGOhJ42lNdChP2GKnf+2W3KYG?=
 =?us-ascii?Q?tNERaQl5sT/YJNBUI38=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IKAZDviJbcuKlhSsOO4imJnB07P/b33oAG5vX90043AzqG1TI5xRnueN9RSg?=
 =?us-ascii?Q?Dg4uqsgq8DhF2Rpl1wLpBvEMHTulEUWmnrQDcavZqrd65Zv1dD+KmzaUFWBs?=
 =?us-ascii?Q?eX9OqMUxcgMqZ3rUuBTd5N/vH694cFm8GUx3+D/JdEsHoS90kODocOnXo8Ov?=
 =?us-ascii?Q?jHcmrv5JOD60ILYB4GnhbGG8GGuBlCinKpbEgAMe6ONaXtdZILQBtyoYE9En?=
 =?us-ascii?Q?Qk8zKoJ+V4Fyx/s50LVZ6X7o4gh5s2ioipnhlbJCsy4C1jy7NfZYxooXNMSL?=
 =?us-ascii?Q?X/J7nj2mWZ7h18lZDTn5z/RvINWIFruGnfsuePCqhyC0yXatCeMf2z4SEpqq?=
 =?us-ascii?Q?XqHqmOYvpfDAjLVqdMZFF4D3A8FpL4/0QF4d2DQNRrS3Ie+pk/8mGbk9Uc3/?=
 =?us-ascii?Q?S5k4Li25qSkuCE9FGDzayAVWaocqe4Vh7Ryxog5ix4HfUP014SJ8FFhHCs9W?=
 =?us-ascii?Q?AuzrxcmW1gURAgfj/eFp3k7EfsXZoU5fvobwEJo/g4/RbDOH04BCxvYoTXlG?=
 =?us-ascii?Q?Mdh+c2f1mohXmvHLtxHO3pwVlPnru62RvI04GsJcGEoRe+KG7z8/s/Hq8IeX?=
 =?us-ascii?Q?bw360d/Qih+70gNhdIg/W0/WTh7Pspf+YNci4AF/e6+Aw4JEeL86iAqZvzqG?=
 =?us-ascii?Q?ptjQidseodeQ0d88iiel4dXCltmfznNhF0+WK/2DOyfQJWQ/px9vIQDcELK0?=
 =?us-ascii?Q?m5ME/3ezIfAh1G7EcYhglZV7WeJwrg3RYiYRd93rDvnOmGBhIlReVocexYhT?=
 =?us-ascii?Q?T1T2hKjefSr+ddFWrIekm/mRvbWXmndS0L3CIpR3DOYPgQgazLRo2mAGVHow?=
 =?us-ascii?Q?Jadhg51zvxAyM3LKMJfj7STeQ4FUkEEng80/7FdBjxc2gIK6P1vP0WkbTPiK?=
 =?us-ascii?Q?0pagohe6LQ8XUiBMkLjYUWcKSJOz3m++IejFTkA6hzAbdcZ7H+DN6iWGQSTl?=
 =?us-ascii?Q?YJENXzjxHOr+q6sKcmabOSnWg1qvt2uxG9xOD1v6zzXvIFmsdOh2Vn3DEMjC?=
 =?us-ascii?Q?zSZczJiLk5dHA7Cjk8qhJLuqjoSY1xeyQw2HaUO+AvF/c7TSkd9hJksAgPtA?=
 =?us-ascii?Q?1VBmB9xiaCFH7MtwDv+V0kvtPgTcFvuli76lLW+ey+9fxEajjaPT574cD3V4?=
 =?us-ascii?Q?IoyiWGTEfzKVrWGpbGJyvM0OdNtZo/WF7RcX3CvY+tzIn8a99JUoIUMi3a1Z?=
 =?us-ascii?Q?dhLqngKjsOK04HjuA1+uCLP4vGKS0KfC18ShFi9BHy2s/08BpgX5oYs0E+tB?=
 =?us-ascii?Q?QaIUlK8JiXeRt0VF1hdFPQs3dlGB/ogcJmDNt2xKPtahj0N8E3bAKHz7tVC8?=
 =?us-ascii?Q?obJodl2aa0zuBB4It2cR3HJ0pCQPGWGvqT99JEbK3H8fa2MlI9y0TpnUoWPp?=
 =?us-ascii?Q?OhyNO/fhbpWdS+MsMj2AT3RgRAA1rbt7jVfURnRY7qLf70b+dBfgDtzN4pMC?=
 =?us-ascii?Q?5wMeMVwV373Vx2a8b+ewvVHA3U/ZZUPg7mkiImcZOVQ4o21aPsUBGLKLYoKa?=
 =?us-ascii?Q?MkTgvYhUX52/kz3SEs7SqBvpWxEj/ZDWYXHDj5v0Qg4dJ9gKeTc4DLidxad6?=
 =?us-ascii?Q?Sl8N5i9kBoFPCxZlw8wAPnUnDSbopDnnelb/RoqswNiDkTBAHOlJ2OZApwY1?=
 =?us-ascii?Q?nosQImd4H5+4UW+6QvkLofOg4DP+VBuG/ODjLL2Gdoz5bdtdiB1F53DOgURN?=
 =?us-ascii?Q?4idIJfDXnkOhlFGyFp5fdvwpMQCnGM70I7djBwKICPOJPpcp6Lxzn/ZvfYMk?=
 =?us-ascii?Q?BxxgXGjNhg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bXOCUO9s9GHNf/qCXhm9CF7FcuvnODasxbmrWYtYrNaKZ3+m5OR7PRZF9Ksll2AB96F/C9+mo+7VnkoHiSGtKFUZxJdfn/6994/LVc4aagcEsD6L53XtxxS192OddxIIi+rz35RT0UD7jaq+dYl0bA1uD4qJL1gnP9UHrXnPvUAMm0q0fEENyvI+tvELLpKTDRPM8yn2u7FxXTilgghW8jGiXVXouMFRNaY4A2652NVb7GWHLuuUAS83B2iiMWYPvS0f1HVrSbkcK5ug/jb/7+qcNTmu/4FIyYmdSG++6Tt5PWlawHM9HxK0gEybNTvthzEE1fDfQ3K70AC3J7C8tbuG+BkFPwPQQ8S3Fxq0+KDz0HphsRVzYSlWpPLjRWYlkjNy5x9Npn/Q3+oa1T39jJrY/kgiXqBE6WbLx++E0rf+525dWLBwQrLVUhR+1oL/wsci4ufl+LknDWpSP916/GlpoJ5VhCK1K2Qyu4/siwhLMnVJTjif7VIYMtMZJ5qM4A8fc2dQFB4vmqFNPiuSM7I+yW0862CxmnE6MmKChcS8wu2PFvJtMzTGypT5AVs0hJ/n4q/hgoEcrHXqScvMc57xxfKc24WzTjIHbfFdPWkhESHM1J8MDoyU7KSKKJ5m
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa45869-8845-4d9f-5303-08de58cc7eb3
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:07:25.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3qsbb5lmEEiZyva1XskoWGuYsXINU99AI4XxiSrlDzWPav+tAG0IDQSbYDTnmkU2rTtMEcrKdZonzKdBmYxtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB1739
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
X-OrganizationHeadersPreserved: GV1P192MB1739.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: w91JWi6EozN6_MSmSBKDg_NkzyG3oDWk
X-Proofpoint-ORIG-GUID: w91JWi6EozN6_MSmSBKDg_NkzyG3oDWk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3NSBTYWx0ZWRfX6mKTbN3icU0L
 W8OkCk/kLAFxM9/mxznHF7hrEpyK9FwgNpB7EvMQJgpId2Rm6YHd2lWwYorvRsYauve+YEw8gHl
 SxrEgPJCzQIfy80Ty7G6o2jXdeITc2EOSzgFDp4DDdJF5JOW0n1WrLJcNENGjkTADZ6/D9s8snn
 K8g6wcPiV5qYaq/nOjGPMwWKNdvYNshXWrxOadzRPN8IRaMdoSS+YYs6/MeXad4FAi2S2WjM41a
 Pm+i6JGIH4A6NnKrj86jSmQzBTGk1Wo6D+/jODH5purqSqADqEumlLK8bVMtjpndR9NEK4BQtWp
 phpVOgJqKh80+6L4L2X70QZnbY9kpw3Diy+bEOEQkHdXzhpDGOJO10qJ3QV9ArmoUs/s4w7iKSY
 TeqZiEQC1GvwQkztic3RAqan7I3pzYJRCLNvmORuwmyrcFWWEpv8PFacD9gj94TdYjEXo7lmjIf
 lk8dIfu7sCFPZqW+r4g==
X-Authority-Analysis: v=2.4 cv=Xrb3+FF9 c=1 sm=1 tr=0 ts=69709758 cx=c_pps
 a=zd2gtXrgLElDIDyHc0M0PA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mGBEKmd4RZwSnpNTcYkA:9 a=CjuIK1q_8ugA:10
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89968-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[westermo.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7F8A5430C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
> On 19/11/2025 11:40, Alexander Wilhelm wrote:
> > Currently, the QMI interface only works on little endian systems due to how
> > it encodes and decodes data. Most QMI related data structures are defined
> > in CPU native order and do not use endian specific types.
> > 
> > Add support for endian conversion of basic element types in the QMI
> > encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
> > ensure correct interpretation on big endian systems. These changes are
> > required to allow QMI to operate correctly across architectures with
> > different endianness.
> > ---
> 
> Hello,
> 
> I recently (next-20260119) started receiving errors on Pixel 3:
> 
> [   21.158943] ipa 1e40000.ipa: received modem running event
> [   21.164616] qmi_encode: Invalid data length
> [   21.168930] qcom_q6v5_pas remoteproc-adsp: failed to send subsystem event
> [   21.175844] qmi_encode: Invalid data length
> [   21.180494] qcom_q6v5_pas remoteproc-cdsp: failed to send subsystem event
> [   21.187467] qmi_encode: Invalid data length
> [   21.191772] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
> event
> [   21.199088] qmi_encode: Invalid data length
> [   21.203360] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
> event
> [   21.210636] remoteproc remoteproc0: remote processor 4080000.remoteproc
> is now up
> 
> Since it's not well tested, I believe there could be problem with
> configuration, but after reverting this series, no errors pop up.
> 
> I would believe maybe these errors was previously hidden, but just to be
> sure asking here.

Hi David,

This is exactly the problem I was afraid of. When the endianness fixes for
`ath12k` were rejected, I implemented them in the QMI subsystem instead. I only
tested this with `ath11k` and `ath12k` drivers, both on little-endian and
big-endian platforms. However, other devices, such as your modem, also rely on
QMI, but were not tested.

The difference now is that, instead of using memcpy, basic elements like `u8`,
`u16`, `u32`, and `u64` are handled explicitly in separate switch-cases. This
raises the question of what exactly the modem and its corresponding driver are
doing at this point. Could you please tell me which repository you are working
on? I could not find `next-20260119` in either the `ath` or the `stable`
repositories.


Best regards
Alexander Wilhelm

