Return-Path: <linux-arm-msm+bounces-94014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNjoCn0YnmmcTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 22:30:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D418CC76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 22:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7299D30622B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 21:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED9033F36E;
	Tue, 24 Feb 2026 21:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wc1/QZQO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b9PSWzaw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAB33DEDD;
	Tue, 24 Feb 2026 21:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771968630; cv=fail; b=KhKsa4I5FgEqx73Fja2aI+B3ipklsnREXjoxuPGjnDEUcJ0mBd/4Yh2mqzUowFvz4x5V47JOzxHRjiRu7rsK+oycSnEUQEmv6g2aoB/48WY4u3EGhLx0I0tcd46KBg5jpnz5R3URxojDTL9rldzkFj+VIY3fLkpUS7gt91UdFtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771968630; c=relaxed/simple;
	bh=9cXcm0ocvUTbXDTOOdEDMaO0teJ4KT64+jjmF24vlmo=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Dcs1T41vTkfgFwOx6jdyRhMpnLARgjLACKZpBx9rhvn4Xhnil021L3iaY7vvTkZMywmUFDIAVxc1mcWF0gVhaLC1QNu3Oj83VT5/1mFzWP2Ou+BDun9ltM2AZYrS5xsuTS8msmOsRZd5V1jUwqnMp56CPjMPuLQVmLmdXKvmXSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wc1/QZQO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b9PSWzaw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OIu7R0360714;
	Tue, 24 Feb 2026 21:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FrcPiJ2RlDHewxFzZQ
	tZ3+2+/QHI0BR67QNVjTmQ4fM=; b=Wc1/QZQO24WZSA6CMTXtpb3s8eOGi0Cv0X
	Fe/7aKvvY5rZ/E9r116/Hf9h9/qtMKiEai4Epb8siI+WOGAOLNx6pgkY3mZr87Pw
	zl/3YpXY9tNsJJJpIOYdo8WlF9oNngdmuyw4AdmEbImmO5U9LkE04zsxkhu2a0fl
	8eszs6SXOQTZRCtVg1ozVaOxgAWnU0sggw4x9gbP2sN+6+81ei3j7TM4XL4ti6Tc
	Gc+LeAWxW7GkZA8pK1EurG8y4PHVtJuwF2EYipQRUZamSMhZmwnzHBPAlSC0xyXA
	6Kc2eE5shgMlVQ0aC3JdO0rRN0w1u2ujU0iFbjymUZvW3RgTcDcA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf3m7w4aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 21:30:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61OKn5vl028092;
	Tue, 24 Feb 2026 21:30:21 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35f8vvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 21:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPd4U6MchF9c1rSjMETh9R7fFIDELAr62vTRB+FKujUKe4IyFTk7S0fqw8PigsfdtohnfaOFK0Db2lDLb2J4oNL3dg9y+ENJrrsw7KQ4NIolQEUo7Hxioo93gRADttEcyzdAf9BWNN/DooFORM/3q1TJykykdDTlpS+YzMChrjbEIlzEoKLzFqPdZccYL3FD3eXzLjl/1IePqayZrHOpNXJ6PE2pgSpBZ+DgXerST36tHElhLWMR7XaQi/9qehjccP14UrOQutTxBBBmcRvgjAylFH8oDSBEjG7PNDXzjmbogm1SxSs8qh3BB1HSh6PIbXedHmSIS2caQdSIHfOHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrcPiJ2RlDHewxFzZQtZ3+2+/QHI0BR67QNVjTmQ4fM=;
 b=fqlnSXogxj2nDUmNO6LaM1vzEcjd8QwSuBQZBD0pab8S8SmtGNST+0LUdKpuF9JmWXFG0uXqxbRGqNuY5scGoBv9ObMIklyy4Dkx5vXWsQGi8kpwDV4HHbflyH5xDTDtA96g+DYhkE36RRGtF/z3vgC6lm5mlvqZuHJTsthyJiyAnGsdZLmsJGeQWdtp86f9ZbjgJd7ENX4SsRyarS1DAUMWduueNDF3SLwSL5dBhxazY8srw3n3+d8tZLZi6miHb50noYxwRBcJO4BuwfEQxenAhA+Va7i9FpTWwnOX8tXZzxxI9yUQvNHOnHjK3zoU7JMHudXl6+3nj1JYWv2xXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrcPiJ2RlDHewxFzZQtZ3+2+/QHI0BR67QNVjTmQ4fM=;
 b=b9PSWzawAeozDvRoJdKtWvjwGuXE4uwZsnh4pnP1Hk/e4On0XfNzoFfD/mn7Ah2rgb2euK9kXqZb4Ge3Q2b6G52RLFcdCqEaq4pHRuInyG63wy5sa57aMQD48p/ZNU8zOCjxfaCIqo00lnnceUsIpwr/7CFdjn7d8J3C7oORvNw=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 MW4PR10MB6297.namprd10.prod.outlook.com (2603:10b6:303:1e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Tue, 24 Feb
 2026 21:30:15 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::21c0:ebf5:641:3dee]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::21c0:ebf5:641:3dee%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:30:15 +0000
