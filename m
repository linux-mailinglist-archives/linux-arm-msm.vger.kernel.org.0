Return-Path: <linux-arm-msm+bounces-66983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DCB14C5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D77D57A67D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCE8217707;
	Tue, 29 Jul 2025 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRWU3Ptb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCEB19F135
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785510; cv=none; b=e+Du8ral6l9DE5L9CEzgQn7erECUsi+jvI05TaPGoSGmcQP0YTKfhdWgQ/ITsxZfcW1HUDyc/FF+lE+yUYlXVHtyVOne0weWatwhEEVKXUcbRKscMdWeByOZAW2UcHChMsTz+BbtTj7L43yu2EyOoGP17BzafbbjjyL69EcyYwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785510; c=relaxed/simple;
	bh=nkIhTMT+UrC9eByz+KmOqpV7xTJv94wB9jjPbu62Xzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2ucBdSj5cLe+YUGKVpWo3KefuMTwi81xzqLICsF6XGseby5KTIHtuXpfc2HyTzPcpxACbnd6WPhw1auYC6BA3hfw1AYde3DC/il5Cuo3fq+wnNx9/0qXCgsGEuY8cwx1xZEwJyDNfN6QEvsUtc54xIb1C0C55+eaQNKOs96Lag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRWU3Ptb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T7vaDg001435
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtmyegjcI8dNEuRPjZ2a9kIvcQS2RvGr8n3kcK3eumk=; b=VRWU3PtbcxQuC9gu
	MaJEkZEnEJV3RAq8PBBAtjcoO6HeguUWKconsvL/wuR7hT3lk0YwjBJhpMGnBSlV
	vNGaE/C0E34GMYvLWBh1tKsll9L4U/b6z25SYPbFGgbAI+fwPGRGa6kl9HiP0ITc
	ApBJKykGr+nu2stifb4v5vxqLtdS1tLyMl73qfXw6pPPXk1uKFGEzx8UuVcJ7M5n
	jWY2Twl17s7KhaJRWR+/Tzqy13wUVjLwhUrCxVswcvxAzdJxzgVIAI2A/JZKbKfI
	MSldc266q1FzdLaeUh+dVvuwkYM1KvPXXah0dUOfgXla11gcBl0iFqLOmvsqZTIv
	O9w32A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2fpvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:38:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2369dd58602so57702815ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785507; x=1754390307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtmyegjcI8dNEuRPjZ2a9kIvcQS2RvGr8n3kcK3eumk=;
        b=Rv75iPwPZY85EyLP2RhzAoP410RQAEWJ/NypDV/KUkouhgN4CVwKlgWtnaiRZdlSxS
         gPZDN3r3703VD/ES8YXBwdjVdZ5SKLHoI4dfr1Seyji5KKqr71ba8RF8ScjzZtUvij9a
         6PUjEGpYucMeCaO3UCsW9rFIH3glzHBjFx7CVVi1hHI11HdQc45aWfBPtTkSFD+5/QVS
         ftdJANlKBI/MQHa3agnOe6Go84iUxvUx16x/89ViZDWV2TWmOFOqfOo1YE8LKnB/8mZM
         s/fd5MoKd/D68Zh1iTsqi546QHG6U349p9gDdKdvvpmJIf7e2FrJjFTHt9IlbnzCd50G
         J7/A==
X-Gm-Message-State: AOJu0YyxOCzP6htoruikIShrdUh4bntuyCEair3FIJbv5+vshL3YR9Mf
	GU0cF3/X7F9WwRXN5rWvmAo3ckReFK7uUpDSvb0qSvcqq2x6r01giMkC9NYZYotho9+GOVvdAeo
	FP7LT+s3oA5gztSrRk3AHOG0qFeyS4xYz585qZv0lFdC+ZNRlq406EHqZR1DmQBuTq/WUh7GmVk
	mQ
X-Gm-Gg: ASbGncsqhow2b14rrVygM63/UGyJfOaJ8YwzntTjrRu1cnrW3nC7erpkpcOzGVoBz0k
	1xSKlq01vWTYGYoZb44WPPmWXYOz6bRfuswpIpaiIn1iANTr8Ig5r2vAygonCGcDIKuHBmIHn30
	hPZ4vvrIdi82k/yuRaLbxk/7F9E9VTfeflIBeUSyFIBRl/nWnXblgBF5NHbnWylolgXdtCMKFP/
	XStRPxlnwHhTdAkLLDMcYGNTDjPUAFZDsyUCNc4TyLUhj9Q8O3R1F+XiCpvT8+Zu5WzBD9OT7Nm
	MtwfB4jvnkfwA0feky9PAqOHkteGSw4ma3YCYCN9YKqMK5afVf6kzveniGE+b/r3eqA=
