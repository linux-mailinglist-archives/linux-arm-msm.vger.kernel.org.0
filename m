Return-Path: <linux-arm-msm+bounces-50421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A953FA50F05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 23:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12CED188F434
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 22:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CB62080E6;
	Wed,  5 Mar 2025 22:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KA0oWqSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D112661B8;
	Wed,  5 Mar 2025 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214816; cv=none; b=HFQf5kvDPYSfUVYuuGvb7O2sYhr6Fsvpn/lp3fSF3Z+lmG75r6x6jY3QxUUO0lDEEwE8CL4+003Q5R5oMSL57b0fXy9gdoyJHLbv8kY/XOYPkgnPALs6vME8fz+KyxXcbM4xFDPjOf3gkm62HwIM5LUHxVAN6KwCQTHfGHei87g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214816; c=relaxed/simple;
	bh=7GdLuUrEqprYyPJeRoPStcJGxziLiKXfPKeaWnjfaYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oCRE1zPinxbuixaU5fJKeskI24GY8DPD8gAlfXrRZRD7TIk7wqB6STxIzci6XNqRHPxLHp9loYMynyffuCHkgHapV9U2LWtmaO3QRKStyoRKkI2BBmtLtPo3uuYNlIXRHeWTSlhmmb4reBSw7JyAZzCcOwzUh8bbAC1ZchMaViA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KA0oWqSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525KXMH4002904;
	Wed, 5 Mar 2025 22:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5b/mbfS4FLGkP6tHyZCv30+vC8WsNVEt8DwJrZccF6I=; b=KA0oWqSqILIVPas+
	e7n1lXX2IYiGsajoMcXPryTfW8Cv4CDVI/Y5gQcpIt6wBRdowa4XHWpEsnWZay0U
	2IBKggEW1Rjf894e5efzx0S8xLDtCDbckJmi7fa6jEM0zotqqHmjESmoDYlTEBEp
	FXIMy1qtS8tud1HrvUgcuHYpjUj3XFwKSqH1xIOcgN8KB88zyQVHB1C1Q/QmJxGJ
	meYBRU1yWq0kH9qZK3y0YvgQXVh/9/ym15bCJ6uPufzTpZi2gOSpj4qnpLxjauJB
	dgbOSCvPcRs/eLM9Wev5+xnOhM9i0cVaJJu/UoCbQ++XUSafFvlxpWuXmSkcRpWL
	g3XG6Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456wrj8926-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 22:46:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525Mkeff019247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 22:46:40 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 14:46:40 -0800
Message-ID: <8c4ab5fb-3b98-410e-83d8-14fd8d70ef88@quicinc.com>
Date: Wed, 5 Mar 2025 14:46:39 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailmap: remap all addresses to kernel.org alias
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
 <20250306-update-email-v1-2-9a231571e905@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250306-update-email-v1-2-9a231571e905@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4kUdb0gXmh5MV-6d_ucLGgX8APaGk1aI
X-Authority-Analysis: v=2.4 cv=FYDNxI+6 c=1 sm=1 tr=0 ts=67c8d451 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=VwQbUJbxAAAA:8 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=FyogFE7hAAAA:8 a=r_1tXGB3AAAA:8
 a=gPJu0pBYAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=pGLkceISAAAA:8 a=9Wbp7B8dAAAA:8 a=KKAkSRfTAAAA:8 a=n2GhSfulAAAA:8 a=hD80L64hAAAA:8 a=TYBLyS7eAAAA:8 a=a_u5Ph9Ar4cNyewGBHgA:9 a=QEXdDO2ut3YA:10 a=p2WyBLmlf5vdw_nX_QRo:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=AlIIF0cMT2hfDT4axODj:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22 a=BESxJfN36ujmTJQqZ0Zq:22 a=cvBusfyB2V15izCimMoJ:22 a=9NqWk_7B-uqI6kdQTXIl:22 a=zvYvwCWiE4KgVXXeO06c:22
X-Proofpoint-ORIG-GUID: 4kUdb0gXmh5MV-6d_ucLGgX8APaGk1aI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_09,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxlogscore=952 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050175



On 3/5/2025 2:44 PM, Dmitry Baryshkov wrote:
> Remap all historical and non-historical entries to my kernel.org email.
> 
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
> ---
>   .mailmap | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 01145c078838bf9348e8d0e5e48b7b0954248dc5..a5c80ef0b7800519f3124e0d85294f34d6b275ca 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -198,10 +198,11 @@ Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@imgtec.com>
>   Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@mips.com>
>   <dev.kurt@vandijck-laurijssen.be> <kurt.van.dijck@eia.be>
>   Dikshita Agarwal <quic_dikshita@quicinc.com> <dikshita@codeaurora.org>
> -Dmitry Baryshkov <dbaryshkov@gmail.com>
> -Dmitry Baryshkov <dbaryshkov@gmail.com> <[dbaryshkov@gmail.com]>
> -Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_baryshkov@mentor.com>
> -Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_eremin@mentor.com>
> +Dmitry Baryshkov <lumag@kernel.org> <dbaryshkov@gmail.com>
> +Dmitry Baryshkov <lumag@kernel.org> <[dbaryshkov@gmail.com]>
> +Dmitry Baryshkov <lumag@kernel.org> <dmitry_baryshkov@mentor.com>
> +Dmitry Baryshkov <lumag@kernel.org> <dmitry_eremin@mentor.com>
> +Dmitry Baryshkov <lumag@kernel.org> <dmitry.baryshkov@linaro.org>
>   Dmitry Safonov <0x7f454c46@gmail.com> <dima@arista.com>
>   Dmitry Safonov <0x7f454c46@gmail.com> <d.safonov@partner.samsung.com>
>   Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
> 

Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


