Return-Path: <linux-arm-msm+bounces-74386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CBEB8F162
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5ABE17949A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 06:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA27D2475C7;
	Mon, 22 Sep 2025 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="q0HnzoCp";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="MuryYSWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5FEEACD;
	Mon, 22 Sep 2025 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758521776; cv=fail; b=PSK0Gk0yvpyrnUEG54QWzYNvBUpDz2QARcnu96c5cb8pE4G7BdE1IW+jmw+uOIugvB5eT6UR4JodQdesSw5JLyLt3aZn7oyYe0KON1pfECfs5NPxTueG8ZkP7txO2Nymcd/Lu+b1BH+DGdQfhmOjDWPT0jay/u6Eun1AIxEGjY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758521776; c=relaxed/simple;
	bh=jdkuU5vdCns2jU55Oj/9OfxbkEsaXWeXLRFZNN7J4aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G+WlzjPQblI9u5DSVhAxzz9NzPNCKU7/uIOziDuvAOEAWYjrdemnWnur9tEqy+T17MEC9Bk2G6mEcy8JdTv70c2urTwMMZQ1fbXWPMPRLjNdbmMwqAH/li19VClQSrSfqkFdtfmT+t7J9qF60QOcojYs6KxWqJARddTb3FXBJ1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=q0HnzoCp; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=MuryYSWq; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58M3f0Tc3855770;
	Mon, 22 Sep 2025 08:15:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	xUJcEPaf0uuZPx6Nl1Jt7EZSbLeRE+goCuIPyVY051Y=; b=q0HnzoCpioUcdiG1
	0iGxquW/fiEnJ+yEMDgzJyph4F2kcIqWa7zSLXp70BhJ/fa5d+/Wmqm0fmDjY0Gp
	OgrPV4vK6bN3MoPzg9nIgtRkVUoXW38M3Wwnt6xs/C+mo8qv+6Wy7SYM9gATWYPd
	L8O652q/wykP6fdvOyClW6QHU944akC23HtiE42UaYp2sfa0VLt35Hx8EVqhmoGh
	XMFOs770HYdqFDQSLooWvEoXPE7U4h5o8j9DtNZrcPQq+HPOt7TeXVP2EgGrD1kj
	OpNt7S3ohUr61dX5HiM3VRGhaxpAeNOKDi5QB5PvZAZZW525CmeSVHC7/CSzWOpL
	A/7cOQ==
Received: from eur03-vi1-obe.outbound.protection.outlook.com (mail-vi1eur03on2137.outbound.protection.outlook.com [40.107.103.137])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 499gm89t7t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 08:15:57 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srGHhVIYyDMcNjd9wJBIAvSJSOitKeQAO2HZAylwq6POx/TlP8DV8CdqpSy8fNScHark/2W8bgV0TpB2ms3kjsV/pJrZhw/QRdJl1Qx/jVTKfenFvkRs1NyyEG971RgycffnyPfFSsar/9kFmN5N3MGGQX3pMzQZy27V6O3SrmICIRGnDGOKLEMi+KPu7lyp4G0DT8qQHXTvL8KkPV+tvm3luXIU8D9DWmBVjJWKNzsjvmgIF1Bg1gGrYhlM1RlwdzfjAzFa8vj2H6/TJ1LneHtoFieN2ErCu9eopGLF/OrKZiKvMCnE0/K/WgrYo5L8DQDCJNE++JQ1ZFDN+CnRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUJcEPaf0uuZPx6Nl1Jt7EZSbLeRE+goCuIPyVY051Y=;
 b=WX++7ImyBkxZvZsaydUyiWp5Vl9WoGrVlc9i0y6jJKPlmi2db5V5JnchyXETaykBHqCTrQ1lJFwr40lkGRqhLfG3hUcZFC8MqbLN2Y5qdML4l4kXYSFXBvIHrEG5yi/kHIdf2CRk7StLkfq3m/2/PlzqRvlQ9a3QlVS0YukS3Ev4TzYFR3V7oP58bvv3ce4oG6CLvtdTMijw60V6h9zxzvlRb9ZEBCsm4EUQAEoPxd49lFh/mx4WdzluhK2mF/LPdHSgXvnXNyqo7hLI97s6QoSR2k0kxfV+bBE+bGES0sQPDDJpdAQjFkyeeTuoJtkeAxojLamg69riHBiiUun+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUJcEPaf0uuZPx6Nl1Jt7EZSbLeRE+goCuIPyVY051Y=;
 b=MuryYSWqXa8B+h8wpww4kkneNPPRmrWqCfOJH8PO62WiWRD+UeSvKiRtx72sXtrNzyMWAwEW3qk+zDQuf9JpP1CHZfNUxERIKq+cAuA051EjLIyYY48xpoJRqiSEVXjotmUFGNjamp3kJ1sqI/u+Io4HMwhkSC5xTfJDd00SS5k=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by DB9P192MB1827.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:39b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 06:15:55 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:15:55 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] soc: qcom: introduce new QMI encode/decode macros