X-Received: by 2002:a17:902:e94c:b0:240:3913:7c84 with SMTP id d9443c01a7336-24039137fc2mr90885145ad.4.1753785506685;
        Tue, 29 Jul 2025 03:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKmIZt9Z2VjUyNjAm78HIoNSL4gDkCwJzYsVcvwijgXYhzs2L+GPUc8Ve0bspPFS+fb7csuQ==
X-Received: by 2002:a17:902:e94c:b0:240:3913:7c84 with SMTP id d9443c01a7336-24039137fc2mr90884905ad.4.1753785506263;
        Tue, 29 Jul 2025 03:38:26 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24009b8661fsm51264915ad.126.2025.07.29.03.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 03:38:26 -0700 (PDT)
Message-ID: <81a1bd2c-ad4b-4042-9116-c1604e4f0d98@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 16:08:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix gcc_sdcc2_apps_clk_src
To: Richa Bharti <Richa.Bharti@siemens.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, srikanth.krishnakar@siemens.com,
        cedric.hombourger@siemens.com
References: <20250729094943.863392-1-Richa.Bharti@siemens.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250729094943.863392-1-Richa.Bharti@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v5meC6phwvdQ7w2NBOzA1b1p8HQ5R8sl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4MiBTYWx0ZWRfXw+pfaVdykfBT
 vyceGa3UBdjmtD8CUnFxHFDDqgWcJxfrfQfQTR1ATd6Pru49izb8yXZq4frX0waXJB4E+MrVWHn
 jG9ZWePhOC/57RdC2gXlJEaXpopun/92tNR4DBk85LOOqJmLEJyFAbLY378c1Js+tQkqT4sRYxu
 NErtY4bCdpykhxsVUy8+PcclCwbyd8V66fr0pMhBYpWkyvUtgCrKdTD833JbcFXPSRS9nN/vmCq
 0lKB+l5UF7Spakz8uw+a1gd8LkSxwOHhuBJdm2bhSaQ++blmk1cWt35LHN9h8mOg3oVXRqOdjR+
 Tsykchk4Ph7isvN1vJaeliNCHEip63WI46UBMxv3H7Ju6lai4D+yC6+GZc+YyuAjJK5O4zZUZXk
 dNPGxKpQN8NTy1cZxAzsHtXZXGttYkO/uLdt8bSeaElxbmLXWZU92i7O+YdbG2bV6nS04kUO
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6888a4a4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=a_U1oVfrAAAA:8 a=FtIUmZvm79rvchHu-DsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: v5meC6phwvdQ7w2NBOzA1b1p8HQ5R8sl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290082



On 7/29/2025 3:19 PM, Richa Bharti wrote:
> On QCS615, we see the same issue as reported on SM8250 and SM6350:
> "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during boot.
> This is due to GPLL7 not being enabled by default as a parent clock.
> 
> Setting `.flags = CLK_OPS_PARENT_ENABLE` ensures that the parent (GPLL7)
> gets prepared and enabled when switching to it, fixing the warning.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Richa Bharti <Richa.Bharti@siemens.com>
> ---
> This change is similar to upstream commits:
> - SM8250: 783cb693828c ("clk: qcom: gcc-sm8250: Fix
>   gcc_sdcc2_apps_clk_src")
> - SM6350: df04d166d1f3 ("clk: qcom: gcc-sm6350: Fix
>   gcc_sdcc2_apps_clk_src")
> ---
>  drivers/clk/qcom/gcc-qcs615.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index 9695446bc2a3..b281f0dfe165 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -830,6 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.name = "gcc_sdcc2_apps_clk_src",
>  		.parent_data = gcc_parent_data_8,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
> +		.flags = CLK_OPS_PARENT_ENABLE,

This is not the correct way to fix it just because SM8250 and SM6350
uses this ops.

We are testing the right fix internally and will be posting.

>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };

-- 
Thanks,
Taniya Das


