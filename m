Return-Path: <linux-arm-msm+bounces-72894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A12B50B20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 04:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1C78172DE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 02:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846FE24113D;
	Wed, 10 Sep 2025 02:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iaSMK3gP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YbWL2naZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC01A238171;
	Wed, 10 Sep 2025 02:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757471786; cv=fail; b=NYBy8hMfDu7/DD64rkMNGiDqZd9EkZRPiDWCqkHQArx2qMdkG3O0bArXKoQolU0DiEK22LleZTYYOKbUuZHf+nEFEPg3L0q/FPkR4drdqlkfPChluVdAwnptJSc5vdRMgT1V7DmAG6hLOVutB25gnMVle3jphjEoFz1rXTozF3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757471786; c=relaxed/simple;
	bh=7DbLFZXM6M+EdSSkrlrJJLVte3oqc2jMqL7Pr6yOVnE=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=r7Fvfg2DhlrErkijrHmtqE5jEcmM4sslCwg+36Il3+ySM8b44wZAojATOcqwF5RxfU0fa3zZgqKuEIIryiC6VjmsAlYaLqoO/EG5RS/KjaUV+U7tNwsVPcH7VOrWSbpgdspkeeZbJdkMkf5fvVx2qfIO0o3in/RDGqBpiTs/R5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iaSMK3gP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YbWL2naZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589L0aeq002105;
	Wed, 10 Sep 2025 02:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QOmQyoBCVA9E+N0Y1C
	YoTKNbMkDXspum6ydtdktlgPE=; b=iaSMK3gPN3EBmCt64puE9jYATVGMzOX5Ru
	00gW/zUAirqg6y4ZmlqWtewxGfpICqJyuU0G9dqz58l2L8OH1oWr8j9VU7ykRqFB
	C0hXkngJy4mjGLOEcW8lbHhPA+0fmsxxyk8u/40ivvXBR1bp2ttNHcl9mabbksCH
	qQ6Xy7+S/pOxZkgBoYtmsudQGlkeJk9AxrVj9+OuUutLy1Rlw/+cbhiGMv72U5Ls
	kUdU+rI4SIM+7+CUngIaERdRbZMlN/PSAmCys3CpfeGvS9IDihtXlAXSnvjX04+B
	2H1/BGsTvPITaQZWqgOmF4ZG1siZeCH0yUKWQ8OBBkjeYRGXXu9A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49226su5w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 02:36:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58A1OC25002987;
	Wed, 10 Sep 2025 02:36:19 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bdgx7dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 02:36:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzFoJPvnj3eLexJX+bwf6szYuYq0oiC6jovR2mwl5vhVKQFzQBGM2wLJMBWUnJ3WCwL9l9ComVf+NGbNg+cOD0/LZK44Z6PYbvJZL0xAIsU066ynVt29LLExcFjbHFJLTUZlaPTjMO1nhDu/K22SSdp7JaZe98nQkYS1AGaVCxhzZ5CxidwQjcPcytxVUJCgtXofg8ILxvHrlzMf71/maNmh/nYH5R7ff9WaaQrGw0SbDf3IqpFGjQtCy7D+QPp4Ifpo4lMKGhy6oyjhvkxXfbmto3GyUGHlFcNJvM7/9JuMrwMivFxxnRdkfdkVLnpqwTqGytB/myxkWkGmej7wLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOmQyoBCVA9E+N0Y1CYoTKNbMkDXspum6ydtdktlgPE=;
 b=LCbvq6b6YmJQCQRq8Cb5J+2VpLPsI3FM/6O5MpJKhbm+2SChK6AU9m1/txOcbhwQC2aUKdUbZpEQGSguFNHPvUfMyOQ4mgKGgCNrWmkhHJkKf0gzOdOir3pStctKKOvhILj0FC8Z+XJ/0Ia73cXHRQ00l7PQjOhuivZBR9FDo1YIIEoQpZTbowK91VlEcniqvQcHVyYXM+XjLRbbxKNVQCswVSEhvviJMyarb7KMKA3OYrXztj4szld7Nu9eAlQy9k7Zez6Wx+UYgIl97nrTE6oe1ylDAgtX1YUV9jQcJGcclnygLCy326dBBp9KbQTLnp9zpPtWkS+j8XH/81rSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOmQyoBCVA9E+N0Y1CYoTKNbMkDXspum6ydtdktlgPE=;
 b=YbWL2naZT5AtOd0WPhYOTeHTq94vIlsua0zL+U5nFFpnPJBANSnnglRPug+nA1TKNPwLGevmzoj4kM1JnhZbkoZ2koM1dUpS3ciNH0rKu4fggZUbtHh/rzaRb8BA+E7inpYbB4fDYhBMu3hLpSazaoBo/wksNYcYJCi81I9vSpI=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DM4PR10MB6864.namprd10.prod.outlook.com (2603:10b6:8:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:36:17 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:36:17 +0000
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
Subject: Re: [PATCH v5] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for  UFS controller v5
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <a7vqktgfrfr2u53e7vnr5mqhty5l5entmtsoafnewk3ess4evx@442o73xkmdio>
	(Manivannan Sadhasivam's message of "Fri, 5 Sep 2025 18:43:38 +0530")
Organization: Oracle Corporation
Message-ID: <yq1ldmn5921.fsf@ca-mkp.ca.oracle.com>
References: <20250818040905.1753905-1-quic_pkambar@quicinc.com>
	<a7vqktgfrfr2u53e7vnr5mqhty5l5entmtsoafnewk3ess4evx@442o73xkmdio>
Date: Tue, 09 Sep 2025 22:36:15 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::19) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DM4PR10MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 80647597-34c4-4580-fadc-08ddf012d14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9bSNXyWZBWOyQ9asLxc/YH3sw1AA/n3JyndRlVr6H/Dkt9rGuqGcPB9vIALS?=
 =?us-ascii?Q?7CV+mnGj6Jx15GnUBtAUjzuaa3e4atLQE8/mqt3eBMKGehRlIAsIZ3AAf+w9?=
 =?us-ascii?Q?rGkbLRVjJOObT1fBGSPXW6yOX8NxtWWmgL7M3LWpI1ns8sSJlbPq+er0NJs5?=
 =?us-ascii?Q?+y9Em8kpUz0lg7L4vof7hDLebISFSgC7GO+4SZFuW3X2HJNXbEy2mvQrFk9I?=
 =?us-ascii?Q?V8yBYaDo5ZmqHrTVHS9yOZdqUOMzsasOyWilJZpAfNVPeBQeLQcSH/mPvAEn?=
 =?us-ascii?Q?FCR2yTbht3e8HnfMBCmouaPLMorxDHE42sQA/D1wHsY8sQ+N553dJLnp7+Ga?=
 =?us-ascii?Q?9L44q0yp7OsqSi7JKM8OgBALQXG/UfHBXAqnRMW98G/IQcBD829yd2+uJ3Ni?=
 =?us-ascii?Q?3+6LVjbeiDs2+92HCkIFobjuCzT8IC0svWG2cgjZfg7b/g8AcEfaMyq9K2UB?=
 =?us-ascii?Q?QbL3/YjkGuGmDTAaTIQLMQdpIgjuBu0M1W88TZp+gjJj8HfmghnerdEuClAs?=
 =?us-ascii?Q?rNt89QNnU+CSoTj90k/VJ4GcS+nMFPNpqus4nx+P9oVHkS8S3dohu0JVdZnc?=
 =?us-ascii?Q?Jq2KMOXPP6nC96sgXQTvNAwHWzAn821NY3cUKA1EujvTPXUkblagUmZTTSoH?=
 =?us-ascii?Q?wkgVZWmKVMc4CL9WsWmfa7jIdfaCGvWdynrPAtCmZ1W5ZfQtSkMWFTMRQ8up?=
 =?us-ascii?Q?6aho9szbaU6IyxaahVe1/GFU8ywsyxkfZ+3GeBIWzndW3erM2wXikgpZXX+A?=
 =?us-ascii?Q?+4aZ7kcZ1j0AsxpNHv77jqO61etNJrPFBX8DXkCKC/NHZWzt6Kaj87T86DnB?=
 =?us-ascii?Q?WRkYgZv9APdK5LJCdePSToMrFBjJZaG1ZrlghL5VOpKl7ARXd8UDAs0fo12F?=
 =?us-ascii?Q?WXSgNracl7j2VlJstzDgTe71hrqRFPl+SI7pQaXRuHLdufZeyBr/C2N5mT2Y?=
 =?us-ascii?Q?mcv/3uX+pbRue7+wH3iiTgTupYxRS14Jxy/M/5A7PckamcYu3PL2d2Xb2G6p?=
 =?us-ascii?Q?w4Fn324OsPz+6AL7pAgM4uu3SdvzbhBfu8pVgC4zyRxjz0h4J8ZCTgeUPed5?=
 =?us-ascii?Q?QBkaq4O80rMNLwE7pf7v9VJQjrUViMZutTUPC8l4BnXjww4LvAZhnSMTc7HW?=
 =?us-ascii?Q?p2pNypfwxxXtQf9lfx86AoClIbffUUt21uyTIXtc/ZNpFMwLkrm+uTIhZfUC?=
 =?us-ascii?Q?DMrqnFWgI/nXKyX5zwVOkhqjXQaXe6zkAB9V6SY54f7bC5Yu+540/LswnOs5?=
 =?us-ascii?Q?naUd5kFoFS1SY0n/VsSp9MK5NwjK9IW7DiRp5M1AME1Sn8ifDKl8n0tlHfyj?=
 =?us-ascii?Q?BLbqQC+kuBbRQsLcOLbdm90hHY2MGSJnN0fVjQfkvalaIeAM6VpQfmJQtjOW?=
 =?us-ascii?Q?dyCTPugB/0gyqM641qTMBYzjcQPNYH/VGRqdVj3JE/q3v33QRzVM5jn6jXWQ?=
 =?us-ascii?Q?NwWLMZOfXD0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pEsgOk9Zt4jX2pd0n+xJYPHZ9j5qAfIfCnegdUMI69DzHEaVZFj9J4H7JUNK?=
 =?us-ascii?Q?Rwx6G6ELkjoTEa2PLVJinmhiy8+ehZX0df/r76T7Z8JgpjtQZv33bVQuzp/r?=
 =?us-ascii?Q?OgG+3UXKjqxU+4qC+dF6FPheypVU1RNtfltC8jKWPJSowZcEwGHI7HbGx+VY?=
 =?us-ascii?Q?PCt99IZ992PvbXFa29lRF9xhsGDytlrEBnUfIB8/Vo6JoTDQWgC+ucCiSJeE?=
 =?us-ascii?Q?nfC+FO4lOqtf8Y6W0x9v4LQzNvR6wreEB0nVXjCuB4Vikwd7tveOYYmTjCfr?=
 =?us-ascii?Q?UR9OfHx/mQ0xLC7YmU7EtFfM+sd6nUO8xvRTKZZ9GI+RfNpJa2k0dDLFkCUP?=
 =?us-ascii?Q?KcTtomACOQqrHNmXpvRqYxrwzLkS3XWT2agU4CNsHHsPq6kbN0p2cTZUb0kH?=
 =?us-ascii?Q?8JApFsLOJvrZ+JYl31TNbTBqObCz9ZY33K5irgbCoOpddFIZuwbcc4sjcUKL?=
 =?us-ascii?Q?oOhHosnlChXWaJmV7E1T5YvYkJCyqnRiZN6fOdNVoCA3aq4K0vS3qe8Gbgjj?=
 =?us-ascii?Q?u2/0r//lKzrFrpd5mIjv4zD2pys1PB8p+7BgxUcBBxfmvD35tfYChkT8JSIN?=
 =?us-ascii?Q?HDuzgR+3vWswsdlDLpPKl9QJJwYcE5QJTXDSJWvZUk3eYeY9tDwbMlILMIom?=
 =?us-ascii?Q?fl2QjggmHGsmfR9IwQjIT5/gXvdkcuJeyH/7Qr15YHoCR9tapXxyaf5dm799?=
 =?us-ascii?Q?IM5rkWQ24xUWdGl6cfBEfcxrixvHu7omcHEgrmAzIFWfBo6ECa/vDYKuAFez?=
 =?us-ascii?Q?XfZ0uUeI49kwlDap6e2m+/EYQIqiTqfCdyFHab0fURwZnwNaNj6rMNqDQoJc?=
 =?us-ascii?Q?VPH3XkDyquCgM3fALTTRhfszvVqVY8Xf5atzfQG8OykiMIUFpXM1NFnVzxxm?=
 =?us-ascii?Q?QUxVAbc/EFd7H9Saz/zKnffmhF+d1viu/LSRjLreUD49TyYYz33fw2zr9GBE?=
 =?us-ascii?Q?JMzP+PfbAWBcBOorexzic+0vCwmPMATSjSwQ9eu/l3ES8Se2CiexooNUNYvR?=
 =?us-ascii?Q?15yCETLe8PYQhxGT0kvVnCbKAT/nWsYboWsC22V+KI3+xJWkdunVHymiJhhl?=
 =?us-ascii?Q?EzIHlvGJPpvGIXhtANvFh2/MXnHL5XxBOmWxsHNRYuGsjCROpHGJ3N+iIcLG?=
 =?us-ascii?Q?hfdxTE9lZcab4EbAHAQp/Ao5hpPjZ7kQN0X43N4XYxVz4IHoxDFm69QEHxzF?=
 =?us-ascii?Q?zlsc9emY/N2J1sozwZAXokORUN6Uv2T1QNuLHcwIfsFIHEIqkhBG+K4lVMMI?=
 =?us-ascii?Q?KdlAL7cIPWi9G/XVg4HD6SBAwqlQJtNBKaEDMKy7gFkDX83y0/XJoD8abmc5?=
 =?us-ascii?Q?yI4CKeh5bopmSp2UmJQZ9c2dy9/GmxloZaRiJSfxACvB3y+p71byCMOPjFxr?=
 =?us-ascii?Q?YR1q0P501DKHjBWhOgJ9udZGQOJCSwdBNDjkCUHAcVs6t7ZpR4n6QMI+XIBC?=
 =?us-ascii?Q?Ja/+Dl3b9EBzno17F0zEl1lDuqR9HBqlhfdsZe29/lzDeOzwdehKqRQWokVZ?=
 =?us-ascii?Q?UgUroV8ZVwaAHgL07TdoDwP/jaUEyL06cMts02F40fZLKoJz/yvjJ3e7QVQu?=
 =?us-ascii?Q?AtsoOiPkymPojlHNRdr9iVfvQWty5h09FhVyAJQ21L59Y+1NMGTZ8FiD6vhR?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wXm6ApMqNiC0nJWWEBlviUVXku0yZVTIVnX21ifpIRy21p2+5WTZrFZD5Izye17EGG9rUC+hc9P2h1bk334q0rFwd3C8ebqCFcibMxKWzHLJf7Wns57+eJnE4juWTD18UEiS2rScM2NfQfWbYZN/GJuVxd3IIPe3AXP/3cTDLuhwv8nOTHiFsPhaeWnhWpvuOx/k0dwPS378+TZzmTdlKCaQ65zncSq66IYgsIzR+5+3LKtFXW/41IaSDWsbvfVvX72BsLdslpfDGALLHst4xeGobhEHtnIOay5iunpDzK7vd76QaCfhHs8dkdVy5ReDmSHnp5IxWWMJkfF8nEShh6N23Mp8p7oon/JbVFQt8+Ux97O/p7Zy0Q7hXH0DQoJMyW+QQJ3ugC3BmDOsXX2S4gihCwuMFScT8vzx7SeSXs+Wf5CYs1Tzju8wpADZrr5ZC/T990+wwKr/E0U8DZbmoHXaU/SIfXsRM6YCuo49fesXiSXmlEkxkZwVnZ9LUd8rpHKv2jq8dTmadD3BAw6d0fiBS5Fceb9Qtv0OR0t19o4beLxGHdzFqUQJcmzuRyz1vRG8ahO6GVTPPhAoLyeyZ47FcouZU5cetjfLeK+Hvus=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80647597-34c4-4580-fadc-08ddf012d14c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:36:16.9771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Liq6RrlRPavD5QYvUxYnfEAcyzIZzjwnLrpi+El6QdMnUYdNADSGZWJXDnHG7cUtZIXjDDPnfzTV4tjKRyYU4Zs/hBQj21rFuCaA3m9ZZ3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6864
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=744 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509100019
X-Authority-Analysis: v=2.4 cv=QeRmvtbv c=1 sm=1 tr=0 ts=68c0e424 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=CEIZDvEd9kZ5D99qYfAA:9 a=zZCYzV9kfG8A:10 cc=ntf
 awl=host:12084
X-Proofpoint-ORIG-GUID: RVYnIpU18aFfjtLAW43ZupAd2u0I8yRQ
X-Proofpoint-GUID: RVYnIpU18aFfjtLAW43ZupAd2u0I8yRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1OCBTYWx0ZWRfX4uT7slCp9DCQ
 cBlB3beqbhJ8fd7hSyVYfa65DvfXaorklbPjgwO0fRVLzqAOCiL6PB5p32EiShNK79rlmbN4yUQ
 NnuBPmjrx6gE48LNbPb2LSc6KRouKOZgViwbGuHjJPM0pp5UQcThL83erNyJjsuhLzmxpl/g94O
 weNOeWQN+hl2Q920cFJm7lOjNi9YZW5CmVUEYBXVnGZ8Gq5RUErl80ECq+Tj8e22fsFULsl59vV
 DXjet9XiwjNBUtqLQQaGdKufJ6Y+Uh45VsrUUWE6Miw19YFbiEE7hqLsd968ChgGYz6pZeDuJKr
 4/HcSYUIbwFFfXMt7uKNluoEtZExyNIhOzXYdSelA/7YVdC8UUQy7X/e2LCKZUazHG3FXIoPt6Y
 4lyb045EJL/rkKEiV7bxsu+WcJDQHA==


> Disabling the AES core in Shared ICE is not supported during power
> collapse for UFS Host Controller v5.0, which may lead to data errors
> after Hibern8 exit. To comply with hardware programming guidelines
> and avoid this issue, issue a sync reset to ICE upon power collapse
> exit.

Applied to 6.18/scsi-staging, thanks!

-- 
Martin K. Petersen

