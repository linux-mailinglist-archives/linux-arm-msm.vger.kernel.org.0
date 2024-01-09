Return-Path: <linux-arm-msm+bounces-6740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9458284F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 12:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF12E2833B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 11:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E563716B;
	Tue,  9 Jan 2024 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqP4Q7qr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EF37166
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-58e256505f7so1622905eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 03:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704799462; x=1705404262; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S4SDTApmECBjOzEfaLEaZeXHNRvaFB8n31mQspM0kzI=;
        b=pqP4Q7qrtH13LVzQQIbkrFcZWOdvC1Nr4902rbwIxXZ+X2JUqI5XEJVMrke+xCFYRi
         BVDyRjp8sn98Ac20qQyNK1rp5kirGRPn4381TYVG/XtRTuxwfvr3XLVzus/zsqOTk/MM
         pUUFV/VLpK3SZhB3tWJstw8S3GxYZukPyouWgj3LTIPKpAtGPEbhSng+20CRVWbn2Us2
         HBaETC/cxP0n7VMVyfMdy+UN5raCKUzYJJtUGgAbFV7T+p12mAEZPP0VtwHxjyootKgC
         WD6mpH7Mtkp41RpSFGDGh5Er/UkMXLl9My1yPiBUyW4vv7L5ZVyp5dbE2FQ+VRWbPyAP
         D8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799462; x=1705404262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4SDTApmECBjOzEfaLEaZeXHNRvaFB8n31mQspM0kzI=;
        b=ZMZDSccMxqGv8yuFWxGBEcoWqbA+EF423n81++n4qvurlPpUscm0z1K/9oOZmBAMd6
         Ltuyfy1OknyrQr0cPeO+9hgT+WbEu9D4NkC5jFSlyw3WRpcbT6D1BHZSiS3H4BMug8WE
         rpFnRfON2uO0+GA9W5Atlt6s/BntLrmIjd4dZKqGUncSaQJNzD5ipSj6xXMzD9D1CxX6
         PrUGHnDN9s8LbL81ZUF/8I+YcH4sYZqa8aZQtNFA6r8AKyXBvApuu1NVFQ6AqfVm7zhE
         2ufSTlZ1uh8IYR14DdjMdRO2qjsHN1nKcZGuRmRVgo3gRmWKoLX7KmzhxmUMFUwSiqn0
         kp6A==
X-Gm-Message-State: AOJu0Yyhh+y3jgZ04RxEN+ixPTB14WOxWWLo0odH714hsUhmEWNyU9uA
	YJSEP0GKpKqqFAO2TEYE1Qw6qMmVzNJZ/vGxsmIBWetVMIb/fA==
X-Google-Smtp-Source: AGHT+IHCLgsnZU5IHiP8NOccH6UwDy+IAfkge3Z3hsXsWEacGqaX4OClBqm4E9R659NzB4EBGfLT1yi7Zncj2QY5gMo=
X-Received: by 2002:a05:6358:2928:b0:172:d2ac:1e with SMTP id
 y40-20020a056358292800b00172d2ac001emr3729385rwb.5.1704799462214; Tue, 09 Jan
 2024 03:24:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108134843.429769-1-vincent.guittot@linaro.org>
 <20240108134843.429769-2-vincent.guittot@linaro.org> <158a8c60-cb54-43c1-8232-6a0a46cc6d42@arm.com>
In-Reply-To: <158a8c60-cb54-43c1-8232-6a0a46cc6d42@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 9 Jan 2024 12:24:11 +0100
Message-ID: <CAKfTPtBv5=Td2o_fEcq0E7JumyH6XW705kkKR=sPf+_YzB0aPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] cpufreq: Add a cpufreq pressure feedback for the scheduler
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	sudeep.holla@arm.com, rafael@kernel.org, viresh.kumar@linaro.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, lukasz.luba@arm.com, rui.zhang@intel.com, 
	mhiramat@kernel.org, daniel.lezcano@linaro.org, amit.kachhap@gmail.com, 
	corbet@lwn.net, gregkh@linuxfoundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jan 2024 at 17:35, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 08/01/2024 14:48, Vincent Guittot wrote:
> > Provide to the scheduler a feedback about the temporary max available
> > capacity. Unlike arch_update_thermal_pressure, this doesn't need to be
> > filtered as the pressure will happen for dozens ms or more.
>
> Is this then related to the 'medium pace system pressure' you mentioned
> in your OSPM '23 talk?

Sorry I forgot to answer this question. Yes this is the medium pace
system pressure that I mentioned at OSPM'23
>
> >