Date: Mon, 22 Sep 2025 08:15:44 +0200
Message-ID: <20250922061549.11407-2-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922061549.11407-1-alexander.wilhelm@westermo.com>
References: <20250922061549.11407-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0902CA0040.eurprd09.prod.outlook.com
 (2603:10a6:7:15::29) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|DB9P192MB1827:EE_
X-MS-Office365-Filtering-Correlation-Id: 00452248-4c30-41d0-0930-08ddf99f7d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6WLca3W9ULantvTFYXKWJy2aoICluVLAi3zZFhW/OFFPNcEwrCn4+2xTSN7R?=
 =?us-ascii?Q?LL/B3UYkHKmolQzhNOmfl2OOR8RF7pqH0KHT6C6bMeIE3DEDhVtQWLHkLR8Z?=
 =?us-ascii?Q?/Wweb76pQPkC0fZucWCLmY29WQS3ZKtvdMEuuKDmyMRTG75NxkZTdSSHKFj2?=
 =?us-ascii?Q?gbXJ65WvLtXqtsvBEiDnD5nCGcYqnLXgNthGibp2YyRg/NggUFL+YRdjP4Gl?=
 =?us-ascii?Q?9MvFnfhjmsn+v2DmNrRbgqiIK5LTWTBxBNh0mEaTQIdroOb8Bq1mWb/uz/KB?=
 =?us-ascii?Q?ms8qqEsb6TrS5eAcv6a3KrBLK6yTtQXuPMubdbK6MRl5Sa4oqu8dptYMXPEA?=
 =?us-ascii?Q?cwBfZ/Nus97vEn4oS+6Ecf2JeJ/yu1DTstVZWRUNiuqIVVdrp9pES+0xA7rq?=
 =?us-ascii?Q?XUFi53sbS7XSumVNvR4xD2GNcQK2+U2wberRWu3/YcKX5tNswMUue7/ePizB?=
 =?us-ascii?Q?RpFwr2cQhuHnjGadFqW9tvsZkOk5Zc9LZzJHGXfXBY/7t6G2dVrMDriy7HRs?=
 =?us-ascii?Q?wWeMeIl7+ySIH6uHgG0HvVlfisjudS5F63QehjOpiIBNwfkPMuma0RsJXcGn?=
 =?us-ascii?Q?obCuzgUuyDzEHGLQs65GiQDDch+LOu9fMeZ/xqgmi8+3Ar5RWJ+dbPQepQf3?=
 =?us-ascii?Q?rXIVxjgVLAOWE4adOiTFCIQdp5dpZukEcYaPganXd7Ht1BUk3w3LieZ7+6FQ?=
 =?us-ascii?Q?zzDBMNYT1obwovCUX8XGVNBoMXEOAP62uBjPS9FpdYZTYW871N2C8n2S7z0L?=
 =?us-ascii?Q?Bdk5aZpEwemvlx1B1o95hLQd4ozBRsSBrychKozpaWi5ePofWZIvHlEYlfgl?=
 =?us-ascii?Q?lVMTZXwCkNoHattRV/bXGL2tfN/Pc+zh5Ca8ZBjyohJcjMG/nYhc+QZLyRrC?=
 =?us-ascii?Q?1zb8SJJAkNr71gbjzRUVIbOCTmzTIlSAck+ZPnUsiibhgNGyl1i1bfs9s+0S?=
 =?us-ascii?Q?enlBgxtzXWETylG1N/QEuQg3uvGKF+shKuLF815NiAQYVU0AJmaQI1oem+ki?=
 =?us-ascii?Q?e62mX/wCwPnV0gXMifvpVhmdkSjCZh5T7gv3cHorXuOt5nZt8FONn9Pgg5cv?=
 =?us-ascii?Q?m0AM3XF0z7Ejqu0g6gtv09e3uIeKWJtCedcc/UcQ5hXcrj8deH0CX8laemuJ?=
 =?us-ascii?Q?sWVXUlhdi2ZpYU2K2Fil/0XOrOM6EfTtMW0JJrTqeKXkjA+bTI9soVV+04fE?=
 =?us-ascii?Q?fmqfPsqxTIzEIPBWzV9sKfUBxSVayxxVy4Djs4cDpnPMKjLh1q1APW8E2hkW?=
 =?us-ascii?Q?w010766VSnZjvTSB8dRkd92ZG3W5IzjM2Bz0o2ep3TtZSjV0HdU6pgBK3HoF?=
 =?us-ascii?Q?kpWOTz4RYI0tZ2lhQoHIm3ereMZ3I1OM5X4VZOKMTcJMIcM91E864sUn0obe?=
 =?us-ascii?Q?KPbZzz48+n2oQxr2KgzEQJC2XcP6Y4A72zVdtITddDauJKtb8/Hg5YZ5lC0C?=
 =?us-ascii?Q?noIfQk0u/wQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?icCn3y111alw8MzhYS5TDOesp2lSTV71pOnttUuPtcnPAVDNfp02aK7EZlZv?=
 =?us-ascii?Q?+EhiuiBLUf7kwKr+ikaMlzjobKvPu6ASScYD8ApLv5cPzqtvImkD0FO9EX+j?=
 =?us-ascii?Q?iTvazEUPL3FKp0n5YMfxAwrkRFm01H4LtYH5fcViYSjDodLN+BkQ7zYxAoc0?=
 =?us-ascii?Q?UypUZLT/UyXjtaPBy9+o1/YN8hbGiJ9pjTf+XzbSw6IIEUImcjOtTWgyZ/CA?=
 =?us-ascii?Q?eWDwOv8BJJKmcgVLJXAVxl0k7FYtYfsj0T1mStBHJtcvXyMRo6q9+cU0XYNI?=
 =?us-ascii?Q?IHQ/IXqqGrgfz+k5xiQinV1bm5KXQAdPgzm+4rhDunPo1wUqvuRjvUslkGZ0?=
 =?us-ascii?Q?XV9LCTuIrFrUaZzXmZuo07D/+vqaGpLkaNlcIO51orDhIul7vVA/lQbefgLs?=
 =?us-ascii?Q?iDbSPjuSU9F1QgpHBzXLjMwyP2sVFnnxU/bN1FWei/NA3SKOop/U3wUyY6DF?=
 =?us-ascii?Q?57fNgtKo/ggBlynm7wmcWew5KmSAsr1dbgCiQ1yPflRCo1ODbTbrfkhtVxeE?=
 =?us-ascii?Q?3o/9YqXaFxe7RiLKWQSawcNkMj0xwqteR7iN9hfWIuSbGlIdXqW3e7qkm8L4?=
 =?us-ascii?Q?GU+f9n9bZm+9izb6RCr3pqKf4nGHwKi58ROQpIugFR5XF9jWEbCzf5/f3vpv?=
 =?us-ascii?Q?aMQDaXOsIWOhrlINwLpqwQNha5+GJzN7/Qh7JQ/5vksDXStT0YNbPxrp+rjY?=
 =?us-ascii?Q?hxwQXByOI6Wv9FAEwrwPd/G9WRrSgr4Rjf6Ee0F9s8WRW+XN2SCRX+A6DkyR?=
 =?us-ascii?Q?0G+j0FWC7dnPq89JxO95R7M75YQ0ZwkgfdEW49BwrTNRKcz8XOcINiaqNR/8?=
 =?us-ascii?Q?PSbpK/MwbjBLU2kUTt8DLKuFqFgw2/zov/zqcsrxJMILLYPMyJX06KrpC7tm?=
 =?us-ascii?Q?CajrLyLge2qMe39fNpCHIooWO0DLbPfvLih9Bz+0RbdEMUePO9eNBGEMgKf/?=
 =?us-ascii?Q?J9Ih7zkEstr7LS++pDAiXXrpKb9FksQXBP6B0CYwyE4bMPHY90fBU+v54Siz?=
 =?us-ascii?Q?5KwjoTo5XpzLto80Wk7/h1zhmw7BiuPdrMEstgNXvA8hB24BIkOQBMJM5eiP?=
 =?us-ascii?Q?Uv6EEff4EVa9NkKiWRKbO6W2cNNKaxkdDzC8g5en13iT5JQzUeT7YQ99F+aQ?=
 =?us-ascii?Q?nXoLb8BxL7q5wKBbD0LTOpMyrXkn9WbrYr2xow2k/jjQexwLYhg07cdncKVJ?=
 =?us-ascii?Q?rsgyqd2wY9WRkO+F0P0LvpzrhsAkAtMLlt9v/l0Q8uCkYLyN+vs9k9edX4V+?=
 =?us-ascii?Q?MfCIRH36SKSMtcpFGzYUOPE6s42ervdXRK2iT0tsbE1QslhW6rVGvzIrX9ks?=
 =?us-ascii?Q?bnh4IsgkrvU50yi92tJ9tbFVtXNzKngCI9X5jIxjVIJpI+x6tPPrO4TCmVQ7?=
 =?us-ascii?Q?3MMLEMtnC7f9ghnuIlXLWmDLfMNm8w8wQCiO9gzXz1ZUTvh6AIrlQZz7eXZd?=
 =?us-ascii?Q?wvgrksKw4mW1ScDFCmuC0ppqUU2SncJo1wo23c4m05uXy69Aw0dAgYM+nJXg?=
 =?us-ascii?Q?OiBO7xSaL9py/AJJuo9W/Ou0yIDI2KzaTbAsKToQR1n5A6liEzlTv+bi3HPX?=
 =?us-ascii?Q?I0XJiyYGrJ1rYx8srcYmSoyc+ZVbpw9Q8xJG/XS1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d3J1GbMvDs1a4kZubJ9BQZP7FAZNs+pi974HJeb5B5EL4PH1JneZggYodeBIKiWmc5729I25xX/qgLpZB33nSI2uJ35PVZn2N7DX93IJW/YW9ug6CMxNd0g+bQ/eai9XGE/chA6aoQOi4QHybr33BjTiJWQZ09RuO4FinKRZTFReonzdJiec7l0DMgx/PXr6oYhowhTn7nYde2F4NlXzFr9mqKB05uZUWzngKH/XvFfW+FkR6NJMrgGD/CI7ANHdzK/XacH29eYrRIYEd93In2OIBfuDlp3K6TneupXnDLHEllPLufJANYpYdz5Jwjt178PUDoYy9rpjN9vfdGAwHkphf1jaUH2JYjajiL5tcSOTIdgrDSdCrn2XC5UCue2wmZYllZ2rOKuLiYNpTr99u7j6fdmCOGSVdE+CAnJgfCv3tNY2l8Ea2GWj7i2jAw7+ahGnbN+3T+eAfBsZcqTXq3fTwIvoIwE4h4FJWUV2cws9WyPUO/KxY1OJFIeY6sgdXkIH3WmcomYkYiIkRbGD8TQRf6qjA4XLeB6w+MKa9/lICqFs8awv+D4fvA8OEQxTfrBNGva/o1D2rxIxPwTCTuVFWcgtmYK+NbikvsByUD0sbszslu7ys8RlQiupQdqW
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00452248-4c30-41d0-0930-08ddf99f7d8e
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:15:55.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCOOqIDP8mlsXuKGTRGX36qHlfI3D+wHJM6xJZ2PksFrSpgCZcJEDXPRxT7h4YXll7XO6eH97tzDxOYAjSWODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1827
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
X-OrganizationHeadersPreserved: DB9P192MB1827.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: _UBM7tcG-rWW1w18fp1kfHKZCaFdySOh
X-Proofpoint-ORIG-GUID: _UBM7tcG-rWW1w18fp1kfHKZCaFdySOh
X-Authority-Analysis: v=2.4 cv=B/W50PtM c=1 sm=1 tr=0 ts=68d0e99d cx=c_pps
 a=ZezZmQwwHCH+qc1lZy/WGA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8
 a=T0L45qBzl8X6T0AR6ckA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA1OCBTYWx0ZWRfX/3cUIGrIItYC
 pddvOjRypUXJXWtj9qQRnq30DtZNGQVuTZN8AW0MNTE0N+qGs0TjdlezXwH6OiKOFOF6c1iRIuh
 Kf7w9LBsJkZCX3KdOKfmYeiAaf4ZMqxWlSVW3S+Ofg4Gk/M5DlDfuxMNBX5m8WpI/6qWhxZ+OGS
 41GbXRJa4EVbbNmMmjK/Kup2NdWcItsXZLf0rw3PQPC+yQq7Ld35kOfP4oSPbTHuAw4oYjHX+Ss
 EKyZ4iSKWrFlHouBYDpw/mJ+Gxt81JSKaqSa2vAsIV1Sgy2/8xJyP38dP7u339Hl5TbmAOY2gs1
 LqH9C3fZUmHkvrQxotP14VTAfivXPzHH+ncXz1u5trcHlFq5Lj7O/R4gYFkRf8=

