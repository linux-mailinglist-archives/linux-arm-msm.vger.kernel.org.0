Return-Path: <linux-arm-msm+bounces-83161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24817C83809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D746F4E20C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A33296BC4;
	Tue, 25 Nov 2025 06:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkTw4gxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/v84ixS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112A292B54
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052645; cv=none; b=nly4D/ECMgepq/bqbGv2fF3IlvRQZqjEB51xwiuOMhPuAV2LKLJhm9OXRjxtXV9fnv+QYjSWhNmiQ5e559NGdWgHVhkxjcBX++dR423gsO0pXv9ad7zllL7jxWHGrBB4Q8IDkQ3bwiszvbyOun2hAdpaCgq3RzpZGVR27wN67b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052645; c=relaxed/simple;
	bh=nnHmhyhelw4QZaKxg4NDVF3PzW22G0/mH6vimv526PU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TY4khoSWBZ3lhR+JZyBmiZmZORPPg74jWsyed5uvHoVOOkGeTXeLWEKjL+C5BQyBo37TpgYRiyIlDZJNVnAL4LvhBrc4u+z/g4eVOhBnCJ4KInXrUQZxVQcX+cn95Pvuj3ks9dYBizKXUvphoTAAGNkv1VBXJVYEgmp8agjMPCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkTw4gxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/v84ixS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2ge061232224
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DG60jf2Q0JmVzylkbcK5LyO1Who91UUvzLD6q45AVy0=; b=MkTw4gxvMdwETjRu
	3vCJ/xFm4Mbkffr8Sl1P/b2koeYixJymVq91t5LLxJkVNeHMUowa6W4X/wu8DhEc
	TI5j2TCbtLT+ruqaAUMy9MLxuylnXe8IsBffHp0UVheM2EqQ6rF5ZTB4f3gnNw3D
	imrZx6YVvaOYSHzbHdHQvAtCtKPF1+2CP9iVhyGCiFzXUW8o0nXawS/r8IB4q42L
	GaEkDLyuJrDM/jXEQHDVFShaoH9e6MwQvcSpWgbeGuQkIPqcquBUEGjPidUBSQ9h
	auB23HyXDdXPtEovF1zdvVQzU09q3Nz49SfVC4WA4noXu4VJsty7kNvmcg84R5wp
	5o864Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyh1wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:37:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2954d676f9dso36019865ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764052643; x=1764657443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DG60jf2Q0JmVzylkbcK5LyO1Who91UUvzLD6q45AVy0=;
        b=T/v84ixSjEZz2mPcjr2tKz5pKhgtVKzsOl48QQ7veq5Dx8qxzioaiBonI41YXEolqD
         352FPGmz9DEKbvHiPzbJKszRwsnAMpCK9E5TjGpirBXyIb+lbwXTMGVZoerxAvOyiATn
         7y1CAFj3rsWjQxoo/rIRfrWI5BLRn+TNj0xJNKvjgKJGlVTR/mQurIZvEfQ1a9rcK7MI
         SkJ3PeHcCGXk35jK3ZBp5Xz5G8M977QC5UrY2ySprGnHWLDysP8TfqodKzf7EBREwHId
         B+XA7EWqAZ/GMMQ82dFhzt24nd/QgT1vOIMtpjBJM7Tl2cX/nOUEsT8W1eBM4hDMEcEI
         8vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052643; x=1764657443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DG60jf2Q0JmVzylkbcK5LyO1Who91UUvzLD6q45AVy0=;
        b=pr/y+GL2aZGqRZErzdhS226pdFL7fEexBktJ6nGhNd1qoh25NCBDLXyccRtewSsNtz
         pVASfvWN7c5qVA8JozjYoAgtl4BSIOH1ba99kyj9+pBvwJGEDDK6DL4xPwqOzJ124YKe
         RdCskX66/JttABHnartWyGHEmzgB7zYi79tPu8ArB+JiU6Zee8G9V+4BgfuVROixit7Y
         VlIZBvopo4EYd852ma1Qn29RDkQjPfBFbwZfAsYFkY37b4En3YEgLoIU/NOX0NPtYQ1v
         jnHycQwvNK2NsirUJKw1nQgu2vkI3gVT/uYgsvsO1NTqgvWgAnJiVDkXUcc2K+j5zDoG
         1ONQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa8ioAca15nsC206JDuCn2RCANEA35MGj+BV0viJ5qB5uujmMkaLnejz5yO6EPZ0c5EUUjzqsjZ/tXIMs1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ywGecogdKjMUKOLAuJqi1ftLUTLg4HASujOvsXBKX+V7Pqw3
	+gezDu/WQc26NEMuwB4r8MntkP88nJfbI/h6FC01IUwSd5lnLXi7MHSULrHoauEWU7yR2JXFkAv
	CUMiCK6s9xngtRtFdDca+Oups5tQ2mFxVuv4PtLQYoPBLhUprfyfv462g6bOdd6of8/B5
