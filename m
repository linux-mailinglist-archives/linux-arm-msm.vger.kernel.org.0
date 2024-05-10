Return-Path: <linux-arm-msm+bounces-19634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 115148C1A4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 02:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90472B2195C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 00:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F288DDC9;
	Fri, 10 May 2024 00:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sq69GJbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB27610D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 00:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299746; cv=none; b=tV3x2J0N2uUIji4ZgqWwwwzrz2601wa0F3jeCC5jMdjj40/BYUDi1rFKiYp6UqLAz0K4ApHuzKmxwIXCDmqssYxK5/MrWTCCJbURP0GCk0cUByGN6m/TOluNkF0wm5RymAraI5f6krdjGDHmwmYkCe8BgUJThsy7nyZ5ccGZbMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299746; c=relaxed/simple;
	bh=CpZvtTlrJ5YKdM0Zb66fe6fbrWnZj4JbvkQp7Lq212E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ld90WpB5uG/jNxAYrKMM0OIK45zS9GnXSSZFmvKujxGdHXgV4gVpNWCFWHQdjGux49yj+/+2rk1mg+E+hwcMVDQhlYGcKyTWrRgRVnqzOdR0GQ7Ct45GHgDzii5FbDGE6m5Uz6/2OX9pgve7g1L7nsJta2yID+5UJcefRUeWiMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sq69GJbf; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-41dc9c83e57so14062865e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 17:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715299743; x=1715904543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGOpiJC0r9wpfj/NhAxT+3UgzUTwOTtSl3y1P0H9q2c=;
        b=sq69GJbfNoCiJmlJRxkOPv11qpAbJ4Cod3d3gRryZQRXSICqmlxL5G/sYby2JXRSck
         +TCosKSCdCkGQ2gfcN3L+OwqRU1M8MYij3tLMJpQTNFjchGf/VC2Lp2VP6JVlJ/1fPBv
         dBgM+nxdepqT673IW2pvAixL5P65FCGSmct51UTFlU4C7Vn4hiEsyQNDPasilbI5KKwq
         WR9IHrL7KvZ/bNa1OrJ1WtEMzVT9pHq6Bp+Wo+McVZTxRo3u5icFFMxOhCtanNSh8tsT
         Q59b4n54JrofxvKhVMm5O7rdyeZrKkLVq0Mrs9s1xbkQsEfDsx+4vVXv4AXhMCNpKE0L
         y/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299743; x=1715904543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGOpiJC0r9wpfj/NhAxT+3UgzUTwOTtSl3y1P0H9q2c=;
        b=FoAt0DjRr12fudNfyU2k4RCkrXxVnknUrqz7rSJStXoDG5vTlC410+/3mLs1qkovSD
         0VOg/IrwWqry3qFPtBTRspiFqmIYLAjTC1JIXxwmIsARm3+cwCeLGUNUwsyNWPFBZVN7
         PI6/OsRaJB2lp4Zk+kSyByoZjknwY7mgzrSyn0d7kBOKK/+X6uqB+w0DnpopWIicC6Aq
         1Zpz0FVO5+BSJsyga5jbE0yHR5GNNvg6uFVS7HhDEd8t2j6lTGHD4BNxGIYbuBq38syZ
         /kNsG9DR2unZPM4NDQy/cDeBeTc4DPL2wpZZHTPfqeojK8XNiBFtroxk6yaOucvtJdqG
         OqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcTBqq0/555t7qA1VjqT9Zmv3LOr9P9Nci93r21YlmeEam+UU3icOV8HS1d2K+GBoDsQDk0B49J5sYGCPo4ePWMcgyfu8TL0cs+ItfbQ==
X-Gm-Message-State: AOJu0YzgqcCjEM1708ucUGChA84r9PrlMi1XeUUqtRx3G0nfDgA+QB5S
	ib0eZ0qHWUHbeRQAnDsRdhnvTqJxDiZq+CBnW1inGDcQscewI/uR+mO4R2feDzQ=
X-Google-Smtp-Source: AGHT+IHA6/BecFqIxYIboRy7QFpgIleEZEFfCTKtmqHO9WWOtrc1jJZTMLUXGrLN4+fEKZPej+mCeA==
X-Received: by 2002:a05:600c:468e:b0:418:2ab6:7123 with SMTP id 5b1f17b1804b1-41feaa41489mr8490295e9.10.1715299743024;
        Thu, 09 May 2024 17:09:03 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f881110f9sm76828885e9.37.2024.05.09.17.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 17:09:02 -0700 (PDT)
Message-ID: <79b2ab52-392f-40f6-8208-6e10330c0f04@linaro.org>
Date: Fri, 10 May 2024 01:09:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/18] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-18-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-18-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> Replace the old style single element array at the end of the struct with
> a flex array.
> 
> The code does not allocate this structure, so the size change should not
> be a problem.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index dee439ea4d2e..9545c964a428 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -1230,7 +1230,7 @@ struct hfi_interlace_format_supported {
>   struct hfi_buffer_alloc_mode_supported {
>   	u32 buffer_type;
>   	u32 num_entries;
> -	u32 data[1];
> +	u32 data[];
>   };
>   
>   struct hfi_metadata_pass_through {
> 

You have some fairly inconsistent fixes for this class.

Please don't change the sizeof() any structures in your series, because 
the structure is unallocated changing the size is potentially insidious IMO.

data[1] -> data is perfectly fine in this case.

---
bod

