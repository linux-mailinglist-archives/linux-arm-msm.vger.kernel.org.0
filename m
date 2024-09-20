Return-Path: <linux-arm-msm+bounces-32123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A440997DA02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 22:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FCBA1F227BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 20:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF999185B4C;
	Fri, 20 Sep 2024 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WBT+/Wpj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999CC184543;
	Fri, 20 Sep 2024 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726863842; cv=none; b=iowoF9YPSe1dmlwFaw9r/O99d66ybCKjT7kGURFOaninJufTYRIbi8nyAzfQ5oQB37X0pa918jEUChk+Z/h0WRnb+jZUHVKQIZFLfvPAvmJvs6m42hX4sdPVyh8vFyqw926cE3gdNmuZ7PnVi/MrqaaFZrP5Mv3zQsQccSQ0tfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726863842; c=relaxed/simple;
	bh=Wh8sHbvfsTSmd1i/R8CqUvzdQepQ0QPuUtjoeELfLz0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OixCHCAiO34GkIcYpOTSJmN6P/LHZXQgLSA0rI0Nz6tsn6W3S9y4ap+DK73g820yrmuTPHmNHGVEK4EUBePOS42CT1GBkugxB6wAZTAE1MO4Tn+RhURCO9qBKTMhzi+2LDZw4r3Cv3i3DvVSL8SygWzKl0IyH53YBnb2wtpTtas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WBT+/Wpj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KJ0307003191;
	Fri, 20 Sep 2024 20:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FoIytXTUV75c+PlHCgmn4J50
	RSYWuyj5ws1/5bxnkNY=; b=WBT+/WpjUNAzTo2pSKwtOzwTff5IKLCq/KcJKnn+
	rTipNY3BKjVG5cOvc0NKijNIeAYu2j5u4xphE1jF+GEZJt0uWiBUwGmo9Jll6qfv
	DKCm0yR1urJqGReG6CiX0Rw2LG8s7n9PoAOv02zk2y02yn1WbD/aPgRgHbrsZbYX
	x4zVdPh9anUshy2aUjp2Uqv8y78DdQ4Q9cKN0Br/LsBffxuCj8DKc6yFCWe2EEDs
	u1N4YDt6vBNf2Wo9NPtmNCQlnQS/hC8w3TJSDlV0LodgahcqY2EFa2OoqrUcr5R3
	QgHCfaiiiBc8LcQ9rfG6o7CRfsZrNcQGMDraN+6n0DqK8w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfadc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 20:23:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KKNkbR009884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 20:23:46 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 13:23:46 -0700
Date: Fri, 20 Sep 2024 13:23:45 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Rudraksha Gupta <guptarud@gmail.com>,
        "Linux regression tracking (Thorsten
 Leemhuis)" <regressions@leemhuis.info>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] firmware: qcom: scm: Allow devicetree-less probe
Message-ID: <20240920132108019-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240920-scm-pdev-v1-1-b76d90e06af7@quicinc.com>
 <Zu3Q4dZLmMb3zAaq@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zu3Q4dZLmMb3zAaq@linaro.org>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qrZKiOERDT1IcP8gBmRywoY1c8JiiqkM
X-Proofpoint-GUID: qrZKiOERDT1IcP8gBmRywoY1c8JiiqkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 mlxlogscore=564 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200148

On Fri, Sep 20, 2024 at 09:45:37PM +0200, Stephan Gerhold wrote:
> On Fri, Sep 20, 2024 at 11:01:40AM -0700, Elliot Berman wrote:
> > Some devicetrees representing Qualcomm Technologies, Inc. SoCs are
> > missing the SCM node. Users of the SCM device assume the device is
> > present and the driver also assumes it has probed. This can lead to
> > unanticipated crashes when there isn't an SCM device. All Qualcomm
> > Technologies, Inc. SoCs use SCM to communicate with firmware, so create
> > the platform device if it's not present in the devicetree.
> > 
> > Tested that SCM node still probes on:
> >  - sm8650-qrd with the SCM DT node still present
> >  - sm845-mtp with the SCM DT node still present
> >  - sm845-mtp with the node removed
> > 
> > Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> > Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> > Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> > Link: https://lore.kernel.org/all/CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com/
> > Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> 
> Do we actually need this patch?
> 
> We have a simple patch already that fixes the reported regression [1].
> 
> And as I explained in my reply to that series [2], the root cause is not
> the lack of /scm node in the DT, but the time when the SCM call is made
> during the kernel boot process. qcom_scm_set_cold_boot_addr() is called
> in arch/arm/mach-qcom/platsmp.c before any drivers bind to devices in
> the DT. We would need an early_initcall() to run early enough before
> initializing SMP, but I haven't found any examples that the
> device/driver model is actually functional at that point.
> 
> I think applying the simple one line fix from Bartosz [1] should be
> sufficient to restore all functionality that worked before the SCM
> allocator changes.

Ah, I had missed seeing [2]! I am happy with Bartosz's existing patch. I
had thought the discussion in [3] was still relevant.

Thanks,
Elliot

> [1]: https://lore.kernel.org/linux-arm-msm/20240911-tzmem-null-ptr-v2-1-7c61b1a1b463@linaro.org/
> [2]: https://lore.kernel.org/linux-arm-msm/ZuhgV1vicIFzPGI-@linaro.org/

[3]: https://lore.kernel.org/all/CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com/

