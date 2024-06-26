Return-Path: <linux-arm-msm+bounces-24186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D591758F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 03:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6E771F236F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 01:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD9AC142;
	Wed, 26 Jun 2024 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mawQ2szt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BBFC15B;
	Wed, 26 Jun 2024 01:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719365124; cv=none; b=uPMtBHpHvU8KxWlZbxsAQmSfYDuPjyovvhFsgb3dueUq/4gMkvO+e1NpIMo4MhQE3akwA5xC/scxzKvXVySFIzI1FZ5vgNaLtLZy/aeVi5JjWnMBXFOfCyE8/5lXZBHNnzJD7WMLEKaKUia5868pOARlojQfqqoeJH+283HfLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719365124; c=relaxed/simple;
	bh=Ndh4pksjNlQtMzYnaJHT5uZ3ndlkL7BpBPYDeEHRUnw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soUU/tdwIP95YUiA040JjYo0PjcLBVCKAiCtmNC+W8kQsiCNp1ILFANKoy1aXg0LfgZq2mxC9cQZoJQhgUie95q3kZa9vpHTfDyvnYMYFrNucaYQnyb4c/9Hpls4JAK2wo+WBB6R1fuDGmqHkLJ0seCTqvwsGF7Y4usADRWNwGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mawQ2szt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PHHwFO017133;
	Wed, 26 Jun 2024 01:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=feWcUDacOX0TL4eKrI4uOckm
	oA7/WGU54oNJ9MGsWhw=; b=mawQ2sztEp4mGfXVy2Tl7F5ZSAw/RsjaTNe9U5Hz
	WDXMQdvQKKrzv8vG62vH8ZTv1WFvWlHKlMQb1Sk6PjvElnks1zcfbOsgsWXiO0eo
	LhTussDCt0JM5O33DUM2e2opA99TU3D1lj65VRpRwQC5KwYzQGFLhH3BPg3AJjM3
	2ejyDWM7fGvBxRKWfB6l0bY5yPonzXn3n1GlO2rEYJl+HdhmhCCqr0y1gUapXZjJ
	jwYyklxZ3geGpi16TbUPxHTv9v85GJCB5MjMQu/kYauXKtv4pFQaz1jSegrT+wKp
	gnlWkmhZ7Ajxu4W4QiEZ3Cr+zxFOU4oe3KdqaJ1icx6yVQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9fq7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 01:24:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q1Os6a023762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 01:24:54 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 18:24:47 -0700
Date: Wed, 26 Jun 2024 09:24:43 +0800
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
Subject: Re: [PATCH] Coresight: Set correct cs_mode for TPDM to fix disable
 issue
Message-ID: <Zntt23e+YhHboh30@jiegan-gv.ap.qualcomm.com>
References: <20240625021212.1443304-1-quic_jiegan@quicinc.com>
 <2e78b732-aed7-4de5-b5ac-0da5b78af342@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2e78b732-aed7-4de5-b5ac-0da5b78af342@arm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kkoD60b3GGk3It8n4j0bU9_XMhF9TnGP
X-Proofpoint-GUID: kkoD60b3GGk3It8n4j0bU9_XMhF9TnGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_20,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=812 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260009

On Tue, Jun 25, 2024 at 01:24:11PM +0100, Suzuki K Poulose wrote:
> On 25/06/2024 03:12, Jie Gan wrote:
> > The coresight_disable_source_sysfs function should verify the
> > mode of the coresight device before disabling the source.
> > However, the mode for the TPDM device is always set to
> > CS_MODE_DISABLED, resulting in the check consistently failing.
> > As a result, TPDM cannot be properly disabled.
> > 
> > To fix the issue:
> > Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement of TPDM.
> > Configure CS_MODE_DISABLED during the disablement of TPDM.
> > 
> > Fixes: 1f5149c7751c("coresight: Move all sysfs code to sysfs file")
> 
> That looks like the wrong commit. This was a problem since the original
> TPDM driver. I would say :
> 
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
I will correct the Fixes tag and re-send the patch.

> 
> > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> 
> Otherwise, the patch looks good to me.
> 
> Please could you also fixup "dummy" source driver in a separate patch.
Sure.

> 
> Suzuki
> 

Thanks,
Jie

