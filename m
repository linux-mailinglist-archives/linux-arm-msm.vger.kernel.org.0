Return-Path: <linux-arm-msm+bounces-4651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286F81270C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 06:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EB2F281EEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 05:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0826AD7;
	Thu, 14 Dec 2023 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WrqT+Jqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB830114
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 21:43:10 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b9dbbaa9a9so6443976b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 21:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702532590; x=1703137390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2zJEKJBJdRMRCgJFJEeFLk/7+B+l3ptfOOAh8xQH8eM=;
        b=WrqT+Jqi05FHIN9RA9jJYU6rmRrrb9c2uYCg7CqClmZEKbuxij6nuCEwuCEzZisDA9
         rjIwi3NguPfra4YUpb+J/ermcBAh6DSe2ciLhrVr9TgF/KVVvcNm1O1EEQor5QScpIsR
         bXNbRtAqBLLvN+Ukx2LjpYKFdoXiwDJM58Yjyj4JT0OwYIJ5lYw6WJdSgA9W+2m6oDuM
         t8PPjoXKPl2KDzXeNnI6KXRzA4xpOBjeAWFbTNKR+e1XAtmgfRTTPL6UWe/S8/+8zJQf
         kvUf7HH11AgZgfTZFSMMUtAxuf6pp2YUpzgaZEvtyHBFZUCvchX4NnRgPxYQzda1LGy6
         01dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702532590; x=1703137390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zJEKJBJdRMRCgJFJEeFLk/7+B+l3ptfOOAh8xQH8eM=;
        b=we7fTOGUIjXSDeG2qsezY7mmMCDfLctSdKzW73pWIJpCu1Yvzb1Vf9iv1ZqAGM3+Te
         TtOQoB9xfyeknbGaLpvUtKaC53GIiPVTL26zISqAdekubb2TlXQAgZR0WkuXaH9w/2aF
         +KQRREBAQhep1CBiXiIl8d6NLahenbP/F5DYUXQ8G9GoyWJCbBGxGC/kAf8OWOqOv6Yv
         q+Inqli4d3kiSUvQP9WLa0nE+lpRmvuI+gALAZkBZuuKFaPQ2M5nCKQ7AKCP7n4gQOT+
         9gJWaaJy5HSoyAYXr9x3o8ICUeEcik9MkdTSiGyhdbZrnp0hRf/oN/8MfFNI9uWV1n4M
         /7Tw==
X-Gm-Message-State: AOJu0YzeVviDBd8l3ipAB/G/vF2iohUpXBrZtVQljbPcjGfsj1ZEtpKz
	Vq3Iv5loieRA+UsQR1gNoJnTZQ==
X-Google-Smtp-Source: AGHT+IGYWNbaFlApZ1lFvqRaU1qt9FMGrCRJVZt4T9E+6r/Apb1PpoPAXMGsw6TNwwldN5dhTrbFiw==
X-Received: by 2002:a05:6808:11c8:b0:3ba:2af:c7da with SMTP id p8-20020a05680811c800b003ba02afc7damr9445649oiv.110.1702532590040;
        Wed, 13 Dec 2023 21:43:10 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id x20-20020aa793b4000000b006ce4c7ba448sm10887964pff.25.2023.12.13.21.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:43:09 -0800 (PST)
Date: Thu, 14 Dec 2023 11:13:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
	rafael@kernel.org, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, lukasz.luba@arm.com,
	rui.zhang@intel.com, mhiramat@kernel.org, daniel.lezcano@linaro.org,
	amit.kachhap@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] cpufreq: Add a cpufreq pressure feedback for the
 scheduler
Message-ID: <20231214054307.axl33gagxacidjbn@vireshk-i7>
References: <20231212142730.998913-1-vincent.guittot@linaro.org>
 <20231212142730.998913-2-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212142730.998913-2-vincent.guittot@linaro.org>
X-Spam-Level: *

On 12-12-23, 15:27, Vincent Guittot wrote:
> @@ -2618,6 +2663,9 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
>  	policy->max = __resolve_freq(policy, policy->max, CPUFREQ_RELATION_H);
>  	trace_cpu_frequency_limits(policy);
>  
> +	cpus = policy->related_cpus;
> +	cpufreq_update_pressure(cpus, policy->max);
> +
>  	policy->cached_target_freq = UINT_MAX;

One more question, why are you doing this from cpufreq_set_policy ? If
due to cpufreq cooling or from userspace, we end up limiting the
maximum possible frequency, will this routine always get called ?

-- 
viresh

