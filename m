Return-Path: <linux-arm-msm+bounces-56447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85483AA6A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 07:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 175431BC2017
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 05:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2D41A2389;
	Fri,  2 May 2025 05:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="MjFufoSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3D24C8E;
	Fri,  2 May 2025 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.143.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746162800; cv=fail; b=jZKBw2Q2OmuGFID7ppe7nkwTCCtxaFkdBMP7NISSmygSWqdJzNZ/7ImURJRLkI+rn4Powa8nNJVAXTFvx4NpgdDAUe8uSK9Swd4zARFEqxmldSccowhBGxWZiwD/W0xZe+otra/EpZLEsaEVNbWSDXZIh4aDIH6mMLKsrSj6l4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746162800; c=relaxed/simple;
	bh=gbZq0CM13nsZYw7Cu1Nmu+1w2iWK8Gsoje2FkOKiFjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=euhwj4jJDXDwnjyMgtyRMy/T/KsmS6nIzo//PLDGy//Mr2c9cv6b5WT8vNwBtBj/0Y3jMqrKfsAEA3VGum89ev4+ejg/k5UMaOyWM//VCkADG8+j5dHc9VKtdrI1w0MBRVLDnTq5zzWr2FyxmY4tCTcGqQrrxkCKv2b4pmQqEG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=MjFufoSe; arc=fail smtp.client-ip=68.232.143.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkim.sandisk.com; t=1746162799; x=1777698799;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gbZq0CM13nsZYw7Cu1Nmu+1w2iWK8Gsoje2FkOKiFjc=;
  b=MjFufoSeNAXE590EKJzqW4KE5FDjZfetaHuxWLqfXqvc04Gr3Y9pPZyx
   0oWUMWuLmepjcA2ANBP+GQ0GX/gsFJNaxQzqQagv2kLVIi2/9xGfgTWyR
   LzksUdHI5yNPk//Lx1iV5iYaLznwRoW/+encnW7Ejbn2yQOuPUphYGdEi
   7k5ggbT74GJjyM/kBYiSOW3//X3zrnCh76cLMr1H/7H01GT9KebPToNzD
   QxzDBI9CFHyEjxqhNjo63EYowDO+ZUyJvE6sAIM09jzk5wkt76h7qxU/q
   nhO19f+IsQkDNd5FFb0QJn3xX2VRP/wYBxjJyuCQ+rdi4JG+puKIQuGPJ
   w==;
X-CSE-ConnectionGUID: 1V3J8Al7Q1Cp24Ig5h5xmg==
X-CSE-MsgGUID: RS9IkHaZQvCYUt74vni69Q==
X-IronPort-AV: E=Sophos;i="6.15,255,1739808000"; 
   d="scan'208";a="84004110"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by ob1.hgst.iphmx.com with ESMTP; 02 May 2025 13:13:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7nJm5rFSRf+5XROHUQ93j5AqqmSYgk0aL+8CJLAl8zvpyyI0+4cDnwH+5UacxxYf5UQXRW6mENkK3qUpqjjlt0DCscNuTqTq8Je0nA34cTlqd2kEzyeUs4CXt3U1xRYe06y6+N3DbQjo/VzP//sS+NaNNNaY+GCv/lykPiFfIRWa72eJrtY9Bo68YtumyQ3B+S2tGh1sNa+EwCD0TgtDZSuhyV77v9x1VtCdmvpAvDZX38qhuoYMfCsb/LOQaRy0wem9Icfo6Wdvw5uufBr5u35WOCwo795k00ua8/2gMu74GxruqhWM4bDpAo9/mJPULDdMyYeCs8u6cmc/9dNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gb0Cn+81IPn3VNBXfZOHcov5mlyt9a/ZBPuqvxhcp4g=;
 b=mbSL6Kxz/TQdBTcoQScvmLjvvZfvFil3qdg+eu246CloCe5d3QkHu+bCtb2Sb9tTdt8LVEcPjU0ZHAjrk2D46/WxNfw5miIJ47CXWOL/iVp1rQX4WCqme5OIbuNkq+Qk7pmMyUJVOSno9OQqiOHOLuUpJOVOa0eT475FagpcH6Xvev/goqdsyYtF88AXHUP6acu17du/IvOe2Ak8hGgm7aPaif0cBp8MRsXyCyMX/mTpdnIJhesjDAGFy+yIK2qbx90wZ8eEIbBr4cUbVq7Im5AermSBjqw3XdQefq+rVzEJNpjrNJehOB3yz+kez9kc8XMjbUB5c94C4Jmgo8GycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by CO6PR16MB4226.namprd16.prod.outlook.com (2603:10b6:303:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 05:13:07 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::436c:8204:2171:b839]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::436c:8204:2171:b839%5]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 05:13:07 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"mani@kernel.org" <mani@kernel.org>, "beanhuo@micron.com"
	<beanhuo@micron.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
	"junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
	"konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core
 Clock freq