To: Manivannan Sadhasivam via B4 Relay
 <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf
 Hansson <ulf.hansson@linaro.org>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Abel Vesa <abelvesa@kernel.org>,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] scsi: ufs: ufs-qcom: Remove NULL check from
 devm_of_qcom_ice_get()
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260223-qcom-ice-fix-v3-4-6ca5846329f7@oss.qualcomm.com>
	(Manivannan Sadhasivam via's message of "Mon, 23 Feb 2026 13:32:55
	+0530")
Organization: Oracle Corporation
Message-ID: <yq15x7l7rw4.fsf@ca-mkp.ca.oracle.com>
References: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
	<20260223-qcom-ice-fix-v3-4-6ca5846329f7@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 16:30:13 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::19) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|MW4PR10MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5a55ea-bd29-42a4-0001-08de73ebe699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WPyg7mssEIqZlMyEq8MKkLwrg31rzG+/TLjeCfp7BebWfF8nh/z7Xam4ZTAc?=
 =?us-ascii?Q?B42yVbxGniYNE8kbIyfP2MruJMA9dRBRY18NNEvivE5Ea3E+VPV81WA6Fc72?=
 =?us-ascii?Q?0F1fCv1PDCJsoCVZC6Cd2/kFNC4mTZx1e/PKcY3rQoAC3w2HXQZUdZHl8c+Q?=
 =?us-ascii?Q?2Ex+8c8W//KGDqaU7/L73YnsgaoLkLvD9T0WPClboP8AuGWQ3mLWEZvfxpdW?=
 =?us-ascii?Q?Jw1Og6hAYQThN2d+bgBA3GFFCGJ1/mv2qda/4EsDPwojym1E24HZRghP+mWi?=
 =?us-ascii?Q?UQ4WOesKRUIrGKrChYyn0UxcSSo1hagK5w1YdS8LO5tP8VWV4FrqiNQn3THZ?=
 =?us-ascii?Q?kf5IAih+kULKRZ67oY806wa4Pw1as+DyDiyf8cXbC/Amlcwq4QPqAjF//2bL?=
 =?us-ascii?Q?9kNAqnHX7UWcWzv7d3IW4yEyJ3ViHV3RBPqIHMellYxRYRWYObMoxfPWuisa?=
 =?us-ascii?Q?BeDGAyoQdxZU1pDV3lLCpH+rOuccGtMyn6TkXAa3GXA/x5wSJL47AB01GfZ0?=
 =?us-ascii?Q?wAz+zGqmW0vtfyBFDhSm4riCHjqdTQwi6kwjcqh6TDsMbEI4wC+xcI5VrYq/?=
 =?us-ascii?Q?ar48RW/Ucmy4r8kB29MVlmi8MspXjREo2KQK025W/6MuVLeCSgJ90KPZN8wd?=
 =?us-ascii?Q?V/xUushRviUkhcNzGSsd+pOmWSVHx5MZrL1sinmWKxvU1a9jy6ahMb874srB?=
 =?us-ascii?Q?KByE67U/35zvh9ItX7lBzE8K/ljTG7byQ1ElzQpufFm4xsaor8u9P7AAX9fr?=
 =?us-ascii?Q?fCQ+TvSAJ6GgXc5jPSmRWtkAvJS0yq4Rliy1eC38R93DBIbpTKXuhSb7zv9R?=
 =?us-ascii?Q?VtGf0lWjvbl87NKHSbfLHgCEC5gdEFymN86ZUvGLLvh81RC2AZ6gWZGO0LPT?=
 =?us-ascii?Q?VyYkRPIg3LWlHbjDnRf4bOkpc6WXRcOgpsTRR6B4Hxahx8evE62PfrZKpGE8?=
 =?us-ascii?Q?aV1eHxLoFXNnXu7OeG/BWAH3hR/NTOUse1VPwWuoqfcyuxGIQE6FFRfTEwRn?=
 =?us-ascii?Q?ZSYND9aT7MCK+kPwVs9tyP+J6hsoDeLYX/Iclq05s8eo6WyozrRIPqaVSukD?=
 =?us-ascii?Q?v7zOwjavPMHRCz4Fq9KJq+oTIXqfvyiN5F5aXnhfuBmAy+8FNOGRsh3yoxir?=
 =?us-ascii?Q?R9SMG4jk5q3XvYijTcNgk6htJuEz0GGBFja8xEG29+frcnA/J9II9SZjI8x2?=
 =?us-ascii?Q?afxhPuvxuN8XDudQT4VzC0NkUQqDZrDtOaaEN0OxkFqHf4qvhzVIr9xKliCd?=
 =?us-ascii?Q?ASFMALi4DBZSWyk2aXrCiOJcEUdjZLzF/0dLnc6caRbpW6MVS0tMgnkoTWcX?=
 =?us-ascii?Q?wsnZfrMXQmVLC09gFgqjBvo4QSjonZRn+X2Ox8fINH85yOLGVVNMtDB/g8PN?=
 =?us-ascii?Q?suU6HToYVzaV7k2/2E23F9J7g9bk/Sdia3vOAqJQdSVBylAP+bkvv9RkrNRo?=
 =?us-ascii?Q?zGwObUD3C1luZ/POgkXTwNxN3bxv/gfMusw5z+eYKFKrE+MYga7Kez++E7JZ?=
 =?us-ascii?Q?ULhOBgOKR2NLbAHvQhBE6Yfm8bB0gMRcfLiPu6QlYV/QqamNwvGRn4+YiaD0?=
 =?us-ascii?Q?KEf97yENV/MFknp+WH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4tuN2eCcw4eYTaQQ5J7HmDAn0QWBprgk2V8/cxglMUaItgovyQnga364w4Xx?=
 =?us-ascii?Q?v7rUlkp2tfY0ieG3LF8pl0yKCeYiWZ/RUev5LG3XE0qi7IlAnN54tn1ptfg4?=
 =?us-ascii?Q?W6E2mGqpbV9xV28njZ1oHKJ2DIy8Uvy1JTcV6ZTUeeSn5PlfjWnBTL5fOcpb?=
 =?us-ascii?Q?t3wIk6/0U1U5A2tIov9ahABOxuJ4qyhkwOl3r3c5CVgGaFDhXUFQdDV3Uieh?=
 =?us-ascii?Q?eyXAYwPXbohRDEYr2Q86wdGJVs7kPD7TzEWKUwGBJT3Y+mSgfY9CuAeoXPuZ?=
 =?us-ascii?Q?JiCQ0DBUrs3GOuBm9tfPrSyRFiypefQWhKbQlFr3OgYwjMgxd8U0B3fLhmku?=
 =?us-ascii?Q?KWkvkpQ/fEkl5oNj8im6hqX/RztmyKzidvaEXkXXTCYSCGVv2ClvZd3uaOFA?=
 =?us-ascii?Q?Zww0vxaCHmZ3DJSo92I7c44zzS6Hx3EWSi6Tz+ZCUMEDsQp+FZZM21UU6RdG?=
 =?us-ascii?Q?8MtRPJms6Y509+Th3dNsplE8twuUoCU1AXQu3dpFFhJOjKI0T8QbRNbAsggu?=
 =?us-ascii?Q?uQWuPM0QjOCRFIqhhyvShFjo48LwGk/cgurSzS7VbouqACrI+Pe/ozujPVjB?=
 =?us-ascii?Q?CRwrXLJF+J/fm1aPhQcfPbff0sPgROI++JpzuRSsIQCv9oQYLUGqJN6Vb2cG?=
 =?us-ascii?Q?8comGpLIHy8Ep3om7ukmhpwZ0KEv300xevHlOThDsWqo22fjJ2tB14DvPuqy?=
 =?us-ascii?Q?J4gpiSW+hdveWLfN1XpMQwvvNVKDbcL4pSbh8rS7pzdCHY8lcQyjH+4wKoqH?=
 =?us-ascii?Q?LqqFRMMOXRxCrb5AhIMqN+yzNXv3qhskMqUyWkaq8lMsdZE8fHhUoViBwZ8r?=
 =?us-ascii?Q?lxjZVsqoy+JSlZLWe0Cw5+zgUZMDzLkL6yBwvmcyngc942ARcbDBRuVfSyfP?=
 =?us-ascii?Q?Xi8WNDMfatpF3niKdv+PjfRh2RhZsb1ZPf83+/LiRI35p6xTJcAUXZOoAkBO?=
 =?us-ascii?Q?aDyHAkqr7IC8OwozlHbGhP5aORT2MgZVSf+H4Z4hO+gWTKkMocA2J+8BGGfT?=
 =?us-ascii?Q?JSN+l6yLg+Q0cDqVlrmlV6aLvtpLCNSrS5ig1kF5Z6Xa3ImzorZnASKrFzDw?=
 =?us-ascii?Q?wInV1o4iK18hEvDbQLZs8f4woTLbtvEVjl5HlLAQkC78zyMANXO0BdH8hx1R?=
 =?us-ascii?Q?y0rIoKBEhIaLfwyE8JwhXewlfjIgu9Xkl6UrwfgADBu1YxIz54VYVleBaI3u?=
 =?us-ascii?Q?NRjOZTvut1V8781EkHGkfS52hYj6xhIJSSc56nRhIQ3CU/f8o97Sfp2EyETm?=
 =?us-ascii?Q?nQy5ddlncehXzal0uU4FuFqaicTYhLGRtqjparxK1QjvWOJ4740oitxnve6P?=
 =?us-ascii?Q?KGi0LjF2bKVYMLXcwU5HgO07YDzuOX1f90DeM6MdVESCTmhHB7KHDlZoOIUQ?=
 =?us-ascii?Q?mtlMgjlnpX69osde0pnf7uq2Y1aOG344DFHDH6c4fLW1BI6KK23mYoqyPVGW?=
 =?us-ascii?Q?W3dx7rSiYYHiEisSMG9Z0AmcL50dV5R+QArBB1paEyyO5FtXHgIkH9MUsM1a?=
 =?us-ascii?Q?ybglzl91PoayS6MuQ0360fs+mWBVTyp1GZrYqELVksGTUWn5JtTNPnHAQeWi?=
 =?us-ascii?Q?XivZ58QiMKms+X98+z70NCoPfuAThvNfuYG+EAsAkVgPlouQBP4RpnAv77kK?=
 =?us-ascii?Q?fOzGYTk5SV4lI0D2MCjha7NaamzoAEdwmscg7tr/blqcLE/R4i6yFgla5dTM?=
 =?us-ascii?Q?N3aqzj6PUKlvleyui1eV4vxCpW90VSndhPsJk82vJ7WblLxOZiMQV+l6kozM?=
 =?us-ascii?Q?9KQZeF3vsTWocAm7NU5PHCsRKzPyuwE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hJ56OJcr0TIh60mVh3yqZpdZ3roRToAGfI3UWCp6sbw2tMwt1iChgqZw+b3SUQhxaUxShyfa7zNOmYuEf2ZcbSBSwY7GKoUuRQ2MCrQEFEKjEjwrKDPZkJmx6WOHAp28zK5RygC+d/V1ngOmdquKw9yPRdA/GbvNEpQ3btEOB8QsXoLPsa/mCXi7wd6mwATvdWc/M/sgJLmkjy5X2Zv1/1KWJnhCO/S41bIff2iiH4lzd2xK78AOXIi36jNCiBhN8bpA3W5o2+vzt5ZO+ewnVd5KZxLXznrIZi3GzHwZ4IEF9yhk8aD3YCV93bSMFIel0pwVfd3vmiQ4o5FtEhhcrA6dmol6yNvfmJuCxDoBP9fPdJyFgUUH+FnCFr0ylxmzsf3ASyTZyaLbaevIFiuzRFMAaDngrP0Poaq46Qn1a9HQrgb8ED8hfFXXfFdmWCk/Vm9oodT3WkuadG1er0455ggv2zxmvtvxK2BAVgFYPwosUW14e2D+e84tV7c6OcSWuPfh3BZWVBUPHZuprV9ct6F6jlDvjmRAFJgkSX00ME/XUM7coMx38nijU6nvojQoyDvDinx7I58E3zG5gEaZkNfOCAuH8LszWjufgTGlckE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5a55ea-bd29-42a4-0001-08de73ebe699
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:30:15.7424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ag/1ztiORIC7WW4KXoh8SsfL34sywbRjB6GwdHcs15sbBVNepT9bc0wLcFb51/0w7AAL/me5t5PJvb5bIErj1PPOdyCjKtNA5hWxC9L5bLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6297
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602240187
X-Authority-Analysis: v=2.4 cv=O5U0fR9W c=1 sm=1 tr=0 ts=699e186f b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=ISAbRe3hI8SnpZXNwu0A:9
 a=MTAcVbZMd_8A:10 cc=ntf awl=host:12262
