Return-Path: <linux-arm-msm+bounces-42626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE58A9F62C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92C32188B9B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0283519ADBF;
	Wed, 18 Dec 2024 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qp4A0dhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CC719ADB0;
	Wed, 18 Dec 2024 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517493; cv=none; b=F7aUXrdqYewyKowUn7DvAKnK4WlSOl7EYMbGhaKIgqVWX4T9gu9ZkJlWHQn1iIRrhHZncNsirNE5azs/daqP+7B/3eqVqAuR98rahxGbo+4bCNxRkNNE/XwP0qwvteMl4uzttDRvC1kPQD05tmeXsgWhZwFz5cuo2G0KYFUkvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517493; c=relaxed/simple;
	bh=dTDISrRVZPC4Z/+tsU6pkYnDMzSR+JiTVFBk3/KU9bo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RPzAhaytustwb4dyJasVYObns/3anbtJt/sIjv3E1FCOg6IFOdRTAXxcScTCMFwkTxI1fAST9ybYEIrK22H7+CkyCvdCloaOhJZIheZtegF+8slm3FJHyuUIB/UzotMxMhuQIzwSC92A68NNb5lbikNttBpu5uwksYYqzcNGsaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qp4A0dhX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI85hZw008924;
	Wed, 18 Dec 2024 10:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLMU0hzjBtlrQWcoLNJF4emCE3YoeJ028RsqrgKGqnU=; b=Qp4A0dhX9+c+L8HI
	s4/hFgpDyr6ueAB4T0mq7aXwLPZhy7SddEtq7JhkU3sj1tDV624Nfz8mQba+3ynL
	TlbvmrYAb8TOMdDWlWbhleMGZdFKdWJ9czDPIbYdnBTfZXUJufMM3+6vlMhrICbn
	33Ei9wp3QhDWO+AXaNSQqxYDLBf9Tyt4LcNX4pOM/P5XwT7ITmhRl0Ikih5L+MVG
	847BxJa2PUddzj5GJfl3AJyIcgFYmg9OM3IkTWL7B0eUBzSHQ82W4ow0YNnksHhA
	Wln0/PPeNaKayOU2UijUMG4FgS79K5jOKW1ug8T5STcaJZ7osHEOeUGTniJIM9sF
	1Dx5aA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ktk2gbvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:24:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIAOhSE007643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:24:43 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 02:24:40 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
Subject: [PATCH v1 1/2] misc: fastrpc: Fix registered buffer page address
Date: Wed, 18 Dec 2024 15:54:28 +0530
Message-ID: <20241218102429.2026460-2-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Nfe3XQ78B-P30a8VfkKiNLu3vUg9EptQ
X-Proofpoint-ORIG-GUID: Nfe3XQ78B-P30a8VfkKiNLu3vUg9EptQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180083

For registered  buffers, fastrpc driver sends the buffer information
to remote subsystem. There is a problem with current implementation
where the page address is being sent with an offset leading to
improper buffer address on DSP. This is leads to functional failures
as DSP expects base address in page information and extracts offset
information from remote arguments. Mask the offset and pass the base
page address to DSP.

Fixes: 80f3afd72bd4 ("misc: fastrpc: consider address offset before sending to DSP")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 48d08eeb2d20..cfa1546c9e3f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -992,7 +992,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			mmap_read_lock(current->mm);
 			vma = find_vma(current->mm, ctx->args[i].ptr);
 			if (vma)
-				pages[i].addr += ctx->args[i].ptr -
+				pages[i].addr += (ctx->args[i].ptr & PAGE_MASK) -
 						 vma->vm_start;
 			mmap_read_unlock(current->mm);
 
-- 
2.34.1