Introduce new QMI encode/decode macros for each basic element type. It
allows us to further distribute and handle endianness conversion of basic
element types of different size.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 7660a960fb45..1f9091458d72 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -30,6 +30,34 @@ do { \
 	p_src = (u8 *)p_src + size; \
 } while (0)
 
+#define QMI_ENCDEC_ENCODE_U8(p_dst, p_src) \
+do { \
+	memcpy(p_dst, p_src, sizeof(u8)); \
+	p_dst = (u8 *)p_dst + sizeof(u8); \
+	p_src = (u8 *)p_src + sizeof(u8); \
+} while (0)
+
+#define QMI_ENCDEC_ENCODE_U16(p_dst, p_src) \
+do { \
+	*(__le16 *)p_dst = __cpu_to_le16(*(u16 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u16); \
+	p_src = (u8 *)p_src + sizeof(u16); \
+} while (0)
+
+#define QMI_ENCDEC_ENCODE_U32(p_dst, p_src) \
+do { \
+	*(__le32 *)p_dst = __cpu_to_le32(*(u32 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u32); \
+	p_src = (u8 *)p_src + sizeof(u32); \
+} while (0)
+
+#define QMI_ENCDEC_ENCODE_U64(p_dst, p_src) \
+do { \
+	*(__le64 *)p_dst = __cpu_to_le64(*(u64 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u64); \
+	p_src = (u8 *)p_src + sizeof(u64); \
+} while (0)
+
 #define QMI_ENCDEC_DECODE_N_BYTES(p_dst, p_src, size) \
 do { \
 	memcpy(p_dst, p_src, size); \
@@ -37,6 +65,34 @@ do { \
 	p_src = (u8 *)p_src + size; \
 } while (0)
 
+#define QMI_ENCDEC_DECODE_U8(p_dst, p_src) \
+do { \
+	memcpy(p_dst, p_src, sizeof(u8)); \
+	p_dst = (u8 *)p_dst + sizeof(u8); \
+	p_src = (u8 *)p_src + sizeof(u8); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U16(p_dst, p_src) \
+do { \
+	*(u16 *)p_dst = __le16_to_cpu(*(__le16 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u16); \
+	p_src = (u8 *)p_src + sizeof(u16); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U32(p_dst, p_src) \
+do { \
+	*(u32 *)p_dst = __le32_to_cpu(*(__le32 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u32); \
+	p_src = (u8 *)p_src + sizeof(u32); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U64(p_dst, p_src) \
+do { \
+	*(u64 *)p_dst = __le64_to_cpu(*(__le64 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u64); \
+	p_src = (u8 *)p_src + sizeof(u64); \
+} while (0)
+
 #define UPDATE_ENCODE_VARIABLES(temp_si, buf_dst, \
 				encoded_bytes, tlv_len, encode_tlv, rc) \
 do { \
-- 
2.43.0


