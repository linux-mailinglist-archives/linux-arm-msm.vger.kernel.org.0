Return-Path: <linux-arm-msm+bounces-54081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79285A86A0B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 03:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67477463B88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 01:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4457136672;
	Sat, 12 Apr 2025 01:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nfGX/2Tq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s8l10Cbp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099E0126C1E;
	Sat, 12 Apr 2025 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744421178; cv=fail; b=lNmlQZodkJHk1iQ8OfohTyKDPzk17em7QbcIEkZbafo+PyocmDd/9nAGphgCKbIabjneoyQSDNmAmxfoSQCB2jrdegOWPIpwMy2Lc0nu5mFpWIbBHT81ksaNwT2OC1UXi9Z/pbX+nU4IjYV9ZLd+/PeCQ4sXhQBXaxoB3x9Un6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744421178; c=relaxed/simple;
	bh=QI677VE2l71Hq2psKRqhXVActW9LT78Dl6RTrG9Y6tQ=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=nV+DXmYONlYRdSfS7uj87D2pYffVyz6qyo9e/a1yJXISeUEtLLn7tAQ5LtzCwVdLULXV2SSthAGS1xstTypm32iF6inN8972oN364bf69pHDRJ1uhf07WHeSblrFjb/+PJX0HWoeApaXUH85LlyvwQcI8a0o0ADHdHd51XsyXYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nfGX/2Tq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s8l10Cbp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C0NXpQ029567;
	Sat, 12 Apr 2025 01:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=P1TaSnJJtJxFQPztKn
	0IegLgPjyecx4zZIVGleuryaE=; b=nfGX/2TqaJ9S8x//Za+5RmHG9aMR8sKME9
	OsOy7gJv1auWnqF4Wkn2a7KvjjmIRmnHk96/vBGdgy2ijmPzYMw+Rbq7T5oW6anP
	9MMQW/FI9XJwqR+DYW6lR1x2IJnnaYK5oKnay7PRjoURvHSJVZ2jT6oayBQSi5yH
	iXioIAg3SWi1CxcyObTnmjpdyz/uU5xb8vgcVLL0yrNTg8pvtvRacMY7DfJY3gtB
	8Ix4CcDA28EsrxU2AiwxRWirX8WugJjmRbKC8MyHop0ltWT9mjRCMw0WIir404Oz
	2tnXqqMdbb8NVwbF9mQ7qwG+Pu5ayxg/L9681EUigA0ogYxPv9HQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ydjkr1fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 01:25:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53C0gnIq013779;
	Sat, 12 Apr 2025 01:25:57 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011026.outbound.protection.outlook.com [40.93.14.26])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttymrgnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 01:25:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvus6pfVAbpyicdW0hSZbxjVxyPHJODezUixlM2sLZbpqF6H/rOKo6qKYMFTDOGLvIqoiWuPRh31uZi0oN0GjsUFKwkMWNdgsfQgP9TBhhI0mz+2xj0kJUg3q/hkW7UmeJHNPa/Qa2dtS5RxFkOW886Hl9huMXYVohzUudBcrnyoyqY4c1KFLLywTvXO0nY8lpdtEXJUyUBbGwymjYCpk7L53q7xzG1uD1GFvvAXWqkENDD0YiHDpQYsQxKlK8SXbC04VBtLHeqcj5Fqv0xlLGh8qJrMlaW4VvLYttgsV/fPz8JB70yY5GC9bRbvxAWNXBdrolZMOs/pt+Yt3stgyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1TaSnJJtJxFQPztKn0IegLgPjyecx4zZIVGleuryaE=;
 b=YsphGt+teEGh3Y1pff2crnbFUr2WeL3I6jzZbsjIxbMEHeQUBBvN3DAJqSothoo0iXyF9vKjCPegSgbxeivBzh61wv/GpmpSLLXsOi7Cff9wvMnFVlG31yizOkrkenQWSJg5ycrmiHmLRpKI1mQqGQ0Rw3ohfTxhNlmoF+1XZ60mBYTchGVj8FxTGSI2xuThjmC+4mjpSXQYX8TIFnUqCEbAP/8VYvd2LtX6fTQlrx+dP7D8Jfhb9K1Y7PT5+zVyTQVRZ2ri6lusLpRCzUuPYtvolRnnJdEXmxx2BnlEJR80BvOB4cm0bWVlCn/CDAG3FkEEqT1uWPbsDpwYQRK8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1TaSnJJtJxFQPztKn0IegLgPjyecx4zZIVGleuryaE=;
 b=s8l10Cbp+a4a3wvDiAgMHi2SgSaGZSYL87fhewR22zeJkDm6oi8XR22lsB5Zd8CSmddzitP6uOP1B6KX0StEyMN3dCDU1BekpqmhNsv0ZFSzqnTbRqnvwSErWY5cYxrtloYmjfgqpvbBtEYbxZjyHRnyJa7Ets38js/JN519Aaw=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SJ5PPF4B2F62DBB.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Sat, 12 Apr
 2025 01:25:54 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%3]) with mapi id 15.20.8632.025; Sat, 12 Apr 2025
 01:25:54 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v3 0/3] ufs: core: cleanup and threaded irq handler
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
	(Neil Armstrong's message of "Mon, 07 Apr 2025 12:17:02 +0200")
Organization: Oracle Corporation
Message-ID: <yq18qo6jhm2.fsf@ca-mkp.ca.oracle.com>
References: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
Date: Fri, 11 Apr 2025 21:25:53 -0400
Content-Type: text/plain
X-ClientProxiedBy: MN0PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:208:52d::10) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SJ5PPF4B2F62DBB:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d974e48-0f2c-4a19-cb96-08dd7960f834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VTaz4ox9qkJ7e/i0i6NS9mt8nWsbZqXn22R9kJ6Mv9/HGxPw9r/wYqam/VVU?=
 =?us-ascii?Q?WZa5VVMoB8SDAXqdEMwqDSravpEWweCFCplIaIyUlc1xZjwiPQR1YBB9h56S?=
 =?us-ascii?Q?l34tX7XiliAI4A+l2fc2Y3rmLeEEcDXme8H9NI1sH9JbodWEp8Z5cArtr1Xn?=
 =?us-ascii?Q?EZTFe3mL5gTmz4hRc/kAnT2SONUvuCyjZSaeiSFGnAv9+e+FZCpyiGREEMff?=
 =?us-ascii?Q?lKuVGwBUR/MPy3ojWvJFY2nT0xOv0KnVfG+64Lf2I2b3B81pcSfRvrwcHqa7?=
 =?us-ascii?Q?LXczBtaVeoP/VhebsSukKkLH2KBeQgFsI9BpI4KzRI1m0MbDe69peYc/tb38?=
 =?us-ascii?Q?oPQgVSUpOoI1p3CJBBriNGgQbsJRhFURUjcVfL3Fjz5qe/tOtR5toHRYwguM?=
 =?us-ascii?Q?vcfjtrpMkEu/LDI4TYZqs3l5ykJJ33KjAOz58GvtmVKEaehHHIhXvwGwEcKL?=
 =?us-ascii?Q?1bQ+BlgKNfKY4SI0Sh47GvPgVJAW5k2mmL69soY0XshuT+3JUDyWrOdcF0JK?=
 =?us-ascii?Q?vBg/RLcq3zyb3gyOCMkUn3pFsEdiW8zcOovUtkqIQRCouwvDikyBEEMIfKeF?=
 =?us-ascii?Q?QaXSSr+s0STfwHdWSZuRuf8COn+U+RUnRUcJIbVMIHyiAk+889jX5pGRjiQD?=
 =?us-ascii?Q?xayBurgLprNIlOrQDJ64fUwSqsC68bSUfGK2LsKNZG+xWC2ehNQwBoi2rvaz?=
 =?us-ascii?Q?76ABWzUTnVwkpTbegHwCgu+n462gldw+OS2BF6lUfPlvuV05nT3CYB6Y8IN+?=
 =?us-ascii?Q?QcRUmutXI2WpMZGjMg+lVL1PIGAUc/BbC/d3yhFbsXCR/OXymWmspXH8wAxT?=
 =?us-ascii?Q?tm3m4skX8dWzjLTgw6Tno9/QnUmfMYqCWYM3iiYY9+GlZVXdWOm/Uh4pKP5j?=
 =?us-ascii?Q?KCWv6sFdTkpEcYtM/GN4MibKl6+pBUYEP3CL67PvmNiApleMPz3w42W1jUme?=
 =?us-ascii?Q?+CctW3TED68v1cYDOcXZxeGraoVNxo8Cw6MtWrvnDzVCeZoqRGDIYlQlbz9G?=
 =?us-ascii?Q?jYNLLRIM8jR8IOcXS7Guntv3VjKRXMi3/WMP6qHC4PYM+RjtfiYlA/b61uqE?=
 =?us-ascii?Q?oSMlFJu8k1AgOBuHZdPb5HSN8+9qPsybX1qSNmdMQWlnmqPFTseRipXqWCVa?=
 =?us-ascii?Q?P8uFTTh/wmtS9p7UhmT5YG3ljZ/CA0+OKutRHHBYq+NptBFBamhprwrmRUhD?=
 =?us-ascii?Q?qHGZC8FGh3Q2fHO4oI8VS0PvmUijHgw5ZSbmEhZEqcFI8DPdLzqy2mqpjr/F?=
 =?us-ascii?Q?DYIO5boRBzQ0UV+8rdbOOIl4kR37lrqQWM6mcQtpZHk2BWA3lHY3cQYOVRoJ?=
 =?us-ascii?Q?DDZWzTkNOnUhq0zMlSAq/heVZu3zrdo1BqeqwsOp60zNie2WuvhMpnc4gxCP?=
 =?us-ascii?Q?aAJHR7LCUiDGwhbEEEiFzTeo3TvdFX3XJaaGf7LZlmTLQkyPLTktxlOobP0M?=
 =?us-ascii?Q?flnWMFbuz88=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/u9AVjFgebvVMng4L3zRtcCaySi7Jiniohd76L+n+kot4xqvMXJ+2A5TjDr6?=
 =?us-ascii?Q?e7YTYXYpfl1SJO37J+9wUnSgBjFA6S6FGyeturLdxCITsNrGwpazB0WeJlYM?=
 =?us-ascii?Q?dAVQ8opVvHgoT5BrFslwQJO3/QZwylCQ98pej9DnxExHo/bgWpHjPoZeYhxP?=
 =?us-ascii?Q?ZMGkjoEV5ASi5zSxhYdyC3Jsxr9ZYxiyFrzR2KuzBFYZqRmZ4VeaA7Y9cbet?=
 =?us-ascii?Q?ulrN4s2wXJhzVzO0oHWgiKste1tMZu8ETB2SukGXySKE1TdiXYldZ7fu+ZhQ?=
 =?us-ascii?Q?6wRxQ5gmIoxLi4+ygZOehS6Sf7L0Lnn5WXA+W0FnFATDnjFwmln0dVZbP8Qo?=
 =?us-ascii?Q?t1uIPa3NFyLgiRpSk2xCtxd+RJGffQzGriljLK4OgKYy/zAtRhR455DSUSV4?=
 =?us-ascii?Q?E+/flvV9fq2yNaOozj3a7BB5NIrpFxkDpUKRgCrP5WgiN/PwPLRqndAspLb2?=
 =?us-ascii?Q?aCEA3Ve7EDDGbarwfjS7WKsT2xTxEYi3+6XnvAIjkTZdBz4LaYMNFvqKy5x8?=
 =?us-ascii?Q?fCcZ37G6ubhwHLog+TYRLvnaCqaR437NIbwdm5jyADsgqYDfSQA8I3VwSJ7u?=
 =?us-ascii?Q?GQjcUCPyXvucJXDPE69GVG1EO++xleVor6bQ1bI0nj27KmdLXoraN4kNJj9a?=
 =?us-ascii?Q?fm9G42d8gidjMWyrZGLpwH6xOaWzhJCeHqc12C9DH0TXBlKSuEOAfHU+ZinL?=
 =?us-ascii?Q?penWSkFanCv7px9G4lk7xiTrHrQqGudy4yJkVA+MBd20CDZiSr1U0wEpwjeM?=
 =?us-ascii?Q?RKdVg2tAKWiV/LNdFL6Ot3RNUEQLw4f32kGNWdK/9zZQf93/gQvPKPvPaJUS?=
 =?us-ascii?Q?ddmqkXLNQseZeYdHXQt6rDgFTDgaI4GO4n6BYN1qRJ/6TetlzRflPjEP7UkK?=
 =?us-ascii?Q?Y3a0VKGynxD+aW03xGQAKrKQTjkvGnVlkIIJ7jIduy//g2d8JrdINsFC/nij?=
 =?us-ascii?Q?xK76x/uxwtd4m/+mfVhDcCHJGeZhaaX7GCFlIN28nGkFsZFpeROFbAxySlAm?=
 =?us-ascii?Q?a8chBstCdqQIXWRDDRr+PBiu4zohipg6tIX22f1OHy2VNZ99SGfZ08fAdNCR?=
 =?us-ascii?Q?vpeLiogCnj/6Iwn/f3mtQ7QBYgcDBh/Q077fwAxCSytbZ7pc09+F8FEwPMx0?=
 =?us-ascii?Q?ntvhx64ln+1VXCgYpeeIfS/0wBSp2LZvCMmrVf3ykj/YB+/XsoKLkrKtrTcW?=
 =?us-ascii?Q?n7YS2dJ8Ts6jAB5/1ts6gF9iKDF3z9xTlfVfM6E7jmImENiBOBnlR+D6dS+7?=
 =?us-ascii?Q?VfC6Jwt8MVqk+4w4KoSBnp4i6T5xysrtJJAwhGoHg6FTE5NBYm3daJ7UCuGH?=
 =?us-ascii?Q?oKnCXmQFPq0wWLrgnwvp38kk/teAm/Q82lRIxsVNTXa/7jYLZHXg0KMxfUTh?=
 =?us-ascii?Q?6PBHrqpEvELl9QHzyQK3pmEQoeLD/+AZSDzCcsuK+XSNwCyfd6c03nOPbV87?=
 =?us-ascii?Q?cRGciRUKR0xQeJxNB7XK7BDCVHppEuRrUC2OXfWqFCgU1jrC6Ejr+hL+Jw6h?=
 =?us-ascii?Q?QYeXhnIABiCHtNCizc+ehZYpyFQ2bheW1oddFx1vllrk54S+HvwrnWVSTR1W?=
 =?us-ascii?Q?xovaQcCF/2CWt1EczK2BoiF8uTzEJD1ZYl1gpHmoRyRU/BZn9tGe1vAepIG8?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V5fgpr8MzDaKHj4E5T8XfHW8zGFj3UTMqwNM25Bo8xw6a7jXEwgdvCueQzntWUKuCizXnv1RXlrPMUzkrnJbPMadQszOiGbccGIUc2/kBWqVH+hsM822h7RdwRwf+D0RYjvkPzyu/2lCvxzhr7ul/w1ZU4e/9LWgQYvkFTUN20tibyAKAx9iAbVBM5RPHzF6EDfnxepT098fdpWNczOiBx6rVbApdlMMs7Cm9pp1lAK2rLkA2/d+yZDgHYOmrhtMxUFa1rKFBCOhUTLFM/8fvfUjSFHWwcnI8hTs/qc3ye654SrcrnXCwv3avu8x/r58XO3XGlrNlDBdtMQqaPFHXYwrBlqTIlRfxEaaQ9wpGc0KV9qt1Ce2+RGivkRxxaAUmrSdUOzRw0C8xIDHPHxcfQUcnJzZbkrXD75lSXUp7JImymbRYch+K9anzqXD+I4Pq6MrmOUh4SKPkDMHK9hvoqc6LnPK0V8vv5aOGoCrDUrv0u+IQUk0K4Z8EuCXJ6hiSy5yatq4Id5g3MVQFBeg7brfNoBEJ+7Fk6AcSNVXWs4t9y6RsP8KowOv0+fO3I+b6SjrWXeI1vWczo3D54LWMf6UFtjkZGoOHYIW31F0LlM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d974e48-0f2c-4a19-cb96-08dd7960f834
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 01:25:54.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+On26F+q7iqYtMA1Ma7NxOFFsM9s1qcGkpCKjNMsiq9sbAxffNooFvQOdbBYdnaxs2uCNYDkYB6HiDRuJsP78ZnXN3wtCQaZMQR6N43hx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4B2F62DBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=775 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504120008
X-Proofpoint-GUID: YtzZ8wmj_FhntvGqzH4QpoTpz6RYFpHk
X-Proofpoint-ORIG-GUID: YtzZ8wmj_FhntvGqzH4QpoTpz6RYFpHk


Neil,

> On systems with a large number request slots and unavailable MCQ, the
> current design of the interrupt handler can delay handling of other
> subsystems interrupts causing display artifacts, GPU stalls or system
> firmware requests timeouts.

Applied to 6.16/scsi-staging, thanks!

-- 
Martin K. Petersen

