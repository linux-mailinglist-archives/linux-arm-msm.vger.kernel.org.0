Return-Path: <linux-arm-msm+bounces-83209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E01C841C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 283173AB44C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EC42FF65A;
	Tue, 25 Nov 2025 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQ1kfZIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D58B2FF164
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764061096; cv=none; b=sSeg6gv9NPHcet/W68tojW/5qxX0eonZkucuW/wnxcwczwd32vn8AkdmCOqTG4IniuEJTOGizEBOhpkE2hNn5Jqa9mtZh5f0IE/ApnPfzsE36F9Lr28ECJxTVicJSLmcNwIErCsZ3JJ+aZF3g4brBVgdxVHuejuQE6I3gkjRxU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764061096; c=relaxed/simple;
	bh=6bCQbazhUkRM50aYhLWHRSpwuK714GzrBIOb3y+BZ/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PT9ep51tjxSmZozWCnjkVwgKLERMucEpniOC0aXDcD8xUAi4POriIkH/G83qgy+3C6wX9C5NpIwg49RLuUSGibx5V/EGQrtq3iid86L/ARfeEQy5TeV78c8m6xw4NtpSlOqBvYswrJFCK+Yxx+v2GY/dUngOtdHTzII/6V2vr3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQ1kfZIE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so8421594a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 00:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764061093; x=1764665893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FZX6KYHBdjPPj4U1jchp2YXtLROmEg2wm37ihXkD3o=;
        b=bQ1kfZIEyN62pwGKD54uyeGXtMYGU/GFIUGSN+VhVnUSkCmWfoCi9hxVYEofAdSuVK
         mw//bdfOomHZvuwxvn3ezBgcvEuFhCwH5Dyv9fTTOTvOLRIjORL1l5uQhMoG7Q+N4GMp
         0uKNN/WNuere3/u4vxIyYaNdtHTr5ivU18N6pu7bwHvr32sG4EdUavVrFhoYo8yWSJ0c
         bZlyiCS83hflvKStaVx5r19XaOpCtZheLj/ACS/2LqeiiAmgTp3aQxR//6yZnBjGQNh0
         v9tNLVqhweyoMrbNx1he36Q5FdZKBrmA49wbsQOO61kOOqkeqJ5rG2szLi+H5iKtqQXR
         0tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764061093; x=1764665893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FZX6KYHBdjPPj4U1jchp2YXtLROmEg2wm37ihXkD3o=;
        b=QQjRJcvSF4EwQHLXi/Zn88YT7akhaxQfUTZ6Y6A9sFa4XZfEGniYRVtMt6tntl47S1
         3iIdztqE2q26/Jrkq7P88UczRPM0eLmvMsLUsf+MNt2fWBnGH9JikQJpgfz668iSd1u0
         r0e9sAkU2eaJcpNRfWfd433li7jL7g1XsaMN5LIL9iMcWHYOyd2rWXBXHzxAyxVuEVo6
         P7K03muX72DEHBKBuCWOIjwhsSBtQE3zMFGbSCptaGABihjxwLWrqSH1j+zkWjJOJOBC
         1Ayt1sIaRxfiYncZSaE123q0yvStCc0gMskoAbLvF96gZ8iG77OHzvDBQobVPv+LQqLp
         Zn2w==
X-Forwarded-Encrypted: i=1; AJvYcCXj69WynSjNotxmex+0V/BHuL0qQjjkneBy01WBFIufPlWjDE/f8ygzlCtBNrmAK6MUybtRrKmUROtwlLFT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7nxu43Bgt6/Emh8/hGMqD7tlB1aK0+PI6agQSZ24RFFpWLFHe
	wRylgl+cBqU0CuDeXJI7iKPS12gs6TB0SwnE1Ux3wYI+khnVTelCqC8cKvm+iYaVy+A=
X-Gm-Gg: ASbGnct25aTFMEOgi3T5VhKArl4lAs+j51ApbxbzuwCuFqKemIzXLORF/Uqc/MnqHgJ
	nB4gnPXD0+KlBE95uhY3XsZMj9R3SQkk3Pim6sgZOUlfV4IxgW4Je+/a9GM0mGjr/+FcTsk+MmQ
	3c48zqWMlU2XusEl84ePzxoYO1WVyciKJ2oy7+QN0+0kr/uxjs3+gv8OW+A33jp/PFxU5MVPxiT
	y/eZ9CHTXv48vpxJUQhwF7ScqTpdQtU+EMxZnnasc7Q7vJf/aszfgx723jsUkNLkUAEO4/WtWRp
	1TTeURuaImrp8jwWQ798SBf2HC56H3KnBZW/YAtuGsIpiCKwUV5C+MQxsRYZZLbWPUoD32qfZfC
	3UuZ8Q1IO11tYJ3WcCToVo5MB4qyXq0OLSNv3/+SgtX/Q9uGRjfasEOl0JixHYX/DqrRzHcODgW
	OaODi48zeBtBri/Y1v1wjidvVXwkR8NzakHs3RA3VAXm7HVzowntPvOWAxYoezZ+NLv3ZC+w1ct
	HqL
X-Google-Smtp-Source: AGHT+IH5SNC1Q0L2mHeThTW9vZ1gMF479ltqMUwI+wPuwqb75wBckHzhLTSJ5pGTsqvkoXcv+rHsDw==
X-Received: by 2002:a05:6402:2787:b0:641:2a61:7da2 with SMTP id 4fb4d7f45d1cf-64555be1db0mr13109272a12.17.1764061092794;
        Tue, 25 Nov 2025 00:58:12 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:1d9d:2362:4539:c68d? ([2a05:6e02:1041:c10:1d9d:2362:4539:c68d])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6453642d32csm14384517a12.21.2025.11.25.00.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 00:58:12 -0800 (PST)
Message-ID: <7cdb22b1-98db-4b0c-8475-3d35f289fdf8@linaro.org>
Date: Tue, 25 Nov 2025 09:58:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS8300
 compatible
To: Gaurav Kohli <quic_gkohli@quicinc.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, amitk@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
 <20250822042316.1762153-2-quic_gkohli@quicinc.com>
 <2948af7b-799d-4754-9460-c50f3f49ba8f@oss.qualcomm.com>
 <3b4153ef-eab6-4726-91ab-51dd09a2b36b@quicinc.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <3b4153ef-eab6-4726-91ab-51dd09a2b36b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/19/25 17:20, Gaurav Kohli wrote:
> Hi,
> 
> Can this be picked up, as all approvals are present.

patch 1/2 applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

