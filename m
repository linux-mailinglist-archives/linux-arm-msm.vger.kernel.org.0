Return-Path: <linux-arm-msm+bounces-88699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7D7D175B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8B60301B2D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06413806BE;
	Tue, 13 Jan 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ot7v0qX9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV1AGjDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9B3803ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293844; cv=none; b=ke/9HpAMat9Nl4zcFqBxxfA1GFc7PdzFHnUeKzD2IRtU7tISPWt1K9Jmn3Am1kAa8viAs1PEGS4EDE1/C4cjYtq0UMmDjbpbuREQVB9Ip/fnS0wCjwDaQSxglaDYb7+Z6GOliUchP8ZVl3E2EupO4jZKGAWvc7Ag8/MG78jIZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293844; c=relaxed/simple;
	bh=1Q4W6TFMHDk7qea0sdXTU+1SMXiZLrH4pbuEu1a1zqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXv9hxCiwCc7T6/znKPDf8Ow2arec+SRSzcxkzmP3He2prekKrg8/dxw3T6/AbmHPnxKDP2NsQ1zNKL5oguM1KkvZMIr23y1jYG4zhbKwSMD/XA7sggDDAzUMadR/akuSCNBxVJV9muidKSnW7PVXxxmvQ06PjBccj/C1FWmTFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ot7v0qX9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV1AGjDp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7ZFH63301643
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SSfL9ICBfCSpDCOpJyuLLrl8
	7JIetzK43KEuz7rgpKw=; b=Ot7v0qX9Mxqzx5nnDbp91s/mL/6Sgtd3185usp5C
	asOUfQiwqrQ75rzKnkBU4+8G/QgPHkVPkVIvPM7wPK3JOISzBJFQHRWP7MiFqWqT
	xva+kMEC9EMB3KMtCgBaf0iiBTmn2ZUi46cVvbqY/yzTIHgnc8hsdcLDuUhsi5t/
	t/AMfEA3PS+S7aX/BNJp8yAV2bb2rXNy51z01tel+9qRcKAWDlJX3Z2etS2BmF0C
	llGMqEvbZgI97ah/tO8PJHgQveHqI5pu9m3ZO/lEAJVQvvNjwCa7fCG2oK7Bqh3J
	Gxtj7OmUs7TMzrT/ItjoxpW3qpd5+H5WRSREdYwddUYGmg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma1t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:44:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so2803354b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768293840; x=1768898640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SSfL9ICBfCSpDCOpJyuLLrl87JIetzK43KEuz7rgpKw=;
        b=MV1AGjDptc4+WC9JUvhOH7S89ij0NYukFSiTUaeus1fhOK1RPVqekMlT67W0WM+oQt
         DvMgWeD0uPxXo6YNTf07B/lpiJp/zP8C2xAIf8PNr52fA4A2CCYnjWtZrEnboy6Vmjbn
         Bh0iuJGcCjhOc1xyZsInq6iDi+x2n0ZIRjLFweupEo8967OLGrGyOlIilF75i0iMFjU1
         os5u0PYOPq0sYxwB0BbaUbz+kgOmy8o8mrkxoB78VjHrxHdXzW6A+sKvwrmBU3x6hs52
         Iv0qLOkRSa1zZkVGe7poocaZVfLvUHHHJnoCbdpVzRb/Z1L1xgIt3tuALsHKnwN2OmT6
         UVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768293840; x=1768898640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSfL9ICBfCSpDCOpJyuLLrl87JIetzK43KEuz7rgpKw=;
        b=MxUQtLmZ2k4VulK75GRU5mJlwhWIeUvVzD4+QRfHfDV5Yjeyt6o84WOp1Pzwi9NEK4
         rYh9KY/v5WkTa0t7vVDMlzwGYJI85v5P3yI6Sbo/1kCeR/hWTm/t47K5oGdPbdp1VHpa
         2Ae1KeBiCEH6ZB3+19fGevgjD/9guMN5PKqlE6Nx56XB/hvRMePY1tVBO23PZ95Zrkr0
         BttUjDcBg35cYPk2KIdUoo1PfqOJia8nqxMdsduYTkvCtWhpm8AB4wzM/5+aqluDMLPo
         yd8lKVnRIctNr32xK+1+m30sNeVhCJoO4HBOyQn+ilXhMQ0VN02hom0QwoWe6/ECnbi8
         5oGA==
X-Forwarded-Encrypted: i=1; AJvYcCWl5FI5EUurBFU3A/53xULYpBaQFEHW9ZO8fvuFxT9uWUoQ4Y+9bCrrI4fxQGGoAJgKiN8s5cSNo907nWvw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3vzvFgc9kqWfE9BtqWSpWbi1h36DBtLRz0ERrsIO9rvG7RDb
	Covb3X58rgiWDh+rDwiY24/CWoESGgLm+rYrjFdLr2ibcRqAl6FNa1soWVPOgUW7IcwfZBInY/j
	O8e6cWtCd86oL+92OIPPrKDv7np9+I341eCNkxYcNefW8yqUGFVE5ovUqfotgDQ8hxswf
