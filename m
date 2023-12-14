Return-Path: <linux-arm-msm+bounces-4649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C18812700
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 06:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6370F281B3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 05:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8FF6ABF;
	Thu, 14 Dec 2023 05:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jfo+1DlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70A1107
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 21:36:57 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6d9e756cf32so5215090a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 21:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702532217; x=1703137017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rW/CLTesU9Nn+LDbwmg1S+LrWy0eO5LzJlVzZDN0NTk=;
        b=jfo+1DlFqx8LsY6i/hotCzNlUYjU1w3ZXEtYZFQbSP0KXI4qUbKIo09XJC9c10Rbnn
         Xp+iJwynQIu/0QwwzampcgNBc8dMd9Atlmd0rMys28PeomYDn9A5QIVm6CXhw+hGGaF2
         fmfQJ9ILZa9yt+SwM0u2YRM1R3wt9FPsDH2jW0fd3sKaAPD1BYR+djeV4YYi2DegDjm+
         LKZwWWQqKZ1YEJZFOehxysgPGxHsMbIuV3MM7HuqZhDniw0Zuy/4Pyqb9BZ0P2VP0+pc
         tqGbya/ImWZpBQjcU1dbPOEj3Ugjk+3CHtu61HN1ButCzD9+ds0NqrehKojA4S8MKCR1
         gsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702532217; x=1703137017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW/CLTesU9Nn+LDbwmg1S+LrWy0eO5LzJlVzZDN0NTk=;
        b=YJtw8ogVDW4Tyx6TrMEEuxkA54DzziMLRZNNwxr5PWE/A4UwBRB6ADhSwlHhvnvxxG
         vJTjqxUCAPYX7t/4I3k1obByTlo6xT6Ky41xlmBHezJuou9ub6QwBbmGHVIczWOtu3Xh
         boek14k9Z85htp6va3wL6ngJusD6vouejyJI5jD01eqxRyXhDCggi4gtg0ptpGOGyx/0
         slGvpBg2/hp89ln9XM4F4Esil8s7ZyRAiI8hg+Tvc/fAj7xTT+iK9Y0l2eb/pX00ncJ9
         3DWrwi+jNjpYjA3ky2xHBqY1VWBI+BQ0EahN/qaFtJehNOAwxVVxT/8wQ7qfTvdw9ebP
         RtSQ==
X-Gm-Message-State: AOJu0YwuzNgHzV2MBq5ISfFz0QdghiJY9ii8Z9jXXWFgK2Ncfvs0unGX
	chwn8BwVnfUQUh5skIZ7Qle8tg==
X-Google-Smtp-Source: AGHT+IH+QeozbSYX0p0iXQ2G4XEln4ZOmYJ/iRjOrOBzxt3QGNJfpEqpr0j+HhoTkIB2PwvvSueIuQ==
X-Received: by 2002:a05:6358:7e8d:b0:170:6d55:e82e with SMTP id o13-20020a0563587e8d00b001706d55e82emr12607996rwn.2.1702532217124;
        Wed, 13 Dec 2023 21:36:57 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id pv18-20020a17090b3c9200b0028b0424a4bcsm723845pjb.54.2023.12.13.21.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:36:56 -0800 (PST)
Date: Thu, 14 Dec 2023 11:06:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com, rafael@kernel.org,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	lukasz.luba@arm.com, rui.zhang@intel.com, mhiramat@kernel.org,
	daniel.lezcano@linaro.org, amit.kachhap@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] cpufreq: Add a cpufreq pressure feedback for the
 scheduler
Message-ID: <20231214053653.hnyeormwu42un5sc@vireshk-i7>
References: <20231212142730.998913-1-vincent.guittot@linaro.org>
 <20231212142730.998913-2-vincent.guittot@linaro.org>
 <2e8807b68133f4b3a72227122a9d9a05f3fbf9d8.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e8807b68133f4b3a72227122a9d9a05f3fbf9d8.camel@linux.intel.com>
X-Spam-Level: *

On 13-12-23, 16:41, Tim Chen wrote:
> Seems like the pressure value computed from the first CPU applies to all CPU.
> Will this be valid for non-homogeneous CPUs that could have different
> max_freq and max_capacity?

The will be part of different cpufreq policies and so it will work
fine.

-- 
viresh

