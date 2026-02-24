Return-Path: <linux-arm-msm+bounces-94013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Yu6NKar+nWkNTAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 20:40:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 568BD18C259
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 20:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5E0E3062F93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 19:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FAB30F52C;
	Tue, 24 Feb 2026 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="djAYTWFR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="r1QhzP1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292E130DEB8;
	Tue, 24 Feb 2026 19:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771962024; cv=fail; b=JKEBh2UWi/MNeP1zEiFIlI/dVDs/XnOh0zWs77zBAgMM0KmbT8TR9hGQHa8CnWo2CUJp74WMzyxxwPpb/uiJdTXqrt7Ei62WjRWznMwUplX9DJMlaWRKuTebY+oTafBuagSzi+3Tm0b4OgPwLLtLHnhRqb7Pm9papqLQ4qz0wR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771962024; c=relaxed/simple;
	bh=1Al7qpTZApQRI9kzt4vVffghPOdnsoHCMwlM3cnwePg=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=UL5DknGIgTN21AZaTGJwuSdoIhM6tgVynomyTQKfAbXTAw0w4YqyD5GAbpxyz2lmYvUQ5kE2tFJj36B1MvpdLk8DElsn4XUuhUp0mW+Jhv+kpMd6gwrzUWU6RXPqx1DYqH0gvZuPOrKsOGXPxIixmatQXxDRTbhFK6mT+t5TWbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=djAYTWFR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=r1QhzP1p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OItu7W553132;
	Tue, 24 Feb 2026 19:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pKfxsU65gfMRCmGgSv
	AEnON3r1k3FHTB1nmE1kfAbk0=; b=djAYTWFR4uC7gjcwENR+24YuObIsnntsot
	OWvvaZpa/LVpWf8FAvG+yIehxWX56LgkaU45/39doDqWg3dSmIzFI5t3jq7Q7CFV
	68Abe+uo1B3iZmpRY4Wzf3+cdjLYzKTdFmrV7SJz1GjpVpbRQfIEKu5yy0bDNeO8
	qcFp6ir2QZf7PatJHh2bP1msVAZqEmqEK6bO/IUpchMd1+FBDUJGJGR5P2sZ1WHs
	NPT1rN7pMmnsNGuCs5qShsTZqAiMTBmaVW7yK5XC1JbPG38Ih3JYho7mT0jTRLst
	cCa3RMVGcoPTIk1q/imRVwqCSIvRJSjz7TZQd3+NaK1wR2hpXE3w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf3g3n03x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 19:40:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61OHpto0006057;
	Tue, 24 Feb 2026 19:40:14 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35ad9f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 19:40:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icvLmlAu9LLioRn+w6zwQuy4Om45AXTOBFi5OFyc8jhDntdQNTlinbUx075NvaRuK5mxXWnNqoXuS91KPxVVAc5UEZlnONLpXvMVVIwFc9UANBD5CQ6qGBG0J/XuvWdQCBA243UG2aVvvc6Vx4VjRJwFQ3DJTOP0qylmOjEdi2gOiBKPbI1Nm4Fua429iWlJMg9KaQkhc+rPHzimqS+bR4hFbnVroStD5MEG6oF+CC45e+9MAa6/QuzfgyjABSvhmSLI90xsj9qYt72nyYz9NywRnNlEF7f/3Ylp263+rsPYFidPt1H98cN8aHXh23nAsEE2qZSC/zdG4qX68b5wow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKfxsU65gfMRCmGgSvAEnON3r1k3FHTB1nmE1kfAbk0=;
 b=IBFkuBZdkKSMihvzQBqgPIItSA/wfH0HlJyPT6r+fwVnYL13LeftgpvrEDsYJH/YI1HkF5EBb1qca+t1tbF7yzMTimmwUvAVuBf5ANVNn6MOzDx6FrEYRQ+nATSrPdd9FDMzhAoPbINXyBUX14F7zdaojQeDCUG5QWdOMTX+xYGHeHwCFA+Y4X8QGs0khaJNWid0H2tpIc1nh7pWqVQhRj2N7wnBTZhNogYTKj9xzWPhNngfu/YVlD/4wGJtKWuxccDRgxenaJrtY7CzGzbF8cvNIQb1OkM4/3k274XYMstrzBwY7foV6qg2iYAs8uHGdWAp/IR4JBFqIHuHRlnuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKfxsU65gfMRCmGgSvAEnON3r1k3FHTB1nmE1kfAbk0=;
 b=r1QhzP1pB6GnceeaNAO+NZyZ0lKB3bmMpBNVHrLHTTRUFW45E0r9fkqs53SUt1KEcPOZf0LElb0KWrvV3JmZ89D0U3Ss48/dBbXbGJxHSqPXQOgxHZhdudlOohfP8+m7L3OJ1wGC3OCfuhJufoDslaxWvM2NyPUGN6ogqgSH3yU=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 LV3PR10MB7981.namprd10.prod.outlook.com (2603:10b6:408:21e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 19:40:08 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::21c0:ebf5:641:3dee]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::21c0:ebf5:641:3dee%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:40:08 +0000
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V5 0/3] Add UFS support for x1e80100 SoC
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
	(Pradeep P. V. K.'s message of "Wed, 11 Feb 2026 18:59:23 +0530")
Organization: Oracle Corporation
Message-ID: <yq1seaq6ifd.fsf@ca-mkp.ca.oracle.com>
References: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:40:06 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQ1P288CA0012.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::6) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|LV3PR10MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f5d4690-789f-47a7-0d70-08de73dc8404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?no7IVVx3Bz2qCNPabd8ccYF1Egq7C4htcU0wjQ+5HEcMpF409r7uUaYrcYJ0?=
 =?us-ascii?Q?99J08tMkymKcuQZg1mTnsGtIV3jgIoK8Wail+ArLsYj8JtWvPc5bwHysq3Kt?=
 =?us-ascii?Q?ZaZIsqmH22ZUEvOIAc0TlOIKnUtkURYHb/HGeLhOR7vqDx7lm6LixispylB0?=
 =?us-ascii?Q?2WiBFrR/KN99egzNA/vwit+9wB2kf7yP5Oy9QZ33mJvQS9Cn0wmkXIV214tg?=
 =?us-ascii?Q?Elcrb0rQi4wYn8R74MaMUpJZZRJY/kWApO9Q/q2qC+QBvMSiI3BA9tR2W4At?=
 =?us-ascii?Q?EkyjTUfBsD/H/RuwQe7N9EMo88SlKkrz35fYGEALOT1l0cAoi1VZJftdLYgp?=
 =?us-ascii?Q?aIHMATZJKD2avVdr8K0JvIiRkp+NY2zGNaZ74TPbkfnDBjAZAXOmvMTfdOze?=
 =?us-ascii?Q?SCqwIkc/OBRLLa5wNRxEubYQwRryiN5UKAPIjfu4h6OqE/nG27r2nTy7qUPh?=
 =?us-ascii?Q?npnVDz9jqVSyD8cFf8pCXarlYgUcEGI2j+5U8WOTGIogBbNwavueVaU1Mt9r?=
 =?us-ascii?Q?yFl4Rh7+rldi/2C7q1tUooPmbNxaQF8Roe3jI+3E0nAweLBtt+GgK8YcB3Qx?=
 =?us-ascii?Q?y33h2/GReqjMX1Zdphqifs3ZBqKEcXSrFxBTCsZruWbCMZaIzDLFL4sdGeb8?=
 =?us-ascii?Q?b0Lpb1Bp7xuUwNWZGKrCivRiqOer32kQSriLwd65B6fikbO0iE+U3N1glOjK?=
 =?us-ascii?Q?jAki7JbhBVavXDrb8xRCuhDp5klA3ZtEniqm19OGtgbrUjTpwn52bfP9hj1m?=
 =?us-ascii?Q?R3lpKLVizXnuHpUJoAQnGlg26GxsL+P5sVtCph5DpB9ATWhxD/qBbybm3PBq?=
 =?us-ascii?Q?etBdR6PlH0BWvf4qHNUM2tVqmIpRc81WQHM77U51zoU+rgGEjSpZS7iMKFhd?=
 =?us-ascii?Q?KvPGiaADBuirzuuRc7XqcdNkAfKhsZeZBW1n5wljfOV1L7MjgQYzh+VBieQ4?=
 =?us-ascii?Q?1ZNPvcP7fL02ixSsH3KBQwPjDfJ9wKFm7tFnz2BPHy7d3g3LKl0ZSeFPOYYG?=
 =?us-ascii?Q?bJ3xLb0iswXxRujkv8QjDU0Yv9aa7GQdxM9WNAbUWq833C8uuwWPnhd2UOy2?=
 =?us-ascii?Q?FOC45fkBLUX/KkcYM13YYkQzLO0OjhB3s5ZBBuxrOtNp37iPujXA5LHF9qB7?=
 =?us-ascii?Q?kWyv7x6hzKclB7WGCHRop/QQ1mKV54oA8thTbArr5GTgD7uCdcEI0IAYytFh?=
 =?us-ascii?Q?H0IzUhLxq6m/Vj6yK+u4NbclJ15pYgU/MPnnjT4Ixcj9eQgXVs1ncPEni3b1?=
 =?us-ascii?Q?Q5FK6454BNEFJNS+dwxH41R54TMDm9JhQa2h7/XyiehbELyKco3fUMt+yQyC?=
 =?us-ascii?Q?VYhmOim7BW5pBgjtzDVGrLMLlfsH/9iS5cl6sNGAyUzh4eIoAEdyVUOzltki?=
 =?us-ascii?Q?VZWBEZ68dhakNiNwVAcB6bwLAMWR4t+eCGbN5+zQJWZ0mbNTcj7G6yNWeftV?=
 =?us-ascii?Q?45mgBqxAg25V4b6RX0dp0IfcUGwvRPrigoCsHOG7gBpEje/JZSUV78Hrq2qE?=
 =?us-ascii?Q?r3WOHfAmJvMDjFLNtZZ9SvDJjvaVU1PzuDUhQehXNRthsiBUtdFo6YRUd7/H?=
 =?us-ascii?Q?axpj6WJlWo3B6XNM4/4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T4/dx+uj2Ow8KJVVx/CQ3bqcn9q9CzAastOjsw5+bkkY4DO2TzpzQo8NKsCG?=
 =?us-ascii?Q?oPiXGokJHIFJ9s41KjKd9UT3/uVKqrUpGaA7iUZtXRtUL9bH9+Wgby63zr3V?=
 =?us-ascii?Q?tZ2Wyg4w0QIO6vsoK+mOE7X60PUJATSTrS1BuG2wmjgwmVg//REzsvs1X0oG?=
 =?us-ascii?Q?CG/IO5y/asE8BhEaNK1KEhayCa0UeWq73zw7CHrcHbhrJiWj6225MLKTIqcr?=
 =?us-ascii?Q?IkSmhlMbAD/lk821SRslNygIqU7UaBiIptzB2R980OI+DFLQXCOaUGhKn8yh?=
 =?us-ascii?Q?ePlISqDEvBE7zxb80sbNUucsZ355nb6eAzqM/Qj9AC+4SfMHtJ9NwXZtaw+p?=
 =?us-ascii?Q?4NmugJ/cGK0IpKfBnQ1qHKLvKN0/Frw5Uz/HnDcfYdxiLRKZ6xfQNdmLa/a1?=
 =?us-ascii?Q?G2ry7r3cqCzfUu9kV4BJwRspnRbLgtZkBQD36CFUgJjJ8mEvUKnCk0ZFBCHR?=
 =?us-ascii?Q?pn6Me8MrZBX04jrvCR+rRQA7Xmj3MifvMaA4P9Q2SCBlRlIWwxtvN00YLRpB?=
 =?us-ascii?Q?omSx74yOe7kX4gNaOhUpIHDTDOH0fI1Wz1XNNopEwaBErEq9d46KMLxBxPqa?=
 =?us-ascii?Q?Mwcard1uDRAjO0XOO1b1OKM0r0U1YjOYCBv7sew1MgLa2kOetduteQxjltKh?=
 =?us-ascii?Q?mjf43S5ul4+CWJihIWOWnids43c4DCdL6A1e9XQHxCJPx/W2U7FDLpCPL7ER?=
 =?us-ascii?Q?t4ZrzZGGS2A18u1KVUXg6pLR7SSdABS1l17vvP+Yvqd3Aaz9w+xSAsldDN1l?=
 =?us-ascii?Q?jODSc9/6i3EtLpGcafLNIw08E15n/Nk5cgb/RB+J5PWTjoju6vSsjwEgOq46?=
 =?us-ascii?Q?beONAWQd+tupFuN1WGipYRnShiEe1YhqLVzlzLxEX1KK2F2rtab0ed6IdR+i?=
 =?us-ascii?Q?L/lKodrN282e60RfSY/H927iH/Mf4MUt1bGIGUGcmm1a9BROOJL3bBU1f31d?=
 =?us-ascii?Q?MtFYEXbyXA2AYBFivOHIZwOqZ7pxvgeMgFc4B/GftqulU1/p1cFo+By8cQcb?=
 =?us-ascii?Q?3XhPoIWTFn5KmjLHxOlYY9+wPJ0bD45sofT6WgmAMT4w9xtJqBY15op5X8xs?=
 =?us-ascii?Q?qInwzP5mKxjepCUMISn3Gezw4xncjZVYtKU5TYUL5CO4I1Ons4yXYKeQggsp?=
 =?us-ascii?Q?/R42Jh4FohMgX0JIWoUxFdYsuhmLh9H1XVRkC/nj/fPlGiRVtAfOEu3z+e/3?=
 =?us-ascii?Q?eAf9f1Y1DQJQkL4lKlshNOGqIP8LvJ5ggQdccet9n4lgJB6fU93DiGKNFT1v?=
 =?us-ascii?Q?Z6F+FpcxfkDtW8abMGA+BOqBMK3YeHdZhtGrn53n0ZaD24MyvS5R81QA5yDT?=
 =?us-ascii?Q?cHSWXkpB5uKE/BgDDQ/fSj4970+lAV8uSa1jaYDXQsiN95IwJ8/XrCcSMD/i?=
 =?us-ascii?Q?bYJXxqqhe9t8RNO4VCzR6sUe6PsFZ2Tcp0UBZr1AXVuDoDtgoX/2YwXje1Jr?=
 =?us-ascii?Q?4xa2CcHxI2VaPVmqq+Ii9xWVlRIYGlU7oa0zT1gU62bU9BDoAKXL1Juc9ZlZ?=
 =?us-ascii?Q?oNmJ/LkmJZStggan3UPZyXegDi0LnjAq8zbgV268b5xtZRLHeTETIAeO1beB?=
 =?us-ascii?Q?2jCFSyvcXZqlDiHNgJ89zTcwkWWGxTy7/th/qCsUKYLyy7wA1GNfGCkeiO6z?=
 =?us-ascii?Q?YyLrLOmR36kE5bmkFhDOxXy5exen8NFPObyJ2ct/EMh3t4fGDIA0Pozfl4g9?=
 =?us-ascii?Q?T30ixrvI3IN/jsDD+NYVgjXW9kiujAs6wpJz+/WDu+CMJjX0uA0x1DREnMu+?=
 =?us-ascii?Q?jYv03cjv7BnFpfRwv1DO0WuhCGpnif0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nWrsHYk3RpBco376oS9MbW/xNV/5/iGQskdLozRi6ExuObjtG0TZnbqJHCBMypZlSssANcS99iN49y9kfyAZqa7epEsONkZS4jeTO8lwTRed5cZeIkEJgxcTmgn/9Ut4ar/3nCu8UbTMVlvI83+qJ/Bqtf+lkdGMjg63wP/y+iWUyQ/8UYgoaskI2YcqHjQ6JWWwepnYGjH97uAmgsblBzBt00GhZhqM4Ihk2BppJ59Tl7bFGPiTi4+w1tWVSnuWkLFtD5DFQum7t0cZAChlI5c6EPonNui4oBMqf8G6xStEq5er7dXc0+MzHAvgwJtIdxZ4yxSwgcx6fvuk4JsZ7R6meuUiefL/SCztgpWFO3xB4IrkSZj//Hzrm9jFrNOK2obZaeJHopWdlF+o/hJBayQMZmKj0UQCBWwxzupv41D7GS1zmyd/XYo+O2FvhUoeTQpSosqGDlvoPnjWgC5Lsf0m+H60Z3XauLUdCxEyfJdHY4aAhjfKbzfSZeDF9agdxkQ+IeycA3ung1iecPJ/qH+rk3qF7PeAePuKnY9+1HROxTMcrwOwNNJyNS2Z5izkkqAgU+iKF6aNGWusK1hlum9nGB2unjr64ZWdQ74ZD6U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5d4690-789f-47a7-0d70-08de73dc8404
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:40:08.0512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KV3LuRBIbziULyAVyptD974+6zAFhXcP802I1Huj3N0oN84HDvxHE2KBboKUNC03M6zJfy90m7ytnYWr9joUfMEj9MBOZbmfNb6GDVjLqVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7981
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=883 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602240169
X-Authority-Analysis: v=2.4 cv=Y6r1cxeN c=1 sm=1 tr=0 ts=699dfe9f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=w2bdrVGaxo9uT20gPq8A:9
X-Proofpoint-ORIG-GUID: gYH3a2kKj59eWIaHLEUDbnCW2Be5gUzs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE2OSBTYWx0ZWRfX3JiMDEtvdBUd
 HA5lB+wdk5einnj2+Zs3bXhA+Xx/M9IOwxYp7DNANhHHU24tFNJtIJCaQJPMgsKDxxzLgx6wdol
 VV0V35l9J/Kl7QCAG2NqNadxDkl63+uuOzL5iFQ5zimtPifM4ggP/G03F+uaIx5Eq6uTSBh3CbP
 lEUQzZHZnhSSeL801nfRkds6obcC3CUF5Ndp7l69FZ78UepA03pYZcFfuhs4dcmHEW2VwCI905g
 9viYCHySfCsXuhaxud1VpEkgCWHAMrTWhSL0SvGDN9hXG0cjzKIPIve7SfXAr8uvfCKal6DV0p2
 iFw5RubYsNGBjkbMSREjwKejGw68U8frMpfMzB4dys8GsRF1RNCmVyFaGWVmlBHIaSQTke7WFX5
 PvXtAkMDYV1heCemZOH9CUJcOXFU/U9mlszWnj5QUPUJSPw85cYBlvrs5f9GKKEsIGCJMpyjgxd
 ez8j+Ua0ZpAO3YXkm0g==
X-Proofpoint-GUID: gYH3a2kKj59eWIaHLEUDbnCW2Be5gUzs
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94013-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ca-mkp.ca.oracle.com:mid,oracle.onmicrosoft.com:dkim,oracle.com:dkim];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 568BD18C259
X-Rspamd-Action: no action


Pradeep,

> Add UFSPHY, UFSHC compatible binding names and UFS devicetree
> enablement changes for Qualcomm x1e80100 SoC.

Applied to 7.1/scsi-staging. Please validate conflict resolution in
qcom,sc7180-ufshc.yaml, thanks!

-- 
Martin K. Petersen

