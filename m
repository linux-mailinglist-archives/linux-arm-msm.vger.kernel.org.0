Return-Path: <linux-arm-msm+bounces-8535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD71783E77A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 00:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFD1C1C20E2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACB460EE8;
	Fri, 26 Jan 2024 23:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W9g8gxYm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA81460871;
	Fri, 26 Jan 2024 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706313365; cv=none; b=phTDzF4BuJ7iXJsyAqcCl1IIRzGD2B0J2s9RNERD6j38et12PLAXIrLMwahaAgjpq5QwIyR5YzcQfsqEZT7tuezs+cT+989HSQj1OgaBf231t7ytIVLtBMpqwnfi1KWTfKsBin7Ago1LaEgz8To9+a82P85rS23wP+T6nlFjkvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706313365; c=relaxed/simple;
	bh=Q2lvlvdCAKdHkBs5TNo2Bo66/5y6fheUCHhBLb/qygU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Asl9AsUsDsRdsJ7snLg4b6oIzNxszzDkLZDRDe9B6pX9iEaQVjOmOxb0xmKcTUhAqBA448b0hHaveb0+HXN39RWwFev9Haq+CaWGGx12LabEIbe+q7bAn6Wy5R6ZO2pjFk0BnT13e0nKi6gtFlKPta6eoPksK8jabF74SZ+hPRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W9g8gxYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QNtChX020800;
	Fri, 26 Jan 2024 23:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=JHAwrxllOSXe9Lncc3Bw
	hW25fiD1hVsmdl5djzDx1Po=; b=W9g8gxYmcUjfRRE6D7smqhpnYf1XFu9a0rab
	qj9zbi6u5RdwTgtP/KKz7oRqfVlHAI+pQ863D7LZqd9cHAZG03yWTMCUO6ZmATqG
	eXM9zgh4aGGKEoKNMGyQApsuRknC92CZKHMKlzJyBX+aLfqA3rvvkuPSM4z8OUEb
	/I7dzKX79V7LDlQhPTXHgj1LVFm3M5lpSZqn/uLlYcw7a4aqQxa/zp2Rz4119ns5
	Qhdtcs3OxNCREH4Km/oAjk0LcQ9RkdyK7HYUEAKC6dCqY3hI+6fb1WHfZallaD6Y
	ik0QO44xTaUP6ZAWabC1wA8sv/tobkT2d0qyH3ymYfy8F4fHxA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvgy8gq02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 23:55:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QNtUwh018645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 23:55:31 GMT
Received: from hu-obabatun-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 26 Jan 2024 15:55:15 -0800
From: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <robh+dt@kernel.org>,
        <frowand.list@gmail.com>, <vgupta@kernel.org>, <arnd@arndb.de>,
        <olof@lixom.net>, <soc@kernel.org>, <guoren@kernel.org>,
        <monstr@monstr.eu>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <dinguyen@kernel.org>, <chenhuacai@kernel.org>,
        <tsbogend@alpha.franken.de>, <jonas@southpole.se>,
        <stefan.kristiansson@saunalahti.fi>, <shorne@gmail.com>,
        <mpe@ellerman.id.au>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
        <glaubitz@physik.fu-berlin.de>, <richard@nod.at>,
        <anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
        <chris@zankel.net>, <jcmvbkbc@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <kernel@quicinc.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Subject: [PATCH 37/46] microblaze: reserved_mem: Switch fdt_init_reserved_mem to dt_init_reserved_mem
Date: Fri, 26 Jan 2024 15:54:16 -0800
Message-ID: <20240126235425.12233-38-quic_obabatun@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240126235425.12233-1-quic_obabatun@quicinc.com>
References: <20240126235425.12233-1-quic_obabatun@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WGiY7kIbvTjv0FKjDvTQTDg0e-SPCZFX
X-Proofpoint-ORIG-GUID: WGiY7kIbvTjv0FKjDvTQTDg0e-SPCZFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=543
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260176

Switch from using fdt_init_reserved_mem() to dt_init_reserved_mem() to
reflect the use of the unflatten devicetree APIs to process the
reserved memory regions.

Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
---
 arch/microblaze/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/kernel/setup.c b/arch/microblaze/kernel/setup.c
index d999ad774a44..112a05572d8c 100644
--- a/arch/microblaze/kernel/setup.c
+++ b/arch/microblaze/kernel/setup.c
@@ -59,7 +59,7 @@ void __init setup_arch(char **cmdline_p)
 
 	unflatten_device_tree();
 
-	fdt_init_reserved_mem();
+	dt_init_reserved_mem();
 
 	setup_cpuinfo();
 
-- 
2.17.1


