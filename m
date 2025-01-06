Return-Path: <linux-arm-msm+bounces-44013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E028BA02780
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 15:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 753C71885FFA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A021DE893;
	Mon,  6 Jan 2025 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sdha6wmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E339FCE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172498; cv=none; b=tE7NPWwi0tbx1aG3obhvkwGYAme+2IW1OkmCs+UaIQ5KOEKYoJ2PFEoC2XWtrJBIqV0XMNnTC9LzuBb47on79cPl4oQBsgJjXl0hARkoR+hbGPQ3jbuSv9tQdNEfFJm6ynPdgBxgjpSVEbFi83jRsCL1/ei7DMKxu7Hmj9Y1vJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172498; c=relaxed/simple;
	bh=GbeZc7W6Q3I0MRY/HrXEVTv18jbZE/U2UUTXH/SitKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evjAYnjUR8rkUwtHPLecdKZuXovzfec0xZ1VOMxBkIGA1HOTa3B9cHZCJRomfEpC4C0kMhQXmStzPSJmmtSrdGNZT8bY2+ROEnzqgvsePd+qsWAMZ9SoFzmXGm1Vrn/7iOSCIGK2tcCt9R+KiCLCxy4xxW/hfOpYcglDSOJiV38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sdha6wmb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385eed29d17so6818562f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 06:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736172494; x=1736777294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncYQpwQ9OCIQn9/rsFj5efsB71N9r4wzFE7cHZesHrU=;
        b=Sdha6wmbSsJT6PjOLlmv5nvTfSycR7Km3XSwaP/+LSJRXE+U6pOx8ID5ca/Mn+Nlpy
         OCMdFixf5WsxLW1rsdprmHQUSkdACHNUVb7E5kKdDUjq+pQJGQCwDum7uB+NgAnUOsOm
         Q2sEQYrDN37f6eVxOFCqxJJpKxK/i5iZHizGdHdrHwxgcCTDwdXeUDFhRAKcF1TF0ye5
         O8sMBm6eSXLrVbDQzyvv6hdpK38hl0xnJrli60kKFbLLPm3IZFC1aN1AQ29DCZVRsh9A
         9K7LGB96glp7AVY30iREQkdDwE+jnyTO/JA19BQ1aQXBGCOjm9gpgnaSTkxpEtZoy3PP
         2bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172494; x=1736777294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncYQpwQ9OCIQn9/rsFj5efsB71N9r4wzFE7cHZesHrU=;
        b=OodpXrF1jDaRQs70EavPSnAMGqV2kChsN7xV5VFwj1krUc+yniHZosDjCYpQK7H3/2
         EwNL+lyQHj+UR1ZjNdNPViAA/1QlYZWElpIr1R7vRcl2ZFdzw/9F+WXi1knRbmEzW4u4
         YCHQ9M8JbLTjT6um2j+4s0UpZfzi7lgJTvbuszSrG8qfXdG1HKSrENNA7MJPQpJF8LTZ
         Jr/7Z7W2Eue1+oVtfClBF5plRhqfkp3lfhjiNu7iWowzHSMs4DSQKvrOP4CR7wRhqb6l
         QzpCPTK4Ipr3+DTFX8WXnjr4MGpe9Vu5RjsMtJTV0AIzVNzJqDPgWzsgLQJtl6+p8Axb
         7/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJx4dPXlmSvNDFCV1HW30GHepovzxh75St0VLrGqoNt6rVz9hpCsJaI2tSLm9iDexh2or7oREfMc3oA1rz@vger.kernel.org
X-Gm-Message-State: AOJu0YwhAPNyNhOwUnWGnRsKJsZGKBCkP19ROn+Ewwk1B0B5DeQ4QBED
	21EwYDlzvVMGmleWRNaxK7ybxjtrxlgkSCbmfhdzniLgaJkOc/XbEBYybmJEZ5M=
X-Gm-Gg: ASbGnctTdkIfMUdkRT+o2UMn78jb/zxXp+V4BrJRXBNmZFfmC3mnjYv+hJsbD/0y0oL
	pAFnapCOBavbXWeJTDci/+QFt1lRRaT4JEkDQ1Oiw0Kmwk/lwdhYmN74eqXKB4enJEId8rdkj+E
	C8hjJFIHfONO9/w/aaDRTdsj17lqFiQgOCrgB0cNO5EUd4npVJKsFsSVlMamF6ylGhAg4J5nEq8
	SxpsyzjemhJ74vj/PbwMLdVi9Q28U2FRaMvuhJXQW0/cu4DyAPWtrw6gzmSIOUmFbI+4A==
X-Google-Smtp-Source: AGHT+IHW3ETfqtBsOE2bHkob+eHNeS2Nwu8SpS7/ti4RMQCKSJ5YxWWSnX51+61lvx3mx4ntI21zUA==
X-Received: by 2002:a5d:598d:0:b0:385:e013:39ef with SMTP id ffacd0b85a97d-38a221e30aemr43363039f8f.6.1736172494526;
        Mon, 06 Jan 2025 06:08:14 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a412f778esm33701910f8f.4.2025.01.06.06.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:08:14 -0800 (PST)
Message-ID: <92009895-8b9e-43d5-99f0-efc43c4b09c8@linaro.org>
Date: Mon, 6 Jan 2025 14:08:13 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: venus: venc: Ignore parm smaller than 1fps
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-arm-msm@vger.kernel.org
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
 <20250106-fix-cocci-v4-3-3c8eb97995ba@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250106-fix-cocci-v4-3-3c8eb97995ba@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2025 13:40, Ricardo Ribalda wrote:
> The driver uses "whole" fps in all its calculations (e.g. in
> load_per_instance()). Return -EINVAL if the user provides a parm that
> will result in 0 whole fps.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/venc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index c1c543535aaf..bd967d60c883 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -411,7 +411,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>   	do_div(us_per_frame, timeperframe->denominator);
>   
> -	if (!us_per_frame)
> +	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
>   		return -EINVAL;
>   
>   	fps = (u64)USEC_PER_SEC;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