Thread-Topic: [PATCH 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core
 Clock freq
Thread-Index: AQHbuxpbG4wXcPva2U+BeYXwfIFn5rO+ysPA
Date: Fri, 2 May 2025 05:13:07 +0000
Message-ID:
 <PH7PR16MB619617AE20ECBC06E548EC24E58D2@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
 <20250502042432.88434-3-quic_ziqichen@quicinc.com>
In-Reply-To: <20250502042432.88434-3-quic_ziqichen@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|CO6PR16MB4226:EE_
x-ms-office365-filtering-correlation-id: 72742ff2-edff-4ccb-9565-08dd8938068c
x-ms-exchange-atpmessageproperties: SA
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MHYM/bgU0yPNH+Q4aUongbEyv/Xi9jnLcPZKw+P0BlcvpfaZifuwAu3FTfWN?=
 =?us-ascii?Q?LWV0A2Ra3xHYS+BwpN0HqqjGTvIDvA6DL3i/qRSkjrBpWXtTDq07no8jgp/9?=
 =?us-ascii?Q?B2rw0p7j/YhkCgkpCi554y1gkebadYqJ3KP6n7Nxg8TygCnpjfkJUOxKAd37?=
 =?us-ascii?Q?NloUj5MnHVH9+kpZblok4S5qtR1WYtYCH2MYvR63QUX7Ft+98TlsUMdwKLqw?=
 =?us-ascii?Q?aFKjpRezPRRLWX10VPL8STLvfTMm/TH9SZbU17SJYdfNc6i4T1uzjnIidJQC?=
 =?us-ascii?Q?5a3sTwdrgjHuOiOJ2QwKRfMW/HEkTHo0oT1qvmuaaBSGTcmp9WR7tqFNduG+?=
 =?us-ascii?Q?LGuT2YBSz+n8OrEaBHxDJnzOzhRlD4KCZLMnjFdZx5Ik4o9ebgQdrTnqPxcJ?=
 =?us-ascii?Q?OkJs8bRECF3s3WuC4uFBtHDSHgDbd6yN+eH8kBZlMEkBk3FYm1PXelQq0sPx?=
 =?us-ascii?Q?KWK4c1t9RFVT7jq1CFxZ39gmGtjrdgHH3aY5r6nNK9tj9Wi1XeG76e5VU9pr?=
 =?us-ascii?Q?HcZMiTWKz/ii50TsxrRKdhTisekFL8gpQEht7hgnQo3PAUdDOt2PUY6WKIkX?=
 =?us-ascii?Q?gb0HMBwjFEN2V/zH6Qh4UxZoS4L95tO3PTHLqQmJuNtAxU72RSVV5s6bxupH?=
 =?us-ascii?Q?xgcGwnfnnzpV51eg6VPqdGSepxcuQxa0Ov6YF4v0TAqXDXN1b4YKNiLFySJE?=
 =?us-ascii?Q?Of7fkVPDjGXNLDiWOIYq1uXeohNPsptb9bdV8KQ4V+rsuPF8Iow4nTJ9aClh?=
 =?us-ascii?Q?4q/9zdtoBPJZWAQ0o242CVgsLllQu1/Ocol/DoFOhEAoco/uGHUPcq4KFZgM?=
 =?us-ascii?Q?di/VB8+ZJu5vNCQSaTvj4sViS9TRnxf511VbrKfohqhnb0u8RdAFn3uJvQW6?=
 =?us-ascii?Q?kA7tUgfrQB/8iZy+wj/fQ04LARrTZzp3fAXZ5FEHY/B4nojzYcnSUDoi9iQP?=
 =?us-ascii?Q?DLhgkfd77dtWqI+f5ukvw4hpU2Y4N1tstTIYqvbdSY1gdRN8dRlBlsej8G0D?=
 =?us-ascii?Q?NLrvIiKqk3uDmQozfdtbfFOFWuAe0eaxs0ioCJkDbdX+DX9vLldAdi5S/bfC?=
 =?us-ascii?Q?Wk4NTlwrc+uF5Gm6g6u7Nf+3fykEl+G+tlEsoivTKk9SP9EPkjSaaO+HSDoY?=
 =?us-ascii?Q?/1SoxsAsZQuuiKRaArgOeHqIKveG1HjY8GtfE0Lxul3//1UyLqlz3n4q+lth?=
 =?us-ascii?Q?GhLJOdO6eQeJv8U3v8J+nVWnVUPrPwCrmWGVrttrwSYC9PENYGSUMxkW+Iv3?=
 =?us-ascii?Q?qSoo3bmdOq5VOv99G7JAPM4Gzj6kd7/LiyvVl+ST7KAWQnyrmSr43YboJ8Z0?=
 =?us-ascii?Q?fsYXjZLD4RrO9slN+uKq2Scu5L5EMdY/IOGChAuASE6G/diR4RWxBOXeik59?=
 =?us-ascii?Q?tRWXJkHLfsMcpuyOgpn5Xyg5gJSiTym2ae8Eie4XV/Oj54+dhNmWaIjabqs/?=
 =?us-ascii?Q?gV9987AxoThiJugaSwt6SfNGhkaoslJejaL0mnmSkVtOtBAXkmKOYY8+/l4M?=
 =?us-ascii?Q?HuboP7/r6erADi8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iG0FWedV4cLV65X/TnyhUO/Trqlug2CDf69VMYR6YdZeKAw5nnCxsj1W5Ag4?=
 =?us-ascii?Q?d082qOERVPgXv8HTReYGd7lPCQkqPoUYLZ+uCKg+CP2SB6RX8e2/pGyXySdW?=
 =?us-ascii?Q?YGrzm944mHvVtr9WzAi3vRe/PKtrQpJVdpaJrU6ZkrLGJUSKfZ41RUhlbGDb?=
 =?us-ascii?Q?mJGL/6T5cxuE7jI0ZzyRfCrlgf73kXClwkhhRufYV/LhjDG9Hzw1Wzyzspxm?=
 =?us-ascii?Q?DGGQIDTTaLPsp4tJkBKD2GJ6PH9OufY/5reBUJtRJPJXjT3AqBnziAnKHYFJ?=
 =?us-ascii?Q?Pd57zy4vJV4FyQW9SYwWrV/bq2+KTNhChsyNkFF7Z461e8+I/oI8kor4mi+j?=
 =?us-ascii?Q?RWK0IAcH9BfN2ZkVsibUQ46CvuH8lZUliZn4vnTQuZg4m5k4tpF3SMQLGuHH?=
 =?us-ascii?Q?6GA1Tt/j2dTOMNgFY/wyFI4VV/PYpo9V/Xos0/WloebFJFeP7o55wo9yu6GX?=
 =?us-ascii?Q?kJfzzn0Zb0qvDo9U+Spg+Qc+B3l6OswCK+vaf/jzYG8AVNkO31oBWR9mI82m?=
 =?us-ascii?Q?8taFpPwkrAKU2zABj7unW5qlLWZJ3vaUYkdAza3qYpavdbfLddfjKdTkta7q?=
 =?us-ascii?Q?Et/Sqz8AI2gUdXdZ6WK71ImQu+jxiZJB3aZbHjDC5n7pZs0op1ObsL8rauXs?=
 =?us-ascii?Q?0GIlni6eLyWRmT2nDMZK501hEnlvWqMLQKhaaVN7C7n5Sj7ctC/EDP8koGPw?=
 =?us-ascii?Q?juTE89UHCDwxDHf/wtuFc0eE+bASbWA8tC3P25hFhvrkSCpfaoJid8Rt/CnN?=
 =?us-ascii?Q?7y8CAOvfqWWhZvekzfUFwg3ophvOvf1nmCgJ3+j8SkCZs59x1D5MnzRvnfJH?=
 =?us-ascii?Q?xvsAQ8Raq+8WDtEtZuCsmzzXzrX67RYwKGxXs9YE1af9wZoNchz3DFB88kQL?=
 =?us-ascii?Q?xbOubav2FNENEXHRFa2iT5LxXNTRJ+K55P4BwYGrwxDFt7gh7vdUjM6Vd4qs?=
 =?us-ascii?Q?enrlEP3UYA1i7z3/+qmsPQeDqKM+QCBfL/4nXI6xncfLTiNZhjkI1K+qu90T?=
 =?us-ascii?Q?j1hedQZMpZbGH/4QjAw0QxuFv3cKPQ3cCpUJi7H308q2ASmvNyhXduKerhwi?=
 =?us-ascii?Q?zrO28qAQOBvdhyd7F+tbErK1KbxblkyZYawODuHbtb1/SdY028yQ3ow1aicN?=
 =?us-ascii?Q?BmDV/DrnzbkGAnRSUl1+6YEq84EksWbHk4hVdhqFLsEr2QdPtIDAvunI/tKX?=
 =?us-ascii?Q?InYUEycuz/GsYj1yjYrw9Ew6Vl+9oAXWlUsqefspJzSWxdIr7l8dBT86MVpH?=
 =?us-ascii?Q?v7J3HmHNdNQt+hVHElZ+zS6XNOhJ4uoKs+Pk5q6JnHhQvfqRUfCTme+aB3Xi?=
 =?us-ascii?Q?C9lbnEWjq5ZN04+r6DuOuWjiopE3Zb4tIy/LBiNikf0Qo/pMZ9KRj5FblKWW?=
 =?us-ascii?Q?I4JHpuXObGtS2HqZuynofm3B045TRumyTm7zOS7JeSEBgaP41yn6o9f2PNdR?=
 =?us-ascii?Q?lgoDKoZu4yCiwkkC695smlZCZvFF9eFBRU0AzeepYobC9o0XDE/zyDZ5QCT5?=
 =?us-ascii?Q?EN0CRLPE9HLH1F7/CVr8z6xmZQgvEIVYSLIRtvSetKmMBwJJ+6P36mcUHXGa?=
 =?us-ascii?Q?qc2SUGCJLYWh154Vf15w1rl0xCtLnoLSl9oGJ5Oq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BoDm0LqoRi7WKBGNcwMPBK6ossQaGIt4rvK1hND6tDHrDXZ3rqfjz4Tyceu7bX1fDf8X0bJt1SfStRCf5I/5cnntSJgCG4bcXuXLTGN8ABlqc1JDQ26VMXAI53Nf1R04as8TnDRkp/VQsm9VJ6MtI/7KPgkMaypJkQClIrup83APwTqS64z2UHN+1f3myS3mE7yXOpL0WKro82NXqiqI7H5+Vw7gOUKBnK8UMjnjYlbYHaYRD80FPXeL1b7X2zf0zVW+uN3ziV6b5ZHVmAJCDI83ShWd+cV5DCSCOXNnTMYDBI62DlHbdbemOr1kxLRUg1oL4o2/FhUvfBpQoxW4KsdsohKSHmGCcmVe0yWsdDcAUmzaIpCdJn2NH9dGo3KZnbfUQTc+9eArtXCtWpjWI+DPW49fMFM+2DlngUNor9YwMwbD/MvWMBYtta9vCU/yz/7FoGvKLivDi/Pq/TNu1WGVM+ve70oHxBbXknUYq1lZ91HPa0GJeQN5cYmyBf/v3mRPvCVRYKRaTFG+tfTR3rabTfZaqjtzqlt4AidX77aOhDCOEsBytIwMgGRi98gzE/pE54fACPrXyD4QBkGN7RY3igVRbZgVT7s13bzsNxt3ROipbYNZ4BSdO8uxYgo5
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72742ff2-edff-4ccb-9565-08dd8938068c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 05:13:07.7268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPNs+WEZl+RgRDBNWTrNwgEp4VsT4HQpaWjWf4IOmtXRYrtHSBCFInoEbn2VH+3PoE+j+9bSIVUj0G3tnD/YgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4226

> +			cycles_in_1us =3D ceil(clk_freq, HZ_PER_MHZ);
Does ceil() is in fact DIV_ROUND_UP?

Thanks,
Avri

