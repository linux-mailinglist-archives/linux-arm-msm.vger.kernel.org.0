Return-Path: <linux-arm-msm+bounces-26935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C96D93AC1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 07:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F39282962
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 05:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB18322067;
	Wed, 24 Jul 2024 05:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l4Zfhmjv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E782572;
	Wed, 24 Jul 2024 05:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721797343; cv=none; b=D87WkD2OmSEEK5+/1Jl84P4SSQOWdLuQzl8+bGviNUM48hjhqTNcRxQ0R+nxglFWdqJ3yK4XwDxqfC0rpNQmtNcDbEi7ocPuvrUA6Y4DjVuxh0zEydTZOEpgCZZW2TJKcL1HtMSJO1Q+g05OGASa7JbHF4vNgBadQRb7FDdCHGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721797343; c=relaxed/simple;
	bh=XznGPAWH1LE+KdN7UzH3hCTk1TDPC7ZWm715rJxS5W0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVHHZUGtL4OIF5QnV4IfislY3w7gc+FcbI/HoK2scgXNCqFGN06gw2MjG8Nkl62WlbiK4I8u2Td1R2vTXoB3Kd/oarrCz5hSYAnryUu9vzeY8Z4PWM0wABudR5XtuG2dhlC3W7djwNIOvEmtqzeahX5fklsx+J7QXaMBGcbiQOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l4Zfhmjv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NKtgx7031494;
	Wed, 24 Jul 2024 05:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sSkacKMONTrzkrrMYc0qr0K3
	kPoP3yT+LTuiwdNb9wQ=; b=l4ZfhmjvvmNmDJcwh+zONHP+JFxBNECGyfqOlQln
	Z5mdPgpQ19xTjwu2sonjJxYWZ3KbbsXMVDhij4bLPIifbXNJwgzUsQjZ64sniQNk
	Wk4vpk+EyK2N9GI+9K9cq/ve5kNFaqPA373TdoXH56UtzGCinQ/y/9xKMJFF7ju9
	BQLG4xIWNhr0b5Xy1ubZc0dTLUzZKYwJx/CzfLeloPxmK5byuqnppCU389USoyvX
	V1SDteLmYsoZ5Fvn5jhvlRnpm4QtUEFAWBgtNao/u06ru3QcN0Xees60vBlZL41/
	85ZdpGXcXoc0nj1yGDE+oD/eIchNibyeB2nW0B1Z/tz4Gw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g46s9015-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 05:02:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46O51xdc013138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 05:01:59 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Jul 2024 22:01:54 -0700
Date: Wed, 24 Jul 2024 10:31:51 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, <stephan@gerhold.net>,
        <swboyd@chromium.org>, <dianders@chromium.org>, <robdclark@gmail.com>,
        <nikita@trvn.ru>, <quic_eberman@quicinc.com>,
        <quic_pkondeti@quicinc.com>, <quic_lsrao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH v2] soc: qcom: cmd-db: Map shared memory as WC, not WB
Message-ID: <93c41b18-2280-496b-8328-9f46a68a6220@quicinc.com>
References: <20240718-cmd_db_uncached-v2-1-f6cf53164c90@quicinc.com>
 <d17e7e6d-12dd-475d-80ae-fa48178d6cf2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d17e7e6d-12dd-475d-80ae-fa48178d6cf2@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SCHjLmbyun9BotGvVvxjTkQjNLrpgA2Y
X-Proofpoint-ORIG-GUID: SCHjLmbyun9BotGvVvxjTkQjNLrpgA2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_02,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=832 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407240035

Hi Bjorn,

On Thu, Jul 18, 2024 at 09:41:34AM +0200, Caleb Connolly wrote:
> 
> 
> On 18/07/2024 08:03, Maulik Shah wrote:
> > From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > 
> > Linux does not write into cmd-db region. This region of memory is write
> > protected by XPU. XPU may sometime falsely detect clean cache eviction
> > as "write" into the write protected region leading to secure interrupt
> > which causes an endless loop somewhere in Trust Zone.
> > 
> > The only reason it is working right now is because Qualcomm Hypervisor
> > maps the same region as Non-Cacheable memory in Stage 2 translation
> > tables. The issue manifests if we want to use another hypervisor (like
> > Xen or KVM), which does not know anything about those specific mappings.
> > 
> > Changing the mapping of cmd-db memory from MEMREMAP_WB to MEMREMAP_WT/WC
> > removes dependency on correct mappings in Stage 2 tables. This patch
> > fixes the issue by updating the mapping to MEMREMAP_WC.
> > 
> > I tested this on SA8155P with Xen.
> > 
> > Fixes: 312416d9171a ("drivers: qcom: add command DB driver")
> > Cc: stable@vger.kernel.org # 5.4+
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Tested-by: Nikita Travkin <nikita@trvn.ru> # sc7180 WoA in EL2
> > Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> 
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>

Is it possible to include it in v6.11-rc?

Thanks,
Pavan

