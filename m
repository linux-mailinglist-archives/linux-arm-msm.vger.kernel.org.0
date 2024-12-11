Return-Path: <linux-arm-msm+bounces-41483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8079ECCF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CFF32849DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A521BC077;
	Wed, 11 Dec 2024 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qjLT3ahG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D22211A26
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733922933; cv=none; b=rvDH8RRg2XnlFUyl2XUwKMBn5uGtgnCNgGA5Xp0XVrT3ttoWRrob272Opt8Odh0XJBr5VI/lg+EmemnwNNYDfws/tgBmnUsuy3Fy0c5phIbc5Qbcmz67W5yKqpclESsceMKRADXL7+zWI2Mr7NQDVdSTMKV3LoegSJwRf/bUZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733922933; c=relaxed/simple;
	bh=jUViW32COeGoeYELh9LbBlj4465oJrhfN7e+K2CTTdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ku1KaeGh65QIIM9Uspc7L4CNWt2plCIo0SeZkX3nlA4vyR6cGFXMDUpiA3vRtx5ImMpQvaF6FPmTE5kwVNqs1CPHrEObWJuQaa6b1GYZpws0AfJjyCTlXNC7RcR2DHY1uNcLe2bE+ydosxaklp4E/thGT7ZPJd+Inbfd3c158E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qjLT3ahG; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso5043533a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733922930; x=1734527730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wwyxsApnY4hDVPBOHJhItY5Jgr+I4T7A0sablhlGmg=;
        b=qjLT3ahGjn3eV8pVibROAMaRsVIcgYOEdLyRb6jQWxEZuzTqhKUqQ42MvK64iG+kws
         hRo1nTr2srA0QpZ/JdEp3u4inEkM7qQshpvWJCcbceQ49s2lQTsP0GYC4QlZ61SZ/bZB
         0nGd1MIqB8l0vYEYrWhkEKZB+Qu5wGhOajHW4x7L+P5+ipaVMU0IV/SE5FdbsIhfgd8e
         7eGTiFfUbVJkiKXx0NLs8A871P+07wF7ypis8275KaZx2nqHiUQOT5CY92uB5e5WfC5T
         dbXZwtOL5WBGgZ/xeQ9dPtcRjqyY2c7krCOSxdxtMoNxEsOf2kBb+mgtG3JDewNFGT6M
         GGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733922930; x=1734527730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wwyxsApnY4hDVPBOHJhItY5Jgr+I4T7A0sablhlGmg=;
        b=j7wbxu8qbs1EkQtVZb40Yw4SlopNMf5vq2nhQoKc+2W3hwe4cFeG4luggmfuBS56sP
         Xs94IsIq/Esi/pMPp+Mef6IRfp1Cwfd/j8EPpMnP6PTgHVERsEz85Tcgg/oK/AfRoXDQ
         MfR8yJYuD2qkhCDPCvFIqCh0nVVtCkEziqF0FIJK5izfUehxhO10e+ig37etm5ulX3Em
         y3Z3biqfJjUEX5bwnJO4+4WXP4xsItJxJxRQxIlBKK3aLfCUkGgkjQ5iFc0cDIXfZbq3
         MK7N+EGqBcbFyvL4wb4S8SWN57hQkyUSwCQoyHyDCIUsF0JJiFmgfRWfC4h0q5ukCtls
         u3Fw==
X-Gm-Message-State: AOJu0YwpOzv0pjwcVyR26KHPg1TEmMbH0pXCbFihqDqy73oNdFZiacZN
	h0w/CzFf1AzsqrRa0zP2cUvPlncEWcmWkGMnprEtpySlt9Aa6EyMt6ztSAs1UOk=
X-Gm-Gg: ASbGnctOCttiaMmTfPZ7NBr/AbtOESQfqmUM9mqFnLKvkk2YjSoW7KnPHnf4zsi46qP
	iSAbjPJ6ODsF7dUoWQ3kFXbG5Ez8LT9hN6aSPc3pRsgSXMyDCkBxwhP+vHCfqz7dL7Gk8005ww+
	iroeIv4E6oqeQpNVl7m+o1eKT89rzgX9PXrf2v117b1xwDx2O2jZ9Tzrr9nUuKPwezxA/XLAG3w
	dl7XAccRz1ixvPjD2TqnVt/AG8IJ4nMSru1LDvM1iuAduzUiD9lmjvDkq6w2jw7D3k=
X-Google-Smtp-Source: AGHT+IEQ3VuB9AehLYFtF0JsGB2XRiyuFHW63nuUHnZmuZQ3vdkrpWWLByAocPF8PI57hfUSLB2v1Q==
X-Received: by 2002:a05:6402:2553:b0:5d1:2534:57bf with SMTP id 4fb4d7f45d1cf-5d433170532mr2909736a12.32.1733922930525;
        Wed, 11 Dec 2024 05:15:30 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a25ce7sm8914783a12.5.2024.12.11.05.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 05:15:29 -0800 (PST)
Message-ID: <19ac5167-017c-45a4-b9ef-9b9e11b216c2@linaro.org>
Date: Wed, 11 Dec 2024 13:15:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] clk: qcom: Support attaching GDSCs to multiple
 parents
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-3-7e302fd09488@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-3-7e302fd09488@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 00:27, Bryan O'Donoghue wrote:
>   takes care of hooking up the GDSC to the clock-controller.

This should read "hooking up the power-domain to the clock-controller"

I will update the commit log.

---
bod

