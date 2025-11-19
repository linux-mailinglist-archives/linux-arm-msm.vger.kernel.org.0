Return-Path: <linux-arm-msm+bounces-82438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 08230C6D5A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id D79432DA65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AC628DB46;
	Wed, 19 Nov 2025 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="dMDJVrKA";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="AsTJNyFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25121E0BA;
	Wed, 19 Nov 2025 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539899; cv=fail; b=EYQl9AQA0kw0rsFLH0lDJ2VHSyQqpyWIjiy1Uu7lbLDoqzwOhWiGrSYc+NuK6I3sRTjWwJJFxFW7DyrSLvrTUX8pfvuh1GhLywgeVRVJvl8ODrURZVqpm4xpKSMvaxu8annMLkAHO8sintNH+PQL355eZiJxlWmpMP6OgeS5ZgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539899; c=relaxed/simple;
	bh=jH7FwP1rmukx/oqKptqyepqcBLwQZd2xPwcZPAzcNQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DLJIXPqkzBQitiDffTM46hsSTrOQ2nX8SxcBAFTEVdstbrXKFfkWGRKAk9IdJCxDpeZgkuVS6STGUB10OoA1LeMJTsrRLel07TWOaiz3RR2PFiV312sEbragXjohabZOXCSigW1BUcSHgyjmJ1mv3o729Aky2hD1ij9EidQJhsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=dMDJVrKA; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=AsTJNyFp; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7sEnk3973457;
	Wed, 19 Nov 2025 09:11:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=AqBXhgd03Mfl/Uf297MWVTg3
	1tcSQ7Kskh/vlfCDIZY=; b=dMDJVrKASSzbcZa57+gYqWLpj16JxyfgNGPmymDU
	9HbvPJRNI1vSUdZjSBgRK/9Lq2yWrxZEq5uY1nUvr6RFj46z0Pcvt5rUNYGMmVhX
	Q4g7DgVHSEeo526LUnAKO6HTerNvlPM/4nx7UZLRICNxKwHM9KHY+irtav4jj6Xm
	JXVwTUvULa8RG1SWHCbSUALrwbWdLkV6EAcn4qb95/KXWJhtpNYl9yzDNuo/jtz9
	23mz/ParmZrP+5AL4EPTEIzU9j1kL9F8MbqkszmdYvGXFXcFf0G4B1ZC0BOlmzNM
	6GaIQrz+Q0Zcw86KR/SHBCHg+cCGtK4mnZ7yh7ET8XANew==
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11021106.outbound.protection.outlook.com [52.101.65.106])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4aeed53q45-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 09:11:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rq7FEjDe7+BEp76QZ0YZJuBbS18nW2U0YYYSalA1xG5uudJuVLwxT3GZfVJs1paQFBaaTu4cdCk1vNyXwKpGbqyiU8NseLHnfdwCnPyKIjnqmeB1mKP47x22HwwsR9X8fhlfphpdIdZbw0LGVaKN9ctfPwpcx60OOwN8EmU5GrxZBUlLZv5NuQesVHamvgC1+FmxDHbl6mBWqGk7LivxBVuYo6odk1eC7xTlePtrhrjGGbJTpA2nIK8ZW8PQHvx8GiNBBCfeoUiXcA+IIxY5T93lkXPI3R9zBqvOc1FJZcCDD2nxaEv3liHLeLsdonFUSOomcaNjxbwTOUkKT3hG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqBXhgd03Mfl/Uf297MWVTg31tcSQ7Kskh/vlfCDIZY=;
 b=iP1fNJhIINQd2y3U3n9YkLbV8vIzy1O5ybVvrBA1O2kQ52oTByQYaQ4gvKPMjaXuwMaHEiBeuxq2cJsvoGwlF1e5pCClP2rJv7t9p7qFzY1nTnRMqY22GriZnRp9wQuhgR2IMZr8eyUezHCzMSBBk5XtUgmdsC51302SDKykVtUoRkf0zvFFFCzSo9qso7YJr5Eaq8Y3mJqd4E/Ncuy6q1HGDlmDf4F3CA2paCP3kSexGciQKxvrvJSvLyTr/OUmyue46Tq23ll5nhgF47yfzbacenIBOIVQbXr2ALxW+VlyOxJ8K3Rebp9p72Wuk4HZbex75/DFQXKHaqqzHUiAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqBXhgd03Mfl/Uf297MWVTg31tcSQ7Kskh/vlfCDIZY=;
 b=AsTJNyFpD9357KpqV/N+9ajNhMtAKRF3N3JFEiMs3bPOSsWxL8L5hrkVDT7io2hW/9MnqAkza9stNOQRRfJIhj0+v4eNuRbLJ1cWfiQvqYqYnYsnpKFVZ07EhW9kpLufupA/+sGQFP4Gy4QGP1n/OyEwH14pYH5V7pZGujbzZSY=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by AS8P192MB2142.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:635::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:10:15 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 08:10:15 +0000
