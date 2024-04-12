Return-Path: <linux-arm-msm+bounces-17351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF06D8A342B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 18:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71EBAB20F2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 16:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0081482EC;
	Fri, 12 Apr 2024 16:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PPA/FpYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7E8148313
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712940888; cv=fail; b=kdyxcazEmuwEzUVINd2KjHaXXwKxi9tixt8RajwFOCnt6sNmO0UO9tns5Z70FyPFpYXavzd0MQY1n8LLmWcBafq+u+XIMDzkpt5iFaFyk+YafmUUpWJJkxhodzdbeqqYeLhksbuAx7zbbONVrbOpGIZmDLQ+lplqbWqqHdZAn1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712940888; c=relaxed/simple;
	bh=fmqZEKSQsv2uTMMBjCQwJuJkFJ72Cex8ZXMY6DgBBX4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=twytwykSl03wYKsAT2VtHVXcmyNCoX6XLDtwNVYWgfgIF9DG6HXqbb4m3B5B8JYjMPCcmAlNdYwJ+VqD/chDLARdtEtuUhFI/G5m4r/SBUE7LNM/Zl7MA0qmKBwtrEqbwDZJWL0CK0DNdBtqwgKdA4wnSJEYGslArzGui6eQoNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PPA/FpYZ; arc=fail smtp.client-ip=40.107.102.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3JTHLlXkzpTEWzsR7I+nFf4Q0hlzCf6lc1Ji9YCo+VkexMRzksPynfjxjv1UDnnJ+wA4VEVAw8PDEy8yq91e6dSIGvdEE0KekKQ+R8KS7P3MunSYtPbTSwjQ+ng3oyHRWxleSkxvfPQyRqqQ6bWdSOUAlwJz7L/Vckbs+b4Znd9AVrzL0Pm1gYbHoBvtEjBOT9Q2ec4ddTrdr/CXNdpqUOkkZggVdPrbcy9TwXpkdEZKPdGcwhKYhi+m+e9/0lXW8gTm306Mh/vefi+MbzS6Mrzzkj85tF6sN2lZtYLIpLtAHp+c5RquhEyPUyqLUMN87ZSuFfKzHZ4MlXK8B+ONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwpGuO2w762kS7TG1PSgBJ5Vzl/NWWZSvwk62ZSyuOk=;
 b=M1mrTc7GigmhX2jfI9fVC1lgXP34MgX1wdPO2mJXw3BE6DoLzWQfoLSDeh2l8miwvCcBZTRZ3MGnr2kKTZFrpUHm3tpLz05nt8uc7F4SulKaaWTSm/93sRzXSPoikz58E5WTJTWDaXcxDP5VozIsZdest+pezIliufysL0gLaLRElo7+DPfwnGv62Xnv9MuSgNWKJJAJ47l6+C4H51uU1sbGFKtit/eNRUcXWCOvrmL6eXa1I942Af2gDLsyGJtF1n+lcjc5Px+f3vvmG6wW5TsyEzXQDHMBfseh6oNPPnrumd7+KNYB6CLufj31GZgbv8aUXC+L9I8o3cOQ0H2dqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwpGuO2w762kS7TG1PSgBJ5Vzl/NWWZSvwk62ZSyuOk=;
 b=PPA/FpYZGMnBBzc3y5hmipMHT38QrfznGT7s8TmrHdOTPxui1E0MKoxaAjZMLl7rFAfACx62s4EtThlAMwSi07z3E0vSkOVXyrQ61s35ql01BVx2Pp2/covEmMylKZMhyVR2ydJZVfb7VNTge6DT2IbECGdY/qN1QAKf9eUp9xj+qVh2s6MbFdiMamwCyPExL/60FH2sOp9guQQhhM3iSuvGUedy1goosM5hyS9XbYLkXnMjmkIAQoWtjmWyYa5cvqjQ1O8O6mPuAjy5ymqTTJR5kLItudEZzB+hAwWNTIIJKRbObzpZzcvaCd6yAoeowBtQBZFmuEHal2xCLZoK9A==
