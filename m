Return-Path: <linux-arm-msm+bounces-24845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7729091EA0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 23:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DE5E1F20EFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4B1171644;
	Mon,  1 Jul 2024 21:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hi4jHXOw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C57381C4;
	Mon,  1 Jul 2024 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719868479; cv=none; b=uz0+WiChZoj0HDlwPAY68oe5/hfojgLBnlHt8/l/xmUAwRrVnNobKxvxG1DYpQLyoNyFfCESyxm0mexrpdJpA4ghdIs8w92CgmQI1nx68zgbXecx2SMXor3V15a7gWtbeFGzQe9VnnXKJU98u3hSl7kiQhA3JipgrIVsYXCV4A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719868479; c=relaxed/simple;
	bh=chbv8/l8deuZjfbTqNU5LsaoUFIuySgwuLA2Lx5nG/A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8xX6l9vhzW6awPPw9n/Z7WZ50onY5ukUAcBg14IzPBm05wgOFOhN5Q7EgPFhR6bO5tfwAX/S2rSi51zj+vnZiedSiq3qjzWjgoVK4Ok2SUjvTDlyMmO2IjjOtlIICCcE3n48QMtat38LA/zhxUlgyhsPV7XV6r5rhd9/1+JUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hi4jHXOw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461KGaAt001231;
	Mon, 1 Jul 2024 21:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sqB+17OgnEoc/wuUUJlH4Hun
	ConDbmAwarAQyWJk1hc=; b=hi4jHXOwmQn10QED5TzuHsJgWXofRidWQUB0bKoL
	KDq0RQtmd+nzD/XLg3pHeqQO7tAB2WdcaQTYgkPvmZUejCEuuwRsDTXGpANByDiP
	D3eYWWcR/t8rLcqJ4+pmj2lz6j++dqVgucduoiFLQfOpTEZDIvF9GaCeHObMhZPY
	3ib41g0vuybgWn2n6NQPLcPAZdQDnR3G1T4ORFPfmNm32Rn3dBdmdVepqzW4s+fc
	oYRg8+/xymC+I47hkSCFMnPWvVDJBnKWk/VUE8H8htTNynu03J7Ybk3z0m2jATPa
	e7jj+1x51+YygLPJVx9gur08VMulzA0KJdJsjnlOaMA21g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402996ndx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 21:14:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 461LESAS003395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 21:14:28 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 1 Jul 2024 14:14:28 -0700
Date: Mon, 1 Jul 2024 14:14:27 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
Subject: Re: [PATCH v3] misc: fastrpc: Increase max user PD initmem size
Message-ID: <ZoMcM+F8r58tmE7g@hu-bjorande-lv.qualcomm.com>
References: <20240701115237.371020-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240701115237.371020-1-quic_ekangupt@quicinc.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HqkJdt__v4n6MqYmO8Okb7QNv-n4h4Uz
X-Proofpoint-ORIG-GUID: HqkJdt__v4n6MqYmO8Okb7QNv-n4h4Uz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_21,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407010157

On Mon, Jul 01, 2024 at 05:22:37PM +0530, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. This size is passed
> by user space and is checked against a max size.

Why does fastrpc_init_create_process() allocate 4x the passed value and
why is the value rounded up to INIT_FILELEN_MAX?

> For unsigned PD
> offloading requirement, more than 2MB size could be passed by user
> which would result in PD initialization failure. Increase the maximum
> size that can be passed py user for user PD initmem allocation.

Sounds good, but why not 2.1MB or a rounder arbitrary value of 8 or 16?

What is actually expected to fit in this initial memory? Is it the shell
that has grown beyond 2MB?

Also, s/py/by

> Any
> additional memory sent to DSP during PD init is used as the PD heap.
> 

Does this mean that the initmem is used for shell loading and initial
heap, and if more heap is needed after that the DSP can request more
memory? Related to the question in v2, how is this memory accounted for?

What would it mean that init.filefd != 0 in
fastrpc_init_create_process(), will that pre-allocated memory (which was
allocated without any size checks afaict) then be used for the same
purpose? Why is a buffer of 4x the size of initfd then also allocated
and mapped to the DSP?


Could you please send a patch adding some comments documenting these
things, the steps taken to create a new process, and what the 6
arguments built in fastrpc_init_create_process() actually means?


Perhaps I'm just failing to read the answers already in the
implementation, if so I'm sorry.

Regards,
Bjorn

> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> Changes in v3:
>   - Added bound check again with a higher max size definition.
>   - Modified commit text accordingly.
> 
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..11a230af0b10 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -38,7 +38,7 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
> -#define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define INIT_FILELEN_MAX (5 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> -- 
> 2.34.1
> 
> 
> 

