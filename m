Return-Path: <linux-arm-msm+bounces-41385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A539EC102
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 01:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2BC7164C5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 00:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F001A2B2D7;
	Wed, 11 Dec 2024 00:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aaDwTFrd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5625F259C;
	Wed, 11 Dec 2024 00:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877628; cv=none; b=n0iCxxBmjUP46uXog0Vtgzr8OxGI0LfipSL6nIQxN0aWez3Wg/0IHAKnSqTt2YiwFv++dctgENztm8EvyZOXbBv7hQapX4698iaAa5cDJC2EO0e+zo8hTVHqzZK1pRdN7YrwydJbDqLcrODcZWHiGjE5gjueAblthBvkpSpXjsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877628; c=relaxed/simple;
	bh=z6fsivh48QeyXIXKQNdtVkKZ397M6BO8qzFetAZCx3o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAhw6sMqu8Fkgp0sjtcg8dXpUEYnkLzHFq8sBbxJnCw5v1fgj7e9Mrb5lGXW5IQ50dER3oQx5JGGkgZBkm6JpLjPhOI3LstgBmIE9rnWJ7hhy1QMYPT5WVsb6c3U4lZJ4tZaITTJxy27fOqhILRucRg3IBKXDuZY2muTwSZg8nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aaDwTFrd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAHWQVg003763;
	Wed, 11 Dec 2024 00:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWkVdOrrUJpu4291mJNo5ceP3fIrkV7JN6cPA3f5hZk=; b=aaDwTFrd0aa6WyIY
	dOMce8/P3NkjnGskCXtNVG7MoDqKsrhPYNfVlNu0RsGpcQo+E276AfMJd0rTUjAW
	3wVcOtSFcgSPyctKPEg6u5O9ODrp9gDAZxlkBpXgF7T+Y3KG+bmPtv2v6weqcrH8
	YwFLa8PQsztb3Z1mGFu2hu6rdfnEqiLJ+QsEApHStslvobtoMKEmIjNxZwLRR0QC
	7uuZ6LZNT/mquzMEN94sV+YMs352prkVinrbNY/zProXm1C7GHvH1S3sr+dq19hA
	TS+rIqCQ4HRMxdjAJFefCLK0TQRt1ZBwRhpjT+99109m7STO8QiasQ/De3+IIZ5e
	yYjl4g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgt861-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 00:40:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB0eE6E022702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 00:40:14 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 16:40:09 -0800
Date: Wed, 11 Dec 2024 06:10:06 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Connor Abbott <cwabbott0@gmail.com>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        "Pavan
 Kondeti" <quic_pkondeti@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <8fc505a0-91ad-4188-8627-fa28fc73a2ae@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CACu1E7H0-zzEPv8ytmx_9XRe1t-RCc7enshgwk2r9-0gWK44hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7H0-zzEPv8ytmx_9XRe1t-RCc7enshgwk2r9-0gWK44hw@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PvmUjKDOnqJZQma83MfyC6K3d2j27XMo
X-Proofpoint-ORIG-GUID: PvmUjKDOnqJZQma83MfyC6K3d2j27XMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=980 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110002

On Tue, Dec 10, 2024 at 05:52:27PM -0500, Connor Abbott wrote:
> On Mon, Dec 9, 2024 at 3:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > When kernel is booted in EL2, SECVID registers are accessible to the
> > KMD. So we can use that to switch GPU's secure mode to avoid dependency
> > on Zap firmware. Also, we can't load a secure firmware without a
> > hypervisor that supports it.
> >
> > Tested following configurations on sa8775p chipset (Adreno 663 gpu):
> >
> > 1. Gunyah (No KVM) - Loads zap shader based on DT
> > 2. KVM in VHE - Skips zap shader load and programs SECVID register
> > 3. KVM in nVHE - Loads zap shader based on DT
> > 4. Kernel in EL2 with CONFIG_KVM=n - Skips zap shader load and
> >         programs SECVID register
> >
> > For (1) and (3) configuration, this patch doesn't have any impact.
> > Driver loads secure firmware based on other existing hints.
> >
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> 
> For initializing CX_MISC_SW_FUSE_VALUE in a7xx_cx_mem_init(), we used
> !qcom_scm_is_available() to assume that the register is writable
> instead - can you just do that?
> 

qcom_scm_is_avaialble() returns true as most of the QC TZ firmware API
works w/ kernel running as bare metal i.e booted with EL2. Any services
that assume QC firmware @ EL2 (QHEE) is absent.

Thanks,
Pavan

