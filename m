Return-Path: <linux-arm-msm+bounces-88428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDAD1065F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E14A2300EB94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1622B21770B;
	Mon, 12 Jan 2026 03:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IuIo0RdU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IWI7mlIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB92AD24;
	Mon, 12 Jan 2026 03:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768186818; cv=fail; b=Gh0uF6fg0oTEtu8scL/OiHFWhT3VzOZs1hb637jeo8kyMR9Luz+DNW9abq8pjjDMfmQPtpC3ff7ud2G9+VcgZydQwf2RcDux4vsiDfUj98NI1KfNLbeflnGLsLHu+b7pcT0EGwQ8gftSbVyANP3eZU66T3umRu5Z34oCwr44MtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768186818; c=relaxed/simple;
	bh=89A6bCDX1sgsNKXKbVrFUwcp0RatO5daOrnD3gwWADY=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=bdMjRkbFUQJu0TN41H4YMAlFKRWZmTpOpYLiSF7XkSHu2RoIpqkw6FyZsVTiwVtek9KXTjvCv3n2Zz5/65+8tRy5zHb3Z/tzGZLDs7GfPKKXd+Ws5mNjqwJ736lii++HbKyV5xuWMslRuqIk5cXcwaWRFG9tfMBRIwApTjdWTKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IuIo0RdU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IWI7mlIK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C0qI4j297293;
	Mon, 12 Jan 2026 03:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qVcNm5WPSt7TJr3+hv
	ePCJpItgg/wKjYQqzYEISXhBo=; b=IuIo0RdU1FbyU3fo/4dTuq7FXD424AADzL
	3FXj3VLjZxchV4UyO5VamhHQaPlq2GH/sRda+TAi6k5sgFDmQLJqOg60Oa5R6oXF
	5rnHrosVtcYSytS4f/x/w9emoUUpwdDtIMSFbYPiU7IZeKb7+NabKJjrTK3wufJv
	O8R/4HzOQaKuCADYvNxc5AK/W11bVb0YrTRDZncg4+6gtdOgPGqyVl8D+FckOsCc
	3wWJbfwGiHT6pxg460+BqnYAyWq5oZcZQ2hPNLeG7XyGz4kTbxsUz77y1t99DvcN
	i1fGlCnl7KS1DkSci26YivttwwTjTmGZGxiwUMPlGOiZDQx3Zc/A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkpwggyu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jan 2026 03:00:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60BNZK20004083;
	Mon, 12 Jan 2026 03:00:02 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7gnpv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jan 2026 03:00:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqYwP1H0rG/PBT9dFIJTvxSx9GIe2qAC0iKSJJJ4QFU21TCf4Vcm+ZFpTnyZFyt7AbkOCLRftUy1ofbCLlX92A5aYILCFaX87A2lUGeuDXQHZAlE8wUql3teXyJnSx6ZUDbkrMA74/0+uzfTITozQQRJl3hbQ5J7EcclxuQPzHemFfdm/mIiQzMqzvYZH4ObfxStvDnLbKfryCvK6wZx384ZCts+71RijacydMy2ItwmDgelP3ts7+4qCJSH8540dhrT5Q1eRn4pTW6YVy9vSApZwx+gposV9wEXSuR5RSrGP1yfrZVKajdo0ufxwzYou8mvBYNFI5AL2IhzYVihOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVcNm5WPSt7TJr3+hvePCJpItgg/wKjYQqzYEISXhBo=;
 b=DB4GuQnu0YBVhoAByOPXx/zn8zZc6A11MImeoP/T3t3fLNpq1NZEY1TmHPm1l+6nXon/t/xkf8wxdX+hHdetvsf/GdUQP1LGCXmW9saE31txHbLbuvA9lt27tJzTI7l061c9EDLIeIt9Ql5FvdSAcR0ozNdb/yX7MZ5EIgrk/sQm9pBEWKMjrPv0jasBYec2xpqVVdxyqCG0GStBIFD9xl70OIhOiienGB7dPkNjI6rNaf5eSrBaZh5xgiBT7K/Rb23FTpafu5iEHCPzGY1E3AznQD6B3c/miBDq9X360f3Syfp+La+CzJdZCrY9YfO+97xXtg6IvgxROg/N4EcG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVcNm5WPSt7TJr3+hvePCJpItgg/wKjYQqzYEISXhBo=;
 b=IWI7mlIKXgV3Wiu7VY4GbCi6A0qz3iwzdjxn7BpBSolaDWp0IORIMFv8P3WhAD8OOtZeQjNSwmCxc15Yg1g1RUU+3+vNloY3Xt+tBNt7Y8PzrGspHX/pMSH6p7x+0Mm9jmyRzD8XzQy4dot6VOIKgiEq0ImZgHmXSsF7cB0p3LE=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SN4PR10MB5558.namprd10.prod.outlook.com (2603:10b6:806:201::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 02:59:59 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 02:59:59 +0000
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH V4 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for
 x1e80100 SoC
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260106154207.1871487-4-pradeep.pragallapati@oss.qualcomm.com>
	(Pradeep P. V. K.'s message of "Tue, 6 Jan 2026 21:12:06 +0530")
Organization: Oracle Corporation
Message-ID: <yq14ior5yey.fsf@ca-mkp.ca.oracle.com>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
	<20260106154207.1871487-4-pradeep.pragallapati@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 21:59:58 -0500
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::32) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SN4PR10MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: 83461f68-8744-4c43-44b9-08de5186ac8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XK/Fu1U7S+I29ol7Nv+qQsrdb5J7QVd5pfed4qGk5bsFJ2aZWU/ATtlt6GQy?=
 =?us-ascii?Q?ErFtzrFI29bs0ZpcWVg6LPtmr5ptXRtLDn52eHrJ0KeffZn1wZfcKIu6yGsQ?=
 =?us-ascii?Q?ZvvT6knCEpGpIAr19RRpei6gHAg5sqOODElWIBE1U2kQar2/XH1AVbbGy65H?=
 =?us-ascii?Q?pUNimj6TwrsPGQKHK71JDeUWdqNEMDCvaA8eRpoLarUqeiFdk4cYHSg6GKCF?=
 =?us-ascii?Q?imDoI3+6bKYI36WJwGVmz97UX1yR7CTUvSNNbBTkW5POrITwgRXl6EPHEL/T?=
 =?us-ascii?Q?Y47Kcbljb2SvTDNDrdc2OasZsXxGwqUUMsZ2UnLgaHdBo7Ri/soa0ggXKTKa?=
 =?us-ascii?Q?R8dRzNvKwUbpXLpkTy/8ptVlDvs0QwrM3kBJ51p9ux+Y1ehZtGNwubX77hb2?=
 =?us-ascii?Q?es755RdGVbVkc+k+hAk0idQTq032r+9B0NL9X1HJ3G/VuhUIeACeNK4OwlYt?=
 =?us-ascii?Q?xinXuy4HnGhqp7XFLYaXS4d0zX7ZAkKxYMjvnEqI/Bed0rTSrQAlCn9hQAwH?=
 =?us-ascii?Q?JG9pYew5k1s1Viqzp6KlIDV7uMIr4pYEFqGXDtWZjujprS4OVutHfWvmHHp2?=
 =?us-ascii?Q?Nw5S5X39gBz8CpjBIBjv3LimZFx7PsB3qYAL/c95f9VXzhqhSn8N6mAxpyV5?=
 =?us-ascii?Q?+h/W5sfnyT0F8AsJzWjWkE/RdLHJk/hollNoMZoOQZZTD/MwX6K+R82bBNja?=
 =?us-ascii?Q?Aj+I9Snp6ZFSVK3RGa3+ENn7bFpR2NKwnr0mfMFyG8NlfK1jiJdX5LQQFlyz?=
 =?us-ascii?Q?g0yL4cUBr96rt4t/dgcdw+grWi1jwJO1mf4L91eJKBR4ytdMyBCDF001NwkP?=
 =?us-ascii?Q?HlZB8VTcT5gC+xWrHy0fZvNfEZkiQlsj/SLeUFgRT52pnyR/sEqpPFTp5OW2?=
 =?us-ascii?Q?P1U8XLp5L0BJWs1rW4yyF3n8sz853LmBrj+P5JnIOeGy0wLiXhS+6YtwoD64?=
 =?us-ascii?Q?EmbD5NXX4vtGG50IfZlihocrpJTOW7D1hYxWkJxOipsk2J+EJMfAWtq9T/u4?=
 =?us-ascii?Q?EC3B7mlst0Q1133Ru3DNuJhrPxuPlE5Pcy2LE4X7KhX52YvKNqW4Qn5o+q0z?=
 =?us-ascii?Q?lIw3qD+VszsEkYvdkCpG7UACj+3lN+hv/WENHOCmP874tjjY0ONI1sU2JKA4?=
 =?us-ascii?Q?eXZXqoxCBQB5xQwyLFv9H3NfjPi+6AHx51SiN028JmYMJsZ0hFyevBkUSFTJ?=
 =?us-ascii?Q?Rho2JMWh8uWvaowijtTDFBU6cRpDgZIZ+R2Rf9t0GaMDdzKIkkG//FmdQKxy?=
 =?us-ascii?Q?StiGySA+Zo6dZMAfbJonU5ZMgWfcDFbI4aW8CELA+JPt/eRJTAI+XUJwChdX?=
 =?us-ascii?Q?C0MIJILXJ43VoalDf77pmflGeOF4pTdAbMdxWsK4dqar54lbS287cH6Dpkc2?=
 =?us-ascii?Q?cwUNiXA3KtvyaSj5qJYR2531eVw491gxCkwrrribhbo6pCGX22x5sTL/ewJJ?=
 =?us-ascii?Q?ro+b6nTJZRHa56GdMgOtbJoe0g/p6Hcl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dc8Wf1t+GICNG1g128CogZ6ZqBrwt4dVKCZfkwDbVSDjhvCOydnANK4bicz9?=
 =?us-ascii?Q?mS/IN4Qu3UyJ+KLr2whBS06oFkzHN8Y9NEkEczM0deA/AI01ojJZhH/6gwK+?=
 =?us-ascii?Q?0tHRzY0Q80B4CeBEk3USY5xzsM1CScVFGivCMkw3ikasJvdj2N5uhbcoLGKO?=
 =?us-ascii?Q?WzcSxgz2n2i+cgS+8W0bkNqZ68hAh8RIdMt1pf+K2uZB14lcPR1wnLDw3uTR?=
 =?us-ascii?Q?8S7W8CR5cxedzOVtqUMAj5XH2+5PGmBcuAncsZV2TAfPFIBjzQzVqfAF+WFF?=
 =?us-ascii?Q?TU9/gm3+Pptq4dkddJL+ubLmPJPkIgnViL2Ynj2bVZp4QE0pY8vdfIRiJfF6?=
 =?us-ascii?Q?emN1NwtB9LdJQmvYzGNsCRYtvp3QJ76msxCQ5adZUIvjbnqakyLwbACf/jMg?=
 =?us-ascii?Q?I5Ak44LiMQeyjR6EgVbFHpwAQsrfQlMIOrvK5zTLjlhye7hyFEzkMoJkFSLe?=
 =?us-ascii?Q?h4HtBl8kPbrROogJjev8UFl9+VGceUyE/JTHsc91/xF5gnxjZ9NQdVzlmfgI?=
 =?us-ascii?Q?9bTrj9grz6SHr5ht5GjzIjBVtBIsbMXefldbhAR2EVs4x/sWnm3ZYPfISQRk?=
 =?us-ascii?Q?UUd0LUKfasfCMnbAU4et/BNieAiHyqp/33kJkZhm1D63mo7hGWJMUgtI+Ll7?=
 =?us-ascii?Q?BnkkEbpe2NW8JTVX/h8DuZJrkWG3h9Zz1RXjlKJPm/JI7+Y7RREeJArF5izY?=
 =?us-ascii?Q?lSUmNFUn3+Tki1HnH/FQDJNmlBK7sWjPJFY9xxUkHf2ijhBJfefmCkxFHIIY?=
 =?us-ascii?Q?sU4KrrnHTiyyp/5bKhvqtFX3Pf5FSiqxkh8fJe/jte7/wsEvPKqmZ6i2+5tZ?=
 =?us-ascii?Q?Iy3Z657114NoB6kP4bSk/Q7nL2dolslgfc7MHLvxfLsxDRH0BM8zv7cBXPcr?=
 =?us-ascii?Q?rhNyDIinSQyjzftamTqYdz9u70cqXX3D7C2d7HyvG6b5KShFL7QGGiZE9QrX?=
 =?us-ascii?Q?sR9q8U946wRPd1f0rEN9neXwtkrSOYtr+H77bugQJlf/8HU+6RntWMFE+Xka?=
 =?us-ascii?Q?w9FKcOoCpjfQtwkzxR73jTE4Dp8MABuLexoJB6QUnT/0sUkG2HT0KFoXyk9V?=
 =?us-ascii?Q?OSvKTGYWmI+uU0BIQBgsDOgjNkIH6ay+yFITqlvvK2E8uWiUoboWxQx+1EXg?=
 =?us-ascii?Q?By/1XkbFzu5BRRQCE0vHd+qXNPe2+QjgOIkyY/m+7/EFW64g8C7CqBJaen0u?=
 =?us-ascii?Q?1RNsHGVRDdmMdFT85CucJQ0t6U4RcYfnbt/ZivxPVf3kxTm4hGJUnyLUu3ec?=
 =?us-ascii?Q?9hIPcqnYmNsfY7q188dcaRqwbVKCSS1dUIYXKRTIEo7qpGcrTCPFRAwD11lS?=
 =?us-ascii?Q?Uq9gKttEhdvvSv7Cf7/LRbUvuawqAQgq6+CK1fHsDPfVNvTPkOHuDoSDNyOg?=
 =?us-ascii?Q?hVAg32s7kMHXFYuxaQTvYlE6EH85MNo0sazI0bYLA+6ML0jzHIAzTMm+fb3E?=
 =?us-ascii?Q?9vRV5SMNsXeyVj7XB45JGdm5J8nWPL/A7DYlLgekHffVVkybr0RAbM9K/mI+?=
 =?us-ascii?Q?XcvswsbSBzP7bmVUemwgt0sAd6U0Ee7/560RgyoJAK2mjKcBom0OvcaBUaFr?=
 =?us-ascii?Q?RB6JZ+obtRBQYDsUB0UbGqHJaPNYRKpqX2yG488iVZQD/+rDwSFJa+V+41ve?=
 =?us-ascii?Q?DbsD2g/BziyKn7bKU8sxB4dVWlX6ANiwfwYWIylIUcg+AMumzNb8hj1oSKuo?=
 =?us-ascii?Q?YQf9iRi0ghM+E/OEYymzWBNssMI8LtgXDfcqO89Sw44y7mPoITbwbERrlyL2?=
 =?us-ascii?Q?5WNigJVctgikZICTZajdgtPzJ82Sh4E=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TgFMZuVO9QWhRlrqUjv9ljWteW/NVGCys6kb7S38WC7lzAxiUc54+FwrUIOr6nSSSjOrmIgtLBcj+MEB/shECqJFBmcrhMKY68fcrdrlMwSSjhj6F8oW4NtOTlyDcpvdP1X0mUgqOZcdEZoCfdoII/VmlspzLX62obzCC2fuyQNunaYV1Q+nHB+U+t61FlvugnKrlFOljkgtUyd9JjgMGXRlpswpgX8ArulzmXcbKpH2VPkOhsyZr5siD54SR3jvxbB7Z+8bDynmVo9uUU+HinOQNUh6fmLsPpKkUY7GlKcuy3a/b22PxGS3PAQMXGu6oAMWBnkdPsFFIfCiA0UTagQJWE/myIMyGiMgExad8QGGGim/MRMdnDmfph51cDHAUXqgoTfbielPunSVpmo33aX6hKWD7xspGF6lTbojy2bfM/XyLkJ89ezzkpmMN0q2Z5XHvPFpU7ENTbZWuFf5OU6Hzqd3ubI0JL8bElxfg9gCbj2Teya1v6u3gH7et0zwUj/vOp+ANrXAsGkaOTvwJAz5oqn7z1VGMNK2iPRv3Ph2LxpnXdRi4tWq+VotYfCmsiPUTMRSrYUKTU3E9AGRYLS4ysA0bKb+9rQKj9HhiPk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83461f68-8744-4c43-44b9-08de5186ac8c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 02:59:59.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3AgZ9dxOWsn7EcX9LwOWHAnY8BTpWd+xDoA0LR5trTGTfkrjKAwjlK4wzqodepnEWtW62GLXPos8AMvAN/sGnAj+b6H+bw8kwW0A5dIhoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5558
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=794 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601120024
X-Proofpoint-GUID: Skn8K-cpFKN015CO7wXyJqdoCFSxXF5m
X-Proofpoint-ORIG-GUID: Skn8K-cpFKN015CO7wXyJqdoCFSxXF5m
X-Authority-Analysis: v=2.4 cv=ZtLg6t7G c=1 sm=1 tr=0 ts=696463b4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=fH-aP4lAwYYfdfjtFLIA:9 cc=ntf
 awl=host:12110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyMyBTYWx0ZWRfX21HOkpBwG/pk
 yYyRg0Mnfs93k1zmcFiozVRxh8Ag7U7OLO7TBShCc9KhBdtSn5JD+zUwdu23n35M6mc8fC0sdIV
 3y1usWOfVPt+32Wi3jLYZP1um9vo/avJzNlWqQwi+VGYB4gT/aLjmNggI0BN6C25Q7Dlwd7pfmz
 JLyrjLYYiXidvP47pNchEEEjHZbyNnxzE+AAYCbbOPW5/7yxLNYNQneFKCw5R1EAsIhehUgMrTE
 X+677/jfEepJrMvE/mZu+QKopy3PNIiHTHqJWtSW3XIgmy2x/NpI9YZZzPQBVhHTLC+f2Qk1HH+
 xz3s4oLClz407Ui44lpSJHgd6zpE2wovVoQakZUdCtSgiO17oSDmp7r90URmKF53Z7cJxoBFZ2N
 fOR+LQapY9eEt5eQIKDE6klAvFdYqH9UTr5QcvGszFA+3ycVXUATdx3ymaUPpCEz3+LK+PxK/8c
 j7VO8JPS+X6Tnm/EB8ovQes+gixRrWwD2y1o0zRU=


Hi Pradeep!

> Add UFS host controller and PHY nodes for x1e80100 SoC.

This does not apply to 6.20/scsi-queue. Please rebase, thanks!

-- 
Martin K. Petersen