X-Gm-Gg: ASbGncu85F3guj4iLVwit8GXy0wZgeRPTVpCjxtiiBcXiObjI7GFSJVyroiEcnAps6r
	3XOZu/kGbYDYG97Gwct6c8IhYbijasWZJexwPrpAjUhv+IHbSC/LdLO+Zig4pVyLP2UQK4Fv4Uo
	7XtffrENQRhiULOQd9RBemfzLV7rCzwi+F5D39MGNIUkiRSlR9qSRIErm4qfQiAjx3XfqIcJoFg
	dLcxYUslSr3eCsM1Ip7etk0hUrrRmM+6KXV4Y6hg+wYbuunUYD3yGunur1Hh0aaYugZkVtLPVSv
	SoL7ea31/YjwpagvkUgiSUwZexs08I0X/I+b2kO8NvhJ8oLI7L3x4P59N1d+ehaalHDcCaF7Wyt
	0mdUQhs21hqZ+uXxjLfrjGyGfvgOuIo1QaWQ5
X-Received: by 2002:a17:903:90c:b0:295:54cb:a8df with SMTP id d9443c01a7336-29bab160a4amr15919075ad.36.1764052643146;
        Mon, 24 Nov 2025 22:37:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENN/hpaeRehzIaLsAqawTjimaaKVcgAQZKF9CpPcDgZn4MbwQrIbo+odKzO6evzHOEO5DYAw==
X-Received: by 2002:a17:903:90c:b0:295:54cb:a8df with SMTP id d9443c01a7336-29bab160a4amr15918875ad.36.1764052642680;
        Mon, 24 Nov 2025 22:37:22 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b12f988sm152768385ad.27.2025.11.24.22.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 22:37:22 -0800 (PST)
Message-ID: <d156efb4-ef41-47eb-8f55-2c5ab5d97e3b@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 12:07:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
 <20251124212012.3660189-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251124212012.3660189-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=69254ea3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=lWVEJI6HPn3KqSwRoiYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1MyBTYWx0ZWRfX0jUSxAFYvGR9
 N/kS11aYHVlGPinGJKfDh8YuzVVWiPi48SvbU+t6au5XwO82WdWWyHoajfD2hN6jf1DoQQvlRnS
 AnCjmx6KecjLydnA6//e5jcIMm09Gdkr1nGbz6zMJc5npJ7rDH837rTlweaRJPxfO+YLZg882Zy
 4yRbd/zcKBDoGsl+KHrMO8PFGlF7g1XI2kZijDjwiBUklXjvLneTyTNEQw2roVatLcOK1NDQjfC
 2554Bke75Iz9upQoXzuF2yZ1PfsZzOesq8dQmPJQJ9trg2wW/WvWRzfva+9uNTPtVg7D+OBrXd6
 H6IOEXnvxMMg68NUvkEpZetRe2aW5xE97wa8ziZUiK3mLVA4bkfT385jBcKWTH2tw014hfavytf
 2BlzmdRXhj/kV44fraQGXa1K6usbzA==
X-Proofpoint-ORIG-GUID: 9XGgAZJ-4fPscrDgaVGsJM6U2Thn7pj8
X-Proofpoint-GUID: 9XGgAZJ-4fPscrDgaVGsJM6U2Thn7pj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250053



On 11/25/2025 2:50 AM, Vladimir Zapolskiy wrote:
> In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
> for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
> powered boards set floor clock operations for SDCC RCGs on SM8650.
> 
> This change fixes initialization of some SD cards, where the problem
> is manifested by the SDHC driver:
> 
>     mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
>     mmc0: error -110 whilst initialising SD card
> 
> Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/gcc-sm8650.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
> index 24f98062b9dd..2dd6444ce036 100644
> --- a/drivers/clk/qcom/gcc-sm8650.c
> +++ b/drivers/clk/qcom/gcc-sm8650.c
> @@ -1257,7 +1257,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_11,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -1279,7 +1279,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  		.parent_data = gcc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das


