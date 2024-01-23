Return-Path: <linux-arm-msm+bounces-8004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F5839711
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D9A1B2999C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C88811F7;
	Tue, 23 Jan 2024 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eaMlJPqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6187F7F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032644; cv=none; b=SNj5Zj6YTLbR7pARZFunBylaGJjC2GHsZk0DxgA326d93Wy9ACc6cDRcluESfZA5IaBygRta5WKZMNfTAGdbutUJENPXuvv99l4K/fTU0SIloclZhHdssX4gUehAVGldV4W6oUJYAa4hb4PITrvAzfv9CvwT//sIrcjEyGGnvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032644; c=relaxed/simple;
	bh=JRcyWuTnl+Cx2u9SRpEkg3gQ0bAUqGVVmlaoDVqsN40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T//P9cmxIl8eEMZQ5+Q6KMXOyjMSlH+W8xCoI5twYLIDhLwRx70GryZ2QkTR5urj4HOsDiVfH8Qsz5RTjjXgekwr4XNX+n21yYixFQH3l2F5mUSQ8H3PhnAtQQhKma/bkWOi+kQTz5Gvkjw53lzjTogYDCTAxNQXeagYiqqHAIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eaMlJPqM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e72e3d435so4240385e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 09:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706032640; x=1706637440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQniiPyMdbel0cWWzkhe0wrrBf8j5R1kj8tRMUtU+60=;
        b=eaMlJPqMRObpa16fWgRU0lWNqVJ82B0iz8Bwy9gWWZtbysuL1BFJqxXKg59MhPpgHC
         EFTOiB8eUzCk8U4qCPUySSl/6OCYDntfNdWcCMbXj6ZgWQpIW2UXjEl6Qr/zlkRR920B
         rbCCll4c9RYSWaiKcF1p5CeO2F0QsehFGltk6skRqUZn29xKNcEK1yn7vsWUyLkEGe2v
         CRSkLvue8Nrt9YsqCpuAyvblqVNkenqzlZEYd9KIdC1BgO6seJ1MrsBde2YvkaDL0v8C
         ivoJVGG/XryTnR0Y6lw+hgWoc64cjELFZhUAu1lubfnOaLpbVa+V4B5rgG1+s90LT0yz
         OW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032640; x=1706637440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQniiPyMdbel0cWWzkhe0wrrBf8j5R1kj8tRMUtU+60=;
        b=xRlTxKG5OP0XOk42ITLJ+947eeDPIJ2+WBHD5fK1x9gFdsMvqdDcdUqucdvokA13zi
         ZoWAjtK76V9VEQ7bU72jg9ts66KSEyaT57CIN5QTasObUSSG0dZi/z3FvE6BruRyw1xI
         ElbgrH0Z94NJNcdhFLRTNR8ZUPHrgu8I1vytXabZdvyuic9xc0f6/1WKYWxVyeN5x8z4
         2qje7Zlcb3aBArSx36NkA2P77T77GnVJYeWzLbYDnBd5rcgq4INyYwPFGci7Bgn+vElj
         MfbPL3xceVGQJpznSJJJ4Sek/xgrYRaa9yz5PqoYSAcK9dPYm1I8EgFWyuhhjTeB+d0R
         QV3A==
X-Gm-Message-State: AOJu0YyYodOLIWLKhxim+2BOq1491H4fCPuhnovXODxWakNgUlHJP/dq
	AeuGb37xJ2Um2ECBUJ0ZwSu+75TDokhsZ8cEgT5G2FT47MAtrOAAOuSn843rYa4=
X-Google-Smtp-Source: AGHT+IFPFktnqom+SYhgpNlZwvGi9c6h1ROLmzTTvh5GBzHbI8vr3y5MIYHya4Q+QKeForcOPncC0w==
X-Received: by 2002:a05:6512:38cf:b0:50e:7d4f:a31a with SMTP id p15-20020a05651238cf00b0050e7d4fa31amr1535679lft.53.1706032639752;
        Tue, 23 Jan 2024 09:57:19 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o9-20020a056512050900b0050ef7f44884sm2335262lfb.199.2024.01.23.09.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 09:57:19 -0800 (PST)
Message-ID: <e6c57522-3f4b-4ae9-9d90-82c162d167ab@linaro.org>
Date: Tue, 23 Jan 2024 18:57:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: sm8550: Enable sync_state
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240123-topic-sm8550-upstream-icc-sync-state-v1-1-a66259e0e176@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-topic-sm8550-upstream-icc-sync-state-v1-1-a66259e0e176@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 09:49, Neil Armstrong wrote:
> Enable sync_state on sm8550 so that the interconnect votes actually mean
> anything and aren't just pinned to INT_MAX.
> 
> Fixes: e6f0d6a30f73 ("interconnect: qcom: Add SM8550 interconnect provider driver")
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

https://lore.kernel.org/linux-arm-msm/20231218-topic-8550_fixes-v1-2-ce1272d77540@linaro.org/

Konrad

