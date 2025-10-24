Return-Path: <linux-arm-msm+bounces-78655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A787C0415F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 62F47357CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 02:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8746A22F76F;
	Fri, 24 Oct 2025 02:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f/hs3fDX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="naae5qGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26921C860C;
	Fri, 24 Oct 2025 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761271730; cv=fail; b=djVQkhmpOl+67ohPoMavSX0ce52956oTaqzKFBZ9/uyz0NyOkNVxls/yoaBbB07cA8X+ZH0Hi+AucVEIqaSal3VE3Xt1+dU5bPO3y1ozEJ9mZncDWHKJadphjp4oQ7ZvuZYNP0+iN332vzTo2JKl5Zt402FfhX5xk9Ne/9xWFEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761271730; c=relaxed/simple;
	bh=U5zDMZ8n25qvEfYzJogOzp0hIZQzMlcyPnZ79aZffg0=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=SShXkm5rFQAEXrBrtn6xnQMhAaWlTRRtU9P692a0DwcV8hKCdSgVrUTelBziKFbiWxFshutISfmbVP07mEPxmH09DGdjJ1i1PUVVCpOsAvpsghzFO6EA1hTtAmMXmc6m0tCQeRSEjwYg1q2yh4ks37ol41oCQidzyTHS73OKS+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f/hs3fDX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=naae5qGc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLNKAX005305;
	Fri, 24 Oct 2025 02:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UsLvV04Lmctlx8CSNY
	HswKBTQNzR4biBEini58ZT0Bg=; b=f/hs3fDXa/QuzU82SpUB78q4ND6HKPyqac
	f5wXhwJupn6r6vLC11lqfoBSeaJnqcVsyN9HnCop1A0+dxTRAPq26s1ogjItZU+Z
	ul2Cs38dI+ZR8ZR6RPm3oGer0pzYyT3xsBF/I8VRZOLKOtMdXpgECieBQpJWo6ql
	ZBfMDi5N9x6ARKCSj8fWocRKSVFv/ljHl+xarHWoX8TB+WGgLI8Bix7ZyB7DXzOv
	V2A1WhvJmzkVoWv22ErDQfYGUtoV32ettsiiJEo1k0o9EQGmAqwZDgHG9783Bf5F
	ESrULzT6q9ofJfamX56ki9Ivtofy5O9uC5DKYOKTZCpvsvfCwREQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv5wkth9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Oct 2025 02:08:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NMgQLk012109;
	Fri, 24 Oct 2025 02:08:37 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010071.outbound.protection.outlook.com [52.101.46.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bfj3b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Oct 2025 02:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms0zLkcpCeFAE9tGz1pkqogHLh6C3qY8q7Jz9Alimse16OqRdAu3zuMAS/D8stjm0ofipfzk+VTbOlNtyGSUns5guqd4Dqw/BZTF/wPeeAxKFdPq0zGikVuD9BWX2J/zvhKdlp3pW1xW9TaWWvEZORxaWTC4XrEgWQm9C+NYpMsYp/nJ1GYDGYe3bH/Mdp2y5CwTe8T7a+zYRsviw12s2i3VarJqUIrHCLT/PT9X1i5HsnCq3Bwi4TO1hlOBjwbCFBDVJBsXTIN+jEvXqH3/DoNvKZ+1IGUyw+oxv4nPBqugadb7J4SoX8nZXkGQYyIBI1Ge4nCbKC9bANwbKUlVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsLvV04Lmctlx8CSNYHswKBTQNzR4biBEini58ZT0Bg=;
 b=hw4EFqHqvwvCLYRXItnsS95ctnSf1UgucVbNo6cp5R52nmEKbz7/PGY/ngzBJyrFoTj0ZqkfNuqDhBrq/oFMBLxWXbJg5hDOiuESxjytMaWBs6Unc2TXcbhttOfbkAh9Y+x5jTXzp1RbmefUvXVAXqYaBVkU0/AK6E0kZKDPjgqkwgHCEZobR1cMcpqDvXQVOQrBiYy6iVhYDS04g08BLJooidz+hSjRTqKuhf+oP5bSvwO0wxKhsppQrqRVzRIW0YmDHF437900X/f93iJWwjoJ+VpZf+ek/7gOrV8tKILQwiqi3h4PjbLlx7geWdwPj14rA+aXSU3PBsw2sgcwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsLvV04Lmctlx8CSNYHswKBTQNzR4biBEini58ZT0Bg=;
 b=naae5qGcA8Dwe2muioILBNRY7CgPD1CmTA/6rWPy+fQbfJyFboVgDp7BV1F1ri8l9Y0QD/rC82JR2lB+AnVXmUSN+ZmwwZ88BCLoAMpuBA38rTB2o1ElI+MjP1NVmFoBixRtiTxy5RolIc122FlBqjFNgY2GE3RfVEF4wypnsgQ=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by BLAPR10MB5169.namprd10.prod.outlook.com (2603:10b6:208:331::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:08:16 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:08:16 +0000
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V1] ufs: ufs-qcom: Fix UFS OCP issue during UFS power
 down(PC=3)
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com> (Nitin
	Rawat's message of "Sun, 12 Oct 2025 23:08:28 +0530")
Organization: Oracle Corporation
Message-ID: <yq1pladxdaj.fsf@ca-mkp.ca.oracle.com>
References: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 22:08:14 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0174.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::17) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|BLAPR10MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: 718965fe-2740-489b-3c09-08de12a231dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?plBTj1WVBz2ost4EWp7CsBgLEWcTD/rFK2CY2rsUiMV50qgQBQuswqQ9IFJh?=
 =?us-ascii?Q?xt+4yaIN1IiS09g8Hs99MDh3uI0wUFBSP9KRiOimahk71Z6FIUSBr9clM072?=
 =?us-ascii?Q?DY/0ulbKyPeIvyVc5XC5AWlT9KOLfvmk3rfpaDSgGsUToCCjPLW5uxMQ0/vd?=
 =?us-ascii?Q?yGQxC29GrXPvNjmiq74F5rO3h72ZFOR/Hh0hVehhQjQxBc3NCF2BVjLhd/Kf?=
 =?us-ascii?Q?w4ZqEjK4E4D8j7gMgDxF9u0ywg5RiRzz8oCEoJBfmmeSOn5ImhDd6k1XeQ1Y?=
 =?us-ascii?Q?W96lGsE+cs+NCEtQpCc3WiFhrfxEyaZXPHN4r5jy34yJJSGHWhxh4wR6nYgY?=
 =?us-ascii?Q?/2oXbCbJDh8LC8oDnJ/YwgryhouquleEAJZbL9Mr1jpjZCOAHtuWH7J7wOVw?=
 =?us-ascii?Q?7DtLUXGCKVBWJYHk3b89jEgwkW9+cVi20UnwmW/acevxYSeIjzLXpAHw+CMr?=
 =?us-ascii?Q?wDyn4BTKE/jfrtXC0bUNOEXio33fbm4QATrrr7ojkNelzXn/YQNgq1655zv+?=
 =?us-ascii?Q?MbfTok3jHkwc23+qK+BTKHN1QmS+S7OUl4CPo5RmpiGpJlzL6z0XVU0YX4p3?=
 =?us-ascii?Q?O8fwvy1PinrOYTmvoWy0NFOh5yY+Yq3JFYph5yoi1aaeF1mEU5R4WlsXex9N?=
 =?us-ascii?Q?CDsTLEpSJcVWB0xjBCT9mmD4eM2nQMnBq/XVi6ydlyVh/kbdAmNBRML2usx+?=
 =?us-ascii?Q?d/OwTm1WSCYEpo+aHTOUIo4IcR0+ivzcthsyCPxXf2PMza7HEoc7OFby9fHe?=
 =?us-ascii?Q?Zc1CYFzSccIM48dPCMXekumxV8uZjbinIag7bByg9mp8zlvulFPxrpzmS5Ka?=
 =?us-ascii?Q?vZn0LYinjiTJdTatyft7ThBBwt1L0a6Nok4ZoNIKgoD0Wri8AJ6Tk61VvYj7?=
 =?us-ascii?Q?HHCT7WBnGSGKM7V8uGIGA8tW1s/UgtKMYk9av78y1H3Jl5RLXRqqWUT9z0jH?=
 =?us-ascii?Q?fpjKpcREHpvCVr/xm7fY+Kdk2nWpBlShu9IoG11NPvClEnyF9BgfzuO7Qwmq?=
 =?us-ascii?Q?mZZXvZUIsxIL9J0mEJkC5iQO/P36xeDWQ4W80Edsqk1xUMgiAYnLAn5Z+S8V?=
 =?us-ascii?Q?wgiOn0Qwm1QQ6dn0ylZGAhIidhT10m2CDdTQMyLYHpkpu6N/EwQ1g8ndCB7s?=
 =?us-ascii?Q?Y/+GGqcrPsMaNaAenQqHWTW+zwvQLiSamalHCZilEuQ22HZBWC5ZjFT2aoEj?=
 =?us-ascii?Q?xdzeS/06irUgRcn1ZdyQUkU11IJ5H11MUKng87L7gAz0jT4fP+28TBwsaTQt?=
 =?us-ascii?Q?olEnMIrvUBvf3ylkJn/yD3iQbiCeRAsMsgxaXUvoKoGRDIAP4/C1b3QBca5i?=
 =?us-ascii?Q?Vx6UR96rFDbBMg/cKn+VSbMidQCcwzJxZLnPpnUZoPz+6LW1mk79TYMxvi/p?=
 =?us-ascii?Q?lPPCa5liq0BjEnD6hsSFdPjWmmMPaGmQB3r/YI8lTNryPaJW608fi7dw8BMb?=
 =?us-ascii?Q?y1/VcuE/lHYuLW4XogVQoJaF5hQXpJfP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1a8cAGgjaPsp2wOb+JQy2AyLreje3czZeUKHv0VQsXzHrXIoIivnn72J0zsP?=
 =?us-ascii?Q?TdsLtBTVXbUbmzOTL3gXNWS2y2BHwNbKZ0sEoOGEUzPFmC3WucbqlBx4B/U1?=
 =?us-ascii?Q?c7+Pv2rb/eaABMo1gPg+KRwMgyTXOeE9S6geUm2S49skhcloc5dkJ0YqhDov?=
 =?us-ascii?Q?/3dVhHY1c3J2sqHMBWZWoDXsXpmT0ypsLCrtlOPuEs4lzKhkDzLzI2ShrTz+?=
 =?us-ascii?Q?/G1c3TrH9qzPRitGg25ChJPOu66Sv4BiJO6gTz+WiqutahARd2D96TmCW4HI?=
 =?us-ascii?Q?GUb4UX9YgCSt8v6UrzSubCwNcULYiI6ejnFVEDi2YgpTy3hSTZgvQe2IUFVp?=
 =?us-ascii?Q?tAVRfyeckjpXpxRefZ8xujf3JuMgztutIXtB4PFHY0iC7APoLAXEixx6hlQX?=
 =?us-ascii?Q?1wejvTJSFkhl3n9KYw3VGNutzAMwpYkRK69tm1snNnI1pyXSNWt6Z1H4I4dT?=
 =?us-ascii?Q?SLLCjCccO5xkEwVJ49S8906LI3965PDuYlSF7iZ1TtvYwy0iIRfDvuYebofP?=
 =?us-ascii?Q?aCRb+J9x+HusFUFqmrwDtDTlOk7Ng8oWGO89YMWo2HGsZ1cMdQUiq7cQ6rjJ?=
 =?us-ascii?Q?xPUxumddQ4cBonl5azPabr8czvToj8RzDGiIoFPyLbJA0Kc4JROISjTHTjW8?=
 =?us-ascii?Q?JgPZK91d1HL7Ws4ZpDqy8jRvTkYa3h/b9243v53Z+PZ8qoaPeam7pyH0x+kx?=
 =?us-ascii?Q?Ijlt/zvKXkjZEixE55PBJiUTtq9Jb0V3GllwbhJ/7jjk84SfMWT9/y2DLleP?=
 =?us-ascii?Q?gBEJQv3MuFDiMZwcC5AsE4hUg8r39UC2Gh2Fs9/KyUlfUgcLaGFui+gY+cQl?=
 =?us-ascii?Q?Z0RI5H5XnmZNzG3QbAlGCO6zhZiJ0+62h5s7N0Ntz96kZGxcR4ExPc4c4Zbp?=
 =?us-ascii?Q?/B2sAB5CTWiBEAhY+yK7KSu9CKYpmKe1Rjj9XgL4Tq5PHb0x/dFcicmDZTkA?=
 =?us-ascii?Q?lgzu3F5MXIVa7+tE6txZeSTxqxQxlXq+CVBPz0fsb2S7hEO6KMp6YI6fnQ+k?=
 =?us-ascii?Q?xz2NJquPC+7Ssfp2O/Hhl+6/xPVpS0FQ9BY8FY3W7MYc55rPa/IBrM+DHPvp?=
 =?us-ascii?Q?KYEYSgx3FF/B/eJ5jfh5h8EGtimFTLreOzwv2796jk8JGdcy5q1VDdQcLzdA?=
 =?us-ascii?Q?s+f2iCQ8x4HWpsfX1i5mg3hapac+NeEGnas89v34xsC4fxtgtAYOthxXsjca?=
 =?us-ascii?Q?2hfdTJ3mMeAwZsfEVKiFysae0UQQf4RGpWvRI432jhPBUKJwUCxGJZYsB7tv?=
 =?us-ascii?Q?STlK7n19luDYEk53Y2aUWya/UZFgaeDOGkmz8WNwwEus0dQrgWmlUK4h6H68?=
 =?us-ascii?Q?hvgHexXS/DFKkQNjI5lOHPmtSYa47rxx+TJzDs9RDzpy+uScnEsdlM5PZydx?=
 =?us-ascii?Q?NNRhXNSuVIjQNtnlKCVuS9HAvjuQhSszsDDeSEufg6tzwjnYv+IFFtHEBYa8?=
 =?us-ascii?Q?1ZUlqHyi8zgPrrY0wLOYSZDgRmeBBpAmc8tcZwVR8og1fn/NZheHYb0ptKBn?=
 =?us-ascii?Q?fMteKweGSyOGaGpWtBw9rxMDHXTXvbhJ+6aI3VE0SqXg/2q4CDpxKNFh180/?=
 =?us-ascii?Q?Zfsfxe/pSXTXfnOjnZfOIIS8w1L4elLA4gqXdli5s6aIVq6OOMe4XDnxCOli?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cu0IgG0+NAv3pmkpEBEFeGQ8RqPXRfIP9BLN5pDDrLJXtf8VaZS+rpuOeMT3tRHBamiI7Joz9TzcsNLekxO24uUhja/x3rpJPBeDJ+burcOdcw2d7TaWrfDVQSnJdzu0Y7Xl1e01/HJDzzd2dkyURYtck5yhbM7kBO/1clpCKRy15l8R9ifCOYVH83N4QVXZRI86VPOJnWBTS3jrN/HYeb09f5HjsTDYgzCP+Q9OdcxbIcaNwGymNUnONb1cloXI4NmMY4gqUyoYsjsj0MGfDoxj0RBNv62chmefqGCY3c3mtkcPfEOi/On0q8uKNdEWQKAmXZZ/znKXa/7Zr/JxhC7L+s2dkhJXMNEFr2FtxFx7aRqraUQmKHbYAcpYfcGeDZm4sIOE8p35ARRx02LpKA0QnkbVDaM4sbYoikROl/RGppVMBlOeds3JDb4VofSUOZQReSl5bP/4UZ4mlTEcVbVqnY9AuOPpzrzf7iFIo44QyPUXigikpTG9/1rALCX28U50+4qb3T2+wk/2bfuaL9NE/MpCvg31+xxPkP6DdhuGP0oD5QS2zVx+tKWHescZJBB/I65DjfsPN69kLha63ASp8R2BiWeAT6jRoKgEej8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718965fe-2740-489b-3c09-08de12a231dc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:08:16.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdx4yZU59GDajjRdoetdWosTXT2qeSvbUIinfQH2sOisEDSfzTgEENXGaakNHEuzzyV42LW08ONsLwRyLvOO72CMG/q1kB8lFZS8T9nGOao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5169
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=667
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510240017
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX2ctnO0x0P7cm
 gHZqgHui4CzJOG4IvAQgGxuaBRDijolbTmR4r72aCW8kkMsQL8zQK32Rf/7UQ/1F+Nsc3spvDAV
 zg92F9mW/Hf9gG7f/xpaebmGr5Uq36veOuZrKiQx2Dewoj3CHV86aph6fUZoi6hlAwZQCCLjkV2
 4lhEzYElMzESxukYwgP2czGdBRVPJ64mOL6NB9P041JTT25vEGRjTgNEZ5wUqdXB6II/9eAw4Ks
 oL9QvUzZcqKo4rH9iUde/WwD1M994CN8Vqr09UFGrrbU7xNur7upNZCUwps5w1EmXlSt+l0zySr
 3x75lXvp74Oad7tKAhEFEgNhC4bjwh1GP2fbRbAPFyeIOAf2Dnvy/0xcQXOOdre4RXdJ3T2D1f9
 hch3BRkSAnQBLZ3wxELbtYL6XJDG/A==
X-Proofpoint-GUID: ZSshsvk2K-tTWaqVtPyn6W6LW9FAIHs3
X-Proofpoint-ORIG-GUID: ZSshsvk2K-tTWaqVtPyn6W6LW9FAIHs3
X-Authority-Analysis: v=2.4 cv=RfOdyltv c=1 sm=1 tr=0 ts=68fadfa6 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=hhuVJif7NkcJkI_OF7kA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22


Nitin,

> To prevent this, a 10ms delay is added after asserting HWRST. This
> allows the reset operation to complete while power rails remain active
> and in high-power mode.
>
> Currently there is no way for Host to query whether the reset is
> completed or not and hence this the delay is based on experiments
> with Qualcomm UFS controllers across multiple UFS vendors.

Applied to 6.18/scsi-fixes, thanks!

-- 
Martin K. Petersen

