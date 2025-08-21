Return-Path: <linux-arm-msm+bounces-70038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EAAB2EBE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 05:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A6D61CC1B5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 03:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645D32D5408;
	Thu, 21 Aug 2025 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yoGmijxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3322580CF;
	Thu, 21 Aug 2025 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755746577; cv=none; b=mbwQfMFIbv/G9kU9LBv5dU0XQAbI91yV88eQDqqf60rfncyqwRmi8IKF3ZAgy+PI4LzOmPvIUTd3g/0QJ0nJKJB8BHfZp8J1v6WFzCU1Z5HCsSN9gqdxK8AyFgr0zs4ikqvUyK4Q5vTTaY27F6YxHSrz91JdHzLxfqUxmtMG0NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755746577; c=relaxed/simple;
	bh=lTkLYpS7J9grEnH13m9iDrODUzapd1P6qOw2pLKanOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TguyMuNC+gC6/ZA9BmI5f/SkZjYEutw28tap+gZDmjAZrjdnVdixUtkFl3zjKp9oNLutaCOHjEsoug9Kq2lPgLcaqt8wsQ0nAvS4DNAIKBPRu9mjPPn7zLShUw1PZ4quwq7rboR4fz6EetAzNIjmSVeQALRcX38opjxt1rIWcfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yoGmijxh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=VMXZvWdTxmpFtlVQ9jlbQoJIR5oaIbYtP1S8SHubNqQ=; b=yoGmijxhHu+wEGIhK6HrD097at
	6cMBFlz8C8WVswT3oLGSdlC5KkEc0GJEgqJwbV8yzsQpRCMqZWEH7cYmoXwKbA9+97QaXBfzNzVVA
	rPsxXlHDomjMQsPBHw57yLen1Wa6o9YiIhAGdncGVYxeRxwyKMeyaYqd6WJ23oX0YvMLIDlWDw6FH
	/c1Hx7P/HcqKDcDf068VRYtA+YALxUoTHnHjXbOkO+vJ3SrLCBi4CqU8nRMMKu5JCDwJxkgxnc3A3
	OhVJJo3UNzlzAs8juRI10/qO5MWvTRtl8REiq3Pt9PVi9WzraKdDI4GqpO3hfo8qqdOV9Qtl6U1qQ
	Qwr6krsQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovt7-0000000FcTp-3v7h;
	Thu, 21 Aug 2025 03:22:53 +0000
Message-ID: <74ba8f4e-1ccd-4962-bb5e-48a9157da952@infradead.org>
Date: Wed, 20 Aug 2025 20:22:52 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
 <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-4-7066680f138a@oss.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-4-7066680f138a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/20/25 4:38 PM, Amirreza Zarrabi wrote:
> +/**
> + * struct tee_ioctl_invoke_func_arg - Invokes an object in a Trusted Application
> + * @id:		[in] Object id
> + * @op:		[in] Object operation, specific to the object
> + * @ret:	[out] return value
> + * @num_params	[in] number of parameters following this struct

Missing colon (':') above:
    * @num_params:

> + */
> +struct tee_ioctl_object_invoke_arg {
> +	__u64 id;
> +	__u32 op;
> +	__u32 ret;
> +	__u32 num_params;
> +	/* num_params tells the actual number of element in params */
> +	struct tee_ioctl_param params[];
> +};

-- 
~Randy


