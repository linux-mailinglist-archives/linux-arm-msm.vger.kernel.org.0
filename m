Return-Path: <linux-arm-msm+bounces-23173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24B90E305
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0339FB21CB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 06:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A4257CB0;
	Wed, 19 Jun 2024 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IvUpcN/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE474A1D;
	Wed, 19 Jun 2024 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718777163; cv=none; b=QcAS+R09Mzhsidu51ehGAMJTmK5BYpKIkZS4rLVeeXBfdePm+Jgyq4P/hq0KQ0GnVA/JjQzn4rWYwdamG7ueSnLoYU7adDeAv0eLx7Bh/otXRFKArL7PK0r/vBKxRixHS+5zucXaGqvWbQpLCW2/CzMAuCGh/wwWVfJ+JdLjp+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718777163; c=relaxed/simple;
	bh=wx7xtyB7FAUXpvRhthxxJoSPf9ueUEL4XwpNimXIZIY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udHzQj7lnXkKPXreTkyR4QKGN25/YBT8cWY6qJU9lovwj3NccSKOvJvHZ0du4b3B5YU9OG2WRtKaMT6btfkfXIf3IzvHuLSG3yZ+Kl3uKnj4obnLCIb0yWudM5HeOONIj/jw/p3A2u8nUC8NJrxO697Vv1YmhvKyg84SglEB2PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IvUpcN/v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45INhjX8019116;
	Wed, 19 Jun 2024 06:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qILRtgDW7J0s04rXK+0aV7kuYSjLX+QLnDs0IFEcpK4=; b=IvUpcN/vMktvlcKY
	I4iV6ZI3Qi8xc4Yzj3v2A1ySNMClPCLuDjgdkwBf2utSJ6w+FCDtuAd4Zqs/Z04P
	lh+twwKyCtzI8crA94tzouiU1+GAGDk+dazio02VaJ3Uv9JtT0nz4Faff9PH2MWn
	bvVcDgI3f49523opdMf1+q8ROaZkM1Lq8xDwxmkYU9vjp3hrbQcdpeyGR3cWONWb
	FvzgZc5StYtU/68V28d69muIrZ9r0Nl0cfWHndSiraGBwrb8P5686nj+BILTF4oT
	aPuyX8mdAACV10qW8kiYpECkER3QtnHWCN/WYQ9E/cdd3ChVEw4zJf8Lib6aYCBq
	JV4e0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja2gt28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:05:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J65jG9030591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:05:45 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 23:05:37 -0700
Date: Wed, 19 Jun 2024 14:05:33 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Song
 Chai" <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: Re: [PATCH v1 0/3] Add coresight slave register driver to support
 data filter function
Message-ID: <ZnJ1LVH2Bd0EfADH@jiegan-gv.ap.qualcomm.com>
References: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
 <243098a9-296b-4cbc-9f48-d37ab3b94153@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <243098a9-296b-4cbc-9f48-d37ab3b94153@arm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y6UgltJ5AQ4UnSA7J4iRYvPHXnIoIL-2
X-Proofpoint-ORIG-GUID: y6UgltJ5AQ4UnSA7J4iRYvPHXnIoIL-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190043

On Tue, Jun 18, 2024 at 10:47:31AM +0100, Suzuki K Poulose wrote:
> On 18/06/2024 08:27, Jie Gan wrote:
> > The Coresight Slave Register(CSR) device hosts miscellaneous configuration
> > registers to control various features related to TMC ETR device.
> > 

I would like to provide a full picture about the CSR device(to be renamed)
before get through below comments.

CSR includes some control and status registers. These registers control
several hardware block related to coresight. One example is byte counter 
function which is discussed in below mail thread. 
https://lore.kernel.org/lkml/CAJ9a7Vjj_pcr4bZsrdqTR1=u1RHDZ_t0wgtbdn62a5j64hYrdA@mail.gmail.com/
That hardware can generate interrupt once ETR receive enough data 
so OS has chance to save it in storage. CSR is introduced here as a helper
device here since it controls the trace ID filter in ETR. 

The use case is we have two ETRs in system. We can configure one ETR as sink
for high throughput trace data  like ETM and another ETR for low throughput
trace data like STM. In this case, STM data won’t be flushed out by ETM data quickly.


> > The CSR device works as a helper device physically connected to the TMC ETR device.
> > ---------------------------------------------------------
> >               |ETR0|             |ETR1|
> >                . \                 / .
> >                .  \               /  .
> >                .   \             /   .
> >                .    \           /    .
> > ---------------------------------------------------
> > ETR0ATID0-ETR0ATID3     CSR     ETR1ATID0-ETR1ATID3
> > ---------------------------------------------------
> > Each ETR has four ATID registers with 128 bits long in total.
> > e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> What is the maximum number of connections possible for CSR ? 2 ETRs ?
The maximum number of connections for existing device is 2. But it should support
more than 2 connections and it depends on the hardware design. One more ETR device
added, four related ATID registers need add to CSR device as well.