Date: Wed, 19 Nov 2025 09:10:12 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 RESEND 2/3] soc: qcom: fix QMI encoding/decoding for
 basic elements
Message-ID: <aR17ZFbEJknzsdn-@FUE-ALEWI-WINX>
References: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
 <20251118065343.10436-3-alexander.wilhelm@westermo.com>
 <gsjo45cfnhonmstce4egjtid7u43klgxydmxf6z55n4wniv7xt@nqarkxghs3na>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsjo45cfnhonmstce4egjtid7u43klgxydmxf6z55n4wniv7xt@nqarkxghs3na>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVZP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::13) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|AS8P192MB2142:EE_
X-MS-Office365-Filtering-Correlation-Id: f162d97b-7930-4db0-1474-08de274311ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mjyVVdkEOBYgnK7+5KyWikvAY/EDh+T92nkNjvg4rSfDxXed1NKAJCg08mCv?=
 =?us-ascii?Q?rqYrMk0vxc6kWvrXZ0I+vO9Gw/IG9FnZhSnprgO8mFBckDbu6kgmwlb2CROA?=
 =?us-ascii?Q?aM+OcIWsUPVrUazO1/xj8fiGF6bZ0aCKXFRqP5p+ZzwC/gR7vYCsJu4l4Ej+?=
 =?us-ascii?Q?+VGSupxOGXldWsbQdzIKL+tmFlxj6laGFyl/+iz9nkykfVJWQ5HBplU6O6Jd?=
 =?us-ascii?Q?NxwhLGhSb/6N86pwLcw6duPt7mNtEGr8pF5LRjjFxB6qWtbaALcJN8RTWlZG?=
 =?us-ascii?Q?sI1skPfuSkWPRi90GOZxpWzIHSioAa95Df0MLwN8SRI+UnxHYJrEGgbbzl60?=
 =?us-ascii?Q?UKp1d/7Yfe24lyWtRcY/w/7RJOsDclylhxv+MnyJGDPBLZjHYmR0ivEDPKwJ?=
 =?us-ascii?Q?GALoaklzfsHfrhpn8lfrgiWpHWNZcridpRHbQhzsIIRpB0whxg7Jj+bi1WSx?=
 =?us-ascii?Q?MDq6aLhs88Qn3HzQYy7RkPM7A56v68tTZgbrhQ7YwqPj4JYV0f2nrrqZ/h2b?=
 =?us-ascii?Q?5OVYl4GWMGvXEP0xeyrrysQMoF4RkESxAjyzDbx5zuDaj3L0oi14Jj5qba3G?=
 =?us-ascii?Q?URcs076alzmyBVIDKyPtTci6PmB/OdxChZS7kaFYyTGEWpEECy+r87qvaSIZ?=
 =?us-ascii?Q?EdSkXuembrZiW2/tmX82DCVnc5RfmDWYKzYsKqR/Zgz49bU7hb+llRxaPHgR?=
 =?us-ascii?Q?Sbm6T4xEAlOwA0kFMpVtbWYkDS2jV7nf92whaVw5pALk6xGBcK6/2b7wsGh8?=
 =?us-ascii?Q?Qs5yCVtLG8/6iGv5ijI52I4OBmR0EaXHz+sQ8lF6NSSqGN/J1lNijKR0gC3s?=
 =?us-ascii?Q?7zH4J86RrP0idNn94lV8QV52fb1vi9ZQfy2QA3CT7SPN4BdvDmbuiKP0A7zG?=
 =?us-ascii?Q?3kGrbI5YY3IV7BCogYBkAOH2AZMs99jKntZup8hwxtcEG2Pnj61hFXMij667?=
 =?us-ascii?Q?y8EFZEuMLgmuhISgPCthofcby95+xt+7CMggUAqEkd1gKonlt9sXK0hsHVqg?=
 =?us-ascii?Q?fJZmyrc6ZwIARYmAxEnRoiF8dvhArKLSNjWvfkPJZUboKpp6IkSh2+r2npnr?=
 =?us-ascii?Q?qZu8tTDcCD/ffZXRuh/CwKts0nx9uzKomZRmOEroE17aQx3gtLIBEd+rBPqS?=
 =?us-ascii?Q?piNbqlIFR5OuiQ+gWV/VOUAFFOXrY+luUswtBR2gT3v8WDd4fFMOZuAyfUAN?=
 =?us-ascii?Q?oh2Jp6rUhCvC7wZHWVbV9uDdyHqJCoFswDQ1Do3Jerx92pYxtlArjhbILLiQ?=
 =?us-ascii?Q?qdMuNTQ7XW4NCcIClhrGp89WaP5tmZzt5fSXfm8tg0iOKrciQuv79qRGH8Y6?=
 =?us-ascii?Q?p+TYjH6SPiMC27WxEsd8scKAKcuE0FLriBCOvmRG/JK998+yxjGwGuiWaNOX?=
 =?us-ascii?Q?RZAlO8/nqEi9nxdBtetXaJwWV8XLsve70BxGDQkyxFL6xCteUC5fEoZhDK56?=
 =?us-ascii?Q?M5gOkIDavM9KtnHraTirlD5JXSpB7uaU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ejj286WIkh72n84bT7f1N97GKfcsBRK84SFdmPoHLsQrnlYrXSO9Ezas1Fw?=
 =?us-ascii?Q?J7irle5BCzk7UaAWmE3+lqvZEVJQLakohoPf97roXoepr5t9Y0tmBbioQXJh?=
 =?us-ascii?Q?6khTE7kaTl2n1rfKkpUtqSX+1PYxyeZ5hrmkZPXPDoXNPQCJ37F6gZ0iXB3g?=
 =?us-ascii?Q?0Q9gk9U0PLWu/LOJnlR1pKH4j1/C4JpFaDSnCbrqpjvtWQL1DxamPqlTLsYo?=
 =?us-ascii?Q?6jUHhfXEwwTV8pkqNlGqyWs4aNm5OMQ7LkX9mIy6Daz+fFrnOEhaunux38nb?=
 =?us-ascii?Q?PbzX102oBEYXQPy8s7NeOkhmQvwBaMKgd3GIYwd3im7bVuSA1W3rKaamSwEn?=
 =?us-ascii?Q?yWk5jm51A5nXTpeYGmds+wbr8vdkvJ7zY1pCXWeEukt7Iy3dG/c6xNDqCkbA?=
 =?us-ascii?Q?sNPXJcthRuZ0K/WlF4ohY1odMaTfbHjgumpDs6RToiXxyRrWC7KnOx4w4ZXF?=
 =?us-ascii?Q?mnChohS51V1xNd46anbcEJ6/fEzjXIjNj58nH2y3N4DKE7wyFwbEM1B8yaKD?=
 =?us-ascii?Q?gtg9UvjhZ7Eifac1bmJI621ZYM5jl7PD2em1frE2XMoTGi1Fuo8b3WxVqI+U?=
 =?us-ascii?Q?byG8rkNa1hLLAN8oN9ErzTTNWUuadFStbPpTX6e563/6/Q1ylyRNDhmME6nI?=
 =?us-ascii?Q?6ad9Ghki/xxS1wSqjRVOpYFYLxxfieMxtqlHkrz6M4cExi7WW1mn06sh3DGq?=
 =?us-ascii?Q?dGUO58kABoGdFsgOprf6dAZg67nDuHRAhIgyyP+j8NwxDvwzYSn80v5N1wni?=
 =?us-ascii?Q?kMw7E2p2uJgEp8f5XeRA1J2Icj0scc6dRVUdZ2TBMKRcAXQ22xxVgsu7jirW?=
 =?us-ascii?Q?yQT20oLx3bGYKu8BEEp4Odt6YQyd6Jvk/fVbttT1ClHqg2X0qlMA2ya7HBRz?=
 =?us-ascii?Q?Fbp/qKfhYYPtRBu6XoxWv+x4dWHzwnQfpAaMlS5YboLNuQGrG3Ll61UF+yiS?=
 =?us-ascii?Q?j1LZ09F9eYSesLzT7e8LeIWcUg5N+hdkE3xlq6Kex881yG66MtcbC18qA7WM?=
 =?us-ascii?Q?JogNIxel4GoSZeIhxYc7xG+EFwE6s5nSq1pI8NeQfh1s9gPZBetlJbEur1sT?=
 =?us-ascii?Q?Kuv+reHtXoDQ45Q+w0euvHd0iB0rKAZKg9Ja9O8Ay07J/P5Cr7bA2QF3X4RO?=
 =?us-ascii?Q?fktyqJvG7+DEI7RsBEggVzkQw2EXiq8IkW6VAWeILTG8nb8BN7NnDe3jFc4I?=
 =?us-ascii?Q?MgRVuTNO/EXzSVGOu4xfzkanxsaASHAxHtIHYIhLKdEqPBZerQisRZtdAVek?=
 =?us-ascii?Q?Ag1vkb0w6nUNnI7YQ+QmUMlo4hRnhobJOPvahnQeORyZJntcU+/1hUJ9N6e+?=
 =?us-ascii?Q?BGBBSCDA68CbJhkzNsnWfsC4g9kjAaQkvmRYJNrQ3OmpzUVk3+q3LIqeS23J?=
 =?us-ascii?Q?+0lj44N8KS/+qboQ30ksiWoU8NYr2oNW98tR9zZpPPL40p2rcR2o7qjnRNJo?=
 =?us-ascii?Q?Indtlq9+ETwFyNF2a7yhtTQ5VEeUYX7rie69rAMNAHQUe6vycLKhPZpZFBwG?=
 =?us-ascii?Q?TlbfBVvM6u3NozUzxd9BIEZUbpdDFGZ+N5kryOpyqAHjs+oKzB8FASMwCqZp?=
 =?us-ascii?Q?V+jGDWAhQ74vOukqf0sdvV7nlsJ7D4nSRZEzaD6g?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DE74HKuoHO136/WQiyfAHCKvTkf9ewxbfBAOGS9o/Q5o3+8hBYg7OQj/n8O5xF4fGqzChs/6PztL9wAuahZje/kXlLF1/YD5VFYy1+m9bIlOSewnJZZREizzsDcooqr6njVvaP4wqgTElGAy6L6rFGP1LwvJG5y1Hf43DUom9zQcRYmx1orFhgT7dMwRDSM9lZdyQQ92AvJOEUp9ckm/DBmvMVFfQ9xABv8cCg4mQrLUf+IXgkg1LnTKF4WDUpykd68ngWRyVuhR5naFTqCBKzoaqN89HZe2vjHWgA2zs0M28ZanJbdhoU7sWePVceoIUxJJMPfy2hASSxcAqI2cnCmnriSA6Ullo1EdvbdJx0ju7WbDfMrw5o9grprhOR9KN1RgpRPzqHH9gEQj4wG14GUtWAVeHBNHWlNhoanUQWvSWYc4L3JMTY4BmoSgzBrp7Ea/xbfxJeQZw0pS4AcT1T/KgluiYFNIGldzbxNmRJAqa35dDQwbRaz1PAumwB9Go2Iz1J6FOB/6jRphN/OHBdJYzwgpP0Wo2K+OaEAVTak6/K8H1YQdCbqYlgzx4PKeWZv7uK+l+o9tZhwxDvoMVDDdibnBDiGwJYcwEwD/83iqSng7F/N1JWjPcwwxFJzH
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f162d97b-7930-4db0-1474-08de274311ed
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:10:15.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4cTDkWYVtzWyUJYJCq/OHhRH2mo96NQcgaY/d6WfzbhVuV95Lj+V0EJWscTgxMjAg/Bbe2TwMU9+D7eGcDQIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB2142
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
X-OrganizationHeadersPreserved: AS8P192MB2142.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=dr/Wylg4 c=1 sm=1 tr=0 ts=691d7b97 cx=c_pps
 a=E4/gK0lj1jNknlcuwEL7eA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=MnPdGcNYx4g6ZQ2NV0MA:9
 a=CjuIK1q_8ugA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: FJHn8UsjKNers2lFyrKDj3EOFbpXZ-j_
