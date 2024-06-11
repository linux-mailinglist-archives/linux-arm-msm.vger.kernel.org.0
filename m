Return-Path: <linux-arm-msm+bounces-22309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3D903C86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 14:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 713B1284E81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC3617C224;
	Tue, 11 Jun 2024 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sing4V8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F53217C20E;
	Tue, 11 Jun 2024 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718110644; cv=none; b=cnpcmFPmYEApNKbDE/YtCgniNnKkY2U/NZtS7aLQglg9mKxBF/bYj49IcuzHMOVEtLwRQ5gBkqdzmCfx7clUyXURobeVoo0Hm5vmWlp5gHl2aGWbT26dK4c1c5CPqQTQi2uYQJEuq6Kw9Z9OPCSV6l2vRNjn7Jk+GJ4J7Ib2/3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718110644; c=relaxed/simple;
	bh=Fg4CW2jkBYTXO46zwqsEMmfeMiA7LCyd/nJn4NmShSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L/5Qd0Bsz/OfIl065XIq9L2bzkyAICHawEPZeueMXm4w2m/XJ7WosCJTH4YbOuP1n77E0LZ/hcSq/YInoVrO6BTEB/9Q5gCLkoPY2gGE0h7Js9GswMJXcP1+AHZHVALAyi3iWJd7ZZV+b2bqgq1OYIbny9dITRLgvADsGlEDYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sing4V8c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9cK87013691;
	Tue, 11 Jun 2024 12:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOLL2w/rzLwNxe2wZERfG6GzBq2EnQrBeXLoklpb1fI=; b=Sing4V8ckagCkoGr
	/GDe90rn+2JmAXqXBZI9l8m4Bs70RvR+dArM4XRYaMxlVGuFB0MdPJBSSMTm9/uW
	DrJSJERfkQRVNHfiYhlryETq6wjPiiz5jkxjy/3hllKBw7P1tal4yCf4S4/b+bWQ
	unH78TsiWxi/PL+kZHJJEhiToFVycT7pJFHRXJlC+ezcBQsAih69nUKvUSMcr5+F
	oWlvYhZjpkVTrQ+mVE6teYaGAYSpE4mKVZMOeV+F8qyKG10yM45fS5bLcv+kmdPf
	ta9oX8ya7JpJBdSfmPCbhOW7QCkG+TdEaWRvQMVWhsNzWbpp7Kl8sP66sMZx8P2D
	/dj1Iw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm458gbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:57:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BCv5QS025409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:57:05 GMT
Received: from [10.216.51.73] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 05:57:01 -0700
Message-ID: <d05230ee-caa0-4fb5-a076-f0b0fc448574@quicinc.com>
Date: Tue, 11 Jun 2024 18:27:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] misc: fastrpc: use coherent pool for untranslated
 Compute Banks
Content-Language: en-US
To: Dylan Van Assche <me@dylanvanassche.be>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Caleb Connolly <caleb.connolly@linaro.org>, <phone-devel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
References: <20240524161423.15392-1-me@dylanvanassche.be>
 <20240524161423.15392-3-me@dylanvanassche.be>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <20240524161423.15392-3-me@dylanvanassche.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fZD6-YCRhGrVW2m6aLT6ph-4u8lwh_sc
X-Proofpoint-ORIG-GUID: fZD6-YCRhGrVW2m6aLT6ph-4u8lwh_sc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110094



On 5/24/2024 9:44 PM, Dylan Van Assche wrote:
> Use fastrpc_remote_heap_alloc to allocate from the FastRPC device
> instead of the Compute Bank when the session ID is 0. This ensures
> that the allocation is inside the coherent DMA pool which is already
> accessible to the DSP. This is necessary to support FastRPC devices
> which do not have dedicated Compute Banks such as the SLPI on the SDM845.
> The latter uses an allocated CMA region instead of FastRPC Compute Banks.
>
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Reviewed-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>  drivers/misc/fastrpc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index c06667b29055..f53d20e2e07e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -953,7 +953,10 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  
>  	ctx->msg_sz = pkt_size;
>  
> -	err = fastrpc_buf_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
> +	if (ctx->fl->sctx->sid)
> +		err = fastrpc_buf_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
> +	else
> +		err = fastrpc_remote_heap_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
>  	if (err)
>  		return err;
>  