X-Gm-Gg: AY/fxX7WxfkMXkqs5c9Y5UW2yKobTbRofFrroHUSBKDJSnsav5h0NXm0yTjDK3L+9lo
	iOdNa9drE8lusPaTwpqf6iJU1zgSDN4RFUQZuzFz9H1xparOcyF6TGArzafE3pXoIFeva1JuQJU
	U4S7X8tcVo5joDv5/q4P5roTq5BJfcvENWlf6pxR125871eONIAny5O59B2ncGTujLqqH0izVRM
	CINFJ7GD7kQFAYQh/XMofPpiyJSsEMPzNzqQUaAUeIPIyqga3fCPx6lh3Oj6vc1U2XAs26Ihqj3
	qZoDgVDsuNyknaEuq0UKnkrUjGN/hOosZTdgDpidk3mrJewfpuFtcO/yY91wMGiFLFCzyR250tH
	tA7weQAw56+QuK5xQNfbMrY+sDBE3F40Xahwq
X-Received: by 2002:a05:6a00:94fd:b0:81f:3cd5:2066 with SMTP id d2e1a72fcca58-81f3cd52284mr8893393b3a.12.1768293839693;
        Tue, 13 Jan 2026 00:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwu0RiBrcms1pegxhXPtm1CZdb8qDsriD0Lx+THrWCc8/R6TXWe2R3CrhCEP8AM7UKizOE9g==
X-Received: by 2002:a05:6a00:94fd:b0:81f:3cd5:2066 with SMTP id d2e1a72fcca58-81f3cd52284mr8893369b3a.12.1768293839075;
        Tue, 13 Jan 2026 00:43:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f4433488esm7974764b3a.2.2026.01.13.00.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:43:58 -0800 (PST)
Date: Tue, 13 Jan 2026 14:13:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v3] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com>
References: <20260113065409.32171-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113065409.32171-1-xjdeng@buaa.edu.cn>
X-Proofpoint-GUID: VSjB12A4D355m8qgI3ZXYuLgHGTYDGio
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=696605d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1pY1Vn1n3XNrJD7pH_IA:9 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: VSjB12A4D355m8qgI3ZXYuLgHGTYDGio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3MiBTYWx0ZWRfX2deotbv6JQuV
 +qs7b9LyBl83nPC8ZdhabgddFgBnOiTvYoTGfNhdi1IFwxjlchKVw7dGWfLRwreBdfbHwpJYXY4
 mczmWUOdJLQ6ZZKUVBzZ3pnGe3Z2cbAnQ3C/D0OUeUtoqCyfKTLZT8nBD0n2psNb25jqxQirsaq
 83nYcC6xdTKZkx85VuBhzHfLlLlSVanXxAFltq0NQSa+7P63NLnhbTzQb+Jk4+OsdEEVG9JdTqU
 OgxUUH1x+rwPKcE5Hd+Hw8IqVBWN4XXDuzgpIt55DLzG+SdL2GYOApx9PCfjUw4Spas+ccHdTSh
 XwRWpnVdF2CBivAVvedgbOBGLYX8ryf+8LwKKWYa8U3Om1vjKQ6rAqFPM0Pgo3hTzFBBlUg32FV
 eSQLeSC6fJ5rRF2H14vhnH/pA0enyXV9JXGVoAA98w16Qxmx4nuj9QHxo7DVlw4HYnTzr7jxj53
 Nwnpl/csbNR9fwmnquA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130072

On Tue, Jan 13, 2026 at 02:54:09PM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not
> checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration
> 
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> 
> ---
> 
> v3:
> - Add missing linux-kernel@vger.kernel.org to cc list.
> - Standarlize changelog placement/format.
> 
> v2:
> - Add Fixes: and Cc: stable tags.
> 
> Link: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> Link: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u

v3:
 - ...
 - ..
 - Links to v2 : https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#m84a16b6d0f58e93c1f786ea04550681b23e79df4


v2:
 - ..
 - ..
 - Link to v1: ...

You could even use b4..


>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index fb3b54e05928..cbb12db110b3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		if (!err) {
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> +			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>  				    data->vmperms, data->vmcount);

Fix the alignment to previous line '(' like you did for dev_err(), I know this file lacks it,
but that does not mean we should repeat it.


> +			if (err) {
> +				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> +					res.start, resource_size(&res), err);
> +				goto err_free_data;
> +			}
>  		}

With the above change.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

>  
>  	}
> -- 
> 2.25.1
> 

-- 
-Mukesh Ojha