X-Proofpoint-ORIG-GUID: FJHn8UsjKNers2lFyrKDj3EOFbpXZ-j_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MyBTYWx0ZWRfX3c697luZTaUM
 Jrqo5TQmJ0XVrQgwU8pN0hoV5AyKeyGbFMRukccjmv0sxAwnSqNat/3gsOfZp//HJrO1EG8Qtz8
 fbhL0N4N3W5/Htnt98Phaf9ooDshW2n1E6E9Jc1oFkMfhRCmwtol7GG+zy1muU2g/wdopCOj+KK
 VfaEatS7TtMr8RrWZEHoCVGfRwHLkR8015ZEmfDe2G95jg2xHdwyIHqZr4MO5unPEqv/K4QY/Sj
 bJhZfjK/w+em5w4ayOfFSl0qMK90wXq1fwzf02jciSNqmRpEUfHcP+/y13oB2eDTDoUKzDuy1pp
 PfW5TL6xGFv5bMdz+vcb2nFt+PeYhZxsp5bU96hDvCW8C4aIILXcx+ve5N9vp6S6o1/ULZvKrZj
 mWLoVRQyPM1B1FLmfsO+D1jGjQ3vKg==

On Wed, Nov 19, 2025 at 10:03:41AM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 07:53:40AM +0100, Alexander Wilhelm wrote:
> > Extend the QMI byte encoding and decoding logic to support multiple basic
> > data type sizes (u8, u16, u32, u64) using existing macros. Ensure correct
> > handling of data sizes and proper byte order conversion on big-endian
> > platforms by consistently applying these macros during encoding and
> > decoding of basic elements.
> > 
> > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > ---
> >  drivers/soc/qcom/qmi_encdec.c | 46 +++++++++++++++++++++++------------
> >  1 file changed, 30 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
> > index 1f9091458d72..90a48fa7ecf4 100644
> > --- a/drivers/soc/qcom/qmi_encdec.c
> > +++ b/drivers/soc/qcom/qmi_encdec.c
> > @@ -23,13 +23,6 @@
> >  	*p_length |= ((u8)*p_src) << 8; \
> >  } while (0)
> >  
> > -#define QMI_ENCDEC_ENCODE_N_BYTES(p_dst, p_src, size) \
> > -do { \
> > -	memcpy(p_dst, p_src, size); \
> > -	p_dst = (u8 *)p_dst + size; \
> > -	p_src = (u8 *)p_src + size; \
> > -} while (0)
> > -
> >  #define QMI_ENCDEC_ENCODE_U8(p_dst, p_src) \
> >  do { \
> >  	memcpy(p_dst, p_src, sizeof(u8)); \
> > @@ -58,13 +51,6 @@ do { \
> >  	p_src = (u8 *)p_src + sizeof(u64); \
> >  } while (0)
> >  
> > -#define QMI_ENCDEC_DECODE_N_BYTES(p_dst, p_src, size) \
> > -do { \
> > -	memcpy(p_dst, p_src, size); \
> > -	p_dst = (u8 *)p_dst + size; \
> > -	p_src = (u8 *)p_src + size; \
> > -} while (0)
> > -
> >  #define QMI_ENCDEC_DECODE_U8(p_dst, p_src) \
> >  do { \
> >  	memcpy(p_dst, p_src, sizeof(u8)); \
> > @@ -225,7 +211,21 @@ static int qmi_encode_basic_elem(void *buf_dst, const void *buf_src,
> >  	u32 i, rc = 0;
> >  
> >  	for (i = 0; i < elem_len; i++) {
> > -		QMI_ENCDEC_ENCODE_N_BYTES(buf_dst, buf_src, elem_size);
> > +		switch (elem_size) {
> > +		case sizeof(u8):
> > +			QMI_ENCDEC_ENCODE_U8(buf_dst, buf_src);
> > +			break;
> > +		case sizeof(u16):
> > +			QMI_ENCDEC_ENCODE_U16(buf_dst, buf_src);
> > +			break;
> > +		case sizeof(u32):
> > +			QMI_ENCDEC_ENCODE_U32(buf_dst, buf_src);
> > +			break;
> > +		case sizeof(u64):
> > +			QMI_ENCDEC_ENCODE_U64(buf_dst, buf_src);
> > +			break;
> 
> default: scream?

Okay, I'll fix that in the next version. What would be the recommended default
approach? The QMI protocol only uses the sizes mentioned above, and previously
the data was simple memcpy'ed.


Best regards
Alexander Wilhelm

