Return-Path: <linux-arm-msm+bounces-19046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 212468B8761
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 11:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3831AB22370
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 09:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047B9502A4;
	Wed,  1 May 2024 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zg6EBePU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C850A87
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714554901; cv=none; b=c+4YUnWxHkVNuGpbPcrH2XSQEUrfQoqE5nFTPRbYzl77jDiHsXDOgR1FDWQy4LL+YR16zzzVzAxzR4OU3QNIkFLVNRn2hljhNIsqAi3NCkBQja2Dvop0/KKN3gD3MThW9kdgezNkWwHqD8sw7QqjUvsXUiW9re3y/0G1TYEiIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714554901; c=relaxed/simple;
	bh=WnsMRjfBiQvg0HY93oK+wHwfzdyxP7aK1TTwsAckKN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkZLa055nup+q1pvzNhabYfWSzh1RxF+SxUvL5JKda/Mvbq5zdeBlwoh0b1ZZsNifIwYZ0jQFr63zg+x83G8CAny1Yd2FM8U3VS/9/MNha1KESJGeZTPK8jWitxbQRkgOXS9/KRcvoaHHTAQNr5o6nMFIoTooKylIkONYhQEq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zg6EBePU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-418e4cd2196so51468685e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 02:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714554898; x=1715159698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7Oo92HrLNTevL9sgb/rzYO2LYRP7kZeSluQHcb91H0=;
        b=Zg6EBePUG4P5x0Bz8xyzoU4sgQJt7yPgIKYJhnfGhYkQGd65cRxZCTUZY+1367mIKM
         neZ6YXjpTtrPucFKpydoxZK3vaMCusNnx9LqAShuIUYEyPbv1JxYK/O/JwNR4exY6yqi
         xfxAHIDbn52kBGQRv3DHh6mK4EsK8mFe8ogFmPz5Efut4AOGtARWnKZD8xGqt/kcusKl
         MIyXWyoioX9O+bymCjR/59riHe1beSHFsDQC4EEaaa/DqshjPKOz82oe+zoju5qDlXkJ
         /OxbcCMNneABctTYv5yja6vUlhzct/rOHwirPDrRenTI57lil5Nc7UrGdRMkuvl6yMCo
         ivJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714554898; x=1715159698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7Oo92HrLNTevL9sgb/rzYO2LYRP7kZeSluQHcb91H0=;
        b=M3ffAoBaRnoUHV8EuTTe8gYg8xNidb8FK++Dj1BHOqgPZdAZgKTQFsGvA8PdoiDIqM
         8KCZZZrz30FVSd8qHF88Xj4wGcPHHTQAj/PYo+ROwWlPTtYObuj/CH3xVwaAWgbwzY7g
         /nuPuOkkbHat5JjOVjF+fHShcNBS5Jx0xYTN03llcoRi2FPFXecoFnOp63txDmggAVtB
         V7p4DC8XoPSPe3DdDJg4JTHJN/6U/f3t73AK7JBiOd4CSELOGppHSDfJ6XKOjxMjzYo4
         idLvzIAoME1Z2CMDf3WnUSLnfPqxZUzk/6BWcvbUSzV445QaBKr08gUkMD+6U3fhhhRY
         RFxw==
X-Gm-Message-State: AOJu0YwFkzWa7WY7ieC4GI02OgKvQ5KWngEUQSbuGsKUt7rHdy+VXi7Q
	KzwVXWrP0WRIEgpJbRLGhxAQQMR8kx7yYZtP0Dt40MTT9UClJr5amuoaqjhwjTU=
X-Google-Smtp-Source: AGHT+IGqYngsZENzsz/1pFANnIsWSoQqm6YP469dyVXFTuIpefceJcSqZyRDxsqxoDLcadLnDSNwBA==
X-Received: by 2002:a05:600c:4708:b0:41b:edf4:4077 with SMTP id v8-20020a05600c470800b0041bedf44077mr1338212wmo.36.1714554898671;
        Wed, 01 May 2024 02:14:58 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d48c5000000b0034afaa9ca47sm25764690wrs.1.2024.05.01.02.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 02:14:58 -0700 (PDT)
Message-ID: <ef194e5c-f136-4dba-bfe0-2c6439892e34@linaro.org>
Date: Wed, 1 May 2024 10:14:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 5/5] venus: pm_helpers: Use
 dev_pm_genpd_set_hwmode to switch GDSC mode on V6
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240413152013.22307-1-quic_jkona@quicinc.com>
 <20240413152013.22307-6-quic_jkona@quicinc.com>
 <5c78ad52-524b-4ad7-b149-0e7252abc2ee@linaro.org>
 <b96ef82c-4033-43e0-9c1e-347ffb500751@quicinc.com>
 <a522f25f-bb38-4ae1-8f13-8e56934e5ef5@linaro.org>
 <dbd1b86c-7b5f-4b92-ab1f-fecfe1486cfc@quicinc.com>
 <621dbaaa-6b86-45b5-988e-a6d9c39b13d7@linaro.org>
 <d36c1163-a3f0-4034-a430-91986e5bbce8@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d36c1163-a3f0-4034-a430-91986e5bbce8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 21:01, Konrad Dybcio wrote:
> On 24.04.2024 11:50 AM, Bryan O'Donoghue wrote:
>> On 24/04/2024 10:45, Jagadeesh Kona wrote:
>>>
>>> Thanks Bryan for testing this series. Can you please confirm if this issue is observed in every run or only seen during the first run? Also please let me know on which platform this issue is observed?
>>>
>>> Thanks,
>>> Jagadeesh
>>
>> rb5/sm8250
>>
>> My observation was on a previous _boot_ the stuttering was worse. There is in the video capture three times that I count where the video halts briefly, I guess we need to vote or set an OPP so the firmware knows not to power-collapse quite so aggressively.
> 
> We seem to be having some qualcomm-wide variance on perf/pwr usage on some
> odd boots.. Any chance you could try like 5 times and see if it was a fluke?
> 
> Konrad

Sure.

The first time I tried it, it was much worse.

The second time, captured in the video is only noticeable because I was 
*looking* for this specific error i.e. I don't think I would have 
noticed the error on the second run, had I not seen the first run.

I'll find some time to do 5x with and 5x without.

---
bod