X-Proofpoint-GUID: nffAXe3FcHA1m1JVD8ndnxS4f7xbUIzx
X-Proofpoint-ORIG-GUID: nffAXe3FcHA1m1JVD8ndnxS4f7xbUIzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE4NyBTYWx0ZWRfX6IwreXRAtJeH
 YEA+mKR/bNHuFqb5v4tKyJtZfBXk4fGrM8KVDdeqWC9ZSlSIhcIPMQ94WWyNJbinTTcJvNRaVOs
 EBJhyLFulcPmamne0kpDwN4zQMo754JBzm2nzGg+wFNfdll2D2UuoPO1T0ydrNPK7bpaMHyL7Ar
 KkNzMGNyc+mNrVuuMgHjqpxPDmRKIc5lo+4mHEspbTUZCG/9EFUf4KOhZ2TBozGMAF04P1zFMDm
 LlAQJDGcM7Oy6B3wd/DgM8IrPk3cpq8tNk7KM4w3WDaqBQ8x8f9mjl600ijqkgvybIk9YHWjuto
 J0Guwm3eNuIE/0LFhIEAFSHvGINiwP8h01j7HX7I1ECT0xotTbWwIOjHidEvsC0rF7sp6rPPmVU
 T0qc+hmO8HLxXxvJghHLBQCgO9W36udCN5TB2JKVsZP7HcgsqDK18LQunyKMDmqNHRQFDXYSigL
 7VfCTUdNIbD9XAZvanNI8dP2fCOVc+Ru3I5TpONY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94014-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,oracle.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oracle.onmicrosoft.com:dkim,ca-mkp.ca.oracle.com:mid];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: CB9D418CC76
X-Rspamd-Action: no action


Manivannan,

> Now since the devm_of_qcom_ice_get() API never returns NULL, remove
> the NULL check and also simplify the error handling.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com> # UFS

-- 
Martin K. Petersen

