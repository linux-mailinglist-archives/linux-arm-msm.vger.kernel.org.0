Return-Path: <linux-arm-msm+bounces-26025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B149B92F8F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 12:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD9801C22B09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 10:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D6A167DBD;
	Fri, 12 Jul 2024 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jYU2kw9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D815F404;
	Fri, 12 Jul 2024 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720779821; cv=none; b=WeLPufpXtOZozMpIVE8U72r7bAu3xUQbsHclTcAoMZj4EmpTMdJwRl03RgxLJUpZRyV3wCbb8pajcze5Fok2yDFTX+IyYGd/37bPbIT0pCq6fD9ZzbIIYYZhIdbWrJKFk0EXI5GX/WNj37vO0/iLRytmGfumpneSEupBdXsmxUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720779821; c=relaxed/simple;
	bh=r9Nir9nHKFqMWTP64jknuRaUZbPA4clneH4hIAp26VI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyXkLbepvERZpg/x1/rg48gJlSoxa1PtWUZ6SRQgOeTslaF3g8qwNTeGATEp//3b2DMPDb+hp3zqB/UY7PEMjsUAn11GNZJ3wN0EKiNmkUbTXJ49V2WfV+UtuI32YT7M7g8ZrndTklWndqYglA835Y9rAzyTIWYsCbgUFpIyBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jYU2kw9Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C8DWnt000654;
	Fri, 12 Jul 2024 10:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+WSERfV4WDrYPUnpXBv0VWqk
	PgUULNV8YcS92iNukv0=; b=jYU2kw9Y+E8E8bv/y5kTB/xI8jretwl6z4gwmXHX
	QTC4VVa3BargNghTvnry7CdJbdWa+mNoWns0zI6TEj3sZatR+cLQTAnzPOXS+ejp
	mNgjO9/O5AY+It9z2VxzYJFaras964RUQ/8hKq6u2EUnvO+urF1Ozi25PVFkwhzb
	HfNJxgdZJ/wb8eb484nnSslVfxH2LNNDixnQ0hq3J8o7atQS82pgTZ9c32s0iv0j
	IqpB7dqo9kkVmeSWeZRWRqXTNgy3Bioxy5f1VuGi7b41ZtNahLjJZSSmNoNggLvm
	5WbznNNjAgU5Wr/Tb3Tab0ibDKxjiqU2LT/5YSCq6UYvGg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ac0gk3kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 10:23:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46CANX07008929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 10:23:33 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 12 Jul 2024 03:23:29 -0700
Date: Fri, 12 Jul 2024 15:53:27 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: "Maulik Shah (mkshah)" <quic_mkshah@quicinc.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Caleb Connolly
	<caleb.connolly@linaro.org>,
        "andersson@kernel.org >> Bjorn Andersson"
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: cmd-db: map shared memory as WT, not WB
Message-ID: <053b96d7-9af7-4afe-88c8-48a71b2d309f@quicinc.com>
References: <20240327200917.2576034-1-volodymyr_babchuk@epam.com>
 <19bb6ff0-04ff-4e88-8c8a-499c054bdea4@quicinc.com>
 <87sf0axanc.fsf@epam.com>
 <629a2983-8db4-4ae0-8f68-72750985d5b3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <629a2983-8db4-4ae0-8f68-72750985d5b3@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _NdS-g9M6RgbKZ1CIS8uEsn4hRcg-2w3
X-Proofpoint-GUID: _NdS-g9M6RgbKZ1CIS8uEsn4hRcg-2w3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_07,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxlogscore=714
 mlxscore=0 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120072

Hi Volodymyr/Maulik,

On Fri, Mar 29, 2024 at 10:22:47AM +0530, Maulik Shah (mkshah) wrote:
> 
> 
> On 3/29/2024 3:49 AM, Volodymyr Babchuk wrote:
> > 
> > Hi Maulik
> > 
> > "Maulik Shah (mkshah)" <quic_mkshah@quicinc.com> writes:
> > 
> > > On 3/28/2024 1:39 AM, Volodymyr Babchuk wrote:
> > > > It appears that hardware does not like cacheable accesses to this
> > > > region. Trying to access this shared memory region as Normal Memory
> > > > leads to secure interrupt which causes an endless loop somewhere in
> > > > Trust Zone.
> > > 
> > > Linux does not write into cmd-db region. This region is write
> > > protected by XPU. Making this region uncached magically solves the XPU
> > > write fault
> > > issue.
> > > 
> > > Can you please include above details?
> > 
> > Sure, I'll add this to the next version.
> > 
> 
> Thanks.
> 
> > > 
> > > In downstream, we have below which resolved similar issue on qcm6490.
> > > 
> > > cmd_db_header = memremap(rmem->base, rmem->size, MEMREMAP_WC);
> > > 
> > > Downstream SA8155P also have MEMREMAP_WC. Can you please give it a try
> > > on your device?
> > 
> > Yes, MEMREMAP_WC works as well. This opens the question: which type is
> > more correct? I have no deep understanding in QCOM internals so it is
> > hard to me to answer this question.
> > 
> 
> XPU may have falsely detected clean cache eviction as "write" into the write
> protected region so using uncached flag MEMREMAP_WC may be helping here and
> is more correct in my understanding.
> 

I have got the very same explanation from my other colleagues at Qualcomm. I could
reproduce the problem 100% of the time on QCS6490 RB3 board with Linux booting
in EL2. The problem goes away with non-cached mapping
(MEMREMAP_WC/MEMREMAP_WB).

Do you guys plan to send V2? Please CC me on the V2.

Thanks,
Pavan