> 
> > 
> > Based on the trace id which is programed in CSR ATID register of
> > specific ETR, trace data with that trace id can get into ETR's buffer
> 
> How do you handle cases where there are multiple TraceIDs in a the stream ?
> e.g., perf tracing a multi-threaded app ? Each ETM will have
> a distinct traceid. Is there way to disable filtering by CSR ?
Here is an example when enable multiple traceIDs in a stream.
Suppose we will enable three source devices with trace id 1, 2, 3 and these source devices
will enable one by one. First, we enable the source device with trace id 1. It sets bit 1
in ATID register. Then, enable the source device with trace id 2, it sets bit 2 in ATID register.
Finally, the source device with trace id 3 is enabled with set bit 3 in ATID register concurrently.
After the enablement, we have a bitmap for ATID register below:
31          0  
-------------
0.......01110

There is no way to disable filtering by CSR in this version of patch.
I will add a way to disable filtering by simply enable all bits of the register.

> 
> Side note, with James's trace id allocation per sink series makes this
> easier for the ETR to know the trace ids allocated for the current
> session. Works only for perf though.
I just checked James's patch. I will try to re-design the function refer to James's solution.

> 
> 
> > while other trace data gets ignored. CSR may contain several ATID registers.
> > Each ATID register is associated with an ETR device.
> > 
> > To achieve this function, the trace id is obtained and stored in the related
> > ETR device's driver data just before enabling the CSR. Then, the CSR
> > device can easily obtain the trace ID from the ETR's driver data because the
> > ETR's driver data is passed to the CSR's enable/disable functions.
> > 
> > Ensure that every source device has already allocated a trace ID in its probe
> > session because the sink device should always be the first device to
> 
> How is that possible ? We are going backwards in the trace id allocation
> with your proposal. What is the purpose of this hardware when you could use
> a replicator with trace filtering based on masks ?
How to obtain the trace id of the source device and pass it to CSR device is a big issue
that we must deal with. As we know the source device always be the last device to enable.
If the allocation is happened when enabling the source device, we may need a callback function
that is inserted into the enable function of the source device to help active bit in CSR device.

All source devices except for etm are allocated its trace id in probe. So, I just add function
to ensure the ETM device allocates its trace id in probe. The purpose of the modification is
to decrease the impact for current framework.

I will reconsider the way to obtain trace ID. May add a callback function is a better solution or
refer to James's solution.

I don’t think our hardware have replicator trace filtering function.
Is there a new function supported by replicator?

> 
> > enable when operating coresight_enable_path function. As a helper device of the
> > ETR, the CSR device will program the ATID register of a specific ETR according to
> > the trace id to enable data filter function at a very early stage. Without the
> > correct trace ID, the enablement session will not work.
> > 
> > Each CSR's enable session will set one bit in the ATID register.
> 
> So is this a bitmap of "enable/disable" ATID ? I really don't see the
> usecase of the CSR "device" yet. Please could you share "usecase" ?
Please refer to previous explanation.

> 
> Suzuki
>
Thanks,
Jie
 
> 
> > Every CSR's disbale seesion will reset all bits of the ATID register.
> > 
> > This patch only supports sysfs mode. I will send the perf mode part patch
> > once it is ready.
> > 
> > Looking forward to receiving comments as this is a new driver.
> > 
> > Thanks!
> > 
> > Jie Gan (3):
> >    dt-bindings: arm: Add binding document for Coresight Slave Register
> >      device.
> >    coresight: Add coresight slave register driver to support data filter
> >      function in sysfs mode
> >    arm64: dts: qcom: Add CSR and ETR nodes for SA8775p
> > 
> >   .../bindings/arm/arm,coresight-tmc.yaml       |   8 +
> >   .../bindings/arm/qcom,coresight-csr.yaml      |  49 +++
> >   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 167 ++++++++++
> >   drivers/hwtracing/coresight/Kconfig           |   6 +
> >   drivers/hwtracing/coresight/Makefile          |   1 +
> >   drivers/hwtracing/coresight/coresight-core.c  |   6 +-
> >   drivers/hwtracing/coresight/coresight-csr.c   | 315 ++++++++++++++++++
> >   drivers/hwtracing/coresight/coresight-csr.h   |  24 ++
> >   .../coresight/coresight-etm4x-core.c          |   1 +
> >   drivers/hwtracing/coresight/coresight-stm.c   |  50 ---
> >   drivers/hwtracing/coresight/coresight-sysfs.c |  45 ++-
> >   .../hwtracing/coresight/coresight-tmc-core.c  |   1 +
> >   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
> >   include/linux/coresight-stm.h                 |  44 +++
> >   14 files changed, 665 insertions(+), 54 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
> >   create mode 100644 drivers/hwtracing/coresight/coresight-csr.c
> >   create mode 100644 drivers/hwtracing/coresight/coresight-csr.h
> > 
> 