Received: from PH3PEPF000040AA.namprd05.prod.outlook.com (2603:10b6:518:1::4c)
 by PH7PR12MB7114.namprd12.prod.outlook.com (2603:10b6:510:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 16:54:41 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2a01:111:f403:f912::) by PH3PEPF000040AA.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.9 via Frontend
 Transport; Fri, 12 Apr 2024 16:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Fri, 12 Apr 2024 16:54:39 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 12 Apr
 2024 09:54:18 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 12 Apr
 2024 09:54:17 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 12 Apr 2024 09:54:16 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
	<quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<freedreno@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] drm/msm: Fix gen_header.py for older python3 versions
Date: Fri, 12 Apr 2024 17:54:07 +0100
Message-ID: <20240412165407.42163-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f14e99c-a2c0-487e-86e4-08dc5b113e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTXdt0C366YM6fgmJ4I3ZgiF5/cJllBIbbW6VsGPRMXelFiOv8PBxMH/nfpchHVLcgKqsMhBbLwH+heJLXlVZxFziXCTXsLy4BE4+NKBbaYYXJsHsZO7jGODj/4j47XidOGWrd6kXb7IF2vTpEFUcs3P3lRivTsOMmK141ZJ9y+Um/BQFh6AhSC9u8Llfp5Q02JK81Y0FJQRHh/cASntiJ5wWI4EdET4ENSLAvQtmMtnnM5e844t+JiFex9exqmBgYRHkzhVZXFgqr583oq9G0sGESVvEXxrYTrG78WvKBxIfC6oNVgSrmSM6fl+K10xu76J3/pzLpg5IsuG8YgUhca0i0Qm1iEDvcrfGOR4M65DJuaikHzjJGWNpHi8o6H7/7QAZGVgOwrhEbu8xepubmZ/u9azXbnkww4Go86KQaAbjFsY0XDo4JogZrM+R09uM1VoiALrvXshy/hCjt6sF5e2dK47Zl0624IomkNyH6xlUgYTgLsReQvqCSLde9uZd1ocgdXiCyiTSVnAQ1f0RnFdzVT5uAMpKHbyu5CBhesdAxG5I9DRetHSaEGxoQYNU3RN+svuKoMREOo0qqlHgPL0zBBIk+WP8xA/1WL8sKHVMjVZAvMXValGa1qkygE0k93xYGxqvgVlunQH0oJXZ1nNj/CfcpQaHTwlyPkhQOyFopnhFksFnz06DFyOIfOUweyHmiZgsiRS8aFvJQg9o9RwaknBtf6jja/5AFm9sW0FfK/Ez7Awevva5cnGweRZ
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 16:54:39.2748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f14e99c-a2c0-487e-86e4-08dc5b113e29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114

The gen_header.py script is failing for older versions of python3 such
as python 3.5. Two issues observed with python 3.5 are ...

 1. Python 3 versions prior to 3.6 do not support the f-string format.
 2. Early python 3 versions do not support the 'required' argument for
    the argparse add_subparsers().

Fix both of the above so that older versions of python 3 still work.

Fixes: 8f7abf0b86fe ("drm/msm: generate headers on the fly")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 9b2842d4a354..90d5c2991d05 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -323,7 +323,7 @@ class Array(object):
 			indices = []
 		if self.length != 1:
 			if self.fixed_offsets:
-				indices.append((self.index_ctype(), None, f"__offset_{self.local_name}"))
+				indices.append((self.index_ctype(), None, "__offset_%s" % self.local_name))
 			else:
 				indices.append((self.index_ctype(), self.stride, None))
 		return indices
@@ -942,7 +942,8 @@ def main():
 	parser.add_argument('--rnn', type=str, required=True)
 	parser.add_argument('--xml', type=str, required=True)
 
-	subparsers = parser.add_subparsers(required=True)
+	subparsers = parser.add_subparsers()
+	subparsers.required = True
 
 	parser_c_defines = subparsers.add_parser('c-defines')
 	parser_c_defines.set_defaults(func=dump_c_defines)
-- 
2.34.1


